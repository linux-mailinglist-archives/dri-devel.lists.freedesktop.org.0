Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B706AA4C13
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 14:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2ECD10E7B0;
	Wed, 30 Apr 2025 12:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AjfilHOz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E6510E7AC;
 Wed, 30 Apr 2025 12:58:07 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-b078bb16607so798523a12.2; 
 Wed, 30 Apr 2025 05:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746017887; x=1746622687; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w1akON1o4PR3e5D1TI8Ndz51nWQooVFDodiAjMxjF6A=;
 b=AjfilHOzkVCg8Qe7VXOWMtgNLm7WEW66Kx1BX+xJAAyyuGoU1Nc8wGyC0L+myQvFZy
 MedrPbiSItHJxJPayR6RgQ+S07smMmiPtpFy74IYiU/iB6wIqzNYXtIXQvgL/kOljbUE
 RzoYvJd2F34oifXx+EIMAfrTc99fqz2mSv9F6Vr13Kt+WY8RbT2orBUWeAV2EWSCeFyM
 k7QdIZ6NxT9fpOh9gP+AdaJAMg1QF5dbw0XvdkJ0men3n+njSFSBkuJK/4mxo1708/b/
 MXKJAzBSqYY9+fEmDyh9lIWoFfBsNqO8uVeUZgeehB1ErFQ05OBuQywzE18lrdcHQB/b
 ZmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746017887; x=1746622687;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w1akON1o4PR3e5D1TI8Ndz51nWQooVFDodiAjMxjF6A=;
 b=BY+8WMQX+n9D24zpw3v9Jj/9aJT03MOALK/VpXNAUkT5xaY0se/ITH+jmVm7KV1jKz
 lRyRul5J7zrGu2BKuinpMNNnTkmn8NSYn8gMcVwOAe1LmAhNHmwsOsS62z/oEFEXQ5hn
 rp2nVX30ZrL7e2Be85T2AkdVr5dti5rxbml3grqWb/iV8nuTsLlE+Z0XCCp0MHXKdasW
 HH6xLzPda4q79/4Re8KUzEsQbEXnrPIA4bW4Fve3K5ajBi2u03znCcN2SoQMX5F9VArq
 mj4K7AbDazxb1AbAznY+z4ojoZ1Blqhi9xiRJ7poyA3wOJitWljgxGsUJmfxDFgdpliy
 TafQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAP2T26fsFf6zTn4G5KDNcHuXSAmgjQTLtz5gMngrzZV5TY9XAoLQjAMM5iwW/IEjG6lTpZkM3V78v@lists.freedesktop.org,
 AJvYcCWfOVcNJ4V9RV4Ut8Ruma5IbX6JtCACmJZJqBkIwxJz4kxvxR7nrOWBbwj9chRtJq/sg7M9h/oq@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbwBubqiAlnZY7iqnPmCIdGU8poBbzjkuu3oNeTrKajcrLEmA5
 LANdKHlkS/8s//LxEuUxAn80v5oOxKPgHTv8Jrsf38swNyFfIHI+8hdxm1HO6pfKWKlPrxXHg+c
 zx8REzSPFhvapup3PfGFSBwqT08Y=
X-Gm-Gg: ASbGncvUWtOov+BS2idtfOStMxnGdMIYTyiWx79AMu+nV8DUit9RDfsulN1wVuRajO5
 mkdhODxbOMz4zKvCOFnfNd4g/NjKKFG0e91dvrYilqKYqh+D9YavqrAkvrgbw+kgnfSGoxGlPnA
 1Wy9B14hnO0ue6+K+wC9Qmnw==
X-Google-Smtp-Source: AGHT+IFkgBWA5Qz+38wX3ie0e4pxXoHem2tefzFM+zdcot5D0U/XdRjt4IzjaRXDLGP924qPLiNa3sAqw5Z1l8JSrRs=
X-Received: by 2002:a17:90b:4d90:b0:2ff:4be6:c5e2 with SMTP id
 98e67ed59e1d1-30a34ab3ffamr1322221a91.7.1746017886792; Wed, 30 Apr 2025
 05:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250429235233.537828-1-sashal@kernel.org>
 <20250429235233.537828-18-sashal@kernel.org>
In-Reply-To: <20250429235233.537828-18-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 30 Apr 2025 08:57:55 -0400
X-Gm-Features: ATxdqUG2QivkrM09P4CiwCQRObyzJMJYNyE22wZ8sy_0nnVPZuHIF6dm-UUbAH8
Message-ID: <CADnq5_MMNrRSkwAPHU4n2jpHyZ_Lr28wVguZ8yducpQeLZJP_w@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.6 18/21] drm/amdgpu: Allow P2P access through
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

On Tue, Apr 29, 2025 at 8:04=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
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
> index be4cc4868a748..493e18bcea069 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -43,6 +43,29 @@
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
> @@ -54,12 +77,14 @@
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
> @@ -482,6 +507,9 @@ bool amdgpu_dmabuf_is_xgmi_accessible(struct amdgpu_d=
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
