Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D93AA4C0F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 14:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358A610E7AA;
	Wed, 30 Apr 2025 12:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K/k7ltOI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9C310E7A8;
 Wed, 30 Apr 2025 12:57:44 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-225887c7265so13511845ad.0; 
 Wed, 30 Apr 2025 05:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746017863; x=1746622663; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rm05lpTkOVOHXu8eGRdE6kXYVUr0GQNtiOAVsh1nNCg=;
 b=K/k7ltOIII7GN79ydq7MWK8BJ6m6KCcSWRawyhsglYhax7Mcmfcbx8CnpuX8qZ3/BI
 7GZtrJK1UXymhibb0iH6c63SSFZAskvUB7I7mQb2d8IGFNU5gwSlaqUJ/J8+HgLWMhHt
 2MgIELmEi41QdKISam/tZMEeWka7x3F9n8DysdefESev+b+WvZBmavkaINo5EJ+xE2ec
 PBvuaHscoh8rXlIfkl3bWHJcECOMQkPRgQ7qTDnksaZb89yuV6pann30Ut75KGNPjc5D
 WSBf7bxyzR+VYAkC08WS9jfJgSB9fVbm7UCxD2nAF6Fcia9M58V42AgkW2uLhX4t+CC5
 LXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746017863; x=1746622663;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rm05lpTkOVOHXu8eGRdE6kXYVUr0GQNtiOAVsh1nNCg=;
 b=Sz4yQ2ihD87+sc7MMW7FKNNqDDiw/DqBbyVryAlyOag6MXTKUtxNNfewXgH4rxqqG/
 js+KGJbmmGHA4537HDHtr7l445sb8m4SZGPTvMn7/nHgpfg3nDLcL2Ts/CTFlwH4dJtu
 4ppNh4k+eJzc9PWGs+tnFxVOSW+aU1U52RL/QOGIYUtTzlIpBvfA8kBPFosi5kBxiRaS
 jJKiDyU1x1mGN1wJDykXaCrxO/vKcZfinQR3nQikuG6CF4nVWnCT0G8XVMKyXicIzGfs
 Np30mQtQL/NwWxWayo5QAyHQ8ytPlu674aMray6hyNw49KV4++9ksHhc4LO7ztRMXmdj
 O4hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3zThvdaQ7C8EUp3m/ztiqAdamEg97nzBw5F/mFATJk+ohI83eCV2DLxSJqtagHJI0blztwDlf6Dfx@lists.freedesktop.org,
 AJvYcCV5PiG4DVs8eSQkZJC3VtXJCBO+4zcNnHI8DYK45RzRhyrcS+kXivkQbcYxYhjWwoMXwpeu1vxk@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdPkl/WljAwq8HRdOg6CmEblResNLnGDYEJaQ4F6uvufsSiVNH
 t/tu3iWNgHVMvXvVt4/N6U6lMv0o/2AL9tcyEjZmAQgW/rm4qQ7Gzes3IAN2kr3pRm+pofNAza6
 dmib1trxrNvsumEMz162Sk2BUav0=
X-Gm-Gg: ASbGncuFBZza9EWlZFpKsjfVzJqoq5eFOOcNrBBIWEthkcrFfBMZUp9l3/hJtM1CFkE
 ACm2iKTtDYGUOfOVTgM6qdv/4UsuIq0BpxW26y5dBAYVZWc7fzQA8qTlhkPmigFspQFKyRtB1Y4
 fHEUgSu4YzP3BUINO6ESJvw8+ZUXxfWCfy
X-Google-Smtp-Source: AGHT+IHsahqat7sRDVZbpn87HSfKCGqp+eBYCISXvsmpIZH8IyO4vathjjFMmGbSmuz1hqRFo78WfmBbT1d//7/DQAM=
X-Received: by 2002:a17:90b:1c07:b0:2ee:f59a:94d3 with SMTP id
 98e67ed59e1d1-30a3b959b2cmr271359a91.0.1746017863425; Wed, 30 Apr 2025
 05:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250429235316.538129-1-sashal@kernel.org>
 <20250429235316.538129-7-sashal@kernel.org>
