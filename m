Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C76549AF409
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 22:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E8510E99D;
	Thu, 24 Oct 2024 20:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iELmAw7F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F369B10E99A;
 Thu, 24 Oct 2024 20:47:43 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-7c3d415f85eso150795a12.0; 
 Thu, 24 Oct 2024 13:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729802863; x=1730407663; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X/RaMP1a25SiD6/PgeZb3OYWG0X09tt/78Fw3tyAIdQ=;
 b=iELmAw7F7/EyEcoa3sOaiYEF4EjYMozDgjCtJfjK6EuNET6in1p9w2Hyg5+oNc2EkP
 +TVKadsygJ5V2bAdhGO+4chEyCB5Q68/PzyKb4o7nq5QykRoTuVQ6/uoS6fPSiSlgpS3
 mnX+M2NWjlRSsKmJqB50RieU/F2Dp71PQ4Cf+vkwYbYjtxnLj4psqFd7jXJPRe4L8CfK
 z8OAmMvnKCKBYYTjG77KktHdKPTavWFu+oPGgfBao2cvnTZOaAa3o0ASk+fvZEZBxsSi
 zEX6j01mo8/YfFuRp2ogWxPRIlUlUatopmvFd7saZiivUktLFNGqn02p3osCMETlcZMH
 Cb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729802863; x=1730407663;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X/RaMP1a25SiD6/PgeZb3OYWG0X09tt/78Fw3tyAIdQ=;
 b=xOy+wLyszdwR5H0Ch041rL/dGNqBIM4piZnuGwx1jOGs+7Kk5VqiW2/Au5qwFBkDc7
 kEWtT7UH1XkTDUsAAEv8ait76DbqwtBFNwy5JOZzeQH18X5VrR3Mys25c55PpccN6hY/
 OPLt0RAXJuPxi2qDl15+sepNt/F1YEH9SPy27nv8CWYZb9TGsGRyKzhnbDt7heh5ZYFD
 jSqHhr3xWRt8SdOz7nRNLiceIx78pjesImSOmGyNSQmUx9j2J+/B/NtW0f7XMfFmC+Ab
 DT6Boe5Mz3vDWby4Px+bOdHazraruJKzRLTav4X1I1wDt3nLWMs3kbFxOwUF7RFgzubu
 qQtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy7ZSRmnalbixVWAOdANIo+CmKCyir4MMxwZjflrFGMxH6KzBKFDjODstPHjAlzqfA4xNWn5BN7Q==@lists.freedesktop.org,
 AJvYcCW8gz98e+ASuidwxacuF3nNcTlqqmd7E6f/pIl9Hrau5baB/HbMAiZfPpYDKqA5vWfwq+GFhNvi@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlzyXs+9KSGgPxv3BSusnIq+tP9hFf4jo7DdBgmTgJDItuqWUD
 bJy1JcIcB62LRY7HVv1NVu0AxkcDZh85NDW32ud7XxxWlpHVY/+fQ0UFj4deRNAunvYKQnayO90
 UbL1FEPqXHNzabmSywNKnDcEaSs8=
X-Google-Smtp-Source: AGHT+IHMp+plbZRqycGetRwCBLNSkhK3COtBm9zIrIcXNpCKJDsVVAgJtBgU0tKze3Xfsc6S+j87upTInjr/G7l/Utk=
X-Received: by 2002:a05:6a00:2d90:b0:71e:6650:60f7 with SMTP id
 d2e1a72fcca58-72030b6c3f1mr4524506b3a.5.1729802863037; Thu, 24 Oct 2024
 13:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <20241024162240.2398664-1-jani.nikula@intel.com>
 <20241024162240.2398664-2-jani.nikula@intel.com>
In-Reply-To: <20241024162240.2398664-2-jani.nikula@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 24 Oct 2024 16:47:31 -0400
Message-ID: <CADnq5_NuO1+BbNiQuOxWRhvbiVFptV5bcbQEAR1snS3F1JS7CQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm: remove driver date from struct drm_driver and
 all drivers
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Simon Ser <contact@emersion.fr>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 nouveau@lists.freedesktop.org, xen-devel@lists.xenproject.org
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

On Thu, Oct 24, 2024 at 12:33=E2=80=AFPM Jani Nikula <jani.nikula@intel.com=
> wrote:
>
> We stopped using the driver initialized date in commit 7fb8af6798e8
> ("drm: deprecate driver date") and (eventually) started returning "0"
> for drm_version ioctl instead.
>
> Finish the job, and remove the unused date member from struct
> drm_driver, its initialization from drivers, along with the common
> DRIVER_DATE macros.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

