Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6674B42CA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 08:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5A410E207;
	Mon, 14 Feb 2022 07:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA6A10E207;
 Mon, 14 Feb 2022 07:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644823640; x=1676359640;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3D+QYO7Pwm9FAUWke5CmBKJRJaBzCTD4KK+GctzE02M=;
 b=bEqDs83K67onjru0NlXVJuUGM4pDLdgmNUjEQJEAPrsXxBwQm+8f4ZLk
 kyv6ICmHtAhLetWaPEnS16MkAzyneeMUu11ExmQvgT0gNzpCupRS7DjsY
 t9ktakhkAnF54MR0PyY8rn+op+hgP9WycH0b6Mz5DMmvLSq6Qosj41Vct
 sGBjfXvI7KIHyLwPrO1SLfUrPWl0XqwG1ciMPCbd4uRCDg1NxhsTG6Ntm
 xoxgrMXFIizIaGl68y7eibLhKzXdZJ/KShtuk6In0SCkolQDqbvYBAAKa
 svx6diikkFLj3YqWvoEn5eWSGP/p3lRyNAsC7v9rcwflT3AZu/IWZC9et A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="336459435"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="336459435"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2022 23:27:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="634979853"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2022 23:27:15 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 14 Feb 2022 09:27:13 +0200
Date: Mon, 14 Feb 2022 09:27:13 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Limonciello, Mario" <mario.limonciello@amd.com>
Subject: Re: [PATCH v3 04/12] PCI: Drop the `is_thunderbolt` attribute from
 PCI core
Message-ID: <YgoEUYLbYUbk5A6Q@lahna>
References: <20220211193250.1904843-1-mario.limonciello@amd.com>
 <20220211193250.1904843-5-mario.limonciello@amd.com>
 <20220213082056.GA23572@wunner.de>
 <0ef8f2cb-1978-f469-71d3-2cf7469eb8b6@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ef8f2cb-1978-f469-71d3-2cf7469eb8b6@amd.com>
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

Hi Mario,

On Sun, Feb 13, 2022 at 11:26:56AM -0600, Limonciello, Mario wrote:
> On 2/13/2022 02:20, Lukas Wunner wrote:
> > On Fri, Feb 11, 2022 at 01:32:42PM -0600, Mario Limonciello wrote:
> > > The `is_thunderbolt` attribute is currently a dumping ground for a
> > > variety of things.
> > 
> > It's not as arbitrary as it may seem.  Quite a bit of thought went into
> > the current design.
> > 
> > 
> > > Instead use the driver core removable attribute to indicate the
> > > detail a device is attached to a thunderbolt or USB4 chain.
> > 
> > You're missing the point that "is_thunderbolt" is set on the *controller*
> > (i.e. its upstream and downstream ports).
> > 
> > The controller itself is *not* removable if it's the host controller.
> > 
> > However a device can be assumed to be removable if it has an ancestor
> > which has the "is_thunderbolt" flag set.
> > 
> 
> Ah right... I wonder if really what this series should be about then is
> setting up the the PCIe endpoints for PCIe tunneling and XHCI tunneling to
> be marked as "external" instead then.  It would mean that existing code will
> apply the removable attribute to everything downstream (and presumably at
> least some of those drivers it will continue to make sense to drop
> "pcie_is_thunderbolt_attached" and instead check dev_is_removable.

Yes, I think this is the right thing to do. Anything connected over
PCIe/USB 3.x tunnel is pretty much "removable" whereas the host
controllers may or may not. Typically they are not.
