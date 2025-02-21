Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB3EA3F957
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 16:48:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7A910EAA6;
	Fri, 21 Feb 2025 15:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cn1tr9zE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1717310EAAD
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 15:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740152930; x=1771688930;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/pQn+untRKOqyYy54U8reIpuQvRJBkEP3a+yT8gAw5Q=;
 b=cn1tr9zEvCebzW+T8vClhDjA4fkWY6m9vgUkaCTjlkpebbHH9xJDmvUG
 uc233PTyG528UC8zCGHz5buUiU31xDgV+YQkKGcRalhNoq4D0HxsWb8r0
 epyrOWrlGoON59jnEVz41fK9mtMVC66eehcubeBfiFZn1fiqkcmLvik2z
 u9JOdEWEwksvdduTP2CcLX5tLZ+IglC8KvFkDxRlG5iLxMhIwHyarShdY
 GwOy3FxfV1l8GwKHs2W2vi5GH5e3a9899SSQSufywLnBjgMtXZtLQ3qcv
 U7hsiRfk+joy7s9s7gt0G+dCmdarbiPKvLkwCQKGtqBcR6ab/fv7z9GZF A==;
X-CSE-ConnectionGUID: WC1RiGEjTz+X0qHYrwTuxA==
X-CSE-MsgGUID: 1UxXGYP6R06WLy6R/YCGiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="66340621"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="66340621"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 07:48:49 -0800
X-CSE-ConnectionGUID: aKgu2y0aSXKor3GwjMXldw==
X-CSE-MsgGUID: +6uVVKDGTmWOVVLDae7rZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120022214"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 07:48:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tlVGY-0000000DgLs-0KyF; Fri, 21 Feb 2025 17:48:38 +0200
Date: Fri, 21 Feb 2025 17:48:37 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 Kerem Karabay <kekrby@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Hector Martin <marcan@marcan.st>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>,
 Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v3 3/3] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Message-ID: <Z7igVXqvRYTVFpXU@smile.fi.intel.com>
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
 <8F522D41-5417-467E-B9D3-7D9FC24AE536@live.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8F522D41-5417-467E-B9D3-7D9FC24AE536@live.com>
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

On Fri, Feb 21, 2025 at 11:37:57AM +0000, Aditya Garg wrote:
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
> Credit goes to Ben (Bingxing) Wang on GitHub [1] for reverse engineering
> most of the protocol.
> 
> [1]: https://github.com/imbushuo/DFRDisplayKm

Use Link tag for this.

> +config DRM_APPLETBDRM
> +	tristate "DRM support for Apple Touch Bars"
> +	depends on DRM && USB && MMU

I dunno if tiny is not only about SPI panels, would be nice to hear somebody
from DRM to confirm that USB ones are okay to have.

> +	select DRM_GEM_SHMEM_HELPER
> +	select DRM_KMS_HELPER
> +	select HID_APPLETB_BL
> +	select HID_MULTITOUCH
> +	help
> +	  Say Y here if you want support for the display of Touch Bars on x86
> +	  MacBook Pros.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called appletbdrm.

...

> +/*
> + * Apple Touch Bar DRM Driver
> + *
> + * Copyright (c) 2023 Kerem Karabay <kekrby@gmail.com>

No changes in 2024/2025?

> + */

...

> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

Why? Don't you have a struct device available?

...

> +#include <linux/module.h>
> +#include <linux/unaligned.h>
> +#include <linux/usb.h>

This is way too little list of what you are actually using, please consider
IWYU principle in place.

...

> +#define __APPLETBDRM_MSG_STR4(str4)	((__le32 __force)((str4[0] << 24) | (str4[1] << 16) | (str4[2] << 8) | str4[3]))

Reinventing a wheel from get_unaligned_be32() AFAICS.

...

> +#define drm_to_adev(_drm)		container_of(_drm, struct appletbdrm_device, drm)

+ container_of.h

...

> +struct appletbdrm_msg_request_header {
> +	__le16 unk_00;

+ types.h

> +	__le16 unk_02;
> +	__le32 unk_04;
> +	__le32 unk_08;
> +	__le32 size;
> +} __packed;

Why __packed? Please explain and justify for all the data types that are marked
with this attribute.

...

> +static int appletbdrm_send_request(struct appletbdrm_device *adev,
> +				   struct appletbdrm_msg_request_header *request, size_t size)
> +{
> +	struct usb_device *udev = adev_to_udev(adev);
> +	struct drm_device *drm = &adev->drm;
> +	int ret, actual_size;
> +
> +	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, adev->out_ep),
> +			   request, size, &actual_size, APPLETBDRM_BULK_MSG_TIMEOUT);
> +	if (ret) {
> +		drm_err(drm, "Failed to send message (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	if (actual_size != size) {
> +		drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
> +			actual_size, size);
> +		return -EIO;
> +	}
> +
> +	return ret;

	return 0;

