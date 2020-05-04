Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 584FB1C38DF
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 14:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD2389EF7;
	Mon,  4 May 2020 12:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB3C89EF7
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 12:06:32 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h4so8129509wmb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 05:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=fiZ6mivFePHboVqA432EBa9zkm8jvKjD0ztWuXO0iV4=;
 b=jOYsFR9zKjXTmNfiY3rCahlQm+ZmYppvuBCLKVG9t02ljT6V7nmq2PMylFy/6ZF2nJ
 MxCQ2D8F6KgTioQtKYPW4RBJSsT0BMfvzs9YGGtt8hJkEwwEqLlTlPWDvpRpNlM6Wyx4
 2gh/NZBKx525ITM2FQaPvwjUtvBcKVKpPjQFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fiZ6mivFePHboVqA432EBa9zkm8jvKjD0ztWuXO0iV4=;
 b=UlY+nT7PLp0OLMUvxha8MYZJ51+GD2zSrTnmu42Z3X2eHbOSXvwBmdjRl6GJmbDIYS
 l1VsAE8S5aDyJPdPtGoL/xi7MoldGRVhVBl8pLbTBZ5KjMgIgDYj5LdlW/Fqyo7i3n+v
 rKSDXf/QGvT8v1dzCtBhEoct2DSweXuwiS8Af2Qzx3SnH8lirsFV1j8o1dCb5rQexnYA
 wmGwEOphWObmyPx8mcwAyl91J8XbSONuqWWuGgcRZvgga+LmexS8dIEBBppPw1O5am15
 SnXHv7gzvZI+I20QM82HA9K9Knezfux12xDGjZWs0rMTcmLqQxHe44g4DpbYIngHkg63
 FoYw==
X-Gm-Message-State: AGi0PuaXezPnhwcCFc+gcA0OVlEg5uD5feASJn6jMkZNstOmp1cZYrGJ
 6auLkthpk6gLoEvM47LQs40F3Q==
X-Google-Smtp-Source: APiQypLXI3dR3J7n/p58tTeQsyk0uojgaTAfwkrFEUNEq8OXFWx0kzR6KZ4ads+mmEmP+e+uSIfACA==
X-Received: by 2002:a1c:3182:: with SMTP id x124mr15504321wmx.54.1588593991423; 
 Mon, 04 May 2020 05:06:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i6sm12127890wrw.97.2020.05.04.05.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 05:06:30 -0700 (PDT)
Date: Mon, 4 May 2020 14:06:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 02/10] drm: Add backlight helper
Message-ID: <20200504120628.GK10381@phenom.ffwll.local>
References: <20200429124830.27475-1-noralf@tronnes.org>
 <20200429124830.27475-3-noralf@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429124830.27475-3-noralf@tronnes.org>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
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
 Daniel Thompson <daniel.thompson@linaro.org>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 29, 2020 at 02:48:22PM +0200, Noralf Tr=F8nnes wrote:
> This adds a function that creates a backlight device for a connector.
> It does not deal with the KMS backlight ABI proposition[1] to add a
> connector property. It only takes the current best practise to standardise
> the creation of a backlight device for DRM drivers while we wait for the
> property.
> =

> The brightness value is set using a connector state variable and an atomic
> commit.
> =

> I have looked through some of the backlight users and this is what I've f=
ound:
> =

> GNOME [2]
> ---------
> =

> Brightness range: 0-100
> Scale: Assumes perceptual
> =

> Avoids setting the sysfs brightness value to zero if max_brightness >=3D =
99.
> Can connect connector and backlight using the sysfs device.
> =

> KDE [3]
> -------
> =

> Brightness range: 0-100
> Scale: Assumes perceptual
> =

> Weston [4]
> ----------
> =

> Brightness range: 0-255
> Scale: Assumes perceptual
> =

> Chromium OS [5]
> ---------------
> =

> Brightness range: 0-100
> Scale: Depends on the sysfs file 'scale' which is a recent addition (2019)
> =

> xserver [6]
> -----------
> =

> Brightness range: 0-x (driver specific) (1 is minimum, 0 is OFF)
> Scale: Assumes perceptual
> =

