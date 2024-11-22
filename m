Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E06119D5CEE
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 11:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B0010EB39;
	Fri, 22 Nov 2024 10:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="i23rnnL2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC7210EB39
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 10:08:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40EA760003;
 Fri, 22 Nov 2024 10:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732270082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kRNPYDL8Ipd2FpJ0u4dNLQsnmY9M+H6eWjXeu3+YPUE=;
 b=i23rnnL2XnebpTu74heO43q1oe/k6Q+hmAC6UiMgm2Cc5czt1I19s3B7vA3vTMj/42Il+e
 +IIeA2Xun56YSYHTQDzzm66prIakrg3XedHmA4vgyVu1Fypzv68r7KBOgaFUt/hh5wjqR9
 rXQPAvpzduDKf53ilUxvmFplkWKKNzd4e6QnYn2DhgJAh3jWQ6Pgjq0aik2ylKSquJ4vhH
 ropneulJ+4FNblVWli75iNHpz/MFeMM0ulQebLDfeyx7l2JRP1t0K0jUv4bCAwlwmUa5Cq
 8dcrLD/UyhuK4fU+oBmQwsOA7BDIJFxU1beZ9ZJ9haRz2c73lK3+zok1Pk2OiA==
Date: Fri, 22 Nov 2024 11:07:59 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH v3] drm/vkms: Remove index parameter from init_vkms_output
Message-ID: <Z0BX_x9EYWeVSaWl@louis-chauvet-laptop>
Mail-Followup-To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
References: <20241119-vkms-remove-index-v3-1-976321a3f801@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241119-vkms-remove-index-v3-1-976321a3f801@bootlin.com>
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

On 19/11/24 - 14:34, Louis Chauvet wrote:
> VKMS currently supports only one CRTC, so it make no sense to have this
> index configurable. To avoid issues, replace this hardcoded index by
> drm_crtc_mask when applicable.
> 
> There is no need to manually set a crtc mask on primary and cursor plane
> as it is automatically set by drmm_crtc_alloc_with_planes.
> 
> In addition, this will remove the use of an uninitialized structure in
> vkms_add_overlay_plane. This currently works by chance because two things:
> - vkms_plane_init always set a possible_crtcs value, so the problematic
>   branch is never used;
> - drm_crtc_mask on an kzalloc'd drm_crtc returns BIT(0), and the VKMS CRTC
>   always have this id.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Applied on drm-misc-next: 
https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/12e755103f2404fa87bd1d7af93100ec45b43feb

