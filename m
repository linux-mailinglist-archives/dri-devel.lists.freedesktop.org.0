Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B864B30DC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 23:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 282EA10EBA5;
	Fri, 11 Feb 2022 22:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B83A10EA78;
 Fri, 11 Feb 2022 10:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644575708; x=1676111708;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xZqL227qrEuXaCf1lVm11orizsim7DciTShq3TaFFQU=;
 b=eeyO/68fNLY1JnPX+CHAQlf6NovwcuVtBtW/6SnkVOnpBHHDtUuaTAjF
 h5Gbcv1130O8jLfo+PD/PkBQZKUAa6NH5iqmEVRS1vZRVVQjyCZ8q4n+S
 0OEEiUKTJlTY1KZT2f9FAx/aqpT1pMufjcgGGIXtVfdMaxWcPSL5tfr+/
 jt+WlfdSAbidBjjmTulKdYBOHu6e1mNWD/B9xCLudssRuIKkSarD043rW
 YeZ7i6XRR4bfn6d1iJDP2K1/4+Aquae2dDBdVvoqqEi8Awk3wY7FO4f6S
 C9qhNzlLtXrjpU9WgNv03j1/moLp85YLX1TrH5yYES7aIC+rXAi5ZVy3+ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="249459672"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="249459672"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 02:35:07 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="623185131"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 02:35:03 -0800
Received: by lahna (sSMTP sendmail emulation); Fri, 11 Feb 2022 12:35:00 +0200
Date: Fri, 11 Feb 2022 12:35:00 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v2 4/9] PCI: mark USB4 devices as removable
Message-ID: <YgY71Lw4ZFOtdBVj@lahna>
References: <20220210224329.2793-1-mario.limonciello@amd.com>
 <20220210224329.2793-5-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220210224329.2793-5-mario.limonciello@amd.com>
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

On Thu, Feb 10, 2022 at 04:43:24PM -0600, Mario Limonciello wrote:
> USB4 class devices are also removable like Intel Thunderbolt devices.
> 
> Drivers of downstream devices use this information to declare functional
> differences in how the drivers perform by knowing that they are connected
> to an upstream TBT/USB4 port.

This may not be covering the integrated controllers. For discrete, yes
but if it is the PCIe root ports that start the PCIe topology (over the
PCIe tunnels) this does not work.

For integrated we have the "usb4-host-interface" ACPI property that
tells this for each port:

https://docs.microsoft.com/en-us/windows-hardware/drivers/pci/dsd-for-pcie-root-ports#mapping-native-protocols-pcie-displayport-tunneled-through-usb4-to-usb4-host-routers

and for discrete there is the PCIe DVSEC that can be used (see the USB4
spec archive it includes the "USB4 DVSEC Version 1.0.pdf" that has more
information). I would expect AMD controller (assuming it is discrete)
implements this too.

So I'm proposing that we mark the devices that are below  PCIe ports
(root, downstream) that fall in the above categories as "removable".
This is then not dependent on checking the USB4 controller and how it is
setup in a particular system.
