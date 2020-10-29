Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B44E29F269
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 17:59:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBD089CE1;
	Thu, 29 Oct 2020 16:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5BF89CA1;
 Thu, 29 Oct 2020 16:59:22 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n18so3564966wrs.5;
 Thu, 29 Oct 2020 09:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7VGv15Yq8X9g6e+gf0FDckPU0qrS/WHWWujZxgkmrMs=;
 b=g25OqX81bvsvR43E8cgMbNgVXDl/xtQUeIeFkvpCDHJ10AxaIcy/yKs4PGhMs4JOce
 iGPQtqpoX73eegvR60CR4E/CB7npEe6+9FFNPYRom/JZJ4iysuY933ZTxmbxdEr5tA2O
 HI9yzImMt3LPlGGF3h0eLfTTbQek3p+jKE25f9/tRXbg6QWBYwtgxWMS4oRNLrlWBrYZ
 nIWZkYR5fegnyQAIukC+zkuaok2aD95GsNJl9CUGMcCFkjbW8srmqpVyfsYS/ZBWbPqn
 utTkVbmV5r2Fuf/wGBw0DOSyPuKaQT7gkwWm2+fZ8iDYMfdutjt8cmwS5A/HElHKKPzN
 NbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7VGv15Yq8X9g6e+gf0FDckPU0qrS/WHWWujZxgkmrMs=;
 b=ETylbOALTgz9nm0424mPhscnUylnhmJr1Jsmgyx1e17xiGKt0doz4HD4St5Pb5/9hW
 4IgtLtkbw5J81nyX7WmWSCGINSN/TNqCpDvQpHkMPX/0WA/z63raox12pWSqtn1UBsfA
 t/DVDUAIatV4bu2QUH0nvTLSjlmYDN9r1RwkUgr0rOLoacEatzuEoADP7GRLnLjcu5Rv
 t9YiEUMdI9zbXK1m57Co/tg8od5jT8W2GPUPCD11YzcWB4qgdMOQTikpPdip9v8SfFG0
 4hJRFpE81uQujscEeI8RCfE+M1r2kguT+TrQ1ac9vYq6yQ8OJK+8dWuIDDdWW0H24Zxf
 DHbA==
X-Gm-Message-State: AOAM531ynkFiO+S4oTCE3rerfB0tv+KTtCJNPMOyHI1+FLKSRYisPxdp
 oIkBxhPkDhDGjL9Q4vR83I4Ah3nrMmsC/pyrQPM=
X-Google-Smtp-Source: ABdhPJx4mzwgbAWmUZDgmJL1/UXZRiG1CC0XN7/hwqje6iGm36Z0pEHcIOwcfqGS/sv3u+IgfkW5/froOYLrjKalhZQ=
X-Received: by 2002:adf:bc0f:: with SMTP id s15mr6874410wrg.83.1603990760660; 
 Thu, 29 Oct 2020 09:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <20201023165136.561680-1-robdclark@gmail.com>
 <20201023165136.561680-24-robdclark@gmail.com>
 <d0fb714b99f13bea6000ecd17fba324433782ae5.camel@pengutronix.de>
 <CAF6AEGsf=pJ5H4guvL-+AAkK0PwCZ5g9k3K=7UPYzFmr02ReoA@mail.gmail.com>
 <20201026093405.GG401619@phenom.ffwll.local>
 <CAKMK7uHK27hMu+zSR0O35gR-Nq-JDXpXWBFXPBcXUhOi_3AKnw@mail.gmail.com>
