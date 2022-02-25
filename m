Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 337764C3AE4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 02:27:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4D210E33A;
	Fri, 25 Feb 2022 01:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C0E10E14A;
 Fri, 25 Feb 2022 01:27:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0C66A60EDA;
 Fri, 25 Feb 2022 01:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424C8C340E9;
 Fri, 25 Feb 2022 01:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645752422;
 bh=85HLwqlMewbSTrfjrAGqrkfIdSjqXwp0JPp7/aV8oao=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=CWeHyaMrKSdImi6hOg4U9noz6tqzKHIZUjH13gF9g3nF6NbTkZgECjc47NFg6M1Re
 TQaJK3/EtRRbNXIBNiv0ItbHzqW516lHT581oit2EAjSdgX0YLN9bnUnKaz1GZry7d
 EE4wsswMdhEE2ZdOqOIE7L1GRaycVqFECVFq76nAPCI809gYnzZLTeUpfJwmdgyDwu
 gXDpO7Bydtp+mXExg8f7vlIkWi5YYsOfrpWPOr7PK+Qg4dqRvTFwCPKZe3df1XblYT
 oF0Gg1ybQvZIO2BGvcpeh5efMlC16fMdYbfHBWM49HVaE9KiOzweoX4xFgmWySDmQ2
 Po/3tKeCF+sJg==
Date: Thu, 24 Feb 2022 19:27:00 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v5 3/7] PCI: Drop the `is_thunderbolt` attribute from PCI
 core
Message-ID: <20220225012700.GA319379@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225012346.GA317859@bhelgaas>
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
Cc: Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Andreas Noever <andreas.noever@gmail.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Alexander.Deucher@amd.com, Mika Westerberg <mika.westerberg@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 24, 2022 at 07:23:49PM -0600, Bjorn Helgaas wrote:
> On Thu, Feb 24, 2022 at 03:51:12PM -0600, Mario Limonciello wrote:
> > The `is_thunderbolt` attribute originally had a well defined list of
> > quirks that it existed for, but it has been overloaded with more
> > meaning.
> > 
> > Instead use the driver core removable attribute to indicate the
> > detail a device is attached to a thunderbolt or USB4 chain.
> ...

> If these things are not specifically related to Thunderbolt, I'd
> prefer to get rid of pci_is_thunderbolt_attached() and see if we can
> help the GPU folks figure out what they really need.

Ah.  Guess I should read the whole series before commenting :)  I see
that you *did* remove pci_is_thunderbolt_attached() in the last patch.
I'll look more at the rest tomorrow.

Bjorn
