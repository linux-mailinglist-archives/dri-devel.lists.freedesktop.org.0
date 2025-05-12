Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A110EAB3B72
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 16:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902D310E427;
	Mon, 12 May 2025 14:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nYbLX77l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255D010E42C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 14:57:14 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-85dac9728cdso120413339f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 07:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747061833; x=1747666633; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5CM/pTzzheLYdPVFGIT6hfnPFRugrCCGuXn8kzkW3cc=;
 b=nYbLX77lkdfqWU8LutkUqOPl40EAZnpMxpCzv0pI+Mmz5yEAxmpQfRVYxJj7iusvQj
 loclSGScCiRRgHQD4cuNBNTWaFm66iT9mwjbmBVP6V5U3l4ES1guUIBNNxNVazJDwsFM
 ZwgS2TRDAuPeZ/JIPGfR3mIjjksCyTzT7NcnerXpoOv6diFC1Z6mlc370b+Mk+JzUDUm
 TyB+BdrD8rp885rFV76eeZi/ISPASIU1J+Dsh+B8ajls+uwrlix3Y5CLlzDxufp2bhCq
 CbvowhzBZrDUXpEsU3b1/YkG9WubNp0wmDqjpx9uKgZWD2PlTe/spxZJXKnD+XMu1/Vs
 hfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747061833; x=1747666633;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5CM/pTzzheLYdPVFGIT6hfnPFRugrCCGuXn8kzkW3cc=;
 b=M+B5OJ4WWiLjeNA7uj1BLKQzEycAlAfdIOt4mlitbNXbRrNyuIuKNEYBC8oqUMHvi+
 77f6bMLphjxi0E0LFuQTBYhSE2u67KPIgQ6+MDSBpzSYXt/PIg9kK4Fj9NSAEAv7kfBN
 gm1oUBC3s2tzQCAx/o5w1QjJ+mDE7+D+pyQTLctnCaORBGLooB5kNXVflnLL1XVpyuSh
 sWS+mGJFtlEihimIO5/n5rXrwxG6iRC7RDncmbGX0rIS3Rc9K8D8twTupuy4WVUzMFnj
 sNgyXKrYrtgw6MaKpq6NYSKb6jdW0Aat0H1EFxMl74LXnNab6N3oR/2VAYxp5cAE5Rcg
 l5FQ==
X-Gm-Message-State: AOJu0YwboOnM7tTzKBtgFC/Kq9AjnlsgHbaOBt/Twx5/ftAxktNatCjY
 sVgbK632tnYc+C2NLBDlTAEJ/0GBulKrAtriVRKH+MoA4TLBxWUDhxxtOVdW8KjgMh6XiBrbqIf
 maj8QpdYLpxMxxOXG6teAd3ErvS0=
X-Gm-Gg: ASbGncvS3mLt4IafzfkBzcFPJVR0j4jDy3q6S5cmTc1LieLxyu+SeMOEs/n6fl9q70W
 78Bp0uvNq9auZ1ReSe671TeYfteKtwe2Al8DKdq7kpH+JO6XhUiTKhU+oDUfSdnCHxCfr+d0I/3
 kYjuAbB04t2ly73nbW4i0rC+GpJWFQGumZ9FJSM6/rtZg7qF9P9gviY9fiRXzmsXwYsUWPiOhnJ
 w==
X-Google-Smtp-Source: AGHT+IFcYrKXRaJZ0ODsRE3pns6yi3SayGrvR5yPXNbXJIajTTYC9WnKJWrvwG6tIF8zooAutxZSNN6rpze9CqKgADI=
X-Received: by 2002:a05:6e02:1845:b0:3d9:34c8:54ce with SMTP id
 e9e14a558f8ab-3da7e2103c5mr168593675ab.18.1747061832916; Mon, 12 May 2025
 07:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250509212936.490048-1-robdclark@gmail.com>
 <aCGpLxb4WQMPXjmZ@pollux>
In-Reply-To: <aCGpLxb4WQMPXjmZ@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 12 May 2025 07:57:00 -0700
X-Gm-Features: AX0GCFvY70VyppyNcKIsqevbp767XzogcVBanUlEETQE9zisSjdkhLh5-UBxH6g
Message-ID: <CAF6AEGtSr0Y7nk2Jrk+yzoxnW8WGs5S9iOVtvxfQ1hcS9e0AtA@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Fix UAF in drm_sched_fence_get_timeline_name()
To: Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 open list <linux-kernel@vger.kernel.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, May 12, 2025 at 12:54=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Fri, May 09, 2025 at 02:29:36PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The fence can outlive the sched, so it is not safe to dereference the
> > sched in drm_sched_fence_get_timeline_name()
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/scheduler/sched_fence.c |  3 ++-
> >  include/drm/gpu_scheduler.h             | 11 +++++++++++
> >  2 files changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/=
scheduler/sched_fence.c
> > index e971528504a5..4e529c3ba6d4 100644
> > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > @@ -92,7 +92,7 @@ static const char *drm_sched_fence_get_driver_name(st=
ruct dma_fence *fence)
> >  static const char *drm_sched_fence_get_timeline_name(struct dma_fence =
*f)
> >  {
> >       struct drm_sched_fence *fence =3D to_drm_sched_fence(f);
> > -     return (const char *)fence->sched->name;
> > +     return fence->name;
> >  }
> >
> >  static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
> > @@ -226,6 +226,7 @@ void drm_sched_fence_init(struct drm_sched_fence *f=
ence,
> >       unsigned seq;
> >
> >       fence->sched =3D entity->rq->sched;
> > +     fence->name  =3D fence->sched->name;
>
> This requires sched->name to be a string in the .(ro)data section of the =
binary,
> or a string that the driver only ever frees after all fences of this sche=
duler
> have been freed.
>
> Are we sure that those rules are documented and honored by existing drive=
rs?
>
> Otherwise, we might just fix one bug and create a more subtle one instead=
. :(

Agreed, but at least it is _less_ bad, and the alternative of
refcnting the sched seemed pretty heavy handed :-(

I'll take a look at Tvrtko's series to see if that could help.

I suppose the alternative is to null out the sched ptr when the fence
is signalled, and then return some generic name (ie "signalled" or
something like that)?

BR,
-R

>
> >       seq =3D atomic_inc_return(&entity->fence_seq);
> >       dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
> >                      &fence->lock, entity->fence_context, seq);
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 0ae108f6fcaf..d830ffe083f1 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -295,6 +295,9 @@ struct drm_sched_fence {
> >          /**
> >           * @sched: the scheduler instance to which the job having this=
 struct
> >           * belongs to.
> > +         *
> > +         * Some care must be taken as to where the sched is derefed, a=
s the
> > +         * fence can outlive the sched.
> >           */
> >       struct drm_gpu_scheduler        *sched;
> >          /**
> > @@ -305,6 +308,14 @@ struct drm_sched_fence {
> >           * @owner: job owner for debugging
> >           */
> >       void                            *owner;
> > +
> > +     /**
> > +      * @name: the timeline name
> > +      *
> > +      * This comes from the @sched, but since the fence can outlive th=
e
> > +      * sched, we need to keep our own copy.
>
> It's our own copy of the pointer, not our own copy of the string. I think=
 we
> should be clear about that.
>
> > +      */
> > +     const char                      *name;
> >  };
