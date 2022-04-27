Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE611511CB9
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 19:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A8A10E582;
	Wed, 27 Apr 2022 17:56:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCA110E582;
 Wed, 27 Apr 2022 17:56:01 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id p4so2884845edx.0;
 Wed, 27 Apr 2022 10:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ijtMoSe/qatT3ctcAxVlZXs3Lx1XbTyuAMcsJ9l1Q+Y=;
 b=ihaVo7nxjxkeZ+ZkmgLOxPOk65b4ABTQ9BMTNxuv8aiegpoMwOk/OTxT8JjfAacFoU
 MMv64RHPpB8CExO87HZhX76WS9P2GlhJE+ygRzIUA2zW+KwL5fWAnWaWj5nFa6SnNm02
 b1isr9r1GTLFb1Nm+dipS9IpkfyJhjgZSuQYr2gLfxh/FInHSqxcnRGAwb4hQgJlj6Pi
 usHYDVvBWqXyFA1m0QMlI9kNzNhFux/GVZppkd4wmNzTVg9VVNnsWL95qEkC/eYTug2J
 +Zz0FjzjOUuVIEISC9hsFZvZtdC8aL9jzTiu85Nki/7zTIpiKS4oJjI6ekDBQP3DIh7F
 x+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ijtMoSe/qatT3ctcAxVlZXs3Lx1XbTyuAMcsJ9l1Q+Y=;
 b=GKdQ32AQLYplffZOmeyqNtem1PE2Kz2SVpw6bmvKU934uAhuhIVxEsSi15+yeyB0ZO
 qjs6Nh3XFhXZGfiLjMgrxJVzG2nSPN+VPJrQ3NJ12+yofrfEIxR4qy5Z7Etb7I7MJPn6
 1WYXjAfCm1tcpDmMbSYN/d/ytpv9CnaWW0wzC9NxM0wfX/dH20fFD1h7QYzie24loIrg
 Z1BY4/HxE8ekOYzzIMzGHiEoD4GbtBK4G+gZG8nQSfesgn6n47kMvHwfJkEKUYTBEIM9
 kggQ7643lvi8HSC+RQ1K+wCIM0CHlHEPyabaLz6AFo43YwDcDzCV6YilKv+a9SQ2NyAC
 Aezw==
X-Gm-Message-State: AOAM532RjhzH5m0zPSnOvWg56eddbuf2I3qAxIjTRF3KHnUTXl2zT2Ja
 TFFZrs+zVWhg7ZQfAsLqoExYBZ6V00ZBQjed3oA=
X-Google-Smtp-Source: ABdhPJxxNBI0Es2hv/gFazRX6lu/XY8vrqbAAbRzYa4G/PWnaYK/xKllRxXJMzR1sDa1VWm6YAK++Q6dCPAracTbHtw=
X-Received: by 2002:aa7:c54d:0:b0:425:d8c9:efc6 with SMTP id
 s13-20020aa7c54d000000b00425d8c9efc6mr21798885edr.48.1651082159992; Wed, 27
 Apr 2022 10:55:59 -0700 (PDT)
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
 <CAJs_Fx7Jq9VWy_Eux+hGoQTCTeKkFMQCdibY9gFQTqrvVob5fA@mail.gmail.com>
In-Reply-To: <CAJs_Fx7Jq9VWy_Eux+hGoQTCTeKkFMQCdibY9gFQTqrvVob5fA@mail.gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 27 Apr 2022 10:55:48 -0700
Message-ID: <CAPaKu7QoytONEBzHjTpzbjJ4nb6HFOcVX5iosLVFLEa3GfLOyQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: add trace_dma_fence_emit to msm_gpu_submit
To: Rob Clark <robdclark@chromium.org>
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 27, 2022 at 9:07 AM Rob Clark <robdclark@chromium.org> wrote:
>
> On Tue, Apr 26, 2022 at 11:20 PM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> >
> > Am 26.04.22 um 20:50 schrieb Chia-I Wu:
> > > On Tue, Apr 26, 2022 at 11:02 AM Christian K=C3=B6nig
> > > <christian.koenig@amd.com> wrote:
> > >> Am 26.04.22 um 19:40 schrieb Chia-I Wu:
> > >>> [SNIP]
> > >>>>>> Well I just send a patch to completely remove the trace point.
> > >>>>>>
> > >>>>>> As I said it absolutely doesn't make sense to use this for
> > >>>>>> visualization, that's what the trace_dma_fence_init trace point =
is good for.
> > >>> I am a bit confused by this.  _emit and _signaled are a great way t=
o
> > >>> see how many fences are pending from cpu's point of view.  How does
> > >>> _emit make no sense and _init is good instead?
> > >> We had exactly that confusion now multiple times and it's one of the
> > >> main reasons why I want to remove the _emit trace point.
> > >>
> > >> See the when you want to know how many fences are pending you need t=
o
> > >> watch out for init/destroy and *NOT* emit.
> > >>
> > >> The reason is that in the special case where emit makes sense (e.g. =
the
> > >> GPU scheduler fences) emit comes later than init, but pending on the=
 CPU
> > >> and taking up resources are all fences and not just the one emitted =
to
> > >> the hardware.
> > > I am more interested in pending on the GPU.
> > >
> > >> On the other hand when you want to measure how much time each operat=
ion
> > >> took on the hardware you need to take a look at the differences of t=
he
> > >> signal events on each timeline.
> > > _signaled alone is not enough when the GPU is not always busy.  After
> > > the last pending fence signals but before the following _init/_emit,
> > > nothing is pending.
> >
> > Yeah, I'm perfectly aware of that.
> >
> > > For all drivers except virtio-gpu, _init and "ring head update" alway=
s
> > > happen close enough that I can see why _emit is redundant.  But I lik=
e
> > > having _emit as a generic tracepoint for timelines where _init and
> > > _emit can be apart, instead of requiring a special case tracepoint fo=
r
> > > each special case timeline.
> >
> > And I'm certainly not going to add _emit to all drivers just because of
> > that. As you said it is a special case for virtio-gpu and the GPU sched=
uler.
> >
> > And as I explained before the difference between _init and _emit
> > shouldn't matter to your visualization. The background is that as soon
> > as an dma_fence is initialized with _init it is "live" regarding the
> > dependency and memory management and exactly that's what matters for th=
e
> > visualization.
> >
> > The latency between _init and _emit is just interesting for debugging
> > the scheduler and surprisingly virtio-gpu as well, for all other use
> > cases it is irrelevant.
>
> It might actually be *more* interesting for virtio-gpu.. unless there
> is some other way to link guest and host fences to see what the
> potential latency of guest->host is
>
> re: adding the tracepoint to other drivers, I'm fine with folks doing
> that as needed.  Unless you have a better proposal about how to
> visualize init vs emit latency, I think it's fine to have an extra
> tracepoint even if it is redundant in some cases.  The visualization
> tool is the customer here, we have to give it what it wants/needs.
As far as perfetto is concerned, I just use either _init or _emit on a
per-timeline basis.  We can drop this patch for msm, and do not need
to change drivers whose latencies between _init/_emit are ignorable.

init vs emit latency is still interesting.  I prefer keeping _init /
_emit as generic events that tools can parse, rather than adding
per-driver special cases that tools need to understand.

>
> BR,
> -R
>
> >
> > Regards,
> > Christian.
> >
> > >> So there isn't really any use case for the emit trace point, except =
when
> > >> you want to figure out how much latency the scheduler introduce. The=
n
> > >> you want to take a look at init and emit, but that isn't really that
> > >> interesting for performance analyses.
> > >>
> > >> Regards,
> > >> Christian.
> > >>
> >
