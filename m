Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2A697D905
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 19:30:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93C910E85A;
	Fri, 20 Sep 2024 17:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cYiq1RoF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D5E10E069;
 Fri, 20 Sep 2024 17:29:56 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-39f56df0ddbso9392845ab.3; 
 Fri, 20 Sep 2024 10:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726853396; x=1727458196; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7vlHUoHs0FcmxQf+gRGeqkvknNNXsHGuxyDqS9sJWsg=;
 b=cYiq1RoFQPTKvQOjQmKYMAy21EKUMNWAlUzzL7JGPZpZlSdQPHD9EDIU1Jv/VIB11f
 9Mz+pIaY/GMzwh5vNKO1SZWiyxes3EzH82qKVzsIi7x0y6bXHJfTiNFCCo9EWj/ExpIV
 jCdTe0zHfp1NWxJGUXanVJ5VGZyAVMHmIsiHjmyKw0PcEcVR4FYaDMbhY+a0ZBbTY96q
 hzlRGwrU5jNek4YvHedFwXgBNzNTJyiYRt3/2j1m9fJ1urvvbBfkT3KZY72HM4OsnZGg
 IHxGyi9w6qJHtCR3nq3N9jEBBJiArk2rKrVVnnLnGPQgQ9Oe/lFFXccSrFsOY4Qzm9Iz
 YBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726853396; x=1727458196;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7vlHUoHs0FcmxQf+gRGeqkvknNNXsHGuxyDqS9sJWsg=;
 b=Rh2Vnf5qcMmFQLaVk2kqbAFt4uiJ4+fbP6VwjYG92GmUoXc40wFSm5JvZ7whhUW/1a
 fBbfflXPpGEU7LZEncuarJjIcXAfdtCZAcIl4nMAcPY6aAX8mpx+Q4ScZUqtw0Vp6uaj
 83cKrFTQExC7Vol/D0yYS9fKrLfuH/3azCAloJgPR68l416z1AHiT1KkJC63+cPG4X3a
 B2DOL422udy7Ae2M8WSBx7fGU+4Uoeqf+yWyAHeUp6d22pNtVZUsOXHjMmWGoOuf8AJR
 zbVjrhxC+BVZVy3xmCsPBBnXO/xuYNM0Ev12E9TCP6cYTnjeEEXxU0vmvxVZGIWHOZOU
 lz9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxOwZsgBX+YMMusLhkPn6F+07qC+JLWK+23V+zS7xsNleGI004WKBZ1hRPDrJMn2ncCqu94Nvcf00=@lists.freedesktop.org,
 AJvYcCXlfjfndNEnW3YKCCsKObpokBAnT/ekOmsLkMMaXRrWH0h6H0qpI+zpmgFErj5ObGJmApJcTnWIVxj3@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7B1BlLiMxuF8gr9wyGJIBJUTKMf8aenBDaCjQjpTvpxG7U85U
 Rrzlc4Y1Va2Z266aiqEt3qQTr/v1krdyUbwS967yTjGqeRunV+tIvrSbmdFk2Fo5doSN0q7nryo
 MahOrjF0b0oxhQrwKwUM3IgdNR+E=
X-Google-Smtp-Source: AGHT+IHNXGCljUfMLJx6sCLO4++HQZjQ/FOVgWDT41eOWzzfjs+TkV2rqYcXQef9v8l+9n/cftti5MrlsII4SNy0Vq0=
X-Received: by 2002:a05:6e02:1a2d:b0:3a0:9fa5:8f2 with SMTP id
 e9e14a558f8ab-3a0c8d15e27mr38885115ab.18.1726853395783; Fri, 20 Sep 2024
 10:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
 <20240917-preemption-a750-t-v4-9-95d48012e0ac@gmail.com>
 <20240920165427.wikjsywhbcb2kz7h@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240920165427.wikjsywhbcb2kz7h@hu-akhilpo-hyd.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 20 Sep 2024 10:29:44 -0700
Message-ID: <CAF6AEGv95t=ioPGYLi6CdEuQzx9GC9ehMaTyG03ucbdVHx3eEg@mail.gmail.com>
Subject: Re: [PATCH v4 09/11] drm/msm/A6XX: Add a flag to allow preemption to
 submitqueue_create
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Antonino Maniscalco <antomani103@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
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

