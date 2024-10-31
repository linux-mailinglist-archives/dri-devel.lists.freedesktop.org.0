Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 417569B82C0
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 19:43:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF85610E430;
	Thu, 31 Oct 2024 18:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bg5Zteu9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1761A10E430
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 18:43:40 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4319399a411so10914995e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 11:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730400218; x=1731005018; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V31vfskpRrfJdFE1EVFRfNcmsrL0pL3G+Xn3v+VxvbA=;
 b=bg5Zteu9BxF/jDeTB6HEAytU+SNvPD4OcIvjbjTEEzyimrmKnEw89Wug7zxjeP4+Ki
 r7Gj6iQqvm86kF5RZosyUzwivba9JOf0enoI0RudLpkCLq70oIkfVSP+0iXLdvWn1bmP
 hM+6yAjP+O4nok4XTgpNNFVPes7S5PCLYF9WBu8k9HBjERo6Wpfa1AQYY+pwfLZrtdQT
 wulrxc7fuc5SG4zA/3dnbeSrYq1EqTWz3oryv6nZOdRmyM3JN3tp4wN52Sxj01X5HmCw
 YRxAu4NuOrX+0gSo8RRWqHHrDeAwjzVIrcX1VAm+sLWsYL6ZnmRGf8tn07/1z/IoRdYN
 xGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730400218; x=1731005018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V31vfskpRrfJdFE1EVFRfNcmsrL0pL3G+Xn3v+VxvbA=;
 b=v0TlXUFS1w6n5p3BEjzbmjNbejkumdnWV1wQxn63NCGm3eLgHTIbvW0Xowi4kFq3Di
 VOEB1PWmyNhzqeYF8r2Axk/8/hLfBPNPNIdBP4Uu4l5hKyFOfLyw8BigBo3/DlRTaKfa
 TeYPG8pwyL0XqU6p30v+dd88PFmA3osjxwWAl0faDrjbbGfXrvm3s3Hg1IM+1z+UKAkF
 E20l/F4zXyLLeswE2IANPaW3YyOtAXXRboRTp1KxJGLP3/7SAPBTwsxfWSWi6lXEmxLa
 txOnjkie2zOGpZKtR0VDxJbUtQn0Am5649RQSBmsRCm9H9/bumsyGlBk/x16JZNKKSFm
 UUzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVngoxi0YmKJFwCXK7poFDxScVgCmNXrVBXxjddJzRRswG9bAFOG+JLIWCQphWNqANpQK6kNiWAW+M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXV4oedVGDYZQEFigQ1d1liYkZOMSb7ykOBLCRrkPUcdlHVva1
 Xnk1cUJJcHH0JGwX9/wcWx3SXzAQr4WEBy6bTBBU2AgQaWAfcKnJ
X-Google-Smtp-Source: AGHT+IE/Na2LPqcL69LDgazCyCUo27L72v5LbK3GcMUAyA6C18hGbb9UHk2BiEjCWo4HHMYdeVmHpw==
X-Received: by 2002:a05:600c:350b:b0:42c:e0da:f15c with SMTP id
 5b1f17b1804b1-4319acbb947mr157527225e9.20.1730400218118; 
 Thu, 31 Oct 2024 11:43:38 -0700 (PDT)
