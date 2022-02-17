Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DFE4B9C15
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 10:33:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E4910EE50;
	Thu, 17 Feb 2022 09:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0CE10EE49;
 Thu, 17 Feb 2022 09:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645090396; x=1676626396;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aK1+Q/gQ7IRjnFowKiBbew/57gZX+Oj3JZ/5IP7bGqU=;
 b=VsVRdtipIrnRGpjERKeNEHk9QKOq6dpUeoJbt1tz0M4L1lhCZ6KMVH5J
 hfY2zpWGTvYyAdd0wFVPVK5MzBlmFQWTcltX7JWhJfTWUamv9mfpRUvvk
 GiOzAAPX4mb3TUbrYFTS2SaKWUl9oZA0iCcwKfWfbuoJJY3iVZjl//YBO
 OaZCOz4H3TILNfhBY+p56wAKaNw0n2GCzTu9WsaztB4CzDp/EqzEHCtQu
 kK/VFUSk5dLaXo+ZphwWpqd6zKoGktl7Cgpb7ngAVgYKB0E52ILub5nw4
 ISHJ/wu0bpUY8es5o1RRP/Xcm8DR+458ZgltGGqMsH14ylNkVovnL2fkV g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="234365368"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="234365368"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 01:33:15 -0800
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="704711274"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 01:33:11 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 17 Feb 2022 11:33:09 +0200
Date: Thu, 17 Feb 2022 11:33:09 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Limonciello, Mario" <mario.limonciello@amd.com>
Subject: Re: [PATCH v4 00/10] Overhaul `is_thunderbolt`
Message-ID: <Yg4WVXw84aLK5Knp@lahna>
References: <20220215000200.242799-1-mario.limonciello@amd.com>
 <20220215072911.GA13892@wunner.de>
 <3078823e-4ab4-27b6-b1c7-c6552fbfdb2e@amd.com>
 <Yg0LaujhftM0b8N/@lahna>
 <CADnq5_Ov3T9WH29MjgC2byqgTGkn-ux7iUaK3z5s2v4At_b3Ow@mail.gmail.com>
 <8da992ac-c241-1fe2-41a9-579c845608db@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8da992ac-c241-1fe2-41a9-579c845608db@amd.com>
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
Cc: Andreas Noever <andreas.noever@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mario,