On Fri, Sep 20, 2024 at 9:54=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On Tue, Sep 17, 2024 at 01:14:19PM +0200, Antonino Maniscalco wrote:
> > Some userspace changes are necessary so add a flag for userspace to
> > advertise support for preemption when creating the submitqueue.
> >
> > When this flag is not set preemption will not be allowed in the middle
> > of the submitted IBs therefore mantaining compatibility with older
> > userspace.
> >
> > The flag is rejected if preemption is not supported on the target, this
> > allows userspace to know whether preemption is supported.
>
> Just curious, what is the motivation behind informing userspace about
> preemption support?

I think I requested that, as a "just in case" (because it would
otherwise be awkward if we later needed to know the difference btwn
drm/sched "preemption" which can only happen before submit is written
to ring and "real" preemption)

BR,
-R

> -Akhil
>
> >
> > Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++++++++----
> >  drivers/gpu/drm/msm/msm_submitqueue.c |  3 +++
> >  include/uapi/drm/msm_drm.h            |  5 ++++-
> >  3 files changed, 15 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index 736f475d696f..edbcb6d229ba 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -430,8 +430,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struc=
t msm_gem_submit *submit)
> >       OUT_PKT7(ring, CP_SET_MARKER, 1);
> >       OUT_RING(ring, 0x101); /* IFPC disable */
> >
> > -     OUT_PKT7(ring, CP_SET_MARKER, 1);
> > -     OUT_RING(ring, 0x00d); /* IB1LIST start */
> > +     if (submit->queue->flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT) {
> > +             OUT_PKT7(ring, CP_SET_MARKER, 1);
> > +             OUT_RING(ring, 0x00d); /* IB1LIST start */
> > +     }
> >
> >       /* Submit the commands */
> >       for (i =3D 0; i < submit->nr_cmds; i++) {
> > @@ -462,8 +464,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struc=
t msm_gem_submit *submit)
> >                       update_shadow_rptr(gpu, ring);
> >       }
> >
> > -     OUT_PKT7(ring, CP_SET_MARKER, 1);
> > -     OUT_RING(ring, 0x00e); /* IB1LIST end */
> > +     if (submit->queue->flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT) {
> > +             OUT_PKT7(ring, CP_SET_MARKER, 1);
> > +             OUT_RING(ring, 0x00e); /* IB1LIST end */
> > +     }
> >
> >       get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
> >               rbmemptr_stats(ring, index, cpcycles_end));
> > diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/ms=
m/msm_submitqueue.c
> > index 0e803125a325..9b3ffca3f3b4 100644
> > --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> > +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> > @@ -170,6 +170,9 @@ int msm_submitqueue_create(struct drm_device *drm, =
struct msm_file_private *ctx,
> >       if (!priv->gpu)
> >               return -ENODEV;
> >
> > +     if (flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT && priv->gpu->nr_rings =
=3D=3D 1)
> > +             return -EINVAL;
> > +
> >       ret =3D msm_gpu_convert_priority(priv->gpu, prio, &ring_nr, &sche=
d_prio);
> >       if (ret)
> >               return ret;
> > diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> > index 3fca72f73861..f37858db34e6 100644
> > --- a/include/uapi/drm/msm_drm.h
> > +++ b/include/uapi/drm/msm_drm.h
> > @@ -345,7 +345,10 @@ struct drm_msm_gem_madvise {
> >   * backwards compatibility as a "default" submitqueue
> >   */
> >
> > -#define MSM_SUBMITQUEUE_FLAGS (0)
> > +#define MSM_SUBMITQUEUE_ALLOW_PREEMPT        0x00000001
> > +#define MSM_SUBMITQUEUE_FLAGS                    ( \
> > +             MSM_SUBMITQUEUE_ALLOW_PREEMPT | \
> > +             0)
> >
> >  /*
> >   * The submitqueue priority should be between 0 and MSM_PARAM_PRIORITI=
ES-1,
> >
> > --
> > 2.46.0
> >
