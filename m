Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3B94FA9F9
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 19:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1584910E1D3;
	Sat,  9 Apr 2022 17:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E48010E153;
 Sat,  9 Apr 2022 17:45:32 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id g20so13468422edw.6;
 Sat, 09 Apr 2022 10:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3zBO5CD9UX+IT76AzELaMXNAgkmYrYDhrgj6xL0L14E=;
 b=TSb58y9YqPpVFRPdbIEQK+gFoprP+Jdfjo+Oykg41m3A9z2nrKlZs/ekYbK5nRpGSS
 bUkuKaTAs8k6TonxGtfYxjzXGuQIFnGPF6g60bTV7A0yiUIz21MeyFIBKpBNE/NhLslv
 IHm1fpMxvixQjFjxx/AFx2C+7JWeevZxgmIhIR/OFbFTLgohUvVRWGvW8+IAbhJtQSYi
 7fP0VW8m/P7Vg2sZZm8nR7QFzM20Jp4TjZRViRFD+7I5qrzzSuUN9SYsUoXTCV2V9UTB
 AH9byGAWbNcp+57iQ8jcHM5GOxq9yBSkSniyaTO7XpiMjpmT+jMpmOStwsH8uMQV63iz
 nzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3zBO5CD9UX+IT76AzELaMXNAgkmYrYDhrgj6xL0L14E=;
 b=Wb30QNUzvUIaiG7thrcBiKlbSuNekihtkFkvdryP3VyI2ez73OZIz5IGPobh88ukse
 P09AbQpUCi3aIj/EvKUfSXPtPnuIvJLMac2IuDTf+HOxj1lXgsgFWk7BRton9UEtXPY9
 sAbIdYAxr4v0KzItrqm497jS7mV8WfTNMj+MsjALPfAmBG+yGqty5m27X1vKSapCB8Rq
 Mxm9L034+Ilu76Y4eRUuuvnjLyOIPHo0oMnW2To4UCYpUw6+jgv23zOsMAJNwX32bBDN
 YAOGPR8AsDvkU3t/f8X3TD4N2VYAZINuHO1D7p+3Kv5Dcu7NKx9pHLoY0uW7dZTs64d+
 hbFA==
X-Gm-Message-State: AOAM532G96r0lYtrUKEHqwbqxOSstpJWBRGh7loYJH/SxJ38egdQOP9w
 74HLn0OcXIDRIXMdNt0HiRq8EXGXrOJmHOMCTv8=
X-Google-Smtp-Source: ABdhPJyPeErwbdDr92uL/Pq3ty2CewQvMwmQpNfy2FUbFVBaK6JTwqCspZ6zZptxqIZ/DpezXq01fduO9SGvQv9I4E0=
X-Received: by 2002:a05:6402:2794:b0:419:2ed8:f36e with SMTP id
 b20-20020a056402279400b004192ed8f36emr25167817ede.44.1649526330798; Sat, 09
 Apr 2022 10:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220408211230.601475-1-olvaffe@gmail.com>
 <fe1e583c-b942-0f33-55d1-435f0966b110@amd.com>
In-Reply-To: <fe1e583c-b942-0f33-55d1-435f0966b110@amd.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Sat, 9 Apr 2022 10:45:19 -0700
Message-ID: <CAPaKu7Tk3PjuzmbaVOrQbTXMZAg95frV+n4pQb76StSLoRt8gA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: add trace_dma_fence_emit to msm_gpu_submit
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 9, 2022 at 7:33 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 08.04.22 um 23:12 schrieb Chia-I Wu:
> > In practice, trace_dma_fence_init is good enough and almost no driver
> > calls trace_dma_fence_emit.  But this is still more correct in theory.
>
> Well, the reason why basically no driver is calling this is because it
> is pretty much deprecated.
Why is it considered deprecated?  trace_dma_fence_{emit,signaled} are
useful to visualize fence timelines.  I am actually less sure about
how trace_dma_fence_{init,destroy} are used.

Is it because trace_dma_fence_init is called automatically, and is
good enough most of the time?

>
> We do have a case in the GPU scheduler where it makes sense to distinct
> between init and emit, but it doesn't really matter for drivers.
virtio also has a case where init and emit can be far apart, when the
host cannot process commands fast enough and there is no space in
virtqueue.

>
> So I'm not sure if it's a good idea to add that here.
>
> Regards,
> Christian.
>
> >
> > Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> > Cc: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/msm_gpu.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gp=
u.c
> > index faf0c242874e..a82193f41ea2 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -15,6 +15,7 @@
> >   #include <linux/string_helpers.h>
> >   #include <linux/devcoredump.h>
> >   #include <linux/sched/task.h>
> > +#include <trace/events/dma_fence.h>
> >
> >   /*
> >    * Power Management:
> > @@ -769,6 +770,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm=
_gem_submit *submit)
> >       gpu->active_submits++;
> >       mutex_unlock(&gpu->active_lock);
> >
> > +     trace_dma_fence_emit(submit->hw_fence);
> >       gpu->funcs->submit(gpu, submit);
> >       gpu->cur_ctx_seqno =3D submit->queue->ctx->seqno;
> >
>
