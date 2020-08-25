Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE53251C87
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 17:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36A76E935;
	Tue, 25 Aug 2020 15:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E243A6E53C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 15:45:25 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id q14so2076277wrn.9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 08:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eJJBgzJDJvwhVGrYOx2wvKPvHwfqjhfh0K3W6UUwt+g=;
 b=fB3h1DD3Tmcg5Mk6VKjyaCpYkm2BxWSv8yz/h2Fazb5K8M3Sd0jnV3KK13lCbYfOa6
 vjwm1HoVwWRhzPv6ZgoCgbQAZbUoSGX+klVVl9ZrozMjmqRQ80MxJ3hhB5dyfuCEzIYg
 6AnMCTAcAj1cTtah/MJB4ytfm1vN6fD/zC78g7FxfYOvs4Z+Ye2YM220LsZ8ytIXqdhk
 o8/rqmtuzwFiWDJkiia0dDxY7wHrlMrd+7zDVsJo4E0oGMa+fP7WxqONaj2iMcgq3E0p
 IExW63Y3dpbse8pqYVi87EDRxGxxtJl2EfVoJnLw9I4siVCAhJ1NtD4Z0Uzh+o60uOrI
 h93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eJJBgzJDJvwhVGrYOx2wvKPvHwfqjhfh0K3W6UUwt+g=;
 b=dnrR6VdCrVUqPIYaryg81uB4mJSAuuYcmmJaiji4zRa0bsaChqMMvZ3S0OjuBBrmJB
 jFuvn7KcYjW4zmwRugSI42C5c7SvTFWDLQVdGTq9QTH5uQ4pbroIBegKxGDRocKa3zmM
 IebnaaE5A6y12925q4CPkJcdQGpvLf7VpSGsmxMb2pwYXHAbQplNII7TAWKzNENnwthC
 1ozrt/cy20g+vX58FipSyRd/iQ5ScVQSYuoCF3FZYSTbayHQe9iWjVnsapyJUa+YDbIO
 B7KPHHwRdIWltXIlmnyvp+joECWiuN/hyi9xFvMTYp0U5sftPEX+QLxxHx0qOAm89wTl
 HE1g==
X-Gm-Message-State: AOAM533CrGmZ1/PvXMuxv5jg3MVtdB3zvI1cC61CHrNC4E2I7rAC+v9E
 1FFqe0FPdLOYVYJiXxN7Xco=
X-Google-Smtp-Source: ABdhPJyPq0JF9/8/fhOANmrMrgOJJIi/UxAlP8pViXWdBxDdDpqC1/Ss3CH5NjOcicTbQmXglofJfw==
X-Received: by 2002:adf:e486:: with SMTP id i6mr11055951wrm.258.1598370324550; 
 Tue, 25 Aug 2020 08:45:24 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id o2sm29991783wrj.21.2020.08.25.08.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 08:45:24 -0700 (PDT)
