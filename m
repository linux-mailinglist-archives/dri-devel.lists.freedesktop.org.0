Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF82138B90A
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 23:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40C76F567;
	Thu, 20 May 2021 21:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148BE6F56B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 21:38:30 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id n2so27500317ejy.7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 14:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xxHt3cbK0wd8mHE+I5tF8oiU9QNWrFFUlbc2zbB8Vlo=;
 b=YKJkR9pNhuvPrr0OKlyUz0DiUAUphoPKwcauPCc5wZTcduEvK/j0nfouOLtSif33ik
 47eRleuxEaVIsY4Ci6pyRnXK9DZHUr1Wo1iQ+zi6AFxOYR+bDlAr8Kvuu2UG8jzOUnOD
 rw5sJcoqpBIc5BaJGIoOPkmr5jpochzz8wG5C6w6EsI4GeSIWZk/xKDAMdgDtFXAT2oa
 UApNaaPJP/rqeduOV6kP9zmxzDdsODSBssRajDf7qT72MfCtCJfdosbO/gnRqS43BotR
 /q3JrPSfUWKYJg47RV3UKy6nmT5aZshZWztM6rDtvsdpv0/oy2JGjrZm2LN/exxJNOk+
 1WJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xxHt3cbK0wd8mHE+I5tF8oiU9QNWrFFUlbc2zbB8Vlo=;
 b=T8mNzTenJNoBa8s2c5ZHYOE3gYgr+hQn45YBV+R+XzKj7fY+O/qOP4exySp2FRtSBu
 uTW0DFRZkPrVQZ5XXkwuTls/2st5BvDFJmyptYi1DPKBQz9oSO9GvgvhTFjVN2uEl/99
 MXCQfD50PVHKQ3FECc5v+T90xUp307MetjkbyaDIYuunAM36xMmSyeZj/Axcp6QmyTur
 R7FLLRIjlddSum/EIa8JF5hgPuaUTch1BmWNKFdj3YrkUI8xu071z/pV0gxLrAZpRvUw
 dKNY3BBoJNzEM28LbwGt8NQVpHcI82ZAD94+ffR1WpvYPaAOTK+wfWJXFsNSqTxyjxqH
 78vw==
X-Gm-Message-State: AOAM531s/LNPgpn0P0vfk1YjGcfkFU25c+aGWJLQYbSD6men4c2cLGn6
 OVsMJzyWiRYNEwcy7Z5NpStGeQIVtOMrBrIJMWcrfQ==
X-Google-Smtp-Source: ABdhPJypOJgn875TcU2yMuT5Ji1H0rscl8Bb/Q2J/uYuscFH2WaJ8Fvnv9XUj8S2kiSmzaALsr5xPD7zbaEXz75QwH0=
X-Received: by 2002:a17:906:2bd3:: with SMTP id
 n19mr6642326ejg.210.1621546708527; 
 Thu, 20 May 2021 14:38:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210518235830.133834-1-matthew.brost@intel.com>
 <20210518235830.133834-3-matthew.brost@intel.com>
 <5b8ab744-4906-945d-cbca-1ce4c40f2fcb@gmail.com>
 <20210519165121.GA2585@sdutt-i7>
 <521a34ba-52d4-a9c2-97bb-48873174fc49@amd.com>
 <20210520153931.GA7971@sdutt-i7>
In-Reply-To: <20210520153931.GA7971@sdutt-i7>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 20 May 2021 16:38:17 -0500
Message-ID: <CAOFGe97DK1wmuzQ3U7M6eNzWmpXOCFsEQ6k62XV7JYgbcm-b-Q@mail.gmail.com>
Subject: Re: [Intel-gfx] [Mesa-dev] [RFC 2/2] drm/doc/rfc: i915 new parallel
 submission uAPI plan
To: Matthew Brost <matthew.brost@intel.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason.ekstrand@intel.com>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, karl@freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 20, 2021 at 10:46 AM Matthew Brost <matthew.brost@intel.com> wr=
ote:
>
> On Thu, May 20, 2021 at 01:11:59PM +0200, Christian K=C3=B6nig wrote:
> > Am 19.05.21 um 18:51 schrieb Matthew Brost:
> > > On Wed, May 19, 2021 at 01:45:39PM +0200, Christian K=C3=B6nig wrote:
> > > > Oh, yeah we call that gang submit on the AMD side.
> > > >
> > > > Had already some internal discussions how to implement this, but so=
 far
> > > > couldn't figure out how to cleanly introduce that into the DRM sche=
duler.
> > > >
> > > > Can you briefly describe in a few words how that is supposed to wor=
k on the
> > > > Intel side?

