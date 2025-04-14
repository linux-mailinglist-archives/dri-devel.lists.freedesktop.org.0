Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97503A882F4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 15:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501F510E143;
	Mon, 14 Apr 2025 13:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X7krrkpd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724AB10E105;
 Mon, 14 Apr 2025 13:48:23 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id
 71dfb90a1353d-523db7bc7bfso266397e0c.0; 
 Mon, 14 Apr 2025 06:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744638503; x=1745243303; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9gg6c9JaP3fAvNMBtbYiSQTaF78FsgYOrIyM/tQBJqE=;
 b=X7krrkpdk+s+ZpRv28Z/HBZdvB/IjwjYl5Ags0vg1hXgPak/cyesrUPDI+JYQ+Jxav
 ioYNJJ+C6/jiHMjqFrOVh0sMacxS/XYdDHE29KATAFeURiIzWQ3Qv2vI9U9fTNxquAEo
 LgwJBm5I8iRSeBtQ3AOk+TmNJxNzs4mwqfs7RysAnb1uXzTuY1hH7FB/RV8m4Qk2mVm4
 XqcU2xWymFNGVZH4P54QyoqhbW2bHxnA1FVfktvduVvbBapCSKy5Ci6RbubcEaKewdbk
 +me8e5C295YxzyEcKBIgUU/cctRjpCm77xQJnYKTPWOMWOdtgoLanKA1l/Abf11WoVJz
 6c/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744638503; x=1745243303;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9gg6c9JaP3fAvNMBtbYiSQTaF78FsgYOrIyM/tQBJqE=;
 b=AVbvMknbPK/ZtM+2c8m/q837hcIjc7XavY7ZdfFAIumrWkirx5/L+RCWiDUej4ptLu
 ZVSlszkM7xEK84Mf/knR89AwkEcrcZQtT+lPQgYy1P6WuXASfOINjPwTirLLu9BFZ0Nx
 ZqAjvf93Vpec3dObl3HD4jnVcX01u+fdjV/9Gnh1ufo/MbffNqLvQYwSes916q+WBioL
 WoX1f80ca7zQmIldOLHyswFPI5FaoqeoJamBoPRjD6ac6GGOFfQgMMyULWK863tN8h4Y
 V596/2BQywQKsrp2gdRjdaqbGHLKTyJZvcxuC4CGePaf5fzDVkqH8Kr8OsavE/EP7cG+
 p/vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYzMSTPFPaE+7GzBi2onRg7zvFuSYPSYztmwMS4VaHZofpfXYcVkRAwvMfLcpFnbNYIY3iLgX+@lists.freedesktop.org,
 AJvYcCX+HdmBqhOj2C1OhRKoQgm8pgfpCpjUr/37rK3SvaKqy5XU+JKzyHIhqEaNomsyyrt8MpoNMW4Sd4Fx@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFykIB40zQ5ta9QT808qo84LPSAq1UF+gmTML+Hhx/QPz3WvWG
 xC7uGdy8Woikmjoo4JSneAiuNR4D0nPEFVrkfmRF85jGprmEbuSksHMC8K4+DgOiDg+9R59wOF7
 wDB0asiemjrv2IH3NbcR+OAQKfcQ=
X-Gm-Gg: ASbGnctoCrSCU3WeKJZJoBQYaui/mP/R913RvDOwzHUKzP8Zk3BKKmFpouANHXsu9RI
 xNtlLHf08pMOPZFWL8AMTTn6JYQNiNLjMDd+tzhaJN0zYazHgNpTvjbK2ASVN09E2GZJlcg7vij
 EsUnuTWsjldhGVMz3nl8P8lQ==
X-Google-Smtp-Source: AGHT+IFZNxc/KHoZDwFGFG6I1MTEwTJWg8WdgpWDyKSrkajFA9wV/Z9DP3VoJO9ODfnboEI+ZztudNXfilRisu5rbL8=
X-Received: by 2002:a05:6122:daa:b0:520:5400:ac0f with SMTP id
 71dfb90a1353d-527c35b6a41mr2823390e0c.3.1744638502640; Mon, 14 Apr 2025
 06:48:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250414132729.679254-1-sashal@kernel.org>
 <20250414132729.679254-15-sashal@kernel.org>
In-Reply-To: <20250414132729.679254-15-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Apr 2025 09:48:10 -0400
X-Gm-Features: ATxdqUGsIVkJwostdQs5byeooJDamJZ9S8mgOlW4xpayrB_LVHSmjP3XNtx4Yaw
Message-ID: <CADnq5_OyrpJL3fnbyiueyddkNZ2B-uRO9pyrRVqBTeY5AnepYw@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH AUTOSEL 6.13 15/34] drm/amdgpu: allow
 pinning DMA-bufs into VRAM if all importers can do P2P
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, Felix Kuehling <felix.kuehling@amd.com>,
 Pak Nin Lui <pak.lui@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 simona@ffwll.ch, 
 sumit.semwal@linaro.org, Yunxiang.Li@amd.com, tvrtko.ursulin@igalia.com, 
 matthew.auld@intel.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
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

On Mon, Apr 14, 2025 at 9:28=E2=80=AFAM Sasha Levin <sashal@kernel.org> wro=
te:
>
> From: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> [ Upstream commit f5e7fabd1f5c65b2e077efcdb118cfa67eae7311 ]
>
> Try pinning into VRAM to allow P2P with RDMA NICs without ODP
> support if all attachments can do P2P. If any attachment can't do
> P2P just pin into GTT instead.
>
> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Felix Kuehling <felix.kuehling@amd.com>
> Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
> Tested-by: Pak Nin Lui <pak.lui@amd.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

This should not go to stable.  It depends on dmem cgroups.

Alex


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 25 +++++++++++++++------
>  1 file changed, 18 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_dma_buf.c
> index 8e81a83d37d84..83390143c2e9f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -72,11 +72,25 @@ static int amdgpu_dma_buf_attach(struct dma_buf *dmab=
uf,
>   */
>  static int amdgpu_dma_buf_pin(struct dma_buf_attachment *attach)
>  {
> -       struct drm_gem_object *obj =3D attach->dmabuf->priv;
> -       struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
> +       struct dma_buf *dmabuf =3D attach->dmabuf;
> +       struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(dmabuf->priv);
> +       u32 domains =3D bo->preferred_domains;
>
> -       /* pin buffer into GTT */
> -       return amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT);
> +       dma_resv_assert_held(dmabuf->resv);
> +
> +       /*
> +        * Try pinning into VRAM to allow P2P with RDMA NICs without ODP
> +        * support if all attachments can do P2P. If any attachment can't=
 do
> +        * P2P just pin into GTT instead.
> +        */
> +       list_for_each_entry(attach, &dmabuf->attachments, node)
> +               if (!attach->peer2peer)
> +                       domains &=3D ~AMDGPU_GEM_DOMAIN_VRAM;
> +
> +       if (domains & AMDGPU_GEM_DOMAIN_VRAM)
> +               bo->flags |=3D AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
> +
> +       return amdgpu_bo_pin(bo, domains);
>  }
>
>  /**
> @@ -131,9 +145,6 @@ static struct sg_table *amdgpu_dma_buf_map(struct dma=
_buf_attachment *attach,
>                 r =3D ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
>                 if (r)
>                         return ERR_PTR(r);
> -
> -       } else if (bo->tbo.resource->mem_type !=3D TTM_PL_TT) {
> -               return ERR_PTR(-EBUSY);
>         }
>
>         switch (bo->tbo.resource->mem_type) {
> --
> 2.39.5
>
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org
