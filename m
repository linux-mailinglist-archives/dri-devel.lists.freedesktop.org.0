Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9988BA43BB9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 11:33:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BAB10E60E;
	Tue, 25 Feb 2025 10:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="itqWpvyS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C8210E60E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 10:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740479628; x=1772015628;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xDtEhN1Z+pJ+VKbDwekrT0fQS2yTec4QWfwd4POyIVM=;
 b=itqWpvySbLMh347ByhvLOktGWoWTdwWTUj3L8E9Jukk3tRwSGFMjUfNk
 YmwRwtfMzAMYihyHvBE5E4xdwONAsvDgm0udRy69OtZ7SwNW3xEfxliWG
 SLMe9VqNOerfJVhRHUR4XaGa/XO6vxDcEPaxRlkPerZx5vC7YPidldWpo
 qVCZFDuWNWz46sxKII44P8jKERBYAr+Pm0s3HihaOGemBHsrRBJMcTa2Z
 01LEEA69O4v/2lVJbqIBndMZvrupyxNPlYMcXp5Y1oxTY9i5R7WSricOB
 SUzlXc8xwAip05VVdBnZa82UzyXr/xqVI5EKS8jwYoxbSEGDrAurOEK2X w==;
X-CSE-ConnectionGUID: BtQlUJmIRoGPH8MuNn/nnw==
X-CSE-MsgGUID: lqFX/SCsSDGcI02dcykJvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="41412503"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="41412503"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 02:33:48 -0800
X-CSE-ConnectionGUID: TmKLdnSVTkCUMbCIqENeyw==
X-CSE-MsgGUID: 84RCDiuURBW2Y8gDTdIwew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="116144291"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 02:33:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tmsFy-0000000ExYS-2dxt; Tue, 25 Feb 2025 12:33:42 +0200
Date: Tue, 25 Feb 2025 12:33:42 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, Kerem Karabay <kekrby@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Message-ID: <Z72chunE_vvxtjLQ@smile.fi.intel.com>
References: <3457BF95-0E50-4B70-86DE-EE5EE95D3ACE@live.com>
 <4D7C00B4-7B75-4715-8D37-0059B22C030D@live.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4D7C00B4-7B75-4715-8D37-0059B22C030D@live.com>
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

On Tue, Feb 25, 2025 at 10:09:42AM +0000, Aditya Garg wrote:
> From: Kerem Karabay <kekrby@gmail.com>
> 
> The Touch Bars found on x86 Macs support two USB configurations: one
> where the device presents itself as a HID keyboard and can display
> predefined sets of keys, and one where the operating system has full
> control over what is displayed.
> 
> This commit adds support for the display functionality of the second
> configuration. Functionality for the first configuration has been
> merged in the HID tree.
> 
> Note that this driver has only been tested on T2 Macs, and only includes
> the USB device ID for these devices. Testing on T1 Macs would be
> appreciated.
> 
> Credit goes to Ben (Bingxing) Wang on GitHub for reverse engineering
> most of the protocol.
> 
> Also, as requested by Andy, I would like to clarify the use of __packed
> structs in this driver:
> 
> - All the packed structs are aligned except for appletbdrm_msg_information.
> - We have to pack appletbdrm_msg_information since it is requirement of
>   the protocol.
> - We compared binaries compiled by keeping the rest structs __packed and
>   not __packed using bloat-o-meter, and __packed was not affecting code
>   generation.
> - To maintain consistency, rest structs have been kept __packed.
> 
> I would also like to point out that since the driver was reverse-engineered
> the actual data types of the protocol might be different, including, but
> not limited to, endianness.

...

> +static int appletbdrm_probe(struct usb_interface *intf,
> +			    const struct usb_device_id *id)
> +{
> +	struct usb_endpoint_descriptor *bulk_in, *bulk_out;
> +	struct device *dev = &intf->dev;
> +	struct appletbdrm_device *adev;
> +	struct drm_device *drm;
> +	int ret;
> +
> +	ret = usb_find_common_endpoints(intf->cur_altsetting, &bulk_in, &bulk_out, NULL, NULL);
> +	if (ret) {
> +		drm_err(drm, "Failed to find bulk endpoints\n");

This is simply wrong (and in this case even lead to crash in some circumstances).
drm_err() may not be used here. That's my point in previous discussions.
Independently on the subsystem the ->probe() for the sake of consistency and
being informative should only rely on struct device *dev,

> +		return ret;
> +	}
> +
> +	adev = devm_drm_dev_alloc(dev, &appletbdrm_drm_driver, struct appletbdrm_device, drm);
> +	if (IS_ERR(adev))
> +		return PTR_ERR(adev);
> +
> +	adev->in_ep = bulk_in->bEndpointAddress;
> +	adev->out_ep = bulk_out->bEndpointAddress;
> +	adev->dmadev = dev;
> +
> +	drm = &adev->drm;
> +
> +	usb_set_intfdata(intf, adev);
> +
> +	ret = appletbdrm_get_information(adev);
> +	if (ret) {
> +		drm_err(drm, "Failed to get display information\n");
> +		return ret;
> +	}
> +
> +	ret = appletbdrm_signal_readiness(adev);
> +	if (ret) {
> +		drm_err(drm, "Failed to signal readiness\n");
> +		return ret;
> +	}
> +
> +	ret = appletbdrm_setup_mode_config(adev);
> +	if (ret) {
> +		drm_err(drm, "Failed to setup mode config\n");
> +		return ret;
> +	}
> +
> +	ret = drm_dev_register(drm, 0);
> +	if (ret) {
> +		drm_err(drm, "Failed to register DRM device\n");
> +		return ret;
> +	}
> +
> +	ret = appletbdrm_clear_display(adev);
> +	if (ret) {
> +		drm_err(drm, "Failed to clear display\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko


