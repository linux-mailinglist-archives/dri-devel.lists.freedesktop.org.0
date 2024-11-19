Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C217B9D288F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 15:48:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1109910E666;
	Tue, 19 Nov 2024 14:47:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ehLR8VTA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B224C10E666
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 14:47:57 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-432d9b8558aso31874825e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 06:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732027676; x=1732632476; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OVmUxUYJmV44wChQxtw+zT7Cwu0xbqPJgTEA0MJPBPo=;
 b=ehLR8VTAAHMm/n/wIfKLaJd6NbQNtE5lubgS9aAjyIvyvwe8wKLttProxZv68pTPsE
 cfQaT5aK/jpVrvttsQSzukybtVkBinhpUMdPrRj7tEqEFnsH1NSEQ/CcBvu6zf1UtrJD
 NKorFeMByrrnQ2KfOZgv/1Ftll2wFfk6fC9mNeDPXItMQaSVgLjU22smfq+QiX6hiQTH
 qYGxQMHMvaz3KOZYpS4VX5eFfZnGxYcFTWwkXfTRu0vV8AgEeemYWcWkTBmrczx+s/pN
 RaJHoNEl8qftgb8UsFGp85+dvCypoWRmicPYi0WaJmKj/4MRruCleA7VwtzUdxIPlH61
 w1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732027676; x=1732632476;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OVmUxUYJmV44wChQxtw+zT7Cwu0xbqPJgTEA0MJPBPo=;
 b=R+fje6qEgaBqaVoLEfOsWrp/hTS2DNquREpmvJNCja4tqYNj/uJeiwI5iLsHivLH0b
 So6ofP5o4m4/xri/jyJ3+QB3HLzQSdwue/phuDB5hy29hpm0PF38mbbGm+iOPfmPYC0H
 nSAvDnb/9MSW2zkU7hjC8YoxvSHLDP+PljDklO5Alh0Gi5ga49nNuqYkkTHFuDRNZvwY
 VjB/MB1UH+Lpv1G4Hlz6rv+IMDnoraOHxY6eXZdko6oHVp4zVcT3OqiaHLDZQ8U8iDRA
 42jkK1EBxg+Hhvx1Xu+dM1zXRNs29G0NcDu07yRMt5DKQWhLP2DTE1k60e7yA2/x3EAr
 jvSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtTWLbkBsRngOTd/hez+73TJr6weYhZ+DKPx2DRUB+fK1iZiRagI01gGL1r3yIwW3UG8f6n6/Ryuo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNl8+B91Rt7qmQ6j09GLSfVL8c2O5sjYLKlHVrensSp6LfZKjX
 SU2Qk9FOa1G8Nw2vro1OxG6H4m+kkdgseFp5zFj1COXY68QRt1kJ
X-Google-Smtp-Source: AGHT+IHRptvkPqOKGkK57Nt/XY4SPugXh/Simnf5AZ16RRIKELa3mjxbsfptKEXDbr6SdD7BfAPuyQ==
X-Received: by 2002:a05:600c:1911:b0:431:57cf:f13d with SMTP id
 5b1f17b1804b1-432f57a96f9mr30990015e9.3.1732027675572; 
 Tue, 19 Nov 2024 06:47:55 -0800 (PST)
