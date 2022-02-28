Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDBB4C7D1C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 23:13:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D689710E92B;
	Mon, 28 Feb 2022 22:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0889510E593;
 Mon, 28 Feb 2022 22:13:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 79D416119C;
 Mon, 28 Feb 2022 22:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC48C340F1;
 Mon, 28 Feb 2022 22:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646086425;
 bh=cnDWJ0mUKsMIK/kUZBxrtwaDai/t/1pEAH68lPV8FNI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=g3J98SrFRq1BbJxPN1kJdH/0NbFXhkBE307szRWU7LmrbHX2s2cJ5zQ3v4x9DqVul
 W+UT8Tz7QZYUmLyHrBFi8AlchvPhAIsNb5N/t/1Vum4HNk2hB+M5oV3EPkQCL/YldK
 Yl1lpm9CV0w78mMuBs7wpXWCPyDYS8tFO9ylRSiAoaVrZIBgYz/Fvgxz8o2bG2gMGk
 SFSk5Az0KRyVF0mxmQZLvhhhRajROlVvK/8fDFVWhMxRoD8TO07Q8LkJUySVWRD90T
 lrt8hJFlJ3TW01ylg3BJslwJE+g9BnROM4YsHrUpbHVmWmLR9oT1VQBPyACxUK62w6
 +ISVACI6FIWZA==
Date: Mon, 28 Feb 2022 16:13:44 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>
Subject: Re: [PATCH v5 3/7] PCI: Drop the `is_thunderbolt` attribute from PCI
 core
Message-ID: <20220228221344.GA529289@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL1PR12MB5157004F38E3FEFF046D9BE4E2019@BL1PR12MB5157.namprd12.prod.outlook.com>
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
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Andreas Noever <andreas.noever@gmail.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 28, 2022 at 03:33:13PM +0000, Limonciello, Mario wrote:
> [AMD Official Use Only]
> 
> > 
> > On Fri, Feb 25, 2022 at 11:42:24AM -0600, Bjorn Helgaas wrote:
> > > That would just leave the "PCI_VSEC_ID_INTEL_TBT implies external-
> > facing"
> > > assumption above.  Not having a Thunderbolt spec, I have no idea how
> > > you deal with that.
> > 
> > You can download the spec here:
> > 
> > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fww
> > w.usb.org%2Fsites%2Fdefault%2Ffiles%2FUSB4%2520Specification%2520202
> > 11116.zip&amp;data=04%7C01%7Cmario.limonciello%40amd.com%7Ca26e64
> > 7a4acf4e7681d308d9faa358fd%7C3dd8961fe4884e608e11a82d994e183d%7C0
> > %7C0%7C637816402472428689%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC
> > 4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&
> > amp;sdata=HSDqx%2BHzSnczTZxaBij8sgqvJSS8ajtjCzZd2CPSbR4%3D&amp;re
> > served=0
> > 
> > Inside the archive there is also the DVSEC spec with name "USB4 DVSEC
> > Version 1.0.pdf".
> 
> The spec has Host_Router_indication (bits 18-19) as meaning external facing.
> I'll respin the patch 3 for using that.

Thanks, please include the spec citation when you do.  And probably
the URL, because it's not at all obvious how the casual reader would
get from "is_thunderbolt" to a recent add-on to the USB4 spec.

Bjorn
