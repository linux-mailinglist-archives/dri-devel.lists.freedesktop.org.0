Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B302A4365
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 11:48:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6356EC86;
	Tue,  3 Nov 2020 10:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8CD6EC79
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 10:48:49 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s9so17976196wro.8
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 02:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=D6+BeP3hAipGPFWmeHksUrojDmcY62CRrUj5YYbWigo=;
 b=Q891Cqz5RctA1qc9isvt4mtPCFoA5hm3szOEgd324aPwJ/TKkMas9Ky4RX4awSGTHr
 sdMbTlTkp7w7mF4HttkqYAe2+mrk2MUdUsUjaqO9FErJwNQnF6oAaE828pUvZQRZE0+D
 2lx3BWJXQc9V6LddbNUWReZgbJgGDu7i9X6H8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=D6+BeP3hAipGPFWmeHksUrojDmcY62CRrUj5YYbWigo=;
 b=IJ5o5LLEikeE9GCaYmx9KvtMgEL3JJE8KEh1GWwHIXQRd7ljlH/QsXHYcXqsFAeMcO
 2B/4Y3ICmnzFyQaTtWTqysN2GnBcFH5trzGsk0hbrwtCgkZQsBz/A5e1FeEzPb9dCZtA
 4ZR8OnuT7w/dDApFrzW113vZErjmyh/7sQ+ahqU46sEfKdu8v8zBGK8C0uLcGylrkN2J
 uiiMH3P8QSUMcnIICOOeg3GdIIfOLAQAa31Sh85upVqS02G6Ic85tyTJpmmbgdjaA7JG
 l0dhIeF7mBvQwFJ71Qqe1+8OZwwNddse0wFspgUvOIMpAp9lA5Ze8kD+oBVxowy8jp9R
 ov8g==
X-Gm-Message-State: AOAM531EWrQQeSuSv6HhhCG7khVpmlAQarhM/bilgNA880w2o5CV3k4r
 g9ucgBZSwq81D0ERp4KPCGSotI5JRFF6qmsN
X-Google-Smtp-Source: ABdhPJzOkXJeUynos2XNP0b39iEyRDadnjIgrw92GUlZ4O5os9M2tJu4um8zGrMoX1kC1xVJzRNhNQ==
X-Received: by 2002:adf:fec8:: with SMTP id q8mr26522313wrs.64.1604400527835; 
 Tue, 03 Nov 2020 02:48:47 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 15sm2457038wmg.1.2020.11.03.02.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 02:48:47 -0800 (PST)
Date: Tue, 3 Nov 2020 11:48:45 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/3] drm: Add USB helpers
Message-ID: <20201103104845.GC401619@phenom.ffwll.local>
References: <20201103103656.17768-1-tzimmermann@suse.de>
 <20201103103656.17768-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103103656.17768-2-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: airlied@linux.ie, hdegoede@redhat.com, dri-devel@lists.freedesktop.org,
 sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 03, 2020 at 11:36:54AM +0100, Thomas Zimmermann wrote:
> DRM drivers for USB devices can share a few helpers. It's currently only
> a function to retrieve the USB device's structure from the DRM device.
> 
> Putting this code next to the DRM device would make all of DRM depend on
> USB headers. So it's in a separate header file.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

This seems like overkill for just sharing 1 inline function. Plus it might
tempt people into adding more bus functions again, and maybe I'm a bit too
much burned on the midlayer here, but that doesn't sound like a great
idea.

If we need bus helpers, they should be in the bus library (maybe there
should be a combo of interface_to_usbdev(to_usb_interface()) in the usb
code, but not in drm code).

The pci helpers are really the awkward historical exception because of the
utter horror show that is DRIVER_LEGACY shadow attach driver mode.
-Daniel

> ---
>  Documentation/gpu/drm-internals.rst |  5 +++++
>  include/drm/drm_usb_helper.h        | 25 +++++++++++++++++++++++++
>  2 files changed, 30 insertions(+)
>  create mode 100644 include/drm/drm_usb_helper.h
> 
> diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
> index 12272b168580..642679407f36 100644
> --- a/Documentation/gpu/drm-internals.rst
> +++ b/Documentation/gpu/drm-internals.rst
> @@ -197,6 +197,11 @@ Utilities
>  .. kernel-doc:: include/drm/drm_util.h
>     :internal:
>  
> +USB helpers
> +-----------
> +
> +.. kernel-doc:: include/drm/drm_usb_helper.h
> +   :internal:
>  
>  Legacy Support Code
>  ===================
> diff --git a/include/drm/drm_usb_helper.h b/include/drm/drm_usb_helper.h
> new file mode 100644
> index 000000000000..6e8feff890ac
> --- /dev/null
> +++ b/include/drm/drm_usb_helper.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +
> +#ifndef DRM_USB_HELPER_H
> +#define DRM_USB_HELPER_H
> +
> +#include <linux/usb.h>
> +
> +#include <drm/drm_device.h>
> +
> +/**
> + * drm_dev_get_usb_device - Returns a DRM device's USB device
> + * @dev:	The DRM device
> + *
> + * For USB-based DRM devices, returns the corresponding USB device. The
> + * DRM device must store the USB interface's device in its dev field.
> + *
> + * RETURNS:
> + * The USB device
> + */
> +static inline struct usb_device *drm_dev_get_usb_device(struct drm_device *dev)
> +{
> +	return interface_to_usbdev(to_usb_interface(dev->dev));
> +}
> +
> +#endif
> -- 
> 2.29.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
