Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B94DA88242
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 15:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F09510E5DC;
	Mon, 14 Apr 2025 13:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WtBjhF1c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B975510E5D8;
 Mon, 14 Apr 2025 13:32:25 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id
 a1e0cc1a2514c-871a7ebd638so232235241.3; 
 Mon, 14 Apr 2025 06:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744637545; x=1745242345; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cLbWjqIEu3IvN7/Kn44+Q64WEI5oH2m78Com7pvnOMU=;
 b=WtBjhF1c9Z0vO/Ju4X11wqy1uGzMlsvmHto4KuD8kjcvhsr8gWWSyJ5NnEGFay8V2S
 sai46M2Q/vXxRPRLlqReHKrquT9mSwyKlQUFCeozryNP6pW838Q7Lh/2vS5sv9vKysnK
 ik227JSAWZx8xnCR9IriLkbyq03VRbp4PPD4hCrjgwsFq5Xj4kxVcLoYx2wbSoB95Jwb
 /4D6WxWirkd+2dqIyKDNIPVs3ZuihqwCeumNgyhOqGtg650d3+01/ooKOoBZ2G5+wa8Q
 EGcKBiEXcg8xIBYDwuSBJHEumalj5Nbf1pOGqu8sakdJj5+DgLJs7FDY4OYiM7qBwnD+
 YMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744637545; x=1745242345;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cLbWjqIEu3IvN7/Kn44+Q64WEI5oH2m78Com7pvnOMU=;
 b=QJDNQ3KmHB2d+sWn1NuGriCFnzBItX9ncEDKfwAfpoNiJTZ2cxjNokBn7SI5EqUVpC
 Th4Qb68m7E//Ecq4ARcsMenJVaDskmKrf2ilhq4KzxiHEbrmPoRBWWLr84JV+jbHwDp1
 uPYdkk/SKdVoyocQFqaOjfPtH4XpnBYNYOa4SenjlD2gqjVELGB8u+JZMQ4Vc4QOEJan
 If5Jhc367WI6L1q8kS7fpvqMVwSMLGXYP8ieZsaLouAbIRRdUsSXtDDAqVRUCRD6Pdu3
 F3Nqqd7B7Xs/bLH/lOjP+ejvemTFX+9SpPBc42MKukZGHLh0qsqz4rp9WfWs1zHlVNNJ
 ZyeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3bc56F7nY/FbgXibIiTbgQ4fCcF3IaZRc7K33vGnxj4NinfpYId2fMw02Wfy3PrZcAhkxlewLqOX3@lists.freedesktop.org,
 AJvYcCWhVPiEr9ek6N+KNGdAg5lt3XTYiLINaxumtIZkUvHmZdFf5dss2P+6fbF2rhfX6cBSrQIP3l6/@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWGkLauHEEArQ2jxt6bFCkirShHpBBiYkTmGCoQowDXbcmSVcY
 LiA8xVYZvuHE/OX18LO3fjmRy8NwwPSe0oplcm3l98jN6ggOZr0FD+X+BwzwiNx5gotAYj2UbSo
 gvxfyTovA7KUX1v4sks040qx7UVc=
X-Gm-Gg: ASbGnctcC9AVhSWY5KjDDA930TcgyCNxSjcrrPfiX0kdprzRBkF6r2QGkGseWxOvfm7
 rsPLPtaODkWlM1fNvSl8R/I/TsDR1WXcNBPXtNQiYuRt26kDfeGf8M1Fe/hmvjo722/ttQQngyY
 y1VbgIkOIVZ5wYTUIPIRyRsg==
X-Google-Smtp-Source: AGHT+IF7IOfl7G3RHuUMkW9G3NUZ1c6AeYBhcFA/0srYwHNBMQNbCBke1d4i0DzNdtUmmahoewD0PR3r989Z7nXMJeg=
X-Received: by 2002:a05:6102:1526:b0:4c1:7646:714b with SMTP id
 ada2fe7eead31-4c9e509f68dmr2714727137.8.1744637544260; Mon, 14 Apr 2025
 06:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250414132610.677644-1-sashal@kernel.org>
 <20250414132610.677644-15-sashal@kernel.org>
In-Reply-To: <20250414132610.677644-15-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Apr 2025 09:32:12 -0400
X-Gm-Features: ATxdqUHJqYR9htHgMYIluI0e4GkanXvhCUfhX9nDEKqwCQY5PEKlQtBXD_SK1DY
Message-ID: <CADnq5_MFOtBZ0_UtRbZ2fRGzgdr5+2ZkNwY-Ot_V2qo1wUPaYw@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.14 15/34] drm/amdgpu: allow pinning DMA-bufs
 into VRAM if all importers can do P2P
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, Felix Kuehling <felix.kuehling@amd.com>,
 Pak Nin Lui <pak.lui@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 airlied@gmail.com, 
 simona@ffwll.ch, sumit.semwal@linaro.org, Yunxiang.Li@amd.com, 
 matthew.auld@intel.com, tvrtko.ursulin@igalia.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
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

On Mon, Apr 14, 2025 at 9:26=E2=80=AFAM Sasha Levin <sashal@kernel.org> wro=
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
> index 9f627caedc3f6..ee47f239c8c12 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -75,11 +75,25 @@ static int amdgpu_dma_buf_attach(struct dma_buf *dmab=
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
> @@ -134,9 +148,6 @@ static struct sg_table *amdgpu_dma_buf_map(struct dma=
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
