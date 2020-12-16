Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC342DBDC8
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 10:41:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEE46E0D2;
	Wed, 16 Dec 2020 09:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2576E0D2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 09:41:51 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id x13so22329051oto.8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 01:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f3hFtHny9tWcZXe9Ppr41tOMRXk5DQrjAzV/rnP5TFc=;
 b=NYZ8CJ5ai6cJl9VtmTEM7bTiae/MtYvXAyJoXxtb8De6ETtw+NlEXRxOyL8rUhYAry
 BZLuMufDaHyUEu2hP5Fryx4vr1+F4iJPWLjJHJ4nQTMD4zfk0ZM5vbr43dRWuDCmhWm3
 gZEMzNXTjv/IlKikDOWk5ATZ34LDIaZXqqpQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f3hFtHny9tWcZXe9Ppr41tOMRXk5DQrjAzV/rnP5TFc=;
 b=ZUva8P+qGKNuILW71M3kqiOl3p3OMi84m/FTaOrasV9puOI/26W3W2AQktS5JoSCyX
 Smrmsw6AckLxNTjicmIsL+qg4s6dTG/kuEgY4jCakJazXzG69LvS1dZdWzS1rZfpmsjn
 1R7g4DkMKAbTummY0zh5nTEYt4j5evyju/U75l5Mm5BRbdqFvstptEpGpCjrNZpuqZ1J
 xAoQ1OR6rL7Vc5K/2T+tD5OhLSs/5PiHiwX3NCqqsE70GmAW41haKRvl+CU9+BpF2QhH
 xV4hleumdXSKORrvXp9VNH7wWYuoGXpAIg7Clwo+HX34mbHM++wiSHwgAyYh81f5A0fb
 V8nw==
X-Gm-Message-State: AOAM531Qk6tMVxYU2xOqTe1DoPofJukR4tvceZ6ZOHomZAGCdEE1azzx
 2SNLPIURM4cC1f/tfeyu2mF7mYtiGXXWeV15ppVtJg==
X-Google-Smtp-Source: ABdhPJxMXZuDmdTKCNd+t3C7uTCdbzCNOEW5fSzqxK+RVd/yxec7n29mF1Nm9n15J7L2OmMqvIonRa+3kwaIt9znTpw=
X-Received: by 2002:a9d:4e08:: with SMTP id p8mr25635431otf.188.1608111710460; 
 Wed, 16 Dec 2020 01:41:50 -0800 (PST)
MIME-Version: 1.0
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-14-daniel.vetter@ffwll.ch>
 <X9ljB3sRJHXf7ZZJ@pendragon.ideasonboard.com>
In-Reply-To: <X9ljB3sRJHXf7ZZJ@pendragon.ideasonboard.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 16 Dec 2020 10:41:39 +0100
Message-ID: <CAKMK7uE8mD_X718iuNU1e-NEZV7QMvbgu5xLMqS3tOFqdUXAgQ@mail.gmail.com>
Subject: Re: [PATCH 14/65] drm/rcar-du: Annotate dma-fence critical section in
 commit path
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 16, 2020 at 2:29 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Daniel,
>
> Thank you for the patch.
>
> On Fri, Oct 23, 2020 at 02:21:25PM +0200, Daniel Vetter wrote:
> > Ends right after drm_atomic_helper_commit_hw_done(), absolutely
> > nothing fancy going on here.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Cc: linux-renesas-soc@vger.kernel.org
>
> I'm lacking context here, there's only one instance of a call to
> dma_fence_begin_signalling() in the subsystem, and no cover letter in
> the series to explain what's going on. Some information would help
> reviewing the patch :-)
>
> Also, could you mention in the cover letter for the next version if you
> will merge the whole series, or expect individual maintainers to pick up
> the relevant patches ?

This series was a misfire of git send-email. I figured that following
up to 65 patches with "I'm sorry" doesn't help the spam problem, so I
only did it once.

This patch was part of a proper series half a year ago, with cover
letter and everything, and a few patches from that series have landed.
I've planed to resubmit this all this week again.
-Daniel

>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > index 72dda446355f..8d91140151cc 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > @@ -441,6 +441,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
> >       struct drm_crtc_state *crtc_state;
> >       struct drm_crtc *crtc;
> >       unsigned int i;
> > +     bool fence_cookie = dma_fence_begin_signalling();
> >
> >       /*
> >        * Store RGB routing to DPAD0 and DPAD1, the hardware will be configured
> > @@ -467,6 +468,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
> >       drm_atomic_helper_commit_modeset_enables(dev, old_state);
> >
> >       drm_atomic_helper_commit_hw_done(old_state);
> > +     dma_fence_end_signalling(fence_cookie);
> >       drm_atomic_helper_wait_for_flip_done(dev, old_state);
> >
> >       drm_atomic_helper_cleanup_planes(dev, old_state);
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
