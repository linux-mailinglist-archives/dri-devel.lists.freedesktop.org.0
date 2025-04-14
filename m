Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A8FA8822A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 15:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1B4C10E5D4;
	Mon, 14 Apr 2025 13:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kpAWitE+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C18A10E5D4;
 Mon, 14 Apr 2025 13:31:15 +0000 (UTC)
Received: by mail-vk1-f174.google.com with SMTP id
 71dfb90a1353d-523f58d7322so248738e0c.1; 
 Mon, 14 Apr 2025 06:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744637474; x=1745242274; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VYko5P0Uj9dxBvgZY4N+74k0M8yvQGkjvUrVryWcOYM=;
 b=kpAWitE+NJLo/i/xcqx2R+U4Zytb3hcGyjVPj9SrPuw6KFj6decebHwemOB8YQQ8ou
 WYxH4y2l/+MJtystHmECk/6adIpRgYHmFiVZ76cbZUkcaPMUSl/gQXUMgCFG+Rz4DVHe
 WeNaSsaPBqBDXV82SuAe6stj4VXxqBDEUiyN43NQ3U5oRAVDjVyAR0N1/TMb6fjy74uv
 4QGEthcjofytOgI89D52n87GrX2KMkq5S5DlQMfWLErxE2svLrh5qh8BBk8HFUSpaX7/
 ryHCqf9FQ+EjnXWBlAqxpjqH/YsG4dIE+6HUwMvwOs88CgeZWA8kvF2g/74W4v90ApJc
 q3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744637474; x=1745242274;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VYko5P0Uj9dxBvgZY4N+74k0M8yvQGkjvUrVryWcOYM=;
 b=u8uuA5iHcHjscJ1DNZpktK646K4Wt/idYPOnCKs7vPR77yWDWtoSnN8mzGKQc4j0YJ
 B4QTrAn5qY+z/CprJcuum/+1M6q/sH1etAHJwBycTAU8QpTG5z2ZiO5CWWDSRk5gKU4f
 xQgjPd6fMrKQZhTFDLfszggzKfaYDTgeJWxlJQoIHpV55Ze/wHxuq3UHn/LvXsNA82e2
 g79IIlHFepMpADQ/23wkaJ/YUJ1Xgai72v3vhogHR9wV187ZYK1iscYUBVbfOt63UbzY
 x4d1XS+maH2VaRX8TOFrDmTPKlDxvZLll9LKmECWRE4J3OR0Jv5zmeF1Hd67tscN5tg0
 8XTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhuHw7W17WOgzLfMlBD1Dc0Wu9hh1D1MnRIm2YAquOHNcBdAlFk5D+Ca96/Xxpfuxe6s25e8cv@lists.freedesktop.org,
 AJvYcCWw8xK0aFOSSS8N3QEREkDjy94agvuaxEP790fzFadPdTfUPiWRNnbECfmG6rRI4x7xLYn4gYZjoqqR@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTkf6xhsvoof/c6KgXsinmlfOMgRLWJQDXkjafXiBxU+OfN/Hg
 pjr9LZxX3drhjXA5S8/YPD7aTCBQQK09h07QrF6e9QLnD4xvxp4BhiiIGPKdrER8c0sYAacXZGz
 irvEx2vMqAwUGoAta672Cf+ddibo=
X-Gm-Gg: ASbGnctIGkMJ/+teDd33AOvHbWXl3nydaIAzv+E21IXdj002xaL6ysJbDpST1xSs5Qn
 5VihbxEgWZHtp4TYyeM4qcXOHO3wkCFbOvuOn7nUXMHLBRkYLKsGVGo1qPlJZb34qG5/Rhz2sJH
 WZQll6yJMkMWGuLmal/ICQlA==
X-Google-Smtp-Source: AGHT+IHU9FwQkANqVWq6HB4deVY97gLIMf5+FLJTdy75WKChAzk9OeMBEaB4Pi9kHLb3C3nJNsVYA0qgr7byQiE5wXc=
X-Received: by 2002:a05:6122:da1:b0:516:20fe:d5d8 with SMTP id
 71dfb90a1353d-527c359ccf4mr1741010e0c.2.1744637474078; Mon, 14 Apr 2025
 06:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250414132848.679855-1-sashal@kernel.org>
 <20250414132848.679855-11-sashal@kernel.org>
In-Reply-To: <20250414132848.679855-11-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Apr 2025 09:31:01 -0400
X-Gm-Features: ATxdqUHGTxjstZXt6MENE-PXqnTQyUOB_COxTyDCeu_fpv9Pwmta6iiK5pHbslw
Message-ID: <CADnq5_PqqY07uBERuSGC--+=dsffxydrPrvzt7pw6SfmmqbDjw@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.12 11/30] drm/amdgpu: allow pinning DMA-bufs
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

On Mon, Apr 14, 2025 at 9:29=E2=80=AFAM Sasha Levin <sashal@kernel.org> wro=
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

This should not go to stable.  It depends on dmem groups.


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
