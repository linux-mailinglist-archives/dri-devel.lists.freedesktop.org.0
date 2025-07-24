Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FD3B10049
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 07:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2938C10E87B;
	Thu, 24 Jul 2025 05:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OZUOmWBC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701D210E87B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 05:56:58 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e8bd2eaf8ccso456744276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 22:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753336617; x=1753941417; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lUUmH3r0IppoSe6UIs4TMAPkQKjDXvL6AQC/64B+fQA=;
 b=OZUOmWBCIWfjBI4jurtAVbE6Zq6L1SRtLMMWKzwSGJbGbOzonfDVxsGDOgzSPGybxF
 sleW+1fDAVDFiUF1ER3BeNhxLgUPIZDBkrXFowlcjBTToh0Ey77bm0w6/4UsIYerDxv2
 Wi1Z7vFYOPM2TUPGK2MafutU80CgnIXM+pzp4zAtzsqBmR63JXfq3zuRDihZNMS/FljR
 uO3euyIGFhkJMMdN21nlqxjvm692GQ+jN/bA4TKGIb5H4753OnhHI8z5B+pTBFOFthNR
 aZqp4OdW4qXMhw+gsy3ltSku9uN19O7jKyjg5NyRiBPW4ym1kFZwPMQ8plOODlGRKS3F
 3YLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753336617; x=1753941417;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lUUmH3r0IppoSe6UIs4TMAPkQKjDXvL6AQC/64B+fQA=;
 b=e4lwj1Y0i4NM78tey40nk+V3ONedzN9E9a1OOkU6veEs9cUSuX+MUSV844ZzJ8HYOZ
 JBVBGvMHZGOCOA1pxMEpvEqlnuM8GpmJ2sKKGbr2XWsS8N4u8McbxOpwPsQqjE9JBeNb
 70xhVTpgO+TInIkqy6jux4POV7h/p68/h2q9Vg+q35WX3ZN3yqFhJ416nDu/ASXSCDms
 caFtLvqZZrT2/uMptDp9DMv17xY4aF7i0BW80dgc2GYRMqB/JBX1z8StYNKbC9XM5aj0
 fgYNLegGqd6J6JkLK93aSITEPmGNEcr4hgZDXc7Lw5zt/RKWkVkD4VmZ4oyGQOHNIbE4
 JA4Q==
X-Gm-Message-State: AOJu0YwacGjqxXDst4Qz32WFt3GvTOSMv+2SG/E7+KxUv0ns/JuPM2Bw
 eUr/HFg/nNrLQWY9FuB5pRG9suGDM3oxRUQAsXmUE4XwUzRyxDKeqegdJZK7ziuRwHwIXmWQ1b7
 vDzSYYft23qUamndRvZu1HwQ21+eI0iY=
X-Gm-Gg: ASbGncs18v+olQCZRIJcO5vfk4iIdSFzbpqb/pz7/33DOeoniKWVOXB4ZNKbk8deY+7
 mkXVSZC5FCNDraO+Agbu9te60UCAlP8JQCUURFKl9qOSLZOuZHEDCWprfVWUqQi2q+uLzOMrE/a
 sDrMlXH1GM3bt5d5nKup73Ol1OzTyzVjHb81SlIhGSg54Myu99Z7Q+NkaxXuOtkcde/BYKpa/NN
 ucUAUdSEA==
X-Google-Smtp-Source: AGHT+IExzAwMs1D0O08I2NO5mk0zHf1nq1Spna9+UCqbNjnniNoSoovHWHDbyyMgphrVdcQ9QAGOP6S3k9twQ77Q5Mk=
X-Received: by 2002:a05:690c:6a13:b0:714:349:5829 with SMTP id
 00721157ae682-719b41459femr63999837b3.5.1753336617220; Wed, 23 Jul 2025
 22:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250721213528.2885035-1-karunika.choo@arm.com>
 <20250721213528.2885035-7-karunika.choo@arm.com>
In-Reply-To: <20250721213528.2885035-7-karunika.choo@arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 23 Jul 2025 22:56:46 -0700
X-Gm-Features: Ac12FXwUMItf8agrwM8xQOJEpaaME3UWShHH7ZJpeqhh3bW_xOpFUmP05ifOtJY
Message-ID: <CAPaKu7QV=XivzwzHGwaPMXQ9yr-zkuAwF9+MmuVPzTNDBwS+xw@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] drm/panthor: Add support for Mali-Gx20 and
 Mali-Gx25 GPUs
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
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

