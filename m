Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9794AA8763
	for <lists+dri-devel@lfdr.de>; Sun,  4 May 2025 17:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AFA10E0A5;
	Sun,  4 May 2025 15:47:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fRFX+337";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B8410E067;
 Sun,  4 May 2025 15:47:12 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-86135af1045so448619639f.1; 
 Sun, 04 May 2025 08:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746373631; x=1746978431; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KCB11Y01+XCfvS4lsOkPaiVFvB4yeAtymGdAMyAi5Zc=;
 b=fRFX+337lI3VsOBSnsSjWUAxq4GMXNpEykWSftorOfYELTZczay9P5Z4lpmeuoNT+Z
 GQtdvu2q1Trtd3eQR27RTQX5hjItfMeFlEoJRFfbflj7R3l5VevWCiQJS9iHycnkb2rx
 Qhs9i8d9fdleMXzGCpeq+LPUJH3i3wJVyEWarpbXBu5s6GQ0gCsXVjL6oszpA8BklAW4
 WdjU2wPQQLAja+a46CBUyuc/YoYo/YekTz09ZNXyZKtRFQEfMmvzLI506MuinQuHJFxL
 sSFer2DOlCAYIrlKT/zyIfUxrdPkbyXtvr0agRNtPXXVJGJASjf1UQnuE3UwFn9n0D6D
 4opA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746373631; x=1746978431;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KCB11Y01+XCfvS4lsOkPaiVFvB4yeAtymGdAMyAi5Zc=;
 b=Fi+biOwrGiY2c2XPoiKPPFdzR8E7hRvh0Fd95MGXc0rRV7zZGJciQEwu558h3L4naz
 1Uh0+bjadYaLaIcEmPkzDrP27tkBQl4RGka6wV08uVsp5Ppw8ynnRtKfPRBO48SOiIvj
 QO7mgwHMvEmakXR0q9RQ+Mp3aLOg1Wcec9C7H8RnRlg59YQSXpoLaCRJuvauJrz8zrbo
 KxnUBuzFKqz38HJCwZaRH6Ld0w7rCQbtUI441GFQG2PsJ5cO2Hk3OukkF83N2VZp0VTr
 0pPPeXwOVMl6pYdquhopwE56NLW5eTiWYr8+ONmWSrAlFAtQ9/V0DJHFeKEJZ8EFfJhV
 uWIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+kiNBxGbV8HxtRWWo2X6FN3Y3oVHrfsbMxT/7LmSxH0WqDJ/lfDHKuFZduinU2G9GOusJNyifspI=@lists.freedesktop.org,
 AJvYcCWupaoOcTJho8b+HLz4tIpUTsCKPyCekkNM8jtFUWkwqcmv8xtXpR85PvQKvIFUqVzzTy01fVKMAtYS@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxz4IGvJCvTVWXm1GGkylK6V9hJIw3gv6wpfdcX5+wZfK3tclGf
 SJfvdJtPggiN5QS3FQycTTQ8fATGIbDm2c3VlRaeiZKzSCYpVoz4PvWYzQqWNV5OXA1G6H0sSmo
 M+cV4kfRPSaBNlM3pcp5BxoUCk6w=
X-Gm-Gg: ASbGncut1HunhXRJb2yzHw4uDPPpzTXo/7jW0blVvGw4fBGfgzHwkTjyBNHXoUAZFD5
 ZNmzBGrMeVdWvGIL9Lab2yr4DSiu/72wMJpTnDj1ubuX+0ddTpyxBIqeUgOArSgo6m3BvxrppHN
 I0X2QMYv5BP/Cm9Cz5gT9OKw==
X-Google-Smtp-Source: AGHT+IF/JevtdssqiOoRgkiDW7LjLg2KSxw2gMBFdDf7RqHjZEb8cdLxhaA4CtAfXBLkKoc+S9iAwAL7qHV7dCcoc84=
X-Received: by 2002:a05:6e02:1889:b0:3d4:6ff4:2608 with SMTP id
 e9e14a558f8ab-3da5b2a3507mr46309295ab.12.1746373631447; Sun, 04 May 2025
 08:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250424032751.3511768-1-haoxiang_li2024@163.com>
In-Reply-To: <20250424032751.3511768-1-haoxiang_li2024@163.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 4 May 2025 08:46:59 -0700
X-Gm-Features: ATxdqUHXwmSDwj980iTtQyggMLmzSvs4wue8EqnhIc3dPv_RZ4ci2s_gz9Q7m7A
Message-ID: <CAF6AEGssqH9yEV=gXjmsmLx_haAemjT9jHT1k6ZyXOHskRnucg@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/msm: fix a potential memory leak issue in
 submit_create()
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: quic_abhinavk@quicinc.com, lumag@kernel.org, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch, 
 sumit.semwal@linaro.org, christian.koenig@amd.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 stable@vger.kernel.org
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

On Wed, Apr 23, 2025 at 8:28=E2=80=AFPM Haoxiang Li <haoxiang_li2024@163.co=
m> wrote:
>
> The memory allocated by msm_fence_alloc() actually is the
> container of msm_fence_alloc()'s return value. Thus, just
> free its return value is not enough.
> Add a helper 'msm_fence_free()' in msm_fence.h/msm_fence.c
> to do the complete job.
>
> Fixes: f94e6a51e17c ("drm/msm: Pre-allocate hw_fence")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  drivers/gpu/drm/msm/msm_fence.c      | 7 +++++++
>  drivers/gpu/drm/msm/msm_fence.h      | 1 +
>  drivers/gpu/drm/msm/msm_gem_submit.c | 2 +-
>  3 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fe=
nce.c
> index d41e5a6bbee0..72641e6a627d 100644
> --- a/drivers/gpu/drm/msm/msm_fence.c
> +++ b/drivers/gpu/drm/msm/msm_fence.c
> @@ -183,6 +183,13 @@ msm_fence_alloc(void)
>         return &f->base;
>  }
>
> +void msm_fence_free(struct dma_fence *fence)
> +{
> +       struct msm_fence *f =3D to_msm_fence(fence);
> +
> +       kfree(f);
> +}
> +
>  void
>  msm_fence_init(struct dma_fence *fence, struct msm_fence_context *fctx)
>  {
> diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_fe=
nce.h
> index 148196375a0b..635c68629070 100644
> --- a/drivers/gpu/drm/msm/msm_fence.h
> +++ b/drivers/gpu/drm/msm/msm_fence.h
> @@ -82,6 +82,7 @@ bool msm_fence_completed(struct msm_fence_context *fctx=
, uint32_t fence);
>  void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence);
>
>  struct dma_fence * msm_fence_alloc(void);
> +void msm_fence_free(struct dma_fence *fence);
>  void msm_fence_init(struct dma_fence *fence, struct msm_fence_context *f=
ctx);
>
>  static inline bool
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/m=
sm_gem_submit.c
> index 3e9aa2cc38ef..213baa5bca5e 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -56,7 +56,7 @@ static struct msm_gem_submit *submit_create(struct drm_=
device *dev,
>
>         ret =3D drm_sched_job_init(&submit->base, queue->entity, 1, queue=
);
>         if (ret) {
> -               kfree(submit->hw_fence);
> +               msm_fence_free(submit->hw_fence);

`struct dma_fence base` is the first field in `struct msm_fence`, so
to_msm_fence() is just a pointer cast.  Ie. it is fine to pass it to
kfree() as-is

BR,
-R

>                 kfree(submit);
>                 return ERR_PTR(ret);
>         }
> --
> 2.25.1
>
