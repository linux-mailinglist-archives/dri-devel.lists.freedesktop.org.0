Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 112D8A13E74
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 16:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8224410E9B4;
	Thu, 16 Jan 2025 15:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PQuOcKOG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F6910E9B4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 15:56:21 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3863c36a731so957673f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737042920; x=1737647720; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sVCqyZRnVABogFYZlHemJSU6zK7Fqmcj8g6SD+NswyI=;
 b=PQuOcKOGXQS06kxsYsrvVSTozQkwk+vmMpMIEXEMKIrMjVpirk2cU4F3Tg3Z612dCI
 Ut91+RnD5ppSPI2yiPn4bHVicf72BSQvNxNTzE4YEYe/e92v12trhRJ89qVb5roljOOQ
 wOCwR774i0TQyiGk2mYkT1hbXnQnrDYjKodpsC2prDhY2gS02CDRAuhzvGXhdnDj24k2
 6h1UyDj7nTUUlcJP6+MDdKdWZgn9y6AzQN393SQE8hA3w63PrGCUCiSIa1BVIT/Wu/zt
 PlYmZ+E4Nzk2XCvC/8J2SPOA+NR50wsZRV/nL5IP4K9I1SurOVOtmVOv7kKl+MA3URDV
 pQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737042920; x=1737647720;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sVCqyZRnVABogFYZlHemJSU6zK7Fqmcj8g6SD+NswyI=;
 b=ngAqa+X4uzEaUttSmW0igesO/Oz2/xLWbA8bCf53K2+F5pmSVdrUdqqzeMlSQb0Fxv
 S1dD/7gdZUH7OSArB6ELjsHXqGk5KY1CZbCyuQwnp3WgEIEon05oo6ncC6f/PJl+s7d1
 EIsN/tvxkciubwWN/pkfsePycyoRTPhkAOkdiXzXYsQNx+XkC02lHT4oBQCfHCO3BuUA
 UsMEffV2WkGIjjv4tqP4ipRiDLAHd14azYrGtmgEn7AKkHQbkHL3OCCpZSp9vGwjdnEK
 d8HmaivwGI9ZwWinJih+33VS4BSHbxvz4uDf6xYHKWpCM1XpPLhOyDS31ZoMuzdL7qhj
 bkPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSVZ8lZvKvgCmTygGUYHXXsOVjkE1db2C6YuM4W4AP8PWS/43zFXCxJq+jsq+aL9GWMyIoZrwiU54=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcW6AzhhOqNCxZs72wkYNUdq22lxlLFYoYiKCKm8DxMiLQZOFH
 XJzJ244Fn2uvVpgatY7Y1hDQBe96OmOBy3loHN2JmcxN0x6SV34M
X-Gm-Gg: ASbGnctNfPIJGv52r9iC45Uue7qDGqYyDEiUfKvpdwRuogLYX5JncPRovAbL+yMF3N1
 U6YBLKRtJaMnM1XW/2ypqd2pCaIHEprN1GRoXaaQiVdeMPecEzAsz4nuMSK25GxypbBQOvxOhHW
 Rj1mGR7hfcZxOETupNvdm68v4+hJFMJ8aI2lV2jfNEZ9v4y3b1euCh7zatahdQ0+sy6f8siMuIw
 c9arKjrIxIK8IzS3BiXtR3bI+8xjJXZH4JD9KKhxy4JaY0y0gHG/QERMA==
X-Google-Smtp-Source: AGHT+IFJlqywvOdJHeUf8BxrmOH2Ir5tYg75/fLmB/z42rWDQrTa/FDsj8+JOVhMruu4la3CRyUnaw==
X-Received: by 2002:a05:6000:402a:b0:38a:418e:1171 with SMTP id
 ffacd0b85a97d-38a8733063dmr29404524f8f.37.1737042919985; 
 Thu, 16 Jan 2025 07:55:19 -0800 (PST)