In-Reply-To: <CAKMK7uHK27hMu+zSR0O35gR-Nq-JDXpXWBFXPBcXUhOi_3AKnw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 29 Oct 2020 09:59:09 -0700
Message-ID: <CAF6AEGsSY2WtQ33mSZFmju7bSkjP3Zsi2vBnGDy35+YFCWu7qw@mail.gmail.com>
Subject: Re: [PATCH v4 23/23] drm/msm: Don't implicit-sync if only a single
 ring
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 29, 2020 at 9:14 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Oct 26, 2020 at 10:34 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, Oct 23, 2020 at 08:49:14PM -0700, Rob Clark wrote:
> > > On Fri, Oct 23, 2020 at 11:20 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> > > >
> > > > On Fr, 2020-10-23 at 09:51 -0700, Rob Clark wrote:
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > If there is only a single ring (no-preemption), everything is FIFO order
> > > > > and there is no need to implicit-sync.
> > > > >
> > > > > Mesa should probably just always use MSM_SUBMIT_NO_IMPLICIT, as behavior
> > > > > is undefined when fences are not used to synchronize buffer usage across
> > > > > contexts (which is the only case where multiple different priority rings
> > > > > could come into play).
> > > >
> > > > Really, doesn't this break cross-device implicit sync? Okay, you may
> > > > not have many peripherals that rely on implicit sync on devices where
> > > > Adreno is usually found, but it seems rather heavy-handed.
> > > >
> > > > Wouldn't it be better to only ignore fences from your own ring context
> > > > in the implicit sync, like we do in the common DRM scheduler
> > > > (drm_sched_dependency_optimized)?
> > >
> > > we already do this.. as was discussed on an earlier iteration of this patchset
> > >
> > > But I'm not aware of any other non-gpu related implicit sync use-case
> > > (even on imx devices where display is decoupled from gpu).. I'll
> > > revert the patch if someone comes up with one, but otherwise lets let
> > > the implicit sync baggage die
> >
> > The thing is, dma_resv won't die, even if implicit sync is dead. We're
> > using internally for activity tracking and memory management. If you don't
> > set these, then we can't share generic code with msm, and I think everyone
> > inventing their own memory management is a bit a mistake.
> >
> > Now you only kill the implicit write sync stuff here, but I'm not sure
> > that's worth much since you still install all the read fences for
> > consistency. And if userspace doesn't want to be synced, they can set the
> > flag and do this on their own: I think you should be able to achieve
> > exactly the same thing in mesa.
> >
> > Aside: If you're worried about overhead, you can do O(1) submit if you
> > manage your ppgtt like amdgpu does.
>
> So just remember a use-case which is maybe a bit yucky, but it is
> actually possible to implement race-free. If you have implicit sync.
>
> There's screen-capture tool in mplayer and obs which capture your
> compositor by running getfb2 in a loop. It works, and after some
> initial screaming I realized it does actually work race-free. If you
> have implicit sync.
>
> I really don't think you can sunset this, as much as you want to. And
> sunsetting it inconsistently is probably the worst.

For the case where you only have a single ring, as long as it is
importing the fb in to egl to read it (which it would need to do to
get a linear view), this would still all work

(but I may drop this patch because it is just a micro-optimization and
seems to cause more confusion)

BR,
-R


> -Daniel
>
> > -Daniel
> >
> > >
> > > BR,
> > > -R
> > >
> > >
> > >
> > > >
> > > > Regards,
> > > > Lucas
> > > >
> > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
> > > > > ---
> > > > >  drivers/gpu/drm/msm/msm_gem_submit.c | 7 ++++---
> > > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > > index d04c349d8112..b6babc7f9bb8 100644
> > > > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > > @@ -283,7 +283,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
> > > > >       return ret;
> > > > >  }
> > > > >
> > > > > -static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > > > > +static int submit_fence_sync(struct msm_gem_submit *submit, bool implicit_sync)
> > > > >  {
> > > > >       int i, ret = 0;
> > > > >
> > > > > @@ -303,7 +303,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > > > >                               return ret;
> > > > >               }
> > > > >
> > > > > -             if (no_implicit)
> > > > > +             if (!implicit_sync)
> > > > >                       continue;
> > > > >
> > > > >               ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
> > > > > @@ -774,7 +774,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> > > > >       if (ret)
> > > > >               goto out;
> > > > >
> > > > > -     ret = submit_fence_sync(submit, !!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > > > > +     ret = submit_fence_sync(submit, (gpu->nr_rings > 1) &&
> > > > > +                     !(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > > > >       if (ret)
> > > > >               goto out;
> > > > >
> > > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