> The builtin modesetting driver[7] does not support Backlight, Intel[8] do=
es.
> =

> [1] https://lore.kernel.org/dri-devel/4b17ba08-39f3-57dd-5aad-d37d844b02c=
6@linux.intel.com/
> [2] https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/blob/master/pl=
ugins/power/gsd-backlight.c
> [3] https://github.com/KDE/powerdevil/blob/master/daemon/backends/upower/=
backlighthelper.cpp
> [4] https://gitlab.freedesktop.org/wayland/weston/-/blob/master/libweston=
/backend-drm/drm.c
> [5] https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/m=
aster/power_manager/powerd/system/internal_backlight.cc
> [6] https://github.com/freedesktop/xorg-randrproto/blob/master/randrproto=
.txt
> [7] https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/hw/xfree86/=
drivers/modesetting/drmmode_display.c
> [8] https://gitlab.freedesktop.org/xorg/driver/xf86-video-intel/-/blob/ma=
ster/src/backlight.c
> =

> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Martin Peres <martin.peres@linux.intel.com>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Noralf Tr=F8nnes <noralf@tronnes.org>
> ---
>  Documentation/gpu/drm-kms-helpers.rst  |   6 +
>  drivers/gpu/drm/Kconfig                |   7 ++
>  drivers/gpu/drm/Makefile               |   1 +
>  drivers/gpu/drm/drm_backlight_helper.c | 154 +++++++++++++++++++++++++
>  include/drm/drm_backlight_helper.h     |   9 ++
>  include/drm/drm_connector.h            |  10 ++
>  6 files changed, 187 insertions(+)
>  create mode 100644 drivers/gpu/drm/drm_backlight_helper.c
>  create mode 100644 include/drm/drm_backlight_helper.h
> =

> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/dr=
m-kms-helpers.rst
> index 9668a7fe2408..29a2f4b49fd2 100644
> --- a/Documentation/gpu/drm-kms-helpers.rst
> +++ b/Documentation/gpu/drm-kms-helpers.rst
> @@ -411,3 +411,9 @@ SHMEM GEM Helper Reference
>  =

>  .. kernel-doc:: drivers/gpu/drm/drm_gem_shmem_helper.c
>     :export:
> +
> +Backlight Helper Reference
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_backlight_helper.c
> +   :export:
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index d0aa6cff2e02..f6e13e18c9ca 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -224,6 +224,13 @@ config DRM_GEM_SHMEM_HELPER
>  	help
>  	  Choose this if you need the GEM shmem helper functions
>  =

> +config DRM_BACKLIGHT_HELPER
> +	bool
> +	depends on DRM
> +	select BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Choose this if you need the backlight device helper functions
> +
>  config DRM_VM
>  	bool
>  	depends on DRM && MMU
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 6493088a0fdd..0d17662dde0a 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -52,6 +52,7 @@ drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) +=3D drm_f=
b_helper.o
>  drm_kms_helper-$(CONFIG_DRM_KMS_CMA_HELPER) +=3D drm_fb_cma_helper.o
>  drm_kms_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) +=3D drm_dp_aux_dev.o
>  drm_kms_helper-$(CONFIG_DRM_DP_CEC) +=3D drm_dp_cec.o
> +drm_kms_helper-$(CONFIG_DRM_BACKLIGHT_HELPER) +=3D drm_backlight_helper.o
>  =

