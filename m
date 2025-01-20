Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F36AA17017
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 17:24:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1D110E43E;
	Mon, 20 Jan 2025 16:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="axtSXSxR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A8510E43E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 16:24:32 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-38be3bfb045so3512797f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 08:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737390211; x=1737995011; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O/8/9MoqMuPyTG7pMFvJjVYykG16SlEX1i5W0aG30EM=;
 b=axtSXSxRVzKxkGkRqkXzK872GtlTORejVPbZSDomS/B9C7YKl0u7cQhNhrXkD3Iacy
 br+7KEsF/SOVRz/LPmTLSny905IKEOpyzxPzD4RGg71r7vOuy2NQxSz9ndN9CMDTDEPJ
 ydy5RISPIJRLNkk2w0NZ8aLdyuJupOItMEe/5m6dGVqHD5zCK0UWrDynGHVo9lz2E/P+
 vKseQGPvstRbihaJ9QNPheOTaO7JhzvXCe18OfeU7kj7bCDJ2DDlG+vBN7WAq7B5JxUb
 u4b0A2/z5RcGd/n0YaRGKwGMNO6dXBed4X63NRu3d59xhRljqcYkTwmg79pXVblbzi6e
 TwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737390211; x=1737995011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O/8/9MoqMuPyTG7pMFvJjVYykG16SlEX1i5W0aG30EM=;
 b=AgdpYP+rfesWEFfZhD7HYPWY4VksoDPjHlZVXxyy4mDAy15EdGto8U9cjhjxhbnAG6
 CWAQEhQAs84utVbdIvQ+pFUJtt5r+UXPDcTALnblnpYUtOv+4w3HpeyvZDi+Pe3OhgCz
 IgI/gNAa/Qow2C/It5MZyXKEIrSvPIscRcjXf+nRo1s2qtBOAdNWYvUtC8NP42JKL5ed
 URSJbKL6dSju3Aj8XBOdXNZZ2Kq/vGNDLqQKtDtJSTSPzUUSTZKy3Hzg67O47u9Rfj27
 AbCbJ+EEG7I7ovXgYFzN5k5F2aHT0UEgsTuCGgP3qnqH1nIUApjCKz4sfpYks7IM9Vfr
 yrQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxg1TqtnZqwc8A+8Wo47JBmDN+YMUahX40yI+/lvFOwi/0Ik7NlbsfroqO2lsrsXtm3uB9jwlIPeU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfMnFIR9sgMq+ERy4vd/LxLsOi2oI/IVvBL+563CqSvsxU6IKB
 TRt2+dWkRFxbt8EU9GT3h4+rfSXievkhnhzF3sCmAdFsVPxb6Ayy
X-Gm-Gg: ASbGncsV6+T6gFUDZnivqBnyCiairmQInuy+BNDqNY+Qupcp4dFUQwZb9eO3Q+1gsrI
 uPH63zyAGBQeqdxhdNgO/c5uBXN3dH+/9SSdwJpdBBDjVCEbBoQV4XYzBSIgyH6pIFe5EoIyLxU
 hDJhDBbL9XlJ6bNcTfLSLV6YAbauzGLBpe0XGXRqNCka/bEdnLgS25p+zz5RetHVdbavvFi6l8A
 HYbDn4wruuKfc2YFtr66/ObngeGAGXBAdxyUbcS5F0uDP04eXbcncoEv6MrTWvRB4oQc9U=
X-Google-Smtp-Source: AGHT+IGJE9SzzaEnM+ZHSKDjHWXEXcXfbv/Db9F1ZrEdEm/3HvCUrxPOHBlHnrIwV8L4lLJpqt34bA==
X-Received: by 2002:a05:6000:1786:b0:38a:8d32:2707 with SMTP id
 ffacd0b85a97d-38bec548925mr18891266f8f.26.1737390210811; 
 Mon, 20 Jan 2025 08:23:30 -0800 (PST)
Received: from fedora.. ([94.73.34.116]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3221b7fsm10800176f8f.27.2025.01.20.08.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 08:23:30 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, mripard@kernel.org, rodrigosiqueiramelo@gmail.com,
 simona.vetter@ffwll.ch, simona@ffwll.ch, thomas.petazzoni@bootlin.com,
 tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v4 3/3] drm/vkms: Switch to dynamic allocation for CRTC
Date: Mon, 20 Jan 2025 17:23:25 +0100
Message-ID: <20250120162327.2866-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117-b4-vkms-allocated-v4-3-8ec8fd21aaf6@bootlin.com>
References: <20250117-b4-vkms-allocated-v4-3-8ec8fd21aaf6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

