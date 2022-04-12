Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0774D4FE8D9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 21:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FFF10E6CB;
	Tue, 12 Apr 2022 19:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3823010E728
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 19:40:41 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id j8so17672667pll.11
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 12:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KcAH7mF9eHpU+lzQ0ZOVf7kLghMZDIfYqzoC1pN6kTM=;
 b=lvdmYsNPUPYWEsyu97OOGiswPuqEO5+U6hmLz19+U3z1EhfM40k+q3vdyFLwSVjxYq
 HyuqZIKnAZNpXj1GgNiUIwAGq/wXIDrmKGdOeUgMmLGSLnsCIuw5tP/vgQDv+CVY5c9K
 PdTW8Fc/CJKDbvFX7+TUPjQOlYkFKnMMGTVOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KcAH7mF9eHpU+lzQ0ZOVf7kLghMZDIfYqzoC1pN6kTM=;
 b=TUGRrYjAtbgZv9ksTw84dkAJB24pyWZlNMv/QLWty1u6p39psk+SO8zHzczO9L0nPo
 p372LiLdS6JyhCSGz2hWZbM8G8IDgfuacX8AJQd3OMiuBCXjaCocVuVEJQDE43sNHmhi
 6VE0Oq3mbOMUJhaDr/14ARJh4vLIGmGPw8hu7c68e6dpL7ncIn8A0/OvwFgRWuXql6Zv
 VQragCko+G+ufvp9GDkH+5Q+IBbpot0HcgoOahRCxP8kFPinoRYHyGmJP/al+FRFug0e
 UYIz1gVsD0jgHzYc9gqeBI4nan24yuDOabhZWPQBZeBpujNEJBJYXXmdVv+L0TCl5w3f
 oq8g==
X-Gm-Message-State: AOAM532+a0tyH8WfiJ5OFOCBmp5oDQYNx5RNrPGgBl0F3xD6Otmjep0b
 0/s3EZ2h+QackjGOGv61GkzcEooKw4oFsecCJpRPRg==
X-Google-Smtp-Source: ABdhPJySFUINMJMixO8zjYrN5d3dPQurR2XuF6FeIqDtLCfyJ3PnvHW2g+hJC7Fln34M7qkAWjkWthog0cz8f1w8sAY=
X-Received: by 2002:a17:903:1248:b0:151:9708:d586 with SMTP id
 u8-20020a170903124800b001519708d586mr39321437plh.15.1649792440697; Tue, 12
 Apr 2022 12:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220408211230.601475-1-olvaffe@gmail.com>
 <fe1e583c-b942-0f33-55d1-435f0966b110@amd.com>
In-Reply-To: <fe1e583c-b942-0f33-55d1-435f0966b110@amd.com>
From: Rob Clark <robdclark@chromium.org>
Date: Tue, 12 Apr 2022 12:41:40 -0700
Message-ID: <CAJs_Fx6ehFu4Fzvo93XCN+7yufU0NQCshreDniRk37V4f6fmPA@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>
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
>
> We do have a case in the GPU scheduler where it makes sense to distinct
> between init and emit, but it doesn't really matter for drivers.
>
> So I'm not sure if it's a good idea to add that here.

visualization can't easily differentiate between drivers/timelines
where the split matters and ones where it doesn't..  IMO it is better
to just have the extra trace even in the cases where it comes at the
same time as the init trace

BR,
-R

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
