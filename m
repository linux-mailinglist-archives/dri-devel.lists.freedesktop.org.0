Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F42B2DE57
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 15:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC1710E25C;
	Wed, 20 Aug 2025 13:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nm0yw5s2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2522510E73A;
 Wed, 20 Aug 2025 13:51:06 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-32326e20657so360843a91.2; 
 Wed, 20 Aug 2025 06:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755697866; x=1756302666; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rlJXkRnyFfMw194yiBU6YgrZ0umSqMzMmufYJJtuLXM=;
 b=nm0yw5s2k5FnSXT/Pl2oRowdCjFHNRoztd1U4kQKCVZta7RwDEMeu1qOAslsMpxDjJ
 BqMRiAkQFysaXA1KBeEDhaEYy1N8xHIBk49aRuMrUKgSeDQcfun2fY6CnYgiFB6ruzNs
 EgKXljrsRkngJ3HwuUVyYrOE0qhx5EL0zCvbJIIHFTXGpPdbomyiW38f5S4aSOy3Xok4
 MKoE5dUNCb80KBGwhy07SwmiM+FpBFN0IdaByWv1hmtIhEllHsAloyocm5IfdNvHJcYe
 ft1ypl4J63HKzQoYLwfVbvNQRyxEl+ZT6VkSz70F0fMnMo04Y2xOEpdOqFnYuOIGQ9WN
 RREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755697866; x=1756302666;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rlJXkRnyFfMw194yiBU6YgrZ0umSqMzMmufYJJtuLXM=;
 b=bAoZr2h5l4m0kKqOD6CZ+Omg1Hr2xQHpU4lfEGEQnYwZQZuk7LV0efZjKThGANe41q
 sI5q1iQhv2BMj3kaTIhlf+cO81OJ5j07xoN/u1pnSDgolxWJTO6ciRgyGpr729y9VJG9
 COXxuHwZWbYbvsX4cnyC1CVwvScpAkZbcdVGGoxBlW0so0mXZ9jH3/AV7C8C2SiMsXQz
 9/6IFf9S0uBGtVAF+bKFfkAXU3P44hDCZ+K1VZixEEjwGUntCVPZNzOtVC1T5UfBlOsk
 JRw0BEOpf4qb0JCRFdRFQcnX45MefKA754e2a5AiS/qvkMXOMz1cES/9+MmipMuDnVBN
 9bRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6iwFnGHGa97jJV1kXzGhmDGS0gi74CQwlY3IMPhXNOVuilpzmy4fuxZigkSehR9yrNWaVUFxCK8s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxsamZLE9HQ0xrWyF7xIZBJYh/KubAy2FsMH1Re1AeQn3Io9lI
 nH5pCR8Ni0rRCxVM2/okZE0YxG2JxidICYUHiGyKMCjuav2cUbDx/MMX6d/oHsNpCKANWK41N2d
 v3e9g+NFRWsrNL09a1OmPFVE/BhW7sXU=
X-Gm-Gg: ASbGncuamT+vINe+IbD0I7zKpv5mHE74R3gi7/uHMpGkWxOWS4R7RKDF3xzKYGBTnEJ
 /jZ+sIQM8k3XUlBbkw/v0q2H/BDBXQZGGPWBnyHUEtupCqKixpJII8ie3G6Sly+fvQzsG1RRi2A
 Iv+opV7/RdfQ7knSgiOaR7XLN1eig0rrOJ6C2yIEL+2X4B+Q6GW/+ICbGI4ZbTXVq9zWPFfKbZV
 qKcFesGQBJ2q6JDBw==
X-Google-Smtp-Source: AGHT+IE6OAjXgpyJBTRniq4mnO0jJGbm2gGpXRPGqbR38KoHFeYRj9+xp9TQOqh/fCkb1imF5SbKiigJa79Ba97jDxw=
X-Received: by 2002:a17:90b:4a06:b0:31e:ff94:3fae with SMTP id
 98e67ed59e1d1-324e13f22d6mr2185022a91.4.1755697865494; Wed, 20 Aug 2025
 06:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250819232905.207547-1-robin.clark@oss.qualcomm.com>
 <20250819232905.207547-4-robin.clark@oss.qualcomm.com>
In-Reply-To: <20250819232905.207547-4-robin.clark@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 20 Aug 2025 09:50:54 -0400
X-Gm-Features: Ac12FXzFiomJlv1YMbkQK_BbOjXnQl8FSkekKg4vURPNW6oUakhabbsZFd5--Vg
Message-ID: <CACu1E7GgGZc7zF5YQxppMj=dG_emNhh1Ld7PbNT_oM_S436xQQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm: Fix 32b size truncation
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
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

