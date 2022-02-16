Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B194B8B87
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 15:34:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE8C10E5C5;
	Wed, 16 Feb 2022 14:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D3410E420;
 Wed, 16 Feb 2022 14:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645022066; x=1676558066;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=G018K8FiF9upSRbYAuCNl6HeGYUgqE0QkKHVNTmKDu8=;
 b=euNePfE+FLWOGbWjvxr08VmP6RzG7ocRSX+38Ve6woWqd7TYtMOF37Yp
 UFPGPmbII+WrKV9omP2nedQNeQVD4wOZRLiPBtue/1dj3cDOoSX9eRlVL
 XvkgBxVsiPyPdhxE+4hVmCpz1X0i8+nm4aL/lYszTsRHFM7j++15eX+zz
 U6UzKMeeEOQtdO/+YaVKFfektdonwH3Uyplfz9ZHCK/rCxAJYRDoyjKmD
 23yJE06m5N2LyyD+vDj7FQ/4tQnLQAyo6+7Ibx1cS7qb1zBDsYDhSGZnc
 G8eZx+zkKgw6st26duA2cFLp5H3MtNMIsVUX0ve67++AJ3sMjIOrPUebu g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="250813941"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="250813941"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 06:34:25 -0800
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="544961642"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 06:34:21 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 16 Feb 2022 16:34:18 +0200
Date: Wed, 16 Feb 2022 16:34:18 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Limonciello, Mario" <mario.limonciello@amd.com>
Subject: Re: [PATCH v4 00/10] Overhaul `is_thunderbolt`
Message-ID: <Yg0LaujhftM0b8N/@lahna>
References: <20220215000200.242799-1-mario.limonciello@amd.com>
 <20220215072911.GA13892@wunner.de>
 <3078823e-4ab4-27b6-b1c7-c6552fbfdb2e@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3078823e-4ab4-27b6-b1c7-c6552fbfdb2e@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andreas Noever <andreas.noever@gmail.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

On Tue, Feb 15, 2022 at 01:07:00PM -0600, Limonciello, Mario wrote:
> On 2/15/2022 01:29, Lukas Wunner wrote:
> > On Mon, Feb 14, 2022 at 06:01:50PM -0600, Mario Limonciello wrote:
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  2 +-
> > >   drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c  |  2 +-
> > >   drivers/gpu/drm/nouveau/nouveau_vga.c   |  4 +-
> > >   drivers/gpu/drm/radeon/radeon_device.c  |  4 +-
> > >   drivers/gpu/drm/radeon/radeon_kms.c     |  2 +-
> > >   drivers/pci/hotplug/pciehp_hpc.c        |  6 +-
> > >   drivers/pci/pci-acpi.c                  | 15 ++++-
> > >   drivers/pci/pci.c                       | 17 +++--
> > >   drivers/pci/probe.c                     | 52 ++++++++++++++-
> > >   drivers/pci/quirks.c                    | 84 +++++++++++++++++++++++++
> > >   drivers/platform/x86/apple-gmux.c       |  2 +-
> > >   drivers/thunderbolt/nhi.h               |  2 -
> > >   include/linux/pci.h                     | 25 +-------
> > >   include/linux/pci_ids.h                 |  3 +
> > >   14 files changed, 173 insertions(+), 47 deletions(-)
> > 
> > That's an awful lot of additional LoC for what is primarily
> > a refactoring job with the intent to simplify things.
> 
> You may recall the first version of this series was just for adding
> USB4 matches to the existing code paths, and that's when it was noted
> that is_thunderbolt is a bit overloaded.
> 
> > 
> > Honestly this looks like an attempt to fix something that
> > isn't broken.  Specifically, the is_thunderbolt bit apparently
> > can't be removed without adding new bits to struct pci_dev.
> > Not sure if that can be called progress. >
> > Thanks,
> > 
> > Lukas
> 
> Within this series there are two new material patches; setting up root ports
> for both integrated and discrete USB4 controllers to behave well with all
> the existing drivers that rely upon a hint of how they're connected to
> configure devices differently.
> 
> If y'all collectively prefer this direction to not refactor is_thunderbolt
> and push into quirks, a simpler version of this series would be to leave all
> the quirks in place, just drop dev->is_thunderbolt, and set
> dev->external_facing on all 3 cases:
> 
> * Intel TBT controller
> * USB4 integrated PCIe tunneling root port/XHCI tunneling root port
> * USB4 disctete PCIe tunneling root port/XHCI tunneling root port
> 
> All the other drivers and symbols can stay the same then.

If I understand correctly the original intention of this patch series is
to be able to differentiate whether the device is "permanently"
connected to the motherboard, or it is connected over some hot-pluggable
bus (PCIe, USB, USB4 for example but I'm sure there are other buses that
fit into this picture too). Specifically this is needed for discrete
GPUs because of power management differences or so (please correct me if
I'm mistaken).

If we set the is_thunderbolt debate aside and concentrate on that issue,
I think the way to do this is to check whether the root port the GPU is
connected to has an ACPI power resource (returned from _PR3() method).
IF it is present then most likely the platform has provided all the
necessary wiring to move the GPU into D3cold (and the BIOS knows this).
If it is not present then the device cannot even go into D3cold as there
is not means to power of the device in PCIe spec.

Perhaps we can simply use pci_pr3_present() here as nouveau is already
doing? Granted it is not too elegant solution either but better than
using is_thunderbolt IMHO. Since this seem to be common for many GPUs,
perhaps we can have a helper in DRM core that handles this.

Then going back to is_thunderbolt debate :) I really don't think the
drivers should care whether they are connected over a tunnel or not.
They should work regardless of the underlying transport of the native
protocol. They should also be prepared for the fact that the hardware
can vanish under them at any point (e.g user unplugs the device). For
this reason I don't really like to see is_thunderbolt to be used more
and prefer to get rid if it completely if possible at all. If there is
still need to differentiate whether the device can be hot-removed or
not, I think "removable" in the driver core is the way to go. That is
not dependent on any single transport.
