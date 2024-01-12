Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0952782C251
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 15:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AEA410E052;
	Fri, 12 Jan 2024 14:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAE910E004;
 Fri, 12 Jan 2024 14:57:36 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-20451ecbb80so3268289fac.2; 
 Fri, 12 Jan 2024 06:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705071455; x=1705676255; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J6MnHkt2VpMVg0RRcKjlt4ioS8fsU4mRnxPnlPqwX30=;
 b=SCwvnwrEAACRKjG3HTZi05XZh1Mz/TmJspnKP5eLLTbWZwWgk0Am21u8Hx0rP8WeX5
 gK4Nf4FLJi+wrC+FmbmGEOP4JxzKBYyUv/R4e6xqSfztC11YntOlVvzTwuwJ50apkpdM
 KNDqqzWp/YuuNS+Sgywxracr2QEhHSmojrNrEApFUo+GCksuwiPnYfToJJZfEBVRQB6x
 W7vmlfKcK+4KYQQMW9W5C2UeDOZugLYjxH6z0qOFqo4hL1idNfFx50QAlxrxQ/jBN/V7
 CHCjkGoGRCQe6perQvKtvX/RYbsGlUa9bjkAg9T3LgpPA+2U3ZV9wy4MEriO/ZMXD9gl
 nF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705071455; x=1705676255;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J6MnHkt2VpMVg0RRcKjlt4ioS8fsU4mRnxPnlPqwX30=;
 b=fsUMkkMWyK8owklpj6ok394R3M42v2GVRSAp61tg/xtYkgwrKMprXuYUsrDem16n3R
 noySpTR2O3npE1AQJnK61q1hHnJrAWr/qxJ4QNO/DBr+2c5kl0Ir5FLN+AlmA0GTKlVV
 37w5fmBFh3Y3AupobwPpFLp+1lANWM5zJKVpYN4Lg0yCmDDTAU30GcAHTTS8gxVqDPRz
 Loqo1sHsUvJcI6xT7g6yr1eExGNX30VT6Np0uvXI77E+c1F4cCMkZQ3REgDvsI76MyIK
 CckoICx8PMzDpijvadhaXA/cZKD5w1pqRA72nN6BV5icrniiehSl11K2kS1j12Y3OPZc
 pQZw==
X-Gm-Message-State: AOJu0YxRBAkVbpf8RUsVT7JirecnZg7ny1R3kO2UKuZumlk0BLRnuOQb
 7H5DRh1IPovqDklHTHm2R1MMCG2q2YUxsocAXRw=
X-Google-Smtp-Source: AGHT+IEALwDD34qY/RqGn4hysu6/p03sgxBJifwumI10KtPXGPHMbVEg4mGSthNFTNntWhQHYX1j1PpBMAHVrG3zolI=
X-Received: by 2002:a05:6870:d0c1:b0:205:f212:aa0a with SMTP id
 k1-20020a056870d0c100b00205f212aa0amr1676126oaa.19.1705071455567; Fri, 12 Jan
 2024 06:57:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1704908087.git.jani.nikula@intel.com>
 <fea7a52924f98b1ac24f4a7e6ba21d7754422430.1704908087.git.jani.nikula@intel.com>
In-Reply-To: <fea7a52924f98b1ac24f4a7e6ba21d7754422430.1704908087.git.jani.nikula@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 12 Jan 2024 09:57:23 -0500
Message-ID: <CADnq5_MZuVDx2VeErcOXSqkgRrnFsrn1=N8Y-K47Woar-aeAyw@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/amdgpu: prefer snprintf over sprintf
To: Jani Nikula <jani.nikula@intel.com>
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
Cc: Pan@freedesktop.org, intel-gfx@lists.freedesktop.org,
 Xinhui <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 12:39=E2=80=AFPM Jani Nikula <jani.nikula@intel.com=
> wrote:
>
> This will trade the W=3D1 warning -Wformat-overflow to
> -Wformat-truncation. This lets us enable -Wformat-overflow subsystem
> wide.
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Pan, Xinhui <Xinhui.Pan@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

Feel free to take this via whichever tree makes sense.

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gfx.c
> index b9674c57c436..82b4b2019fca 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -329,7 +329,8 @@ int amdgpu_gfx_kiq_init_ring(struct amdgpu_device *ad=
ev,
>
>         ring->eop_gpu_addr =3D kiq->eop_gpu_addr;
>         ring->no_scheduler =3D true;
> -       sprintf(ring->name, "kiq_%d.%d.%d.%d", xcc_id, ring->me, ring->pi=
pe, ring->queue);
> +       snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
> +                xcc_id, ring->me, ring->pipe, ring->queue);
>         r =3D amdgpu_ring_init(adev, ring, 1024, irq, AMDGPU_CP_KIQ_IRQ_D=
RIVER0,
>                              AMDGPU_RING_PRIO_DEFAULT, NULL);
>         if (r)
> --
> 2.39.2
>
