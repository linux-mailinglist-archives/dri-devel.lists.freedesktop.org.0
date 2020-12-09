Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCA42D37FC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 01:51:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9714B6E201;
	Wed,  9 Dec 2020 00:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2306E207
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 00:51:38 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g185so26197wmf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Dec 2020 16:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bli4efRbqDsLR7jjWJNnrnRTG6MY7t8aTvkS4tDA/+E=;
 b=Sbn3VFY1j6QcZMhdFf3VhbchONi9JT/jTB2cngqVKfXsccJllgqZj566Xf4gmjcJgD
 ANbIwxmrPlMs4/FqwAp2VPjNJLJNzUSmlO9gFdkJFhgoGXYLGu4tqtJcRMrsmCoNgNMf
 Wumhy6wZ0HyyIdMBhSYpD9F0bD1XRuUODDUYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bli4efRbqDsLR7jjWJNnrnRTG6MY7t8aTvkS4tDA/+E=;
 b=iiuGrj8IrC3VGfgQMDpJakxgAR1TntC1wy0QESS/hjQiQiuNo9uCiIRp1T7f0gDu+Y
 voNVh4pXbK728BWwzNjicJAdLy4qvgRlwHMk11vV94ym0rHB78Kpq+3YA7wYlI9PSGfh
 3aKAeu9ukaqGZv+xAMs7ES7nXJjGsn7L5NRhcdY9NDvfHoBfx+299vFs5E3B+B2ixTP8
 iXHM0K52dOrOo1eQQHbv4jMMpZ5jOcXvAyrmFuq8/TPfGgdPRUOx1hXSkombFH+j1eq+
 QdoMoHjWNjrkTA14ZrmhvK7AElgSCUgA6f2c7Ei3ua7WRP8DOrUCY1IHUra8taKYh3u9
 jEMQ==
X-Gm-Message-State: AOAM533Wt96w6W7+u9LSxCQE2QrVPFIHaM8gzrRqFV7Mx4Hr0yT/1L+7
 soIFFhFh3Q8WaXrZivsyEIP3cQ==
X-Google-Smtp-Source: ABdhPJxBflW5V9HIIbK+fc28N5sGUZIhMHe0SEBwi50nRE6C/HL/rayeIvHAb5upfvsaSWZObBvb8w==
X-Received: by 2002:a1c:2605:: with SMTP id m5mr38935wmm.111.1607475097053;
 Tue, 08 Dec 2020 16:51:37 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r2sm1010793wrn.83.2020.12.08.16.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 16:51:36 -0800 (PST)
Date: Wed, 9 Dec 2020 01:51:34 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 1/2] drm: add legacy support for using degamma for gamma
Message-ID: <20201209005134.GO401619@phenom.ffwll.local>
References: <20201208135759.451772-1-tomi.valkeinen@ti.com>
 <20201208135759.451772-2-tomi.valkeinen@ti.com>
 <X8+h37/GM6K7q1mk@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X8+h37/GM6K7q1mk@pendragon.ideasonboard.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Yannick Fertre <yannick.fertre@st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Philippe Cornu <philippe.cornu@st.com>, David Airlie <airlied@linux.ie>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, Paul Cercueil <paul@crapouillou.net>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 08, 2020 at 05:55:11PM +0200, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Dec 08, 2020 at 03:57:58PM +0200, Tomi Valkeinen wrote:
