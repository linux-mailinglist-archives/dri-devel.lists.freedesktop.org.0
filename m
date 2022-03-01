Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8194C84A3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 08:04:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503F510E375;
	Tue,  1 Mar 2022 07:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13C510E35C;
 Tue,  1 Mar 2022 07:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646118294; x=1677654294;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cNy2VhZ7uIfEAZ6OMEmFA5tBH3wtQ7ZLN6kAGMbwVEs=;
 b=LQEyt97DG1JFEHWI6GollxB9DniuQnqCIhoSU3dRPAlWXF87EVioUslm
 7CbDsGagbDGQd4qrQX8LvVZwIp+U+zN5VvxWYQpZvsMnts/OxOzNuBW3w
 ExxiDki+0rCaU7ZsPm4pw87t3UHMFD6/oAAZRIyk8NZTJj+5EoocLKTC7
 SVGprwLrfjitMMMRp7+Ufa1FDIk7ZIcAwHZY2MVegYa4wg2cveFUuV7Cj
 JZiJnbfftIghe1oQh7Dwbuf9rKZykEpG4DO2JVMIwSmOTbk5f5xWpV2V9
 RggKhL0CTe82BLLykCgihtozagzBmCODjSu0xGEsNce4O9dNXRICuyzj4 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="240485818"
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; d="scan'208";a="240485818"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 23:04:54 -0800
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; d="scan'208";a="510405909"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 23:04:49 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 01 Mar 2022 09:04:47 +0200
Date: Tue, 1 Mar 2022 09:04:47 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>
Subject: Re: [PATCH v5 3/7] PCI: Drop the `is_thunderbolt` attribute from PCI
 core
Message-ID: <Yh3Fj8kA5mkbp8Hp@lahna>
References: <BL1PR12MB5157004F38E3FEFF046D9BE4E2019@BL1PR12MB5157.namprd12.prod.outlook.com>
 <20220228221344.GA529289@bhelgaas>
 <20220228223246.GA11428@wunner.de>
 <BL1PR12MB5157D5E18AB8206E2085C952E2019@BL1PR12MB5157.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL1PR12MB5157D5E18AB8206E2085C952E2019@BL1PR12MB5157.namprd12.prod.outlook.com>
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
Cc: Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Andreas Noever <andreas.noever@gmail.com>, Bjorn Helgaas <helgaas@kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Feb 28, 2022 at 10:36:59PM +0000, Limonciello, Mario wrote:
> [AMD Official Use Only]
> 
> > -----Original Message-----
> > From: Lukas Wunner <lukas@wunner.de>
> > Sent: Monday, February 28, 2022 16:33
> > To: Bjorn Helgaas <helgaas@kernel.org>
> > Cc: Limonciello, Mario <Mario.Limonciello@amd.com>; Mika Westerberg
> > <mika.westerberg@linux.intel.com>; Michael Jamet
> > <michael.jamet@intel.com>; open list:PCI SUBSYSTEM <linux-
> > pci@vger.kernel.org>; open list:THUNDERBOLT DRIVER <linux-
> > usb@vger.kernel.org>; Yehezkel Bernat <YehezkelShB@gmail.com>; open
> > list:DRM DRIVERS <dri-devel@lists.freedesktop.org>; open list:X86
> > PLATFORM DRIVERS <platform-driver-x86@vger.kernel.org>; Andreas
> > Noever <andreas.noever@gmail.com>; open list:RADEON and AMDGPU
> > DRM DRIVERS <amd-gfx@lists.freedesktop.org>; open list:DRM DRIVER FOR
> > NVIDIA GEFORCE/QUADRO GPUS <nouveau@lists.freedesktop.org>; Bjorn
> > Helgaas <bhelgaas@google.com>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>
> > Subject: Re: [PATCH v5 3/7] PCI: Drop the `is_thunderbolt` attribute from PCI
> > core
> > 
> > On Mon, Feb 28, 2022 at 04:13:44PM -0600, Bjorn Helgaas wrote:
> > > On Mon, Feb 28, 2022 at 03:33:13PM +0000, Limonciello, Mario wrote:
> > > > > On Fri, Feb 25, 2022 at 11:42:24AM -0600, Bjorn Helgaas wrote:
> > > > > > That would just leave the "PCI_VSEC_ID_INTEL_TBT implies external-
> > > > > facing"
> > > > > > assumption above.  Not having a Thunderbolt spec, I have no idea
> > how
> > > > > > you deal with that.
> > > > >
> > > > > You can download the spec here:
> > [...]
> > > > > Inside the archive there is also the DVSEC spec with name "USB4 DVSEC
> > > > > Version 1.0.pdf".
> > > >
> > > > The spec has Host_Router_indication (bits 18-19) as meaning external
> > facing.
> > > > I'll respin the patch 3 for using that.
> > >
> > > Thanks, please include the spec citation when you do.  And probably
> > > the URL, because it's not at all obvious how the casual reader would
> > > get from "is_thunderbolt" to a recent add-on to the USB4 spec.
> > 
> > PCI_VSEC_ID_INTEL_TBT is not mentioned at all in the USB4 spec,
> > hence there's no connection between "is_thunderbolt" and the USB4 spec.
> > 
> > It's a proprietary VSEC used by Intel and the only way to recognize
> > pre-USB4 Thunderbolt devices that I know of.  Its ID is also
> > different from the DVSEC IDs given in the above-mentioned spec.
> > 
> > Thanks,
> 
> The USB4 DVSEC spec makes comments about DVSEC_ID of 0x8086 and also
> DVSEC VENDOR_ID of 0x8086.  Is that not also present on the Intel TBT3 controllers?
> 
> My interpretation of this (and Mika's comment) was that rather than
> looking at the Intel VSEC we should look at the USB4 DVSEC to detect
> the Intel TBT3 controllers.

For pre-USB4 controllers (TBT 1-3) we need to use the existing method
(or a quirk based on device ID) as they don't have the USB4 DVSEC.
