Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 340F8AD46BD
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 01:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D7110E2DC;
	Tue, 10 Jun 2025 23:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dgzOnPss";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAAE10E314
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 23:33:08 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-70e3e0415a7so4151537b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 16:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749598387; x=1750203187; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QlG8KwxfPBX8caQBZm1QvHCHRc2s6v2Ip6KIurSeMk4=;
 b=dgzOnPssqLM44CPZbTWe0Gfx6GdESl/qE4FP5L9+v+ogz1GJMJnRI1Jmjay46Iwb6Z
 JbvTQf2FlsCIyieACtIL8YyvcmIdRBCw6ZInK78w5z7H8cSgMHEdV/vWU/rJKmAOK2Is
 lNOKpQrZIolkSWmTImKwjcpzvRy75ZXG2Yjk5H2KxZu3k/xfPqg7PXItNqjIY++4puTu
 MxL9ohXj9Q30E94VD9vBPIr7fEwlzlSKqhFFM3qp5gEQSRHotS0OaoKTJoM/WGkdy5hF
 LC/pO3cxxkn5mXozB437RPFfJK8mlrylfrY3TcXnuFs69kSjZPcr54664LR4sK7L5h0z
 Qq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749598387; x=1750203187;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QlG8KwxfPBX8caQBZm1QvHCHRc2s6v2Ip6KIurSeMk4=;
 b=j4hifbtY8Nc630j904C2ZxQ7AMHHpnpxY8DmxZ+yWd2gaRE50gkfOKcFoLT/CsYU6U
 QAuFwInUQqErG1uQAmq9eyS66u/RShRl7ESG7V8GWDcrzZjkOUnWxBXXq0zJJ/jqQTfa
 iX1M43dCQ6fGfHpHpmVFuETnEnTsurVnWaY89angBPok6oAxeIMw6CXGRVEOKohsdMjG
 aOSu4d9RcICmNa6blc8flTF3P3MOpGHdhT/R3npuVs4SGQRKmmNJVxC9b19uBq9B1irs
 QGIF0a0FHc6FFmZo5RREuDfqakG/Fp4CNHhSQTP9hkFcgPHhz6S10G+KP3n9ZIeANr4B
 HGDg==
X-Gm-Message-State: AOJu0YzlwhfHnpYF5rBLG93RyQrGAzHn33FcZx7sGjIuxbVLYnZl2nZH
 TtwiEY98zvQHLBlGrGkFlZHerdAAcXT7Dxq0vXrDNvO838XUphmvMGSehfjs5IfXAvb1RzVWb3K
 LJ0pjFbCvbc3GRo5BYIvEyx+taImYuAA=
X-Gm-Gg: ASbGnctoBJzE/ijGlpV11oW9PXLAJaL6dzc1gWsQa8cSghgMmIeheMJww2Vwt20UJNt
 xHyXZT4UlCDGWBepXFHKHbIRtkk4uMDtmeYnd20exEMZ6TSkwgvbgiSMQd8VjGax4yjezqf5Vmg
 pp04uO/yCg3AARdRmEZz0YUUS/fvP05kcSnPeg4xADx+1Lzdl8/zbApko09xfQ0uibu4KzlULfQ
 o3k
X-Google-Smtp-Source: AGHT+IGVrr9uX5LKYo7QPgj60De7se7ytrmqfvIsOMv3rt1Jnm8vWg4Kull3rCOJt0sC5X+Ks7kUo+LohLVoNkEu+iw=
X-Received: by 2002:a05:690c:6d02:b0:70d:8e1f:ec2b with SMTP id
 00721157ae682-71140a03d6cmr20654027b3.6.1749598387571; Tue, 10 Jun 2025
 16:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250602143216.2621881-1-karunika.choo@arm.com>
 <20250602143216.2621881-4-karunika.choo@arm.com>
In-Reply-To: <20250602143216.2621881-4-karunika.choo@arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 10 Jun 2025 16:32:56 -0700
X-Gm-Features: AX0GCFvOCbEP8MnPbQ6VEYV4dkCIrXnlZn4I2acKhzd06nQBGDO0OcRQYsCgnt0
Message-ID: <CAPaKu7T5Rf+N-T7f-Vh0tB72AdDWx+nipqGjfWDnvDk=sOosGA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] drm/panthor: Simplify getting the GPU model name
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

On Mon, Jun 2, 2025 at 8:16=E2=80=AFAM Karunika Choo <karunika.choo@arm.com=
> wrote:
>
> This patch replaces the panthor_model structure with a simple switch
> case based on the product_id which is in the format of:
>         ((arch_major << 24) | product_major)
>
> This simplifies comparison and allows extending of the function to
> accommodate naming differences based on supported GPU features.
>
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_hw.c   | 63 +++++++-------------------
>  drivers/gpu/drm/panthor/panthor_regs.h |  2 +
>  2 files changed, 19 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panth=
or/panthor_hw.c
> index 576cda231c1c..421f84fde7d0 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
<snipped>
>  static void panthor_hw_info_init(struct panthor_device *ptdev)
>  {
> -       const struct panthor_model *model;
> -       u32 arch_major, product_major;
> +       const char *gpu_model_name =3D get_gpu_model_name(ptdev);
Move this to after panthor_gpu_info_init below.

We want to init gpu info before dumping it in general.  And in fact,
get_gpu_model_name will depend on gpu_features/shader_present in a
later patch so this is a real bug.
>         u32 major, minor, status;
>
>         panthor_gpu_info_init(ptdev);
>
> -       arch_major =3D GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
> -       product_major =3D GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
>         major =3D GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
>         minor =3D GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
>         status =3D GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
>
> -       for (model =3D gpu_models; model->name; model++) {
> -               if (model->arch_major =3D=3D arch_major &&
> -                   model->product_major =3D=3D product_major)
> -                       break;
> -       }
> -
>         drm_info(&ptdev->base,
> -                "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
> -                model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
> +                "%s id 0x%x major 0x%x minor 0x%x status 0x%x",
> +                gpu_model_name, ptdev->gpu_info.gpu_id >> 16,
>                  major, minor, status);
>
>         drm_info(&ptdev->base,
> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/pan=
thor/panthor_regs.h
> index 48bbfd40138c..e7a81686afdb 100644
> --- a/drivers/gpu/drm/panthor/panthor_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> @@ -19,6 +19,8 @@
>  #define   GPU_VER_MINOR(x)                             (((x) & GENMASK(1=
1, 4)) >> 4)
>  #define   GPU_VER_STATUS(x)                            ((x) & GENMASK(3,=
 0))
>
> +#define GPU_PROD_ID_MAKE(arch_major, prod_major)       (((arch_major) <<=
 24) | (prod_major))
This macro has no hw significance and is only used to decide the model
conveniently.  It should be moved to panthor_hw.c.


>  #define GPU_L2_FEATURES                                        0x4
>  #define  GPU_L2_FEATURES_LINE_SIZE(x)                  (1 << ((x) & GENM=
ASK(7, 0)))
>
> --
> 2.49.0
>