On Intel, we actually have two cases which don't fit the current
drm/scheduler model well: balanced and bonded.

In the balanced model, we want to submit a batch which can go to any
one of some set of engines and we don't care which.  It's up to the
kernel to pick an engine.  Imagine you had 64 identical HW compute
queues, for instance.  This could be done by making all the identical
engines share a single drm_gpu_scheduler and round-robin around the HW
queues or something.  I don't know that we strictly need drm/scheduler
to be aware of it but it might be nice if it grew support for this
mode so we could maintain a 1:1 relationship between HW queues and
drm_gpu_schedulers.  That said, I'm not sure how this would play with
GuC queues so maybe it doesn't help?

The bonded model is like your ganged, I think.  We want to submit N
batches to run in parallel.  And they actually have to be executing on
the GPU simultaneously and not just sort-of at similar times.  We need
this for video.  There are also potential use-cases in Vulkan or even
GL that might be able to use this.  One difference with the balanced
mode is that bonds don't, strictly speaking, need to be on the same
type of engine.  Imagine, for instance, a 3D batch with a parallel
compute batch doing vertex pre-processing.

I'm pretty sure the bonded case is something that the mobile drivers
(panfrost, etc.) would like as well for doing Vulkan on tilers where
you often have to have two command buffers running in parallel.
They're currently doing it by submitting a giant pile of batches where
they split the batch and add sync primitives every time some GL call
requires them to sync between fragment and vertex pipes.

So, to sum up, I think there's likely some good collaboration to be
had here for everyone. :-)

--Jason

> > > Sure, I've done a quick PoC internally and have been able to hook thi=
s
> > > into the DRM scheduler.
> > >
> > > Basically each BB still maps to a single job as each job is somewhat
> > > unique (e.g. each job has its own ring, lrc, seqno, etc...). However =
all
> > > the jobs configured to run in parallel map to a single sched_entity
> > > which maintains the order each job was generated from the execbuf IOC=
TL
> > > (1 - N). When the backend receives jobs 1 to N - 1 it basically just
> > > updates some internal state. When the backend sees job N (last job) i=
t
> > > actually does the submit for jobs 1 - N which with GuC submission is =
a
> > > simple command moving the LRC tail of the N jobs.
> > >
> > > Daniel has suggested that we create a single job for the NN BBs but t=
hat
> > > would be huge rework to the internals of the i915 and likely won't
> > > happen by the time this code first lands.
> > >
> > > Also worth noting one way a job isn't really a treated individually i=
s
> > > the excl slot with dma-resv. In that case we create a composite fence=
 of