> > We currently have drm_atomic_helper_legacy_gamma_set() helper which can
> > be used to handle legacy gamma-set ioctl.
> > drm_atomic_helper_legacy_gamma_set() sets GAMMA_LUT, and clears
> > CTM and DEGAMMA_LUT. This works fine on HW where we have either:
> > 
> > degamma -> ctm -> gamma -> out
> > 
> > or
> > 
> > ctm -> gamma -> out
> > 
> > However, if the HW has gamma table before ctm, the atomic property
> > should be DEGAMMA_LUT, and thus we have:
> > 
> > degamma -> ctm -> out
> > 
> > This is fine for userspace which sets gamma table using the properties,
> > as the userspace can check for the existence of gamma & degamma, but the
> > legacy gamma-set ioctl does not work.
> > 
> > This patch fixes the issue by changing
> > drm_atomic_helper_legacy_gamma_set() so that GAMMA_LUT will be used if
> > it exists, and DEGAMMA_LUT will be used as a fallback.
> > 
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 15 ++++++++++++---
> >  drivers/gpu/drm/drm_color_mgmt.c    |  4 ++++
> >  drivers/gpu/drm/drm_fb_helper.c     |  8 ++++++--
> >  include/drm/drm_crtc.h              |  3 +++
> >  4 files changed, 25 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index ba1507036f26..117b186fe646 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -3512,6 +3512,10 @@ EXPORT_SYMBOL(drm_atomic_helper_page_flip_target);
> >   * that support color management through the DEGAMMA_LUT/GAMMA_LUT
> >   * properties. See drm_crtc_enable_color_mgmt() and the containing chapter for
> >   * how the atomic color management and gamma tables work.
> > + *
> > + * This function uses the GAMMA_LUT or DEGAMMA_LUT property for the gamma table.
> > + * GAMMA_LUT property is used if it exists, and DEGAMMA_LUT property is used as
> > + * a fallback.
> >   */
> >  int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
> >  				       u16 *red, u16 *green, u16 *blue,
> > @@ -3526,6 +3530,9 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
> >  	int i, ret = 0;
> >  	bool replaced;
> >  
> > +	if (!crtc->has_gamma_prop && !crtc->has_degamma_prop)
> > +		return -ENODEV;
> > +
> >  	state = drm_atomic_state_alloc(crtc->dev);
> >  	if (!state)
> >  		return -ENOMEM;
> > @@ -3554,10 +3561,12 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
> >  		goto fail;
> >  	}
> >  
> > -	/* Reset DEGAMMA_LUT and CTM properties. */
> > -	replaced  = drm_property_replace_blob(&crtc_state->degamma_lut, NULL);
> > +	/* Set GAMMA/DEGAMMA_LUT and reset DEGAMMA/GAMMA_LUT and CTM */
> > +	replaced  = drm_property_replace_blob(&crtc_state->degamma_lut,
> > +					      crtc->has_gamma_prop ? NULL : blob);
> >  	replaced |= drm_property_replace_blob(&crtc_state->ctm, NULL);
> > -	replaced |= drm_property_replace_blob(&crtc_state->gamma_lut, blob);
> > +	replaced |= drm_property_replace_blob(&crtc_state->gamma_lut,
> > +					      crtc->has_gamma_prop ? blob : NULL);
> >  	crtc_state->color_mgmt_changed |= replaced;
> >  
> >  	ret = drm_atomic_commit(state);
> > diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> > index 3bcabc2f6e0e..956e59d5f6a7 100644
> > --- a/drivers/gpu/drm/drm_color_mgmt.c
> > +++ b/drivers/gpu/drm/drm_color_mgmt.c
> > @@ -176,6 +176,8 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
> >  					   degamma_lut_size);
> >  	}
> >  
> > +	crtc->has_degamma_prop = !!degamma_lut_size;
> > +
> >  	if (has_ctm)
> >  		drm_object_attach_property(&crtc->base,
> >  					   config->ctm_property, 0);
> > @@ -187,6 +189,8 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
> >  					   config->gamma_lut_size_property,
> >  					   gamma_lut_size);
> >  	}
> > +
> > +	crtc->has_gamma_prop = !!gamma_lut_size;
> >  }
> >  EXPORT_SYMBOL(drm_crtc_enable_color_mgmt);
> >  
> > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> > index 25edf670867c..b0906ef97617 100644
> > --- a/drivers/gpu/drm/drm_fb_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > @@ -1001,6 +1001,9 @@ static int setcmap_atomic(struct fb_cmap *cmap, struct fb_info *info)
> >  	drm_client_for_each_modeset(modeset, &fb_helper->client) {
> >  		crtc = modeset->crtc;
> >  
> > +		if (!crtc->has_gamma_prop && !crtc->has_degamma_prop)
> > +			continue;
> > +
> >  		if (!gamma_lut)
> >  			gamma_lut = setcmap_new_gamma_lut(crtc, cmap);
> >  		if (IS_ERR(gamma_lut)) {
> > @@ -1015,11 +1018,12 @@ static int setcmap_atomic(struct fb_cmap *cmap, struct fb_info *info)
> >  			goto out_state;
> >  		}
> >  
> > +		/* Set GAMMA/DEGAMMA_LUT and reset DEGAMMA/GAMMA_LUT and CTM */
> >  		replaced  = drm_property_replace_blob(&crtc_state->degamma_lut,
> > -						      NULL);
> > +						      crtc->has_gamma_prop ? NULL : gamma_lut);
> >  		replaced |= drm_property_replace_blob(&crtc_state->ctm, NULL);
> >  		replaced |= drm_property_replace_blob(&crtc_state->gamma_lut,
> > -						      gamma_lut);
> > +						      crtc->has_gamma_prop ? gamma_lut : NULL);
> >  		crtc_state->color_mgmt_changed |= replaced;
> >  	}
> >  
> > diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> > index ba839e5e357d..4d9e217e5040 100644
> > --- a/include/drm/drm_crtc.h
> > +++ b/include/drm/drm_crtc.h
> > @@ -1084,6 +1084,9 @@ struct drm_crtc {
> >  	 */
> >  	uint16_t *gamma_store;
> >  
> > +	bool has_gamma_prop : 1;
> > +	bool has_degamma_prop : 1;

I'm a bit behind on patches, but in case this got missed please remove
this and replace with the (obj, prop) lookup function thing or something
like that. Makes sure everything stays in sync, plus like I said atomic
uses this a ton. So not a problem here.
-Daniel

> > +
> >  	/** @helper_private: mid-layer private data */
> >  	const struct drm_crtc_helper_funcs *helper_private;
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
