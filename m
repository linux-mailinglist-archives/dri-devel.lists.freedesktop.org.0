Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 613B939082B
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 19:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF6B6EA98;
	Tue, 25 May 2021 17:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D576E922
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 17:53:20 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id x7so13540814wrt.12
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 10:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=WrujumSU1+zFWWJ08KI/mKxpUxzEYo1k79qwI4tpPX4=;
 b=V9ncVLSmygkTfM2oPQ84z6Lujtq6HnByiOAXrwpFLtmVWSjeiS804G0dT6nm2JKDVg
 EGENymltvvxULFs/aDscReqFUJhdDkaOIsK0ZceryNjgHpvEnhxWnC6YGldOlVnBgznh
 Q/otsxxoQaAxjrDpg+lU453cXJrjWWUfFGFYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=WrujumSU1+zFWWJ08KI/mKxpUxzEYo1k79qwI4tpPX4=;
 b=Rjc2ZaRrkxOas1lnJsBtPCrSloSo8g8YI8cFoj2klI92wGu0lgJji8PNu/12UbpP77
 aeB5lzr/P3suast7Okj+xVbudvLz/5EeHsNh+YJPiZ3cDFhZouAr+ch7NJIkWv7bflPm
 OZCeFdBb9r33PdG/n4qYj/RstiWhMzRGgaXCcWbGmuC49hk5xyVzSMtToPXRxdCFsDji
 aPo50J9pTBg3P8lW6WMwQmJGPVdY3MC8sKyzu0DlWNndtNa4pZvRznqaooeeTIkwucyA
 UHCqBAwNBC0YnHLZW30hNqh452SkPFAZTIHFrol2qsW24bbfD+ujyvLGi6DyP4+k6CwI
 UzmA==
X-Gm-Message-State: AOAM533kcCvxS+aa6FYAMlFS/+CYUU/NgXTZ3vh4eAMovUHK3Ac2JF6z
 Q0hSYVfGmNgyNH3mH+24x0mSDA==
X-Google-Smtp-Source: ABdhPJxljLzeq4dlgAEQSqMzAtn+gBYB8ZH4HqYKFTr7n8n2Ap1WE1dcxVz8hN9c/6XLLnVYqPFuag==
X-Received: by 2002:adf:e291:: with SMTP id v17mr28880122wri.149.1621965199488; 
 Tue, 25 May 2021 10:53:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z188sm11957986wme.38.2021.05.25.10.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 10:53:18 -0700 (PDT)
Date: Tue, 25 May 2021 19:53:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 10/11] drm/simple-helper:
 drm_gem_simple_display_pipe_prepare_fb as default
Message-ID: <YK05jUaHtxkHIyAG@phenom.ffwll.local>
References: <20210521090959.1663703-10-daniel.vetter@ffwll.ch>
 <9d855dc6-5825-4666-6d70-e5f3f880c592@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d855dc6-5825-4666-6d70-e5f3f880c592@tronnes.org>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: airlied@linux.ie, daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, daniel.vetter@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 25, 2021 at 07:48:12PM +0200, Noralf Trønnes wrote:
> > It's tedious to review this all the time, and my audit showed that
> > arcpgu actually forgot to set this.
> >
> > Make this the default and stop worrying.
> >
> > Again I sprinkled WARN_ON_ONCE on top to make sure we don't have
> > strange combinations of hooks: cleanup_fb without prepare_fb doesn't
> > make sense, and since simpler drivers are all new they better be GEM
> > based drivers.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >  drivers/gpu/drm/drm_simple_kms_helper.c | 12 ++++++++++--
> >  include/drm/drm_simple_kms_helper.h     |  7 +++++--
> >  2 files changed, 15 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c
> b/drivers/gpu/drm/drm_simple_kms_helper.c
> > index 0b095a313c44..1a97571d97d9 100644
> > --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> > +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> > @@ -9,6 +9,8 @@
> >  #include <drm/drm_atomic.h>
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_bridge.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_gem_atomic_helper.h>
> >  #include <drm/drm_managed.h>
> >  #include <drm/drm_plane_helper.h>
> >  #include <drm/drm_probe_helper.h>
> > @@ -225,8 +227,14 @@ static int drm_simple_kms_plane_prepare_fb(struct
> drm_plane *plane,
> >  	struct drm_simple_display_pipe *pipe;
> >
> >  	pipe = container_of(plane, struct drm_simple_display_pipe, plane);
> > -	if (!pipe->funcs || !pipe->funcs->prepare_fb)
> > -		return 0;
> > +	if (!pipe->funcs || !pipe->funcs->prepare_fb) {
> > +		if (WARN_ON_ONCE(drm_core_check_feature(plane->dev, DRIVER_GEM)))
> 
> Shouldn't this check be inverted? Looks like it warns on GEM drivers.

Ah yes, I'll fix.

> With that considered:
> 
> Acked-by: Noralf Trønnes <noralf@tronnes.org>
> 
> Hopefully this reply will thread correctly, I had to reply from lore (I
> wasn't cc'ed) and I don't know if Thunderbird sets In-Reply-To. I'm not
> subscribed to dri-devel anymore since I'm winding down my Linux work and
> dri-devel is such a high volume list.

Thanks a lot for taking a look, threaded all correctly.
-Daniel

> Noralf
> 
> > +			return 0;
> > +
> > +		WARN_ON_ONCE(pipe->funcs && pipe->funcs->cleanup_fb);
> > +
> > +		return drm_gem_simple_display_pipe_prepare_fb(pipe, state);
> > +	}
> >
> >  	return pipe->funcs->prepare_fb(pipe, state);
> >  }

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
