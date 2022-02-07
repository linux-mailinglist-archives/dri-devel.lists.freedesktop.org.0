Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 405094AC806
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 18:59:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E6310E294;
	Mon,  7 Feb 2022 17:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4CE810E294
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 17:59:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 552CEB80D43;
 Mon,  7 Feb 2022 17:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D10E6C004E1;
 Mon,  7 Feb 2022 17:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644256751;
 bh=5Fqi/UtD0xGTUGfiJ1s3twBfT8A8QZEg585SBGwHpXQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=aWtmiju5E1LDC4Y1jOlEKsy8UW7LbEs0eK6/TA8aLgreC6XgMGc8vlYyvKI1Np0Bh
 HcP+TAAI73eKJJrRhLE3bSls5ZS6EuOuJFbcSET+o1cxA2UgMfUoYIFrFzQJs7KV1M
 vpjcbj9YYwXCyUxJ4E4Q7ygeeDWs0gnDd/S4nj55O3oUynt2fIp7vFaX424prYPvDO
 D1LuiKkWgLjZ5ugcpfn4vKRtsLqj8NbAtHMtOS1SKEyoKV+rcYC/SMn4jv6KDoZS05
 IuXdyUSqX8PdAHbji2IdGE85Q9fV6twDrr7ZieGcEYSJnEX1SXiDF9zPkNwX/Qo70t
 dNWNS8UD7MObA==
Date: Mon, 7 Feb 2022 11:59:09 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v8 00/10] vgaarb: Rework default VGA device selection
Message-ID: <20220207175909.GA406079@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0a06a30-f479-df9f-980c-b789f0f26ce9@linux.intel.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Xuefeng Li <lixuefeng@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 01, 2022 at 04:46:33PM +0100, Maarten Lankhorst wrote:
> Op 31-01-2022 om 23:23 schreef Bjorn Helgaas:
> > [+to Maarten, Maxime, Thomas; beginning of thread:
> > https://lore.kernel.org/r/20220106000658.243509-1-helgaas@kernel.org]
> >
> > On Wed, Jan 05, 2022 at 06:06:48PM -0600, Bjorn Helgaas wrote:
> >> From: Bjorn Helgaas <bhelgaas@google.com>
> >>
> >> Current default VGA device selection fails in some cases because part of it
> >> is done in the vga_arb_device_init() subsys_initcall, and some arches
> >> enumerate PCI devices in pcibios_init(), which runs *after* that.
> > Where are we at with this series?  Is there anything I can do to move
> > it forward?
> 
> I'm afraid that I don't understand the vga arbiter or the vga code
> well enough to review.
> 
> Could you perhaps find someone who could review?
> 
> I see Chen wrote some patches and tested, so perhaps they could?

Huacai, any chance you could review this?  I'm worried that this
series isn't going to go anywhere unless we can find somebody to
review it.

Bjorn