Or you are expecting something else here?

> +}

...

> +static int appletbdrm_read_response(struct appletbdrm_device *adev,
> +				    struct appletbdrm_msg_response_header *response,
> +				    size_t size, u32 expected_response)
> +{
> +	struct usb_device *udev = adev_to_udev(adev);
> +	struct drm_device *drm = &adev->drm;
> +	int ret, actual_size;
> +	bool readiness_signal_received = false;
> +
> +retry:
> +	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, adev->in_ep),
> +			   response, size, &actual_size, APPLETBDRM_BULK_MSG_TIMEOUT);
> +	if (ret) {
> +		drm_err(drm, "Failed to read response (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * The device responds to the first request sent in a particular
> +	 * timeframe after the USB device configuration is set with a readiness
> +	 * signal, in which case the response should be read again
> +	 */
> +	if (response->msg == APPLETBDRM_MSG_SIGNAL_READINESS) {
> +		if (!readiness_signal_received) {
> +			readiness_signal_received = true;
> +			goto retry;
> +		}
> +
> +		drm_err(drm, "Encountered unexpected readiness signal\n");
> +		return -EIO;
> +	}
> +
> +	if (actual_size != size) {
> +		drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
> +			actual_size, size);
> +		return -EIO;
> +	}
> +
> +	if (response->msg != expected_response) {
> +		drm_err(drm, "Unexpected response from device (expected %p4ch found %p4ch)\n",
> +			&expected_response, &response->msg);
> +		return -EIO;

For three different cases the same error code, can it be adjusted more to the
situation?

> +	}
> +
> +	return 0;
> +}

> +static int appletbdrm_send_msg(struct appletbdrm_device *adev, u32 msg)
> +{
> +	struct appletbdrm_msg_simple_request *request;
> +	int ret;
> +
> +	request = kzalloc(sizeof(*request), GFP_KERNEL);

+ slab.h

> +	if (!request)
> +		return -ENOMEM;

+ err.h

> +
> +	request->header.unk_00 = cpu_to_le16(2);
> +	request->header.unk_02 = cpu_to_le16(0x1512);
> +	request->header.size = cpu_to_le32(sizeof(*request) - sizeof(request->header));
> +	request->msg = msg;
> +	request->size = request->header.size;
> +
> +	ret = appletbdrm_send_request(adev, &request->header, sizeof(*request));
> +
> +	kfree(request);
> +
> +	return ret;
> +}

...

> +	return drm_rect_width(rect) * drm_rect_height(rect) * (APPLETBDRM_BITS_PER_PIXEL / 8);

BITS_TO_BYTES() ? Will need bits.h IIRC.

...

> +static int appletbdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
> +						   struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
> +	struct drm_crtc *new_crtc = new_plane_state->crtc;
> +	struct drm_crtc_state *new_crtc_state = NULL;
> +	struct appletbdrm_plane_state *appletbdrm_state = to_appletbdrm_plane_state(new_plane_state);
> +	struct drm_atomic_helper_damage_iter iter;
> +	struct drm_rect damage;
> +	size_t frames_size = 0;
> +	size_t request_size;
> +	int ret;
> +
> +	if (new_crtc)
> +		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
> +
> +	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
> +						  DRM_PLANE_NO_SCALING,
> +						  DRM_PLANE_NO_SCALING,
> +						  false, false);
> +	if (ret)
> +		return ret;

> +	else if (!new_plane_state->visible)

Why 'else'? It's redundant.

> +		return 0;
> +
> +	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, new_plane_state);
> +	drm_atomic_for_each_plane_damage(&iter, &damage) {
> +		frames_size += struct_size((struct appletbdrm_frame *)0, buf, rect_size(&damage));
> +	}
> +
> +	if (!frames_size)
> +		return 0;
> +
> +	request_size = ALIGN(sizeof(struct appletbdrm_fb_request) +
> +		       frames_size +
> +		       sizeof(struct appletbdrm_fb_request_footer), 16);

Missing header for ALIGN().

But have you checked overflow.h for the possibility of using some helper macros
from there? This is what should be usually done for k*alloc() in the kernel.