>
> ---
>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: nouveau@lists.freedesktop.org
> Cc: xen-devel@lists.xenproject.org
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c          | 2 --
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.h          | 1 -
>  drivers/gpu/drm/arm/display/komeda/komeda_kms.c  | 1 -
>  drivers/gpu/drm/arm/hdlcd_drv.c                  | 1 -
>  drivers/gpu/drm/arm/malidp_drv.c                 | 1 -
>  drivers/gpu/drm/armada/armada_drv.c              | 1 -
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c          | 1 -
>  drivers/gpu/drm/ast/ast_drv.c                    | 1 -
>  drivers/gpu/drm/ast/ast_drv.h                    | 1 -
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c     | 1 -
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c            | 1 -
>  drivers/gpu/drm/exynos/exynos_drm_drv.c          | 2 --
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c        | 1 -
>  drivers/gpu/drm/gma500/psb_drv.c                 | 1 -
>  drivers/gpu/drm/gma500/psb_drv.h                 | 1 -
>  drivers/gpu/drm/gud/gud_drv.c                    | 1 -
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c  | 1 -
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c  | 1 -
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c          | 2 --
>  drivers/gpu/drm/i915/i915_driver.c               | 1 -
>  drivers/gpu/drm/i915/i915_driver.h               | 1 -
>  drivers/gpu/drm/i915/i915_gpu_error.c            | 1 -
>  drivers/gpu/drm/imagination/pvr_drv.c            | 1 -
>  drivers/gpu/drm/imagination/pvr_drv.h            | 1 -
>  drivers/gpu/drm/imx/dcss/dcss-kms.c              | 1 -
>  drivers/gpu/drm/imx/ipuv3/imx-drm-core.c         | 1 -
>  drivers/gpu/drm/imx/lcdc/imx-lcdc.c              | 1 -
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c        | 1 -
>  drivers/gpu/drm/kmb/kmb_drv.c                    | 1 -
>  drivers/gpu/drm/kmb/kmb_drv.h                    | 1 -
>  drivers/gpu/drm/lima/lima_drv.c                  | 1 -
>  drivers/gpu/drm/logicvc/logicvc_drm.c            | 1 -
>  drivers/gpu/drm/loongson/lsdc_drv.c              | 2 --
>  drivers/gpu/drm/mcde/mcde_drv.c                  | 1 -
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c           | 2 --
>  drivers/gpu/drm/meson/meson_drv.c                | 1 -
>  drivers/gpu/drm/mgag200/mgag200_drv.c            | 1 -
>  drivers/gpu/drm/mgag200/mgag200_drv.h            | 1 -
>  drivers/gpu/drm/msm/msm_drv.c                    | 1 -
>  drivers/gpu/drm/mxsfb/lcdif_drv.c                | 1 -
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c                | 1 -
>  drivers/gpu/drm/nouveau/nouveau_drm.c            | 5 -----
>  drivers/gpu/drm/nouveau/nouveau_drv.h            | 1 -
>  drivers/gpu/drm/omapdrm/omap_drv.c               | 2 --
>  drivers/gpu/drm/panfrost/panfrost_drv.c          | 1 -
>  drivers/gpu/drm/panthor/panthor_drv.c            | 1 -
>  drivers/gpu/drm/pl111/pl111_drv.c                | 1 -
>  drivers/gpu/drm/qxl/qxl_drv.c                    | 1 -
>  drivers/gpu/drm/qxl/qxl_drv.h                    | 1 -
>  drivers/gpu/drm/radeon/radeon_drv.c              | 1 -
>  drivers/gpu/drm/radeon/radeon_drv.h              | 1 -
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c    | 1 -
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c     | 1 -
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 1 -
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c      | 2 --
>  drivers/gpu/drm/solomon/ssd130x.c                | 2 --
>  drivers/gpu/drm/sprd/sprd_drm.c                  | 2 --
>  drivers/gpu/drm/sti/sti_drv.c                    | 2 --
>  drivers/gpu/drm/stm/drv.c                        | 1 -
>  drivers/gpu/drm/sun4i/sun4i_drv.c                | 1 -
>  drivers/gpu/drm/tegra/drm.c                      | 2 --
>  drivers/gpu/drm/tidss/tidss_drv.c                | 1 -
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c              | 1 -
>  drivers/gpu/drm/tiny/arcpgu.c                    | 1 -
>  drivers/gpu/drm/tiny/bochs.c                     | 1 -
>  drivers/gpu/drm/tiny/cirrus.c                    | 2 --
>  drivers/gpu/drm/tiny/gm12u320.c                  | 2 --
>  drivers/gpu/drm/tiny/hx8357d.c                   | 1 -
>  drivers/gpu/drm/tiny/ili9163.c                   | 1 -
>  drivers/gpu/drm/tiny/ili9225.c                   | 1 -
>  drivers/gpu/drm/tiny/ili9341.c                   | 1 -
>  drivers/gpu/drm/tiny/ili9486.c                   | 1 -
>  drivers/gpu/drm/tiny/mi0283qt.c                  | 1 -
>  drivers/gpu/drm/tiny/ofdrm.c                     | 2 --
>  drivers/gpu/drm/tiny/panel-mipi-dbi.c            | 1 -
>  drivers/gpu/drm/tiny/repaper.c                   | 1 -
>  drivers/gpu/drm/tiny/sharp-memory.c              | 1 -
>  drivers/gpu/drm/tiny/simpledrm.c                 | 2 --
>  drivers/gpu/drm/tiny/st7586.c                    | 1 -
>  drivers/gpu/drm/tiny/st7735r.c                   | 1 -
>  drivers/gpu/drm/tve200/tve200_drv.c              | 1 -
>  drivers/gpu/drm/udl/udl_drv.c                    | 1 -
>  drivers/gpu/drm/udl/udl_drv.h                    | 1 -
>  drivers/gpu/drm/v3d/v3d_drv.c                    | 2 --
>  drivers/gpu/drm/vboxvideo/vbox_drv.c             | 1 -
>  drivers/gpu/drm/vboxvideo/vbox_drv.h             | 1 -
>  drivers/gpu/drm/vc4/vc4_drv.c                    | 3 ---
>  drivers/gpu/drm/vgem/vgem_drv.c                  | 2 --
>  drivers/gpu/drm/virtio/virtgpu_drv.c             | 1 -
>  drivers/gpu/drm/virtio/virtgpu_drv.h             | 1 -
>  drivers/gpu/drm/vkms/vkms_drv.c                  | 2 --
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c              | 1 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h              | 1 -
>  drivers/gpu/drm/xe/xe_device.c                   | 1 -
>  drivers/gpu/drm/xe/xe_drv.h                      | 1 -
>  drivers/gpu/drm/xen/xen_drm_front.c              | 1 -
>  drivers/gpu/drm/xlnx/zynqmp_kms.c                | 1 -
>  include/drm/drm_drv.h                            | 2 --
>  98 files changed, 123 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index 7273c98c3963..c5cd30797285 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2998,7 +2998,6 @@ static const struct drm_driver amdgpu_kms_driver =
=3D {
>
>         .name =3D DRIVER_NAME,
>         .desc =3D DRIVER_DESC,
> -       .date =3D DRIVER_DATE,
>         .major =3D KMS_DRIVER_MAJOR,
>         .minor =3D KMS_DRIVER_MINOR,
>         .patchlevel =3D KMS_DRIVER_PATCHLEVEL,
> @@ -3022,7 +3021,6 @@ const struct drm_driver amdgpu_partition_driver =3D=
 {
>
>         .name =3D DRIVER_NAME,
>         .desc =3D DRIVER_DESC,
> -       .date =3D DRIVER_DATE,
>         .major =3D KMS_DRIVER_MAJOR,
>         .minor =3D KMS_DRIVER_MINOR,
>         .patchlevel =3D KMS_DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.h
> index 5bc2cb661af7..2d86cc6f7f4d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.h
> @@ -40,7 +40,6 @@
>
>  #define DRIVER_NAME            "amdgpu"
>  #define DRIVER_DESC            "AMD GPU"
> -#define DRIVER_DATE            "20150101"
>
>  extern const struct drm_driver amdgpu_partition_driver;
>
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gp=
u/drm/arm/display/komeda/komeda_kms.c
> index 1e7b1fcb2848..6ed504099188 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> @@ -63,7 +63,6 @@ static const struct drm_driver komeda_kms_driver =3D {
>         .fops =3D &komeda_cma_fops,
>         .name =3D "komeda",
>         .desc =3D "Arm Komeda Display Processor driver",
> -       .date =3D "20181101",
>         .major =3D 0,
>         .minor =3D 1,
>  };
> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_=
drv.c
> index cd4389809d42..4e2d6890fb19 100644
> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
> @@ -233,7 +233,6 @@ static const struct drm_driver hdlcd_driver =3D {
>         .fops =3D &fops,
>         .name =3D "hdlcd",
>         .desc =3D "ARM HDLCD Controller DRM",
> -       .date =3D "20151021",
>         .major =3D 1,
>         .minor =3D 0,
>  };
> diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malid=
p_drv.c
> index 4cb25004b84f..cbdf2b273e75 100644
> --- a/drivers/gpu/drm/arm/malidp_drv.c
> +++ b/drivers/gpu/drm/arm/malidp_drv.c
> @@ -570,7 +570,6 @@ static const struct drm_driver malidp_driver =3D {
>         .fops =3D &fops,
>         .name =3D "mali-dp",
>         .desc =3D "ARM Mali Display Processor driver",
> -       .date =3D "20160106",
>         .major =3D 1,
>         .minor =3D 0,
>  };
> diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada=
/armada_drv.c
> index 5c26f0409478..f0ae46d27c2c 100644
> --- a/drivers/gpu/drm/armada/armada_drv.c
> +++ b/drivers/gpu/drm/armada/armada_drv.c
> @@ -45,7 +45,6 @@ static const struct drm_driver armada_drm_driver =3D {
>         .minor                  =3D 0,
>         .name                   =3D "armada-drm",
>         .desc                   =3D "Armada SoC DRM",
> -       .date                   =3D "20120730",
>         .driver_features        =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_=
ATOMIC,
>         .ioctls                 =3D armada_ioctls,
>         .num_ioctls =3D ARRAY_SIZE(armada_ioctls),
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/as=
peed/aspeed_gfx_drv.c
> index 109023815fa2..4dea5b1791b1 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -252,7 +252,6 @@ static const struct drm_driver aspeed_gfx_driver =3D =
{
>         .fops =3D &fops,
>         .name =3D "aspeed-gfx-drm",
>         .desc =3D "ASPEED GFX DRM",
> -       .date =3D "20180319",
>         .major =3D 1,
>         .minor =3D 0,
>  };
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.=
c
> index 4afe4be072ef..4c8198b76b06 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -60,7 +60,6 @@ static const struct drm_driver ast_driver =3D {
>         .fops =3D &ast_fops,
>         .name =3D DRIVER_NAME,
>         .desc =3D DRIVER_DESC,
> -       .date =3D DRIVER_DATE,
>         .major =3D DRIVER_MAJOR,
>         .minor =3D DRIVER_MINOR,
>         .patchlevel =3D DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.=
h
> index 21ce3769bf0d..6b4305ac07d4 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -43,7 +43,6 @@
>
>  #define DRIVER_NAME            "ast"
>  #define DRIVER_DESC            "AST"
> -#define DRIVER_DATE            "20120228"
>
>  #define DRIVER_MAJOR           0
>  #define DRIVER_MINOR           1
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/d=
rm/atmel-hlcdc/atmel_hlcdc_dc.c
> index 792dcc19e8e7..b6859b39e0e7 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> @@ -846,7 +846,6 @@ static const struct drm_driver atmel_hlcdc_dc_driver =
=3D {
>         .fops =3D &fops,
>         .name =3D "atmel-hlcdc",
>         .desc =3D "Atmel HLCD Controller DRM",
> -       .date =3D "20141504",
>         .major =3D 1,
>         .minor =3D 0,
>  };
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etna=
viv/etnaviv_drv.c
> index 6500f3999c5f..1d057432bf1d 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -503,7 +503,6 @@ static const struct drm_driver etnaviv_drm_driver =3D=
 {
>         .fops               =3D &fops,
>         .name               =3D "etnaviv",
>         .desc               =3D "etnaviv DRM",
> -       .date               =3D "20151214",
>         .major              =3D 1,
>         .minor              =3D 4,
>  };
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_drv.c
> index 2a466d8179f4..8c3133959147 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -35,7 +35,6 @@
>
>  #define DRIVER_NAME    "exynos"
>  #define DRIVER_DESC    "Samsung SoC DRM"
> -#define DRIVER_DATE    "20180330"
>
>  /*
>   * Interface history:
> @@ -118,7 +117,6 @@ static const struct drm_driver exynos_drm_driver =3D =
{
>         .fops                   =3D &exynos_drm_driver_fops,
>         .name   =3D DRIVER_NAME,
>         .desc   =3D DRIVER_DESC,
> -       .date   =3D DRIVER_DATE,
>         .major  =3D DRIVER_MAJOR,
>         .minor  =3D DRIVER_MINOR,
>  };
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/=
fsl-dcu/fsl_dcu_drm_drv.c
> index 91a48d774cf7..9353c35c2b1f 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> @@ -174,7 +174,6 @@ static const struct drm_driver fsl_dcu_drm_driver =3D=
 {
>         .fops                   =3D &fsl_dcu_drm_fops,
>         .name                   =3D "fsl-dcu-drm",
>         .desc                   =3D "Freescale DCU DRM",
> -       .date                   =3D "20160425",
>         .major                  =3D 1,
>         .minor                  =3D 1,
>  };
> diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/ps=
b_drv.c
> index c419ebbc49ec..c49153d31c34 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.c
> +++ b/drivers/gpu/drm/gma500/psb_drv.c
> @@ -513,7 +513,6 @@ static const struct drm_driver driver =3D {
>         .fops =3D &psb_gem_fops,
>         .name =3D DRIVER_NAME,
>         .desc =3D DRIVER_DESC,
> -       .date =3D DRIVER_DATE,
>         .major =3D DRIVER_MAJOR,
>         .minor =3D DRIVER_MINOR,
>         .patchlevel =3D DRIVER_PATCHLEVEL
> diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/ps=
b_drv.h
> index de62cbfcdc72..7f77cb2b2751 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.h
> +++ b/drivers/gpu/drm/gma500/psb_drv.h
> @@ -26,7 +26,6 @@
>
>  #define DRIVER_NAME "gma500"
>  #define DRIVER_DESC "DRM driver for the Intel GMA500, GMA600, GMA3600, G=
MA3650"
> -#define DRIVER_DATE "20140314"
>
>  #define DRIVER_MAJOR 1
>  #define DRIVER_MINOR 0
> diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.=
c
> index 09ccdc1dc1a2..f5b205776e3d 100644
> --- a/drivers/gpu/drm/gud/gud_drv.c
> +++ b/drivers/gpu/drm/gud/gud_drv.c
> @@ -381,7 +381,6 @@ static const struct drm_driver gud_drm_driver =3D {
>
>         .name                   =3D "gud",
>         .desc                   =3D "Generic USB Display",
> -       .date                   =3D "20200422",
>         .major                  =3D 1,
>         .minor                  =3D 0,
>  };
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gp=
u/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 8c488c98ac97..f4bcfbb07788 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -57,7 +57,6 @@ static const struct drm_driver hibmc_driver =3D {
>         .driver_features        =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_=
ATOMIC,
>         .fops                   =3D &hibmc_fops,
>         .name                   =3D "hibmc",
> -       .date                   =3D "20160828",
>         .desc                   =3D "hibmc drm driver",
>         .major                  =3D 1,
>         .minor                  =3D 0,
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gp=
u/drm/hisilicon/kirin/kirin_drm_ade.c
> index 5616c3917c03..2eb49177ac42 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> @@ -929,7 +929,6 @@ static const struct drm_driver ade_driver =3D {
>         DRM_FBDEV_DMA_DRIVER_OPS,
>         .name =3D "kirin",
>         .desc =3D "Hisilicon Kirin620 SoC DRM Driver",
> -       .date =3D "20150718",
>         .major =3D 1,
>         .minor =3D 0,
>  };
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hy=
perv/hyperv_drm_drv.c
> index e0953777a206..ea5e19aecff6 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> @@ -20,7 +20,6 @@
>
>  #define DRIVER_NAME "hyperv_drm"
>  #define DRIVER_DESC "DRM driver for Hyper-V synthetic video device"
> -#define DRIVER_DATE "2020"
>  #define DRIVER_MAJOR 1
>  #define DRIVER_MINOR 0
>
> @@ -31,7 +30,6 @@ static struct drm_driver hyperv_driver =3D {
>
>         .name            =3D DRIVER_NAME,
>         .desc            =3D DRIVER_DESC,
> -       .date            =3D DRIVER_DATE,
>         .major           =3D DRIVER_MAJOR,
>         .minor           =3D DRIVER_MINOR,
>
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i9=
15_driver.c
> index 365329ff8a07..1bafefb726f5 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -1785,7 +1785,6 @@ static const struct drm_driver i915_drm_driver =3D =
{
>         .fops =3D &i915_driver_fops,
>         .name =3D DRIVER_NAME,
>         .desc =3D DRIVER_DESC,
> -       .date =3D DRIVER_DATE,
>         .major =3D DRIVER_MAJOR,
>         .minor =3D DRIVER_MINOR,
>         .patchlevel =3D DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/i915/i915_driver.h b/drivers/gpu/drm/i915/i9=
15_driver.h
> index 94a70d8ec5d5..4b67ad9a61cd 100644
> --- a/drivers/gpu/drm/i915/i915_driver.h
> +++ b/drivers/gpu/drm/i915/i915_driver.h
> @@ -15,7 +15,6 @@ struct drm_printer;
>
>  #define DRIVER_NAME            "i915"
>  #define DRIVER_DESC            "Intel Graphics"
> -#define DRIVER_DATE            "20230929"
>  #define DRIVER_TIMESTAMP       1695980603
>
>  extern const struct dev_pm_ops i915_pm_ops;
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915=
/i915_gpu_error.c
> index 135ded17334e..aa3fdc231c47 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -841,7 +841,6 @@ static void __err_print_to_sgl(struct drm_i915_error_=
state_buf *m,
>         err_printf(m, "Kernel: %s %s\n",
>                    init_utsname()->release,
>                    init_utsname()->machine);
> -       err_printf(m, "Driver: %s\n", DRIVER_DATE);
>         ts =3D ktime_to_timespec64(error->time);
>         err_printf(m, "Time: %lld s %ld us\n",
>                    (s64)ts.tv_sec, ts.tv_nsec / NSEC_PER_USEC);
> diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imag=
ination/pvr_drv.c
> index 684a9b9a2247..fad7735865d3 100644
> --- a/drivers/gpu/drm/imagination/pvr_drv.c
> +++ b/drivers/gpu/drm/imagination/pvr_drv.c
> @@ -1384,7 +1384,6 @@ static struct drm_driver pvr_drm_driver =3D {
>
>         .name =3D PVR_DRIVER_NAME,
>         .desc =3D PVR_DRIVER_DESC,
> -       .date =3D PVR_DRIVER_DATE,
>         .major =3D PVR_DRIVER_MAJOR,
>         .minor =3D PVR_DRIVER_MINOR,
>         .patchlevel =3D PVR_DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/imagination/pvr_drv.h b/drivers/gpu/drm/imag=
ination/pvr_drv.h
> index 378fe477b759..7fa147312dd1 100644
> --- a/drivers/gpu/drm/imagination/pvr_drv.h
> +++ b/drivers/gpu/drm/imagination/pvr_drv.h
> @@ -9,7 +9,6 @@
>
>  #define PVR_DRIVER_NAME "powervr"
>  #define PVR_DRIVER_DESC "Imagination PowerVR (Series 6 and later) & IMG =
Graphics"
> -#define PVR_DRIVER_DATE "20230904"
>
>  /*
>   * Driver interface version:
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dc=
ss/dcss-kms.c
> index 3ec721afc30c..f1e8aea40bdd 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> @@ -33,7 +33,6 @@ static const struct drm_driver dcss_kms_driver =3D {
>         .fops                   =3D &dcss_cma_fops,
>         .name                   =3D "imx-dcss",
>         .desc                   =3D "i.MX8MQ Display Subsystem",
> -       .date                   =3D "20190917",
>         .major                  =3D 1,
>         .minor                  =3D 0,
>         .patchlevel             =3D 0,
> diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/i=
mx/ipuv3/imx-drm-core.c
> index ced06bd8eae8..87d917ae651b 100644
> --- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
> +++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
> @@ -163,7 +163,6 @@ static const struct drm_driver imx_drm_driver =3D {
>         .fops                   =3D &imx_drm_driver_fops,
>         .name                   =3D "imx-drm",
>         .desc                   =3D "i.MX DRM graphics",
> -       .date                   =3D "20120507",
>         .major                  =3D 1,
>         .minor                  =3D 0,
>         .patchlevel             =3D 0,
> diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lc=
dc/imx-lcdc.c
> index 3215c4acd675..714ca9587ec7 100644
> --- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
> +++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
> @@ -352,7 +352,6 @@ static struct drm_driver imx_lcdc_drm_driver =3D {
>         DRM_FBDEV_DMA_DRIVER_OPS,
>         .name =3D "imx-lcdc",
>         .desc =3D "i.MX LCDC driver",
> -       .date =3D "20200716",
>  };
>
>  static const struct of_device_id imx_lcdc_of_dev_id[] =3D {
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/=
ingenic/ingenic-drm-drv.c
> index 056b70b63554..c5e76e527ef9 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -953,7 +953,6 @@ static const struct drm_driver ingenic_drm_driver_dat=
a =3D {
>         .driver_features        =3D DRIVER_MODESET | DRIVER_GEM | DRIVER_=
ATOMIC,
>         .name                   =3D "ingenic-drm",
>         .desc                   =3D "DRM module for Ingenic SoCs",
> -       .date                   =3D "20200716",
>         .major                  =3D 1,
>         .minor                  =3D 1,
>         .patchlevel             =3D 0,
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.=
c
> index 0274ab9caa85..192d9f293514 100644
> --- a/drivers/gpu/drm/kmb/kmb_drv.c
> +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> @@ -445,7 +445,6 @@ static const struct drm_driver kmb_driver =3D {
>         DRM_FBDEV_DMA_DRIVER_OPS,
>         .name =3D "kmb-drm",
>         .desc =3D "KEEMBAY DISPLAY DRIVER",
> -       .date =3D DRIVER_DATE,
>         .major =3D DRIVER_MAJOR,
>         .minor =3D DRIVER_MINOR,
>  };
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.=
h
> index bf085e95b28f..1f0c10d317fe 100644
> --- a/drivers/gpu/drm/kmb/kmb_drv.h
> +++ b/drivers/gpu/drm/kmb/kmb_drv.h
> @@ -16,7 +16,6 @@
>  #define KMB_MIN_WIDTH                   1920 /*Max width in pixels */
>  #define KMB_MIN_HEIGHT                  1080 /*Max height in pixels */
>
> -#define DRIVER_DATE                    "20210223"
>  #define DRIVER_MAJOR                   1
>  #define DRIVER_MINOR                   1
>
> diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_=
drv.c
> index 10bce18b7c31..4b70c5189f7c 100644
> --- a/drivers/gpu/drm/lima/lima_drv.c
> +++ b/drivers/gpu/drm/lima/lima_drv.c
> @@ -271,7 +271,6 @@ static const struct drm_driver lima_drm_driver =3D {
>         .fops               =3D &lima_drm_driver_fops,
>         .name               =3D "lima",
>         .desc               =3D "lima DRM",
> -       .date               =3D "20191231",
>         .major              =3D 1,
>         .minor              =3D 1,
>         .patchlevel         =3D 0,
> diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logi=
cvc/logicvc_drm.c
> index e4d90701b29d..0cd5512e7dd1 100644
> --- a/drivers/gpu/drm/logicvc/logicvc_drm.c
> +++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
> @@ -52,7 +52,6 @@ static struct drm_driver logicvc_drm_driver =3D {
>         .fops                           =3D &logicvc_drm_fops,
>         .name                           =3D "logicvc-drm",
>         .desc                           =3D "Xylon LogiCVC DRM driver",
> -       .date                           =3D "20200403",
>         .major                          =3D 1,
>         .minor                          =3D 0,
>
> diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongs=
on/lsdc_drv.c
> index b350bdcf1645..0dc6afad8e54 100644
> --- a/drivers/gpu/drm/loongson/lsdc_drv.c
> +++ b/drivers/gpu/drm/loongson/lsdc_drv.c
> @@ -26,7 +26,6 @@
>  #define DRIVER_AUTHOR               "Sui Jingfeng <suijingfeng@loongson.=
cn>"
>  #define DRIVER_NAME                 "loongson"
>  #define DRIVER_DESC                 "drm driver for loongson graphics"
> -#define DRIVER_DATE                 "20220701"
>  #define DRIVER_MAJOR                1
>  #define DRIVER_MINOR                0
>  #define DRIVER_PATCHLEVEL           0
> @@ -39,7 +38,6 @@ static const struct drm_driver lsdc_drm_driver =3D {
>
>         .name =3D DRIVER_NAME,
>         .desc =3D DRIVER_DESC,
> -       .date =3D DRIVER_DATE,
>         .major =3D DRIVER_MAJOR,
>         .minor =3D DRIVER_MINOR,
>         .patchlevel =3D DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_=
drv.c
> index f60bdd7b6c13..ba6b0a09f133 100644
> --- a/drivers/gpu/drm/mcde/mcde_drv.c
> +++ b/drivers/gpu/drm/mcde/mcde_drv.c
> @@ -208,7 +208,6 @@ static const struct drm_driver mcde_drm_driver =3D {
>         .fops =3D &drm_fops,
>         .name =3D "mcde",
>         .desc =3D DRIVER_DESC,
> -       .date =3D "20180529",
>         .major =3D 1,
>         .minor =3D 0,
>         .patchlevel =3D 0,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index a4594f8873d5..d12c924661d1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -32,7 +32,6 @@
>
>  #define DRIVER_NAME "mediatek"
>  #define DRIVER_DESC "Mediatek SoC DRM"
> -#define DRIVER_DATE "20150513"
>  #define DRIVER_MAJOR 1
>  #define DRIVER_MINOR 0
>
> @@ -615,7 +614,6 @@ static const struct drm_driver mtk_drm_driver =3D {
>
>         .name =3D DRIVER_NAME,
>         .desc =3D DRIVER_DESC,
> -       .date =3D DRIVER_DATE,
>         .major =3D DRIVER_MAJOR,
>         .minor =3D DRIVER_MINOR,
>  };
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/me=
son_drv.c
> index 7cace75a38af..e035fb7ddb83 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -105,7 +105,6 @@ static const struct drm_driver meson_driver =3D {
>         .fops                   =3D &fops,
>         .name                   =3D DRIVER_NAME,
>         .desc                   =3D DRIVER_DESC,
> -       .date                   =3D "20161109",
>         .major                  =3D 1,
>         .minor                  =3D 0,
>  };
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag=
200/mgag200_drv.c
> index 97fd7eb765b4..ab46ae004a92 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -97,7 +97,6 @@ static const struct drm_driver mgag200_driver =3D {
>         .fops =3D &mgag200_driver_fops,
>         .name =3D DRIVER_NAME,
>         .desc =3D DRIVER_DESC,
> -       .date =3D DRIVER_DATE,
>         .major =3D DRIVER_MAJOR,
>         .minor =3D DRIVER_MINOR,
>         .patchlevel =3D DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag=
200/mgag200_drv.h
> index 988967eafbf2..0608fc63e588 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -25,7 +25,6 @@
>
>  #define DRIVER_NAME            "mgag200"
>  #define DRIVER_DESC            "MGA G200 SE"
> -#define DRIVER_DATE            "20110418"
>
>  #define DRIVER_MAJOR           1
>  #define DRIVER_MINOR           0
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.=
c
> index edbc1ab0fbc8..d03726fefa5e 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -910,7 +910,6 @@ static const struct drm_driver msm_driver =3D {
>         .fops               =3D &fops,
>         .name               =3D "msm",
>         .desc               =3D "MSM Snapdragon DRM",
> -       .date               =3D "20130625",
>         .major              =3D MSM_VERSION_MAJOR,
>         .minor              =3D MSM_VERSION_MINOR,
>         .patchlevel         =3D MSM_VERSION_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lc=
dif_drv.c
> index 58ccad9c425d..c27d5583fdf8 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -248,7 +248,6 @@ static const struct drm_driver lcdif_driver =3D {
>         .fops   =3D &fops,
>         .name   =3D "imx-lcdif",
>         .desc   =3D "i.MX LCDIF Controller DRM",
> -       .date   =3D "20220417",
>         .major  =3D 1,
>         .minor  =3D 0,
>  };
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mx=
sfb_drv.c
> index 34a98717b72c..0e0d3a0962f8 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -336,7 +336,6 @@ static const struct drm_driver mxsfb_driver =3D {
>         .fops   =3D &fops,
>         .name   =3D "mxsfb-drm",
>         .desc   =3D "MXSFB Controller DRM",
> -       .date   =3D "20160824",
>         .major  =3D 1,
>         .minor  =3D 0,
>  };
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouv=
eau/nouveau_drm.c
> index 107f63f08bd9..fdf90d48d5ea 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1326,11 +1326,6 @@ driver_stub =3D {
>
>         .name =3D DRIVER_NAME,
>         .desc =3D DRIVER_DESC,
> -#ifdef GIT_REVISION
> -       .date =3D GIT_REVISION,
> -#else
> -       .date =3D DRIVER_DATE,
> -#endif
>         .major =3D DRIVER_MAJOR,
>         .minor =3D DRIVER_MINOR,
>         .patchlevel =3D DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouv=
eau/nouveau_drv.h
> index 685d6ca3d8aa..55abc510067b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -7,7 +7,6 @@
>
>  #define DRIVER_NAME            "nouveau"
>  #define DRIVER_DESC            "nVidia Riva/TNT/GeForce/Quadro/Tesla/Teg=
ra K1+"
> -#define DRIVER_DATE            "20120801"
>
>  #define DRIVER_MAJOR           1
>  #define DRIVER_MINOR           4
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm=
/omap_drv.c
> index 1796cd20a877..a80e0f375a0e 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -28,7 +28,6 @@
>
>  #define DRIVER_NAME            MODULE_NAME
>  #define DRIVER_DESC            "OMAP DRM"
> -#define DRIVER_DATE            "20110917"
>  #define DRIVER_MAJOR           1
>  #define DRIVER_MINOR           0
>  #define DRIVER_PATCHLEVEL      0
> @@ -653,7 +652,6 @@ static const struct drm_driver omap_drm_driver =3D {
>         .fops =3D &omapdriver_fops,
>         .name =3D DRIVER_NAME,
>         .desc =3D DRIVER_DESC,
> -       .date =3D DRIVER_DATE,
>         .major =3D DRIVER_MAJOR,
>         .minor =3D DRIVER_MINOR,
>         .patchlevel =3D DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.c
> index 04d615df5259..fbaef3afcd66 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -636,7 +636,6 @@ static const struct drm_driver panfrost_drm_driver =
=3D {
>         .fops                   =3D &panfrost_drm_driver_fops,
>         .name                   =3D "panfrost",
>         .desc                   =3D "panfrost DRM",
> -       .date                   =3D "20180908",
>         .major                  =3D 1,
>         .minor                  =3D 3,
>
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index ac7e53f6e3f0..ad46a40ed9e1 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1505,7 +1505,6 @@ static const struct drm_driver panthor_drm_driver =
=3D {
>         .fops =3D &panthor_drm_driver_fops,
>         .name =3D "panthor",
>         .desc =3D "Panthor DRM driver",
> -       .date =3D "20230801",
>         .major =3D 1,
>         .minor =3D 2,
>
> diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl=
111_drv.c
> index 13362150b9c6..cc505790eaf3 100644
> --- a/drivers/gpu/drm/pl111/pl111_drv.c
> +++ b/drivers/gpu/drm/pl111/pl111_drv.c
> @@ -220,7 +220,6 @@ static const struct drm_driver pl111_drm_driver =3D {
>         .fops =3D &drm_fops,
>         .name =3D "pl111",
>         .desc =3D DRIVER_DESC,
> -       .date =3D "20170317",
>         .major =3D 1,
>         .minor =3D 0,
>         .patchlevel =3D 0,
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.=
c
> index 21f752644242..80118bcfd402 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.c
> +++ b/drivers/gpu/drm/qxl/qxl_drv.c
> @@ -300,7 +300,6 @@ static struct drm_driver qxl_driver =3D {
>         .num_ioctls =3D ARRAY_SIZE(qxl_ioctls),
>         .name =3D DRIVER_NAME,
>         .desc =3D DRIVER_DESC,
> -       .date =3D DRIVER_DATE,
>         .major =3D 0,
>         .minor =3D 1,
>         .patchlevel =3D 0,
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.=
h
> index 32069acd93f8..24874ff9efc9 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.h
> +++ b/drivers/gpu/drm/qxl/qxl_drv.h
> @@ -54,7 +54,6 @@ struct iosys_map;
>
>  #define DRIVER_NAME            "qxl"
>  #define DRIVER_DESC            "RH QXL"
> -#define DRIVER_DATE            "20120117"
>
>  #define DRIVER_MAJOR 0
>  #define DRIVER_MINOR 1
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon=
/radeon_drv.c
> index 23d6d1a2586d..60e1a783a476 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -604,7 +604,6 @@ static const struct drm_driver kms_driver =3D {
>
>         .name =3D DRIVER_NAME,
>         .desc =3D DRIVER_DESC,
> -       .date =3D DRIVER_DATE,
>         .major =3D KMS_DRIVER_MAJOR,
>         .minor =3D KMS_DRIVER_MINOR,
>         .patchlevel =3D KMS_DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.h b/drivers/gpu/drm/radeon=
/radeon_drv.h
> index 02a65971d140..0f3dbffc492d 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.h
> +++ b/drivers/gpu/drm/radeon/radeon_drv.h
> @@ -43,7 +43,6 @@
>
>  #define DRIVER_NAME            "radeon"
>  #define DRIVER_DESC            "ATI Radeon"
> -#define DRIVER_DATE            "20080528"
>
>  /* Interface history:
>   *
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/=
drm/renesas/rcar-du/rcar_du_drv.c
> index 4e0bafc86f50..6cf28032fc3f 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> @@ -611,7 +611,6 @@ static const struct drm_driver rcar_du_driver =3D {
>         .fops                   =3D &rcar_du_fops,
>         .name                   =3D "rcar-du",
>         .desc                   =3D "Renesas R-Car Display Unit",
> -       .date                   =3D "20130110",
>         .major                  =3D 1,
>         .minor                  =3D 0,
>  };
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/d=
rm/renesas/rz-du/rzg2l_du_drv.c
> index bbd7003335da..55ba426d9462 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -84,7 +84,6 @@ static const struct drm_driver rzg2l_du_driver =3D {
>         .fops                   =3D &rzg2l_du_fops,
>         .name                   =3D "rzg2l-du",
>         .desc                   =3D "Renesas RZ/G2L Display Unit",
> -       .date                   =3D "20230410",
>         .major                  =3D 1,
>         .minor                  =3D 0,
>  };
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/g=
pu/drm/renesas/shmobile/shmob_drm_drv.c
> index 8d3effe3f598..8d58547a6fc1 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> @@ -107,7 +107,6 @@ static const struct drm_driver shmob_drm_driver =3D {
>         .fops                   =3D &shmob_drm_fops,
>         .name                   =3D "shmob-drm",
>         .desc                   =3D "Renesas SH Mobile DRM",
> -       .date                   =3D "20120424",
>         .major                  =3D 1,
>         .minor                  =3D 0,
>  };
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/dr=
m/rockchip/rockchip_drm_drv.c
> index 585355de696b..768517cf3c6b 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -39,7 +39,6 @@
>
>  #define DRIVER_NAME    "rockchip"
>  #define DRIVER_DESC    "RockChip Soc DRM"
> -#define DRIVER_DATE    "20140818"
>  #define DRIVER_MAJOR   1
>  #define DRIVER_MINOR   0
>
> @@ -235,7 +234,6 @@ static const struct drm_driver rockchip_drm_driver =
=3D {
>         .fops                   =3D &rockchip_drm_driver_fops,
>         .name   =3D DRIVER_NAME,
>         .desc   =3D DRIVER_DESC,
> -       .date   =3D DRIVER_DATE,
>         .major  =3D DRIVER_MAJOR,
>         .minor  =3D DRIVER_MINOR,
>  };
> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/=
ssd130x.c
> index 29b2f82d81f8..dd78138605ca 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -39,7 +39,6 @@
>
>  #define DRIVER_NAME    "ssd130x"
>  #define DRIVER_DESC    "DRM driver for Solomon SSD13xx OLED displays"
> -#define DRIVER_DATE    "20220131"
>  #define DRIVER_MAJOR   1
>  #define DRIVER_MINOR   0
>
> @@ -1784,7 +1783,6 @@ static const struct drm_driver ssd130x_drm_driver =
=3D {
>         DRM_FBDEV_SHMEM_DRIVER_OPS,
>         .name                   =3D DRIVER_NAME,
>         .desc                   =3D DRIVER_DESC,
> -       .date                   =3D DRIVER_DATE,
>         .major                  =3D DRIVER_MAJOR,
>         .minor                  =3D DRIVER_MINOR,
>         .driver_features        =3D DRIVER_ATOMIC | DRIVER_GEM | DRIVER_M=
ODESET,
> diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_=
drm.c
> index a74cd0caf645..867ee2d8997f 100644
> --- a/drivers/gpu/drm/sprd/sprd_drm.c
> +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> @@ -23,7 +23,6 @@
>
>  #define DRIVER_NAME    "sprd"
>  #define DRIVER_DESC    "Spreadtrum SoCs' DRM Driver"
> -#define DRIVER_DATE    "20200201"
>  #define DRIVER_MAJOR   1
>  #define DRIVER_MINOR   0
>
> @@ -59,7 +58,6 @@ static struct drm_driver sprd_drm_drv =3D {
>
>         .name                   =3D DRIVER_NAME,
>         .desc                   =3D DRIVER_DESC,
> -       .date                   =3D DRIVER_DATE,
>         .major                  =3D DRIVER_MAJOR,
>         .minor                  =3D DRIVER_MINOR,
>  };
> diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.=
c
> index 65f180c8e8e2..78213d205b02 100644
> --- a/drivers/gpu/drm/sti/sti_drv.c
> +++ b/drivers/gpu/drm/sti/sti_drv.c
> @@ -29,7 +29,6 @@
>
>  #define DRIVER_NAME    "sti"
>  #define DRIVER_DESC    "STMicroelectronics SoC DRM"
> -#define DRIVER_DATE    "20140601"
>  #define DRIVER_MAJOR   1
>  #define DRIVER_MINOR   0
>
> @@ -143,7 +142,6 @@ static const struct drm_driver sti_driver =3D {
>
>         .name =3D DRIVER_NAME,
>         .desc =3D DRIVER_DESC,
> -       .date =3D DRIVER_DATE,
>         .major =3D DRIVER_MAJOR,
>         .minor =3D DRIVER_MINOR,
>  };
> diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
> index 478dc129d5c2..450ba6daabb3 100644
> --- a/drivers/gpu/drm/stm/drv.c
> +++ b/drivers/gpu/drm/stm/drv.c
> @@ -62,7 +62,6 @@ static const struct drm_driver drv_driver =3D {
>         .driver_features =3D DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>         .name =3D "stm",
>         .desc =3D "STMicroelectronics SoC DRM",
> -       .date =3D "20170330",
>         .major =3D 1,
>         .minor =3D 0,
>         .patchlevel =3D 0,
> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/su=
n4i_drv.c
> index 3f880d8a5666..dc17fe51f959 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@ -50,7 +50,6 @@ static const struct drm_driver sun4i_drv_driver =3D {
>         .fops                   =3D &sun4i_drv_fops,
>         .name                   =3D "sun4i-drm",
>         .desc                   =3D "Allwinner sun4i Display Engine",
> -       .date                   =3D "20150629",
>         .major                  =3D 1,
>         .minor                  =3D 0,
>
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index babcb3958f86..05f866e46bb4 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -35,7 +35,6 @@
>
>  #define DRIVER_NAME "tegra"
>  #define DRIVER_DESC "NVIDIA Tegra graphics"
> -#define DRIVER_DATE "20120330"
>  #define DRIVER_MAJOR 1
>  #define DRIVER_MINOR 0
>  #define DRIVER_PATCHLEVEL 0
> @@ -901,7 +900,6 @@ static const struct drm_driver tegra_drm_driver =3D {
>
>         .name =3D DRIVER_NAME,
>         .desc =3D DRIVER_DESC,
> -       .date =3D DRIVER_DATE,
>         .major =3D DRIVER_MAJOR,
>         .minor =3D DRIVER_MINOR,
>         .patchlevel =3D DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/ti=
dss_drv.c
> index 2428b9aaa003..f165513342a1 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -113,7 +113,6 @@ static const struct drm_driver tidss_driver =3D {
>         DRM_FBDEV_DMA_DRIVER_OPS,
>         .name                   =3D "tidss",
>         .desc                   =3D "TI Keystone DSS",
> -       .date                   =3D "20180215",
>         .major                  =3D 1,
>         .minor                  =3D 0,
>  };
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc=
/tilcdc_drv.c
> index 8c9f3705aa6c..541076167923 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> @@ -481,7 +481,6 @@ static const struct drm_driver tilcdc_driver =3D {
>         .fops               =3D &fops,
>         .name               =3D "tilcdc",
>         .desc               =3D "TI LCD Controller DRM",
> -       .date               =3D "20121205",
>         .major              =3D 1,
>         .minor              =3D 0,
>  };
> diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.=
c
> index 81abedec435d..70947571483e 100644
> --- a/drivers/gpu/drm/tiny/arcpgu.c
> +++ b/drivers/gpu/drm/tiny/arcpgu.c
> @@ -366,7 +366,6 @@ static const struct drm_driver arcpgu_drm_driver =3D =
{
>         .driver_features =3D DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>         .name =3D "arcpgu",
>         .desc =3D "ARC PGU Controller",
> -       .date =3D "20160219",
>         .major =3D 1,
>         .minor =3D 0,
>         .patchlevel =3D 0,
> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
> index 447989bb8201..2b0af6a64dc2 100644
> --- a/drivers/gpu/drm/tiny/bochs.c
> +++ b/drivers/gpu/drm/tiny/bochs.c
> @@ -671,7 +671,6 @@ static const struct drm_driver bochs_driver =3D {
>         .fops                   =3D &bochs_fops,
>         .name                   =3D "bochs-drm",
>         .desc                   =3D "bochs dispi vga interface (qemu stdv=
ga)",
> -       .date                   =3D "20130925",
>         .major                  =3D 1,
>         .minor                  =3D 0,
>         DRM_GEM_SHMEM_DRIVER_OPS,
> diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.=
c
> index f06a2be71f60..3354bd3e3611 100644
> --- a/drivers/gpu/drm/tiny/cirrus.c
> +++ b/drivers/gpu/drm/tiny/cirrus.c
> @@ -48,7 +48,6 @@
>
>  #define DRIVER_NAME "cirrus"
>  #define DRIVER_DESC "qemu cirrus vga"
> -#define DRIVER_DATE "2019"
>  #define DRIVER_MAJOR 2
>  #define DRIVER_MINOR 0
>
> @@ -657,7 +656,6 @@ static const struct drm_driver cirrus_driver =3D {
>
>         .name            =3D DRIVER_NAME,
>         .desc            =3D DRIVER_DESC,
> -       .date            =3D DRIVER_DATE,
>         .major           =3D DRIVER_MAJOR,
>         .minor           =3D DRIVER_MINOR,
>
> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u=
320.c
> index 0c17ae532fb4..c8b2be766a47 100644
> --- a/drivers/gpu/drm/tiny/gm12u320.c
> +++ b/drivers/gpu/drm/tiny/gm12u320.c
> @@ -34,7 +34,6 @@ MODULE_PARM_DESC(eco_mode, "Turn on Eco mode (less brig=
ht, more silent)");
>
>  #define DRIVER_NAME            "gm12u320"
>  #define DRIVER_DESC            "Grain Media GM12U320 USB projector displ=
ay"
> -#define DRIVER_DATE            "2019"
>  #define DRIVER_MAJOR           1
>  #define DRIVER_MINOR           0
>
> @@ -626,7 +625,6 @@ static const struct drm_driver gm12u320_drm_driver =
=3D {
>
>         .name            =3D DRIVER_NAME,
>         .desc            =3D DRIVER_DESC,
> -       .date            =3D DRIVER_DATE,
>         .major           =3D DRIVER_MAJOR,
>         .minor           =3D DRIVER_MINOR,
>
> diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8357=
d.c
> index 6b0d1846cfcf..d0e6cd13a8d2 100644
> --- a/drivers/gpu/drm/tiny/hx8357d.c
> +++ b/drivers/gpu/drm/tiny/hx8357d.c
> @@ -199,7 +199,6 @@ static const struct drm_driver hx8357d_driver =3D {
>         .debugfs_init           =3D mipi_dbi_debugfs_init,
>         .name                   =3D "hx8357d",
>         .desc                   =3D "HX8357D",
> -       .date                   =3D "20181023",
>         .major                  =3D 1,
>         .minor                  =3D 0,
>  };
> diff --git a/drivers/gpu/drm/tiny/ili9163.c b/drivers/gpu/drm/tiny/ili916=
3.c
> index 5eb39ca1a855..863565989204 100644
> --- a/drivers/gpu/drm/tiny/ili9163.c
> +++ b/drivers/gpu/drm/tiny/ili9163.c
> @@ -118,7 +118,6 @@ static struct drm_driver ili9163_driver =3D {
>         .debugfs_init           =3D mipi_dbi_debugfs_init,
>         .name                   =3D "ili9163",
>         .desc                   =3D "Ilitek ILI9163",
> -       .date                   =3D "20210208",
>         .major                  =3D 1,
>         .minor                  =3D 0,
>  };
> diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili922=
5.c
> index 875e2d09729a..43faacb254c7 100644
> --- a/drivers/gpu/drm/tiny/ili9225.c
> +++ b/drivers/gpu/drm/tiny/ili9225.c
> @@ -364,7 +364,6 @@ static const struct drm_driver ili9225_driver =3D {
>         DRM_FBDEV_DMA_DRIVER_OPS,
>         .name                   =3D "ili9225",
>         .desc                   =3D "Ilitek ILI9225",
> -       .date                   =3D "20171106",
>         .major                  =3D 1,
>         .minor                  =3D 0,
>  };
> diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili934=
1.c
> index c1dfdfbbd30c..914beb3a85c3 100644
> --- a/drivers/gpu/drm/tiny/ili9341.c
> +++ b/drivers/gpu/drm/tiny/ili9341.c
> @@ -155,7 +155,6 @@ static const struct drm_driver ili9341_driver =3D {
>         .debugfs_init           =3D mipi_dbi_debugfs_init,
>         .name                   =3D "ili9341",
>         .desc                   =3D "Ilitek ILI9341",
> -       .date                   =3D "20180514",
>         .major                  =3D 1,
>         .minor                  =3D 0,
>  };
> diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili948=
6.c
> index 7e46a720d5e2..509a412e562c 100644
> --- a/drivers/gpu/drm/tiny/ili9486.c
> +++ b/drivers/gpu/drm/tiny/ili9486.c
> @@ -177,7 +177,6 @@ static const struct drm_driver ili9486_driver =3D {
>         .debugfs_init           =3D mipi_dbi_debugfs_init,
>         .name                   =3D "ili9486",
>         .desc                   =3D "Ilitek ILI9486",
> -       .date                   =3D "20200118",
>         .major                  =3D 1,
>         .minor                  =3D 0,
>  };
> diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi028=
3qt.c
> index f1461c55dba6..5afe1ba89ffa 100644
> --- a/drivers/gpu/drm/tiny/mi0283qt.c
> +++ b/drivers/gpu/drm/tiny/mi0283qt.c
> @@ -159,7 +159,6 @@ static const struct drm_driver mi0283qt_driver =3D {
>         .debugfs_init           =3D mipi_dbi_debugfs_init,
>         .name                   =3D "mi0283qt",
>         .desc                   =3D "Multi-Inno MI0283QT",
> -       .date                   =3D "20160614",
>         .major                  =3D 1,
>         .minor                  =3D 0,
>  };
> diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
> index 220c1244b3c0..a964754d4f86 100644
> --- a/drivers/gpu/drm/tiny/ofdrm.c
> +++ b/drivers/gpu/drm/tiny/ofdrm.c
> @@ -25,7 +25,6 @@
>
>  #define DRIVER_NAME    "ofdrm"
>  #define DRIVER_DESC    "DRM driver for OF platform devices"
> -#define DRIVER_DATE    "20220501"
>  #define DRIVER_MAJOR   1
>  #define DRIVER_MINOR   0
>
> @@ -1348,7 +1347,6 @@ static struct drm_driver ofdrm_driver =3D {
>         DRM_FBDEV_SHMEM_DRIVER_OPS,
>         .name                   =3D DRIVER_NAME,
>         .desc                   =3D DRIVER_DESC,
> -       .date                   =3D DRIVER_DATE,
>         .major                  =3D DRIVER_MAJOR,
>         .minor                  =3D DRIVER_MINOR,
>         .driver_features        =3D DRIVER_ATOMIC | DRIVER_GEM | DRIVER_M=
ODESET,
> diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny=
/panel-mipi-dbi.c
> index e66729b31bd6..12bbeec80fbf 100644
> --- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> +++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> @@ -269,7 +269,6 @@ static const struct drm_driver panel_mipi_dbi_driver =
=3D {
>         .debugfs_init           =3D mipi_dbi_debugfs_init,
>         .name                   =3D "panel-mipi-dbi",
>         .desc                   =3D "MIPI DBI compatible display panel",
> -       .date                   =3D "20220103",
>         .major                  =3D 1,
>         .minor                  =3D 0,
>  };
> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repape=
r.c
> index 77944eb17b3c..031c1bcdc947 100644
> --- a/drivers/gpu/drm/tiny/repaper.c
> +++ b/drivers/gpu/drm/tiny/repaper.c
> @@ -917,7 +917,6 @@ static const struct drm_driver repaper_driver =3D {
>         DRM_FBDEV_DMA_DRIVER_OPS,
>         .name                   =3D "repaper",
>         .desc                   =3D "Pervasive Displays RePaper e-ink pan=
els",
> -       .date                   =3D "20170405",
>         .major                  =3D 1,
>         .minor                  =3D 0,
>  };
> diff --git a/drivers/gpu/drm/tiny/sharp-memory.c b/drivers/gpu/drm/tiny/s=
harp-memory.c
> index 2d2315bd6aef..5bc7339a54ac 100644
> --- a/drivers/gpu/drm/tiny/sharp-memory.c
> +++ b/drivers/gpu/drm/tiny/sharp-memory.c
> @@ -107,7 +107,6 @@ static const struct drm_driver sharp_memory_drm_drive=
r =3D {
>         DRM_FBDEV_DMA_DRIVER_OPS,
>         .name                   =3D "sharp_memory_display",
>         .desc                   =3D "Sharp Display Memory LCD",
> -       .date                   =3D "20231129",
>         .major                  =3D 1,
>         .minor                  =3D 0,
>  };
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simp=
ledrm.c
> index 3182d32f1b8f..9efa66800ca8 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -31,7 +31,6 @@
>
>  #define DRIVER_NAME    "simpledrm"
>  #define DRIVER_DESC    "DRM driver for simple-framebuffer platform devic=
es"
> -#define DRIVER_DATE    "20200625"
>  #define DRIVER_MAJOR   1
>  #define DRIVER_MINOR   0
>
> @@ -1015,7 +1014,6 @@ static struct drm_driver simpledrm_driver =3D {
>         DRM_FBDEV_SHMEM_DRIVER_OPS,
>         .name                   =3D DRIVER_NAME,
>         .desc                   =3D DRIVER_DESC,
> -       .date                   =3D DRIVER_DATE,
>         .major                  =3D DRIVER_MAJOR,
>         .minor                  =3D DRIVER_MINOR,
>         .driver_features        =3D DRIVER_ATOMIC | DRIVER_GEM | DRIVER_M=
ODESET,
> diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.=
c
> index 97013685c62f..c2ad886d9898 100644
> --- a/drivers/gpu/drm/tiny/st7586.c
> +++ b/drivers/gpu/drm/tiny/st7586.c
> @@ -295,7 +295,6 @@ static const struct drm_driver st7586_driver =3D {
>         .debugfs_init           =3D mipi_dbi_debugfs_init,
>         .name                   =3D "st7586",
>         .desc                   =3D "Sitronix ST7586",
> -       .date                   =3D "20170801",
>         .major                  =3D 1,
>         .minor                  =3D 0,
>  };
> diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735=
r.c
> index 0747ebd999cc..6b36f36b8d84 100644
> --- a/drivers/gpu/drm/tiny/st7735r.c
> +++ b/drivers/gpu/drm/tiny/st7735r.c
> @@ -160,7 +160,6 @@ static const struct drm_driver st7735r_driver =3D {
>         .debugfs_init           =3D mipi_dbi_debugfs_init,
>         .name                   =3D "st7735r",
>         .desc                   =3D "Sitronix ST7735R",
> -       .date                   =3D "20171128",
>         .major                  =3D 1,
>         .minor                  =3D 0,
>  };
> diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200=
/tve200_drv.c
> index b30340a2141d..d18289638679 100644
> --- a/drivers/gpu/drm/tve200/tve200_drv.c
> +++ b/drivers/gpu/drm/tve200/tve200_drv.c
> @@ -146,7 +146,6 @@ static const struct drm_driver tve200_drm_driver =3D =
{
>         .fops =3D &drm_fops,
>         .name =3D "tve200",
>         .desc =3D DRIVER_DESC,
> -       .date =3D "20170703",
>         .major =3D 1,
>         .minor =3D 0,
>         .patchlevel =3D 0,
> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.=
c
> index 8d8ae40f945c..8d5240ae9fa3 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -78,7 +78,6 @@ static const struct drm_driver driver =3D {
>
>         .name =3D DRIVER_NAME,
>         .desc =3D DRIVER_DESC,
> -       .date =3D DRIVER_DATE,
>         .major =3D DRIVER_MAJOR,
>         .minor =3D DRIVER_MINOR,
>         .patchlevel =3D DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.=
h
> index 1eb716d9dad5..be00dc1d87a1 100644
> --- a/drivers/gpu/drm/udl/udl_drv.h
> +++ b/drivers/gpu/drm/udl/udl_drv.h
> @@ -26,7 +26,6 @@ struct drm_mode_create_dumb;
>
>  #define DRIVER_NAME            "udl"
>  #define DRIVER_DESC            "DisplayLink"
> -#define DRIVER_DATE            "20120220"
>
>  #define DRIVER_MAJOR           0
>  #define DRIVER_MINOR           0
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.=
c
> index fb35c5c3f1a7..9d8de9146cb0 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -31,7 +31,6 @@
>
>  #define DRIVER_NAME "v3d"
>  #define DRIVER_DESC "Broadcom V3D graphics"
> -#define DRIVER_DATE "20180419"
>  #define DRIVER_MAJOR 1
>  #define DRIVER_MINOR 0
>  #define DRIVER_PATCHLEVEL 0
> @@ -248,7 +247,6 @@ static const struct drm_driver v3d_drm_driver =3D {
>
>         .name =3D DRIVER_NAME,
>         .desc =3D DRIVER_DESC,
> -       .date =3D DRIVER_DATE,
>         .major =3D DRIVER_MAJOR,
>         .minor =3D DRIVER_MINOR,
>         .patchlevel =3D DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxv=
ideo/vbox_drv.c
> index a536c467e2b2..f3800d47473b 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> @@ -189,7 +189,6 @@ static const struct drm_driver driver =3D {
>         .fops =3D &vbox_fops,
>         .name =3D DRIVER_NAME,
>         .desc =3D DRIVER_DESC,
> -       .date =3D DRIVER_DATE,
>         .major =3D DRIVER_MAJOR,
>         .minor =3D DRIVER_MINOR,
>         .patchlevel =3D DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.h b/drivers/gpu/drm/vboxv=
ideo/vbox_drv.h
> index e77bd6512eb1..dfa935f381a6 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.h
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.h
> @@ -25,7 +25,6 @@
>
>  #define DRIVER_NAME         "vboxvideo"
>  #define DRIVER_DESC         "Oracle VM VirtualBox Graphics Card"
> -#define DRIVER_DATE         "20130823"
>
>  #define DRIVER_MAJOR        1
>  #define DRIVER_MINOR        0
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.=
c
> index d47e5967592f..5ecf28f013fd 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -47,7 +47,6 @@
>
>  #define DRIVER_NAME "vc4"
>  #define DRIVER_DESC "Broadcom VC4 graphics"
> -#define DRIVER_DATE "20140616"
>  #define DRIVER_MAJOR 0
>  #define DRIVER_MINOR 0
>  #define DRIVER_PATCHLEVEL 0
> @@ -222,7 +221,6 @@ const struct drm_driver vc4_drm_driver =3D {
>
>         .name =3D DRIVER_NAME,
>         .desc =3D DRIVER_DESC,
> -       .date =3D DRIVER_DATE,
>         .major =3D DRIVER_MAJOR,
>         .minor =3D DRIVER_MINOR,
>         .patchlevel =3D DRIVER_PATCHLEVEL,
> @@ -244,7 +242,6 @@ const struct drm_driver vc5_drm_driver =3D {
>
>         .name =3D DRIVER_NAME,
>         .desc =3D DRIVER_DESC,
> -       .date =3D DRIVER_DATE,
>         .major =3D DRIVER_MAJOR,
>         .minor =3D DRIVER_MINOR,
>         .patchlevel =3D DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_=
drv.c
> index c5e3e5457737..2752ab4f1c97 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -47,7 +47,6 @@
>
>  #define DRIVER_NAME    "vgem"
>  #define DRIVER_DESC    "Virtual GEM provider"
> -#define DRIVER_DATE    "20120112"
>  #define DRIVER_MAJOR   1
>  #define DRIVER_MINOR   0
>
> @@ -121,7 +120,6 @@ static const struct drm_driver vgem_driver =3D {
>
>         .name   =3D DRIVER_NAME,
>         .desc   =3D DRIVER_DESC,
> -       .date   =3D DRIVER_DATE,
>         .major  =3D DRIVER_MAJOR,
>         .minor  =3D DRIVER_MINOR,
>  };
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virti=
o/virtgpu_drv.c
> index ffca6e2e1c9a..933e22b7dada 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -202,7 +202,6 @@ static const struct drm_driver driver =3D {
>
>         .name =3D DRIVER_NAME,
>         .desc =3D DRIVER_DESC,
> -       .date =3D DRIVER_DATE,
>         .major =3D DRIVER_MAJOR,
>         .minor =3D DRIVER_MINOR,
>         .patchlevel =3D DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virti=
o/virtgpu_drv.h
> index 64c236169db8..ccd2c8a1060b 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -45,7 +45,6 @@
>
>  #define DRIVER_NAME "virtio_gpu"
>  #define DRIVER_DESC "virtio GPU"
> -#define DRIVER_DATE "0"
>
>  #define DRIVER_MAJOR 0
>  #define DRIVER_MINOR 1
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index 2d1e95cb66e5..576d2208b548 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -34,7 +34,6 @@
>
>  #define DRIVER_NAME    "vkms"
>  #define DRIVER_DESC    "Virtual Kernel Mode Setting"
> -#define DRIVER_DATE    "20180514"
>  #define DRIVER_MAJOR   1
>  #define DRIVER_MINOR   0
>
> @@ -117,7 +116,6 @@ static const struct drm_driver vkms_driver =3D {
>
>         .name                   =3D DRIVER_NAME,
>         .desc                   =3D DRIVER_DESC,
> -       .date                   =3D DRIVER_DATE,
>         .major                  =3D DRIVER_MAJOR,
>         .minor                  =3D DRIVER_MINOR,
>  };
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.c
> index 2c46897876dd..b81179545cb9 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1634,7 +1634,6 @@ static const struct drm_driver driver =3D {
>         .fops =3D &vmwgfx_driver_fops,
>         .name =3D VMWGFX_DRIVER_NAME,
>         .desc =3D VMWGFX_DRIVER_DESC,
> -       .date =3D VMWGFX_DRIVER_DATE,
>         .major =3D VMWGFX_DRIVER_MAJOR,
>         .minor =3D VMWGFX_DRIVER_MINOR,
>         .patchlevel =3D VMWGFX_DRIVER_PATCHLEVEL
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.h
> index b21831ef214a..5275ef632d4b 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -57,7 +57,6 @@
>
>
>  #define VMWGFX_DRIVER_NAME "vmwgfx"
> -#define VMWGFX_DRIVER_DATE "20211206"
>  #define VMWGFX_DRIVER_MAJOR 2
>  #define VMWGFX_DRIVER_MINOR 20
>  #define VMWGFX_DRIVER_PATCHLEVEL 0
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 51bb9d875268..8b30e73db8de 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -278,7 +278,6 @@ static struct drm_driver driver =3D {
>         .fops =3D &xe_driver_fops,
>         .name =3D DRIVER_NAME,
>         .desc =3D DRIVER_DESC,
> -       .date =3D DRIVER_DATE,
>         .major =3D DRIVER_MAJOR,
>         .minor =3D DRIVER_MINOR,
>         .patchlevel =3D DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/xe/xe_drv.h b/drivers/gpu/drm/xe/xe_drv.h
> index d45b71426cc8..d61650d4aa0b 100644
> --- a/drivers/gpu/drm/xe/xe_drv.h
> +++ b/drivers/gpu/drm/xe/xe_drv.h
> @@ -10,7 +10,6 @@
>
>  #define DRIVER_NAME            "xe"
>  #define DRIVER_DESC            "Intel Xe Graphics"
> -#define DRIVER_DATE            "20201103"
>
>  /* Interface history:
>   *
> diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xe=
n_drm_front.c
> index 931d855bfbe8..1bda7ef606cc 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front.c
> @@ -478,7 +478,6 @@ static const struct drm_driver xen_drm_driver =3D {
>         .fops                      =3D &xen_drm_dev_fops,
>         .name                      =3D "xendrm-du",
>         .desc                      =3D "Xen PV DRM Display Unit",
> -       .date                      =3D "20180221",
>         .major                     =3D 1,
>         .minor                     =3D 0,
>
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zyn=
qmp_kms.c
> index 2452c2f09161..736df17dfc26 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> @@ -409,7 +409,6 @@ static const struct drm_driver zynqmp_dpsub_drm_drive=
r =3D {
>
>         .name                           =3D "zynqmp-dpsub",
>         .desc                           =3D "Xilinx DisplayPort Subsystem=
 Driver",
> -       .date                           =3D "20130509",
>         .major                          =3D 1,
>         .minor                          =3D 0,
>  };
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 1bbbcb8e2d23..1b6e59139e6c 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -401,8 +401,6 @@ struct drm_driver {
>         char *name;
>         /** @desc: driver description */
>         char *desc;
> -       /** @date: driver date, unused, to be removed */
> -       char *date;
>
>         /**
>          * @driver_features:
> --
> 2.39.5
>
