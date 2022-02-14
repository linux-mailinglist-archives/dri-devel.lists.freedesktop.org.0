Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5284B4D5E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 12:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F237110E329;
	Mon, 14 Feb 2022 11:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C413D10E329;
 Mon, 14 Feb 2022 11:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644837121; x=1676373121;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uhliuFcKaGT4XB0ts+0U1iHxKFUOKpgSPOQ3kJVrBqw=;
 b=UlwnlLd7Kt5onKh/gt6YHt4vaeoAv2mfWKHqiMKJlm0XTlFhmNw8farZ
 smdR5+QtyKGbtW7hRkyBc22mcd9/nIIHf5jjH0joZJH4gBnydiSdGudJm
 e614cm02q6eDo8QYtwzHc4S5SCG1ww1tqv0Tkzz0xUe/k2gUBPYRglBOR
 Rclx2Besk9IKaDHTaKfKSdo9sVIpJN6vYMOQ6LU92vGA/ROQaQ21LKE+1
 +Y+zyeUxZPv9lVyADmfhMUC+FV8fxGe6Jy6HhhNJbLIbtf4sJWUYt1LRT
 8qD3jX5Q8Sx2De/8GCD90ncDaPmjz/QVITQLazrUSAHprVIp0OPE1MGI8 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="250015643"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="250015643"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 03:12:01 -0800
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="538542216"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 03:11:56 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 14 Feb 2022 13:11:54 +0200
Date: Mon, 14 Feb 2022 13:11:54 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v3 05/12] PCI: Detect root port of internal USB4 devices
 by `usb4-host-interface`
Message-ID: <Ygo4+sfeHhQeSUEa@lahna>
References: <20220211193250.1904843-6-mario.limonciello@amd.com>
 <20220211214546.GA737137@bhelgaas> <YgoGAkjZgCob8Mdl@lahna>
 <20220214085202.GA21533@wunner.de> <Ygo1eoVe8D0b80QF@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ygo1eoVe8D0b80QF@lahna>
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
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 14, 2022 at 01:11:05PM +0200, Mika Westerberg wrote:
> > > It is used to identify "tunneled" ports (whether PCIe, USB 3.x or
> > > DisplayPort). Tunnels are created by software (in Linux it is the
> > > Thunderbolt driver) and are dynamic in nature. The USB4 links go over
> > > USB Type-C cable which also is something user can plug/unplug freely.
> > > 
> > > I would say it is reasonable expectation that anything behind these
> > > ports can be assumed as "removable".
> > 
> > USB gadgets may be soldered to the mainboard.  Those cannot be
> > unplugged freely.  It is common practice to solder USB Ethernet
> > or USB FTDI serial ports and nothing's preventing a vendor to solder
> > USB4/Thunderbolt gadgets.
> 
> Right, that's why I say it is "reasonable expectation" that anything
> behind these ports can be assumed "removable" :) Of course they don't
> have to be but if we assume that in the driver where this actually
> matters we should be on the safe side, no?

Also the tunnels are not permanent anyway.