> A specific allocation for the CRTC is not strictly necessary at this
> point, but in order to implement dynamic configuration of VKMS (configFS),
> it will be easier to have one allocation per CRTC.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_crtc.c      | 32 +++++++++++++++++---------------
>  drivers/gpu/drm/vkms/vkms_drv.h       |  8 ++++----
>  drivers/gpu/drm/vkms/vkms_output.c    | 22 ++++++++++++----------
>  drivers/gpu/drm/vkms/vkms_writeback.c | 23 ++++++++++++-----------
>  4 files changed, 45 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 434c35d5e9477d2961826262591db8ab43838e09..cf229aec71c3f03bb1306095e8dd44d63f80cd2a 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -84,9 +84,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
>  				      int *max_error, ktime_t *vblank_time,
>  				      bool in_vblank_irq)
>  {
> -	struct drm_device *dev = crtc->dev;
> -	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
> -	struct vkms_output *output = &vkmsdev->output;
> +	struct vkms_output *output = drm_crtc_to_vkms_output(crtc);
>  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>  
>  	if (!READ_ONCE(vblank->enabled)) {
> @@ -271,25 +269,29 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
>  	.atomic_disable	= vkms_crtc_atomic_disable,
>  };
>  
> -int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> -		   struct drm_plane *primary, struct drm_plane *cursor)
> +struct vkms_output *vkms_crtc_init(struct drm_device *dev, struct drm_plane *primary,
> +				   struct drm_plane *cursor)
>  {
> -	struct vkms_output *vkms_out = drm_crtc_to_vkms_output(crtc);
> +	struct vkms_output *vkms_out;
> +	struct drm_crtc *crtc;
>  	int ret;
>  
> -	ret = drmm_crtc_init_with_planes(dev, crtc, primary, cursor,
> -					 &vkms_crtc_funcs, NULL);
> -	if (ret) {
> -		DRM_ERROR("Failed to init CRTC\n");
> -		return ret;
> +	vkms_out = drmm_crtc_alloc_with_planes(dev, struct vkms_output, crtc,
> +					       primary, cursor,
> +					       &vkms_crtc_funcs, NULL);
> +	if (IS_ERR(vkms_out)) {
> +		DRM_DEV_ERROR(dev->dev, "Failed to init CRTC\n");
> +		return vkms_out;
>  	}
>  
> +	crtc = &vkms_out->crtc;
> +
>  	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
>  
>  	ret = drm_mode_crtc_set_gamma_size(crtc, VKMS_LUT_SIZE);
>  	if (ret) {
>  		DRM_ERROR("Failed to set gamma size\n");
> -		return ret;
> +		return ERR_PTR(ret);
>  	}
>  
>  	drm_crtc_enable_color_mgmt(crtc, 0, false, VKMS_LUT_SIZE);
> @@ -299,9 +301,9 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>  
>  	vkms_out->composer_workq = drmm_alloc_ordered_workqueue(dev, "vkms_composer", 0);
>  	if (IS_ERR(vkms_out->composer_workq))
> -		return PTR_ERR(vkms_out->composer_workq);
> +		return ERR_CAST(vkms_out->composer_workq);
>  	if (!vkms_out->composer_workq)
> -		return -ENOMEM;
> +		return ERR_PTR(-ENOMEM);
>  
> -	return ret;
> +	return vkms_out;
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 333983bcf8d46ef85101e7c344e256df57551b78..abbb652be2b5389f96cec78837117ceb9acef656 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -215,7 +215,6 @@ struct vkms_config {
>  struct vkms_device {
>  	struct drm_device drm;
>  	struct platform_device *platform;
> -	struct vkms_output output;
>  	const struct vkms_config *config;
>  };
>  
> @@ -242,8 +241,9 @@ struct vkms_device {
>   * @primary: primary plane to attach to the CRTC
>   * @cursor: plane to attach to the CRTC
>   */
> -int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> -		   struct drm_plane *primary, struct drm_plane *cursor);
> +struct vkms_output *vkms_crtc_init(struct drm_device *dev,
> +				   struct drm_plane *primary,
> +				   struct drm_plane *cursor);
>  
>  /**
>   * vkms_output_init() - Initialize all sub-components needed for a VKMS device.
> @@ -274,6 +274,6 @@ void vkms_set_composer(struct vkms_output *out, bool enabled);
>  void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
>  
>  /* Writeback */
> -int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, struct drm_crtc *crtc);
> +int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, struct vkms_output *vkms_out);
>  
>  #endif /* _VKMS_DRV_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 21ca975e424d148b0669b87784d86f5da2a8b333..22f0d678af3ac8177e43c4ea730af3f2109de5f3 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -30,11 +30,10 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
>  
>  int vkms_output_init(struct vkms_device *vkmsdev)
>  {
> -	struct vkms_output *output = &vkmsdev->output;
>  	struct drm_device *dev = &vkmsdev->drm;
>  	struct drm_connector *connector;
>  	struct drm_encoder *encoder;
> -	struct drm_crtc *crtc = &output->crtc;
> +	struct vkms_output *output;
>  	struct vkms_plane *primary, *overlay, *cursor = NULL;
>  	int ret;
>  	int writeback;
> @@ -56,9 +55,12 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  			return PTR_ERR(cursor);
>  	}
>  
> -	ret = vkms_crtc_init(dev, crtc, &primary->base, &cursor->base);
> -	if (ret)
> -		return ret;
> +	output = vkms_crtc_init(dev, &primary->base,
> +				cursor ? &cursor->base : NULL);
> +	if (IS_ERR(output)) {
> +		DRM_ERROR("Failed to allocate CRTC\n");
> +		return PTR_ERR(output);
> +	}
>  
>  	if (vkmsdev->config->overlay) {
>  		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
> @@ -67,7 +69,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  				DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
>  				return PTR_ERR(overlay);
>  			}
> -			overlay->base.possible_crtcs = drm_crtc_mask(crtc);
> +			overlay->base.possible_crtcs = drm_crtc_mask(&output->crtc);
>  		}
>  	}
>  
> @@ -97,23 +99,23 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  		DRM_ERROR("Failed to init encoder\n");
>  		return ret;
>  	}
> -	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +	encoder->possible_crtcs = drm_crtc_mask(&output->crtc);
>  
> +	/* Attach the encoder and the connector */
>  	ret = drm_connector_attach_encoder(connector, encoder);
>  	if (ret) {
>  		DRM_ERROR("Failed to attach connector to encoder\n");
>  		return ret;
>  	}
>  
> +	/* Initialize the writeback component */
>  	if (vkmsdev->config->writeback) {
> -		writeback = vkms_enable_writeback_connector(vkmsdev, crtc);
> +		writeback = vkms_enable_writeback_connector(vkmsdev, output);
>  		if (writeback)
>  			DRM_ERROR("Failed to init writeback connector\n");
>  	}

