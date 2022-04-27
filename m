Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0054E511C33
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 18:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C2510F674;
	Wed, 27 Apr 2022 16:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9057010F673
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 16:07:17 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id v10so1787871pgl.11
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 09:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=thh3b7rvFYMcWHBGJTfcjm7L4QV8/jt2EZrs9nTl3/s=;
 b=nHvJcRQDvgnFH2mocyoYQgZtIrbsIsmTsZ74EguoCNewAbSODSdrwqhoxexS8tR/yh
 hBYBW29wCw14+O+78B8pYxO/PeMyALOI0bQ46Nl3BgK4n56x6OF7xgpz0MHDdtlXed8M
 DM9tNwEwzP500NWVah6UGtMlwOluQHybWUawI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=thh3b7rvFYMcWHBGJTfcjm7L4QV8/jt2EZrs9nTl3/s=;
 b=m0V1P/gQHMAFn/BXzFJPJOgmZMVqnSIBocZGwG3sX4pNpOu+VXHc2bIXJTEv8c9qJ6
 PCGNuUdcTHTDyqPiJGM8lD/0ZzKjzmmWMwCMEz9XCrCgwzUt6zV+YePvyjHxFb1MXgVE
 jnVEeHK9ODN7I9MaoqNhmcoHxSdGgV+u2Ogxot04lmxIKQPFQ00MCY1SNFBvCQgNXtaj
 9O8+r4zI1TC35CyzVKh39BLzJbZ9rXb3xzYLL1WesRWdwgxdMCWO4yhYxujgjw73xeCl
 P8Sexi6H9VCpLHDM6w9Y9EcBKw6dAUCVpomnhUiSFr2CXolSM74Ksh51RXlyQ9Kcj3nP
 EY9A==
X-Gm-Message-State: AOAM533nnKB3Oucnwz1TSj2ZCG5Is8dahyo4cUGnaYJQJFXEL5O0SEB8
 OcFxx+toRQ9mj0hPOHvGYeCC9qzGdICCMVDvgM+3DA==
X-Google-Smtp-Source: ABdhPJx8fm8/yx+ZjmZhEV0V49ps4Zr4PYjpyXxyQlzPoHV3JUBxQd/ptdVWyyMngsed5HIFfmLvF6S+wXinkOQR8f4=
X-Received: by 2002:a05:6a00:14c5:b0:50d:4871:3619 with SMTP id
 w5-20020a056a0014c500b0050d48713619mr13516854pfu.12.1651075637181; Wed, 27
 Apr 2022 09:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220412212558.827289-1-olvaffe@gmail.com>
 <CAPaKu7Tv1Mxt7Ao8kH2-MZDBK7EB0D41COJD8Sjze76t_o-qmw@mail.gmail.com>
 <ffe7dbc1-8a19-1e19-402d-27efc8e55b39@amd.com>
 <CAJs_Fx7OQ2OJo3pQ-ETT1827PtfuFsvn984gg8GeDVrqy0Ucug@mail.gmail.com>
 <215f55f6-97b8-5dd3-a2cc-fe42e19a2769@amd.com>
 <CAJs_Fx69yhVQ6t1xdTqEs3kxiz1gZSZ2-qNA=Cq21j_BSaymrQ@mail.gmail.com>
 <17fc1a68-747a-f707-364d-76f12a2b535a@amd.com>
 <CAPaKu7Rny7pxsPA+cnow0d6PAD2YCb+b+j1_Di5gziyOVNLaYQ@mail.gmail.com>
 <c32bf2de-0e48-e3b7-98ae-0bcd46933465@amd.com>
 <CAPaKu7T2hTFnsSSdFvQRuGefhZHVmGO9KXKpO8Y_ZcLbe75rpA@mail.gmail.com>
 <b587ca5f-eb8a-cf0c-5c07-9844c8794463@amd.com>
In-Reply-To: <b587ca5f-eb8a-cf0c-5c07-9844c8794463@amd.com>
From: Rob Clark <robdclark@chromium.org>
Date: Wed, 27 Apr 2022 09:07:06 -0700
Message-ID: <CAJs_Fx7Jq9VWy_Eux+hGoQTCTeKkFMQCdibY9gFQTqrvVob5fA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: add trace_dma_fence_emit to msm_gpu_submit
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 26, 2022 at 11:20 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 26.04.22 um 20:50 schrieb Chia-I Wu:
> > On Tue, Apr 26, 2022 at 11:02 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 26.04.22 um 19:40 schrieb Chia-I Wu:
> >>> [SNIP]
> >>>>>> Well I just send a patch to completely remove the trace point.
> >>>>>>
> >>>>>> As I said it absolutely doesn't make sense to use this for
> >>>>>> visualization, that's what the trace_dma_fence_init trace point is=
 good for.
> >>> I am a bit confused by this.  _emit and _signaled are a great way to
> >>> see how many fences are pending from cpu's point of view.  How does
> >>> _emit make no sense and _init is good instead?
> >> We had exactly that confusion now multiple times and it's one of the
> >> main reasons why I want to remove the _emit trace point.
> >>
> >> See the when you want to know how many fences are pending you need to
> >> watch out for init/destroy and *NOT* emit.
> >>
> >> The reason is that in the special case where emit makes sense (e.g. th=
e
> >> GPU scheduler fences) emit comes later than init, but pending on the C=
PU
> >> and taking up resources are all fences and not just the one emitted to
> >> the hardware.
> > I am more interested in pending on the GPU.
> >
> >> On the other hand when you want to measure how much time each operatio=
n
> >> took on the hardware you need to take a look at the differences of the
> >> signal events on each timeline.
> > _signaled alone is not enough when the GPU is not always busy.  After
> > the last pending fence signals but before the following _init/_emit,
> > nothing is pending.
>
> Yeah, I'm perfectly aware of that.
>
> > For all drivers except virtio-gpu, _init and "ring head update" always
> > happen close enough that I can see why _emit is redundant.  But I like
> > having _emit as a generic tracepoint for timelines where _init and
> > _emit can be apart, instead of requiring a special case tracepoint for
> > each special case timeline.
>
> And I'm certainly not going to add _emit to all drivers just because of
> that. As you said it is a special case for virtio-gpu and the GPU schedul=
er.
>
> And as I explained before the difference between _init and _emit
> shouldn't matter to your visualization. The background is that as soon
> as an dma_fence is initialized with _init it is "live" regarding the
> dependency and memory management and exactly that's what matters for the
> visualization.
>
> The latency between _init and _emit is just interesting for debugging
> the scheduler and surprisingly virtio-gpu as well, for all other use
> cases it is irrelevant.

It might actually be *more* interesting for virtio-gpu.. unless there
is some other way to link guest and host fences to see what the
potential latency of guest->host is

re: adding the tracepoint to other drivers, I'm fine with folks doing
that as needed.  Unless you have a better proposal about how to
visualize init vs emit latency, I think it's fine to have an extra
tracepoint even if it is redundant in some cases.  The visualization
tool is the customer here, we have to give it what it wants/needs.

BR,
-R

>
> Regards,
> Christian.
>
> >> So there isn't really any use case for the emit trace point, except wh=
en
> >> you want to figure out how much latency the scheduler introduce. Then
> >> you want to take a look at init and emit, but that isn't really that
> >> interesting for performance analyses.
> >>
> >> Regards,
> >> Christian.
> >>
>
