Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA50759D15
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 20:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C2010E115;
	Wed, 19 Jul 2023 18:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C041210E115
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 18:07:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA9DB616AF;
 Wed, 19 Jul 2023 18:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06637C433C8;
 Wed, 19 Jul 2023 18:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689790075;
 bh=BtjH8sWL9n5DjUOXCUilsWd4aWNHoklU3FHjEqQvSvk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=tkOnohpjRtu+UdHtmqtKiGVSHWhQ/6PoSbOmhgUKeEbBDFNptjICuGJdx9vEto4X0
 IX/WA9/RYHSDgdsADsoQhDCZKILX15TTGsLblzIcT6bGaISYR3SxAFOjeKJERDL65c
 1cBm8yvXxaK9HektlpIH1Bl5Cbn9/+Y7TFfexxpJRqLuribxUAn5dTz2fFh++GnyEB
 744tC+3nOcolkPiES+hjfls/7bYxbZ+9YZ/VB0DOQRKbQ4ESCNlnuE6fXliSOUz/C1
 57B0N67q9RZ2PtWj6gyYgvJAIQBA7zEZEcrUfSW7WoRb6ZGgK5Pq+PPOjbe1RjV5xc
 08wH/snPuWAmA==
Date: Wed, 19 Jul 2023 13:07:52 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH 2/4] PCI/VGA: Deal only with PCI VGA class devices
Message-ID: <20230719180752.GA509850@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718231400.GA496927@bhelgaas>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 18, 2023 at 06:14:00PM -0500, Bjorn Helgaas wrote:
> On Fri, Jun 30, 2023 at 06:17:29PM +0800, Sui Jingfeng wrote:
> > From: Sui Jingfeng <suijingfeng@loongson.cn>
> > 
> > VGAARB should only care about PCI VGA class devices (pdev->class == 0x0300)
> > since only those devices might have VGA routed to them.
> 
> This is not actually a question of whether VGA addresses (mem
> 0xa0000-0xbffff and io 0x3b0-0x3bb, 0x3c0-0x3df) might be *routed* to
> the device because that routing is controlled by the bridge VGA Enable
> bit, not by a device Class Code.
> 
> I think the important question here is what devices will *respond* to
> those VGA addresses.  The VGA arbiter works by managing bridge VGA
> Enable bits, so if we know a device doesn't respond to the VGA
> addresses, there's no point in adding a vga_device for it.

Sorry, I see that I replied to an old version of this patch.  I'll go
look at this series instead:

https://lore.kernel.org/r/20230711134354.755966-1-sui.jingfeng@linux.dev

Bjorn
