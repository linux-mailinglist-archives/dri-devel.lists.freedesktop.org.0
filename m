Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3114B10000
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 07:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F5210E87A;
	Thu, 24 Jul 2025 05:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j7zbvMap";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB8910E87A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 05:40:13 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-7086dcab64bso5838757b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 22:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753335612; x=1753940412; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GdTXK8XCjL3hM90JWsv5Qt5Gibia8/wJ7klymDs9MWQ=;
 b=j7zbvMapsOBItsIGKGAiPiGEt/mdDdii7MEDmKU5nyGRJo8S3K7Zv+gKsAo+4e4Tyq
 p533AfF85ftmmsFVBV7DCQvYGQl0wAXC2P7IFD/p7g1US5iIjBqeahVlOg219AjEaid8
 vokXu4j1yDqC7rg/ZMKlW98Su/Fqjg04my3Hh85ihOFSrnQ68xINnHTHEhDW9NucnwLC
 mw55wQzlHoRKGifjBo7eUNUVtZIn2KuAPYQFpLOxjd530xz80zeT5voN+KWB4yBNuVKZ
 zUoiDq1ikInW35I4pwbSaX+NRC+/SFogmRezCID1Z1KIXgxpcMwjZKxIawVi01CusK4d
 P/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753335612; x=1753940412;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GdTXK8XCjL3hM90JWsv5Qt5Gibia8/wJ7klymDs9MWQ=;
 b=kh8mhYKKaPbiKeX4adgoMaejI2OEafjJuOQvubtjvvgJHAM4Rl+gTAheu8q++ma5if
 4MfWBDImGrvnxhRKX216+WEZ29RTBPQ0M7xpOqe+p1xtw3X9z9Pxh1AZzKYmq3JpXeaZ
 tiQKGIuV3ApYnniQwaiXJHMB6wSaR0bhx6GieaTqkZz3A6gql0ABi9eRfaO9nV/yxRWa
 GezENulx8b18iFOEM4nPH/TOvZUcGzJFxjZmS4nS+ShpfArwZatNgFibLMr61xby6xTL
 bnz+G5TtXQURpY4ysMh8dHo3lC+J6oM7yDNZTrEcd5SwhBc6ZtM30vpGrEzVsZ8545WX
 R+Mw==
X-Gm-Message-State: AOJu0YzqqRImhfC3vdMZd9d3Wd+s6lrZRta2xGZy3pJVJk1ulg96GbEV
 dthaSPabVBPzv6qzP68wgOACvpq0XHwdL0QjuZqnNvgXNfjTi/SwXzujr5Md6HuNV25Uf7qtOLK
 ntgka2DrBShVtiN84cgVHZN8hf3R/p3kC1J/7wZY=
X-Gm-Gg: ASbGncsTm+fRNy1Y3/Le9QUl5w6FRT8Zo3DY9jVZH5p2OUoPVYH6JNDBHnFHTIQ5TOB
 auuS5oujmpK/arPshIZzZgs9o55NipO6oegz2P7VLoXP7PgAhmoRdKdOyIegdTzdMCc0IdA3yhI
 GSNel+QP237Y8GRnWvBkExB3rRsiK/JJxZH6OAhdqZpZlM2fOpuXBi16HJwzjNhMf4ilEI645Z0
 PRFD2CpXw==
X-Google-Smtp-Source: AGHT+IGepFQOPMOyNUYUGUVX/Mvk8Emg1Y0NQjdN9hD4Jkz0yjdWaSsJW0rXb7wff23nsaMPJsSVN/LdK9A0Pe+A6F4=
X-Received: by 2002:a05:690c:260a:b0:70d:ed5d:b4b4 with SMTP id
 00721157ae682-719b4236d72mr78125137b3.24.1753335612137; Wed, 23 Jul 2025
 22:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250721213528.2885035-1-karunika.choo@arm.com>
 <20250721213528.2885035-5-karunika.choo@arm.com>
In-Reply-To: <20250721213528.2885035-5-karunika.choo@arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 23 Jul 2025 22:40:01 -0700
X-Gm-Features: Ac12FXx1F7rhsKQbBc59RnMIjbM7gzgzPyp5Do0qyLTNTnGSdWkbyvf-ZDMAEf8
Message-ID: <CAPaKu7S3=8UASg70E9LQcGiqKq319asOwv7pAhBEMAQgwh608Q@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] drm/panthor: Add support for Mali-Gx15 family of
 GPUs
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

