Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DE9AA4C16
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 14:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D396C10E772;
	Wed, 30 Apr 2025 12:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SyYL976o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820F710E772;
 Wed, 30 Apr 2025 12:58:24 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-af5f28ecbcaso430228a12.0; 
 Wed, 30 Apr 2025 05:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746017904; x=1746622704; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NPXUIsE4ReVkZMwLEkZi0ELhyjfyphpwVsdpjPiS8oA=;
 b=SyYL976o2Sey31/LPBhZqAogjCIUJwvApDU1tSD7E4yBbAR5HL3nowFIBAn1MkYfe4
 YRKAr0FK6mTFwbUTnQqbHbUO1j1stKDSKGAos6K0jSzS8rAa5BhiwNlM41IlkTfMmXtl
 XoJHqkohNKf/t8i2Krto2ninRDK6V/LAwodbeRoqcIk3KS9t15XaZXBH7T/zsicuAhid
 D0TP2QLHjWc4A6hzKkKee/qWvgurAa1Kh05yjtjHnPkqHG7L6kLuo+GKLp8VhC0dthkK
 mhEU2+af8Pg4nMQWmVqrmbf8FqjhvSQwpFi2u38jVOZYtPBDK9ucirKtKuRd0mv1xd1F
 onwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746017904; x=1746622704;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NPXUIsE4ReVkZMwLEkZi0ELhyjfyphpwVsdpjPiS8oA=;
 b=cRIDD/l1gcVfiArgfHDJdmVUAgleHcKjnL4TNAbtEOZTcotxR2xAjYdWj5JPnEP3Xe
 By/QQiYLITkFi4xCsiazFlw9lgM+ktEgDr39wSKhGs4YFnnFxjFMMPi5jkhyViUlzCki
 9IptTyw4Dz8f5JtCbgE0BucO2m65lIO32nammlrxY0b7+uZizsBBoQRsXpn2PUmUcU9q
 +4K8Y9uBOAVuHa2uGSo0HkunMmNtTuDigqoSj/5esbnkz2ZFUQnreezLAizJf8Dsb5X2
 E474wBbyUfp2g1sa4xfvAIiBTeItZOY4kJ7oc4mJb87/pIo8OgIJDAX9tS9ERg15477h
 dx/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLP8QCg1qOuKxfxZ2qewVfoylCPfku+FndXcDblr5dpBK8Trt25ViZZjQdf6i8HJxVBVU/l+90@lists.freedesktop.org,
 AJvYcCXmTzaWvWUTe8v5jE8sgY1tOTCCIYtT+htrD6PIehKtTD4tVZ+V2v7nQA1w2mTgHD/q7wT8srOugSz2@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywm+tsfqfhJiUNfEF8XxPmGN6mmxi5T9iadnyPRjfwQS6J2TZui
 qb+8adqlgF5mQJNefdPInwmJkFJfntl8cNOxKnB7f/KjzIXmxNrmpY+yPpiPeH6Lvzz2On895Fw
 +VYl18aBab28Mg1WHzQSbvYoceJo=
X-Gm-Gg: ASbGncuuSHqNMGylQ/LKa3IHs9pQ1ouKyl0Cs91q99BD8ftGqYeCbi7tP/BYB57tN9F
 An5FNO+cz4K0/LSVre0nmD52MwfweqMd418cXeSO/guwVlQ+LQ8qNzWIIHzhfV4y76h1Z/CYIUZ
 ZoRZyIi6xxkD/GtPgOG2Cvaw==
X-Google-Smtp-Source: AGHT+IHne2NVKYJwscRaLJsR6gKOyn7FqLSafssyaWrQrJGysCVrW+PztelMHMNGWGSZ04yVwAV9giBDJp8jUNh6Xvw=
X-Received: by 2002:a17:90b:4a07:b0:2fe:91d0:f781 with SMTP id
 98e67ed59e1d1-30a349d709fmr1419994a91.2.1746017903888; Wed, 30 Apr 2025
 05:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250429235122.537321-1-sashal@kernel.org>
 <20250429235122.537321-32-sashal@kernel.org>
In-Reply-To: <20250429235122.537321-32-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 30 Apr 2025 08:58:12 -0400
X-Gm-Features: ATxdqUHHvbOgz8ETiF5ngfd_6ddDF71hTJ4TeMgxDWq22BPGXjcwbXxwcH0Btow
Message-ID: <CADnq5_M4=NSxAc+N3hSoTX9hwJcpvogy1hkg3Sx29zqsSpGkZQ@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.12 32/37] drm/amdgpu: Allow P2P access through
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

On Tue, Apr 29, 2025 at 7:58=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
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
> index 2f90fff1b9ddc..e63a32c214475 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -42,6 +42,29 @@
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
> @@ -53,11 +76,13 @@
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
>         return 0;
> @@ -456,6 +481,9 @@ bool amdgpu_dmabuf_is_xgmi_accessible(struct amdgpu_d=
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
