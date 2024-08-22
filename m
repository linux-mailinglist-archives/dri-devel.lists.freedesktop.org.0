Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B56D95B86D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 16:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F3810EAEB;
	Thu, 22 Aug 2024 14:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XcXSZSe8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82FCA10EAE6;
 Thu, 22 Aug 2024 14:32:14 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-201f1fe3909so252455ad.3; 
 Thu, 22 Aug 2024 07:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724337134; x=1724941934; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jQgK1rzIXwmb3RwGA5P0Qn1wZh572puhdY49SX1RQsY=;
 b=XcXSZSe8YpSwBDw4n+pFLT2dkVltXq9GQbm1d6HBbDPzUrnoK5eI3cJEFmpkgpbPBM
 9KAJ0pl8UD4XjEZls8IxSWtKZUvs/oNcYo0a6UTqOACvAHXhG6qww6MsnRq2dO8iirCL
 zN7S+gbt7M4Gr6imOG2ORUwSsUp+ZSb0ZLcPRjExebvGfufyRaPIrIKlD5wK/70PHX7X
 G5qqh3Onb8u2bCthJk7hXlb1Hk28HUM8Oy478m5afvAxa1IC/ldWv2CsxBs7jwPd3EnU
 GO81fvZOW6XEfQUVaYLU5DOxLrO8HDuXlNBci2/Gfm+QTbMoEnbt0AkKfOhi2AsB930i
 wXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724337134; x=1724941934;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jQgK1rzIXwmb3RwGA5P0Qn1wZh572puhdY49SX1RQsY=;
 b=IQI7PrODfxBEeEgo/oZ1lrWnqq10DDKyyCFUvNYmMOw0NpULlyXIDQ9+VCBsP13uZ1
 tZS+ra4aQy31gjonTwxye+C1mtBZT6/EOYjmWFztLFxcnZTBZ+MQrGjbpJKBi71bWoFZ
 lyPsynnRoL+pMboKtqAR3P5AwANdoqyMUv5nAqFxbJC9H2DWyIW5Uf8TEttx4rviiHk0
 NeVYsg3V1RvRJTzRXBN3UmEFgfW6VaAJacDRpdmrSH3fMqQdv+9dndV16eVYVFEycIPw
 +poSPOBw87hFKgj9NJ2LxH7hY5QAcns/Hu2BysnURcFPoPo0K2q0wUnwPN/L6u+PGmou
 PJaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/QmbW529Eoh0oE3WFWgAgHZaFXyrHrBB0JzcSGqpF0h+0GtL9kgCKV8N99yNRBOpFRtZq5Qjntyo=@lists.freedesktop.org,
 AJvYcCUjUSqt21ALC/J81z9yM2giseekcfqNwclOi8aCQ2NWnLXBK+6xgppcBIdIKDSZfR4ftR17em9OxiiN@lists.freedesktop.org,
 AJvYcCWH0F+Omrmf/Ym4l70Vobbj/c4kWPHZcxaLNkyRaLI4MVZfVKTLe0dSKEfYbt4CqC6yjJjuUj5cttUu@lists.freedesktop.org,
 AJvYcCX3N3s1NKGGfdbXCdtfihy/xCxy+aTrhRdxhk0FlEFyfzU0ozZtLn8qVQD4+FdKnsfxBcFzWgiu@lists.freedesktop.org,
 AJvYcCXt+oB9l5fo26F2A8uqd2ckHGhu009UhdBtJlZtVrHHYmH46HpyrJR2EqZego63kvig66DPGfnmig==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz84fMjmE/Hw/RU2aloow2yIBuNBM2JB0Jp0SEiM0s1ymoj7l0z
 ck6t0P1GZvFZnoqOJ5hDciM65uK4BxT1paF53tc3chrAn6B0O0gTpj4ft2ZXymlyFUxKfQcvc7d
 7atdmA8n5c8oaYuicO88NEOtwIdc=
X-Google-Smtp-Source: AGHT+IFcoi3jyv0WQ57Re9pO2UnzP8uVCsSHk1/w9ub/ssnYLVZ/EfsXb+pIpM+iMOaFWU3SIwh/eC9EQpLx3I1sncM=
X-Received: by 2002:a17:902:d2ce:b0:202:4e99:210a with SMTP id
 d9443c01a7336-20368072948mr39657575ad.6.1724337133656; Thu, 22 Aug 2024
 07:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240821130348.73038-1-tzimmermann@suse.de>
 <20240821130348.73038-66-tzimmermann@suse.de>
In-Reply-To: <20240821130348.73038-66-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 22 Aug 2024 10:32:02 -0400
Message-ID: <CADnq5_MeNUiqUHioN9u-wpsUKFHXpo+y8P42unOhv1mOHjjPag@mail.gmail.com>
Subject: Re: [PATCH v2 65/86] drm/amdgpu: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, 
 javierm@redhat.com, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>
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

On Wed, Aug 21, 2024 at 9:06=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> The amdgpu driver specifies a preferred color mode depending on
> the available video memory, with a default of 32. Adapt this for
> the new client interface.
>
> v2:
> - style changes
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Xinhui Pan <Xinhui.Pan@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index 5dd39e6c6223..849d59e2bca7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -23,6 +23,7 @@
>   */
>
>  #include <drm/amdgpu_drm.h>
> +#include <drm/drm_client_setup.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fbdev_ttm.h>
>  #include <drm/drm_gem.h>
> @@ -2341,11 +2342,15 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>          */
>         if (adev->mode_info.mode_config_initialized &&
>             !list_empty(&adev_to_drm(adev)->mode_config.connector_list)) =
{
> +               const struct drm_format_info *format;
> +
>                 /* select 8 bpp console on low vram cards */
>                 if (adev->gmc.real_vram_size <=3D (32*1024*1024))
> -                       drm_fbdev_ttm_setup(adev_to_drm(adev), 8);
> +                       format =3D drm_format_info(DRM_FORMAT_C8);
>                 else
> -                       drm_fbdev_ttm_setup(adev_to_drm(adev), 32);
> +                       format =3D NULL;
> +
> +               drm_client_setup(adev_to_drm(adev), format);
>         }
>
>         ret =3D amdgpu_debugfs_init(adev);
> @@ -2957,6 +2962,7 @@ static const struct drm_driver amdgpu_kms_driver =
=3D {
>         .num_ioctls =3D ARRAY_SIZE(amdgpu_ioctls_kms),
>         .dumb_create =3D amdgpu_mode_dumb_create,
>         .dumb_map_offset =3D amdgpu_mode_dumb_mmap,
> +       DRM_FBDEV_TTM_DRIVER_OPS,
>         .fops =3D &amdgpu_driver_kms_fops,
>         .release =3D &amdgpu_driver_release_kms,
>  #ifdef CONFIG_PROC_FS
> @@ -2983,6 +2989,7 @@ const struct drm_driver amdgpu_partition_driver =3D=
 {
>         .num_ioctls =3D ARRAY_SIZE(amdgpu_ioctls_kms),
>         .dumb_create =3D amdgpu_mode_dumb_create,
>         .dumb_map_offset =3D amdgpu_mode_dumb_mmap,
> +       DRM_FBDEV_TTM_DRIVER_OPS,
>         .fops =3D &amdgpu_driver_kms_fops,
>         .release =3D &amdgpu_driver_release_kms,
>
> --
> 2.46.0
>