>  obj-$(CONFIG_DRM_KMS_HELPER) +=3D drm_kms_helper.o
>  obj-$(CONFIG_DRM_DEBUG_SELFTEST) +=3D selftests/
> diff --git a/drivers/gpu/drm/drm_backlight_helper.c b/drivers/gpu/drm/drm=
_backlight_helper.c
> new file mode 100644
> index 000000000000..06e6a75d1d0a
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_backlight_helper.c
> @@ -0,0 +1,154 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright 2020 Noralf Tr=F8nnes
> + */
> +
> +#include <linux/backlight.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_file.h>
> +
> +static int drm_backlight_update_status(struct backlight_device *bd)
> +{
> +	struct drm_connector *connector =3D bl_get_data(bd);
> +	struct drm_connector_state *connector_state;
> +	struct drm_device *dev =3D connector->dev;
> +	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_atomic_state *state;
> +	int ret;
> +
> +	state =3D drm_atomic_state_alloc(dev);
> +	if (!state)
> +		return -ENOMEM;
> +
> +	drm_modeset_acquire_init(&ctx, 0);
> +	state->acquire_ctx =3D &ctx;
> +retry:
> +	connector_state =3D drm_atomic_get_connector_state(state, connector);
> +	if (IS_ERR(connector_state)) {
> +		ret =3D PTR_ERR(connector_state);
> +		goto out;
> +	}
> +
> +	connector_state->backlight_brightness =3D bd->props.brightness;
> +
> +	ret =3D drm_atomic_commit(state);
> +out:
> +	if (ret =3D=3D -EDEADLK) {
> +		drm_atomic_state_clear(state);
> +		drm_modeset_backoff(&ctx);
> +		goto retry;
> +	}
> +
> +	drm_atomic_state_put(state);
> +
> +	drm_modeset_drop_locks(&ctx);
> +	drm_modeset_acquire_fini(&ctx);
> +
> +	return ret;
> +}

Looking at this, I'm not sure this is generally useable outside of your
usb driver. Or stuff that does essentially the same.

For real hw drivers I expect a similar relationship between the kms driver
and the backlight driver like for i2c, clocks, power domaines, ... i.e.
the kms driver calls into the backlight driver. This also means that kms
locks will be nesting outside of the locks of these subordinate
subsystems, and hence direct access through other userspace interfaces
(like we have for i2c too) needs to bypass atomic kms. Otherwise we have
deadlock potential.


With your stuff here we can potentially get a backlight locks -> kms locks
-> backlight locks scenario, and lockdep will be angry about this. So in
general this doesn't work (I think, locking is hard), and in this specific
case it only works because your usb driver shovels everything over to
another machine. Lockdep will still complain if you load this together
with some other kms driver that uses backlight normally.

Aside: Locking is broken in the backlight code, we take the
bd->update_lock too late, after bd->props has already been handled
unsafely. But I guess that's a side effect of the sysfs interface being
racy by default. Or the backlight_enable/disable helpers should take
bd->ops_lock too.

So two things:
- I think the actual update needs to be pushed to a work_struct, with no
  flush_work, to avoid these locking loops completely.
- I think this is best left in your usb driver for now, until someone
  comes up with maybe an spi forwarder or whatever where we might need
  this again.

Or, and this is probably much simpler, just have a simpler backlight
driver that's completely orthogonal to the kms side, with some hw lock to
organize updates. For that case just adding a drm_connector->backlight
pointer, as prep for Hans' work, would be great.
-Daniel


