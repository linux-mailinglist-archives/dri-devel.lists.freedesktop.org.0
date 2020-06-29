Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF78C20CD70
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 11:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303C389803;
	Mon, 29 Jun 2020 09:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9EF89803
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 09:07:02 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id w3so2880981wmi.4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 02:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eViizoDrXX6+ameu+MoUtZ0aZihUlA3+UI/M+1dv61U=;
 b=LjHpx9yNDHf2Tecg15P05U38Y2k8SKLX8i3ghzcOGi3B0RXOcmvEQK8mW8SbUdvbti
 Hhrdhh/c5FL2+coFTWQ6HO4mv555C52IdznEAl/Kcfs8rsPXPmln/564420/BOcRtzmh
 CVQw/n1/dArNnZx4M+34OE5VxX+/ltQ8rtySc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eViizoDrXX6+ameu+MoUtZ0aZihUlA3+UI/M+1dv61U=;
 b=lyKDi4J/UHIo6a/GHSCx7GePKVvHfBipUaidFjsZdoNeFfIhggv4qw6IJrH+YEAr5n
 /7n4Tn4toKmqEBdvdKesuayz9he7QYOttn4jDYeG9+CEpb+ryBSY+UsNyHClAZ9e6XBr
 85gr6VZWBE20D15F3ouvXGm71FR1OI9lhjNlCKY5e9dL6p6nL41Njj544v9MaiGIBO/j
 Vcws3V5oafgx09WpAFIRpfiqD8qQsjlvCy41OeI0preEBZQqqFEZu9Ud3y8oSjbfAu/S
 kC/FNtS2UnexBraILM72NGvRJIP6n8urGjqpatoIwf11Z4O4A0LWHiGNDKEM2Owcbooz
 vaLA==
X-Gm-Message-State: AOAM533M2fi/2hPnsixRY8ErFDMV570PBIroWKXEStyOuGVJyyU6qf/g
 IsJf0y4grk0j0ILfwLwdfHRMIw==
X-Google-Smtp-Source: ABdhPJwEKEV/FYTG27lg0VFGYn7glkkTtlcP/FqLYsKNmrfV7xTgvPXCio4iTdhZXrpMdrMy5y4wfQ==
X-Received: by 2002:a1c:a70d:: with SMTP id q13mr13213104wme.55.1593421620556; 
 Mon, 29 Jun 2020 02:07:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y6sm29087016wmy.0.2020.06.29.02.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 02:06:59 -0700 (PDT)
Date: Mon, 29 Jun 2020 11:06:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/9] drm: Add simplekms driver
Message-ID: <20200629090657.GN3278063@phenom.ffwll.local>
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200625120011.16168-4-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: geert+renesas@glider.be, airlied@linux.ie, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, lgirdwood@gmail.com, hdegoede@redhat.com,
 broonie@kernel.org, kraxel@redhat.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 25, 2020 at 02:00:05PM +0200, Thomas Zimmermann wrote:
