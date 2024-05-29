Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D52A8D32E6
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 11:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A00D10E135;
	Wed, 29 May 2024 09:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cc4KeZyd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B880310E40D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 09:26:00 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2e9819a630fso27770891fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 02:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716974759; x=1717579559; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=U7M+6whUTEmNjnpu1Sb+Z0aij1A0+ZQLlNoXxVJQ/2k=;
 b=cc4KeZydFH2S5gsRD7DyyKShL8c6E+M9TtxoZBJGJ1xhMGEMRfXS+oZjy218VoEjx2
 Th0waAPARXMmhrz8ccutzHuKj6XqJsq60Gtain1/eIF+d8+z7k1PkHcxbTD6GF+kVzev
 BBHVjjRgHQU0L52UK69bLISAeVzc1+vBaO/dtaua/mvLjquDjcXRV00QPZslf8RBVG0y
 9uofHy1zur5PRbnu78VmUg1ivlGsbYD6vDQxV3/JVRL8/lZ25wiWN3S92NtHRrbGaiX/
 vdj7oWwsdCIXhqWERd14vRpSwTcD88jH9ANG9Dcz1uAvleNqF4nwRn8tV4VqxCjMNm7u
 wRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716974759; x=1717579559;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U7M+6whUTEmNjnpu1Sb+Z0aij1A0+ZQLlNoXxVJQ/2k=;
 b=ICZf4JC+gbVtwstYpVcvF4PB9DjRTFq50/hX6R1XY0Qm8WV+d/vNS8YeDBqaC9iTwC
 tVb71uEWOaAzZyP61KfvId5KAp8Dp9v4gRMM82CVrbJCk+oW3bWhGNhgrKrpADcWwJCt
 KuW590XAwY4gkjpDj5d6kGIhWwTIHZD3ksSrkHQkR2DSxQTfrdLP87I/nWtQ6B0nIQjE
 Swt+gh35mr/bZbs8nNngeY5XCo6rryQYQmlvF9GEllg+xaNCzM3GwVE5+MoIgcpdMcdE
 6CD7JCcaAecEX9ErqxQ1RcUJWXaEi4VnJk41OSfl6OwQYG0sVO6I4/xDxq2QUn0rBkXv
 cLDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7I7gSrGgA0rvfEUPGgpRfQL1AXfojFpyeILiMVikadzAET9hL8Z1aIIu2W7c1P6REZTMEmmYOthkz4K/p0OyUV4mjr5sTROaAFG98PP9z
X-Gm-Message-State: AOJu0Yzy/gcwsYZwBTEbH7zOTww4F/lLr3Il2XTM4feWVCDMr+F1m8Tt
 jvdQtPVHe/su6npjqUEWuh7ws3gFK/GbidPhD2PA3jWtosQm8LSEhPLL4HIldoQ=
X-Google-Smtp-Source: AGHT+IGKl/M+WUUwHVmgRl1kPjf7k4Su4v42LXyHudw4STXx6hfr0vx/0xp3+57LGxE9OzlRGbSPpw==
X-Received: by 2002:a2e:9dd2:0:b0:2e9:865e:4ab4 with SMTP id
 38308e7fff4ca-2e9865e552cmr34092681fa.38.1716974758568; 
 Wed, 29 May 2024 02:25:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e95bcd7bc7sm25281051fa.38.2024.05.29.02.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 02:25:58 -0700 (PDT)
Date: Wed, 29 May 2024 12:25:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: renesas: shmobile: Add drm_panic support
Message-ID: <zyd7e55dfonmacewfscac5sdrypx5rsjwvkt7umhbnjltd3rz4@wabvqnsrlatl>
References: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
 <20240529010320.GI1436@pendragon.ideasonboard.com>
 <u5aijnvotestpgjynawcx7oxsp2lncnsda5w4jfzeovvdlfcyt@5fxnyfbk4ocb>
 <20240529091018.GK1436@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529091018.GK1436@pendragon.ideasonboard.com>
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

On Wed, May 29, 2024 at 12:10:18PM +0300, Laurent Pinchart wrote:
> Hi Dmitry,
> 
> On Wed, May 29, 2024 at 11:27:02AM +0300, Dmitry Baryshkov wrote:
> > On Wed, May 29, 2024 at 04:03:20AM +0300, Laurent Pinchart wrote:
> > > On Mon, May 27, 2024 at 03:34:48PM +0200, Geert Uytterhoeven wrote:
> > > > Add support for the drm_panic module, which displays a message on
> > > > the screen when a kernel panic occurs.
> > > > 
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > Tested on Armadillo-800-EVA.
> > > > ---
> > > >  drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 14 +++++++++++++-
> > > >  1 file changed, 13 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > > > index 07ad17d24294d5e6..9d166ab2af8bd231 100644
> > > > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > > > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > > > @@ -273,6 +273,13 @@ static const struct drm_plane_helper_funcs shmob_drm_plane_helper_funcs = {
> > > >  	.atomic_disable = shmob_drm_plane_atomic_disable,
> > > >  };
> > > >  
> > > > +static const struct drm_plane_helper_funcs shmob_drm_primary_plane_helper_funcs = {
> > > > +	.atomic_check = shmob_drm_plane_atomic_check,
> > > > +	.atomic_update = shmob_drm_plane_atomic_update,
> > > > +	.atomic_disable = shmob_drm_plane_atomic_disable,
> > > > +	.get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
> > > > +};
> > > > +
> > > >  static const struct drm_plane_funcs shmob_drm_plane_funcs = {
> > > >  	.update_plane = drm_atomic_helper_update_plane,
> > > >  	.disable_plane = drm_atomic_helper_disable_plane,
> > > > @@ -310,7 +317,12 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
> > > >  
> > > >  	splane->index = index;
> > > >  
> > > > -	drm_plane_helper_add(&splane->base, &shmob_drm_plane_helper_funcs);
> > > > +	if (type == DRM_PLANE_TYPE_PRIMARY)
> > > > +		drm_plane_helper_add(&splane->base,
> > > > +				     &shmob_drm_primary_plane_helper_funcs);
> > > > +	else
> > > > +		drm_plane_helper_add(&splane->base,
> > > > +				     &shmob_drm_plane_helper_funcs);
> > > 
> > > It's not very nice to have to provide different operations for the
> > > primary and overlay planes. The documentation of
> > > drm_fb_dma_get_scanout_buffer() states
> > > 
> > >  * @plane: DRM primary plane
> > > 
> > > If the intent is that only primary planes will be used to display the
> > > panic message, shouldn't drm_panic_register() skip overlay planes ? It
> > > would simplify drivers.
> > 
> > What about the drivers where all the planes are actually universal?
> > In such a case the planes registered as primary can easily get replaced
> > by 'overlay' planes.
> 
> Good point.
> 
> Another option, if we wanted to avoid duplicating the drm_plane_funcs,
> would be to add a field to drm_plane to indicate whether the plane is
> suitable for drm_panic.

... or maybe let the driver decide. For the fully-universal-plane
devices we probably want to select the planes which cover the largest
part of the CRTC.

> 
> I don't think this patch should be blocked just for this reason, but I'm
> a bit bothered by duplicating the ops structure to indicate drm_panic
> support.
> 
> > > >  
> > > >  	return &splane->base;
> > > >  }
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
With best wishes
Dmitry
