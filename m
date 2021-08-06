Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8BE3E2F84
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 20:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773A06EC19;
	Fri,  6 Aug 2021 18:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D396EC18;
 Fri,  6 Aug 2021 18:57:17 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id n11so6212451wmd.2;
 Fri, 06 Aug 2021 11:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HpKBM+tAJE8md2DLtf++VNFFu9J3Tv0Fg/f/NOxxCtY=;
 b=WVayfbZbGODnkMiiWzEGsQL8SF0Cq/RxWpIGWnAWYBu8viOMDv5fLrRrFiVosC6EGc
 Jvlvcv6kijGbJmKSTH5aByZfya2ahARv4fsbKyig45AFgSBQB9Zrod3Gpb24uAtV8/Vx
 SdsNa8LlmocVhXp9P1Q5ba5JjkeawDcN0ZAf6ohqBc+KFnNCTvFQswzeNMBcUQIaEIZy
 aOa3TXuxyEmtAPMfLUEHOkUT50Osl5gsaxOM+79f8L5J50310Z9BTpGcOhyOuse4cRWW
 Uc2NgTdxuhlRUmyFfuhnIQ3FFBOBjTQpblYm7LyxeLC90j8gpYbAdcyORYlsqWH4ZH0I
 8XQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HpKBM+tAJE8md2DLtf++VNFFu9J3Tv0Fg/f/NOxxCtY=;
 b=shS64F+NhR0I8Z8MHb5PnZHFOUfh43fB5MwZXRFnAuWVepenITCSw0Zqomm8xv6z4R
 N/NOz28ywwE0quBPe83GT204PCXllV7VVJrURWytqs3aDTwTvxDYhFVcmIdaom4bO1yk
 M7VxUHep7b0+rc5XlnEulsJSR0/Jh2+j36R8qgiTurhf45GzCqy+L4IY2M9KU9fo3qPE
 HKRN+BoSXpcNU9y6rqkpOPqiks9XmsVeM5Cf3Ygtcs7iPfPP6GuNcjenxfH23elDoJRp
 aTPWRPnmmAakndH4yJehM+f4KbxFu+c6PKe6oxWmMlzenkmT4oheC6o+jDSLYY/94Ywt
 yN/A==
X-Gm-Message-State: AOAM533ASXA2JGfUHcmME0YJWwhGWKDKg6JXoCZn0DsyLBkZ3QTHS1Oe
 xHdyuBYJXlPbqgwMGPYvN3t2aY0/OsgXkoTmARU=
X-Google-Smtp-Source: ABdhPJwMr91XCRpnYqi17X3UAxdtfTV8QJkeRKVIvuUzHNRHREWmz7C05CVRLgaWNqOl/QpGyT7V62e1zu/woO0bHmw=
X-Received: by 2002:a1c:f414:: with SMTP id z20mr22127956wma.94.1628276235819; 
 Fri, 06 Aug 2021 11:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-3-daniel.vetter@ffwll.ch>
 <CAF6AEGvkmZhcPWP58VnL1OXAeJ5tg7v13xkkiYBwkpBi1YiT4g@mail.gmail.com>
 <CAKMK7uG3gRNfYinM51UVAUckV9ZgN3mgRnJd8E9tERani9b1JQ@mail.gmail.com>
 <CAF6AEGuqxb5jEtpQi-aNvjSfPaq0gasH2TLZ+5O836ov9qw+3w@mail.gmail.com>
 <CAKMK7uH2v2x+=Ct-v-2RCVXez4MzjMvhh4yCs_f8HPvYa+DXcA@mail.gmail.com>
In-Reply-To: <CAKMK7uH2v2x+=Ct-v-2RCVXez4MzjMvhh4yCs_f8HPvYa+DXcA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 6 Aug 2021 12:01:31 -0700
Message-ID: <CAF6AEGuX6UgXpCJqvo4kT3j5zYeuRBYTtMWM8yz0x_tOb1rm4w@mail.gmail.com>
Subject: Re: [PATCH v5 02/20] drm/msm: Fix drm/sched point of no return rules
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rob Clark <robdclark@chromium.org>, 
 Sean Paul <sean@poorly.run>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>
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

