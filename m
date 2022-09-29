Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AC55EFE5A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 22:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A4D10ECB2;
	Thu, 29 Sep 2022 20:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622C910EC9C;
 Thu, 29 Sep 2022 20:04:53 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id 29so3404493edv.7;
 Thu, 29 Sep 2022 13:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=C1SQMmBRmTyEVOMbhaAQMeOUONnQ+FGaXxnl2YAvmrE=;
 b=n7IgS7SXNECRDQUeaRBSJ5wli4+QS2+jeKAKKZtFPXRGZ+vy0RGU/spfyHKGXvTST4
 OX5GOKeQi2OMG7nsWx3CUo5zhYlLHt9okBO8iB6/OuX5lHhfmfNm1IS8hsi8+xJLG7SJ
 7ErOeGBYUbUWe44r7ZazZP0BQezo8arc2e2Xs1yYe+r5P898AYsB3mL9KT52OfmSQABr
 qaIQu76s8lHj1d1jKbL+w5AvjDlywqzhPhSJtA+ExxHEykewqzJvNCVieTBBd/ZhIS40
 3rDhBRWqC7wrsxDA19+GhdZr2Qz0pTjjDdYoIdfluB8szD3h7pAJcezEoG/oowZTqghU
 uUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=C1SQMmBRmTyEVOMbhaAQMeOUONnQ+FGaXxnl2YAvmrE=;
 b=xxG6NVZzKZ8zsLvqykTpap3QwfDEErzZvgAw5JeysXl7HIaNEbUT7VC5RIYOlTJ1DV
 3tZmmJCb/cKqX/0RnkCq8mu/vpJBrugMaioaSZ3iinyIlV+i8jdNdLJm+tFgWUgkoD95
 f1PZkGNFruFCWJRR2Hqvdh1EdwD2Eu0O0XNVDoSEIWY1uzdMYiEJYkE/aja8ZUFRZ7V4
 bVo81clfnxHfzwPp/WIIpaA7lwroDGRLhMt6SjrLYpKVbWmN/iRarWAZltfAmwJFH2Oy
 asiyubvrV1NhZYGmREQun3MDfkNR9PqL1Gxc/WQq+tjbruRkPFb30Eomvdbc+DuTc+UJ
 cQRw==
X-Gm-Message-State: ACrzQf1YoPdlZdXfyhEqZEZN1AJL486iDemUB5drG21OKABB9hWIYotl
 ZSwAjUb5greDRTNH6FFqUyP6UTNUTOkw+rkgWBc=
X-Google-Smtp-Source: AMsMyM6/XBxE8xjr69xW6e+lpK4ZrqBzJk6Ez4gqwoceyaoK2joYM/B1UGIPEZZoXP/4uBGvWQK0R6+StrjO1YqKrCE=
X-Received: by 2002:a05:6402:3489:b0:451:a859:8a4f with SMTP id
 v9-20020a056402348900b00451a8598a4fmr4775818edc.279.1664481891760; Thu, 29
 Sep 2022 13:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220923224043.2449152-1-robdclark@gmail.com>
In-Reply-To: <20220923224043.2449152-1-robdclark@gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 29 Sep 2022 13:04:40 -0700
Message-ID: <CAPaKu7SiVjW2oQcdUJ9jrJVR1RXKSd2f6DhbHTtYCyzsukGd9g@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/gem: Unpin objects slightly later
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 23, 2022 at 3:41 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The introduction of 025d27239a2f exposes a problem with f371bcc0c2ac, in
> that we need to keep the object pinned in the time the submit is queued
> up in the gpu scheduler.  Otherwise the shrinker will see it as a thing
> that can be evicted if we wait for it to be signaled.  But if the
> shrinker path is waiting on it with the obj lock held, the job cannot be
> scheduled, as that also requires briefly grabbing the obj lock, leading
> to deadlock.  (Not to mention, we don't want the shrinker to evict an
> obj queued up in gpu scheduler.)
>
> Fixes: f371bcc0c2ac ("drm/msm/gem: Unpin buffers earlier")
> Fixes: 025d27239a2f ("drm/msm/gem: Evict active GEM objects when necessary")
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/19
> Signed-off-by: Rob Clark <robdclark@chromium.org>
Tested-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 4 ++--
>  drivers/gpu/drm/msm/msm_ringbuffer.c | 3 ++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 5599d93ec0d2..c670591995e6 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -501,11 +501,11 @@ static int submit_reloc(struct msm_gem_submit *submit, struct msm_gem_object *ob
>   */
>  static void submit_cleanup(struct msm_gem_submit *submit, bool error)
>  {
> -       unsigned cleanup_flags = BO_LOCKED | BO_OBJ_PINNED;
> +       unsigned cleanup_flags = BO_LOCKED;
>         unsigned i;
>
>         if (error)
> -               cleanup_flags |= BO_VMA_PINNED;
> +               cleanup_flags |= BO_VMA_PINNED | BO_OBJ_PINNED;
>
>         for (i = 0; i < submit->nr_bos; i++) {
>                 struct msm_gem_object *msm_obj = submit->bos[i].obj;
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> index cad4c3525f0b..57a8e9564540 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -25,7 +25,8 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
>
>                 msm_gem_lock(obj);
>                 msm_gem_unpin_vma_fenced(submit->bos[i].vma, fctx);
> -               submit->bos[i].flags &= ~BO_VMA_PINNED;
> +               msm_gem_unpin_locked(obj);
> +               submit->bos[i].flags &= ~(BO_VMA_PINNED | BO_OBJ_PINNED);
>                 msm_gem_unlock(obj);
>         }
>
> --
> 2.37.2
>
