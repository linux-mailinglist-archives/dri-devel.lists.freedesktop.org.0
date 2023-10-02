Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 095F17B56E3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 17:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE5A10E040;
	Mon,  2 Oct 2023 15:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9B010E040
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 15:49:14 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1e0ee4e777bso3466177fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 08:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696261754; x=1696866554; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BptsAia2zY2xrJTWG/txWhQRNkx3x8Y+cJ1RtWZDW60=;
 b=DRcsAuAyhzsjjJDp1xHtL/nqD6AmfaGnqpWiSwfxOEsFck+Mv7BPPFXMma7P1KUZCy
 QAruybXJZUuV1MyWfHIKlQP0xWzbCOaZdbUSbfYO86QmINHnG6l1UYVBdL/wgZhmsJUd
 rnTnNyIsR39wC3prhqQAptosbR3nUfam5wK6TuRGgeZLEJqnS0W8ydhoPTRT3/qNLfaX
 5imkBkAfJ9E3qCq1C6TTbe5H3wuUvFrvw877HQf4A+GqvY0rZTIQRziTvREATOo1Ffus
 Beh8sVHPfhRtLlXpp8ynU83fIp0xKAPlf9CP0OvZGkmfdIcBie5uBmhklZ/EnasGNha5
 0w5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696261754; x=1696866554;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BptsAia2zY2xrJTWG/txWhQRNkx3x8Y+cJ1RtWZDW60=;
 b=X2KRi4xR5qIzjTalCM8pKlO2gCccUnJcxbl1/ngLI1FvoiNp/Pr7y0uEt2wY9bYD2d
 Oa+G3l4Ypjqjj90/71cpqdXSYh6z4+1jiNHGrZtkkWPoM2wnu99cw3jywnKK95CQSqrc
 F/5a6npUV4nHWaJpUKqfOcqlWQnmOnogZlKPKvGnMy73zaL5FfkZCoGjRJKBjzowAJub
 bkdQGw4T9MbF2tHNXx/Aaev5J8xPZS7+cW3NdHB3XBg2B08NyeeocVp71IfORrn6k8sU
 /vh7SgJh0FKUY+9nwCCpxV3h2gAK8+KtZtDOu9I+Fpp0LjeBTco3fRqJq6eygcPd6wmi
 lw5w==
X-Gm-Message-State: AOJu0YwyUiXLxFZWnERyPN3d2R5zvwIxT1WLek0c82T8uaEM1Q/z0qYj
 L0iThfsYOZxPh1uwkE4bCUOMF5ym7X2/A35yVIA=
X-Google-Smtp-Source: AGHT+IEc9prIWlOCaCLAg98dQUWJdD66DgRyIDjkm1oAAMmTNPBbrv/qQrQ7CZMGeWsrFL/Z0aMm1apytZbQfKVh2DU=
X-Received: by 2002:a05:6870:2045:b0:1bb:84af:bf8f with SMTP id
 l5-20020a056870204500b001bb84afbf8fmr14019984oad.58.1696261753866; Mon, 02
 Oct 2023 08:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230929104725.2358-1-christian.koenig@amd.com>
In-Reply-To: <20230929104725.2358-1-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Oct 2023 11:49:03 -0400
Message-ID: <CADnq5_NooB3xq4igS-M1W77bMB1DtABXUAfMk5Pgqaxe2CXXPw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: add dma_fence_timestamp helper
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Yunxiang.Li@amd.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Sep 30, 2023 at 7:06=E2=80=AFPM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> When a fence signals there is a very small race window where the timestam=
p
> isn't updated yet. sync_file solves this by busy waiting for the
> timestamp to appear, but on other ocassions didn't handled this
> correctly.
>
> Provide a dma_fence_timestamp() helper function for this and use it in
> all appropriate cases.
>
> Another alternative would be to grab the spinlock when that happens.
>
> v2 by teddy: add a wait parameter to wait for the timestamp to show up, i=
n case
>    the accurate timestamp is needed and/or the timestamp is not based on
>    ktime (e.g. hw timestamp)
> v3 chk: drop the parameter again for unified handling
>
> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Fixes: 1774baa64f93 ("drm/scheduler: Change scheduled fence track v2")

Looks correct to me.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/dma-buf/dma-fence-unwrap.c     | 13 ++++---------
>  drivers/dma-buf/sync_file.c            |  9 +++------
>  drivers/gpu/drm/scheduler/sched_main.c |  2 +-
>  include/linux/dma-fence.h              | 19 +++++++++++++++++++
>  4 files changed, 27 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fen=
ce-unwrap.c
> index c625bb2b5d56..628af51c81af 100644
> --- a/drivers/dma-buf/dma-fence-unwrap.c
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -76,16 +76,11 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned i=
nt num_fences,
>                 dma_fence_unwrap_for_each(tmp, &iter[i], fences[i]) {
>                         if (!dma_fence_is_signaled(tmp)) {
>                                 ++count;
> -                       } else if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
> -                                           &tmp->flags)) {
> -                               if (ktime_after(tmp->timestamp, timestamp=
))
> -                                       timestamp =3D tmp->timestamp;
>                         } else {
> -                               /*
> -                                * Use the current time if the fence is
> -                                * currently signaling.
> -                                */
> -                               timestamp =3D ktime_get();
> +                               ktime_t t =3D dma_fence_timestamp(tmp);
> +
> +                               if (ktime_after(t, timestamp))
> +                                       timestamp =3D t;
>                         }
>                 }
>         }
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index af57799c86ce..2e9a316c596a 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -268,13 +268,10 @@ static int sync_fill_fence_info(struct dma_fence *f=
ence,
>                 sizeof(info->driver_name));
>
>         info->status =3D dma_fence_get_status(fence);
> -       while (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) &&
> -              !test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags))
> -               cpu_relax();
>         info->timestamp_ns =3D
> -               test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags) ?
> -               ktime_to_ns(fence->timestamp) :
> -               ktime_set(0, 0);
> +               dma_fence_is_signaled(fence) ?
> +                       ktime_to_ns(dma_fence_timestamp(fence)) :
> +                       ktime_set(0, 0);
>
>         return info->status;
>  }
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 506371c42745..5a3a622fc672 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -929,7 +929,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *s=
ched)
>
>                 if (next) {
>                         next->s_fence->scheduled.timestamp =3D
> -                               job->s_fence->finished.timestamp;
> +                               dma_fence_timestamp(&job->s_fence->finish=
ed);
>                         /* start TO timer for next job */
>                         drm_sched_start_timeout(sched);
>                 }
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 0d678e9a7b24..ebe78bd3d121 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -568,6 +568,25 @@ static inline void dma_fence_set_error(struct dma_fe=
nce *fence,
>         fence->error =3D error;
>  }
>
> +/**
> + * dma_fence_timestamp - helper to get the completion timestamp of a fen=
ce
> + * @fence: fence to get the timestamp from.
> + *
> + * After a fence is signaled the timestamp is updated with the signaling=
 time,
> + * but setting the timestamp can race with tasks waiting for the signali=
ng. This
> + * helper busy waits for the correct timestamp to appear.
> + */
> +static inline ktime_t dma_fence_timestamp(struct dma_fence *fence)
> +{
> +       if (WARN_ON(!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)=
))
> +               return ktime_get();
> +
> +       while (!test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags))
> +               cpu_relax();
> +
> +       return fence->timestamp;
> +}
> +
>  signed long dma_fence_wait_timeout(struct dma_fence *,
>                                    bool intr, signed long timeout);
>  signed long dma_fence_wait_any_timeout(struct dma_fence **fences,
> --
> 2.34.1
>