> +	appletbdrm_state->request = kzalloc(request_size, GFP_KERNEL);
> +
> +	if (!appletbdrm_state->request)
> +		return -ENOMEM;
> +
> +	appletbdrm_state->response = kzalloc(sizeof(*appletbdrm_state->response), GFP_KERNEL);
> +
> +	if (!appletbdrm_state->response)
> +		return -ENOMEM;
> +
> +	appletbdrm_state->request_size = request_size;
> +	appletbdrm_state->frames_size = frames_size;
> +
> +	return 0;
> +}

...

> +static int appletbdrm_flush_damage(struct appletbdrm_device *adev,
> +				   struct drm_plane_state *old_state,
> +				   struct drm_plane_state *state)
> +{
> +	struct appletbdrm_plane_state *appletbdrm_state = to_appletbdrm_plane_state(state);
> +	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
> +	struct appletbdrm_fb_request_response *response = appletbdrm_state->response;
> +	struct appletbdrm_fb_request_footer *footer;
> +	struct drm_atomic_helper_damage_iter iter;
> +	struct drm_framebuffer *fb = state->fb;
> +	struct appletbdrm_fb_request *request = appletbdrm_state->request;
> +	struct drm_device *drm = &adev->drm;
> +	struct appletbdrm_frame *frame;
> +	u64 timestamp = ktime_get_ns();
> +	struct drm_rect damage;
> +	size_t frames_size = appletbdrm_state->frames_size;
> +	size_t request_size = appletbdrm_state->request_size;
> +	int ret;
> +
> +	if (!frames_size)
> +		return 0;
> +
> +	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
> +	if (ret) {
> +		drm_err(drm, "Failed to start CPU framebuffer access (%d)\n", ret);

> +		goto end_fb_cpu_access;

Strange. Is it for real that this API requires to be called in both cases for
success and for an error?

> +	}
> +
> +	request->header.unk_00 = cpu_to_le16(2);
> +	request->header.unk_02 = cpu_to_le16(0x12);
> +	request->header.unk_04 = cpu_to_le32(9);
> +	request->header.size = cpu_to_le32(request_size - sizeof(request->header));
> +	request->unk_10 = cpu_to_le16(1);

> +	request->msg_id = timestamp & 0xff;

Why ' & 0xff'?

> +	frame = (struct appletbdrm_frame *)request->data;
> +
> +	drm_atomic_helper_damage_iter_init(&iter, old_state, state);
> +	drm_atomic_for_each_plane_damage(&iter, &damage) {
> +		struct drm_rect dst_clip = state->dst;
> +		struct iosys_map dst = IOSYS_MAP_INIT_VADDR(frame->buf);
> +		u32 buf_size = rect_size(&damage);
> +
> +		if (!drm_rect_intersect(&dst_clip, &damage))
> +			continue;
> +
> +		/*
> +		 * The coordinates need to be translated to the coordinate
> +		 * system the device expects, see the comment in
> +		 * appletbdrm_setup_mode_config
> +		 */
> +		frame->begin_x = cpu_to_le16(damage.y1);
> +		frame->begin_y = cpu_to_le16(adev->height - damage.x2);
> +		frame->width = cpu_to_le16(drm_rect_height(&damage));
> +		frame->height = cpu_to_le16(drm_rect_width(&damage));
> +		frame->buf_size = cpu_to_le32(buf_size);
> +
> +		switch (fb->format->format) {
> +		case DRM_FORMAT_XRGB8888:
> +			drm_fb_xrgb8888_to_bgr888(&dst, NULL, &shadow_plane_state->data[0], fb, &damage, &shadow_plane_state->fmtcnv_state);
> +			break;
> +		default:
> +			drm_fb_memcpy(&dst, NULL, &shadow_plane_state->data[0], fb, &damage);
> +			break;
> +		}
> +
> +		frame = (void *)frame + struct_size(frame, buf, buf_size);

+ overflow.h

> +	}
> +
> +	footer = (struct appletbdrm_fb_request_footer *)&request->data[frames_size];
> +
> +	footer->unk_0c = cpu_to_le32(0xfffe);
> +	footer->unk_1c = cpu_to_le32(0x80001);
> +	footer->unk_34 = cpu_to_le32(0x80002);
> +	footer->unk_4c = cpu_to_le32(0xffff);
> +	footer->timestamp = cpu_to_le64(timestamp);
> +
> +	ret = appletbdrm_send_request(adev, &request->header, request_size);
> +	if (ret)
> +		goto end_fb_cpu_access;
> +
> +	ret = appletbdrm_read_response(adev, &response->header, sizeof(*response),
> +				       APPLETBDRM_MSG_UPDATE_COMPLETE);
> +	if (ret)
> +		goto end_fb_cpu_access;
> +
> +	if (response->timestamp != footer->timestamp) {
> +		drm_err(drm, "Response timestamp (%llu) doesn't match request timestamp (%llu)\n",
> +			le64_to_cpu(response->timestamp), timestamp);
> +		goto end_fb_cpu_access;
> +	}
> +
> +end_fb_cpu_access:
> +	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> +
> +	return ret;
> +}

