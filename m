Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9260A8D3134
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 10:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C2410ED6C;
	Wed, 29 May 2024 08:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ARlcYn5m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6BD112666
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 08:27:06 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2e3efa18e6aso6521821fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 01:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716971224; x=1717576024; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ew5kOSPuOpf/rbjC9WMYQnE13lezm/hBTRV8baBS8/w=;
 b=ARlcYn5m/0tpS7OSgr9+FXsh3AaXpL91+Lh+M//E5IrUhjj0sp1Qog2uS7UVAzj78A
 ByvcS+MVeEEt63dvgp501qPS29wblLlZnc0V1dOeVnYEwVlijRrfwEE8BaRmG8uBvhMn
 8UQK1UiYfwfi+2O2kauAhVa4DZYO2ShjBi21/SZYBXGVWWAKH8vt3VDKc4P2SCZdbktg
 oDDH9LBC+HS3HXPEuuWB/jd++EbWdjJhtas3ggv3IA0Ln/DhKmjzYvOJxZdsYhh/8kFR
 cRS9TDRlp3BKdPNyu9pyXdip/ATuq86tTvWLMRxEiKWen3uipAuRCTGQKR0NuQ+klKga
 dxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716971224; x=1717576024;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ew5kOSPuOpf/rbjC9WMYQnE13lezm/hBTRV8baBS8/w=;
 b=AVARNrwl9Ni1hETCUBBW303dZM8wiA56pehJvdycZpox9FUSIwqh18ieY1tXQOnDu2
 gtdbmH/1jAeRhRooWJK+CuxrclWRg66hjG6yPnqjHseh6Cr3S8QAjlmDcFLjqqzpwNVY
 LqIiEkeNRh9VkBYgI76xnCXgrrKXsoPGXYdpMdPVXWnwTPlmdw0FQ+i0f7LPOVDo9nFk
 Res1IN2oAliJi9MUS4g2o+iN/FJaxtoybdNjEymIm/0oGPKaoPCLB1ue3lJLM0gV0i0j
 ScaXtxkFoccRDLs9PwyHXGvQUAVfEJ5t3PCrFd3Tgj7lgmZ/rHhGfqD16mFUpTApZaK4
 +eeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJt83IDSxIcccIMz97axX0s6nwwuaMonyXsVKl24Z56Vy/tmH8LzciMfaX4nJPrAqpv70M6Ztbaz6f9CtcZNQwFngXRFlEGzUWlqQXUCZZ
X-Gm-Message-State: AOJu0YxWv5tdwe4m+AB25ptPfu/zE5srs9n3i5c7wODiUNirQV2zkk8j
 oCrvtepghLzA7354mUN9ER9ZPoYMpx2VpdkF1Tbcx6jj2CDOE1R39G7pVEBxSuE=
X-Google-Smtp-Source: AGHT+IF6mhnSGRbm4g5MK0kTsSE8svbYIGrPzv5lYvCwRuHizT+MZHjY4lcDRv1Vmf7BManeCoA2eQ==
X-Received: by 2002:a2e:a9a1:0:b0:2e9:58d9:6d8 with SMTP id
 38308e7fff4ca-2ea46e842eamr5391481fa.7.1716971224490; 
 Wed, 29 May 2024 01:27:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ea7d552a44sm840071fa.80.2024.05.29.01.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 01:27:04 -0700 (PDT)
Date: Wed, 29 May 2024 11:27:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: renesas: shmobile: Add drm_panic support
Message-ID: <u5aijnvotestpgjynawcx7oxsp2lncnsda5w4jfzeovvdlfcyt@5fxnyfbk4ocb>
References: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
 <20240529010320.GI1436@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529010320.GI1436@pendragon.ideasonboard.com>
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

On Wed, May 29, 2024 at 04:03:20AM +0300, Laurent Pinchart wrote:
> Hi Geert,
> 
> Thank you for the patch.
> 
> On Mon, May 27, 2024 at 03:34:48PM +0200, Geert Uytterhoeven wrote:
> > Add support for the drm_panic module, which displays a message on
> > the screen when a kernel panic occurs.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Tested on Armadillo-800-EVA.
> > ---
> >  drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > index 07ad17d24294d5e6..9d166ab2af8bd231 100644
> > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > @@ -273,6 +273,13 @@ static const struct drm_plane_helper_funcs shmob_drm_plane_helper_funcs = {
> >  	.atomic_disable = shmob_drm_plane_atomic_disable,
> >  };
> >  
> > +static const struct drm_plane_helper_funcs shmob_drm_primary_plane_helper_funcs = {
> > +	.atomic_check = shmob_drm_plane_atomic_check,
> > +	.atomic_update = shmob_drm_plane_atomic_update,
> > +	.atomic_disable = shmob_drm_plane_atomic_disable,
> > +	.get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
> > +};
> > +
> >  static const struct drm_plane_funcs shmob_drm_plane_funcs = {
> >  	.update_plane = drm_atomic_helper_update_plane,
> >  	.disable_plane = drm_atomic_helper_disable_plane,
> > @@ -310,7 +317,12 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
> >  
> >  	splane->index = index;
> >  
> > -	drm_plane_helper_add(&splane->base, &shmob_drm_plane_helper_funcs);
> > +	if (type == DRM_PLANE_TYPE_PRIMARY)
> > +		drm_plane_helper_add(&splane->base,
> > +				     &shmob_drm_primary_plane_helper_funcs);
> > +	else
> > +		drm_plane_helper_add(&splane->base,
> > +				     &shmob_drm_plane_helper_funcs);
> 
> It's not very nice to have to provide different operations for the
> primary and overlay planes. The documentation of
> drm_fb_dma_get_scanout_buffer() states
> 
>  * @plane: DRM primary plane
> 
> If the intent is that only primary planes will be used to display the
> panic message, shouldn't drm_panic_register() skip overlay planes ? It
> would simplify drivers.

What about the drivers where all the planes are actually universal?
In such a case the planes registered as primary can easily get replaced
by 'overlay' planes.

> 
> >  
> >  	return &splane->base;
> >  }
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
With best wishes
Dmitry
