Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A3D1E7C28
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 13:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD756E8CE;
	Fri, 29 May 2020 11:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B851E6E8CC
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 11:44:47 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v19so2944882wmj.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 04:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=CWZW0brigDhHuwUPT0N5cVqqNsShAY5Bk/tmJTlhXXo=;
 b=RrTm/HvNJjOdbrPVvxKE38bT5xR+b5JyglIpw9asfeiOeS0Zh1/M+hTW5cnn6jP7kH
 HZ3hbpnDSWS0Og9t7PDlJfI6GlMpwKLCQhWO0uDbmKswg7Y/0+qSwaAz3IgQITHXbss3
 TRS+dFIY0xlGmsgFG0drFQJafI2COh1Pokna4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=CWZW0brigDhHuwUPT0N5cVqqNsShAY5Bk/tmJTlhXXo=;
 b=GA5Dl6pbC4yYMFjbLCA6s0d0ZJSqy7ba6iOudUiqT5laxiRHQjVo6FJUHk5Fyljal5
 CINFODHqz/2F8LFzENjwiszlS3hNTy/NurXnfM0Hh07j1bcsX73Khw2kK6SK4ka0tYWi
 m+NUDSA1ORhBpZLRg27wQT+rEXY/Kfq3JniV59y7qlJ3vT7z7PKb9g5Y3Qzl4ETo+h2v
 mIcGBO22PzsR+6suIveLVMPS4ewuUQ86jT8p7aQ7bZViLzSX5SAKVtA4KUWjpK9Ut07w
 sjwgHzD3nO70HrmbN7Br3hqcHs5pzFNm2rTD+Ck/0gNZo5EMiEB/RJIbJGiY9emvbOBX
 VNDg==
X-Gm-Message-State: AOAM533svFa4t677IUVuYHmpj2HpNe87Wqz8ihit6u1biYdBAoTSaTI2
 5a9mSG/90VtXEKPt+cv9EEo49w==
X-Google-Smtp-Source: ABdhPJxansyb5PnLxUfFjvBDCGBY1gLSJZ4svvnAjSRMab0yGi9/wjFJVcJYG8SAqxfgDkAsSZwAUQ==
X-Received: by 2002:a7b:c358:: with SMTP id l24mr8638180wmj.13.1590752686181; 
 Fri, 29 May 2020 04:44:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c5sm9709168wrb.72.2020.05.29.04.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 04:44:45 -0700 (PDT)
Date: Fri, 29 May 2020 13:39:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: use drm_dev_has_vblank more
Message-ID: <20200529113917.GB1630358@phenom.ffwll.local>
References: <20200527111134.1571781-1-daniel.vetter@ffwll.ch>
 <62d8b46c-0d77-5f37-2894-aea0d3b76ae1@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62d8b46c-0d77-5f37-2894-aea0d3b76ae1@suse.de>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 02:02:12PM +0200, Thomas Zimmermann wrote:
> =

> Am 27.05.20 um 13:11 schrieb Daniel Vetter:
> > For historical reasons it's called dev->num_crtcs, which is rather
> > confusing ever since kms was added. But now we have a nice helper, so
> > let's use it for better readability!
> > =

> > Only code change is in atomic helpers: vblank support means that
> > dev->irq_enabled must be set too. Another one of these quirky things
> > ... But since it's implied we can simplify that check.
> > =

> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> =

> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your review, patch queued up.
-Daniel

> =

> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c |  2 +-
> >  drivers/gpu/drm/drm_irq.c           |  2 +-
> >  drivers/gpu/drm/drm_vblank.c        | 14 +++++++-------
> >  3 files changed, 9 insertions(+), 9 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
> > index 0a541368246e..bfcc7857a9a1 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -1097,7 +1097,7 @@ disable_outputs(struct drm_device *dev, struct dr=
m_atomic_state *old_state)
> >  		else if (funcs->dpms)
> >  			funcs->dpms(crtc, DRM_MODE_DPMS_OFF);
> >  =

> > -		if (!(dev->irq_enabled && dev->num_crtcs))
> > +		if (!drm_dev_has_vblank(dev))
> >  			continue;
> >  =

