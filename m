Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D85495F661
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 18:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFF110E1E9;
	Mon, 26 Aug 2024 16:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="aftXSKdC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD38110E1E9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 16:22:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F21A240002;
 Mon, 26 Aug 2024 16:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724689374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IujKu5XrySSOwQrpL2CM3p+lT9rMydcpEK6cc5pErQY=;
 b=aftXSKdCOsZlCma3FmfgUwRpJ+OA3aey0Z1MlXNiTlWl2UCmRh423ZxK0SVS0FGav1OTpW
 T7SrgNqus6AX7VG8DF/izDo+LrJx+nhMenpjTfjM9K98juMxZbsKpLl3P8jupoxWI265LI
 blrC5theCZ+DRlAWFCZG1QUEB+XxVrWssAUW854Qt2S7mDxk9EPDhcgLPBSshZu3HP/cJz
 vOifUEDb7Pc4xSvvCKBd4nt8rFxcMV75F/19427geVEEXq6boxtcLp1zouuCkqN0Z7Xygq
 83E29RuqhxPYEOVOZMdNHEmzhOD4HwxqyB2W2+td3/hVjgGbdiHjDE7zTNjlvA==
Date: Mon, 26 Aug 2024 18:22:50 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 arthurgrillo@riseup.net, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com,
 marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH 2/3] drm/vkms: Rename index to possible_crtc
Message-ID: <Zsyr2mGMPrLmiitO@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 arthurgrillo@riseup.net, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com,
 marcheu@google.com, nicolejadeyee@google.com
References: <20240814-google-clarifications-v1-0-3ee76d7d0c28@bootlin.com>
 <20240814-google-clarifications-v1-2-3ee76d7d0c28@bootlin.com>
 <1205c363-6635-4081-8155-5a8573481f3f@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1205c363-6635-4081-8155-5a8573481f3f@igalia.com>
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

Le 15/08/24 - 11:07, Maíra Canal a écrit :
> On 8/14/24 05:46, Louis Chauvet wrote:
> > The meaning of index was not clear. Replace them with crtc_index to
> > clearly indicate its usage.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> IMHO no need for this patch, especially considering that you are going
> to change those lines anyway in a future series.
> 
> I'd just drop it.

True, I will drop it for the next iteration. It was a step for me to 
understand the initialization process, but as you said, my next series 
complelty remove it, so I will remove this patch.

Thanks for your reviews,
Louis Chauvet

> Best Regards,
> - Maíra
> 
> > ---
> >   drivers/gpu/drm/vkms/vkms_drv.h    |  4 ++--
> >   drivers/gpu/drm/vkms/vkms_output.c | 13 +++++++------
> >   drivers/gpu/drm/vkms/vkms_plane.c  |  4 ++--
> >   3 files changed, 11 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> > index 526bf5207524..3028678e4f9b 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > @@ -222,10 +222,10 @@ struct vkms_device {
> >   int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> >   		   struct drm_plane *primary, struct drm_plane *cursor);
> >   
> > -int vkms_output_init(struct vkms_device *vkmsdev, int index);
> > +int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index);
> >   
> >   struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> > -				   enum drm_plane_type type, int index);
> > +				   enum drm_plane_type type, int possible_crtc_index);
> >   
> >   /* CRC Support */
> >   const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
> > diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> > index 5ce70dd946aa..d42ca7d10389 100644
> > --- a/drivers/gpu/drm/vkms/vkms_output.c
> > +++ b/drivers/gpu/drm/vkms/vkms_output.c
> > @@ -31,12 +31,12 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
> >   	.get_modes    = vkms_conn_get_modes,
> >   };
> >   
> > -static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index,
> > +static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int possible_crtc_index,
> >   				  struct drm_crtc *crtc)
> >   {
> >   	struct vkms_plane *overlay;
> >   
> > -	overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, index);
> > +	overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, possible_crtc_index);
> >   	if (IS_ERR(overlay))
> >   		return PTR_ERR(overlay);
> >   
> > @@ -46,7 +46,7 @@ static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index,
> >   	return 0;
> >   }
> >   
> > -int vkms_output_init(struct vkms_device *vkmsdev, int index)
> > +int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
> >   {
> >   	struct vkms_output *output = &vkmsdev->output;
> >   	struct drm_device *dev = &vkmsdev->drm;
> > @@ -58,20 +58,21 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
> >   	int writeback;
> >   	unsigned int n;
> >   
> > -	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, index);
> > +	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, possible_crtc_index);
> > +
> >   	if (IS_ERR(primary))
> >   		return PTR_ERR(primary);
> >   
> >   	if (vkmsdev->config->overlay) {
> >   		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
> > -			ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
> > +			ret = vkms_add_overlay_plane(vkmsdev, possible_crtc_index, crtc);
> >   			if (ret)
> >   				return ret;
> >   		}
> >   	}
> >   
> >   	if (vkmsdev->config->cursor) {
> > -		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
> > +		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, possible_crtc_index);
> >   		if (IS_ERR(cursor))
> >   			return PTR_ERR(cursor);
> >   	}
> > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> > index 03716616f819..9d85464ee0e9 100644
> > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > @@ -219,12 +219,12 @@ static const struct drm_plane_helper_funcs vkms_plane_helper_funcs = {
> >   };
> >   
> >   struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> > -				   enum drm_plane_type type, int index)
> > +				   enum drm_plane_type type, int possible_crtc_index)
> >   {
> >   	struct drm_device *dev = &vkmsdev->drm;
> >   	struct vkms_plane *plane;
> >   
> > -	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 << index,
> > +	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 << possible_crtc_index,
> >   					   &vkms_plane_funcs,
> >   					   vkms_formats, ARRAY_SIZE(vkms_formats),
> >   					   NULL, type, NULL);
> > 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