On Fri, Aug 6, 2021 at 11:41 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrot=
e:
>
> On Fri, Aug 6, 2021 at 7:15 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Fri, Aug 6, 2021 at 9:42 AM Daniel Vetter <daniel.vetter@ffwll.ch> w=
rote:
> > >
> > > On Fri, Aug 6, 2021 at 12:58 AM Rob Clark <robdclark@gmail.com> wrote=
:
> > > >
> > > > On Thu, Aug 5, 2021 at 3:47 AM Daniel Vetter <daniel.vetter@ffwll.c=
h> wrote:
> > > > >
> > > > > Originally drm_sched_job_init was the point of no return, after w=
hich
> > > > > drivers must submit a job. I've split that up, which allows us to=
 fix
> > > > > this issue pretty easily.
> > > > >
> > > > > Only thing we have to take care of is to not skip to error paths =
after
> > > > > that. Other drivers do this the same for out-fence and similar th=
ings.
> > > > >
> > > > > Fixes: 1d8a5ca436ee ("drm/msm: Conversion to drm scheduler")
> > > > > Cc: Rob Clark <robdclark@chromium.org>
> > > > > Cc: Rob Clark <robdclark@gmail.com>
> > > > > Cc: Sean Paul <sean@poorly.run>
> > > > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > > > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > > > > Cc: linux-arm-msm@vger.kernel.org
> > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > Cc: freedreno@lists.freedesktop.org
> > > > > Cc: linux-media@vger.kernel.org
> > > > > Cc: linaro-mm-sig@lists.linaro.org
> > > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/msm/msm_gem_submit.c | 15 +++++++--------
> > > > >  1 file changed, 7 insertions(+), 8 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/d=
rm/msm/msm_gem_submit.c
> > > > > index 6d6c44f0e1f3..d0ed4ddc509e 100644
> > > > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > > @@ -52,9 +52,6 @@ static struct msm_gem_submit *submit_create(str=
uct drm_device *dev,
> > > > >                 return ERR_PTR(ret);
> > > > >         }
> > > > >
> > > > > -       /* FIXME: this is way too early */
> > > > > -       drm_sched_job_arm(&job->base);
> > > > > -
> > > > >         xa_init_flags(&submit->deps, XA_FLAGS_ALLOC);
> > > > >
> > > > >         kref_init(&submit->ref);
> > > > > @@ -883,6 +880,9 @@ int msm_ioctl_gem_submit(struct drm_device *d=
ev, void *data,
> > > > >
> > > > >         submit->user_fence =3D dma_fence_get(&submit->base.s_fenc=
e->finished);
> > > > >
> > > > > +       /* point of no return, we _have_ to submit no matter what=
 */
> > > > > +       drm_sched_job_arm(&submit->base);
> > > > > +
> > > > >         /*
> > > > >          * Allocate an id which can be used by WAIT_FENCE ioctl t=
o map back
> > > > >          * to the underlying fence.
> > > > > @@ -892,17 +892,16 @@ int msm_ioctl_gem_submit(struct drm_device =
*dev, void *data,
> > > > >         if (submit->fence_id < 0) {
> > > > >                 ret =3D submit->fence_id =3D 0;
> > > > >                 submit->fence_id =3D 0;
> > > > > -               goto out;
> > > > >         }
> > > > >
> > > > > -       if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
> > > > > +       if (ret =3D=3D 0 && args->flags & MSM_SUBMIT_FENCE_FD_OUT=
) {
> > > > >                 struct sync_file *sync_file =3D sync_file_create(=
submit->user_fence);
> > > > >                 if (!sync_file) {
> > > > >                         ret =3D -ENOMEM;
> > > > > -                       goto out;
> > > > > +               } else {
> > > > > +                       fd_install(out_fence_fd, sync_file->file)=
;
> > > > > +                       args->fence_fd =3D out_fence_fd;
> > > > >                 }
> > > > > -               fd_install(out_fence_fd, sync_file->file);
> > > > > -               args->fence_fd =3D out_fence_fd;
> > > >
> > > > I wonder if instead we should (approximately) undo "drm/msm/submit:
> > > > Simplify out-fence-fd handling" so that the point that it could fai=
l
> > > > is moved up ahead of the drm_sched_job_arm()?
> > >
> > > Hm yeah. Up to you how you want to paint this shed, I think either is=
 fine.
> > >
> > > > Also, does the dma_fence_get() work before drm_sched_job_arm()?  Fr=
om
> > > > a quick look, it looks like it won't, but I'm still playing catchup
> > > > and haven't had a chance to look at your entire series.  If it does=
n't
> > > > work before drm_sched_job_arm(), then there is really no way to
> > > > prevent a error path between the fence-init and job-submit.
> > >
> > > Yes. I thought I've checked that I put the _arm() in the right spot,
> > > but I guess I screwed up and you need the fence before the point wher=
e
> > > I've put the job_arm()? And yes the error path cannot be avoided for
> > > out-fences, that's what I tried to explain in the commit message.
> > >
> > > > But, prior to your series, wouldn't a failure after
> > > > drm_sched_job_init() but before the job is submitted just burn a
> > > > fence-id, and otherwise carry on it's merry way?
> > >
> > > Maybe? I'm not sure whether the scheduler gets confused about the gap
> > > and freak out abou that. I'm fairly new to that code and learning
> > > (which is part why I'm working on it). Since you look up in
> > > fences/syncobj after job_init() it should be pretty easy to whip up a
> > > testcase and see what happens. Also as long as nothing fails you won'=
t
> > > see an issue, that's for sure.
> >
> > fair.. I'll try to come up with a test case.. pre-scheduler-conversion
> > it wasn't a problem to fail after the fence seqno was allocated (well,
> > I guess you might have problems if you had 2^31 failures in a row)
>
> Yeah one thing drm/sched forces you to do is have a very clear notion
> about the point of no return in your submit ioctl. Which I think is a
> Very Good Thing, at least looking at i915 execbuf where the point of
> no return is a multi-stage thing with such interesting intermediate
> points like "we submit the ruquest but without actually running the
> batchbuffer". The downside is that the submit ioctl isn't perfectly
> transaction anymore, but I don't think that matters for tha tail
> stuff, which is generally just some out-fence installing. That
> generally never fails.

So I hacked up:

------
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c
b/drivers/gpu/drm/scheduler/sched_fence.c
index 3aa6351d2101..88e66dbc9515 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -176,6 +176,7 @@ struct drm_sched_fence
*drm_sched_fence_create(struct drm_sched_entity *entity,
        fence->sched =3D entity->rq->sched;
        spin_lock_init(&fence->lock);

+       seq =3D atomic_inc_return(&entity->fence_seq);
        seq =3D atomic_inc_return(&entity->fence_seq);
        dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
                       &fence->lock, entity->fence_context, seq);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c
b/drivers/gpu/drm/scheduler/sched_main.c
index fcc601962e92..583e85adbbe0 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -593,6 +593,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
        if (!job->s_fence)
                return -ENOMEM;
        job->id =3D atomic64_inc_return(&sched->job_id_count);
+       job->id =3D atomic64_inc_return(&sched->job_id_count);

        INIT_LIST_HEAD(&job->list);

------

(I guess the job->id part shouldn't really be needed, that looks like
it is only used by amdgpu)

This didn't cause any problems that I could see.  So I don't *think* a
failure after drm_sched_job_init() is really problematic, as long as
things are serialized between drm_sched_job_init() and
drm_sched_entity_push_job().

I also noticed that in the atomic commit path, the out-fences are
initialized before atomic-check.. so there should be plenty of
precedent for skipping fence seqno's.

BR,
-R
