Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F091B2299C3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 16:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283986E0DA;
	Wed, 22 Jul 2020 14:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93476E0DA
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 14:06:13 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id o8so2056760wmh.4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 07:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ongf4p6aP2My24Uxfp0svoHFhDj2TM3l1hdZG1NY5q4=;
 b=uKJ98pF+IFpZMaRMVHKIw5BVIpdWNaGFre4Acqx7PwtmnWuv2/VSoWVE1KXvQWD0TE
 0HFbELRSJQWZtvyn6EZ8dmBAA2uV/1PZYQhQMPu52y1oSIa8edTBXmopBc/x6Ll+MfuU
 LovqfeOwiar3QpZ8ixAVQ+1JgEy/63E/MiOpC+rg6M0PJ3BCJM0uB4mJ0+Orz06jVAWe
 koALAjuzCRUq6Q2ow0cq6HXRS8PdFIpUCO/Sx2xG9myV1gIEjUoPdQqdyC3hdKXO1gyN
 +Z6Yn3mpRoRKeLy5E0PVpcOyItkApegxz6eRPNzGLVXNUHLiA3zROkj8dw0Y+Esxq3Qr
 5i/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ongf4p6aP2My24Uxfp0svoHFhDj2TM3l1hdZG1NY5q4=;
 b=P+n66eUPsDba9QNm3DVOJnVgT0osVeWs7sUWimmLIx9XVr1ut2D83Z8ghfiehCVSLr
 sNiXreNvMSLt+VrUD8FNqHJTqXSGEnnE8DUFEzk4UbvEeiRc1+ARr8eCi6lTv/JffVGO
 BE7gvwRNOQXjeSV2KSsLGZAOTZjeutJkN4mye2hvLCEc/dL9OgzMMFHLoy+pOk4CL9ut
 TuFV71LC0/6DnWgDprND8SXHbBRKfEToV5yRqUeY4MlTzO8CFyi9ygFVVJfhXVINqjea
 JY+K6YbwLOuZ+e+nPnWFAMkU1wXtDe0CGQ40ZO2WY8A/RJeArc8p79FhEx7XbGVU8kiX
 pIXw==
X-Gm-Message-State: AOAM533pusnmfBhY2PIlW6UoO8FwUopatcrIf5/fDElWMdbIByyQcsOo
 asms+Hp/zbA2PbPGtmQi1O8=
X-Google-Smtp-Source: ABdhPJzvOusKSRLM1OzsRH0f0M+D6Ieq/hCxH+kvP32AeMwulwpeyg11c3alT4NYKOpOKGJ1XRKbbA==
X-Received: by 2002:a05:600c:d5:: with SMTP id
 u21mr8492468wmm.156.1595426772425; 
 Wed, 22 Jul 2020 07:06:12 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id a22sm7657646wmj.9.2020.07.22.07.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 07:06:11 -0700 (PDT)
Date: Wed, 22 Jul 2020 11:06:04 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/vkms: add missing drm_crtc_vblank_put to the get/put
 pair on flush
Message-ID: <20200722140604.27dfzfnzug5vb75r@smtp.gmail.com>
References: <20200722110411.ebkv6knvc6mzw5uf@smtp.gmail.com>
 <20200722120502.GK6419@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722120502.GK6419@phenom.ffwll.local>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-usp@googlegroups.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/22, daniel@ffwll.ch wrote:
> On Wed, Jul 22, 2020 at 08:04:11AM -0300, Melissa Wen wrote:
> > This patch adds a missing drm_crtc_vblank_put op to the pair
> > drm_crtc_vblank_get/put (inc/decrement counter to guarantee vblanks).
> > 
> > It clears the execution of the following kms_cursor_crc subtests:
> > 1. pipe-A-cursor-[size,alpha-opaque, NxN-(on-screen, off-screen, sliding,
> >    random, fast-moving])] - successful when running individually.
> > 2. pipe-A-cursor-dpms passes again
> > 3. pipe-A-cursor-suspend also passes
> > 
> > The issue was initially tracked in the sequential execution of IGT
> > kms_cursor_crc subtest: when running the test sequence or one of its
> > subtests twice, the odd execs complete and the pairs get stuck in an
> > endless wait. In the IGT code, calling a wait_for_vblank before the start
> > of CRC capture prevented the busy-wait. But the problem persisted in the
> > pipe-A-cursor-dpms and -suspend subtests.
> > 
> > Checking the history, the pipe-A-cursor-dpms subtest was successful when,
> > in vkms_atomic_commit_tail, instead of using the flip_done op, it used
> > wait_for_vblanks. Another way to prevent blocking was wait_one_vblank when
> > enabling crtc. However, in both cases, pipe-A-cursor-suspend persisted
> > blocking in the 2nd start of CRC capture, which may indicate that
> > something got stuck in the step of CRC setup. Indeed, wait_one_vblank in
> > the crc setup was able to sync things and free all kms_cursor_crc
> > subtests.
> > 
> > Tracing and comparing a clean run with a blocked one:
> > - in a clean one, vkms_crtc_atomic_flush enables vblanks;
> > - when blocked, only in next op, vkms_crtc_atomic_enable, the vblanks
> > started. Moreover, a series of vkms_vblank_simulate flow out until
> > disabling vblanks.
> > Also watching the steps of vkms_crtc_atomic_flush, when the very first
> > drm_crtc_vblank_get returned an error, the subtest crashed. On the other
> > hand, when vblank_get succeeded, the subtest completed. Finally, checking
> > the flush steps: it increases counter to hold a vblank reference (get),
> > but there isn't a op to decreased it and release vblanks (put).
> > 
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> > ---
> >  drivers/gpu/drm/vkms/vkms_crtc.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > index ac85e17428f8..a99d6b4a92dd 100644
> > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > @@ -246,6 +246,7 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
> >  
> >  		spin_unlock(&crtc->dev->event_lock);
> >  
> > +		drm_crtc_vblank_put(crtc);
> 
> Uh so I reviewed this a bit more carefully now, and I dont think this is
> the correct bugfix. From the kerneldoc of drm_crtc_arm_vblank_event():
> 
>  * Caller must hold a vblank reference for the event @e acquired by a
>  * drm_crtc_vblank_get(), which will be dropped when the next vblank arrives.
> 
> So when we call drm_crtc_arm_vblank_event then the vblank_put gets called
> for us. And that's the only case where we successfully acquired a vblank
> interrupt reference since on failure of drm_crtc_vblank_get (0 indicates
> success for that function, failure negative error number) we directly send
> out the event.
> 
> So something else fishy is going on, and now I'm totally confused why this
> even happens.
> 
> We also have a pile of WARN_ON checks in drm_crtc_vblank_put to make sure
> we don't underflow the refcount, so it's also not that I think (except if
> this patch creates more WARNING backtraces).
> 
> But clearly it changes behaviour somehow ... can you try to figure out
> what changes? Maybe print out the vblank->refcount at various points in
> the driver, and maybe also trace when exactly the fake vkms vblank hrtimer
> is enabled/disabled ...

:(

I can check these, but I also have other suspicions. When I place the
drm_crct_vblank_put out of the if (at the end of flush), it not only solve
the issue of blocking on kms_cursor_crc, but also the WARN_ON on kms_flip
doesn't appear anymore (a total cleanup). Just after:

vkms_output->composer_state = to_vkms_crtc_state(crtc->state);

looks like there is something stuck around here.

Besides, there is a lock at atomic_begin:

  /* This lock is held across the atomic commit to block vblank timer
   * from scheduling vkms_composer_worker until the composer is updated
   */
  spin_lock_irq(&vkms_output->lock);

that seems to be released on atomic_flush and make me suspect something
missing on the composer update.

I'll check all these things and come back with news (hope) :)

Thanks,

Melissa
> 
> I'm totally confused about what's going on here now.
> -Daniel
> 
> >  		crtc->state->event = NULL;
> >  	}
> >  
> > -- 
> > 2.27.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
