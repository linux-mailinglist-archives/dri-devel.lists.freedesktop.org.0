Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D302AA4C1A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 14:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725E010E051;
	Wed, 30 Apr 2025 12:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N6pWC7HH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C31810E051;
 Wed, 30 Apr 2025 12:58:58 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-b16c64b8cbcso544352a12.3; 
 Wed, 30 Apr 2025 05:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746017938; x=1746622738; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9dQgDsBrKKb7LUHfJaqvSu3D4gwYk1wUfztt+eVLekw=;
 b=N6pWC7HHoONLEmMheaHr9mnkzPC8yGazEeNv0+ztmY1Gp+cOJlKUYFE1gqo1DJuOIV
 1brtK2ETMvf5rfDVjSWG9fp3SNC5kx5ztLq16/j9YCOQ27/fge6vo4rPPuNq2CKMz11d
 +kqGIztOXNXJScHBjQB9CQyIK9Ldkk9e76OqZkfmawREtR3DYb9qbtmzqLqYFBNyD1Kx
 irPBn6oewG+tdP1vThDFrad82aciQEjZdWhrSlsWmUPsEFB5lpHG/1hFpFx4ydB0vz14
 mp/SlvUz4Tcc3ADTCdtpmTK5VhIkRQhJ84HQohx4DQUzAbS+KFQ2cmkonG6MUeFVHM+e
 Ps7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746017938; x=1746622738;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9dQgDsBrKKb7LUHfJaqvSu3D4gwYk1wUfztt+eVLekw=;
 b=hSicYC00vGa4bf5ooLavsqCxt+e//QC/c4dwBnN9UPki7R/bZW95iRz7avl5qdZrqw
 4n7bJxK3uxD7fyYL1kZO+fFkLrc1jvyA9RrDM8tMbsFDfciZUACET5bcv60axcG/zO3n
 DK1DOmq+SQxDmdyl2QcZHL1qG+tiqZuRPw1/4/0LX3qvs2dzcl6+T85C5ST9DC+YJsaG
 0H7/1bbA9iWQL64ZlauLNMtUW6FmKvvsDmSdVie6Fc88EKVlQ1uSUmNj8QFtkm7LOQV8
 tFZikiBwbqacuikOYQqDVnC2Y9eYtvlGszLeWg9DOThigOOOM8TfKLTsTlc5ZL2E2uCm
 CJRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU09UhpwgfG4oUvEYvbKREgJ1p8v65eoE4Lk9Zrjjl7oUovautRhcoP0gA308aCib4hQmA2eX31@lists.freedesktop.org,
 AJvYcCUjgeE5TK43Q8YUt3hqDECpRfLzDRNXihTxQBb+p7YVWzZtSsxWZojGfRuAZyNxMjobkWk3pCjd1Aq0@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3nVqnMvJRy4h+Ilek8VkjpNz3HS/ankgkfJQ5YaJ3KeXj9rFQ
 lMdGx6rcQ4Ba/51TDVUYFI24iJ51PAhxfS4gtWPVkE7l8ByOTbW+TdGdFrBaqsneZ1PPbaeo4Ac
 ZqS2TcgPge89llILEwhi3CCw46EE=
X-Gm-Gg: ASbGncuAkCKjeN9XQZNPt2IV+Pkzlse3oHsu+3rhSdod8j9vVKDc9C7Aa2hZ5bKOFXE
 2TnxxznKcZVAWOHHauCvsZoxuPlrs+Zncm2soIQyZvi7BtQsF9Iimjuva7rOXfOIBbWbaRv5UKa
 w972W5oWTEaKX3sND0uLcTr09dA5Ws/lNP
X-Google-Smtp-Source: AGHT+IHPHDfrVZ0RLZ1bQoLDYi3iVYqbjTOtxBO8xR4L/VADlcQSd95Z8b6hZvsjpcRtLCg5EcVqWeVLl2E0ftk48Ew=
X-Received: by 2002:a17:90b:4d0a:b0:2fe:b2ea:30f0 with SMTP id
 98e67ed59e1d1-30a3bb65eb8mr270758a91.4.1746017937898; Wed, 30 Apr 2025
 05:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250429235006.536648-1-sashal@kernel.org>
 <20250429235006.536648-33-sashal@kernel.org>
In-Reply-To: <20250429235006.536648-33-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 30 Apr 2025 08:58:45 -0400
X-Gm-Features: ATxdqUFE2oLBHIj4SHrxk1wfj1ZCoBa2urs6nrnbqf5-qqwOEYtXEpH592CaLS8
Message-ID: <CADnq5_Neg_tkGf2JVT+QuAuU06EY=XwBXBH680JFXyfW4FwUMg@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.14 33/39] drm/amdgpu: Allow P2P access through
 XGMI
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Felix Kuehling <felix.kuehling@amd.com>, Hao Zhou <hao.zhou@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, airlied@gmail.com, simona@ffwll.ch, 
 Yunxiang.Li@amd.com, tvrtko.ursulin@igalia.com, matthew.auld@intel.com, 
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

On Tue, Apr 29, 2025 at 7:51=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
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
> index c9842a0e2a1cd..cb043296f9aec 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -43,6 +43,29 @@
>  #include <linux/dma-fence-array.h>
>  #include <linux/pci-p2pdma.h>
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
> @@ -54,11 +77,13 @@
>  static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
>                                  struct dma_buf_attachment *attach)
>  {
> +       struct amdgpu_device *attach_adev =3D dma_buf_attach_adev(attach)=
;
>         struct drm_gem_object *obj =3D dmabuf->priv;
>         struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
>         struct amdgpu_device *adev =3D amdgpu_ttm_adev(bo->tbo.bdev);
>
> -       if (pci_p2pdma_distance(adev->pdev, attach->dev, false) < 0)
> +       if (!amdgpu_dmabuf_is_xgmi_accessible(attach_adev, bo) &&
> +           pci_p2pdma_distance(adev->pdev, attach->dev, false) < 0)
>                 attach->peer2peer =3D false;
>
>         amdgpu_vm_bo_update_shared(bo);
> @@ -459,6 +484,9 @@ bool amdgpu_dmabuf_is_xgmi_accessible(struct amdgpu_d=
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
