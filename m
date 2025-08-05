Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4295DB1BBC6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 23:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4876B10E036;
	Tue,  5 Aug 2025 21:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="boKniynx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D6110E036;
 Tue,  5 Aug 2025 21:32:15 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b350c85cf4eso648355a12.1; 
 Tue, 05 Aug 2025 14:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754429535; x=1755034335; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S8XfqBcuUbvXZzlLXlPsAW+gig/cCq9lWEta9lhp7ac=;
 b=boKniynxJWqEhT04PmUgbs7SZmnLKZ3A10FBm5RAQXrxcxmXMXB2NFp1USTKi0uMN0
 YZndziHGhLoSw8osrRk0Ny90slus4sgJobIyS78jMPn8xYhww8qCab1IGB6vJ8W4zMcD
 gJx8gDq2tQCijfBIJWuTeIVQ6HXDZS8Ceg6WXfywP8cR/E8kpEUvJRf2nbAKP/RCGRAM
 8kJ8BSie3HsZhvr9pHplTk6cKGNNFcaKK7lTbNOH45URnXCsYEOkaZ9fsvsA5hjlntDR
 SiteXCu4rvo3u7wW4Ad0DsOt5gWsBS2dpm8C7/JNeEErIb2TkJFCWEmFXuSo2cwNpoP2
 1fmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754429535; x=1755034335;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S8XfqBcuUbvXZzlLXlPsAW+gig/cCq9lWEta9lhp7ac=;
 b=vzH4yBiDe8nCZQnErCC0n3B2z2YDqwMgs8J9/YqWs3vHuA4EAjSS28QDW4SKqFPO7v
 F3Qc1qwXwEMWQmTyCXTxReWT96IJYn8X7qzrvWByy7v4oJzn6JMkLZOid1wBKMLmnu/m
 F0pcPZR7ZYkC62e3beGukj3C8oI9V7SM7jjHOI3tpgfXV5fgemLT1esMK8LEXEYsAIZ3
 Gk2/GB85N5NFKBsMW+UZgFXA9EbPW56M/dDXbqjAEnxma/aeJ15yoUgk6suL1aOs157+
 4kRCkhH4l3zeyiAJrHkD5ksDA8tZLW27nNlCtIWUYfrYOfxkpg2BXI7BbOaOHBN+6GwO
 Bchg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2gOE4WIXCQivOVKt8LtJGSr7YYf40uwc0bqNp0SVNQ8nHNmAw8BD0ZX9TyHIkAky67TfHfqi7vgk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyT8aguvtt3izaTkT7qHMl7mPWb2XDXiQ6cuDe8wNWxwcnDFMqG
 PDix4cZwuUaA+ikvzJY8L9c0qLEphD9GUriZE94lm/onW71kUIWGJdR6vjHiJRIQRFD27yPHRCj
 XTLoHv36kFKGc7hHl76jXTzqsBcTA2s8=
X-Gm-Gg: ASbGncuLUjlnqv+7TDSiWOj4uW5j25qug8e7o8OvtB7mylxOVwBiAO+TPv6mwdUZZ2Z
 MauI/+BRXFkJDtGGeY107XUQR3UpTOx/rCuV41paKas2k7WrrA7i2gU6uaIw3nrgZNGTgaASgt0
 w4UvdtulspDXcDuT5G6K2otT2TRzye3bzHZdh8nzhUf63BPPHffZVv68sLb/sfzwglAGH5b/0aL
 tkcpjo=
X-Google-Smtp-Source: AGHT+IE6VuwB2rMj+eNLHkOFe2PPtB5Evc/htVg7PAq1VwLveklPNKiOwKomITt+xjUHLS9CMHCCKFVpIRDlVZvK68Y=
X-Received: by 2002:a17:90b:1d0f:b0:31f:ea:ca84 with SMTP id
 98e67ed59e1d1-32166c0fc1bmr197960a91.2.1754429534833; Tue, 05 Aug 2025
 14:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250805164431.24350-1-robin.clark@oss.qualcomm.com>
In-Reply-To: <20250805164431.24350-1-robin.clark@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 5 Aug 2025 17:32:02 -0400
X-Gm-Features: Ac12FXwnTTjTLlR6ZiyVs-H5Xibje4MD5VPolzpqvzwQ7PFaf_1DWFcW5Qh9ga4
Message-ID: <CACu1E7FoQ1djuoqmjxJFHMLx1xuqsK4+a63gw34F-K8kca3-MQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Handle in-place remaps
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>, 
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

