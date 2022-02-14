Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9AC4B42EB
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 08:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD8410E1AF;
	Mon, 14 Feb 2022 07:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8D710E1AF;
 Mon, 14 Feb 2022 07:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644824170; x=1676360170;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TtIgUTAIsXJ4XGN4YguPnu9VZqX5t+e944YjPkCfnAQ=;
 b=iHWvdIoZgHtfCTj4Jhhc+qlls93Fz+d/JUxueLUUn8/tXAy5kpGvPD5m
 hDk77VZ969/eUntwWODJEVAPujFNLKiqDxzh8UaU5YJeCcUVZ/sm2Qpth
 O+bu3Ka7g0O0JOAHkEDRNRztD7xpUlF+0hM0Ppv9eEK6G31gy934aZteB
 DnNNLDen94uiAE/ZJhMk1hku2IFLGZqqMVcufsUP25GtzN2RLCwuL/BWp
 fihVxxIPBGVZgLlmqxoZAYDGcO3gNivagm1JPAnw54MXBOKCKEtdsM+iC
 1mcf98RTRzTXfk5f6oV25/aJKjr1xbuD7JkzLCdz9In4Yl/Eh4rGaQjih A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="247628391"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="247628391"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2022 23:36:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="772875545"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2022 23:36:04 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 14 Feb 2022 09:34:26 +0200
Date: Mon, 14 Feb 2022 09:34:26 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v3 05/12] PCI: Detect root port of internal USB4 devices
 by `usb4-host-interface`
Message-ID: <YgoGAkjZgCob8Mdl@lahna>
References: <20220211193250.1904843-6-mario.limonciello@amd.com>
 <20220211214546.GA737137@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211214546.GA737137@bhelgaas>
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
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bjorn,

On Fri, Feb 11, 2022 at 03:45:46PM -0600, Bjorn Helgaas wrote:
> On Fri, Feb 11, 2022 at 01:32:43PM -0600, Mario Limonciello wrote:
> > The root port used for PCIe tunneling should be marked as removable to
> > ensure that the entire chain is marked removable.
> > 
> > This can be done by looking for the device property specified in
> > the ACPI tables `usb4-host-interface`.
> > 
> > Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Link: https://docs.microsoft.com/en-us/windows-hardware/drivers/pci/dsd-for-pcie-root-ports#mapping-native-protocols-pcie-displayport-tunneled-through-usb4-to-usb4-host-routers
> > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > ---
> >  drivers/pci/pci-acpi.c | 10 ++++++++++
> >  drivers/pci/pci.h      |  5 +++++
> >  drivers/pci/probe.c    |  1 +
> >  3 files changed, 16 insertions(+)
> > 
> > diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
> > index a42dbf448860..6368e5633b1b 100644
> > --- a/drivers/pci/pci-acpi.c
> > +++ b/drivers/pci/pci-acpi.c
> > @@ -1391,6 +1391,16 @@ void pci_acpi_cleanup(struct device *dev, struct acpi_device *adev)
> >  	}
> >  }
> >  
> > +bool pci_acpi_is_usb4(struct pci_dev *dev)
> > +{
> > +	struct acpi_device *adev = ACPI_COMPANION(&dev->dev);
> > +
> > +	if (!adev)
> > +		return false;
> > +	return fwnode_property_present(acpi_fwnode_handle(adev),
> > +				       "usb4-host-interface");
> 
> Maybe it's obvious to everybody but me that "USB4" means this device
> is removable.  The Microsoft reference above doesn't say anything
> about removability.
> 
> My expectation is that "USB" (like "PCI" and "PCIe") tells me
> something about how a device is electrically connected and how
> software can operate it.  It doesn't really tell me anything about
> whether those electrical connections are permanent, made through an
> internal slot, or made through an external connector and cable.

It is used to identify "tunneled" ports (whether PCIe, USB 3.x or
DisplayPort). Tunnels are created by software (in Linux it is the
Thunderbolt driver) and are dynamic in nature. The USB4 links go over
USB Type-C cable which also is something user can plug/unplug freely.

I would say it is reasonable expectation that anything behind these
ports can be assumed as "removable".