Received: from fedora ([213.94.25.69]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da265f28sm200962755e9.17.2024.11.19.06.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 06:47:55 -0800 (PST)
Date: Tue, 19 Nov 2024 15:47:53 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/vkms: Remove index parameter from init_vkms_output
Message-ID: <ZzylGZrZ_h66Vnyx@fedora>
References: <20241119-vkms-remove-index-v3-1-976321a3f801@bootlin.com>
 <ZzyZKew8oqAZACfL@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZzyZKew8oqAZACfL@louis-chauvet-laptop>
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

On Tue, Nov 19, 2024 at 02:56:57PM +0100, Louis Chauvet wrote:
> On 19/11/24 - 14:34, Louis Chauvet wrote:
> > VKMS currently supports only one CRTC, so it make no sense to have this
> > index configurable. To avoid issues, replace this hardcoded index by
> > drm_crtc_mask when applicable.
> > 
> > There is no need to manually set a crtc mask on primary and cursor plane
> > as it is automatically set by drmm_crtc_alloc_with_planes.
> > 
> > In addition, this will remove the use of an uninitialized structure in
> > vkms_add_overlay_plane. This currently works by chance because two things:
> > - vkms_plane_init always set a possible_crtcs value, so the problematic
> >   branch is never used;
> > - drm_crtc_mask on an kzalloc'd drm_crtc returns BIT(0), and the VKMS CRTC
> >   always have this id.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> Hi Maíra, José,
> 
> You told me "LGTM" for the v2, but without leaving a Acked/Reviewed-by, 
> should I add them? Or maybe you prefer to formally send them now?

Yes, feel free to add:
Reviewed-by: José Expósito <jose.exposito89@gmail.com>

Thanks for rebasing the patch and fixing the conflict!

Jose
 
> Thanks,
> Louis Chauvet
> 
> > ---
> > Changes in v3:
> > - Rebased on drm-misc-next
> > - Link to v2: https://lore.kernel.org/r/20241010-vkms-remove-index-v2-1-6b8d6cfd5a15@bootlin.com
> > 
> > Changes in v2:
> > - Applied comments from José
> > - Link to v1: https://lore.kernel.org/r/20240906-vkms-remove-index-v1-1-3cfedd8ccb2f@bootlin.com
> > ---
> >  drivers/gpu/drm/vkms/vkms_drv.c    |  2 +-
> >  drivers/gpu/drm/vkms/vkms_drv.h    |  8 ++-----
> >  drivers/gpu/drm/vkms/vkms_output.c | 49 +++++++++++++-------------------------
> >  drivers/gpu/drm/vkms/vkms_plane.c  |  4 ++--
> >  4 files changed, 21 insertions(+), 42 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > index bab13943d8e0085bed85092d7bc8727d834768a9..e4ae69d9ef871c9ce436ad0bd8c6551d8fe7f55c 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > @@ -174,7 +174,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
> >  	dev->mode_config.preferred_depth = 0;
> >  	dev->mode_config.helper_private = &vkms_mode_config_helpers;
> >  
> > -	return vkms_output_init(vkmsdev, 0);
> > +	return vkms_output_init(vkmsdev);
> >  }
> >  
> >  static int vkms_create(struct vkms_config *config)
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> > index 672fe191e239c03e7358d43eb19215361417a781..036101ee4ea1cb0a335cd2ea78a8ca9da87fbe93 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > @@ -212,21 +212,17 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> >   * vkms_output_init() - Initialize all sub-components needed for a VKMS device.
> >   *
> >   * @vkmsdev: VKMS device to initialize
> > - * @index: CRTC which can be attached to the planes. The caller must ensure that
> > - *	   @index is positive and less or equals to 31.
> >   */
> > -int vkms_output_init(struct vkms_device *vkmsdev, int index);
> > +int vkms_output_init(struct vkms_device *vkmsdev);
> >  
> >  /**
> >   * vkms_plane_init() - Initialize a plane
> >   *
> >   * @vkmsdev: VKMS device containing the plane
> >   * @type: type of plane to initialize
> > - * @index: CRTC which can be attached to the plane. The caller must ensure that
> > - *	   @index is positive and less or equals to 31.
> >   */
> >  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> > -				   enum drm_plane_type type, int index);
> > +				   enum drm_plane_type type);
> >  
> >  /* CRC Support */
> >  const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
> > diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> > index 25a99fde126c7402941954015287ab0887484139..8f4bd5aef087b459d37d0cbbf90fe0145090917a 100644
> > --- a/drivers/gpu/drm/vkms/vkms_output.c
> > +++ b/drivers/gpu/drm/vkms/vkms_output.c
> > @@ -32,29 +32,14 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
> >  	.get_modes    = vkms_conn_get_modes,
> >  };
> >  
> > -static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index,
> > -				  struct drm_crtc *crtc)
> > -{
> > -	struct vkms_plane *overlay;
> > -
> > -	overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, index);
> > -	if (IS_ERR(overlay))
> > -		return PTR_ERR(overlay);
> > -
> > -	if (!overlay->base.possible_crtcs)
> > -		overlay->base.possible_crtcs = drm_crtc_mask(crtc);
> > -
> > -	return 0;
> > -}
> > -
> > -int vkms_output_init(struct vkms_device *vkmsdev, int index)
> > +int vkms_output_init(struct vkms_device *vkmsdev)
> >  {
> >  	struct vkms_output *output = &vkmsdev->output;
> >  	struct drm_device *dev = &vkmsdev->drm;
> >  	struct drm_connector *connector = &output->connector;
> >  	struct drm_encoder *encoder = &output->encoder;
> >  	struct drm_crtc *crtc = &output->crtc;
> > -	struct vkms_plane *primary, *cursor = NULL;
> > +	struct vkms_plane *primary, *overlay, *cursor = NULL;
> >  	int ret;
> >  	int writeback;
> >  	unsigned int n;
> > @@ -65,29 +50,31 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
> >  	 * The overlay and cursor planes are not mandatory, but can be used to perform complex
> >  	 * composition.
> >  	 */
> > -	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, index);
> > +	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY);
> >  	if (IS_ERR(primary))
> >  		return PTR_ERR(primary);
> >  
> > -	if (vkmsdev->config->overlay) {
> > -		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
> > -			ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
> > -			if (ret)
> > -				return ret;
> > -		}
> > -	}
> > -
> >  	if (vkmsdev->config->cursor) {
> > -		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
> > +		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
> >  		if (IS_ERR(cursor))
> >  			return PTR_ERR(cursor);
> >  	}
> >  
> > -	/* [1]: Allocation of a CRTC, its index will be BIT(0) = 1 */
> >  	ret = vkms_crtc_init(dev, crtc, &primary->base, &cursor->base);
> >  	if (ret)
> >  		return ret;
> >  
> > +	if (vkmsdev->config->overlay) {
> > +		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
> > +			overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY);
> > +			if (IS_ERR(overlay)) {
> > +				DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
> > +				return PTR_ERR(overlay);
> > +			}
> > +			overlay->base.possible_crtcs = drm_crtc_mask(crtc);
> > +		}
> > +	}
> > +
> >  	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
> >  				 DRM_MODE_CONNECTOR_VIRTUAL);
> >  	if (ret) {
> > @@ -103,11 +90,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
> >  		DRM_ERROR("Failed to init encoder\n");
> >  		goto err_encoder;
> >  	}
> > -	/*
> > -	 * This is a hardcoded value to select crtc for the encoder.
> > -	 * BIT(0) here designate the first registered CRTC, the one allocated in [1]
> > -	 */
> > -	encoder->possible_crtcs = BIT(0);
> > +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> >  
> >  	ret = drm_connector_attach_encoder(connector, encoder);
> >  	if (ret) {
> > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> > index e5c625ab8e3e06cb95f468c59bc3b06ef85eab6f..ad137c9a75f5e9ee3bb62e7bb2c5e3684a6ecbb6 100644
> > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > @@ -198,12 +198,12 @@ static const struct drm_plane_helper_funcs vkms_plane_helper_funcs = {
> >  };
> >  
> >  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> > -				   enum drm_plane_type type, int index)
> > +				   enum drm_plane_type type)
> >  {
> >  	struct drm_device *dev = &vkmsdev->drm;
> >  	struct vkms_plane *plane;
> >  
> > -	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 << index,
> > +	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 0,
> >  					   &vkms_plane_funcs,
> >  					   vkms_formats, ARRAY_SIZE(vkms_formats),
> >  					   NULL, type, NULL);
> > 
> > ---
> > base-commit: 7d2faa8dbb7055a115fe0cd6068d7090094a573d
> > change-id: 20240906-vkms-remove-index-3a6e04c38e02
> > 
> > Best regards,
> > -- 
> > Louis Chauvet <louis.chauvet@bootlin.com>
> > 