> > > all jobs (dma_fence_array).
> >
> > Yeah, that's something we have discussed as well.
> >
> > How do you prevent the scheduler from over committing to a single ring
> > buffer in this scenario?
> >
>
> Each job has its own ring, the execbuf IOCTL throttles itself for each
> job if there isn't space in the ring. This is exactly the same as
> non-parallel submits.
>
> I think this is what you were asking? If not, maybe try explaining the
> question a bit more.
>
> Matt
>
> > Christian.
> >
> > >
> > > Matt
> > >
> > > > Thanks,
> > > > Christian.
> > > >
> > > > Am 19.05.21 um 01:58 schrieb Matthew Brost:
> > > > > Add entry fpr i915 new parallel submission uAPI plan.
> > > > >
> > > > > v2:
> > > > >    (Daniel Vetter):
> > > > >     - Expand logical order explaination
> > > > >     - Add dummy header
> > > > >     - Only allow N BBs in execbuf IOCTL
> > > > >     - Configure parallel submission per slot not per gem context
> > > > >
> > > > > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > > > Cc: Tony Ye <tony.ye@intel.com>
> > > > > CC: Carl Zhang <carl.zhang@intel.com>
> > > > > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > > > > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > ---
> > > > >    Documentation/gpu/rfc/i915_parallel_execbuf.h | 144 ++++++++++=
++++++++
> > > > >    Documentation/gpu/rfc/i915_scheduler.rst      |  53 ++++++-
> > > > >    2 files changed, 196 insertions(+), 1 deletion(-)
> > > > >    create mode 100644 Documentation/gpu/rfc/i915_parallel_execbuf=
.h
> > > > >
> > > > > diff --git a/Documentation/gpu/rfc/i915_parallel_execbuf.h b/Docu=
mentation/gpu/rfc/i915_parallel_execbuf.h
> > > > > new file mode 100644
> > > > > index 000000000000..8c64b983ccad
> > > > > --- /dev/null
> > > > > +++ b/Documentation/gpu/rfc/i915_parallel_execbuf.h
> > > > > @@ -0,0 +1,144 @@
> > > > > +#define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_c=
ontext_engines_parallel_submit */
> > > > > +
> > > > > +/*
> > > > > + * i915_context_engines_parallel_submit:
> > > > > + *
> > > > > + * Setup a slot to allow multiple BBs to be submitted in a singl=
e execbuf IOCTL.
> > > > > + * Those BBs will then be scheduled to run on the GPU in paralle=
l. Multiple
> > > > > + * hardware contexts are created internally in the i915 run thes=
e BBs. Once a
> > > > > + * slot is configured for N BBs only N BBs can be submitted in e=
ach execbuf
> > > > > + * IOCTL and this is implict behavior (e.g. the user doesn't tel=
l the execbuf
> > > > > + * IOCTL there are N BBs, the execbuf IOCTL know how many BBs th=
ere are based on
> > > > > + * the slots configuration).
> > > > > + *
> > > > > + * Their are two currently defined ways to control the placement=
 of the
> > > > > + * hardware contexts on physical engines: default behavior (no f=
lags) and
> > > > > + * I915_PARALLEL_IMPLICT_BONDS (a flag). More flags may be added=
 the in the
> > > > > + * future as new hardware / use cases arise. Details of how to u=
se this
> > > > > + * interface below above the flags.
> > > > > + *
> > > > > + * Returns -EINVAL if hardware context placement configuration i=
nvalid or if the
> > > > > + * placement configuration isn't supported on the platform / sub=
mission
> > > > > + * interface.
> > > > > + * Returns -ENODEV if extension isn't supported on the platform =
/ submission
> > > > > + * inteface.
> > > > > + */
> > > > > +struct i915_context_engines_parallel_submit {
> > > > > +       struct i915_user_extension base;
> > > > > +
> > > > > +       __u16 engine_index;     /* slot for parallel engine */
> > > > > +       __u16 width;            /* number of contexts per paralle=
l engine */
> > > > > +       __u16 num_siblings;     /* number of siblings per context=
 */
> > > > > +       __u16 mbz16;
> > > > > +/*
> > > > > + * Default placement behvavior (currently unsupported):
> > > > > + *
> > > > > + * Rather than restricting parallel submission to a single class=
 with a
> > > > > + * logically contiguous placement (I915_PARALLEL_IMPLICT_BONDS),=
 add a mode that
> > > > > + * enables parallel submission across multiple engine classes. I=
n this case each
> > > > > + * context's logical engine mask indicates where that context ca=
n placed. It is
> > > > > + * implied in this mode that all contexts have mutual exclusive =
placement (e.g.
> > > > > + * if one context is running CS0 no other contexts can run on CS=
0).
> > > > > + *
> > > > > + * Example 1 pseudo code:
> > > > > + * CSX[Y] =3D engine class X, logical instance Y
> > > > > + * INVALID =3D I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVA=
LID_NONE
> > > > > + * set_engines(INVALID)
> > > > > + * set_parallel(engine_index=3D0, width=3D2, num_siblings=3D2,
> > > > > + *             engines=3DCS0[0],CS0[1],CS1[0],CS1[1])
> > > > > + *
> > > > > + * Results in the following valid placements:
> > > > > + * CS0[0], CS1[0]
> > > > > + * CS0[0], CS1[1]
> > > > > + * CS0[1], CS1[0]
> > > > > + * CS0[1], CS1[1]
> > > > > + *
> > > > > + * This can also be though of as 2 virtual engines:
> > > > > + * VE[0] =3D CS0[0], CS0[1]
> > > > > + * VE[1] =3D CS1[0], CS1[1]
> > > > > + *
> > > > > + * Example 2 pseudo code:
> > > > > + * CS[X] =3D generic engine of same class, logical instance X
> > > > > + * INVALID =3D I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVA=
LID_NONE
> > > > > + * set_engines(INVALID)
> > > > > + * set_parallel(engine_index=3D0, width=3D2, num_siblings=3D3,
> > > > > + *             engines=3DCS[0],CS[1],CS[2],CS[0],CS[1],CS[2])
> > > > > + *
> > > > > + * Results in the following valid placements:
> > > > > + * CS[0], CS[1]
> > > > > + * CS[0], CS[2]
> > > > > + * CS[1], CS[0]
> > > > > + * CS[1], CS[2]
> > > > > + * CS[2], CS[0]
> > > > > + * CS[2], CS[1]
> > > > > + *
> > > > > + *
> > > > > + * This can also be though of as 2 virtual engines:
> > > > > + * VE[0] =3D CS[0], CS[1], CS[2]
> > > > > + * VE[1] =3D CS[0], CS[1], CS[2]
> > > > > +
> > > > > + * This enables a use case where all engines are created equally=
, we don't care
> > > > > + * where they are scheduled, we just want a certain number of re=
sources, for
> > > > > + * those resources to be scheduled in parallel, and possibly acr=
oss multiple
> > > > > + * engine classes.
> > > > > + */
> > > > > +
> > > > > +/*
> > > > > + * I915_PARALLEL_IMPLICT_BONDS - Create implict bonds between ea=
ch context.
> > > > > + * Each context must have the same number sibling and bonds are =
implictly create
> > > > > + * of the siblings.
> > > > > + *
> > > > > + * All of the below examples are in logical space.
> > > > > + *
> > > > > + * Example 1 pseudo code:
> > > > > + * CS[X] =3D generic engine of same class, logical instance X
> > > > > + * INVALID =3D I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVA=
LID_NONE
> > > > > + * set_engines(INVALID)
> > > > > + * set_parallel(engine_index=3D0, width=3D2, num_siblings=3D1,
> > > > > + *             engines=3DCS[0],CS[1], flags=3DI915_PARALLEL_IMPL=
ICT_BONDS)
> > > > > + *
> > > > > + * Results in the following valid placements:
> > > > > + * CS[0], CS[1]
> > > > > + *
> > > > > + * Example 2 pseudo code:
> > > > > + * CS[X] =3D generic engine of same class, logical instance X
> > > > > + * INVALID =3D I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVA=
LID_NONE
> > > > > + * set_engines(INVALID)
> > > > > + * set_parallel(engine_index=3D0, width=3D2, num_siblings=3D2,
> > > > > + *             engines=3DCS[0],CS[2],CS[1],CS[3], flags=3DI915_P=
ARALLEL_IMPLICT_BONDS)
> > > > > + *
> > > > > + * Results in the following valid placements:
> > > > > + * CS[0], CS[1]
> > > > > + * CS[2], CS[3]
> > > > > + *
> > > > > + * This can also be though of as 2 virtual engines:
> > > > > + * VE[0] =3D CS[0], CS[2]
> > > > > + * VE[1] =3D CS[1], CS[3]
> > > > > + *
> > > > > + * This enables a use case where all engines are not equal and c=
ertain placement
> > > > > + * rules are required (i.e. split-frame requires all contexts to=
 be placed in a
> > > > > + * logically contiguous order on the VCS engines on gen11+ platf=
orms). This use
> > > > > + * case (logically contiguous placement, within a single engine =
class) is
> > > > > + * supported when using GuC submission. Execlist mode could supp=
ort all possible
> > > > > + * bonding configurations but currently doesn't support this ext=
ension.
> > > > > + */
> > > > > +#define I915_PARALLEL_IMPLICT_BONDS                    (1<<0)
> > > > > +/*
> > > > > + * Do not allow BBs to be preempted mid BB rather insert coordin=
ated preemption
> > > > > + * points on all hardware contexts between each set of BBs. An e=
xample use case
> > > > > + * of this feature is split-frame on gen11+ hardware. When using=
 this feature a
> > > > > + * BB must be submitted on each hardware context in the parallel=
 gem context.
> > > > > + * The execbuf2 IOCTL enforces the user adheres to policy.
> > > > > + */
> > > > > +#define I915_PARALLEL_NO_PREEMPT_MID_BATCH             (1<<1)
> > > > > +#define __I915_PARALLEL_UNKNOWN_FLAGS  (-(I915_PARALLEL_NO_PREEM=
PT_MID_BATCH << 1))
> > > > > +       __u64 flags;            /* all undefined flags must be ze=
ro */
> > > > > +       __u64 mbz64[3];         /* reserved for future use; must =
be zero */
> > > > > +
> > > > > +       /*
> > > > > +        * width (i) * num_siblings (j) in length
> > > > > +        * index =3D j + i * num_siblings
> > > > > +        */
> > > > > +       struct i915_engine_class_instance engines[0];
> > > > > +} __attribute__ ((packed));
> > > > > +
> > > > > diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documenta=
tion/gpu/rfc/i915_scheduler.rst
> > > > > index 7faa46cde088..64c539486ee4 100644
> > > > > --- a/Documentation/gpu/rfc/i915_scheduler.rst
> > > > > +++ b/Documentation/gpu/rfc/i915_scheduler.rst
> > > > > @@ -82,4 +82,55 @@ https://nam11.safelinks.protection.outlook.com=
/?url=3Dhttps%3A%2F%2Fspec.oneapi.com%2Flevel-zero%2Flatest%2Fcore%2Fapi.ht=
ml%23ze-command-queue-priorit&amp;data=3D04%7C01%7Cchristian.koenig%40amd.c=
om%7C49a7557f4e494090755608d91ae758a6%7C3dd8961fe4884e608e11a82d994e183d%7C=
0%7C0%7C637570403202969375%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ=
IjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Ddn3PVdxYQpkpW=
Iru5eAXHgbfuLDkppAA5daV5sHQF7s%3D&amp;reserved=3D0
> > > > >    New parallel submission uAPI
> > > > >    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > -Details to come in a following patch.
> > > > > +The existing bonding uAPI is completely broken with GuC submissi=
on because
> > > > > +whether a submission is a single context submit or parallel subm=
it isn't known
> > > > > +until execbuf time activated via the I915_SUBMIT_FENCE. To submi=
t multiple
> > > > > +contexts in parallel with the GuC the context must be explictly =
registered with
> > > > > +N contexts and all N contexts must be submitted in a single comm=
and to the GuC.
> > > > > +These interfaces doesn't support dynamically changing between N =
contexts as the
> > > > > +bonding uAPI does. Hence the need for a new parallel submission =
interface. Also
> > > > > +the legacy bonding uAPI is quite confusing and not intuitive at =
all.
> > > > > +
> > > > > +The new parallel submission uAPI consists of 3 parts:
> > > > > +
> > > > > +* Export engines logical mapping
> > > > > +* A 'set_parallel' extension to configure contexts for parallel
> > > > > +  submission
> > > > > +* Extend execbuf2 IOCTL to support submitting N BBs in a single =
IOCTL
> > > > > +
> > > > > +Export engines logical mapping
> > > > > +------------------------------
> > > > > +Certain use cases require BBs to be placed on engine instances i=
n logical order
> > > > > +(e.g. split-frame on gen11+). The logical mapping of engine inst=
ances can change
> > > > > +based on fusing. Rather than making UMDs be aware of fusing, sim=
ply expose the
> > > > > +logical mapping with the existing query engine info IOCTL. Also =
the GuC
> > > > > +submission interface currently only supports submitting multiple=
 contexts to
