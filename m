Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFA44B41E7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 07:23:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44CF10E322;
	Mon, 14 Feb 2022 06:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFAC110E322;
 Mon, 14 Feb 2022 06:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644819784; x=1676355784;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ogk0u9WIs4rRYT5evD6jDJdiJEu7Wt/pIAhA9485lVQ=;
 b=ethgj9uOKOmh/Vur01mgsf50XYwrm/5NhDSoNQdEzfoOJdRS6YhSllQq
 dftO26JQn2VppFKqD2PXoC/XeAZMAymCoUgobe4STqZGxs8TN30I/hFgi
 rq8AujnNN8OCpwIvxXYwe7SqofXDfz0U3Kf90TnLIo9OAFUKCPn0f+2Mn
 Pzk1em5WLCeIk8Wo6Wj2IGy6hnRVaiKqScP+7d2AbCFhdMcd6vZKOiv6k
 qVDFr0WujmarjI0uerfBuF5jwBau4bi0xWZTwhjllcsaHAZMEYKn3RsHh
 6emCDolp3UwFlRd2xJ7maOKqVbbNrm4dnbL1n6YkJR9O3MGO0Q/zHjM9F A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="230662342"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="230662342"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2022 22:23:03 -0800
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="527922292"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2022 22:22:59 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 14 Feb 2022 08:22:56 +0200
Date: Mon, 14 Feb 2022 08:22:56 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v2 3/9] PCI: drop `is_thunderbolt` attribute
Message-ID: <Ygn1QHF3aGsHpkS9@lahna>
References: <20220210224329.2793-1-mario.limonciello@amd.com>
 <20220210224329.2793-4-mario.limonciello@amd.com>
 <YgY5N1eVWmi0Xyuw@lahna> <20220213083928.GB23572@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220213083928.GB23572@wunner.de>
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
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Feb 13, 2022 at 09:39:28AM +0100, Lukas Wunner wrote:
> On Fri, Feb 11, 2022 at 12:23:51PM +0200, Mika Westerberg wrote:
> > On Thu, Feb 10, 2022 at 04:43:23PM -0600, Mario Limonciello wrote:
> > > @@ -2955,7 +2955,7 @@ bool pci_bridge_d3_possible(struct pci_dev *bridge)
> > >  			return true;
> > >  
> > >  		/* Even the oldest 2010 Thunderbolt controller supports D3. */
> > > -		if (bridge->is_thunderbolt)
> > > +		if (dev_is_removable(&bridge->dev))
> > 
> > For this, I'm not entirely sure this is what we want. The purpose of
> > this check is to enable port power management of Apple systems with
> > Intel Thunderbolt controller and therefore checking for "removable" here
> > is kind of misleading IMHO.
> [...]
> > and then make a quirk in quirks.c that adds the software node property
> > for the Apple systems? Or something along those lines.
> 
> Honestly, that feels wrong to me.
> 
> There are non-Apple products with Thunderbolt controllers,
> e.g. Supermicro X10SAT was a Xeon board with Redwood Ridge
> which was introduced in 2013.  This was way before Microsoft
> came up with the HotPlugSupportInD3 property.  It was also way
> before the 2015 BIOS cut-off date that we use to disable
> power management on older boards.
> 
> Still, we currently whitelist the Thunderbolt ports on that
> board for D3 because we know it works.  What if products like
> this one use their own power management scheme and we'd cause
> a power regression if we needlessly disable D3 for them now?

All the non-Apple Thunderbolt products before "HotPlugSupportInD3" use
ACPI "assisted" hotplug which means all the PM is done in the BIOS.
Essentially it means the controller is only present if there is anything
connected and in that case it is always in D0. Unplugging the device
makes the controller to be hot-removed (ACPI hotplug) too and that's the
only way early Thunderbolt used to save energy.