Received: from fedora.. ([94.73.34.116]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf322ad74sm207726f8f.56.2025.01.16.07.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 07:55:19 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, arthurgrillo@riseup.net,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, miquel.raynal@bootlin.com, mripard@kernel.org,
 nicolejadeyee@google.com, rodrigosiqueiramelo@gmail.com,
 seanpaul@google.com, simona.vetter@ffwll.ch, simona@ffwll.ch,
 thomas.petazzoni@bootlin.com, tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v8 8/8] drm/vkms: Switch to managed for writeback connector
Date: Thu, 16 Jan 2025 16:55:16 +0100
Message-ID: <20250116155516.3505-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250114-google-vkms-managed-v8-8-da4254aa3dd5@bootlin.com>
References: <20250114-google-vkms-managed-v8-8-da4254aa3dd5@bootlin.com>
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

> The current VKMS driver uses non-managed function to create
> writeback connectors. It is not an issue yet, but in order
> to support multiple devices easily, convert this code to
> use drm and device managed helpers.
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

Thanks!

> ---
>  drivers/gpu/drm/vkms/vkms_drv.h       |  3 ++-
>  drivers/gpu/drm/vkms/vkms_output.c    |  2 +-
>  drivers/gpu/drm/vkms/vkms_writeback.c | 21 +++++++++++++--------
>  3 files changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 00541eff3d1b0aa4b374fb94c8fe34932df31509..46ac36aebb27ce8d9018224735007c1b3fe7d0a5 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -179,6 +179,7 @@ struct vkms_output {
>  	struct drm_encoder encoder;
>  	struct drm_connector connector;
>  	struct drm_writeback_connector wb_connector;
> +	struct drm_encoder wb_encoder;
>  	struct hrtimer vblank_hrtimer;
>  	ktime_t period_ns;
>  	struct workqueue_struct *composer_workq;
> @@ -275,6 +276,6 @@ void vkms_set_composer(struct vkms_output *out, bool enabled);
>  void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
>  
>  /* Writeback */
> -int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
> +int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, struct drm_crtc *crtc);
>  
>  #endif /* _VKMS_DRV_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index ab9affa75b66ce9f00fe025052439405206144ec..de817e2794860f9071a71b3631460691e0d73a85 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -95,7 +95,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  	}
>  
>  	if (vkmsdev->config->writeback) {
> -		writeback = vkms_enable_writeback_connector(vkmsdev);
> +		writeback = vkms_enable_writeback_connector(vkmsdev, crtc);
>  		if (writeback)
>  			DRM_ERROR("Failed to init writeback connector\n");
>  	}
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> index 79918b44fedd7ae2451d1d530fc6d5aabf2d99a3..981975c2b0a0c75e4a3aceca2a965f5876ae0a8f 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -24,7 +24,6 @@ static const u32 vkms_wb_formats[] = {
>  
>  static const struct drm_connector_funcs vkms_wb_connector_funcs = {
>  	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = drm_connector_cleanup,
>  	.reset = drm_atomic_helper_connector_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> @@ -163,16 +162,22 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
>  	.atomic_check = vkms_wb_atomic_check,
>  };
>  
> -int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
> +int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, struct drm_crtc *crtc)
>  {
>  	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
> +	int ret;
> +
> +	ret = drmm_encoder_init(&vkmsdev->drm, &vkmsdev->output.wb_encoder,
> +				NULL, DRM_MODE_ENCODER_VIRTUAL, NULL);
> +	if (ret)
> +		return ret;
> +	vkmsdev->output.wb_encoder.possible_crtcs |= drm_crtc_mask(crtc);
>  
>  	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
>  
> -	return drm_writeback_connector_init(&vkmsdev->drm, wb,
> -					    &vkms_wb_connector_funcs,
> -					    NULL,
> -					    vkms_wb_formats,
> -					    ARRAY_SIZE(vkms_wb_formats),
> -					    1);
> +	return drmm_writeback_connector_init(&vkmsdev->drm, wb,
> +					     &vkms_wb_connector_funcs,
> +					     &vkmsdev->output.wb_encoder,
> +					     vkms_wb_formats,
> +					     ARRAY_SIZE(vkms_wb_formats));
>  }
> 