...

> +static void appletbdrm_primary_plane_reset(struct drm_plane *plane)
> +{
> +	struct appletbdrm_plane_state *appletbdrm_state;
> +
> +	WARN_ON(plane->state);

+ bug.h

> +	appletbdrm_state = kzalloc(sizeof(*appletbdrm_state), GFP_KERNEL);
> +	if (!appletbdrm_state)
> +		return;
> +
> +	__drm_gem_reset_shadow_plane(plane, &appletbdrm_state->base);
> +}

...

> +static int appletbdrm_setup_mode_config(struct appletbdrm_device *adev)
> +{
> +	struct drm_connector *connector = &adev->connector;
> +	struct drm_plane *primary_plane;
> +	struct drm_crtc *crtc;
> +	struct drm_encoder *encoder;
> +	struct drm_device *drm = &adev->drm;
> +	struct device *dev = adev->dev;
> +	int ret;
> +
> +	ret = drmm_mode_config_init(drm);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize mode configuration\n");

+ dev_printk.h

> +	primary_plane = &adev->primary_plane;
> +	ret = drm_universal_plane_init(drm, primary_plane, 0,
> +				       &appletbdrm_primary_plane_funcs,
> +				       appletbdrm_primary_plane_formats,
> +				       ARRAY_SIZE(appletbdrm_primary_plane_formats),

+ array_size.h

> +				       NULL,
> +				       DRM_PLANE_TYPE_PRIMARY, NULL);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize universal plane object\n");
> +	drm_plane_helper_add(primary_plane, &appletbdrm_primary_plane_helper_funcs);
> +	drm_plane_enable_fb_damage_clips(primary_plane);
> +
> +	crtc = &adev->crtc;
> +	ret = drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
> +					&appletbdrm_crtc_funcs, NULL);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize CRTC object\n");
> +	drm_crtc_helper_add(crtc, &appletbdrm_crtc_helper_funcs);
> +
> +	encoder = &adev->encoder;
> +	ret = drm_encoder_init(drm, encoder, &appletbdrm_encoder_funcs,
> +			       DRM_MODE_ENCODER_DAC, NULL);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize encoder\n");
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +
> +	/*
> +	 * The coordinate system used by the device is different from the
> +	 * coordinate system of the framebuffer in that the x and y axes are
> +	 * swapped, and that the y axis is inverted; so what the device reports
> +	 * as the height is actually the width of the framebuffer and vice
> +	 * versa
> +	 */
> +	drm->mode_config.min_width = 0;
> +	drm->mode_config.min_height = 0;
> +	drm->mode_config.max_width = max(adev->height, DRM_SHADOW_PLANE_MAX_WIDTH);
> +	drm->mode_config.max_height = max(adev->width, DRM_SHADOW_PLANE_MAX_HEIGHT);
> +	drm->mode_config.preferred_depth = APPLETBDRM_BITS_PER_PIXEL;
> +	drm->mode_config.funcs = &appletbdrm_mode_config_funcs;
> +
> +	adev->mode = (struct drm_display_mode) {

Why do you need a compound literal here? Perhaps you want to have that to be
done directly in DRM_MODE_INIT()?

> +		DRM_MODE_INIT(60, adev->height, adev->width,
> +			      DRM_MODE_RES_MM(adev->height, 218),
> +			      DRM_MODE_RES_MM(adev->width, 218))
> +	};
> +
> +	ret = drm_connector_init(drm, connector,
> +				 &appletbdrm_connector_funcs, DRM_MODE_CONNECTOR_USB);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize connector\n");
> +
> +	drm_connector_helper_add(connector, &appletbdrm_connector_helper_funcs);
> +
> +	ret = drm_connector_set_panel_orientation(connector,
> +						  DRM_MODE_PANEL_ORIENTATION_RIGHT_UP);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to set panel orientation\n");
> +
> +	connector->display_info.non_desktop = true;
> +	ret = drm_object_property_set_value(&connector->base,
> +					    drm->mode_config.non_desktop_property, true);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to set non-desktop property\n");
> +
> +	ret = drm_connector_attach_encoder(connector, encoder);
> +
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize simple display pipe\n");
> +
> +	drm_mode_config_reset(drm);
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko


