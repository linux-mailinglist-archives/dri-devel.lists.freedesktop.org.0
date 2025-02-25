Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E359EA440A4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 14:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B83210E67E;
	Tue, 25 Feb 2025 13:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W0ec/mtV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E9110E67E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 13:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740489934; x=1772025934;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qEEiXRmbmH15S7cSjAiyYqtzG/R8Me/5JqNxRGlCemk=;
 b=W0ec/mtVGrAVcb2vNq2Xrh4OVqrKPzvXqW4M9e3E8gjqfE/vmg4XxfGD
 am8142QJP09fyLkxEdYGfczju4sPHucMqwjz2xLYR9V240GEE41o49Vg9
 eIzRbMXO6LOsw4Tu6ibPkKQ9XoDTcmCmmQIGOQc5g2ompsP9E+8//EmRk
 3EI1LlxauCH+2RPBJ776d3gNJEdKl9ctlomTWzg0W3e19WWPTCoO0U84E
 /5iQXldYHqFwn3N1Aa1DY4lQ8/UbPutBcxAV41a1CcM1ue1/10Xqp7HUj
 5kOwJAlmI+xwi3Xn//5rtTBLiGrX5GijDhWxxCM+dma37EF9FHCSSm6Mp A==;
X-CSE-ConnectionGUID: nDZpgaByT+qZA7HR6Yi9PA==
X-CSE-MsgGUID: y4zRt/GBScSbjrdy9pndUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="58716567"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="58716567"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 05:25:34 -0800
X-CSE-ConnectionGUID: u360bJP2QKSSwuDGNw0hLA==
X-CSE-MsgGUID: pxn6umOwRN2Mi/+YYbpfzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121638078"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 05:25:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tmuwA-0000000F0Dy-2Lx5; Tue, 25 Feb 2025 15:25:26 +0200
Date: Tue, 25 Feb 2025 15:25:26 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Aditya Garg <gargaditya08@live.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, Kerem Karabay <kekrby@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Message-ID: <Z73ExmFOcOoozjxS@smile.fi.intel.com>
References: <3457BF95-0E50-4B70-86DE-EE5EE95D3ACE@live.com>
 <4D7C00B4-7B75-4715-8D37-0059B22C030D@live.com>
 <Z72chunE_vvxtjLQ@smile.fi.intel.com>
 <c0249cd8-68e4-4860-b5c3-e054df10ae30@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0249cd8-68e4-4860-b5c3-e054df10ae30@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 25, 2025 at 12:58:17PM +0100, Thomas Zimmermann wrote:
> Am 25.02.25 um 11:33 schrieb andriy.shevchenko@linux.intel.com:
> > On Tue, Feb 25, 2025 at 10:09:42AM +0000, Aditya Garg wrote:

...

> > > +static int appletbdrm_probe(struct usb_interface *intf,
> > > +			    const struct usb_device_id *id)
> > > +{
> > > +	struct usb_endpoint_descriptor *bulk_in, *bulk_out;
> > > +	struct device *dev = &intf->dev;
> > > +	struct appletbdrm_device *adev;
> > > +	struct drm_device *drm;
> > > +	int ret;
> > > +
> > > +	ret = usb_find_common_endpoints(intf->cur_altsetting, &bulk_in, &bulk_out, NULL, NULL);
> > > +	if (ret) {
> > > +		drm_err(drm, "Failed to find bulk endpoints\n");
> > This is simply wrong (and in this case even lead to crash in some circumstances).
> > drm_err() may not be used here. That's my point in previous discussions.
> > Independently on the subsystem the ->probe() for the sake of consistency and
> > being informative should only rely on struct device *dev,
> 
> That's never going to work with DRM. There's so much code in a DRM probe
> function that uses the DRM error functions.

> This specific instance here is wrong, as the drm pointer hasn't been
> initialized. But as soon as it is, it's much better to use drm_err() and
> friends. It will do the right thing and give consistent output across
> drivers.

Okay and my question was how is it possible to create drm_err_probe() for such
cases?

> > > +		return ret;
> > > +	}

-- 
With Best Regards,
Andy Shevchenko