> The simplekms driver is a DRM driver for simplefb framebuffers as
> provided by the kernel's boot code. This driver enables basic
> graphical output on many different graphics devices that are provided
> by the platform (e.g., EFI, VESA, embedded framebuffers).
> 
> With the kernel's simplefb infrastructure, the kernel receives a
> pre-configured framebuffer from the system (i.e., firmware, boot
> loader). It creates a platform device to which simplekms attaches.
> The system's framebuffer consists of a memory range, size and format.
> Based on these values, simplekms creates a DRM devices. No actual
> modesetting is possible.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  MAINTAINERS                      |   6 +
>  drivers/gpu/drm/tiny/Kconfig     |  16 +
>  drivers/gpu/drm/tiny/Makefile    |   1 +
>  drivers/gpu/drm/tiny/simplekms.c | 495 +++++++++++++++++++++++++++++++
>  4 files changed, 518 insertions(+)
>  create mode 100644 drivers/gpu/drm/tiny/simplekms.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f17d99164a77..ac517dc8d05d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5505,6 +5505,12 @@ S:	Orphan / Obsolete
>  F:	drivers/gpu/drm/savage/
>  F:	include/uapi/drm/savage_drm.h
>  
> +DRM DRIVER FOR SIMPLE FRAMEBUFFERS
> +M:	Thomas Zimmermann <tzimmermann@suse.de>
> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	drivers/gpu/drm/tiny/simplekms.c
> +
>  DRM DRIVER FOR SIS VIDEO CARDS
>  S:	Orphan / Obsolete
>  F:	drivers/gpu/drm/sis/
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index 2b6414f0fa75..50dbde8bdcb2 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -28,6 +28,22 @@ config DRM_GM12U320
>  	 This is a KMS driver for projectors which use the GM12U320 chipset
>  	 for video transfer over USB2/3, such as the Acer C120 mini projector.
>  
> +config DRM_SIMPLEKMS
> +	tristate "Simple framebuffer driver"
> +	depends on DRM
> +	select DRM_GEM_SHMEM_HELPER
> +	select DRM_KMS_HELPER
> +	help
> +	  DRM driver for simple platform-provided framebuffers.
> +
> +	  This driver assumes that the display hardware has been initialized
> +	  by the firmware or bootloader before the kernel boots. Scanout
> +	  buffer, size, and display format must be provided via device tree,
> +	  UEFI, VESA, etc.
> +
> +	  On x86 and compatible, you should also select CONFIG_X86_SYSFB to
> +	  use UEFI and VESA framebuffers.
> +
>  config TINYDRM_HX8357D
>  	tristate "DRM support for HX8357D display panels"
>  	depends on DRM && SPI
> diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
> index 6ae4e9e5a35f..e83fbbfa7344 100644
> --- a/drivers/gpu/drm/tiny/Makefile
> +++ b/drivers/gpu/drm/tiny/Makefile
> @@ -2,6 +2,7 @@
>  
>  obj-$(CONFIG_DRM_CIRRUS_QEMU)		+= cirrus.o
>  obj-$(CONFIG_DRM_GM12U320)		+= gm12u320.o
> +obj-$(CONFIG_DRM_SIMPLEKMS)		+= simplekms.o
>  obj-$(CONFIG_TINYDRM_HX8357D)		+= hx8357d.o
>  obj-$(CONFIG_TINYDRM_ILI9225)		+= ili9225.o
>  obj-$(CONFIG_TINYDRM_ILI9341)		+= ili9341.o
> diff --git a/drivers/gpu/drm/tiny/simplekms.c b/drivers/gpu/drm/tiny/simplekms.c
> new file mode 100644
> index 000000000000..dc7cf3983945
> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/simplekms.c
> @@ -0,0 +1,495 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/platform_data/simplefb.h>
> +#include <linux/platform_device.h>
> +
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_format_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +#define DRIVER_NAME	"simplekms"
> +#define DRIVER_DESC	"DRM driver for simple-framebuffer platform devices"
> +#define DRIVER_DATE	"20200625"
> +#define DRIVER_MAJOR	1
> +#define DRIVER_MINOR	0
> +
> +/*
> + * Assume a monitor resolution of 96 dpi to
> + * get a somewhat reasonable screen size.
> + */
> +#define RES_MM(d)	\
> +	(((d) * 254ul) / (96ul * 10ul))
> +
> +#define SIMPLEKMS_MODE(hd, vd)	\
> +	DRM_SIMPLE_MODE(hd, vd, RES_MM(hd), RES_MM(vd))
> +
> +/*
> + * Helpers for simplefb
> + */
> +
> +static int
> +simplefb_get_validated_int(struct drm_device *dev, const char *name,
> +			   uint32_t value)
> +{
> +	if (value > INT_MAX) {
> +		drm_err(dev, "simplefb: invalid framebuffer %s of %u\n",
> +			name, value);
> +		return -EINVAL;
> +	}
> +	return (int)value;
> +}
> +
> +static int
> +simplefb_get_validated_int0(struct drm_device *dev, const char *name,
> +			    uint32_t value)
> +{
> +	if (!value) {
> +		drm_err(dev, "simplefb: invalid framebuffer %s of %u\n",
> +			name, value);
> +		return -EINVAL;
> +	}
> +	return simplefb_get_validated_int(dev, name, value);
> +}
> +
> +static const struct drm_format_info *
> +simplefb_get_validated_format(struct drm_device *dev, const char *format_name)
> +{
> +	static const struct simplefb_format formats[] = SIMPLEFB_FORMATS;
> +	const struct simplefb_format *fmt = formats;
> +	const struct simplefb_format *end = fmt + ARRAY_SIZE(formats);
> +
> +	if (!format_name) {
> +		drm_err(dev, "simplefb: missing framebuffer format\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	while (fmt < end) {
> +		if (!strcmp(format_name, fmt->name))
> +			return drm_format_info(fmt->fourcc);
> +		++fmt;
> +	}
> +
> +	drm_err(dev, "simplefb: unknown framebuffer format %s\n",
> +		format_name);
> +
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +static int
> +simplefb_get_width_pd(struct drm_device *dev,
> +		      const struct simplefb_platform_data *pd)
> +{
> +	return simplefb_get_validated_int0(dev, "width", pd->width);
> +}
> +
> +static int
> +simplefb_get_height_pd(struct drm_device *dev,
> +		       const struct simplefb_platform_data *pd)
> +{
> +	return simplefb_get_validated_int0(dev, "height", pd->height);
> +}
> +
> +static int
> +simplefb_get_stride_pd(struct drm_device *dev,
> +		       const struct simplefb_platform_data *pd)
> +{
> +	return simplefb_get_validated_int(dev, "stride", pd->stride);
> +}
> +
> +static const struct drm_format_info *
> +simplefb_get_format_pd(struct drm_device *dev,
> +		       const struct simplefb_platform_data *pd)
> +{
> +	return simplefb_get_validated_format(dev, pd->format);
> +}
> +
> +/*
> + * Simple Framebuffer device
> + */
> +
> +struct simplekms_device {
> +	struct drm_device dev;
> +	struct platform_device *pdev;
> +
> +	/* simplefb settings */
> +	struct drm_display_mode mode;
> +	const struct drm_format_info *format;
> +	unsigned int pitch;
> +
> +	/* memory management */
> +	struct resource *mem;
> +	void __iomem *screen_base;
> +
> +	/* modesetting */
> +	struct drm_connector connector;
> +	struct drm_simple_display_pipe pipe;
> +};
> +
> +static struct simplekms_device *simplekms_device_of_dev(struct drm_device *dev)
> +{
> +	return container_of(dev, struct simplekms_device, dev);
> +}
> +
> +/*
> + *  Simplefb settings
> + */
> +
> +static struct drm_display_mode simplekms_mode(unsigned int width,
> +					      unsigned int height)
> +{
> +	struct drm_display_mode mode = { SIMPLEKMS_MODE(width, height) };
> +
> +	mode.clock = 60 /* Hz */ * mode.hdisplay * mode.vdisplay;
> +	drm_mode_set_name(&mode);
> +
> +	return mode;
> +}
> +
> +static int simplekms_device_init_fb(struct simplekms_device *sdev)
> +{
> +	int width, height, stride;
> +	const struct drm_format_info *format;
> +	struct drm_format_name_buf buf;
> +	struct drm_device *dev = &sdev->dev;
> +	struct platform_device *pdev = sdev->pdev;
> +	const struct simplefb_platform_data *pd = dev_get_platdata(&pdev->dev);
> +
> +	if (pd) {
> +		width = simplefb_get_width_pd(dev, pd);
> +		if (width < 0)
> +			return width;
> +		height = simplefb_get_height_pd(dev, pd);
> +		if (height < 0)
> +			return height;
> +		stride = simplefb_get_stride_pd(dev, pd);
> +		if (stride < 0)
> +			return stride;
> +		format = simplefb_get_format_pd(dev, pd);
> +		if (IS_ERR(format))
> +			return PTR_ERR(format);
> +	} else {
> +		drm_err(dev, "no simplefb configuration found\n");
> +		return -ENODEV;
> +	}
> +
> +	sdev->mode = simplekms_mode(width, height);
> +	sdev->format = format;
> +	sdev->pitch = stride;
> +
> +	drm_dbg_kms(dev, "display mode={" DRM_MODE_FMT "}\n",
> +		    DRM_MODE_ARG(&sdev->mode));
> +	drm_dbg_kms(dev,
> +		    "framebuffer format=\"%s\", size=%dx%d, stride=%d byte\n",
> +		    drm_get_format_name(format->format, &buf), width,
> +		    height, stride);
> +
> +	return 0;
> +}
> +
> +/*
> + * Memory management
> + */
> +
> +static int simplekms_device_init_mm(struct simplekms_device *sdev)
> +{
> +	struct platform_device *pdev = sdev->pdev;
> +	struct resource *mem;
> +	void __iomem *screen_base;
> +
> +	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!mem)
> +		return -EINVAL;
> +
> +	screen_base = devm_ioremap_wc(&pdev->dev, mem->start,
> +				      resource_size(mem));
> +	if (!screen_base)
> +		return -ENOMEM;
> +
> +	sdev->mem = mem;
> +	sdev->screen_base = screen_base;
> +
> +	return 0;
> +}
> +
> +/*
> + * Modesetting
> + */
> +
> +/*
> + * Support all formats of simplefb and maybe more; in order
> + * of preference. The display's update function will do any
> + * conversion necessary.
> + *
> + * TODO: Add blit helpers for remaining formats and uncomment
> + *       constants.
> + */
> +static const uint32_t simplekms_formats[] = {
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_RGB565,
> +	//DRM_FORMAT_XRGB1555,
> +	//DRM_FORMAT_ARGB1555,
> +	DRM_FORMAT_RGB888,
> +	//DRM_FORMAT_XRGB2101010,
> +	//DRM_FORMAT_ARGB2101010,
> +};
> +
> +static const uint64_t simplekms_format_modifiers[] = {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID
> +};
> +
> +static int simplekms_connector_get_modes(struct drm_connector *connector)
> +{
> +	struct simplekms_device *sdev = simplekms_device_of_dev(connector->dev);
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, &sdev->mode);
> +	if (!mode)
> +                return 0;
> +
> +	if (mode->name[0] == '\0')
> +		drm_mode_set_name(mode);
> +
> +	mode->type |= DRM_MODE_TYPE_PREFERRED;
> +	drm_mode_probed_add(connector, mode);
> +
> +	if (mode->width_mm)
> +                connector->display_info.width_mm = mode->width_mm;
> +	if (mode->height_mm)
> +                connector->display_info.height_mm = mode->height_mm;
> +
> +        return 1;
> +}
> +
> +static const struct drm_connector_helper_funcs simplekms_connector_helper_funcs = {
> +	.get_modes = simplekms_connector_get_modes,
> +};
> +
> +static const struct drm_connector_funcs simplekms_connector_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static int
> +simplekms_simple_display_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
> +				    const struct drm_display_mode *mode)
> +{
> +	struct simplekms_device *sdev = simplekms_device_of_dev(pipe->connector->dev);
> +
> +	if (mode->hdisplay != sdev->mode.hdisplay &&
> +	    mode->vdisplay != sdev->mode.vdisplay)
> +		return MODE_ONE_SIZE;

I'd simplify this to an || and delete the two below. Userspace wont care
anyway.

> +	else if (mode->hdisplay != sdev->mode.hdisplay)
> +		return MODE_ONE_WIDTH;
> +	else if (mode->vdisplay != sdev->mode.vdisplay)
> +		return MODE_ONE_HEIGHT;
> +
> +	return MODE_OK;
> +}
> +
> +static void
> +simplekms_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
> +				struct drm_crtc_state *crtc_state,
> +				struct drm_plane_state *plane_state)
> +{
> +	struct simplekms_device *sdev = simplekms_device_of_dev(pipe->connector->dev);
> +	struct drm_plane_state *state = pipe->plane.state;
> +	struct drm_framebuffer *fb = state->fb;
> +	void *vmap;
> +
> +	vmap = drm_gem_shmem_vmap(fb->obj[0]);
> +	if (!vmap)
> +		return;
> +
> +	drm_fb_blit_dstclip(sdev->screen_base, sdev->pitch,
> +			    sdev->format->format, vmap, fb);
> +
> +	drm_gem_shmem_vunmap(fb->obj[0], vmap);
> +}
> +
> +static void
> +simplekms_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
> +				struct drm_plane_state *old_plane_state)
> +{
> +	struct simplekms_device *sdev = simplekms_device_of_dev(pipe->connector->dev);
> +	struct drm_plane_state *state = pipe->plane.state;
> +	struct drm_framebuffer *fb = state->fb;
> +	struct drm_rect clip;
> +	void *vmap;
> +
> +	if (!drm_atomic_helper_damage_merged(old_plane_state, state, &clip))
> +		return;
> +
> +	vmap = drm_gem_shmem_vmap(fb->obj[0]);
> +	if (!vmap)
> +		return;
> +
> +	drm_fb_blit_rect_dstclip(sdev->screen_base, sdev->pitch,
> +				 sdev->format->format, vmap, fb, &clip);
> +
> +	drm_gem_shmem_vunmap(fb->obj[0], vmap);
> +}
> +
> +static const struct drm_simple_display_pipe_funcs
> +simplekms_simple_display_pipe_funcs = {
> +	.mode_valid = simplekms_simple_display_pipe_mode_valid,
> +	.enable = simplekms_simple_display_pipe_enable,

A disable hook that clears it all to black would be nice.

> +	.update = simplekms_simple_display_pipe_update,
> +	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
> +};
> +
> +static const struct drm_mode_config_funcs simplekms_mode_config_funcs = {
> +	.fb_create = drm_gem_fb_create_with_dirty,
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = drm_atomic_helper_commit,
> +};
> +
> +static int simplekms_device_init_modeset(struct simplekms_device *sdev)
> +{
> +	struct drm_device *dev = &sdev->dev;
> +	struct drm_display_mode *mode = &sdev->mode;
> +	struct drm_connector *connector = &sdev->connector;
> +	struct drm_simple_display_pipe *pipe = &sdev->pipe;
> +	int ret;
> +
> +	ret = drmm_mode_config_init(dev);
> +	if (ret)
> +		return ret;
> +
> +	dev->mode_config.min_width = mode->hdisplay;
> +	dev->mode_config.max_width = mode->hdisplay;
> +	dev->mode_config.min_height = mode->vdisplay;
> +	dev->mode_config.max_height = mode->vdisplay;
> +	dev->mode_config.prefer_shadow = true;
> +	dev->mode_config.preferred_depth = sdev->format->cpp[0] * 8;
> +	dev->mode_config.funcs = &simplekms_mode_config_funcs;
> +
> +	drm_connector_helper_add(connector, &simplekms_connector_helper_funcs);
> +	ret = drm_connector_init(dev, connector, &simplekms_connector_funcs,
> +				 DRM_MODE_CONNECTOR_Unknown);

Quite bad amounts of boilerplate for the connector, but I guess everyone
else with a simple output that's totally fixed just uses drm_panel. Which
doesn't really fit here (but most likely would reduce code a bunch I
suspect).