Received: from fedora.. ([94.73.38.214]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d5c65b8sm34730155e9.18.2024.10.31.11.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 11:43:37 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, mripard@kernel.org, rodrigosiqueiramelo@gmail.com,
 simona.vetter@ffwll.ch, simona@ffwll.ch, thomas.petazzoni@bootlin.com,
 tzimmermann@suse.de
Subject: Re: [PATCH v2] drm/vkms: Remove index parameter from init_vkms_output
Date: Thu, 31 Oct 2024 19:43:35 +0100
Message-ID: <20241031184336.3866-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <Zx9ebAggGouerl4A@fedora>
References: <Zx9ebAggGouerl4A@fedora>
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

> On 26/10/24 - 12:22, Maíra Canal wrote:
> > Hi Louis,
> > 
> > On 10/10/24 14:27, Louis Chauvet wrote:
> > > VKMS currently supports only one CRTC, so it make no sense to have this
> > > index configurable. To avoid issues, replace this hardcoded index by
> > > drm_crtc_mask when applicable.
> > > 
> > > There is no need to manually set a crtc mask on primary and cursor plane
> > > as it is automatically set by drmm_crtc_alloc_with_planes.
> > > 
> > > In addition, this will remove the use of an uninitialized structure in
> > > vkms_add_overlay_plane. This currently works by chance because two things:
> > > - vkms_plane_init always set a possible_crtcs value, so the problematic
> > >    branch is never used;
> > > - drm_crtc_mask on an kzalloc'd drm_crtc returns BIT(0), and the VKMS CRTC
> > >    always have this id.
> > > 
> > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > ---
> > > Changes in v2:
> > > - Applied comments from José
> > > - Link to v1: https://lore.kernel.org/r/20240906-vkms-remove-index-v1-1-3cfedd8ccb2f@bootlin.com
> > > ---
> > >   drivers/gpu/drm/vkms/vkms_drv.c    |  2 +-
> > >   drivers/gpu/drm/vkms/vkms_drv.h    |  8 ++----
> > >   drivers/gpu/drm/vkms/vkms_output.c | 54 ++++++++++++++------------------------
> > >   drivers/gpu/drm/vkms/vkms_plane.c  |  4 +--
> > >   4 files changed, 24 insertions(+), 44 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > > index 2d1e95cb66e5..0f6805b9fe7b 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > > @@ -174,7 +174,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
> > >   	dev->mode_config.preferred_depth = 0;
> > >   	dev->mode_config.helper_private = &vkms_mode_config_helpers;
> > > -	return vkms_output_init(vkmsdev, 0);
> > > +	return vkms_output_init(vkmsdev);
> > >   }
> > >   static int vkms_create(struct vkms_config *config)
> > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> > > index 672fe191e239..036101ee4ea1 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > > @@ -212,21 +212,17 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> > >    * vkms_output_init() - Initialize all sub-components needed for a VKMS device.
> > >    *
> > >    * @vkmsdev: VKMS device to initialize
> > > - * @index: CRTC which can be attached to the planes. The caller must ensure that
> > > - *	   @index is positive and less or equals to 31.
> > >    */
> > > -int vkms_output_init(struct vkms_device *vkmsdev, int index);
> > > +int vkms_output_init(struct vkms_device *vkmsdev);
> > >   /**
> > >    * vkms_plane_init() - Initialize a plane
> > >    *
> > >    * @vkmsdev: VKMS device containing the plane
> > >    * @type: type of plane to initialize
> > > - * @index: CRTC which can be attached to the plane. The caller must ensure that
> > > - *	   @index is positive and less or equals to 31.
> > >    */
> > >   struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> > > -				   enum drm_plane_type type, int index);
> > > +				   enum drm_plane_type type);
> > >   /* CRC Support */
> > >   const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
> > > diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> > > index 0a5a185aa0b0..5128aa3b2eb6 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_output.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_output.c
> > > @@ -32,29 +32,14 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
> > >   	.get_modes    = vkms_conn_get_modes,
> > >   };
> > > -static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index,
> > > -				  struct drm_crtc *crtc)
> > > -{
> > > -	struct vkms_plane *overlay;
> > > -
> > > -	overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, index);
> > > -	if (IS_ERR(overlay))
> > > -		return PTR_ERR(overlay);
> > > -
> > > -	if (!overlay->base.possible_crtcs)
> > > -		overlay->base.possible_crtcs = drm_crtc_mask(crtc);
> > > -
> > > -	return 0;
> > > -}
> > > -
> > > -int vkms_output_init(struct vkms_device *vkmsdev, int index)
> > > +int vkms_output_init(struct vkms_device *vkmsdev)
> > >   {
> > >   	struct vkms_output *output = &vkmsdev->output;
> > >   	struct drm_device *dev = &vkmsdev->drm;
> > >   	struct drm_connector *connector = &output->connector;
> > >   	struct drm_encoder *encoder = &output->encoder;
> > >   	struct drm_crtc *crtc = &output->crtc;
> > > -	struct vkms_plane *primary, *cursor = NULL;
> > > +	struct vkms_plane *primary, *overlay, *cursor = NULL;
> > >   	int ret;
> > >   	int writeback;
> > >   	unsigned int n;
> > > @@ -65,34 +50,37 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
> > >   	 * The overlay and cursor planes are not mandatory, but can be used to perform complex
> > >   	 * composition.
> > >   	 */
> > > -	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, index);
> > > +	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY);
> > >   	if (IS_ERR(primary))
> > >   		return PTR_ERR(primary);
> > > -	if (vkmsdev->config->overlay) {
> > > -		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
> > > -			ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
> > > -			if (ret)
> > > -				return ret;
> > > -		}
> > > -	}
> > > -
> > >   	if (vkmsdev->config->cursor) {
> > > -		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
> > > +		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
> > >   		if (IS_ERR(cursor))
> > >   			return PTR_ERR(cursor);
> > >   	}
> > > -	/* [1]: Allocation of a CRTC, its index will be BIT(0) = 1 */
> > >   	ret = vkms_crtc_init(dev, crtc, &primary->base, &cursor->base);
> > >   	if (ret)
> > >   		return ret;
> > > +	if (vkmsdev->config->overlay) {
> > > +		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
> > > +			overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY);
> > > +			if (IS_ERR(overlay)) {
> > > +				DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
> > > +				ret = PTR_ERR(overlay);
> > > +				goto err_crtc;
> > > +			}
> > > +			overlay->base.possible_crtcs = drm_crtc_mask(crtc);
> > > +		}
> > > +	}
> > > +
> > >   	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
> > >   				 DRM_MODE_CONNECTOR_VIRTUAL);
> > >   	if (ret) {
> > >   		DRM_ERROR("Failed to init connector\n");
> > > -		goto err_connector;
> > > +		goto err_crtc;
> > >   	}
> > >   	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
> > > @@ -103,11 +91,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
> > >   		DRM_ERROR("Failed to init encoder\n");
> > >   		goto err_encoder;
> > >   	}
> > > -	/*
> > > -	 * This is a hardcoded value to select crtc for the encoder.
> > > -	 * BIT(0) here designate the first registered CRTC, the one allocated in [1]
> > > -	 */
> > > -	encoder->possible_crtcs = BIT(0);
> > > +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> > >   	ret = drm_connector_attach_encoder(connector, encoder);
> > >   	if (ret) {
> > > @@ -131,7 +115,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
> > >   err_encoder:
> > >   	drm_connector_cleanup(connector);
> > > -err_connector:
> > > +err_crtc:
> > >   	drm_crtc_cleanup(crtc);
> > 
> > Do we really need `drm_crtc_cleanup`? We are allocating the CRTC with
> > `drmm_crtc_init_with_planes`.
> 
> I agree, I'll check the previous discussions I've had on the mailing list, 
> I have a little doubt that someone asked me to re-add this cleaning at 
> some point.

Oh! Good point. It looks like drm_crtc_cleanup() is a leftover from
commit 99cc528ebe92 ("drm/vkms: Use drmm_crtc_init_with_planes()").

Since the previous code in vkms_output.c was calling drm_crtc_cleanup()
I assumed it was required. But Maíra is right, it is safe to drop it.

I sent a simple patch dropping the call to drm_crtc_cleanup():
https://lore.kernel.org/dri-devel/20241031183835.3633-1-jose.exposito89@gmail.com/T/#u

About this patch, LGTM.

Jose

> Thanks,
> Louis Chauvet
> 
> > The rest looks fine to me.
> >
> > Best Regards,
> > - Maíra
> > 
> > >   	return ret;
> > > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> > > index e5c625ab8e3e..ad137c9a75f5 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > > @@ -198,12 +198,12 @@ static const struct drm_plane_helper_funcs vkms_plane_helper_funcs = {
> > >   };
> > >   struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> > > -				   enum drm_plane_type type, int index)
> > > +				   enum drm_plane_type type)
> > >   {
> > >   	struct drm_device *dev = &vkmsdev->drm;
> > >   	struct vkms_plane *plane;
> > > -	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 << index,
> > > +	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 0,
> > >   					   &vkms_plane_funcs,
> > >   					   vkms_formats, ARRAY_SIZE(vkms_formats),
> > >   					   NULL, type, NULL);
> > > 
> > > ---
> > > base-commit: 33c255312660653cf54f8019896b5dca28e3c580
> > > change-id: 20240906-vkms-remove-index-3a6e04c38e02
> > > 
> > > Best regards,