> >  		ret =3D drm_crtc_vblank_get(crtc);
> > diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
> > index 588be45abd7a..09d6e9e2e075 100644
> > --- a/drivers/gpu/drm/drm_irq.c
> > +++ b/drivers/gpu/drm/drm_irq.c
> > @@ -181,7 +181,7 @@ int drm_irq_uninstall(struct drm_device *dev)
> >  	 * vblank/irq handling. KMS drivers must ensure that vblanks are all
> >  	 * disabled when uninstalling the irq handler.
> >  	 */
> > -	if (dev->num_crtcs) {
> > +	if (drm_dev_has_vblank(dev)) {
> >  		spin_lock_irqsave(&dev->vbl_lock, irqflags);
> >  		for (i =3D 0; i < dev->num_crtcs; i++) {
> >  			struct drm_vblank_crtc *vblank =3D &dev->vblank[i];
> > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> > index e278d6407f8e..162d9f7e692a 100644
> > --- a/drivers/gpu/drm/drm_vblank.c
> > +++ b/drivers/gpu/drm/drm_vblank.c
> > @@ -605,7 +605,7 @@ void drm_calc_timestamping_constants(struct drm_crt=
c *crtc,
> >  	int linedur_ns =3D 0, framedur_ns =3D 0;
> >  	int dotclock =3D mode->crtc_clock;
> >  =

> > -	if (!dev->num_crtcs)
> > +	if (!drm_dev_has_vblank(dev))
> >  		return;
> >  =

> >  	if (WARN_ON(pipe >=3D dev->num_crtcs))
> > @@ -1065,7 +1065,7 @@ void drm_crtc_send_vblank_event(struct drm_crtc *=
crtc,
> >  	unsigned int pipe =3D drm_crtc_index(crtc);
> >  	ktime_t now;
> >  =

> > -	if (dev->num_crtcs > 0) {
> > +	if (drm_dev_has_vblank(dev)) {
> >  		seq =3D drm_vblank_count_and_time(dev, pipe, &now);
> >  	} else {
> >  		seq =3D 0;
> > @@ -1137,7 +1137,7 @@ static int drm_vblank_get(struct drm_device *dev,=
 unsigned int pipe)
> >  	unsigned long irqflags;
> >  	int ret =3D 0;
> >  =

> > -	if (!dev->num_crtcs)
> > +	if (!drm_dev_has_vblank(dev))
> >  		return -EINVAL;
> >  =

> >  	if (WARN_ON(pipe >=3D dev->num_crtcs))
> > @@ -1506,7 +1506,7 @@ static void drm_legacy_vblank_pre_modeset(struct =
drm_device *dev,
> >  	struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> >  =

> >  	/* vblank is not initialized (IRQ not installed ?), or has been freed=
 */
> > -	if (!dev->num_crtcs)
> > +	if (!drm_dev_has_vblank(dev))
> >  		return;
> >  =

> >  	if (WARN_ON(pipe >=3D dev->num_crtcs))
> > @@ -1533,7 +1533,7 @@ static void drm_legacy_vblank_post_modeset(struct=
 drm_device *dev,
> >  	unsigned long irqflags;
> >  =

> >  	/* vblank is not initialized (IRQ not installed ?), or has been freed=
 */
> > -	if (!dev->num_crtcs)
> > +	if (!drm_dev_has_vblank(dev))
> >  		return;
> >  =

> >  	if (WARN_ON(pipe >=3D dev->num_crtcs))
> > @@ -1558,7 +1558,7 @@ int drm_legacy_modeset_ctl_ioctl(struct drm_devic=
e *dev, void *data,
> >  	unsigned int pipe;
> >  =

> >  	/* If drm_vblank_init() hasn't been called yet, just no-op */
> > -	if (!dev->num_crtcs)
> > +	if (!drm_dev_has_vblank(dev))
> >  		return 0;
> >  =

> >  	/* KMS drivers handle this internally */
> > @@ -1896,7 +1896,7 @@ bool drm_handle_vblank(struct drm_device *dev, un=
signed int pipe)
> >  	unsigned long irqflags;
> >  	bool disable_irq, fence_cookie;
> >  =

> > -	if (WARN_ON_ONCE(!dev->num_crtcs))
> > +	if (WARN_ON_ONCE(!drm_dev_has_vblank(dev)))
> >  		return false;
> >  =

> >  	if (WARN_ON(pipe >=3D dev->num_crtcs))
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