> > > > > +engines in logical order which is a new requirement compared to =
execlists.
> > > > > +Lastly, all current platforms have at most 2 instances and the l=
ogical order is
> > > > > +the same a uABI order. This will change on platforms with more t=
han 2 instances.
> > > > > +
> > > > > +A single bit will be added to drm_i915_engine_info.flags indicat=
ing that the
> > > > > +logical instance has been returned and a new field,
> > > > > +drm_i915_engine_info.logical_instance, returns the logical insta=
nce.
> > > > > +
> > > > > +A 'set_parallel' extension to configure contexts for parallel su=
bmission
> > > > > +----------------------------------------------------------------=
--------
> > > > > +The 'set_parallel' extension configures a slot for parallel subm=
ission of N BBs.
> > > > > +It is setup step that should be called before using any of the c=
ontexts. See
> > > > > +I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE or I915_CONTEXT_ENGINES_EX=
T_BOND for
> > > > > +similar existing examples. Once a slot is configured for paralle=
l submission the
> > > > > +execbuf2 IOCTL can be called submiting N BBs in a single IOCTL. =
Initially only
> > > > > +support GuC submission. Execlist support can be added later if n=
eeded.
> > > > > +
> > > > > +Add I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT and
> > > > > +i915_context_engines_parallel_submit to the uAPI to implement th=
is extension.
> > > > > +
> > > > > +Extend execbuf2 IOCTL to support submitting N BBs in a single IO=
CTL
> > > > > +----------------------------------------------------------------=
---
> > > > > +Contexts that have been configured with the 'set_parallel' exten=
sion are allowed
> > > > > +to submit N BBs in a single execbuf2 IOCTL. The BBs are either t=
he last N
> > > > > +objects in the drm_i915_gem_exec_object2 list or the first N if
> > > > > +I915_EXEC_BATCH_FIRST is set. The number of BBs is implict based=
 on the slot
> > > > > +submitted and how it has been configured by 'set_parallel' or ot=
her extensions.
> > > > > +No uAPI changes in the execbuf IOCTL but worth mentioning the ne=
w behavior of
> > > > > +the IOCTL.
> >
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
