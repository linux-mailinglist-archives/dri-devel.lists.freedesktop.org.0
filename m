Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EA0B8F705
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 10:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3157F10E3D2;
	Mon, 22 Sep 2025 08:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ROXK3J7C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37ED10E3D2;
 Mon, 22 Sep 2025 08:13:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0AD981A0E4A;
 Mon, 22 Sep 2025 08:13:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C9CA860634;
 Mon, 22 Sep 2025 08:13:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CD69B102F1929; 
 Mon, 22 Sep 2025 10:13:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1758528808; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=KZudJ7ialawhnjgOcRWYVWvYIbpYEAl6oAIQqQQBXEY=;
 b=ROXK3J7C/3UTNRKmWQI6ZOyd6wiNiE0i1vduA1ziUHEKmu9EYqmvieWX4ycZBokgYydFbF
 tuxVOqVhPefm1S09/x2+bI02prGkOGkPX4DDFQynDhMsRZBPiSTsYGLXjnJRprZHHSr5nI
 6ddoKuMjwSGQ1UNA3lDRBw90BN+PJzUm/pVR1G8E5QsMS9hvAc8UET2mi3qqHB+lVNLZdU
 m5+UEkMR257rXY6qrYp279cMFX2JYmm79GHn4yRx3D4XYA4NaJgl8L4cTs2cG/BPiwCSEb
 xxgongJfAujl5NZP4VNUXgifndtlHffPhNMtk0DZUP39y9FJ0zQWJL8d8QPG8A==
Message-ID: <5aaecb8b-08c6-4982-86c8-18ebb4544f4c@bootlin.com>
Date: Fri, 19 Sep 2025 14:43:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH RFC v2 04/20] drm/crtc: Add COLOR_PIPELINE property
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Alex Hung <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, mcanal@igalia.com, kernel@collabora.com,
 daniels@collabora.com, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
 <20250917-mtk-post-blend-color-pipeline-v2-4-ac4471b44758@collabora.com>
Content-Language: en-US, fr
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250917-mtk-post-blend-color-pipeline-v2-4-ac4471b44758@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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



Le 18/09/2025 à 02:43, Nícolas F. R. A. Prado a écrit :
> Add a COLOR_PIPELINE property to the CRTC to allow userspace to set a
> post-blend color pipeline analogously to how pre-blend color pipelines
> are set on planes.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   drivers/gpu/drm/drm_atomic_uapi.c | 49 +++++++++++++++++++++++++++++++++++----
>   drivers/gpu/drm/drm_crtc.c        | 33 ++++++++++++++++++++++++++
>   include/drm/drm_atomic_uapi.h     |  2 ++
>   include/drm/drm_crtc.h            | 11 +++++++++
>   4 files changed, 91 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index b7cc6945864274bedd21dd5b73494f9aae216888..063c142fd9b656e228cfc660d005a3fbb4640d32 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -287,6 +287,33 @@ drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
>   }
>   EXPORT_SYMBOL(drm_atomic_set_colorop_for_plane);
>   
> +/**
> + * drm_atomic_set_colorop_for_crtc - set colorop for crtc
> + * @crtc_state: atomic state object for the crtc
> + * @colorop: colorop to use for the crtc
> + *
> + * Helper function to select the color pipeline on a crtc by setting
> + * it to the first drm_colorop element of the pipeline.
> + */
> +void
> +drm_atomic_set_colorop_for_crtc(struct drm_crtc_state *crtc_state,
> +				 struct drm_colorop *colorop)
> +{
> +	struct drm_crtc *crtc = crtc_state->crtc;
> +
> +	if (colorop)
> +		drm_dbg_atomic(crtc->dev,
> +			       "Set [COLOROP:%d] for [CRTC:%d:%s] state %p\n",
> +			       colorop->base.id, crtc->base.id, crtc->name,
> +			       crtc_state);
> +	else
> +		drm_dbg_atomic(crtc->dev,
> +			       "Set [NOCOLOROP] for [CRTC:%d:%s] state %p\n",
> +			       crtc->base.id, crtc->name, crtc_state);
> +
> +	crtc_state->color_pipeline = colorop;
> +}
> +EXPORT_SYMBOL(drm_atomic_set_colorop_for_crtc);
>   
>   /**
>    * drm_atomic_set_crtc_for_connector - set CRTC for connector
> @@ -396,8 +423,8 @@ static s32 __user *get_out_fence_for_connector(struct drm_atomic_state *state,
>   }
>   
>   static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
> -		struct drm_crtc_state *state, struct drm_property *property,
> -		uint64_t val)
> +		struct drm_crtc_state *state, struct drm_file *file_priv,
> +		struct drm_property *property, uint64_t val)
>   {
>   	struct drm_device *dev = crtc->dev;
>   	struct drm_mode_config *config = &dev->mode_config;
> @@ -406,7 +433,17 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
>   
>   	if (property == config->prop_active)
>   		state->active = val;
> -	else if (property == config->prop_mode_id) {
> +	else if (property == crtc->color_pipeline_property) {
> +		/* find DRM colorop object */
> +		struct drm_colorop *colorop = NULL;
> +
> +		colorop = drm_colorop_find(dev, file_priv, val);
> +
> +		if (val && !colorop)
> +			return -EACCES;
> +
> +		drm_atomic_set_colorop_for_crtc(state, colorop);