On Mon, Jul 21, 2025 at 3:53=E2=80=AFPM Karunika Choo <karunika.choo@arm.co=
m> wrote:
>
> This patch adds firmware binary and GPU model naming support for
> Mali-Gx20 and Mali-Gx25 GPUs.
>
> The GPU_COHERENCY_FEATURES macros are slightly reworked as the
> assumption that FEATURE =3D BIT(PROTOCOL) no longer holds with the
> introduction of the SHAREABLE_CACHE_SUPPORT, which is BIT(5) on the
> GPU_COHERENCY_PROTOCOL register. As such, the feature bits are now
> individually defined. Further changes were also made to enable
> SHAREABLE_CACHE_SUPPORT if coherency is enabled and the feature is
> supported.
>
> This patch also fixes a minor bug that incorrectly writes ACE instead of
> ACE_LITE to GPU_COHERENCY_PROTOCOL if coherency is enabled.
>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c |  2 +-
>  drivers/gpu/drm/panthor/panthor_fw.c     |  2 ++
>  drivers/gpu/drm/panthor/panthor_gpu.c    | 14 ++++++++++++--
>  drivers/gpu/drm/panthor/panthor_hw.c     | 18 ++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_regs.h   |  5 ++++-
>  5 files changed, 37 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/p=
anthor/panthor_device.c
> index 81df49880bd8..f547aa4159ec 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -34,7 +34,7 @@ static int panthor_gpu_coherency_init(struct panthor_de=
vice *ptdev)
>          * ACE protocol has never been supported for command stream front=
end GPUs.
>          */
>         if ((gpu_read(ptdev, GPU_COHERENCY_FEATURES) &
> -                     GPU_COHERENCY_PROT_BIT(ACE_LITE)))
> +            GPU_COHERENCY_FEATURE_ACE_LITE))
Replace gpu_read by ptdev->gpu_info.coherency_features.
>                 return 0;
>
>         drm_err(&ptdev->base, "Coherency not supported by the device");
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panth=
or/panthor_fw.c
> index fa6e0b48a0b2..9bf06e55eaee 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1405,3 +1405,5 @@ MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin")=
;
>  MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
>  MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
>  MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
> +MODULE_FIRMWARE("arm/mali/arch12.8/mali_csffw.bin");
> +MODULE_FIRMWARE("arm/mali/arch13.8/mali_csffw.bin");
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/pant=
hor/panthor_gpu.c
> index 5e2c3173ae27..df2419706fe0 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -45,8 +45,18 @@ struct panthor_gpu {
>
>  static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
>  {
> -       gpu_write(ptdev, GPU_COHERENCY_PROTOCOL,
> -               ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_=
COHERENCY_NONE);
> +       u32 coherency_protocol =3D GPU_COHERENCY_NONE;
> +
> +       if (ptdev->coherent) {
> +               coherency_protocol =3D GPU_COHERENCY_ACE_LITE;
> +
> +               if ((gpu_read(ptdev, GPU_COHERENCY_FEATURES) &
> +                    GPU_COHERENCY_FEATURE_SHAREABLE_CACHE_SUPPORT))
Replace gpu_read by ptdev->gpu_info.coherency_features.
> +                       coherency_protocol |=3D
> +                               GPU_COHERENCY_SHAREABLE_CACHE_SUPPORT;
> +       }
> +
> +       gpu_write(ptdev, GPU_COHERENCY_PROTOCOL, coherency_protocol);
>  }
>
>  static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 st=
atus)
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panth=
or/panthor_hw.c
> index a7583342d797..3fcb69a6f959 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -35,6 +35,24 @@ static char *get_gpu_model_name(struct panthor_device =
*ptdev)
>                 fallthrough;
>         case GPU_PROD_ID_MAKE(11, 3):
>                 return "Mali-G615";
> +       case GPU_PROD_ID_MAKE(12, 0):
> +               if (shader_core_count >=3D 10 && ray_intersection)
> +                       return "Mali-G720-Immortalis";
> +               else if (shader_core_count >=3D 6)
> +                       return "Mali-G720";
> +
> +               fallthrough;
> +       case GPU_PROD_ID_MAKE(12, 1):
> +               return "Mali-G620";
> +       case GPU_PROD_ID_MAKE(13, 0):
> +               if (shader_core_count >=3D 10 && ray_intersection)
> +                       return "Mali-G925-Immortalis";
> +               else if (shader_core_count >=3D 6)
> +                       return "Mali-G725";
> +
> +               fallthrough;
> +       case GPU_PROD_ID_MAKE(13, 1):
> +               return "Mali-G625";
>         }
>
>         return "(Unknown Mali GPU)";
> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/pan=
thor/panthor_regs.h
> index 8bee76d01bf8..1beb365c0fec 100644
> --- a/drivers/gpu/drm/panthor/panthor_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> @@ -111,12 +111,15 @@
>  #define GPU_REVID                                      0x280
>
>  #define GPU_COHERENCY_FEATURES                         0x300
> -#define GPU_COHERENCY_PROT_BIT(name)                   BIT(GPU_COHERENCY=
_  ## name)
> +#define   GPU_COHERENCY_FEATURE_ACE_LITE               BIT(0)
> +#define   GPU_COHERENCY_FEATURE_ACE                    BIT(1)
> +#define   GPU_COHERENCY_FEATURE_SHAREABLE_CACHE_SUPPORT        BIT(5)
>
>  #define GPU_COHERENCY_PROTOCOL                         0x304
>  #define   GPU_COHERENCY_ACE_LITE                       0
>  #define   GPU_COHERENCY_ACE                            1
>  #define   GPU_COHERENCY_NONE                           31
> +#define   GPU_COHERENCY_SHAREABLE_CACHE_SUPPORT                BIT(5)
>
>  #define MCU_CONTROL                                    0x700
>  #define MCU_CONTROL_ENABLE                             1
> --
> 2.49.0
>
