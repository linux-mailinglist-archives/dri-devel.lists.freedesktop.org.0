Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D8C22A1BB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 00:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E2B6E197;
	Wed, 22 Jul 2020 22:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAEE6E197
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 22:02:34 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f2so3295496wrp.7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 15:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TVW27kb9g0WVpUCG/L19nwuMfD1I96laaDI8H/ejlWY=;
 b=URdm2Q7NjHiWzFqFaunLLT9jLMErtBN2WvuETCu2xzUO5mO2sl2OtezPPTfyaEuCgx
 GBRLhPQU2mpEJZxgtTVPnYCCU9rIJroDlSlkOkk/IRrpZtyVEEEvS6UEjrEr9Sw0c7kp
 5WBr5XLO46gZnZzwr6OK8Hp9N4HoVE+0Ov49k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TVW27kb9g0WVpUCG/L19nwuMfD1I96laaDI8H/ejlWY=;
 b=m1nqslYeeEl38xmtGrnPDZm4QcLqOZWi5pdZX8JIK/TfWFBqfTonw7km7fCidP1wSd
 eK5KgBWVZhT5v6F00MN+E+uBnFclnm8ZT4o88maRNkC4qeQEG8qvq8AxQVkNkCwhY/Pl
 URW9kAQWzHsK/hDuRU5b1d/WL6RP//PA+sa/l+Oo9HLJcWaQtOHF6gCZksXtY4643Ww8
 ralAwMpI1pjIxIozAHgBvcesl3aAhwzK+PWlRW+Gt7w6xA9ATAZ+WnsgMVfpjIBt7l5C
 yEMwLY6NW4pJb9zDVEf3k4jlpC6VSTWgtmZ7gpmf20AxdKDXV5QX/433iNk0UlxL0K9v
 o2VQ==
X-Gm-Message-State: AOAM531fEPvh81214+ScyIVgQ8JPXxdu4PiL/ztMflA6IP7BpUPtQQw0
 LucSPIxi/N7KlJGBZGNtXv+EPQ==
X-Google-Smtp-Source: ABdhPJwo41G/LCK4Jy9pJ6H3XQyfOszcdzaLTml1d/ePfCDzX/Ne1UiRqGUIxIEzp5fgYT4MTmOCOA==
X-Received: by 2002:a5d:6692:: with SMTP id l18mr1274589wru.211.1595455353079; 
 Wed, 22 Jul 2020 15:02:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q5sm1354979wrp.60.2020.07.22.15.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 15:02:31 -0700 (PDT)
Date: Thu, 23 Jul 2020 00:02:30 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 5/8] drm/imx: parallel-display: use drm managed resources
Message-ID: <20200722220230.GL6419@phenom.ffwll.local>
References: <20200722133042.30140-1-p.zabel@pengutronix.de>
 <20200722133042.30140-5-p.zabel@pengutronix.de>
 <ac269aecd712d8740e334367afa0c2e5db3a85c9.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ac269aecd712d8740e334367afa0c2e5db3a85c9.camel@pengutronix.de>
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 22, 2020 at 04:01:53PM +0200, Philipp Zabel wrote:
> On Wed, 2020-07-22 at 15:30 +0200, Philipp Zabel wrote:
> [...]
> > and use drmm_add_action_or_reset() to make sure drm_encoder_cleanup() is
> > called before the memory is freed.
> [...]
> > @@ -259,6 +259,13 @@ static const struct drm_bridge_funcs imx_pd_bridge_funcs = {
> >  	.atomic_get_output_bus_fmts = imx_pd_bridge_atomic_get_output_bus_fmts,
> >  };
> >  
> > +static void imx_pd_encoder_cleanup(struct drm_device *drm, void *ptr)
> > +{
> > +	struct drm_encoder *encoder = ptr;
> > +
> > +	drm_encoder_cleanup(encoder);
> > +}
> > +
> >  static int imx_pd_register(struct drm_device *drm,
> >  	struct imx_parallel_display *imxpd)
> >  {
> > @@ -276,7 +283,13 @@ static int imx_pd_register(struct drm_device *drm,
> >  	 */
> >  	imxpd->connector.dpms = DRM_MODE_DPMS_OFF;
> >  
> > -	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
> > +	ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = drmm_add_action_or_reset(drm, imx_pd_encoder_cleanup, encoder);
> > +	if (ret)
> > +		return ret;
> 
> This is only required because this is a component driver: our
> drmm_kzalloc() is called after drmm_mode_config_init(), so we can't rely
> on drm_mode_config_init_release() for cleanup. That is only called after
> drmres already freed our memory.

Yeah I know about the inversion, which is why I haven't yet started typing
the mass conversion for all the drm objects. I think the explicit
drmm_add_action_or_reset is indeed the way to go, except we probably want
some helpers to wrap the allocation, drm_foo_init and adding the reset
action all into one thing (plus you can stuff the reset action into the
allocation instead of the kfree action only, even nicer that way).

But that's maybe for later, and good to have some examples in drivers
already converted over as guidance.

On the series: Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

But way too late for solid review :-)

Cheers, Daniel

> 
> regards
> Philipp
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