I don't know if this is needed, but you added a warning/early return for 
ctm/degamma_lut if file_priv->post_blend_color_pipeline is true.

Does it make sense to add this?

	if (!file_priv->post_blend_color_pipeline) {
			drm_dbg_atomic(dev,
				"Setting COLOR_PIPELINE property not permitted without 
DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE client cap\n");
			return -EINVAL;
		}

> +	} else if (property == config->prop_mode_id) {
>   		struct drm_property_blob *mode =
>   			drm_property_lookup_blob(dev, val);
>   		ret = drm_atomic_set_mode_prop_for_crtc(state, mode);
> @@ -487,6 +524,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
>   		*val = 0;
>   	else if (property == crtc->scaling_filter_property)
>   		*val = state->scaling_filter;
> +	else if (property == crtc->color_pipeline_property)
> +		*val = (state->color_pipeline) ? state->color_pipeline->base.id : 0;
>   	else if (crtc->funcs->atomic_get_property)
>   		return crtc->funcs->atomic_get_property(crtc, state, property, val);
>   	else {
> @@ -1047,6 +1086,8 @@ int drm_atomic_get_property(struct drm_mode_object *obj,
>   
>   		if (colorop->plane)
>   			WARN_ON(!drm_modeset_is_locked(&colorop->plane->mutex));
> +		else if (colorop->crtc)
> +			WARN_ON(!drm_modeset_is_locked(&colorop->crtc->mutex));
>   
>   		ret = drm_atomic_colorop_get_property(colorop,
>   				colorop->state, property, val);
> @@ -1204,7 +1245,7 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>   		}
>   
>   		ret = drm_atomic_crtc_set_property(crtc,
> -				crtc_state, prop, prop_value);
> +				crtc_state, file_priv, prop, prop_value);
>   		break;
>   	}
>   	case DRM_MODE_OBJECT_PLANE: {
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 94e60cffd29972aa979ac2f1932be7a6a97f3ada..94238163ff1254c721df39c030bc99a31d3bb92a 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -1003,3 +1003,36 @@ drm_common_create_color_pipeline_property(struct drm_device *dev, struct drm_mod
>   	kfree(all_pipelines);
>   	return prop;
>   }
> +
> +/**
> + * drm_crtc_create_color_pipeline_property - create a new color pipeline
> + * property
> + *
> + * @crtc: drm CRTC
> + * @pipelines: list of pipelines
> + * @num_pipelines: number of pipelines
> + *
> + * Create the COLOR_PIPELINE CRTC property to specify color pipelines on
> + * the CRTC.
> + *
> + * RETURNS:
> + * Zero for success or -errno
> + */
> +int drm_crtc_create_color_pipeline_property(struct drm_crtc *crtc,
> +					    const struct drm_prop_enum_list *pipelines,
> +					    int num_pipelines)
> +{
> +	struct drm_property *prop;
> +
> +	prop = drm_common_create_color_pipeline_property(crtc->dev,
> +							 &crtc->base,
> +							 pipelines,
> +							 num_pipelines);
> +	if (IS_ERR(prop))
> +		return PTR_ERR(prop);
> +
> +	crtc->color_pipeline_property = prop;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_crtc_create_color_pipeline_property);
> diff --git a/include/drm/drm_atomic_uapi.h b/include/drm/drm_atomic_uapi.h
> index 4363155233267b93767c895fa6085544e2277442..4dc191f6f929d73deee9812025c48275a33cf770 100644
> --- a/include/drm/drm_atomic_uapi.h
> +++ b/include/drm/drm_atomic_uapi.h
> @@ -52,6 +52,8 @@ void drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
>   				 struct drm_framebuffer *fb);
>   void drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
>   				      struct drm_colorop *colorop);
> +void drm_atomic_set_colorop_for_crtc(struct drm_crtc_state *crtc_state,
> +				     struct drm_colorop *colorop);
>   int __must_check
>   drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
>   				  struct drm_crtc *crtc);
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 77c0c04a5910a2263923e06cf37535697e20e1c9..df03637ca25abd45e96b5944229297f776fd046d 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -1096,6 +1096,14 @@ struct drm_crtc {
>   	 */
>   	struct drm_property *scaling_filter_property;
>   
> +	/**
> +	 * @color_pipeline_property:
> +	 *
> +	 * Optional "COLOR_PIPELINE" enum property for specifying
> +	 * a color pipeline to use on the CRTC.
> +	 */
> +	struct drm_property *color_pipeline_property;
> +
>   	/**
>   	 * @state:
>   	 *
> @@ -1331,5 +1339,8 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
>   
>   int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
>   					    unsigned int supported_filters);
> +int drm_crtc_create_color_pipeline_property(struct drm_crtc *crtc,
> +					     const struct drm_prop_enum_list *pipelines,
> +					     int num_pipelines);
>   bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state);
>   #endif /* __DRM_CRTC_H__ */
> 

-- 
--
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


