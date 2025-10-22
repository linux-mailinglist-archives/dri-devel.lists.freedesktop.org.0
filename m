Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF46BF9E26
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 05:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F3010E69A;
	Wed, 22 Oct 2025 03:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Mm2W7RmK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f226.google.com (mail-vk1-f226.google.com
 [209.85.221.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB25A10E0F6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 03:57:10 +0000 (UTC)
Received: by mail-vk1-f226.google.com with SMTP id
 71dfb90a1353d-5569a25c697so218723e0c.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 20:57:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761105430; x=1761710230;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=MA3x2u9ce59oqQMpFWMdS4opd17jnAK4VpK9+KIUygU=;
 b=Uv95Ll6ACHo+fdkIk0FMDQONcZVjTyFYeoe73igAXrNQk62IqK/AGrOwX70E4TgveS
 S6wvDN/xJKoioM8sMucUBXc+1B5igVmeNwuq8518SE2JTmJRWGDnGNTdCEGQn9wsY4MK
 npEkkE2PyqPdx+/zGGABUh4UIATC02+Nq+sp5wfHkEtThvvKdUTYN2G2NYVk/VuLcnCJ
 raQaAB59stUJ4On1InoFnqe7jpVkjMJIjGo+dUKNXCiZxJh1oSk2q6hbnA5SAfKL4pQA
 4FGVmyCHlbKYWCdhfFFDf1xsVrhpkMTQITK2a3ozHap22MmSUCuofj4UzSRZEN38tYF8
 6PcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5uQNw3ZRfBeY21Yz0vh9keE1r2Q8I4nO4xCm8kKJredB6uS31Qj3nNxnWatdhlirjawl0dlxva7I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxj3sZPRpMLlovitLJKYwTlGoiJKXsZ7bzDWSPW9rrcAx7GSWlB
 w1aJntJtoVoYGeOiM5c57V/pYo30A00WQUI1JmBPCEPqb1nXqp5QT0oMqxEwduFq2UStHBOrNOl
 ki+uOL+WnRVIa7rNHpeTi15f9fRCQkoTjjSSOGBTzZZtvb7Ju2BgS3bjd9Pfst5DXiXNfOc5Cs4
 JNGPHQTrEPobjx6JqCMkh1mZ7Gkh/Al2jqQ6e0g7UcnINf+uayopVNSkM88SHZrD1QNL6O3/AoP
 fGENF+oVBNhG7U99n5H
X-Gm-Gg: ASbGncsSKQUJYgXlNSEZVSA34JXq4ti96rBFIGIIp9YZ82bVfNqTZ6GK0xyQHrJUh4I
 ZLLTryLB7WH1xzHIaQdVKcKppp2kRmkM4LiZXXbmgoTpYTBnHD2iITz7/b+tADfzqivZqqEhDwk
 CcyLPdy80cd5NWwsSXm+GzRjqwaopTnP5Ma73Lbp9z6BfiFAQJbw+94IYeQK6g6Sv9MNTggU3+x
 Tw5x56JHHr1agCvyqIT7ThNoWKJSrJkEn+BbNbTPuhvcxbBI6z8Pktce3QLyTuI2ElNJJA6A/I4
 9ZN2sH7wTtEvz4N/uJtQ8YblqFOkD6KjNWziDPdTdfni5TkptTPwbkzF0zVXrHlnPLGHzuyucai
 RX7HbTW/ncHxZD5xkTPQu/sRpCyHnQB8rET+6UBT6TI5FR6EmespWX8BielzqaUJNjO2gwlU/2Y
 bu5bl4TA/44HHjxLA8AJKN5nP+TnAbeTs=
X-Google-Smtp-Source: AGHT+IF3XSyihYHa7i6sSBONvJszmnSVNenQnALKB72kihkRUJ787PHzzruOYcVXluhspEvnV808PpBc/ub5
X-Received: by 2002:a05:6122:459a:b0:54a:a048:45ae with SMTP id
 71dfb90a1353d-5564edeeb7dmr5512915e0c.1.1761105429587; 
 Tue, 21 Oct 2025 20:57:09 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
 by smtp-relay.gmail.com with ESMTPS id
 71dfb90a1353d-5566203ec14sm1653810e0c.4.2025.10.21.20.57.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Oct 2025 20:57:09 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-378ccb2cd05so536751fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 20:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1761105427; x=1761710227;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MA3x2u9ce59oqQMpFWMdS4opd17jnAK4VpK9+KIUygU=;
 b=Mm2W7RmK1vSdGrPevq6734g0pFYXYAV253kIUhlTco+1mjsUcV1E4VX03qrIqZM2BI
 XttcqCfzO7IEPXCVBHTZCcc9wePoxZ0RnBW8E8sEGZ17LfQFQDXeYk7HGR5IYqyGcCv0
 dTwu/p0vqMd7H9uzhOaiP31+J3N6mxwHf3+84=
X-Forwarded-Encrypted: i=1;
 AJvYcCWp6g3UA3g2g3+unAGmo9BZja8ItI0uGEv0mi0N78+pMREKG/vrTKvYggBTZVRXB4AHT9ZdnEEe3D8=@lists.freedesktop.org
X-Received: by 2002:a2e:ab10:0:b0:36d:1f0e:1bda with SMTP id
 38308e7fff4ca-377979f9be2mr51121671fa.31.1761105426558; 
 Tue, 21 Oct 2025 20:57:06 -0700 (PDT)
X-Received: by 2002:a2e:ab10:0:b0:36d:1f0e:1bda with SMTP id
 38308e7fff4ca-377979f9be2mr51121511fa.31.1761105426037; Tue, 21 Oct 2025
 20:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20251020115411.36818-1-tvrtko.ursulin@igalia.com>
 <20251020115411.36818-4-tvrtko.ursulin@igalia.com>
In-Reply-To: <20251020115411.36818-4-tvrtko.ursulin@igalia.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 21 Oct 2025 23:56:53 -0400
X-Gm-Features: AS18NWBWewAXEPtnZZc6I6-TgT5oSPk-s0xdHz8WMihtnRv2PkELOKT5qdzRPc4
Message-ID: <CABQX2QN-=j4okM=gWvgOrP6psvGj-F-_NWqFP8OKtcoDn5EnvA@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] drm/ttm: Replace multiple booleans with flags in
 device init
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, Lyude Paul <lyude@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sui Jingfeng <suijingfeng@loongson.cn>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="0000000000006789070641b74fdb"
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

--0000000000006789070641b74fdb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 7:54=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@igalia.com> wrote:
>
> Multiple consecutive boolean function arguments are usually not very
> readable.
>
> Replace the ones in ttm_device_init() with flags with the additional
> benefit of soon being able to pass in more data with just a one off
> code base churning cost.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Sui Jingfeng <suijingfeng@loongson.cn>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> v2:
>  * Rebase for rename and move of flags to alloc_flags / TTM_ALLOCATION_.
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  6 +++--
>  drivers/gpu/drm/drm_gem_vram_helper.c         |  2 +-
>  drivers/gpu/drm/i915/intel_region_ttm.c       |  2 +-
>  drivers/gpu/drm/loongson/lsdc_ttm.c           |  3 ++-
>  drivers/gpu/drm/nouveau/nouveau_ttm.c         |  6 +++--
>  drivers/gpu/drm/qxl/qxl_ttm.c                 |  2 +-
>  drivers/gpu/drm/radeon/radeon_ttm.c           |  6 +++--
>  drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 16 +++++++-------
>  .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |  2 +-
>  drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 12 +++++-----
>  drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 22 ++++++++-----------
>  drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  7 ++----
>  drivers/gpu/drm/ttm/ttm_device.c              |  9 +++-----
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  4 ++--
>  drivers/gpu/drm/xe/xe_device.c                |  2 +-
>  include/drm/ttm/ttm_device.h                  |  3 ++-
>  16 files changed, 50 insertions(+), 54 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index 8f6d331e1ea2..7b144ddea268 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1930,8 +1930,10 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>         r =3D ttm_device_init(&adev->mman.bdev, &amdgpu_bo_driver, adev->=
dev,
>                                adev_to_drm(adev)->anon_inode->i_mapping,
>                                adev_to_drm(adev)->vma_offset_manager,
> -                              adev->need_swiotlb,
> -                              dma_addressing_limited(adev->dev));
> +                              (adev->need_swiotlb ?
> +                               TTM_ALLOCATION_POOL_USE_DMA_ALLOC : 0) |
> +                              (dma_addressing_limited(adev->dev) ?
> +                               TTM_ALLOCATION_POOL_USE_DMA32 : 0));
>         if (r) {
>                 dev_err(adev->dev,
>                         "failed initializing buffer object driver(%d).\n"=
, r);
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_=
gem_vram_helper.c
> index 0bec6f66682b..dd3292e57d64 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -859,7 +859,7 @@ static int drm_vram_mm_init(struct drm_vram_mm *vmm, =
struct drm_device *dev,
>         ret =3D ttm_device_init(&vmm->bdev, &bo_driver, dev->dev,
>                                  dev->anon_inode->i_mapping,
>                                  dev->vma_offset_manager,
> -                                false, true);
> +                                TTM_ALLOCATION_POOL_USE_DMA32);
>         if (ret)
>                 return ret;
>
> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i9=
15/intel_region_ttm.c
> index 04525d92bec5..47a69aad5c3f 100644
> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
> @@ -34,7 +34,7 @@ int intel_region_ttm_device_init(struct drm_i915_privat=
e *dev_priv)
>
>         return ttm_device_init(&dev_priv->bdev, i915_ttm_driver(),
>                                drm->dev, drm->anon_inode->i_mapping,
> -                              drm->vma_offset_manager, false, false);
> +                              drm->vma_offset_manager, 0);
>  }
>
>  /**
> diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongs=
on/lsdc_ttm.c
> index 2e42c6970c9f..dca0d33e2cf2 100644
> --- a/drivers/gpu/drm/loongson/lsdc_ttm.c
> +++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
> @@ -544,7 +544,8 @@ int lsdc_ttm_init(struct lsdc_device *ldev)
>
>         ret =3D ttm_device_init(&ldev->bdev, &lsdc_bo_driver, ddev->dev,
>                               ddev->anon_inode->i_mapping,
> -                             ddev->vma_offset_manager, false, true);
> +                             ddev->vma_offset_manager,
> +                             TTM_ALLOCATION_POOL_USE_DMA32);
>         if (ret)
>                 return ret;
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouv=
eau/nouveau_ttm.c
> index 7d2436e5d50d..47b20cf80388 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -302,8 +302,10 @@ nouveau_ttm_init(struct nouveau_drm *drm)
>         ret =3D ttm_device_init(&drm->ttm.bdev, &nouveau_bo_driver, drm->=
dev->dev,
>                                   dev->anon_inode->i_mapping,
>                                   dev->vma_offset_manager,
> -                                 drm_need_swiotlb(drm->client.mmu.dmabit=
s),
> -                                 drm->client.mmu.dmabits <=3D 32);
> +                                 (drm_need_swiotlb(drm->client.mmu.dmabi=
ts) ?
> +                                  TTM_ALLOCATION_POOL_USE_DMA_ALLOC : 0 =
) |
> +                                 (drm->client.mmu.dmabits <=3D 32 ?
> +                                  TTM_ALLOCATION_POOL_USE_DMA32 : 0));
>         if (ret) {
>                 NV_ERROR(drm, "error initialising bo driver, %d\n", ret);
>                 return ret;
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.=
c
> index 765a144cea14..85d9df48affa 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -196,7 +196,7 @@ int qxl_ttm_init(struct qxl_device *qdev)
>         r =3D ttm_device_init(&qdev->mman.bdev, &qxl_bo_driver, NULL,
>                             qdev->ddev.anon_inode->i_mapping,
>                             qdev->ddev.vma_offset_manager,
> -                           false, false);
> +                           0);
>         if (r) {
>                 DRM_ERROR("failed initializing buffer object driver(%d).\=
n", r);
>                 return r;
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon=
/radeon_ttm.c
> index 616d25c8c2de..51dffe23c0fc 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -683,8 +683,10 @@ int radeon_ttm_init(struct radeon_device *rdev)
>         r =3D ttm_device_init(&rdev->mman.bdev, &radeon_bo_driver, rdev->=
dev,
>                                rdev_to_drm(rdev)->anon_inode->i_mapping,
>                                rdev_to_drm(rdev)->vma_offset_manager,
> -                              rdev->need_swiotlb,
> -                              dma_addressing_limited(&rdev->pdev->dev));
> +                              (rdev->need_swiotlb ?
> +                               TTM_ALLOCATION_POOL_USE_DMA_ALLOC : 0 ) |
> +                              (dma_addressing_limited(&rdev->pdev->dev) =
?
> +                               TTM_ALLOCATION_POOL_USE_DMA32 : 0));
>         if (r) {
>                 DRM_ERROR("failed initializing buffer object driver(%d).\=
n", r);
>                 return r;
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/tt=
m/tests/ttm_bo_test.c
> index 5426b435f702..d468f8322072 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> @@ -251,7 +251,7 @@ static void ttm_bo_unreserve_basic(struct kunit *test=
)
>         ttm_dev =3D kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>         KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>
> -       err =3D ttm_device_kunit_init(priv, ttm_dev, false, false);
> +       err =3D ttm_device_kunit_init(priv, ttm_dev, 0);
>         KUNIT_ASSERT_EQ(test, err, 0);
>         priv->ttm_dev =3D ttm_dev;
>
> @@ -290,7 +290,7 @@ static void ttm_bo_unreserve_pinned(struct kunit *tes=
t)
>         ttm_dev =3D kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>         KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>
> -       err =3D ttm_device_kunit_init(priv, ttm_dev, false, false);
> +       err =3D ttm_device_kunit_init(priv, ttm_dev, 0);
>         KUNIT_ASSERT_EQ(test, err, 0);
>         priv->ttm_dev =3D ttm_dev;
>
> @@ -342,7 +342,7 @@ static void ttm_bo_unreserve_bulk(struct kunit *test)
>         resv =3D kunit_kzalloc(test, sizeof(*resv), GFP_KERNEL);
>         KUNIT_ASSERT_NOT_NULL(test, resv);
>
> -       err =3D ttm_device_kunit_init(priv, ttm_dev, false, false);
> +       err =3D ttm_device_kunit_init(priv, ttm_dev, 0);
>         KUNIT_ASSERT_EQ(test, err, 0);
>         priv->ttm_dev =3D ttm_dev;
>
> @@ -394,7 +394,7 @@ static void ttm_bo_fini_basic(struct kunit *test)
>         ttm_dev =3D kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>         KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>
> -       err =3D ttm_device_kunit_init(priv, ttm_dev, false, false);
> +       err =3D ttm_device_kunit_init(priv, ttm_dev, 0);
>         KUNIT_ASSERT_EQ(test, err, 0);
>         priv->ttm_dev =3D ttm_dev;
>
> @@ -437,7 +437,7 @@ static void ttm_bo_fini_shared_resv(struct kunit *tes=
t)
>         ttm_dev =3D kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>         KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>
> -       err =3D ttm_device_kunit_init(priv, ttm_dev, false, false);
> +       err =3D ttm_device_kunit_init(priv, ttm_dev, 0);
>         KUNIT_ASSERT_EQ(test, err, 0);
>         priv->ttm_dev =3D ttm_dev;
>
> @@ -477,7 +477,7 @@ static void ttm_bo_pin_basic(struct kunit *test)
>         ttm_dev =3D kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>         KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>
> -       err =3D ttm_device_kunit_init(priv, ttm_dev, false, false);
> +       err =3D ttm_device_kunit_init(priv, ttm_dev, 0);
>         KUNIT_ASSERT_EQ(test, err, 0);
>         priv->ttm_dev =3D ttm_dev;
>
> @@ -512,7 +512,7 @@ static void ttm_bo_pin_unpin_resource(struct kunit *t=
est)
>         ttm_dev =3D kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>         KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>
> -       err =3D ttm_device_kunit_init(priv, ttm_dev, false, false);
> +       err =3D ttm_device_kunit_init(priv, ttm_dev, 0);
>         KUNIT_ASSERT_EQ(test, err, 0);
>         priv->ttm_dev =3D ttm_dev;
>
> @@ -563,7 +563,7 @@ static void ttm_bo_multiple_pin_one_unpin(struct kuni=
t *test)
>         ttm_dev =3D kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>         KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>
> -       err =3D ttm_device_kunit_init(priv, ttm_dev, false, false);
> +       err =3D ttm_device_kunit_init(priv, ttm_dev, 0);
>         KUNIT_ASSERT_EQ(test, err, 0);
>         priv->ttm_dev =3D ttm_dev;
>
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/g=
pu/drm/ttm/tests/ttm_bo_validate_test.c
> index 3a1eef83190c..17a570af296c 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> @@ -995,7 +995,7 @@ static void ttm_bo_validate_busy_domain_evict(struct =
kunit *test)
>          */
>         ttm_device_fini(priv->ttm_dev);
>
> -       err =3D ttm_device_kunit_init_bad_evict(test->priv, priv->ttm_dev=
, false, false);
> +       err =3D ttm_device_kunit_init_bad_evict(test->priv, priv->ttm_dev=
);
>         KUNIT_ASSERT_EQ(test, err, 0);
>
>         ttm_mock_manager_init(priv->ttm_dev, mem_type, MANAGER_SIZE);
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c b/drivers/gpu/dr=
m/ttm/tests/ttm_device_test.c
> index 98648d5f20e7..2d55ad34fe48 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_device_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
> @@ -25,7 +25,7 @@ static void ttm_device_init_basic(struct kunit *test)
>         ttm_dev =3D kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>         KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>
> -       err =3D ttm_device_kunit_init(priv, ttm_dev, false, false);
> +       err =3D ttm_device_kunit_init(priv, ttm_dev, 0);
>         KUNIT_ASSERT_EQ(test, err, 0);
>
>         KUNIT_EXPECT_PTR_EQ(test, ttm_dev->funcs, &ttm_dev_funcs);
> @@ -55,7 +55,7 @@ static void ttm_device_init_multiple(struct kunit *test=
)
>         KUNIT_ASSERT_NOT_NULL(test, ttm_devs);
>
>         for (i =3D 0; i < num_dev; i++) {
> -               err =3D ttm_device_kunit_init(priv, &ttm_devs[i], false, =
false);
> +               err =3D ttm_device_kunit_init(priv, &ttm_devs[i], 0);
>                 KUNIT_ASSERT_EQ(test, err, 0);
>
>                 KUNIT_EXPECT_PTR_EQ(test, ttm_devs[i].dev_mapping,
> @@ -81,7 +81,7 @@ static void ttm_device_fini_basic(struct kunit *test)
>         ttm_dev =3D kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>         KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>
> -       err =3D ttm_device_kunit_init(priv, ttm_dev, false, false);
> +       err =3D ttm_device_kunit_init(priv, ttm_dev, 0);
>         KUNIT_ASSERT_EQ(test, err, 0);
>
>         man =3D ttm_manager_type(ttm_dev, TTM_PL_SYSTEM);
> @@ -109,7 +109,7 @@ static void ttm_device_init_no_vma_man(struct kunit *=
test)
>         vma_man =3D drm->vma_offset_manager;
>         drm->vma_offset_manager =3D NULL;
>
> -       err =3D ttm_device_kunit_init(priv, ttm_dev, false, false);
> +       err =3D ttm_device_kunit_init(priv, ttm_dev, 0);
>         KUNIT_EXPECT_EQ(test, err, -EINVAL);
>
>         /* Bring the manager back for a graceful cleanup */
> @@ -158,9 +158,7 @@ static void ttm_device_init_pools(struct kunit *test)
>         ttm_dev =3D kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>         KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>
> -       err =3D ttm_device_kunit_init(priv, ttm_dev,
> -                                   params->alloc_flags & TTM_ALLOCATION_=
POOL_USE_DMA_ALLOC,
> -                                   params->alloc_flags & TTM_ALLOCATION_=
POOL_USE_DMA32);
> +       err =3D ttm_device_kunit_init(priv, ttm_dev, params->alloc_flags)=
;
>         KUNIT_ASSERT_EQ(test, err, 0);
>
>         pool =3D &ttm_dev->pool;
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/=
drm/ttm/tests/ttm_kunit_helpers.c
> index 7aaf0d1395ff..7b533e4e1e04 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> @@ -117,8 +117,7 @@ static void bad_evict_flags(struct ttm_buffer_object =
*bo,
>
>  static int ttm_device_kunit_init_with_funcs(struct ttm_test_devices *pri=
v,
>                                             struct ttm_device *ttm,
> -                                           bool use_dma_alloc,
> -                                           bool use_dma32,
> +                                           unsigned int alloc_flags,
>                                             struct ttm_device_funcs *func=
s)
>  {
>         struct drm_device *drm =3D priv->drm;
> @@ -127,7 +126,7 @@ static int ttm_device_kunit_init_with_funcs(struct tt=
m_test_devices *priv,
>         err =3D ttm_device_init(ttm, funcs, drm->dev,
>                               drm->anon_inode->i_mapping,
>                               drm->vma_offset_manager,
> -                             use_dma_alloc, use_dma32);
> +                             alloc_flags);
>
>         return err;
>  }
> @@ -143,11 +142,10 @@ EXPORT_SYMBOL_GPL(ttm_dev_funcs);
>
>  int ttm_device_kunit_init(struct ttm_test_devices *priv,
>                           struct ttm_device *ttm,
> -                         bool use_dma_alloc,
> -                         bool use_dma32)
> +                         unsigned int alloc_flags)
>  {
> -       return ttm_device_kunit_init_with_funcs(priv, ttm, use_dma_alloc,
> -                                               use_dma32, &ttm_dev_funcs=
);
> +       return ttm_device_kunit_init_with_funcs(priv, ttm, alloc_flags,
> +                                               &ttm_dev_funcs);
>  }
>  EXPORT_SYMBOL_GPL(ttm_device_kunit_init);
>
> @@ -161,12 +159,10 @@ struct ttm_device_funcs ttm_dev_funcs_bad_evict =3D=
 {
>  EXPORT_SYMBOL_GPL(ttm_dev_funcs_bad_evict);
>
>  int ttm_device_kunit_init_bad_evict(struct ttm_test_devices *priv,
> -                                   struct ttm_device *ttm,
> -                                   bool use_dma_alloc,
> -                                   bool use_dma32)
> +                                   struct ttm_device *ttm)
>  {
> -       return ttm_device_kunit_init_with_funcs(priv, ttm, use_dma_alloc,
> -                                               use_dma32, &ttm_dev_funcs=
_bad_evict);
> +       return ttm_device_kunit_init_with_funcs(priv, ttm, 0,
> +                                               &ttm_dev_funcs_bad_evict)=
;
>  }
>  EXPORT_SYMBOL_GPL(ttm_device_kunit_init_bad_evict);
>
> @@ -252,7 +248,7 @@ struct ttm_test_devices *ttm_test_devices_all(struct =
kunit *test)
>         ttm_dev =3D kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>         KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>
> -       err =3D ttm_device_kunit_init(devs, ttm_dev, false, false);
> +       err =3D ttm_device_kunit_init(devs, ttm_dev, 0);
>         KUNIT_ASSERT_EQ(test, err, 0);
>
>         devs->ttm_dev =3D ttm_dev;
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h b/drivers/gpu/=
drm/ttm/tests/ttm_kunit_helpers.h
> index c7da23232ffa..f8402b979d05 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> @@ -28,12 +28,9 @@ struct ttm_test_devices {
>  /* Building blocks for test-specific init functions */
>  int ttm_device_kunit_init(struct ttm_test_devices *priv,
>                           struct ttm_device *ttm,
> -                         bool use_dma_alloc,
> -                         bool use_dma32);
> +                         unsigned int alloc_flags);
>  int ttm_device_kunit_init_bad_evict(struct ttm_test_devices *priv,
> -                                   struct ttm_device *ttm,
> -                                   bool use_dma_alloc,
> -                                   bool use_dma32);
> +                                   struct ttm_device *ttm);
>  struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
>                                             struct ttm_test_devices *devs=
,
>                                             size_t size,
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_d=
evice.c
> index a97b1444536c..87c85ccb21ac 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -199,8 +199,7 @@ EXPORT_SYMBOL(ttm_device_swapout);
>   * @dev: The core kernel device pointer for DMA mappings and allocations=
.
>   * @mapping: The address space to use for this bo.
>   * @vma_manager: A pointer to a vma manager.
> - * @use_dma_alloc: If coherent DMA allocation API should be used.
> - * @use_dma32: If we should use GFP_DMA32 for device memory allocations.
> + * @alloc_flags: TTM_ALLOCATION_ flags.
>   *
>   * Initializes a struct ttm_device:
>   * Returns:
> @@ -209,7 +208,7 @@ EXPORT_SYMBOL(ttm_device_swapout);
>  int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_fun=
cs *funcs,
>                     struct device *dev, struct address_space *mapping,
>                     struct drm_vma_offset_manager *vma_manager,
> -                   bool use_dma_alloc, bool use_dma32)
> +                   unsigned int alloc_flags)
>  {
>         struct ttm_global *glob =3D &ttm_glob;
>         int ret, nid;
> @@ -237,9 +236,7 @@ int ttm_device_init(struct ttm_device *bdev, const st=
ruct ttm_device_funcs *func
>         else
>                 nid =3D NUMA_NO_NODE;
>
> -       ttm_pool_init(&bdev->pool, dev, nid,
> -                     (use_dma_alloc ? TTM_ALLOCATION_POOL_USE_DMA_ALLOC =
: 0) |
> -                     (use_dma32 ? TTM_ALLOCATION_POOL_USE_DMA32 : 0));
> +       ttm_pool_init(&bdev->pool, dev, nid, alloc_flags);
>
>         bdev->vma_manager =3D vma_manager;
>         spin_lock_init(&bdev->lru_lock);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.c
> index 8ff958d119be..599052d07ae8 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1023,8 +1023,8 @@ static int vmw_driver_load(struct vmw_private *dev_=
priv, u32 pci_id)
>                               dev_priv->drm.dev,
>                               dev_priv->drm.anon_inode->i_mapping,
>                               dev_priv->drm.vma_offset_manager,
> -                             dev_priv->map_mode =3D=3D vmw_dma_alloc_coh=
erent,
> -                             false);
> +                             (dev_priv->map_mode =3D=3D vmw_dma_alloc_co=
herent) ?
> +                             TTM_ALLOCATION_POOL_USE_DMA_ALLOC : 0);
>         if (unlikely(ret !=3D 0)) {
>                 drm_err(&dev_priv->drm,
>                         "Failed initializing TTM buffer object driver.\n"=
);
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 5f6a412b571c..58e7996160a0 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -437,7 +437,7 @@ struct xe_device *xe_device_create(struct pci_dev *pd=
ev,
>
>         err =3D ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
>                               xe->drm.anon_inode->i_mapping,
> -                             xe->drm.vma_offset_manager, false, false);
> +                             xe->drm.vma_offset_manager, 0);
>         if (WARN_ON(err))
>                 goto err;
>
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index 592b5f802859..074b98572275 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -27,6 +27,7 @@
>
>  #include <linux/types.h>
>  #include <linux/workqueue.h>
> +#include <drm/ttm/ttm_allocation.h>
>  #include <drm/ttm/ttm_resource.h>
>  #include <drm/ttm/ttm_pool.h>
>
> @@ -292,7 +293,7 @@ static inline void ttm_set_driver_manager(struct ttm_=
device *bdev, int type,
>  int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_fun=
cs *funcs,
>                     struct device *dev, struct address_space *mapping,
>                     struct drm_vma_offset_manager *vma_manager,
> -                   bool use_dma_alloc, bool use_dma32);
> +                   unsigned int alloc_flags);
>  void ttm_device_fini(struct ttm_device *bdev);
>  void ttm_device_clear_dma_mappings(struct ttm_device *bdev);
>