> +	if (ret)
> +		return ret;
> +
> +	ret = drm_simple_display_pipe_init(dev, pipe,
> +					   &simplekms_simple_display_pipe_funcs,
> +					   simplekms_formats,

I don't think this works, you need to allocate a custom format list with 3
entries:
- actual format of the underlying fb, so we avoid conversion if possible
- the xrgb/argb8888 fallbacks as usual

Announcing all of them userspace might pick something that you can't do.

> +					   ARRAY_SIZE(simplekms_formats),
> +					   simplekms_format_modifiers,
> +					   connector);
> +	if (ret)
> +		return ret;
> +
> +	drm_mode_config_reset(dev);

This breaks fastboot. I think ideally we'd have the state represent
everything is on, and allocate an fb + buffer with the current contents of
the framebuffer. Since we can allocate an fb that matches this shouldn't
be a problem, just a raw memcpy_fromio should do the job.

Having a nice new simplekms drm driver and then losing fastboot feels like
slightly off tradeoff.

Maybe in a follow-up patch, but before fbcon setup? Since ideally fbcon
also takes over the already existing framebuffer we allocated, so that as
long as nothing clears the fb (i.e. fbcon is quiet) we'd preserve the
original framebuffer throughout the boot-up sequence.

> +
> +	return 0;
> +}
> +
> +/*
> + * Init / Cleanup
> + */
> +
> +static void simplekms_device_cleanup(struct simplekms_device* sdev)
> +{
> +	struct drm_device *dev = &sdev->dev;
> +
> +	drm_dev_unregister(dev);

I'd inline this, I guess there was once more before you switched
everything over to devm_

> +}
> +
> +static struct simplekms_device *
> +simplekms_device_create(struct drm_driver *drv, struct platform_device *pdev)
> +{
> +	struct simplekms_device *sdev;
> +	int ret;
> +
> +	sdev = devm_drm_dev_alloc(&pdev->dev, drv, struct simplekms_device,
> +				  dev);
> +	if (IS_ERR(sdev))
> +		return ERR_CAST(sdev);
> +	sdev->pdev = pdev;
> +
> +	ret = simplekms_device_init_fb(sdev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +	ret = simplekms_device_init_mm(sdev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +	ret = simplekms_device_init_modeset(sdev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return sdev;
> +}
> +
> +/*
> + * DRM driver
> + */
> +
> +DEFINE_DRM_GEM_FOPS(simplekms_fops);
> +
> +static struct drm_driver simplekms_driver = {
> +	DRM_GEM_SHMEM_DRIVER_OPS,
> +	.name			= DRIVER_NAME,
> +	.desc			= DRIVER_DESC,
> +	.date			= DRIVER_DATE,
> +	.major			= DRIVER_MAJOR,
> +	.minor			= DRIVER_MINOR,
> +	.driver_features	= DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
> +	.fops			= &simplekms_fops,
> +};
> +
> +/*
> + * Platform driver
> + */
> +
> +static int simplekms_probe(struct platform_device *pdev)
> +{
> +	struct simplekms_device *sdev;
> +	struct drm_device *dev;
> +	int ret;
> +
> +	sdev = simplekms_device_create(&simplekms_driver, pdev);
> +	if (IS_ERR(sdev))
> +		return PTR_ERR(sdev);
> +	dev = &sdev->dev;
> +
> +	ret = drm_dev_register(dev, 0);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int simplekms_remove(struct platform_device *pdev)
> +{
> +	struct simplekms_device *sdev = platform_get_drvdata(pdev);
> +
> +	simplekms_device_cleanup(sdev);

If you add the ->disable hook then a comment here that we don't want to
shut down to allow fastboot would be nice.

> +
> +	return 0;
> +}
> +
> +static struct platform_driver simplekms_platform_driver = {
> +	.driver = {
> +		.name = "simple-framebuffer", /* connect to sysfb */
> +	},
> +	.probe = simplekms_probe,
> +	.remove = simplekms_remove,
> +};
> +
> +module_platform_driver(simplekms_platform_driver);
> +
> +MODULE_DESCRIPTION(DRIVER_DESC);
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.27.0
> 

Cheers, Daniel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
