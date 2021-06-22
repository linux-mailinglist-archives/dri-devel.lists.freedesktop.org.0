Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC763AFBA0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 06:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD546E161;
	Tue, 22 Jun 2021 04:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63896E161
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 04:10:44 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id d12so1447527pgd.9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 21:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5v4KFtqSZ9EZ4ACWSXEximwNK2Um/W7YtCh8sLOGaU8=;
 b=PMqRAl1IxFL+5gAIk8yEY0kg7tp2N+aBOznIzHV7apaGu06XRgh95VhZIP8KDvhUHg
 jQe3Q6eZWJswIuMesZbEeajY+owvwGTZ6lGM3Q39FUjs1CZvuQRexFykT/24IRLG1dHB
 8uXqKWqv+mcH73tZbcoiescKE69xM4laYTx4M3axNeM8r2EqpFMmGTlTPqtrVoOiid04
 2To/KlSgXYhPEh9hrNAGfgA0bd5VYfS0AzaPtYH7bQu6EJvF11zz4B8wGp98bFYF4bwP
 6PKUQyF00+aek79IpWD+95LwRBqrsFrf55jtqP3qit+wvd+Lm1H1v/6GFFHzCJ6FLF4r
 wo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5v4KFtqSZ9EZ4ACWSXEximwNK2Um/W7YtCh8sLOGaU8=;
 b=MbG0JOjRdfKcoBiGWEWbihIQCu1Nl4Fbl8FyXh61fzxxI1vPEtGzl49cBAK8pnzbiB
 TML0c+4XsaB70ma0spiCykXTcNLQQQE/vqt/WlqwMbRKHc1J5q+8yvi9FFMJnmgl1y4k
 1b/qH8uVpbcRDK3P+UHSi6DGCVRcmk25yqjQ27xCHF4rOQVcNULH0Zd2xiO1k+PS7cnU
 06FVWgwVFbOWetNgdbehyv1vWS2o4x3xybuSjyiWoRTCuTaNKt/he4pjh5D+UGJTcIfa
 QQapcc85OwR6qWUlfUshL8Aea/dfXM8LkeNtF7TGqku7ofsN7pyWyNxtFrWFUd3+LiL8
 ijwA==
X-Gm-Message-State: AOAM533cNPQzV5bc6kDGRXKqqjE0AAy9L9otYIUxf2N9WyWbjx8/9iBj
 B7Hduo/RPpHf9HZyiPHFgDdcrw==
X-Google-Smtp-Source: ABdhPJyoJrQgcdZKMFwZI28YBJzvGJPUBpKkGdLpgtFH0VQ0qiqJ/cLPtVfi2lkAPV/JDsiuoqzaTg==
X-Received: by 2002:a65:4c46:: with SMTP id l6mr1809454pgr.91.1624335044092;
 Mon, 21 Jun 2021 21:10:44 -0700 (PDT)
Received: from ?IPv6:240b:10:c9a0:ca00:5192:32ad:e5be:23cd?
 ([240b:10:c9a0:ca00:5192:32ad:e5be:23cd])
 by smtp.gmail.com with ESMTPSA id 136sm12226925pge.75.2021.06.21.21.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 21:10:43 -0700 (PDT)
Subject: Re: [PATH 1/4] drm: Add Virtual DRM device driver
To: Sam Ravnborg <sam@ravnborg.org>
References: <20210621064403.26663-1-etom@igel.co.jp>
 <20210621064403.26663-2-etom@igel.co.jp>
 <20210621155517.GB823900@ravnborg.org>
From: Esaki Tomohito <etom@igel.co.jp>
Message-ID: <38c87751-9aad-03bd-074a-c4c8c958cead@igel.co.jp>
Date: Tue, 22 Jun 2021 13:10:39 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210621155517.GB823900@ravnborg.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, Takanari Hayama <taki@igel.co.jp>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Sam

Thank you for looking at the details.
I will fix it according to your comment.

Best regards
Tomohito Esaki