Date: Tue, 25 Aug 2020 12:45:17 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: Re: [PATCH v5 3/3] drm/vkms: Add support for writeback
Message-ID: <20200825154517.qjsfcl72udmmz7ib@smtp.gmail.com>
References: <20200825023142.2561220-1-rodrigosiqueiramelo@gmail.com>
 <20200825023142.2561220-4-rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825023142.2561220-4-rodrigosiqueiramelo@gmail.com>
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
Cc: daniels@collabora.com, Liviu Dudau <liviu.dudau@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/24, Rodrigo Siqueira wrote:
> This patch implements the necessary functions to add writeback support
> for vkms. This feature is useful for testing compositors if you don't
> have hardware with writeback support.
> 
> Change in V4 (Emil and Melissa):
> - Move signal completion above drm_crtc_add_crc_entry()
> - Make writeback always available
> - Use appropriate namespace
> - Drop fb check in vkms_wb_atomic_commit
> - Make vkms_set_composer visible for writeback code
> - Enable composer operation on prepare_job and disable it on cleanup_job
> 
> Change in V3 (Daniel):
> - If writeback is enabled, compose everything into the writeback buffer
> instead of CRC private buffer
> - Guarantees that the CRC will match exactly what we have in the
> writeback buffer.
> 
> Change in V2:
> - Rework signal completion (Brian)
> - Integrates writeback with active_planes (Daniel)
> - Compose cursor (Daniel)
> 
> Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> ---
>  drivers/gpu/drm/vkms/Makefile         |   9 +-
>  drivers/gpu/drm/vkms/vkms_composer.c  |  21 +++-
>  drivers/gpu/drm/vkms/vkms_drv.h       |  11 +-
>  drivers/gpu/drm/vkms/vkms_output.c    |   4 +
>  drivers/gpu/drm/vkms/vkms_writeback.c | 143 ++++++++++++++++++++++++++
>  5 files changed, 181 insertions(+), 7 deletions(-)
>  create mode 100644 drivers/gpu/drm/vkms/vkms_writeback.c
> 
> diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
> index 0b767d7efa24..333d3cead0e3 100644
> --- a/drivers/gpu/drm/vkms/Makefile
> +++ b/drivers/gpu/drm/vkms/Makefile
> @@ -1,4 +1,11 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -vkms-y := vkms_drv.o vkms_plane.o vkms_output.o vkms_crtc.o vkms_gem.o vkms_composer.o
> +vkms-y := \
> +	vkms_drv.o \
> +	vkms_plane.o \
> +	vkms_output.o \
> +	vkms_crtc.o \
> +	vkms_gem.o \
> +	vkms_composer.o \
> +	vkms_writeback.o
>  
>  obj-$(CONFIG_DRM_VKMS) += vkms.o
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 387b0690a64a..656085c4ebf3 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -163,16 +163,17 @@ void vkms_composer_worker(struct work_struct *work)
>  	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
>  	struct vkms_composer *primary_composer = NULL;
>  	struct vkms_composer *cursor_composer = NULL;
> +	bool crc_pending, wb_pending;
>  	void *vaddr_out = NULL;
>  	u32 crc32 = 0;
>  	u64 frame_start, frame_end;
> -	bool crc_pending;
>  	int ret;
>  
>  	spin_lock_irq(&out->composer_lock);
>  	frame_start = crtc_state->frame_start;
>  	frame_end = crtc_state->frame_end;
>  	crc_pending = crtc_state->crc_pending;
> +	wb_pending = crtc_state->wb_pending;
>  	crtc_state->frame_start = 0;
>  	crtc_state->frame_end = 0;
>  	crtc_state->crc_pending = false;
> @@ -194,22 +195,32 @@ void vkms_composer_worker(struct work_struct *work)
>  	if (!primary_composer)
>  		return;
>  
> +	if (wb_pending)
> +		vaddr_out = crtc_state->active_writeback;
> +
>  	ret = compose_planes(&vaddr_out, primary_composer, cursor_composer);
>  	if (ret) {
> -		if (ret == -EINVAL)
> +		if (ret == -EINVAL && !wb_pending)
>  			kfree(vaddr_out);
>  		return;
>  	}
>  
>  	crc32 = compute_crc(vaddr_out, primary_composer);
>  
> +	if (wb_pending) {
> +		drm_writeback_signal_completion(&out->wb_connector, 0);
> +		spin_lock_irq(&out->composer_lock);
> +		crtc_state->wb_pending = false;
> +		spin_unlock_irq(&out->composer_lock);
> +	} else {
> +		kfree(vaddr_out);
> +	}
> +
>  	/*
>  	 * The worker can fall behind the vblank hrtimer, make sure we catch up.
>  	 */
>  	while (frame_start <= frame_end)
>  		drm_crtc_add_crc_entry(crtc, true, frame_start++, &crc32);
> -
> -	kfree(vaddr_out);
>  }
>  
>  static const char * const pipe_crc_sources[] = {"auto"};
> @@ -252,7 +263,7 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *src_name,
>  	return 0;
>  }
>  
> -static void vkms_set_composer(struct vkms_output *out, bool enabled)
> +void vkms_set_composer(struct vkms_output *out, bool enabled)
>  {
>  	bool old_enabled;
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index f4036bb0b9a8..641d8bc52a3a 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -8,6 +8,7 @@
>  #include <drm/drm.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_encoder.h>
> +#include <drm/drm_writeback.h>
>  
>  #define XRES_MIN    20
>  #define YRES_MIN    20
> @@ -19,6 +20,7 @@
>  #define YRES_MAX  8192
>  
>  extern bool enable_cursor;
> +extern bool enable_writeback;
>  
>  struct vkms_composer {
>  	struct drm_framebuffer fb;
> @@ -52,9 +54,11 @@ struct vkms_crtc_state {
>  	int num_active_planes;
>  	/* stack of active planes for crc computation, should be in z order */
>  	struct vkms_plane_state **active_planes;
> +	void *active_writeback;
>  
> -	/* below three are protected by vkms_output.composer_lock */
> +	/* below four are protected by vkms_output.composer_lock */
>  	bool crc_pending;
> +	bool wb_pending;
>  	u64 frame_start;
>  	u64 frame_end;
>  };
> @@ -63,6 +67,7 @@ struct vkms_output {
>  	struct drm_crtc crtc;
>  	struct drm_encoder encoder;
>  	struct drm_connector connector;
> +	struct drm_writeback_connector wb_connector;
>  	struct hrtimer vblank_hrtimer;
>  	ktime_t period_ns;
>  	struct drm_pending_vblank_event *event;
> @@ -143,5 +148,9 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
>  
>  /* Composer Support */
>  void vkms_composer_worker(struct work_struct *work);
> +void vkms_set_composer(struct vkms_output *out, bool enabled);
> +
> +/* Writeback */
> +int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
>  
>  #endif /* _VKMS_DRV_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 85afb77e97f0..4a1848b0318f 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -80,6 +80,10 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  		goto err_attach;
>  	}
>  
> +	ret = vkms_enable_writeback_connector(vkmsdev);
> +	if (ret)
> +		DRM_ERROR("Failed to init writeback connector\n");
> +
>  	drm_mode_config_reset(dev);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> new file mode 100644
> index 000000000000..ddcd5ad0d7aa
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -0,0 +1,143 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +#include "vkms_drv.h"
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_writeback.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +
> +static const u32 vkms_wb_formats[] = {
> +	DRM_FORMAT_XRGB8888,
> +};
> +
> +static const struct drm_connector_funcs vkms_wb_connector_funcs = {
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.reset = drm_atomic_helper_connector_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state)
> +{
> +	struct drm_framebuffer *fb;
> +	const struct drm_display_mode *mode = &crtc_state->mode;
> +
> +	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
> +		return 0;
> +
> +	fb = conn_state->writeback_job->fb;
> +	if (fb->width != mode->hdisplay || fb->height != mode->vdisplay) {
> +		DRM_DEBUG_KMS("Invalid framebuffer size %ux%u\n",
> +			      fb->width, fb->height);
> +		return -EINVAL;
> +	}
> +
> +	if (fb->format->format != vkms_wb_formats[0]) {
> +		struct drm_format_name_buf format_name;
> +
> +		DRM_DEBUG_KMS("Invalid pixel format %s\n",
> +			      drm_get_format_name(fb->format->format,
> +						  &format_name));
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct drm_encoder_helper_funcs vkms_wb_encoder_helper_funcs = {
> +	.atomic_check = vkms_wb_encoder_atomic_check,
> +};
> +
> +static int vkms_wb_connector_get_modes(struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +
> +	return drm_add_modes_noedid(connector, dev->mode_config.max_width,
> +				    dev->mode_config.max_height);
> +}
> +
> +static int vkms_wb_prepare_job(struct drm_writeback_connector *wb_connector,
> +			       struct drm_writeback_job *job)
> +{
> +	struct vkms_gem_object *vkms_obj;
> +	struct drm_gem_object *gem_obj;
> +	int ret;
> +
> +	if (!job->fb)
> +		return 0;
> +
> +	gem_obj = drm_gem_fb_get_obj(job->fb, 0);
> +	ret = vkms_gem_vmap(gem_obj);
> +	if (ret) {
> +		DRM_ERROR("vmap failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	vkms_obj = drm_gem_to_vkms_gem(gem_obj);
> +	job->priv = vkms_obj->vaddr;
> +
> +	return 0;
> +}
> +
> +static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
> +				struct drm_writeback_job *job)
> +{
> +	struct drm_gem_object *gem_obj;
> +	struct vkms_device *vkmsdev;
> +
> +	if (!job->fb)
> +		return;
> +
> +	gem_obj = drm_gem_fb_get_obj(job->fb, 0);
> +	vkms_gem_vunmap(gem_obj);
> +
> +	vkmsdev = drm_device_to_vkms_device(gem_obj->dev);
> +	vkms_set_composer(&vkmsdev->output, false);
> +}
> +
> +static void vkms_wb_atomic_commit(struct drm_connector *conn,
> +				  struct drm_connector_state *state)
> +{
> +	struct vkms_device *vkmsdev = drm_device_to_vkms_device(conn->dev);
> +	struct vkms_output *output = &vkmsdev->output;
> +	struct drm_writeback_connector *wb_conn = &output->wb_connector;
> +	struct drm_connector_state *conn_state = wb_conn->base.state;
> +	struct vkms_crtc_state *crtc_state = output->composer_state;
> +
> +	if (!conn_state)
> +		return;
> +
> +	vkms_set_composer(&vkmsdev->output, true);
> +
> +	spin_lock_irq(&output->composer_lock);
> +	crtc_state->active_writeback = conn_state->writeback_job->priv;
> +	crtc_state->wb_pending = true;
> +	spin_unlock_irq(&output->composer_lock);
> +	drm_writeback_queue_job(wb_conn, state);
> +}
> +
> +static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
> +	.get_modes = vkms_wb_connector_get_modes,
> +	.prepare_writeback_job = vkms_wb_prepare_job,
> +	.cleanup_writeback_job = vkms_wb_cleanup_job,
> +	.atomic_commit = vkms_wb_atomic_commit,
> +};
> +
> +int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
> +{
> +	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
> +
> +	vkmsdev->output.wb_connector.encoder.possible_crtcs = 1;
> +	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
> +
> +	return drm_writeback_connector_init(&vkmsdev->drm, wb,
> +					    &vkms_wb_connector_funcs,
> +					    &vkms_wb_encoder_helper_funcs,
> +					    vkms_wb_formats,
> +					    ARRAY_SIZE(vkms_wb_formats));
> +}
> +
Another small fix: there is an extra line above.
> -- 
> 2.28.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