On Tue, Aug 5, 2025 at 12:44=E2=80=AFPM Rob Clark <robin.clark@oss.qualcomm=
.com> wrote:
>
> Detect and handle the special case of a MAP op simply updating the vma
> flags of an existing vma, and skip the pgtable updates.  This allows
> turnip to set the MSM_VMA_DUMP flag on an existing mapping without
> requiring additional synchronization against commands running on the
> GPU.
>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Tested that this fixes the occasional page faults with the zink a618
jobs on Mesa CI with my Mesa MR.

Tested-by: Connor Abbott <cwabbott0@gmail.com>

> ---
>  drivers/gpu/drm/msm/msm_gem_vma.c | 41 ++++++++++++++++++++++++++++---
>  1 file changed, 37 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_=
gem_vma.c
> index d1f5bb2e0a16..00d0f3b7ba32 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -451,6 +451,8 @@ msm_gem_vm_bo_validate(struct drm_gpuvm_bo *vm_bo, st=
ruct drm_exec *exec)
>  struct op_arg {
>         unsigned flags;
>         struct msm_vm_bind_job *job;
> +       const struct msm_vm_bind_op *op;
> +       bool kept;
>  };
>
>  static void
> @@ -472,14 +474,18 @@ vma_from_op(struct op_arg *arg, struct drm_gpuva_op=
_map *op)
>  }
>
>  static int
> -msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *arg)
> +msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg)
>  {
> -       struct msm_vm_bind_job *job =3D ((struct op_arg *)arg)->job;
> +       struct op_arg *arg =3D _arg;
> +       struct msm_vm_bind_job *job =3D arg->job;
>         struct drm_gem_object *obj =3D op->map.gem.obj;
>         struct drm_gpuva *vma;
>         struct sg_table *sgt;
>         unsigned prot;
>
> +       if (arg->kept)
> +               return 0;
> +
>         vma =3D vma_from_op(arg, &op->map);
>         if (WARN_ON(IS_ERR(vma)))
>                 return PTR_ERR(vma);
> @@ -599,15 +605,41 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, v=
oid *arg)
>  }
>
>  static int
> -msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *arg)
> +msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *_arg)
>  {
> -       struct msm_vm_bind_job *job =3D ((struct op_arg *)arg)->job;
> +       struct op_arg *arg =3D _arg;
> +       struct msm_vm_bind_job *job =3D arg->job;
>         struct drm_gpuva *vma =3D op->unmap.va;
>         struct msm_gem_vma *msm_vma =3D to_msm_vma(vma);
>
>         vm_dbg("%p:%p:%p: %016llx %016llx", vma->vm, vma, vma->gem.obj,
>                vma->va.addr, vma->va.range);
>
> +       /*
> +        * Detect in-place remap.  Turnip does this to change the vma fla=
gs,
> +        * in particular MSM_VMA_DUMP.  In this case we want to avoid act=
ually
> +        * touching the page tables, as that would require synchronizatio=
n
> +        * against SUBMIT jobs running on the GPU.
> +        */
> +       if (op->unmap.keep &&
> +           (arg->op->op =3D=3D MSM_VM_BIND_OP_MAP) &&
> +           (vma->gem.obj =3D=3D arg->op->obj) &&
> +           (vma->gem.offset =3D=3D arg->op->obj_offset) &&
> +           (vma->va.addr =3D=3D arg->op->iova) &&
> +           (vma->va.range =3D=3D arg->op->range)) {
> +               /* We are only expecting a single in-place unmap+map cb p=
air: */
> +               WARN_ON(arg->kept);
> +
> +               /* Leave the existing VMA in place, but signal that to th=
e map cb: */
> +               arg->kept =3D true;
> +
> +               /* Only flags are changing, so update that in-place: */
> +               unsigned orig_flags =3D vma->flags & (DRM_GPUVA_USERBITS =
- 1);
> +               vma->flags =3D orig_flags | arg->flags;
> +
> +               return 0;
> +       }
> +
>         if (!msm_vma->mapped)
>                 goto out_close;
>
> @@ -1268,6 +1300,7 @@ vm_bind_job_prepare(struct msm_vm_bind_job *job)
>                 const struct msm_vm_bind_op *op =3D &job->ops[i];
>                 struct op_arg arg =3D {
>                         .job =3D job,
> +                       .op =3D op,
>                 };
>
>                 switch (op->op) {
> --
> 2.50.1
>