On 2021/06/22 0:55, Sam Ravnborg wrote:
> Hi Tomohito
> 
> On Mon, Jun 21, 2021 at 03:44:00PM +0900, Tomohito Esaki wrote:
>> Virtual DRM splits the resources of an overlay plane into multiple
>> virtual devices to allow each plane to be accessed by each process.
>>
>> This makes it possible to overlay images output from multiple processes
>> on a display. For example, one process displays the camera image without
>> compositor while another process overlays the compositor's drawing of
>> the UI.
>>
>> The virtual DRM creates standalone virtual device and make DRM planes
>> from a master device (e.g. card0) accessible via one or more virtual
>> devices. However, these plane are no longer accessible from the original
>> device.
>> Each virtual device (and plane) can be accessed via a separate
>> device file.
>>
>> Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
>> ---
>>  drivers/gpu/drm/Kconfig         |   7 +
>>  drivers/gpu/drm/Makefile        |   1 +
>>  drivers/gpu/drm/vdrm/vdrm_api.h |  68 +++
>>  drivers/gpu/drm/vdrm/vdrm_drv.c | 859 ++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/vdrm/vdrm_drv.h |  80 +++
> 
> Plase consider making the header files self-contained.
> So there are no hdden dependencies between the two.
> 
> Use forward declarations rahter than including header files is possible.
> 
> A few trivial comments in the following. I did not try to follow all the
> functionality of the driver and I expect others to comment on the idea.
> 
> 	Sam
> 
>>  5 files changed, 1015 insertions(+)
>>  create mode 100644 drivers/gpu/drm/vdrm/vdrm_api.h
>>  create mode 100644 drivers/gpu/drm/vdrm/vdrm_drv.c
>>  create mode 100644 drivers/gpu/drm/vdrm/vdrm_drv.h
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 3c16bd1afd87..ba7f4eeab385 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -294,6 +294,13 @@ config DRM_VKMS
>>  
>>  	  If M is selected the module will be called vkms.
>>  
>> +config DRM_VDRM
>> +	tristate "Virtual DRM"
>> +	depends on DRM
>> +	help
>> +	  Virtual DRM splits the resources of an overlay plane into multiple
>> +	  virtual devices to allow each plane to be accessed by each process.
> Could you look into pulling a bit more info here. You made a very nice
> intro to the patch, consider using it in the help text too.
> 
> 
>> +
>>  source "drivers/gpu/drm/exynos/Kconfig"
>>  
>>  source "drivers/gpu/drm/rockchip/Kconfig"
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 5279db4392df..55dbf85e2579 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -82,6 +82,7 @@ obj-$(CONFIG_DRM_VMWGFX)+= vmwgfx/
>>  obj-$(CONFIG_DRM_VIA)	+=via/
>>  obj-$(CONFIG_DRM_VGEM)	+= vgem/
>>  obj-$(CONFIG_DRM_VKMS)	+= vkms/
>> +obj-$(CONFIG_DRM_VDRM)	+= vdrm/
> Alphabetic order (mostly) so before vgem/
> 
>>  obj-$(CONFIG_DRM_NOUVEAU) +=nouveau/
>>  obj-$(CONFIG_DRM_EXYNOS) +=exynos/
>>  obj-$(CONFIG_DRM_ROCKCHIP) +=rockchip/
>> diff --git a/drivers/gpu/drm/vdrm/vdrm_api.h b/drivers/gpu/drm/vdrm/vdrm_api.h
>> new file mode 100644
>> index 000000000000..dd4d7e774800
>> --- /dev/null
>> +++ b/drivers/gpu/drm/vdrm/vdrm_api.h
>> @@ -0,0 +1,68 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * vdrm_api.h -- Virtual DRM API
>> + *
>> + * Copyright (C) 2021 Renesas Electronics Corporation
>> + */
>> +
>> +#ifndef __VDRM_API__
>> +#define __VDRM_API__
>> +
>> +#include <linux/of_device.h>
>> +#include <drm/drm_crtc.h>
>> +
>> +/**
>> + * struct vdrm_property_info - Information about the properties passed from
>> + *			       the DRM driver to vDRM
>> + * @prop: Parent property to pass to vDRM
>> + * @default_val: Default value for the property passed to vDRM
>> + */
>> +struct vdrm_property_info {
>> +	struct drm_property *prop;
>> +	uint64_t default_val;
>> +};
> It would be nice that all structs used inline comments - and then you
> are consistent too.
> 
>> +
>> +/**
>> + * struct vdrm_funcs - Callbacks to parent DRM driver
>> + */
>> +struct vdrm_funcs {
>> +	/**
>> +	 * @dumb_create:
>> +	 *
>> +	 * Called by &drm_driver.dumb_create. Please read the documentation
>> +	 * for the &drm_driver.dumb_create hook for more details.
>> +	 */
>> +	int (*dumb_create)(struct drm_file *file, struct drm_device *dev,
>> +			   struct drm_mode_create_dumb *args);
>> +
>> +	/**
>> +	 * @crtc_flush:
>> +	 *
>> +	 * Called by &drm_crtc_helper_funcs.atomic_flush. Please read the
>> +	 * documentation for the &drm_crtc_helper_funcs.atomic_flush hook for
>> +	 * more details.
>> +	 */
>> +	void (*crtc_flush)(struct drm_crtc *crtc);
>> +};
>> +
>> +struct vdrm_device;
>> +struct vdrm_display;
>> +
>> +void vdrm_drv_handle_vblank(struct vdrm_display *vdisplay);
>> +void vdrm_drv_finish_page_flip(struct vdrm_display *vdisplay);
>> +struct vdrm_device *vdrm_drv_init(struct drm_device *dev,
>> +				  struct device_node *np, int num_props,
>> +				  struct vdrm_property_info *props,
>> +				  const struct vdrm_funcs *funcs);
>> +int vdrm_drv_plane_init(struct vdrm_device *vdrm, struct drm_plane *plane,
>> +			const struct drm_plane_funcs *funcs,
>> +			const struct drm_plane_helper_funcs *helper_funcs,
>> +			const u32 *formats, unsigned int num_formats,
>> +			int max_zpos);
>> +struct vdrm_display *vdrm_drv_display_init(struct vdrm_device *vdrm,
>> +					   struct drm_crtc *crtc,
>> +					   struct drm_plane *plane);
>> +int vdrm_drv_register(struct vdrm_device *vdrm);
>> +void vdrm_drv_fini(struct vdrm_device *vdrm);
>> +
>> +#endif /* __VDRM_API__ */
>> diff --git a/drivers/gpu/drm/vdrm/vdrm_drv.c b/drivers/gpu/drm/vdrm/vdrm_drv.c
>> new file mode 100644
>> index 000000000000..835bdecfc8e6
>> --- /dev/null
>> +++ b/drivers/gpu/drm/vdrm/vdrm_drv.c
>> @@ -0,0 +1,859 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * vdrm_drv.c -- Virtual DRM driver
>> + *
>> + * Copyright (C) 2021 Renesas Electronics Corporation
>> + *
>> + * This driver is based on drivers/gpu/drm/drm_simple_kms_helper.c.
>> + */
>> +
>> +#include <linux/of_device.h>
>> +#include <drm/drm_atomic.h>
>> +#include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_atomic_uapi.h>
>> +#include <drm/drm_fb_cma_helper.h>
>> +#include <drm/drm_fb_helper.h>
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_gem_cma_helper.h>
>> +#include <drm/drm_plane_helper.h>
>> +#include <drm/drm_probe_helper.h>
>> +#include <drm/drm_vblank.h>
>> +#include <drm/drm_gem_framebuffer_helper.h>
>> +#include <video/videomode.h>
>> +
>> +#include "vdrm_drv.h"
>> +
>> +static inline struct vdrm_display *
>> +to_vdrm_display(struct drm_connector *connector)
>> +{
>> +	return container_of(connector, struct vdrm_display, connector);
>> +}
>> +
>> +static inline struct vdrm_display *
>> +crtc_to_vdrm_display(struct drm_crtc *crtc)
>> +{
>> +	return container_of(crtc, struct vdrm_display, crtc);
>> +}
>> +
>> +static int vdrm_dumb_create(struct drm_file *file, struct drm_device *dev,
>> +			    struct drm_mode_create_dumb *args)
>> +{
>> +	struct vdrm_device *vdrm = to_vdrm_device(dev);
>> +
>> +	return vdrm->funcs->dumb_create(file, dev, args);
>> +}
>> +
>> +struct vdrm_framebuffer {
>> +	struct drm_framebuffer fb;
>> +	struct drm_framebuffer *parent_fb;
>> +};
>> +
>> +static inline struct vdrm_framebuffer *
>> +to_vdrm_framebuffer(struct drm_framebuffer *fb)
>> +{
>> +	return container_of(fb, struct vdrm_framebuffer, fb);
>> +}
>> +
>> +static void vdrm_fb_destroy(struct drm_framebuffer *fb)
>> +{
>> +	struct vdrm_framebuffer *vfb = to_vdrm_framebuffer(fb);
>> +
>> +	vfb->parent_fb->funcs->destroy(vfb->parent_fb);
>> +	drm_framebuffer_cleanup(fb);
>> +	kfree(vfb);
>> +}
>> +
>> +static const struct drm_framebuffer_funcs vdrm_fb_funcs = {
>> +	.destroy = vdrm_fb_destroy,
>> +};
>> +
>> +static int vdrm_fb_init(struct drm_device *dev, struct vdrm_framebuffer *vfb)
>> +{
>> +	vfb->fb = *vfb->parent_fb;
>> +	vfb->fb.dev = dev;
>> +
>> +	return drm_framebuffer_init(dev, &vfb->fb, &vdrm_fb_funcs);
>> +}
>> +
>> +static struct drm_framebuffer *
>> +vdrm_fb_create(struct drm_device *dev, struct drm_file *file_priv,
>> +	       const struct drm_mode_fb_cmd2 *mode_cmd)
>> +{
>> +	struct vdrm_device *vdrm = to_vdrm_device(dev);
>> +	const struct drm_mode_config_funcs *mode_config_funcs =
>> +		vdrm->parent->mode_config.funcs;
>> +	struct vdrm_framebuffer *vfb;
>> +	struct drm_framebuffer *fb;
>> +	int ret;
>> +
>> +	vfb = kzalloc(sizeof(*vfb), GFP_KERNEL);
>> +	if (!vfb)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	fb = mode_config_funcs->fb_create(vdrm->parent, file_priv, mode_cmd);
>> +	if (IS_ERR(fb)) {
>> +		kfree(vfb);
>> +		return fb;
>> +	}
>> +
>> +	vfb->parent_fb = fb;
>> +	ret = vdrm_fb_init(dev, vfb);
>> +	if (ret) {
>> +		fb->funcs->destroy(fb);
>> +		kfree(vfb);
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	return &vfb->fb;
>> +}
>> +
>> +static const struct drm_mode_config_funcs vdrm_mode_config_funcs = {
>> +	.fb_create = vdrm_fb_create,
>> +	.atomic_check = drm_atomic_helper_check,
>> +	.atomic_commit = drm_atomic_helper_commit,
>> +};
>> +
>> +static struct drm_display_mode *vdrm_create_mode(struct vdrm_display *disp)
>> +{
>> +	struct drm_display_mode *mode;
>> +	struct videomode videomode;
>> +
>> +	mode = drm_mode_create(&disp->dev->ddev);
>> +	if (!mode)
>> +		return NULL;
>> +
>> +	memset(&videomode, 0, sizeof(videomode));
>> +	videomode.hactive = disp->plane_info.width;
>> +	videomode.vactive = disp->plane_info.height;
>> +	videomode.pixelclock =
>> +		disp->parent_crtc->state->adjusted_mode.crtc_clock * 1000;
>> +	mode->type = DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER;
>> +	drm_display_mode_from_videomode(&videomode, mode);
>> +
> If you create a drm_display_mode here then you can loose the videomode
> dependency. And I do not need to tell you that a Kconfig dependency is missing
> to use videomode. Do not forget to drop the include.
> 
> 
>> +	return mode;
>> +}
>> +
>> +static int vdrm_connector_get_mode(struct drm_connector *connector)
>> +{
>> +	struct vdrm_display *disp = to_vdrm_display(connector);
>> +	struct drm_display_mode *mode = vdrm_create_mode(disp);
>> +
>> +	if (!mode)
>> +		return 0;
>> +
>> +	drm_mode_probed_add(connector, mode);
>> +	return 1;
>> +}
>> +
>> +static const struct drm_connector_helper_funcs vdrm_conn_helper_funcs = {
>> +	.get_modes = vdrm_connector_get_mode,
>> +};
>> +
>> +/*
>> + * TODO:
>> + *  At the time this callback is called, the parent CRTC must be connected.
>> + *  Since this callback will not be called when detect() callback of the
>> + *  parent connector is called, vDRM driver desn't support hotplug.
>> + *  In the future, it is necessary that hotplug is supported.
>> + */
>> +static enum drm_connector_status
>> +vdrm_connector_detect(struct drm_connector *connector, bool force)
>> +{
>> +	struct vdrm_display *disp = to_vdrm_display(connector);
>> +	struct vdrm_device *vdrm = to_vdrm_device(connector->dev);
>> +	struct drm_connector *conn;
>> +	struct drm_connector_list_iter conn_iter;
>> +
>> +	drm_connector_list_iter_begin(vdrm->parent, &conn_iter);
>> +	drm_for_each_connector_iter(conn, &conn_iter) {
>> +		if (!conn->state)
>> +			continue;
>> +
>> +		if (conn->state->crtc == disp->parent_crtc) {
>> +			drm_connector_list_iter_end(&conn_iter);
>> +			return connector_status_connected;
>> +		}
>> +	}
>> +	drm_connector_list_iter_end(&conn_iter);
>> +	return connector_status_disconnected;
>> +}
>> +
>> +static const struct drm_connector_funcs vdrm_conn_funcs = {
>> +	.reset = drm_atomic_helper_connector_reset,
>> +	.detect = vdrm_connector_detect,
>> +	.fill_modes = drm_helper_probe_single_connector_modes,
>> +	.destroy = drm_connector_cleanup,
>> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>> +};
>> +
>> +static void vdrm_drv_finish_page_flip_internal(struct vdrm_display *disp)
>> +{
>> +	struct drm_device *dev = &disp->dev->ddev;
>> +	struct drm_pending_vblank_event *event;
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&dev->event_lock, flags);
>> +	event = disp->event;
>> +	disp->event = NULL;
>> +	spin_unlock_irqrestore(&dev->event_lock, flags);
>> +
>> +	if (event == NULL)
>> +		return;
>> +
>> +	spin_lock_irqsave(&dev->event_lock, flags);
>> +	drm_crtc_send_vblank_event(&disp->crtc, event);
>> +	spin_unlock_irqrestore(&dev->event_lock, flags);
>> +
>> +	if (disp->vblank_count) {
>> +		drm_crtc_vblank_put(&disp->crtc);
>> +		disp->vblank_count--;
>> +	}
>> +}
>> +
>> +static void vdrm_plane_update(struct drm_plane *plane,
>> +			      struct drm_atomic_state *state)
>> +{
>> +	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state, plane);
>> +	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
>> +	struct drm_crtc *vcrtc_old_state = old_state->crtc;
>> +	struct drm_crtc *vcrtc_plane_state = new_state->crtc;
>> +	struct drm_crtc *crtc;
>> +	struct vdrm_display *vdisplay;
>> +
>> +	crtc = (old_state->crtc ? old_state->crtc : new_state->crtc);
>> +	if (WARN_ON(!crtc))
>> +		return;
>> +
>> +	vdisplay = crtc_to_vdrm_display(crtc);
>> +
>> +	old_state->crtc = vdisplay->parent_crtc;
>> +	new_state->crtc = vdisplay->parent_crtc;
>> +
>> +	new_state->dst.x1 += vdisplay->plane_info.x;
>> +	new_state->dst.y1 += vdisplay->plane_info.y;
>> +	vdisplay->parent_plane_helper_funcs->atomic_update(plane, state);
>> +
>> +	old_state->crtc = vcrtc_old_state;
>> +	new_state->crtc = vcrtc_plane_state;
>> +}
>> +
>> +static struct vdrm_display *
>> +vdrm_plane_find_display(struct vdrm_device *vdrm, struct drm_plane *plane)
>> +{
>> +	struct vdrm_display *disp;
>> +
>> +	list_for_each_entry(disp, &vdrm->disps, head) {
>> +		if (disp->plane == plane)
>> +			return disp;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static void vdrm_plane_reset(struct drm_plane *plane)
>> +{
>> +	struct vdrm_device *vdrm = to_vdrm_device(plane->dev);
>> +	struct vdrm_display *disp;
>> +
>> +	disp = vdrm_plane_find_display(vdrm, plane);
>> +	if (WARN_ON(!disp))
>> +		return;
>> +
>> +	disp->parent_plane_funcs->reset(plane);
>> +	plane->state->zpos = disp->plane_info.z;
>> +}
>> +
>> +static struct drm_property *
>> +vdrm_find_parent_property(struct vdrm_device *vdrm, struct drm_property *prop)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < vdrm->num_props; i++) {
>> +		if (vdrm->props[i].prop == prop)
>> +			return vdrm->props[i].parent_prop;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static int vdrm_plane_set_property(struct drm_plane *plane,
>> +				   struct drm_plane_state *state,
>> +				   struct drm_property *property,
>> +				   uint64_t val)
>> +{
>> +	struct vdrm_device *vdrm = to_vdrm_device(plane->dev);
>> +	struct vdrm_display *disp;
>> +	struct drm_property *parent_prop;
>> +
>> +	disp = vdrm_plane_find_display(vdrm, plane);
>> +	if (WARN_ON(!disp))
>> +		return -EINVAL;
>> +
>> +	parent_prop = vdrm_find_parent_property(vdrm, property);
>> +	if (parent_prop && disp->parent_plane_funcs->atomic_set_property)
>> +		return disp->parent_plane_funcs->atomic_set_property(plane,
>> +								state,
>> +								parent_prop,
>> +								val);
>> +
>> +	if (vdrm->plane_props.offset_x == property) {
>> +		if (val > disp->parent_crtc->mode.hdisplay)
>> +			return -EINVAL;
>> +		disp->plane_info.x = val;
>> +	} else if (vdrm->plane_props.offset_y == property) {
>> +		if (val > disp->parent_crtc->mode.vdisplay)
>> +			return -EINVAL;
>> +		disp->plane_info.y = val;
>> +	} else if (vdrm->plane_props.width == property) {
>> +		if (val > disp->parent_crtc->mode.hdisplay)
>> +			return -EINVAL;
>> +		disp->plane_info.width = val;
>> +	} else if (vdrm->plane_props.height == property) {
>> +		if (val > disp->parent_crtc->mode.vdisplay)
>> +			return -EINVAL;
>> +		disp->plane_info.height = val;
>> +	} else {
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int vdrm_plane_get_property(struct drm_plane *plane,
>> +				   const struct drm_plane_state *state,
>> +				   struct drm_property *property,
>> +				   uint64_t *val)
>> +{
>> +	struct vdrm_device *vdrm = to_vdrm_device(plane->dev);
>> +	struct vdrm_display *disp;
>> +	struct drm_property *parent_prop;
>> +
>> +	disp = vdrm_plane_find_display(vdrm, plane);
>> +	if (WARN_ON(!disp))
>> +		return -EINVAL;
>> +
>> +	parent_prop = vdrm_find_parent_property(vdrm, property);
>> +	if (parent_prop && disp->parent_plane_funcs->atomic_get_property)
>> +		return disp->parent_plane_funcs->atomic_get_property(plane,
>> +								state,
>> +								parent_prop,
>> +								val);
>> +
>> +	if (vdrm->plane_props.offset_x == property)
>> +		*val = disp->plane_info.x;
>> +	else if (vdrm->plane_props.offset_y == property)
>> +		*val = disp->plane_info.y;
>> +	else if (vdrm->plane_props.width == property)
>> +		*val = disp->plane_info.width;
>> +	else if (vdrm->plane_props.height == property)
>> +		*val = disp->plane_info.height;
>> +	else
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
>> +
>> +static int vdrm_crtc_check(struct drm_crtc *crtc,
>> +			   struct drm_atomic_state *state)
>> +{
>> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
>> +									  crtc);
>> +	bool has_primary = crtc_state->plane_mask &
>> +				drm_plane_mask(crtc->primary);
>> +
>> +	/* We always want to have an active plane with an active CRTC */
>> +	if (has_primary != crtc_state->enable)
>> +		return -EINVAL;
>> +
>> +	return drm_atomic_add_affected_planes(state, crtc);
>> +}
>> +
>> +static void vdrm_crtc_flush(struct drm_crtc *crtc,
>> +			    struct drm_atomic_state *state)
>> +{
>> +	struct vdrm_display *disp = crtc_to_vdrm_display(crtc);
>> +	struct vdrm_device *vdrm = disp->dev;
>> +
>> +	if (crtc->state->event) {
>> +		struct drm_device *dev = crtc->dev;
>> +		unsigned long flags;
>> +
>> +		if (disp->crtc_enabled) {
>> +			WARN_ON(drm_crtc_vblank_get(crtc) != 0);
>> +			disp->vblank_count++;
>> +		}
>> +
>> +		spin_lock_irqsave(&dev->event_lock, flags);
>> +		disp->event = crtc->state->event;
>> +		crtc->state->event = NULL;
>> +		spin_unlock_irqrestore(&dev->event_lock, flags);
>> +	}
>> +
>> +	if (vdrm->funcs->crtc_flush)
>> +		vdrm->funcs->crtc_flush(disp->parent_crtc);
>> +}
>> +
>> +static void vdrm_crtc_enable(struct drm_crtc *crtc,
>> +			     struct drm_atomic_state *state)
>> +{
>> +	struct vdrm_display *disp = crtc_to_vdrm_display(crtc);
>> +
>> +	drm_crtc_vblank_on(crtc);
>> +	disp->crtc_enabled = true;
>> +}
>> +
>> +static void vdrm_crtc_disable(struct drm_crtc *crtc,
>> +			      struct drm_atomic_state *state)
>> +{
>> +	struct vdrm_display *disp = crtc_to_vdrm_display(crtc);
>> +	unsigned long flags;
>> +	bool pending;
>> +
>> +	disp->crtc_enabled = false;
>> +	drm_crtc_vblank_off(crtc);
>> +
>> +	spin_lock_irqsave(&crtc->dev->event_lock, flags);
>> +	pending = disp->event != NULL;
>> +	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
>> +
>> +	if (!wait_event_timeout(disp->flip_wait, !pending,
>> +				msecs_to_jiffies(50))) {
>> +		DRM_WARN("VDRM: page flip timeout\n");
>> +		vdrm_drv_finish_page_flip_internal(disp);
>> +	}
>> +
>> +	spin_lock_irq(&crtc->dev->event_lock);
>> +	if (crtc->state->event) {
>> +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
>> +		crtc->state->event = NULL;
>> +	}
>> +	spin_unlock_irq(&crtc->dev->event_lock);
>> +}
>> +
>> +static const struct drm_crtc_helper_funcs vdrm_crtc_helper_funcs = {
>> +	.atomic_check = vdrm_crtc_check,
>> +	.atomic_flush = vdrm_crtc_flush,
>> +	.atomic_enable = vdrm_crtc_enable,
>> +	.atomic_disable = vdrm_crtc_disable,
>> +};
>> +
>> +static int vdrm_crtc_enable_vblank(struct drm_crtc *crtc)
>> +{
>> +	struct vdrm_display *disp;
>> +
>> +	disp = crtc_to_vdrm_display(crtc);
>> +	disp->vblank_enabled = true;
>> +
>> +	return 0;
>> +}
>> +
>> +static void vdrm_crtc_disable_vblank(struct drm_crtc *crtc)
>> +{
>> +	struct vdrm_display *disp;
>> +
>> +	disp = crtc_to_vdrm_display(crtc);
>> +	disp->vblank_enabled = false;
>> +}
>> +
>> +static const struct drm_crtc_funcs vdrm_crtc_funcs = {
>> +	.reset = drm_atomic_helper_crtc_reset,
>> +	.destroy = drm_crtc_cleanup,
>> +	.set_config = drm_atomic_helper_set_config,
>> +	.page_flip = drm_atomic_helper_page_flip,
>> +	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
>> +	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
>> +	.enable_vblank = vdrm_crtc_enable_vblank,
>> +	.disable_vblank = vdrm_crtc_disable_vblank,
>> +};
>> +static const struct drm_encoder_funcs vdrm_encoder_funcs = {
>> +	.destroy = drm_encoder_cleanup,
>> +};
>> +
>> +static int vdrm_properties_init(struct vdrm_device *vdrm, int num_props,
>> +				struct vdrm_property_info *props)
>> +{
>> +	int i;
>> +	unsigned int w = vdrm->ddev.mode_config.max_width;
>> +	unsigned int h = vdrm->ddev.mode_config.max_height;
>> +
>> +	vdrm->plane_props.offset_x =
>> +		drm_property_create_range(&vdrm->ddev, 0, "vdrm_offset_x", 0, w);
>> +	if (!vdrm->plane_props.offset_x)
>> +		return -1;
>> +	vdrm->plane_props.offset_y =
>> +		drm_property_create_range(&vdrm->ddev, 0, "vdrm_offset_y", 0, h);
>> +	if (!vdrm->plane_props.offset_y)
>> +		return -1;
>> +	vdrm->plane_props.width =
>> +		drm_property_create_range(&vdrm->ddev, 0, "vdrm_width", 1, w);
>> +	if (!vdrm->plane_props.width)
>> +		return -1;
>> +	vdrm->plane_props.height =
>> +		drm_property_create_range(&vdrm->ddev, 0, "vdrm_height", 1, h);
>> +	if (!vdrm->plane_props.height)
>> +		return -1;
>> +
>> +	if (num_props == 0)
>> +		return 0;
>> +
>> +	vdrm->props = devm_kzalloc(vdrm->parent->dev,
>> +				    sizeof(*vdrm->props) * num_props,
>> +				    GFP_KERNEL);
>> +	if (!vdrm->props)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < num_props; i++) {
>> +		struct drm_property *p = props[i].prop;
>> +
>> +		vdrm->props[i].prop =
>> +			drm_property_create_range(&vdrm->ddev, p->flags,
>> +						  p->name, p->values[0],
>> +						  p->values[1]);
>> +		if (!vdrm->props[i].prop)
>> +			goto err;
>> +
>> +		vdrm->props[i].parent_prop = p;
>> +		vdrm->props[i].default_val = props[i].default_val;
>> +	}
>> +	vdrm->num_props = num_props;
>> +
>> +	return 0;
>> +
>> +err:
>> +	for (i--; i >= 0; i--)
>> +		drm_property_destroy(&vdrm->ddev, vdrm->props[i].prop);
>> +	devm_kfree(vdrm->parent->dev, vdrm->props);
>> +	return -1;
>> +}
>> +
>> +static int vdrm_of_get_plane(struct device_node *np,
>> +			     int *x, int *y, int *width, int *height, int *z)
>> +{
>> +	struct device_node *child;
>> +	int ret;
>> +
>> +	child = of_get_next_child(np, NULL);
>> +	if (!child)
>> +		return -ENODEV;
>> +
>> +	ret = of_property_read_u32(child, "x", x);
>> +	ret |= of_property_read_u32(child, "y", y);
>> +	ret |= of_property_read_u32(child, "width", width);
>> +	ret |= of_property_read_u32(child, "height", height);
>> +	ret |= of_property_read_u32(child, "zpos", z);
>> +
>> +	of_node_put(child);
>> +	return ret;
>> +}
>> +
>> +static void vdrm_dump(struct vdrm_device *vdrm)
>> +{
>> +	struct vdrm_display *disp;
>> +
>> +	DRM_INFO("Virtual DRM Info:\n");
>> +	list_for_each_entry(disp, &vdrm->disps, head) {
>> +		DRM_INFO("\tCONNECTOR: %d\n",
>> +			 disp->connector.base.id);
>> +		DRM_INFO("\tCRTC: %d\n",
>> +			 disp->crtc.base.id);
>> +		DRM_INFO("\tENCODER: %d\n",
>> +			 disp->encoder.base.id);
>> +		DRM_INFO("\tPLANE: %d\n",
>> +			 disp->plane->base.id);
>> +		DRM_INFO("\tParent CRTC: %d\n",
>> +			 disp->parent_crtc->base.id);
>> +	}
>> +}
>> +
>> +/**
>> + * vdrm_drv_handle_vblank - handle a vblank event for vDRM
>> + * @vdisplay: vDRM display object
>> + */
>> +void vdrm_drv_handle_vblank(struct vdrm_display *vdisplay)
>> +{
>> +	if (vdisplay->vblank_enabled)
>> +		drm_crtc_handle_vblank(&vdisplay->crtc);
>> +}
>> +
>> +/**
>> + * vdrm_drv_finish_page_flip - handle a page flip event for vDRM
>> + * @vdisplay: vDRM display object
>> + */
>> +void vdrm_drv_finish_page_flip(struct vdrm_display *vdisplay)
>> +{
>> +	vdrm_drv_finish_page_flip_internal(vdisplay);
>> +}
>> +
>> +DEFINE_DRM_GEM_CMA_FOPS(vdrm_fops);
>> +
>> +static struct drm_driver vdrm_driver = {
>> +	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>> +	.dumb_create = vdrm_dumb_create,
>> +	.fops = &vdrm_fops,
>> +	.name = "virt-drm",
>> +	.desc = "Virtual DRM driver",
>> +	.date = "20201104",
>> +	.major = 1,
>> +	.minor = 0,
>> +};
>> +
>> +/**
>> + * vdrm_drv_init - Initialize vDRM device
>> + * @dev: parent DRM device
>> + * @np: vDRM device node in DTB
>> + * @num_props: number of parent property objects
>> + * @props: parent plane properties used in vDRM
>> + * @funcs: callbacks for vDRM
>> + *
>> + * Allocates a new vDRM device, initializes mode_config of the vDRM device
>> + * and allocates property objects. Not initialize plane, crtc, encoder and
>> + * connector. Initialization of plane must be done in vdrm_drv_plane_init()
>> + * and initialization of crtc, encoder and connector must be done by
>> + * vdrm_drv_display_init(). Also, after initializing the plane, crtc,
>> + * connector, and encoder, register vDRM device must be done by
>> + * vdrm_drv_register().
>> + *
>> + * Returns:
>> + * vDRM object (&vdrm_device) on success, error code encoded into the pointer
>> + * on failure.
>> + */
>> +struct vdrm_device *vdrm_drv_init(struct drm_device *dev,
>> +				  struct device_node *np, int num_props,
>> +				  struct vdrm_property_info *props,
>> +				  const struct vdrm_funcs *funcs)
>> +{
>> +	struct vdrm_device *vdrm;
>> +	struct vdrm_plane_info plane_info;
>> +	int ret;
>> +
>> +	if (!of_device_is_compatible(np, "virt-drm"))
>> +		return ERR_PTR(-ENODEV);
>> +
>> +	/* get plane information from device tree */
>> +	ret = vdrm_of_get_plane(np, &plane_info.x, &plane_info.y,
>> +				&plane_info.width, &plane_info.height,
>> +				&plane_info.z);
>> +	if (ret < 0) {
>> +		DRM_WARN("VDRM: failed get plane node of %s\n",
>> +			 of_node_full_name(np));
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	vdrm_driver.prime_handle_to_fd = dev->driver->prime_handle_to_fd;
>> +	vdrm_driver.prime_fd_to_handle = dev->driver->prime_fd_to_handle;
>> +	vdrm_driver.gem_prime_import_sg_table =
>> +		dev->driver->gem_prime_import_sg_table;
>> +	vdrm_driver.gem_prime_mmap = dev->driver->gem_prime_mmap;
>> +
>> +	vdrm = devm_drm_dev_alloc(dev->dev, &vdrm_driver, struct vdrm_device,
>> +				  ddev);
>> +	if (IS_ERR(vdrm))
>> +		return vdrm;
>> +
>> +	vdrm->parent = dev;
>> +	vdrm->funcs = funcs;
>> +	vdrm->of_plane_info = plane_info;
>> +
>> +	INIT_LIST_HEAD(&vdrm->disps);
>> +
>> +	ret = drmm_mode_config_init(&vdrm->ddev);
>> +	if (ret)
>> +		goto failed;
>> +
>> +	vdrm->ddev.mode_config.min_width = 0;
>> +	vdrm->ddev.mode_config.min_height = 0;
>> +	vdrm->ddev.mode_config.max_width = 8190;
>> +	vdrm->ddev.mode_config.max_height = 8190;
>> +	vdrm->ddev.mode_config.normalize_zpos = true;
>> +	vdrm->ddev.mode_config.funcs = &vdrm_mode_config_funcs;
>> +
>> +	ret = vdrm_properties_init(vdrm, num_props, props);
>> +	if (ret < 0)
>> +		goto failed;
>> +
>> +	drm_dev_set_unique(&vdrm->ddev, of_node_full_name(np));
>> +	return vdrm;
>> +
>> +failed:
>> +	kfree(vdrm);
>> +	return ERR_PTR(ret);
>> +}
>> +
>> +/**
>> + * vdrm_drv_plane_init - Initialize the plane used by vDRM
>> + * @vdrm: vDRM object
>> + * @plane: plane to assign to vDRM
>> + * @funcs: callbacks for the plane
>> + * @helper_funcs: helper vtable to set for plane
>> + * @formats: color formats
>> + * @num_formats: number of color formats
>> + * @max_zpos: max value for zpos property of plane
>> + *
>> + * Initializes a plane object of PRIMARY type by drm_universal_plane_init()
>> + * and initializes @plane's properties. The property passed by vdrm_drv_init()
>> + * is set to @plane.
>> + *
>> + * Returns:
>> + * Zero on success, error code on failure.
>> + */
>> +int vdrm_drv_plane_init(struct vdrm_device *vdrm, struct drm_plane *plane,
>> +			const struct drm_plane_funcs *funcs,
>> +			const struct drm_plane_helper_funcs *helper_funcs,
>> +			const u32 *formats, unsigned int num_formats,
>> +			int max_zpos)
>> +{
>> +	struct vdrm_display *disp;
>> +	int i, ret;
>> +
>> +	disp = kzalloc(sizeof(*disp), GFP_KERNEL);
>> +	if (!disp)
>> +		return -ENOMEM;
>> +
>> +	disp->dev = vdrm;
>> +	disp->plane = plane;
>> +	disp->plane_info = vdrm->of_plane_info;
>> +
>> +	disp->parent_plane_funcs = funcs;
>> +	disp->parent_plane_helper_funcs = helper_funcs;
>> +	disp->plane_funcs = *funcs;
>> +	disp->plane_helper_funcs = *helper_funcs;
>> +
>> +	disp->plane_funcs.reset = vdrm_plane_reset;
>> +	disp->plane_funcs.atomic_set_property = vdrm_plane_set_property;
>> +	disp->plane_funcs.atomic_get_property = vdrm_plane_get_property;
>> +	disp->plane_helper_funcs.atomic_update = vdrm_plane_update;
>> +
>> +	drm_plane_helper_add(disp->plane, &disp->plane_helper_funcs);
>> +	ret = drm_universal_plane_init(&vdrm->ddev, plane, 0,
>> +				       &disp->plane_funcs, formats,
>> +				       num_formats, NULL,
>> +				       DRM_PLANE_TYPE_PRIMARY, NULL);
>> +	if (ret) {
>> +		kfree(disp);
>> +		return ret;
>> +	}
>> +
>> +	drm_plane_create_alpha_property(plane);
>> +	drm_plane_create_zpos_property(plane, disp->plane_info.z, 0, max_zpos);
>> +	drm_object_attach_property(&plane->base,
>> +				   vdrm->plane_props.offset_x,
>> +				   disp->plane_info.x);
>> +	drm_object_attach_property(&plane->base,
>> +				   vdrm->plane_props.offset_y,
>> +				   disp->plane_info.y);
>> +	drm_object_attach_property(&plane->base,
>> +				   vdrm->plane_props.width,
>> +				   disp->plane_info.width);
>> +	drm_object_attach_property(&plane->base,
>> +				   vdrm->plane_props.height,
>> +				   disp->plane_info.height);
>> +	for (i = 0; i < vdrm->num_props; i++) {
>> +		drm_object_attach_property(&plane->base,
>> +					   vdrm->props[i].prop,
>> +					   vdrm->props[i].default_val);
>> +	}
>> +
>> +	INIT_LIST_HEAD(&disp->head);
>> +	list_add_tail(&disp->head, &vdrm->disps);
>> +	vdrm->num_crtcs++;
>> +	return 0;
>> +}
>> +
>> +/**
>> + * vdrm_drv_display_init - Initialize the vDRM display object
>> + * @vdrm: vDRM object
>> + * @crtc: parent crtc to be linked with the vDRM crtc
>> + * @plane: plane assigned to vDRM
>> + *
>> + * Initializes crtc, connector and encorder, and links @crtc to crtc of vDRM.
>> + *
>> + * Returns:
>> + * vDRM display object on success, error code encoded into the pointer on
>> + * failure.
>> + */
>> +struct vdrm_display *vdrm_drv_display_init(struct vdrm_device *vdrm,
>> +					   struct drm_crtc *crtc,
>> +					   struct drm_plane *plane)
>> +{
>> +	struct vdrm_display *disp;
>> +	int ret;
>> +
>> +	disp = vdrm_plane_find_display(vdrm, plane);
>> +	if (!disp)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	drm_crtc_helper_add(&disp->crtc, &vdrm_crtc_helper_funcs);
>> +	ret = drm_crtc_init_with_planes(&vdrm->ddev, &disp->crtc, plane, NULL,
>> +					&vdrm_crtc_funcs, NULL);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	drm_connector_helper_add(&disp->connector, &vdrm_conn_helper_funcs);
>> +	ret = drm_connector_init(&vdrm->ddev, &disp->connector,
>> +				 &vdrm_conn_funcs, DRM_MODE_CONNECTOR_VIRTUAL);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	disp->encoder.possible_crtcs = drm_crtc_mask(&disp->crtc);
>> +	ret = drm_encoder_init(&vdrm->ddev, &disp->encoder, &vdrm_encoder_funcs,
>> +			       DRM_MODE_ENCODER_NONE, NULL);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	ret = drm_connector_attach_encoder(&disp->connector, &disp->encoder);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	init_waitqueue_head(&disp->flip_wait);
>> +	disp->parent_crtc = crtc;
>> +
>> +	return disp;
>> +}
>> +
>> +/**
>> + * vdrm_drv_register - Register vDRM device
>> + * @vdrm: vDRM object
>> + *
>> + * Returns:
>> + * Zero on success, error code on failure.
>> + */
>> +int vdrm_drv_register(struct vdrm_device *vdrm)
>> +{
>> +	int ret;
>> +	struct drm_device *dev = &vdrm->ddev;
>> +
>> +	ret = drm_vblank_init(dev, vdrm->num_crtcs);
>> +	if (ret)
>> +		return ret;
>> +
>> +	drm_mode_config_reset(dev);
>> +
>> +	ret = drm_dev_register(dev, 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dev->irq_enabled = true;
>> +
>> +	DRM_INFO("Virtual Device is initialized.\n");
>> +
>> +	vdrm_dump(vdrm);
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * vdrm_drv_fini - release vDRM resources
>> + * @vdrm: vDRM object
>> + */
>> +void vdrm_drv_fini(struct vdrm_device *vdrm)
>> +{
>> +	struct vdrm_display *disp;
>> +
>> +	if (vdrm->ddev.registered)
>> +		drm_dev_unregister(&vdrm->ddev);
>> +	drm_mode_config_cleanup(&vdrm->ddev);
>> +
>> +	list_for_each_entry(disp, &vdrm->disps, head)
>> +		kfree(disp);
>> +}
>> diff --git a/drivers/gpu/drm/vdrm/vdrm_drv.h b/drivers/gpu/drm/vdrm/vdrm_drv.h
>> new file mode 100644
>> index 000000000000..67b8e02efddf
>> --- /dev/null
>> +++ b/drivers/gpu/drm/vdrm/vdrm_drv.h
>> @@ -0,0 +1,80 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * vdrm_drv.h -- Virtual DRM driver
>> + *
>> + * Copyright (C) 2021 Renesas Electronics Corporation
>> + */
>> +
>> +#ifndef __VDRM_DRV_H__
>> +#define __VDRM_DRV_H__
>> +
>> +#include <drm/drm_device.h>
>> +
>> +#include "vdrm_api.h"
>> +
>> +struct vdrm_property {
>> +	struct drm_property *prop;
>> +	struct drm_property *parent_prop;
>> +	uint64_t default_val;
>> +};
>> +
>> +struct vdrm_plane_info {
>> +	int x;
>> +	int y;
>> +	unsigned int width;
>> +	unsigned int height;
>> +	unsigned int z;
>> +};
>> +
>> +struct vdrm_device;
>> +
>> +struct vdrm_display {
>> +	struct drm_connector connector;
>> +	struct drm_crtc crtc;
>> +	struct drm_crtc *parent_crtc;
>> +	struct drm_plane *plane;
>> +	struct drm_encoder encoder;
>> +	struct drm_pending_vblank_event *event;
>> +	struct vdrm_device *dev;
>> +	bool vblank_enabled;
>> +	wait_queue_head_t flip_wait;
>> +	bool crtc_enabled;
>> +	int vblank_count;
>> +
>> +	struct list_head head;
>> +
>> +	struct vdrm_plane_info plane_info;
>> +
>> +	const struct drm_plane_funcs *parent_plane_funcs;
>> +	const struct drm_plane_helper_funcs *parent_plane_helper_funcs;
>> +	struct drm_plane_funcs plane_funcs;
>> +	struct drm_plane_helper_funcs plane_helper_funcs;
>> +};
>> +
>> +struct vdrm_device {
>> +	struct drm_device ddev;
>> +	struct drm_device *parent;
>> +
>> +	int num_crtcs;
>> +	struct list_head disps;
>> +
>> +	const struct vdrm_funcs *funcs;
>> +	struct vdrm_property *props;
>> +	int num_props;
>> +
>> +	struct {
>> +		struct drm_property *offset_x;
>> +		struct drm_property *offset_y;
>> +		struct drm_property *width;
>> +		struct drm_property *height;
>> +	} plane_props;
>> +
>> +	struct vdrm_plane_info of_plane_info;
>> +};
>> +
>> +static inline struct vdrm_device *to_vdrm_device(struct drm_device *dev)
>> +{
>> +	return container_of(dev, struct vdrm_device, ddev);
>> +}
>> +
>> +#endif /* __VDRM_DRV_H__ */
>> -- 
>> 2.25.1
