Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A1297BD2A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 15:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F24510E1AE;
	Wed, 18 Sep 2024 13:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ifdgk4eC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FD710E1AE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 13:39:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19ED01C000F;
 Wed, 18 Sep 2024 13:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1726666766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rVeKnWxaNpVxsIAc9HPLTlzEDqHJ7vPdmZMa8pzgBis=;
 b=ifdgk4eCesLWlfrokNQRvSdunE47acjIsd2ra+9Jsdl3wNjGlgYLrdaDvSF6t/rtKJ+C+v
 vlFYWnW5fGo/ymEKSgYkH4oae/T8A7cXrhRKZMhaTqKDFYuzlZRdTwDl9sbSZ4IiYy2NdE
 wimorRXNCM93+DxNE4jg+WGF4dk8Pl9eRDKDGsAjAscjOdCYJOPlE2FdXISJOBSIetQzWZ
 k9gMf1kbbp1Cl15RW3IaFqRK2M0puu41TlP8EITcDzrDYw+peccPLJ22eZKWwqXgyJ6DSQ
 vdaatoovlsjIisHUJe/uS4skqjsq1UJ4i8KxI2AS75Sdd0C1I/yPQVc5qq0yUQ==
Date: Wed, 18 Sep 2024 15:39:23 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, mripard@kernel.org,
 rodrigosiqueiramelo@gmail.com, thomas.petazzoni@bootlin.com,
 tzimmermann@suse.de
Subject: Re: [PATCH] drm/vkms: Add missing check for CRTC initialization
Message-ID: <ZurYC1Ez8K0UsJ_Y@localhost.localdomain>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, mripard@kernel.org,
 rodrigosiqueiramelo@gmail.com, thomas.petazzoni@bootlin.com,
 tzimmermann@suse.de
References: <20240906-vkms-add-missing-check-v1-1-1afb3bf3d0a6@bootlin.com>
 <20240917160208.2905-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240917160208.2905-1-jose.exposito89@gmail.com>
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

Le 17/09/24 - 18:02, José Expósito a écrit :
> Hi Louis,
> 
> > CRTC initialization call drm_mode_crtc_set_gamma_size without the proper
> > checks, introduce this check to avoid issues.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> Reviewed-by: José Expósito <jose.exposito89@gmail.com>
> 
> > ---
> >  drivers/gpu/drm/vkms/vkms_crtc.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > 
> > ---
> > base-commit: a6bb1f77a94335de67dba12e7f52651c115b82d2
> > change-id: 20240906-vkms-add-missing-check-e1b6ee8d1b39
> > 
> > Best regards,
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > index 40b4d084e3ce..e4f93dfbd071 100644
> > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > @@ -287,7 +287,12 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> >  
> >  	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
> >  
> > -	drm_mode_crtc_set_gamma_size(crtc, VKMS_LUT_SIZE);
> > +	ret = drm_mode_crtc_set_gamma_size(crtc, VKMS_LUT_SIZE);
> > +	if (ret) {
> > +		DRM_ERROR("Failed to set gamma size\n");
> 
> This will conflit with "drm/vkms: Switch to dynamic allocation
> for CRTC" [1], where you switched to DRM_DEV_ERROR.

I did not check if my series had conflict between them, so I'm not 
surprised. I will change it to the DEV variant and send a v2, espicially 
since Leo [1] wants to work to clean the logging in VKMS :-)

[1]:https://lore.kernel.org/all/CAHhBtNqB=jQTnY1eu8or=toczr93ehUeuBkAZ7axFPr4ZHPjCQ@mail.gmail.com/

> No proferences about the log function, just a heads up so when
> you rebase one of the patches we keep logging consistent.
> 
> [1] https://patchwork.kernel.org/project/dri-devel/patch/20240912-b4-vkms-allocated-v1-3-29abbaa14af9@bootlin.com/
> 
> > +		return ret;
> > +	}
> > +
> >  	drm_crtc_enable_color_mgmt(crtc, 0, false, VKMS_LUT_SIZE);
> >  
> >  	spin_lock_init(&vkms_out->lock);
> > 