Looks good. I'm always happy to see boolean's in function parameters
replaced by enums/defines.

Acked-by: Zack Rusin <zack.rusin@broadcom.com>

z

--0000000000006789070641b74fdb
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
6U6qgI8F5eiKsQyE0HgYrQJx/sDs9LLVZlaNiA3U8M8CgEnb8VhuH3BN/yXphhEQdJXb1TyaJA60
SmHcZdEQZbl4EjwUcs3UIowmI/Mhi7ADQB7VNsO/BaOVBEQk53xH+4djY/cg7jvqTTeliY05j2Yx
uwwXcDC4mWjGzxAT5DVqC8fKQvon1uc2heorHb555+sLdwYxAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF3phY2sucnVzaW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQNDn2m/OLuDx9YjEqPLCDB
s/VKNTANBgkqhkiG9w0BAQsFAAOCAgEAF463syOLTQkWZmEyyR60W1sM3J1cbnMRrBFUBt3S2NTY
SJ2NAvkTAxbPoOhK6IQdaTyrWi8xdg2tftr5FC1bOSUdxudY6dipq2txe7mEoUE6VlpJid/56Mo4
QJRb6YiykQeIfoJiYMKsyuXWsTB1rhQxlxfnaFxi8Xy3+xKAeX68DcsHG3ZU0h1beBURA44tXcz6
fFDNPQ2k6rWDFz+XNN2YOPqfse2wEm3DXpqNT79ycU7Uva7e51b8XdbmJ6XVzUFmWzhjXy5hvV8z
iF+DvP+KT1/bjO6aNL2/3PWiy1u6xjnWvobHuAYVrXxQ5wzk8aPOnED9Q8pt2nqk/UIzw2f67Cn9
3CxrVqXUKm93J+rupyKVTGgKO9T1ODVPo665aIbM72RxSI9Wsofatm2fo8DWOkrfs29pYfy6eECl
91qfFMl+IzIVfDgIrEX6gSngJ2ZLaG6L+/iNrUxHxxsaUmyDwBbTfjYwr10H6NKES3JaxVRslnpF
06HTTciJNx2wowbYF1c+BFY4r/19LHygijIVa+hZEgNuMrVLyAamaAKZ1AWxTdv8Q/eeNN3Myq61
b1ykTSPCXjBq/03CMF/wT1wly16jYjLDXZ6II/HYyJt34QeqnBENU9zXTc9RopqcuHD2g+ROT7lI
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEID/F
ju2DHd5PUN//0Na6XZexo84BzmEwheKE75/BiONOMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI1MTAyMjAzNTcwN1owXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAFcQeBpQDR74S6ZToqiy84X4K3x28E8PDDU/A25l
AqyPDvqnwaOw98S46a2ZgyPBz3VFpZlSdJQC5kxX5h6kVrLBlGLy0wI/ax8IfExkFQZO66JyuMN+
0FNc+qF351Kfw7WJ7PhELHBgANtYYKr8NrMmP+iVs2300vBZli1SFTUNnUCrpC/6n2NWx8w1JdKt
LxKqruQ12bMIiwDq90KMs7Ador+t0yTuRqkk5rHTe5/aTbLs+O0LENNMvpQm7j9QlAr+i8rnHiLS
KhtwOhf2iWWJQYHECgHJvTJmBwvrY6KOHiMhePpAHAbGugdN9vVNs+hEs3IZSMiWibGbWGFd9cU=
--0000000000006789070641b74fdb--