> ---
> Changes in v3:
> - Rebased on drm-misc-next
> - Link to v2: https://lore.kernel.org/r/20241010-vkms-remove-index-v2-1-6b8d6cfd5a15@bootlin.com
> 
> Changes in v2:
> - Applied comments from José
> - Link to v1: https://lore.kernel.org/r/20240906-vkms-remove-index-v1-1-3cfedd8ccb2f@bootlin.com
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c    |  2 +-
>  drivers/gpu/drm/vkms/vkms_drv.h    |  8 ++-----
>  drivers/gpu/drm/vkms/vkms_output.c | 49 +++++++++++++-------------------------
>  drivers/gpu/drm/vkms/vkms_plane.c  |  4 ++--
>  4 files changed, 21 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index bab13943d8e0085bed85092d7bc8727d834768a9..e4ae69d9ef871c9ce436ad0bd8c6551d8fe7f55c 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -174,7 +174,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
>  	dev->mode_config.preferred_depth = 0;
>  	dev->mode_config.helper_private = &vkms_mode_config_helpers;
>  
> -	return vkms_output_init(vkmsdev, 0);
> +	return vkms_output_init(vkmsdev);
>  }
>  
>  static int vkms_create(struct vkms_config *config)
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 672fe191e239c03e7358d43eb19215361417a781..036101ee4ea1cb0a335cd2ea78a8ca9da87fbe93 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -212,21 +212,17 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>   * vkms_output_init() - Initialize all sub-components needed for a VKMS device.
>   *
>   * @vkmsdev: VKMS device to initialize
> - * @index: CRTC which can be attached to the planes. The caller must ensure that
> - *	   @index is positive and less or equals to 31.
>   */
> -int vkms_output_init(struct vkms_device *vkmsdev, int index);
> +int vkms_output_init(struct vkms_device *vkmsdev);
>  
>  /**
>   * vkms_plane_init() - Initialize a plane
>   *
>   * @vkmsdev: VKMS device containing the plane
>   * @type: type of plane to initialize
> - * @index: CRTC which can be attached to the plane. The caller must ensure that
> - *	   @index is positive and less or equals to 31.
>   */
>  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> -				   enum drm_plane_type type, int index);
> +				   enum drm_plane_type type);
>  
>  /* CRC Support */
>  const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 25a99fde126c7402941954015287ab0887484139..8f4bd5aef087b459d37d0cbbf90fe0145090917a 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -32,29 +32,14 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
>  	.get_modes    = vkms_conn_get_modes,
>  };
>  
> -static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index,
> -				  struct drm_crtc *crtc)
> -{
> -	struct vkms_plane *overlay;
> -
> -	overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, index);
> -	if (IS_ERR(overlay))
> -		return PTR_ERR(overlay);
> -
> -	if (!overlay->base.possible_crtcs)
> -		overlay->base.possible_crtcs = drm_crtc_mask(crtc);
> -
> -	return 0;
> -}
> -
> -int vkms_output_init(struct vkms_device *vkmsdev, int index)
> +int vkms_output_init(struct vkms_device *vkmsdev)
>  {
>  	struct vkms_output *output = &vkmsdev->output;
>  	struct drm_device *dev = &vkmsdev->drm;
>  	struct drm_connector *connector = &output->connector;
>  	struct drm_encoder *encoder = &output->encoder;
>  	struct drm_crtc *crtc = &output->crtc;
> -	struct vkms_plane *primary, *cursor = NULL;
> +	struct vkms_plane *primary, *overlay, *cursor = NULL;
>  	int ret;
>  	int writeback;
>  	unsigned int n;
> @@ -65,29 +50,31 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  	 * The overlay and cursor planes are not mandatory, but can be used to perform complex
>  	 * composition.
>  	 */
> -	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, index);
> +	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY);
>  	if (IS_ERR(primary))
>  		return PTR_ERR(primary);
>  
> -	if (vkmsdev->config->overlay) {
> -		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
> -			ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
> -			if (ret)
> -				return ret;
> -		}
> -	}
> -
>  	if (vkmsdev->config->cursor) {
> -		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
> +		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
>  		if (IS_ERR(cursor))
>  			return PTR_ERR(cursor);
>  	}
>  
> -	/* [1]: Allocation of a CRTC, its index will be BIT(0) = 1 */
>  	ret = vkms_crtc_init(dev, crtc, &primary->base, &cursor->base);
>  	if (ret)
>  		return ret;
>  
> +	if (vkmsdev->config->overlay) {
> +		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
> +			overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY);
> +			if (IS_ERR(overlay)) {
> +				DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
> +				return PTR_ERR(overlay);
> +			}
> +			overlay->base.possible_crtcs = drm_crtc_mask(crtc);
> +		}
> +	}
> +
>  	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
>  				 DRM_MODE_CONNECTOR_VIRTUAL);
>  	if (ret) {
> @@ -103,11 +90,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  		DRM_ERROR("Failed to init encoder\n");
>  		goto err_encoder;
>  	}
> -	/*
> -	 * This is a hardcoded value to select crtc for the encoder.
> -	 * BIT(0) here designate the first registered CRTC, the one allocated in [1]
> -	 */
> -	encoder->possible_crtcs = BIT(0);
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
>  
>  	ret = drm_connector_attach_encoder(connector, encoder);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index e5c625ab8e3e06cb95f468c59bc3b06ef85eab6f..ad137c9a75f5e9ee3bb62e7bb2c5e3684a6ecbb6 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -198,12 +198,12 @@ static const struct drm_plane_helper_funcs vkms_plane_helper_funcs = {
>  };
>  
>  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> -				   enum drm_plane_type type, int index)
> +				   enum drm_plane_type type)
>  {
>  	struct drm_device *dev = &vkmsdev->drm;
>  	struct vkms_plane *plane;
>  
> -	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 << index,
> +	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 0,
>  					   &vkms_plane_funcs,
>  					   vkms_formats, ARRAY_SIZE(vkms_formats),
>  					   NULL, type, NULL);
> 
> ---
> base-commit: 7d2faa8dbb7055a115fe0cd6068d7090094a573d
> change-id: 20240906-vkms-remove-index-3a6e04c38e02
> 
> Best regards,
> -- 
> Louis Chauvet <louis.chauvet@bootlin.com>
> 
