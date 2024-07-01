Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C208A91E9BF
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 22:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00FA710E06A;
	Mon,  1 Jul 2024 20:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m33N1y3K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42F110E064;
 Mon,  1 Jul 2024 20:41:26 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-57cbc2a2496so837439a12.0; 
 Mon, 01 Jul 2024 13:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719866485; x=1720471285; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xzj8Z3HbuiJuMSPBjE+mSOU8JyhOC/fKZmPOTRp5tZ4=;
 b=m33N1y3KOHWvrR5HfdJ80C4AZ1uBMU+FTc1icRwDTPmJzs6Ry+mOqM6erbUwByTss0
 O/m9PNvbzlz+anWFfiYazHAKt8P7QgtKvc5n4nCrasFf7X/xcmx0AZCODjWfUpHSFd28
 0QjarTUbIzgtXq+z75SbkU5iM+cwS5V8mn/p0Vl11TYIAxVFXoIgTU8xol5ZKvpMlmrN
 OId3mPKdk94OD7Xt7xrh9L/BspRbNJ5EwY+GtzNrcPuXPT9vCCird4aVGmocTbg/9VK1
 J4hFoz5RcUOwFalARdsBG3CPM+xppg0eEg8YtfXh9htjNgBTKSSg9ucq6OS4GADG2fT1
 VWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719866485; x=1720471285;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xzj8Z3HbuiJuMSPBjE+mSOU8JyhOC/fKZmPOTRp5tZ4=;
 b=INaxVTyEVUhjlkjE7awrp6nchIP6TDyhReUsVrQaGXFTBSjLUDovq3d9yDnI1FVMpq
 sGI5E8LMQTfAO7nRqiLbWKNKB6eoxMkWp0w88syeq1PwcAXhxpXSnhrRRsYiTElxmU32
 JIjtkIhuqPM4r2iXExheeVKf0MuOoHuRolCqTU1uAgSl8/t4l6GKXElHlhk5LzLK8zLx
 Onmn8QFMG100/k0eaL+wWsRdelwCCNh1vZ14gcwRpe8JkHMdPn1ECnLDLnFQ4erwoe5Z
 hlgSAnUN5zNdnTJY4/Bq2UycET9cqRL1F/7BHTdJmZkFN59U5vHhH2ToTtJeVjzm9JkX
 A+Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyolTDaXU6/cdcJAtlbRJVxc3lb2JIWnTuemBcYkLF5OUDmsKESKyrBWSLSi/aslW9CV9Z66Gc6RlsNRjOdemnoSd/eI1UaL1D5OPxbU5j
X-Gm-Message-State: AOJu0YyP0UlL8nDYG1KQSDEICn8YIcN/2LZjDZA3flag8nC0VFl3vtjH
 M3mIG3JBgJePJF0uK+xB4hVvwPCqYwomxFpI0B0DhwznSa1s8fZ/z7IEzcmae5Wj2DVkFjrxpmy
 nuEcYNwU3u+r33VIPJcqhmNKNrGE=
X-Google-Smtp-Source: AGHT+IE9uDJq3G5ntysqFKKv18zGU7mP9ARbny08OKRkjg7To2BLgG0cfYT92khriItZCFxEBInnfZHBNEl1caa/d8I=
X-Received: by 2002:a05:6402:11c8:b0:57c:6d1c:3cee with SMTP id
 4fb4d7f45d1cf-5879f3ac6f6mr5350840a12.14.1719866485011; Mon, 01 Jul 2024
 13:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240628214848.4075651-1-quic_abhinavk@quicinc.com>
 <20240628214848.4075651-4-quic_abhinavk@quicinc.com>
In-Reply-To: <20240628214848.4075651-4-quic_abhinavk@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 1 Jul 2024 13:41:13 -0700
Message-ID: <CAF6AEGt2zX5anreTLnMFEiPToGFJdgYZHHpqJfUtaOkdr+Wbbw@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/msm/iommu: introduce msm_iommu_disp_new() for
 msm_kms
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 quic_jesszhan@quicinc.com, swboyd@chromium.org, dianders@chromium.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, Jun 28, 2024 at 2:49=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quicin=
c.com> wrote:
>
> Introduce a new API msm_iommu_disp_new() for display use-cases.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_iommu.c | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_mmu.h   |  1 +
>  2 files changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_io=
mmu.c
> index a79cd18bc4c9..0420bdc4a224 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -343,6 +343,17 @@ static int msm_gpu_fault_handler(struct iommu_domain=
 *domain, struct device *dev
>         return 0;
>  }
>
> +static int msm_disp_fault_handler(struct iommu_domain *domain, struct de=
vice *dev,
> +                                 unsigned long iova, int flags, void *ar=
g)
> +{
> +       struct msm_iommu *iommu =3D arg;
> +
> +       if (iommu->base.handler)
> +               return iommu->base.handler(iommu->base.arg, iova, flags, =
NULL);
> +
> +       return -ENOSYS;
> +}
> +
>  static void msm_iommu_resume_translation(struct msm_mmu *mmu)
>  {
>         struct adreno_smmu_priv *adreno_smmu =3D dev_get_drvdata(mmu->dev=
);
> @@ -434,6 +445,21 @@ struct msm_mmu *msm_iommu_new(struct device *dev, un=
signed long quirks)
>         return &iommu->base;
>  }
>
> +struct msm_mmu *msm_iommu_disp_new(struct device *dev, unsigned long qui=
rks)
> +{
> +       struct msm_iommu *iommu;
> +       struct msm_mmu *mmu;
> +
> +       mmu =3D msm_iommu_new(dev, quirks);
> +       if (IS_ERR_OR_NULL(mmu))
> +               return mmu;
> +
> +       iommu =3D to_msm_iommu(mmu);
> +       iommu_set_fault_handler(iommu->domain, msm_disp_fault_handler, io=
mmu);
> +
> +       return mmu;
> +}

Hmm, are we using dev drvdata for the display pdev?  If
dev_get_drvdata() returns NULL for display pdev, we could get away
without having a different fault handler.

BR,
-R

> +
>  struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gp=
u, unsigned long quirks)
>  {
>         struct adreno_smmu_priv *adreno_smmu =3D dev_get_drvdata(dev);
> diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.=
h
> index 88af4f490881..730458d08d6b 100644
> --- a/drivers/gpu/drm/msm/msm_mmu.h
> +++ b/drivers/gpu/drm/msm/msm_mmu.h
> @@ -42,6 +42,7 @@ static inline void msm_mmu_init(struct msm_mmu *mmu, st=
ruct device *dev,
>
>  struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks);
>  struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gp=
u, unsigned long quirks);
> +struct msm_mmu *msm_iommu_disp_new(struct device *dev, unsigned long qui=
rks);
>
>  static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *=
arg,
>                 int (*handler)(void *arg, unsigned long iova, int flags, =
void *data))
> --
> 2.44.0
>
