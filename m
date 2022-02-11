Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 706D64B30DE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 23:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582E610EBA6;
	Fri, 11 Feb 2022 22:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415F010EA64;
 Fri, 11 Feb 2022 10:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644575250; x=1676111250;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RCuCxhjV4esmnxdab6oU2vPqQ9Idnpu43es31WIDuUM=;
 b=UyPdhbHmFGfbZf1OgdeHBGCnppPDm7DXtkeUR0EzWHH8mj8/AAfQoFv/
 UBRdDBAf3NCHdjL+ciHrAq+ACbFaNX2QUCf4+CIYgVAN+IiIaZM1QGWhp
 ngRmL3IH6H9zMNJyNIab45Mpt9aqxgsaPtMnZS+s2f0q7SyN581jdgzJD
 LoUY88Eaeg38GvQ3yA+OKu4sFPzcaxOMvHsLu1JHZ9Sx3D1fEJz/hqycB
 l+uZROKZo6ogr2QOVcHAAd5dWofBlyX2t/cmlZu3+PaI3xrlZSUAZOVbf
 /ZpyZLDT5pSvtqBrDLn8rg7gykdlLPQY2LM3e7RaDyCaJFQs74/xteNHe g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="274265058"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="274265058"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 02:27:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="542034263"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 02:27:08 -0800
Received: by lahna (sSMTP sendmail emulation); Fri, 11 Feb 2022 12:23:51 +0200
Date: Fri, 11 Feb 2022 12:23:51 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v2 3/9] PCI: drop `is_thunderbolt` attribute
Message-ID: <YgY5N1eVWmi0Xyuw@lahna>
References: <20220210224329.2793-1-mario.limonciello@amd.com>
 <20220210224329.2793-4-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220210224329.2793-4-mario.limonciello@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Fri, 11 Feb 2022 22:40:02 +0000
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
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Andreas Noever <andreas.noever@gmail.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mario,

On Thu, Feb 10, 2022 at 04:43:23PM -0600, Mario Limonciello wrote:
> The `is_thunderbolt` attribute is currently a dumping ground for a
> variety of things.
> 
> Instead use the driver core removable attribute to indicate the
> detail a device is attached to a thunderbolt or USB4 chain.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/pci/pci.c                 |  2 +-
>  drivers/pci/probe.c               | 20 +++++++-------------
>  drivers/platform/x86/apple-gmux.c |  2 +-
>  include/linux/pci.h               |  5 ++---
>  4 files changed, 11 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 9ecce435fb3f..1264984d5e6d 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -2955,7 +2955,7 @@ bool pci_bridge_d3_possible(struct pci_dev *bridge)
>  			return true;
>  
>  		/* Even the oldest 2010 Thunderbolt controller supports D3. */
> -		if (bridge->is_thunderbolt)
> +		if (dev_is_removable(&bridge->dev))

For this, I'm not entirely sure this is what we want. The purpose of
this check is to enable port power management of Apple systems with
Intel Thunderbolt controller and therefore checking for "removable" here
is kind of misleading IMHO.

I wonder if we could instead remove the check completely here and rely
on the below:

	if (platform_pci_bridge_d3(bridge))
		return true;

and that would then look like:

static inline bool platform_pci_bridge_d3(struct pci_dev *dev)
{
	if (pci_use_mid_pm())
		return false;

	if (acpi_pci_bridge_d3(dev))
		return true;

	if (device_property_read_bool(&dev->dev, "HotPlugSupportInD3"))
		return true;

	return false;
}

and then make a quirk in quirks.c that adds the software node property
for the Apple systems? Or something along those lines.

@Lukas, what do you think?