Hi Louis,

Thanks for fixing this error condition.

I have been working and running automated tests on top of this series and
I haven't found any other issue.

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

>  
>  	drm_mode_config_reset(dev);
>  
> -	return 0;
> -
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> index 981975c2b0a0c75e4a3aceca2a965f5876ae0a8f..e9b5c74d7c58e7faed870a4368decbd67dab23d2 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -105,7 +105,9 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
>  				struct drm_writeback_job *job)
>  {
>  	struct vkms_writeback_job *vkmsjob = job->priv;
> -	struct vkms_device *vkmsdev;
> +	struct vkms_output *vkms_output = container_of(connector,
> +						       struct vkms_output,
> +						       wb_connector);
>  
>  	if (!job->fb)
>  		return;
> @@ -114,8 +116,7 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
>  
>  	drm_framebuffer_put(vkmsjob->wb_frame_info.fb);
>  
> -	vkmsdev = drm_device_to_vkms_device(job->fb->dev);
> -	vkms_set_composer(&vkmsdev->output, false);
> +	vkms_set_composer(vkms_output, false);
>  	kfree(vkmsjob);
>  }
>  
> @@ -124,8 +125,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
>  {
>  	struct drm_connector_state *connector_state = drm_atomic_get_new_connector_state(state,
>  											 conn);
> -	struct vkms_device *vkmsdev = drm_device_to_vkms_device(conn->dev);
> -	struct vkms_output *output = &vkmsdev->output;
> +	struct vkms_output *output = drm_crtc_to_vkms_output(connector_state->crtc);
>  	struct drm_writeback_connector *wb_conn = &output->wb_connector;
>  	struct drm_connector_state *conn_state = wb_conn->base.state;
>  	struct vkms_crtc_state *crtc_state = output->composer_state;
> @@ -139,7 +139,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
>  	if (!conn_state)
>  		return;
>  
> -	vkms_set_composer(&vkmsdev->output, true);
> +	vkms_set_composer(output, true);
>  
>  	active_wb = conn_state->writeback_job->priv;
>  	wb_frame_info = &active_wb->wb_frame_info;
> @@ -162,22 +162,23 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
>  	.atomic_check = vkms_wb_atomic_check,
>  };
>  
> -int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, struct drm_crtc *crtc)
> +int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
> +				    struct vkms_output *vkms_output)
>  {
> -	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
> +	struct drm_writeback_connector *wb = &vkms_output->wb_connector;
>  	int ret;
>  
> -	ret = drmm_encoder_init(&vkmsdev->drm, &vkmsdev->output.wb_encoder,
> +	ret = drmm_encoder_init(&vkmsdev->drm, &vkms_output->wb_encoder,
>  				NULL, DRM_MODE_ENCODER_VIRTUAL, NULL);
>  	if (ret)
>  		return ret;
> -	vkmsdev->output.wb_encoder.possible_crtcs |= drm_crtc_mask(crtc);
> +	vkms_output->wb_encoder.possible_crtcs |= drm_crtc_mask(&vkms_output->crtc);
>  
>  	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
>  
>  	return drmm_writeback_connector_init(&vkmsdev->drm, wb,
>  					     &vkms_wb_connector_funcs,
> -					     &vkmsdev->output.wb_encoder,
> +					     &vkms_output->wb_encoder,
>  					     vkms_wb_formats,
>  					     ARRAY_SIZE(vkms_wb_formats));
>  }
> 