On Mon, Jul 21, 2025 at 3:13=E2=80=AFPM Karunika Choo <karunika.choo@arm.co=
m> wrote:
>
> Mali-Gx15 introduces a new GPU_FEATURES register that provides
> information about GPU-wide supported features. The register value will
> be passed on to userspace via gpu_info.
>
> Additionally, Mali-Gx15 presents an 'Immortalis' naming variant
> depending on the shader core count and presence of Ray Intersection
> feature support.
>
> This patch adds:
> - support for correctly identifying the model names for Mali-Gx15 GPUs.
> - arch 11.8 FW binary support
>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_fw.c   |  1 +
>  drivers/gpu/drm/panthor/panthor_hw.c   | 15 +++++++++++++++
>  drivers/gpu/drm/panthor/panthor_regs.h |  3 +++
>  include/uapi/drm/panthor_drm.h         |  3 +++
>  4 files changed, 22 insertions(+)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panth=
or/panthor_fw.c
> index b7b454d16f12..fa6e0b48a0b2 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1404,3 +1404,4 @@ int panthor_fw_init(struct panthor_device *ptdev)
>  MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
>  MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
>  MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
> +MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panth=
or/panthor_hw.c
> index 7f138974d43b..a7583342d797 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -13,6 +13,9 @@ static char *get_gpu_model_name(struct panthor_device *=
ptdev)
>         const u32 gpu_id =3D ptdev->gpu_info.gpu_id;
>         const u32 product_id =3D GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
>                                                 GPU_PROD_MAJOR(gpu_id));
> +       const bool ray_intersection =3D !!(ptdev->gpu_info.gpu_features &
> +                                        GPU_FEATURES_RAY_INTERSECTION);
> +       const u8 shader_core_count =3D hweight64(ptdev->gpu_info.shader_p=
resent);
>
>         switch (product_id) {
>         case GPU_PROD_ID_MAKE(10, 2):
> @@ -23,6 +26,15 @@ static char *get_gpu_model_name(struct panthor_device =
*ptdev)
>                 return "Mali-G510";
>         case GPU_PROD_ID_MAKE(10, 4):
>                 return "Mali-G310";
> +       case GPU_PROD_ID_MAKE(11, 2):
> +               if (shader_core_count > 10 && ray_intersection)
> +                       return "Mali-G715-Immortalis";
> +               else if (shader_core_count >=3D 7)
> +                       return "Mali-G715";
> +
> +               fallthrough;
> +       case GPU_PROD_ID_MAKE(11, 3):
> +               return "Mali-G615";
>         }
>
>         return "(Unknown Mali GPU)";
> @@ -53,6 +65,9 @@ static void panthor_gpu_info_init(struct panthor_device=
 *ptdev)
>         ptdev->gpu_info.shader_present =3D gpu_read64(ptdev, GPU_SHADER_P=
RESENT);
>         ptdev->gpu_info.tiler_present =3D gpu_read64(ptdev, GPU_TILER_PRE=
SENT);
>         ptdev->gpu_info.l2_present =3D gpu_read64(ptdev, GPU_L2_PRESENT);
> +
> +       /* Introduced in arch 11.x */
> +       ptdev->gpu_info.gpu_features =3D gpu_read64(ptdev, GPU_FEATURES);
Is this guaranteed to be 0 prior to v11?

>  }
>
>  static void panthor_hw_info_init(struct panthor_device *ptdev)
> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/pan=
thor/panthor_regs.h
> index 48bbfd40138c..8bee76d01bf8 100644
> --- a/drivers/gpu/drm/panthor/panthor_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> @@ -70,6 +70,9 @@
>  #define GPU_PWR_OVERRIDE0                              0x54
>  #define GPU_PWR_OVERRIDE1                              0x58
>
> +#define GPU_FEATURES                                   0x60
> +#define   GPU_FEATURES_RAY_INTERSECTION                        BIT(2)
> +
>  #define GPU_TIMESTAMP_OFFSET                           0x88
>  #define GPU_CYCLE_COUNT                                        0x90
>  #define GPU_TIMESTAMP                                  0x98
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_dr=
m.h
> index e1f43deb7eca..467d365ed7ba 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -327,6 +327,9 @@ struct drm_panthor_gpu_info {
>
>         /** @pad: MBZ. */
>         __u32 pad;
> +
> +       /** @gpu_features: Bitmask describing supported GPU-wide features=
 */
> +       __u64 gpu_features;
>  };
>
>  /**
> --
> 2.49.0
>
