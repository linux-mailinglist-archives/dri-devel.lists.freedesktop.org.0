Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D7831655A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 12:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C64D96EC61;
	Wed, 10 Feb 2021 11:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEF06EC61
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 11:39:20 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id o10so3538048wmc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 03:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=hX8qOZfgR+ZXWOMc+RldjYNfp+QbD6NEbGVaRKYBH3s=;
 b=iqfdsa3CbY5LyS9l0VON4H2SvnynUCP77P13llTQi4kGN5CAceWwAAftLJCLCNA17D
 yta1/2GaPZuCrIwmJcuxoLw1DWOJGwW2c6Qt+qghJLSFPvjygBRyuiC9VXPMgeuA3t4N
 zHWOMhaiI8pT974j2pC36r99UBSPQyGIM7Kvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hX8qOZfgR+ZXWOMc+RldjYNfp+QbD6NEbGVaRKYBH3s=;
 b=reibNOBgeCTOdcCzDdxHEd2rvvdXeEnbQkhh/T4z2wG0KnwOe8XK6JAtP4bzi4mcJN
 +eJj8FadIhBpU7j3g/DVajAy08BfEnRkULRrkal7sveC5H3qvYNr1+vmYSsom3dHqzE/
 MlO8oJXmjyAkUXpKAlDdY5TzNeS01O5CwA29ow4YZFajMk8dXQYTMetwXsklIEy0XR+9
 fvJ05ogZRnJa0Jn3J2vHL++hTRzoJX5ykk82a1XhgpQWw6bKMguPCRC7y1uPSTqwTp7x
 w95dUaW8yj4GegiV8sCKBsZMOBT0bvUgfY4BJl4kN+DuVGdoCfdKS/QGIWnjM2EsIJxr
 P28g==
X-Gm-Message-State: AOAM530i4jmF6sGtkEUnDpnvk9wdtYWMYRKFt6cXYT6HS2RB7jSTDf2M
 i6/AQ4Wi/xdsHxL0aDOuLqrP8g==
X-Google-Smtp-Source: ABdhPJzJXp2jMAZpMFOjY5jUs3ivLKgJbpxoZJ23nenqhONYtVgUKrIen0nbzluucNR6gFfv1Pgt0w==
X-Received: by 2002:a05:600c:19c6:: with SMTP id
 u6mr2540625wmq.143.1612957159356; 
 Wed, 10 Feb 2021 03:39:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w11sm2054327wmi.37.2021.02.10.03.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 03:39:18 -0800 (PST)
Date: Wed, 10 Feb 2021 12:39:16 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/vblank: Document drm_crtc_vblank_restore constraints
Message-ID: <YCPF5N8MUthpiTwr@phenom.ffwll.local>
References: <20210209101523.2954281-1-daniel.vetter@ffwll.ch>
 <YCKr50cudEYgAiiF@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCKr50cudEYgAiiF@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 09, 2021 at 05:36:07PM +0200, Ville Syrj=E4l=E4 wrote:
> On Tue, Feb 09, 2021 at 11:15:23AM +0100, Daniel Vetter wrote:
> > I got real badly confused when trying to review a fix from Ville for
> > this. Let's try to document better what's required for this, and check
> > the minimal settings at runtime - we can't check ofc that there's
> > indeed no races in the driver callback.
> > =

> > Also noticed that the drm_vblank_restore version is unused, so lets
> > unexport that while at it.
> > =

> > Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/gpu/drm/drm_vblank.c | 25 ++++++++++---------------
> >  include/drm/drm_vblank.h     |  1 -
> >  2 files changed, 10 insertions(+), 16 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> > index c914b14cfb43..05f4d4c078fd 100644
> > --- a/drivers/gpu/drm/drm_vblank.c
> > +++ b/drivers/gpu/drm/drm_vblank.c
> > @@ -1471,20 +1471,7 @@ void drm_crtc_vblank_on(struct drm_crtc *crtc)
> >  }
> >  EXPORT_SYMBOL(drm_crtc_vblank_on);
> >  =

> > -/**
> > - * drm_vblank_restore - estimate missed vblanks and update vblank coun=
t.
> > - * @dev: DRM device
> > - * @pipe: CRTC index
> > - *
> > - * Power manamement features can cause frame counter resets between vb=
lank
> > - * disable and enable. Drivers can use this function in their
> > - * &drm_crtc_funcs.enable_vblank implementation to estimate missed vbl=
anks since
> > - * the last &drm_crtc_funcs.disable_vblank using timestamps and update=
 the
> > - * vblank counter.
> > - *
> > - * This function is the legacy version of drm_crtc_vblank_restore().
> > - */
> > -void drm_vblank_restore(struct drm_device *dev, unsigned int pipe)
> > +static void drm_vblank_restore(struct drm_device *dev, unsigned int pi=
pe)
> >  {
> >  	ktime_t t_vblank;
> >  	struct drm_vblank_crtc *vblank;
> > @@ -1520,7 +1507,6 @@ void drm_vblank_restore(struct drm_device *dev, u=
nsigned int pipe)
> >  		    diff, diff_ns, framedur_ns, cur_vblank - vblank->last);
> >  	store_vblank(dev, pipe, diff, t_vblank, cur_vblank);
> >  }
> > -EXPORT_SYMBOL(drm_vblank_restore);
> >  =

> >  /**
> >   * drm_crtc_vblank_restore - estimate missed vblanks and update vblank=
 count.
> > @@ -1531,9 +1517,18 @@ EXPORT_SYMBOL(drm_vblank_restore);
> >   * &drm_crtc_funcs.enable_vblank implementation to estimate missed vbl=
anks since
> >   * the last &drm_crtc_funcs.disable_vblank using timestamps and update=
 the
> >   * vblank counter.
> > + *
> > + * Note that drivers must have race-free high-precision timestamping s=
upport,
> > + * i.e.  &drm_crtc_funcs.get_vblank_timestamp must be hooked up and
> > + * &drm_driver.vblank_disable_immediate must be set to indicate the
> > + * time-stamping functions are race-free against vblank hardware count=
er
> > + * increments.
> =

> Looks good. Might prevent someone from shooting themselves in
> the foot.

Yeah hopefully, maybe even me :-)


> =

> Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Thanks for your review, I pushed to drm-misc-next.
-Daniel

> =

> >   */
> >  void drm_crtc_vblank_restore(struct drm_crtc *crtc)
> >  {
> > +	WARN_ON_ONCE(!crtc->funcs->get_vblank_timestamp);
> > +	WARN_ON_ONCE(!crtc->dev->vblank_disable_immediate);
> > +
> >  	drm_vblank_restore(crtc->dev, drm_crtc_index(crtc));
> >  }
> >  EXPORT_SYMBOL(drm_crtc_vblank_restore);
> > diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> > index dd125f8c766c..733a3e2d1d10 100644
> > --- a/include/drm/drm_vblank.h
> > +++ b/include/drm/drm_vblank.h
> > @@ -247,7 +247,6 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc);
> >  void drm_crtc_vblank_reset(struct drm_crtc *crtc);
> >  void drm_crtc_vblank_on(struct drm_crtc *crtc);
> >  u64 drm_crtc_accurate_vblank_count(struct drm_crtc *crtc);
> > -void drm_vblank_restore(struct drm_device *dev, unsigned int pipe);
> >  void drm_crtc_vblank_restore(struct drm_crtc *crtc);
> >  =

> >  void drm_calc_timestamping_constants(struct drm_crtc *crtc,
> > -- =

> > 2.30.0
> =

> -- =

> Ville Syrj=E4l=E4
> Intel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
