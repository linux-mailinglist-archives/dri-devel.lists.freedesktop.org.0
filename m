Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3EF95F671
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 18:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F70110E22C;
	Mon, 26 Aug 2024 16:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hZGz86Hh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C1F10E22E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 16:24:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE2B31BF204;
 Mon, 26 Aug 2024 16:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724689473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dtF1AXxZ9EX9aYpn/9rjSOHDEJdmYKXAQOSi2XeFdzA=;
 b=hZGz86HhSfoeXlF1h0DhSiwlpRIutGLkrraadAai3vc6SRg551U2a3f+Yww1P/ec0SZj8h
 jOYgzFNbDGDpdAob8EtQqoZA/ooFEfxAcoRv981nBz0k+HhKABJ1StE1/6NQOEHCwbYJpk
 t3SrgVnz4PzfLygOKGegDERlCJ95usiAIYyHsG5+tn69/pKVxSZ9ETT129nd2OCptB7aWl
 wf39soIjyjgiBF5Yko/ZaICl+54U9MOraxQ4IZzaqT5GYTgfoNliglYYGGJzU3z0j/IyEp
 f2ubQoLjxQUzHmXopst6n34EdCkv3uqm7+XvtgTbBFGtNMzhgyRRs/EzHGfYgw==
Date: Mon, 26 Aug 2024 18:24:31 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: airlied@gmail.com, arthurgrillo@riseup.net, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, miquel.raynal@bootlin.com,
 mripard@kernel.org, nicolejadeyee@google.com,
 rodrigosiqueiramelo@gmail.com, seanpaul@google.com,
 thomas.petazzoni@bootlin.com, tzimmermann@suse.de
Subject: Re: [PATCH RFC 1/4] drm/vkms: Switch to managed for connector
Message-ID: <ZsysP_Ze4kYcfQ23@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 airlied@gmail.com, arthurgrillo@riseup.net, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, miquel.raynal@bootlin.com,
 mripard@kernel.org, nicolejadeyee@google.com,
 rodrigosiqueiramelo@gmail.com, seanpaul@google.com,
 thomas.petazzoni@bootlin.com, tzimmermann@suse.de
References: <20240814-google-vkms-managed-v1-1-7ab8b8921103@bootlin.com>
 <20240820090912.2854-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240820090912.2854-1-jose.exposito89@gmail.com>
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

Le 20/08/24 - 11:09, José Expósito a écrit :
> Hi Louis,
> 
> Thanks for these patches. Easy review as my configfs series included similar
> patches :) I think that this series could be easily rebased on drm-misc-next,
> but I don't know if that'd add a lot of work rebasing other series. I'd be nice
> to get these 4 merged.

It is not trivial to rebase before the split-header series. I will see if 
I can rebase this+split header easly, but I fear few conflicts.
 
> > The current VKMS driver uses non-managed function to create connectors. It
> > is not an issue yet, but in order to support multiple devices easily,
> > convert this code to use drm and device managed helpers.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> Reviewed-by: José Expósito <jose.exposito89@gmail.com>

Thanks! I will test my v2 and send it tomorrow!

> > ---
> >  drivers/gpu/drm/vkms/vkms_drv.h    |  1 -
> >  drivers/gpu/drm/vkms/vkms_output.c | 22 ++++++++++------------
> >  2 files changed, 10 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> > index f74a5c2045f9..cea7b2640c5d 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > @@ -43,7 +43,6 @@
> >  struct vkms_output {
> >  	struct drm_crtc crtc;
> >  	struct drm_encoder encoder;
> > -	struct drm_connector connector;
> >  	struct drm_writeback_connector wb_connector;
> >  	struct hrtimer vblank_hrtimer;
> >  	ktime_t period_ns;
> > diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> > index 20073a00b200..4767838c3a73 100644
> > --- a/drivers/gpu/drm/vkms/vkms_output.c
> > +++ b/drivers/gpu/drm/vkms/vkms_output.c
> > @@ -3,6 +3,7 @@
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_edid.h>
> >  #include <drm/drm_probe_helper.h>
> > +#include <drm/drm_managed.h>
> 
> Nit: Keep includes sorted alphabetically if possible
> 
> >  
> >  #include "vkms_writeback.h"
> >  #include "vkms_plane.h"
> > @@ -10,7 +11,6 @@
> >  
> >  static const struct drm_connector_funcs vkms_connector_funcs = {
> >  	.fill_modes = drm_helper_probe_single_connector_modes,
> > -	.destroy = drm_connector_cleanup,
> >  	.reset = drm_atomic_helper_connector_reset,
> >  	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> >  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> > @@ -54,7 +54,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
> >  {
> >  	struct vkms_output *output = &vkmsdev->output;
> >  	struct drm_device *dev = &vkmsdev->drm;
> > -	struct drm_connector *connector = &output->connector;
> > +	struct drm_connector *connector;
> >  	struct drm_encoder *encoder = &output->encoder;
> >  	struct drm_crtc *crtc = &output->crtc;
> >  	struct vkms_plane *primary, *cursor = NULL;
> > @@ -90,11 +90,15 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
> >  	if (ret)
> >  		return ret;
> >  
> > -	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
> > -				 DRM_MODE_CONNECTOR_VIRTUAL);
> > +	connector = drmm_kzalloc(&vkmsdev->drm, sizeof(*connector), GFP_KERNEL);
> 
> "&vkmsdev->drm" can be replaced with "dev".
> 
> > +	if (!connector)
> 
> For consistency with the init function, it'd be nice to log this error as well:
> 
> 		DRM_ERROR("Failed to allocate connector\n");
> 
> > +		return -ENOMEM;
> > +
> > +	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
> > +				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
> >  	if (ret) {
> >  		DRM_ERROR("Failed to init connector\n");
> > -		goto err_connector;
> > +		return ret;
> >  	}
> >  
> >  	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
> > @@ -103,7 +107,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
> >  			       DRM_MODE_ENCODER_VIRTUAL, NULL);
> >  	if (ret) {
> >  		DRM_ERROR("Failed to init encoder\n");
> > -		goto err_encoder;
> > +		return ret;
> >  	}
> >  	/*
> >  	 * This is an hardcoded value to select crtc for the encoder.
> > @@ -130,11 +134,5 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
> >  err_attach:
> >  	drm_encoder_cleanup(encoder);
> >  
> > -err_encoder:
> > -	drm_connector_cleanup(connector);
> > -
> > -err_connector:
> > -	drm_crtc_cleanup(crtc);
> > -
> 
> I think that, technically, err_encoder should call drm_crtc_cleanup() in this
> patch. However, since a future patch will remove this code I don't find it that
> relevant.

True, I will keep it to avoid issues. I believe it is a remnant of my many 
rebases.

> >  	return ret;
> >  }