In-Reply-To: <20250429235316.538129-7-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 30 Apr 2025 08:57:30 -0400
X-Gm-Features: ATxdqUGOAb33lS8ofFWUIrrEQktvjwc5jTIu1Jk9cnpJOqAND3CyqoIWsvrv9zE
Message-ID: <CADnq5_NacNmcKKQUdrbTtEGAn8UCvvJHki+JMUPMRA2AB6T8VA@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.1 07/10] drm/amdgpu: Allow P2P access through
 XGMI
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Felix Kuehling <felix.kuehling@amd.com>, Hao Zhou <hao.zhou@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, airlied@gmail.com, simona@ffwll.ch, 
 Yunxiang.Li@amd.com, matthew.auld@intel.com, tvrtko.ursulin@igalia.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

On Tue, Apr 29, 2025 at 8:03=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> From: Felix Kuehling <felix.kuehling@amd.com>
>
> [ Upstream commit a92741e72f91b904c1d8c3d409ed8dbe9c1f2b26 ]
>
> If peer memory is accessible through XGMI, allow leaving it in VRAM
> rather than forcing its migration to GTT on DMABuf attachment.
>
> Signed-off-by: Felix Kuehling <felix.kuehling@amd.com>
> Tested-by: Hao (Claire) Zhou <hao.zhou@amd.com>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> (cherry picked from commit 372c8d72c3680fdea3fbb2d6b089f76b4a6d596a)
> Signed-off-by: Sasha Levin <sashal@kernel.org>

This patch is only applicable to 6.15 and newer.  Please drop for stable.

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 30 ++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_dma_buf.c
> index ab06cb4d7b358..4dcc7de961d08 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -42,6 +42,29 @@
>  #include <linux/pci-p2pdma.h>
>  #include <linux/pm_runtime.h>
>
> +static const struct dma_buf_attach_ops amdgpu_dma_buf_attach_ops;
> +
> +/**
> + * dma_buf_attach_adev - Helper to get adev of an attachment
> + *
> + * @attach: attachment
> + *
> + * Returns:
> + * A struct amdgpu_device * if the attaching device is an amdgpu device =
or
> + * partition, NULL otherwise.
> + */
> +static struct amdgpu_device *dma_buf_attach_adev(struct dma_buf_attachme=
nt *attach)
> +{
> +       if (attach->importer_ops =3D=3D &amdgpu_dma_buf_attach_ops) {
> +               struct drm_gem_object *obj =3D attach->importer_priv;
> +               struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
> +
> +               return amdgpu_ttm_adev(bo->tbo.bdev);
> +       }
> +
> +       return NULL;
> +}
> +
>  /**
>   * amdgpu_dma_buf_attach - &dma_buf_ops.attach implementation
>   *
> @@ -53,12 +76,14 @@
>  static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
>                                  struct dma_buf_attachment *attach)
>  {
> +       struct amdgpu_device *attach_adev =3D dma_buf_attach_adev(attach)=
;
>         struct drm_gem_object *obj =3D dmabuf->priv;
>         struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
>         struct amdgpu_device *adev =3D amdgpu_ttm_adev(bo->tbo.bdev);
>         int r;
>
> -       if (pci_p2pdma_distance(adev->pdev, attach->dev, false) < 0)
> +       if (!amdgpu_dmabuf_is_xgmi_accessible(attach_adev, bo) &&
> +           pci_p2pdma_distance(adev->pdev, attach->dev, false) < 0)
>                 attach->peer2peer =3D false;
>
>         r =3D pm_runtime_get_sync(adev_to_drm(adev)->dev);
> @@ -479,6 +504,9 @@ bool amdgpu_dmabuf_is_xgmi_accessible(struct amdgpu_d=
evice *adev,
>         struct drm_gem_object *obj =3D &bo->tbo.base;
>         struct drm_gem_object *gobj;
>
> +       if (!adev)
> +               return false;
> +
>         if (obj->import_attach) {
>                 struct dma_buf *dma_buf =3D obj->import_attach->dmabuf;
>
> --
> 2.39.5
>