On Tue, Aug 19, 2025 at 7:29=E2=80=AFPM Rob Clark <robin.clark@oss.qualcomm=
.com> wrote:
>
> Somehow we never noticed this when arm64 became a thing, many years ago.
>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 17 ++++++++---------
>  drivers/gpu/drm/msm/msm_gem.h |  6 +++---
>  2 files changed, 11 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.=
c
> index 958bac4e2768..9a935650e5e3 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -1142,7 +1142,7 @@ static int msm_gem_object_mmap(struct drm_gem_objec=
t *obj, struct vm_area_struct
>
>  /* convenience method to construct a GEM buffer object, and userspace ha=
ndle */
>  int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
> -               uint32_t size, uint32_t flags, uint32_t *handle,
> +               size_t size, uint32_t flags, uint32_t *handle,
>                 char *name)
>  {
>         struct drm_gem_object *obj;
> @@ -1208,9 +1208,8 @@ static const struct drm_gem_object_funcs msm_gem_ob=
ject_funcs =3D {
>         .vm_ops =3D &vm_ops,
>  };
>
> -static int msm_gem_new_impl(struct drm_device *dev,
> -               uint32_t size, uint32_t flags,
> -               struct drm_gem_object **obj)
> +static int msm_gem_new_impl(struct drm_device *dev, uint32_t flags,
> +                           struct drm_gem_object **obj)
>  {
>         struct msm_drm_private *priv =3D dev->dev_private;
>         struct msm_gem_object *msm_obj;
> @@ -1244,7 +1243,7 @@ static int msm_gem_new_impl(struct drm_device *dev,
>         return 0;
>  }
>
> -struct drm_gem_object *msm_gem_new(struct drm_device *dev, uint32_t size=
, uint32_t flags)
> +struct drm_gem_object *msm_gem_new(struct drm_device *dev, size_t size, =
uint32_t flags)
>  {
>         struct msm_drm_private *priv =3D dev->dev_private;
>         struct msm_gem_object *msm_obj;
> @@ -1259,7 +1258,7 @@ struct drm_gem_object *msm_gem_new(struct drm_devic=
e *dev, uint32_t size, uint32
>         if (size =3D=3D 0)
>                 return ERR_PTR(-EINVAL);
>
> -       ret =3D msm_gem_new_impl(dev, size, flags, &obj);
> +       ret =3D msm_gem_new_impl(dev, flags, &obj);
>         if (ret)
>                 return ERR_PTR(ret);
>
> @@ -1299,12 +1298,12 @@ struct drm_gem_object *msm_gem_import(struct drm_=
device *dev,
>         struct msm_drm_private *priv =3D dev->dev_private;
>         struct msm_gem_object *msm_obj;
>         struct drm_gem_object *obj;
> -       uint32_t size;
> +       size_t size;
>         int ret, npages;

npages should also be size_t.

>
>         size =3D PAGE_ALIGN(dmabuf->size);
>
> -       ret =3D msm_gem_new_impl(dev, size, MSM_BO_WC, &obj);
> +       ret =3D msm_gem_new_impl(dev, MSM_BO_WC, &obj);
>         if (ret)
>                 return ERR_PTR(ret);
>
> @@ -1347,7 +1346,7 @@ struct drm_gem_object *msm_gem_import(struct drm_de=
vice *dev,
>         return ERR_PTR(ret);
>  }
>
> -void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size, uint32_t=
 flags,
> +void *msm_gem_kernel_new(struct drm_device *dev, size_t size, uint32_t f=
lags,
>                          struct drm_gpuvm *vm, struct drm_gem_object **bo=
,
>                          uint64_t *iova)
>  {
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.=
h
> index 751c3b4965bc..a4cf31853c50 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -297,10 +297,10 @@ bool msm_gem_active(struct drm_gem_object *obj);
>  int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *t=
imeout);
>  int msm_gem_cpu_fini(struct drm_gem_object *obj);
>  int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
> -               uint32_t size, uint32_t flags, uint32_t *handle, char *na=
me);
> +               size_t size, uint32_t flags, uint32_t *handle, char *name=
);
>  struct drm_gem_object *msm_gem_new(struct drm_device *dev,
> -               uint32_t size, uint32_t flags);
> -void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size, uint32_t=
 flags,
> +               size_t size, uint32_t flags);
> +void *msm_gem_kernel_new(struct drm_device *dev, size_t size, uint32_t f=
lags,
>                          struct drm_gpuvm *vm, struct drm_gem_object **bo=
,
>                          uint64_t *iova);
>  void msm_gem_kernel_put(struct drm_gem_object *bo, struct drm_gpuvm *vm)=
;
> --
> 2.50.1
>