> +
> +static int drm_backlight_get_brightness(struct backlight_device *bd)
> +{
> +	struct drm_connector *connector =3D bl_get_data(bd);
> +	struct drm_device *dev =3D connector->dev;
> +	int brightness;
> +
> +	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
> +	brightness =3D connector->state->backlight_brightness;
> +	drm_modeset_unlock(&dev->mode_config.connection_mutex);
> +
> +	return brightness;
> +}
> +
> +static const struct backlight_ops drm_backlight_ops =3D {
> +	.get_brightness =3D drm_backlight_get_brightness,
> +	.update_status	=3D drm_backlight_update_status,
> +};
> +
> +/* Can be exported for drivers carrying a legacy name */
> +static int drm_backlight_register_with_name(struct drm_connector *connec=
tor, const char *name)
> +{
> +	struct backlight_device *bd;
> +	const struct backlight_properties props =3D {
> +		.type =3D BACKLIGHT_RAW,
> +		.scale =3D BACKLIGHT_SCALE_NON_LINEAR,
> +		.max_brightness =3D 100,
> +	};
> +
> +	if (WARN_ON(!drm_core_check_feature(connector->dev, DRIVER_MODESET) ||
> +		    !drm_drv_uses_atomic_modeset(connector->dev) ||
> +		    !connector->kdev))
> +		return -EINVAL;
> +
> +	bd =3D backlight_device_register(name, connector->kdev, connector,
> +				       &drm_backlight_ops, &props);
> +	if (IS_ERR(bd))
> +		return PTR_ERR(bd);
> +
> +	connector->backlight =3D bd;
> +
> +	return 0;
> +}
> +
> +/**
> + * drm_backlight_register() - Register a backlight device for a connector
> + * @connector: Connector
> + *
> + * This function registers a backlight device for @connector with the fo=
llowing
> + * characteristics:
> + *
> + * - The connector sysfs device is used as a parent device for the backl=
ight device.
> + *   Userspace can use this to connect backlight device and connector.
> + * - Name will be on the form: **card0-HDMI-A-1-backlight**
> + * - Type is "raw"
> + * - Scale is "non-linear" (perceptual)
> + * - Max brightness is 100 giving a range of 0-100 inclusive
> + * - Reading sysfs **brightness** returns the backlight device property
> + * - Reading sysfs **actual_brightness** returns the connector state val=
ue
> + * - Writing sysfs **bl_power** is ignored, the DPMS connector property =
should
> + *   be used to control power.
> + * - Backlight device suspend/resume events are ignored.
> + *
> + * Note:
> + *
> + * Brightness zero should not turn off backlight it should be the minimum
> + * brightness, DPMS handles power.
> + *
> + * This function must be called from &drm_connector_funcs->late_register=
() since
> + * it depends on the sysfs device.
> + *
> + * Returns:
> + * Zero on success or negative error code on failure.
> + */
> +int drm_backlight_register(struct drm_connector *connector)
> +{
> +	const char *name =3D NULL;
> +	int ret;
> +
> +	name =3D kasprintf(GFP_KERNEL, "card%d-%s-backlight",
> +			 connector->dev->primary->index, connector->name);
> +	if (!name)
> +		return -ENOMEM;
> +
> +	ret =3D drm_backlight_register_with_name(connector, name);
> +	kfree(name);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_backlight_register);
> +
> +/**
> + * drm_backlight_unregister() - Unregister backlight device
> + * @connector: Connector
> + *
> + * Unregister a backlight device. This must be called from the
> + * &drm_connector_funcs->early_unregister() callback.
> + */
> +void drm_backlight_unregister(struct drm_connector *connector)
> +{
> +	backlight_device_unregister(connector->backlight);
> +}
> +EXPORT_SYMBOL(drm_backlight_unregister);
> diff --git a/include/drm/drm_backlight_helper.h b/include/drm/drm_backlig=
ht_helper.h
> new file mode 100644
> index 000000000000..4151b66eb0b4
> --- /dev/null
> +++ b/include/drm/drm_backlight_helper.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +
> +#ifndef _LINUX_DRM_BACKLIGHT_HELPER_H
> +#define _LINUX_DRM_BACKLIGHT_HELPER_H
> +
> +int drm_backlight_register(struct drm_connector *connector);
> +void drm_backlight_unregister(struct drm_connector *connector);
> +
> +#endif
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 221910948b37..ce678b694f45 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -32,6 +32,7 @@
>  =

>  #include <uapi/drm/drm_mode.h>
>  =

> +struct backlight_device;
>  struct drm_connector_helper_funcs;
>  struct drm_modeset_acquire_ctx;
>  struct drm_device;
> @@ -656,6 +657,12 @@ struct drm_connector_state {
>  	 */
>  	u8 max_bpc;
>  =

> +	/**
> +	 * @backlight_brightness: Brightness value of the connector backlight
> +	 * device. See drm_backlight_register().
> +	 */
> +	u8 backlight_brightness;
> +
>  	/**
>  	 * @hdr_output_metadata:
>  	 * DRM blob property for HDR output metadata
> @@ -1422,6 +1429,9 @@ struct drm_connector {
>  =

>  	/** @hdr_sink_metadata: HDR Metadata Information read from sink */
>  	struct hdr_sink_metadata hdr_sink_metadata;
> +
> +	/** @backlight: Backlight device. See drm_backlight_register() */
> +	struct backlight_device *backlight;
>  };
>  =

>  #define obj_to_connector(x) container_of(x, struct drm_connector, base)
> -- =

> 2.23.0
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
