Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 419D4A0BE89
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 18:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F031010E751;
	Mon, 13 Jan 2025 17:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="kaWV5Uj/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD3D10E751
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 17:12:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C470240003;
 Mon, 13 Jan 2025 17:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736788326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j9FLLz+0iuVZ7pF7BX8BlL8PnmpokUUP8gTAPdOO4vk=;
 b=kaWV5Uj/fJdwWDvBWyrStV7lJ0qnG/MqGSI+OtHhug+MrZceijtt3fTem9mnkiVl0lDfVr
 D3wgPBdEhI11aFRkuzpVsLYeWuiGrlkEPdZ53dK9oDGBVdP7yugSMrbxBi7/RifTf4c1NE
 tvXXIHYggAv8WWLGZXksU57zX9KidbKgwa45fJ32Tgif+Fqhy1mPsOWXWRpYjRHDG4GLq6
 jNgY+a4F/wQSJ9+3xxW3OLH3Dxl4+phEuh+ICwAARTbE4rQcWTUlrnCIjamthXWoSwlwl1
 ktEhN+Glhvg9fctOC6grXSKTc+ICfK4vkXhdMgfsDJGyBYBQVkMBq2RXHrSp2w==
Date: Mon, 13 Jan 2025 18:12:03 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v7 7/7] drm/vkms: Switch to managed for writeback connector
Message-ID: <Z4VJY03TZlgzn3ib@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20250113-google-vkms-managed-v7-0-4f81d1893e0b@bootlin.com>
 <20250113-google-vkms-managed-v7-7-4f81d1893e0b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250113-google-vkms-managed-v7-7-4f81d1893e0b@bootlin.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 13/01/25 - 18:09, Louis Chauvet wrote:
> The current VKMS driver uses non-managed function to create
> writeback connectors. It is not an issue yet, but in order
> to support multiple devices easily, convert this code to
> use drm and device managed helpers.
> 
> Reviewed-by: José Expósito <jose.exposito89@gmail.com>

Hi,

Sorry José, I forgot to remove your Reviewed-by, the changes made here are 
not trivials. Can I keep it or do you have any comments ?

Sorry,
Louis Chauvet

> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
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
> -- 
> 2.47.1
> 