On Wed, Feb 16, 2022 at 10:50:31AM -0600, Limonciello, Mario wrote:
> On 2/16/2022 08:44, Alex Deucher wrote:
> > On Wed, Feb 16, 2022 at 9:34 AM Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > > 
> > > Hi all,
> > > 
> > > On Tue, Feb 15, 2022 at 01:07:00PM -0600, Limonciello, Mario wrote:
> > > > On 2/15/2022 01:29, Lukas Wunner wrote:
> > > > > On Mon, Feb 14, 2022 at 06:01:50PM -0600, Mario Limonciello wrote:
> > > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  2 +-
> > > > > >    drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c  |  2 +-
> > > > > >    drivers/gpu/drm/nouveau/nouveau_vga.c   |  4 +-
> > > > > >    drivers/gpu/drm/radeon/radeon_device.c  |  4 +-
> > > > > >    drivers/gpu/drm/radeon/radeon_kms.c     |  2 +-
> > > > > >    drivers/pci/hotplug/pciehp_hpc.c        |  6 +-
> > > > > >    drivers/pci/pci-acpi.c                  | 15 ++++-
> > > > > >    drivers/pci/pci.c                       | 17 +++--
> > > > > >    drivers/pci/probe.c                     | 52 ++++++++++++++-
> > > > > >    drivers/pci/quirks.c                    | 84 +++++++++++++++++++++++++
> > > > > >    drivers/platform/x86/apple-gmux.c       |  2 +-
> > > > > >    drivers/thunderbolt/nhi.h               |  2 -
> > > > > >    include/linux/pci.h                     | 25 +-------
> > > > > >    include/linux/pci_ids.h                 |  3 +
> > > > > >    14 files changed, 173 insertions(+), 47 deletions(-)
> > > > > 
> > > > > That's an awful lot of additional LoC for what is primarily
> > > > > a refactoring job with the intent to simplify things.
> > > > 
> > > > You may recall the first version of this series was just for adding
> > > > USB4 matches to the existing code paths, and that's when it was noted
> > > > that is_thunderbolt is a bit overloaded.
> > > > 
> > > > > 
> > > > > Honestly this looks like an attempt to fix something that
> > > > > isn't broken.  Specifically, the is_thunderbolt bit apparently
> > > > > can't be removed without adding new bits to struct pci_dev.
> > > > > Not sure if that can be called progress. >
> > > > > Thanks,
> > > > > 
> > > > > Lukas
> > > > 
> > > > Within this series there are two new material patches; setting up root ports
> > > > for both integrated and discrete USB4 controllers to behave well with all
> > > > the existing drivers that rely upon a hint of how they're connected to
> > > > configure devices differently.
> > > > 
> > > > If y'all collectively prefer this direction to not refactor is_thunderbolt
> > > > and push into quirks, a simpler version of this series would be to leave all
> > > > the quirks in place, just drop dev->is_thunderbolt, and set
> > > > dev->external_facing on all 3 cases:
> > > > 
> > > > * Intel TBT controller
> > > > * USB4 integrated PCIe tunneling root port/XHCI tunneling root port
> > > > * USB4 disctete PCIe tunneling root port/XHCI tunneling root port
> > > > 
> > > > All the other drivers and symbols can stay the same then.
> > > 
> > > If I understand correctly the original intention of this patch series is
> > > to be able to differentiate whether the device is "permanently"
> > > connected to the motherboard, or it is connected over some hot-pluggable
> > > bus (PCIe, USB, USB4 for example but I'm sure there are other buses that
> > > fit into this picture too). Specifically this is needed for discrete
> > > GPUs because of power management differences or so (please correct me if
> > > I'm mistaken).
> 
> Correct.  It might be possible to drop the patch for the integrated case
> (patch 3) because I do think that by Microsoft having the _DSD for
> "ExternalFacingPort" it's very likely that most implementations will have
> used it for the appropriate PCIe root ports.  If something shows up in the
> wild that this isn't the case it could be revisited.  If it's found
> pre-production presumably the OEM can still fix it and if it's post
> production and there are problems we can dust it off then.

Yeah, that's most likely the case.

> The discrete USB4 controller I would be more concerned that this isn't
> populated, and that (patch 4) should be more important to let the driver
> core set it removable.

Agreed.

[I actually only now noticed that the PCI core actually already marks
 devices connected to external facing ports as "removable" in
 pci_set_removable().]

> > > If we set the is_thunderbolt debate aside and concentrate on that issue,
> > > I think the way to do this is to check whether the root port the GPU is
> > > connected to has an ACPI power resource (returned from _PR3() method).
> > > IF it is present then most likely the platform has provided all the
> > > necessary wiring to move the GPU into D3cold (and the BIOS knows this).
> > > If it is not present then the device cannot even go into D3cold as there
> > > is not means to power of the device in PCIe spec.
> > > 
> > > Perhaps we can simply use pci_pr3_present() here as nouveau is already
> > > doing? Granted it is not too elegant solution either but better than
> > > using is_thunderbolt IMHO. Since this seem to be common for many GPUs,
> > > perhaps we can have a helper in DRM core that handles this.
> > 
> > The tricky part is that there were AMD and NVIDIA specific proprietary
> > _PR3-like ACPI methods (plus whatever Apple did) prior to GPU power
> > control standardizing on _PR3.  Currently those methods are handled in
> > the drivers directly, sort of tangled up with vga_switcheroo.  I think
> > ideally that logic would move to the ACPI core and be handled the same
> > way as _PR3, but I'm not sure how well that would work because of the
> > various bios date checks around _PR3 and the lack of general _PR3
> > support in those older platforms.  So I think we still need some sort
> > of "is this soldered in" check.
> 
> Considering that limitation if `dev->external_facing` already exists in PCI
> core may as well use it for this instead of `is_thunderbolt`.

Indeed.

> > Alex
> > 
> > 
> > > 
> > > Then going back to is_thunderbolt debate :) I really don't think the
> > > drivers should care whether they are connected over a tunnel or not.
> > > They should work regardless of the underlying transport of the native
> > > protocol. They should also be prepared for the fact that the hardware
> > > can vanish under them at any point (e.g user unplugs the device). For
> > > this reason I don't really like to see is_thunderbolt to be used more
> > > and prefer to get rid if it completely if possible at all. If there is
> > > still need to differentiate whether the device can be hot-removed or
> > > not, I think "removable" in the driver core is the way to go. That is
> > > not dependent on any single transport.
> 
> Hopefully that is what the patch series does right now as of v4. As I

It does yes. I think the detection of internal and discrete tunneled
ports can be dropped from this series for now to make this leaner. We
can add those later when needed.
