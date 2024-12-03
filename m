Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB17A9E1D2F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 14:11:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A622F10E193;
	Tue,  3 Dec 2024 13:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i5jAGyE7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DDE10E193;
 Tue,  3 Dec 2024 13:11:39 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2ffdf564190so64145031fa.3; 
 Tue, 03 Dec 2024 05:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733231497; x=1733836297; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mLu545PqDQlxiRA32gSM5zrC3EABG/mkn9my0+hj+vE=;
 b=i5jAGyE7iuqMNeIU/B5g4OjP8wfoD+jU82ZKaBh8Kh6T4UMrUvH3wre4SfqN8EyMtd
 suX+B7Bfgqh5WudzCptADbSXpQ2pgz0BAvvnWfx6QErVl7C7oQaVmwKASLsqMJch49h4
 P2sbbc3d3anE/LG7oxnFxJIQxE3sjQpkZfz/ZG9cweMqrX+iAifd4ILMGMlV31G6zVbU
 RKxrvSsckJLWLony8bpcRid/qk0O67XphfOK5xD7HoYSY//gO58A5Z9XOB8YUXLMyg3a
 XO0Zc1lXVEwTx2qOQGR1Y2jnGuCoLXfGJla1yiXC2tp4EAN4m5S8DW+15Zu1B9a6d2VT
 ryGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733231497; x=1733836297;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mLu545PqDQlxiRA32gSM5zrC3EABG/mkn9my0+hj+vE=;
 b=kfxgvSMR3u+MhByU36AeM7HkYd5jjzuWHyLC50DhtpRj7WUrZlBleCLFL0CXR1ymqY
 3HReEqeSGxXsSPE/V1ip9Yo2KHiDVW9jXV7H03hFAZnwvnF3Yg5SyD8r9C/c8SBnHTEz
 FwmTfQRteEOJFcxKHWNkRePtuoHdxWQPG+8pDmXTe1iceMmlCZGhmvygghk+GyC7paBe
 iE0O3XJpLuEGnG8F7KUkLUmW5n/holcnEDwolMlqsOsaXZf+Dji0if4dKyK/6CmzzHJr
 6cCxnGS+egZIWgZfepmT98mLFK6M6e4OjV9ve1FV755LJvcvYJk82mnmyzGUpzjS1Bvy
 /IPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT5HJALgLGfm+qbG/f9HI5UbHsOndCcXZ0sV+hYSUAkisgK1RShRKmXJMs0s+HdaXqYejexvRNBfp8@lists.freedesktop.org,
 AJvYcCWi3+SwDsQRUfSlMrHbbPcJydp1IXv04DO8I8a6SF9ZuzBA7xl02M5GxINj0Bm0e64LHRs59nnUbN0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAbVgJFuo6aUlC4tIFu16xah4iiKq1BtiQur4OBXQMkkCqZJXQ
 I3Le3aXgdoJ/kKoos1B9q+Jzp06cciD1XIFtJd2GCljFRgQofluGkDhZRDyr4cUv7b6L/dRlP7s
 Ot7zGLAOacOVDeYrt5PLojxGoffexPuJD
X-Gm-Gg: ASbGncsmNwqLQtYQAXZvfaQ604RAVpgDPcoOYwc0dVLE1IB+p33CyIDokDsPUQ6uG/w
 K36wIW6GVuaF56/vFJgNEO2iaz6f2BiU=
X-Google-Smtp-Source: AGHT+IFZF/HasRFYEWJ1KdVu0ybRDr3hQa5ZiwXWxqtZSA9EIVu86JPEMjTVegsKBCDFcYq0BMh9MhkKO5fdQZ6ONMo=
X-Received: by 2002:a2e:bd84:0:b0:2ff:c016:f293 with SMTP id
 38308e7fff4ca-30009c30148mr12327951fa.15.1733231496996; Tue, 03 Dec 2024
 05:11:36 -0800 (PST)
MIME-Version: 1.0
References: <20241203095920.505018-1-dpiliaiev@igalia.com>
 <20241203095920.505018-2-dpiliaiev@igalia.com>
In-Reply-To: <20241203095920.505018-2-dpiliaiev@igalia.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 3 Dec 2024 05:11:13 -0800
Message-ID: <CAF6AEGvuG_TMSVd5i3aMR=--LJUJNRnTJNTzyesOXhZKjY8jaQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/msm: Expose uche trap base via uapi
To: Danylo Piliaiev <danylo.piliaiev@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Tue, Dec 3, 2024 at 1:59=E2=80=AFAM Danylo Piliaiev
<danylo.piliaiev@gmail.com> wrote:
>
> This adds MSM_PARAM_UCHE_TRAP_BASE that will be used by Mesa
> implementation for VK_KHR_shader_clock and GL_ARB_shader_clock.
>
> Signed-off-by: Danylo Piliaiev <dpiliaiev@igalia.com>
> ---
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  6 ++++--
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 10 ++++++----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 12 +++++++-----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  3 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
>  include/uapi/drm/msm_drm.h              |  1 +
>  6 files changed, 23 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a4xx_gpu.c
> index 50c490b492f0..f1b18a6663f7 100644
> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> @@ -251,8 +251,8 @@ static int a4xx_hw_init(struct msm_gpu *gpu)
>                 gpu_write(gpu, REG_A4XX_UCHE_CACHE_WAYS_VFD, 0x07);
>
>         /* Disable L2 bypass to avoid UCHE out of bounds errors */
> -       gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_LO, 0xffff0000);
> -       gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_HI, 0xffff0000);
> +       gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_LO, lower_32_bits(adreno_g=
pu->uche_trap_base));
> +       gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_HI, upper_32_bits(adreno_g=
pu->uche_trap_base));
>
>         gpu_write(gpu, REG_A4XX_CP_DEBUG, (1 << 25) |
>                         (adreno_is_a420(adreno_gpu) ? (1 << 29) : 0));
> @@ -693,6 +693,8 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
>         if (ret)
>                 goto fail;
>
> +       adreno_gpu->uche_trap_base =3D 0xffff0000ffff0000ull;
> +
>         if (!gpu->aspace) {
>                 /* TODO we think it is possible to configure the GPU to
>                  * restrict access to VRAM carveout.  But the required
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a5xx_gpu.c
> index ee89db72e36e..caf2c0a7a29f 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -750,10 +750,10 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>         gpu_write(gpu, REG_A5XX_UCHE_CACHE_WAYS, 0x02);
>
>         /* Disable L2 bypass in the UCHE */
> -       gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_LO, 0xFFFF0000);
> -       gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_HI, 0x0001FFFF);
> -       gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_LO, 0xFFFF0000);
> -       gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_HI, 0x0001FFFF);
> +       gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_LO, lower_32_bits(adreno_g=
pu->uche_trap_base));
> +       gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_HI, upper_32_bits(adreno_g=
pu->uche_trap_base));
> +       gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_LO, lower_32_bits(ad=
reno_gpu->uche_trap_base));
> +       gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_HI, upper_32_bits(ad=
reno_gpu->uche_trap_base));
>
>         /* Set the GMEM VA range (0 to gpu->gmem) */
>         gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MIN_LO, 0x00100000);
> @@ -1805,5 +1805,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *de=
v)
>         adreno_gpu->ubwc_config.macrotile_mode =3D 0;
>         adreno_gpu->ubwc_config.ubwc_swizzle =3D 0x7;
>
> +       adreno_gpu->uche_trap_base =3D 0x0001ffffffff0000ull;
> +
>         return gpu;
>  }
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 019610341df1..0ae29a7c8a4d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1123,12 +1123,12 @@ static int hw_init(struct msm_gpu *gpu)
>
>         /* Disable L2 bypass in the UCHE */
>         if (adreno_is_a7xx(adreno_gpu)) {
> -               gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, 0x0001fffffffff=
000llu);
> -               gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, 0x0001fff=
ffffff000llu);
> +               gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, adreno_gpu->uch=
e_trap_base);
> +               gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, adreno_gp=
u->uche_trap_base);
>         } else {
> -               gpu_write64(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX, 0x0001fff=
fffffffc0llu);
> -               gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, 0x0001fffffffff=
000llu);
> -               gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, 0x0001fff=
ffffff000llu);
> +               gpu_write64(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX, adreno_gp=
u->uche_trap_base + 0xfc0);
> +               gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, adreno_gpu->uch=
e_trap_base);
> +               gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, adreno_gp=
u->uche_trap_base);
>         }
>
>         if (!(adreno_is_a650_family(adreno_gpu) ||
> @@ -2533,6 +2533,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *de=
v)
>                 }
>         }
>
> +       adreno_gpu->uche_trap_base =3D 0x1fffffffff000ull;
> +
>         if (gpu->aspace)
>                 msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
>                                 a6xx_fault_handler);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
> index 076be0473eb5..774ff6eacb9f 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -385,6 +385,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_=
file_private *ctx,
>         case MSM_PARAM_MACROTILE_MODE:
>                 *value =3D adreno_gpu->ubwc_config.macrotile_mode;
>                 return 0;
> +       case MSM_PARAM_UCHE_TRAP_BASE:
> +               *value =3D adreno_gpu->uche_trap_base;
> +               return 0;

Maybe this should return an error on earlier gens.

Also, if possible, rebase on https://patchwork.freedesktop.org/series/14166=
7/

BR,
-R

>         default:
>                 DBG("%s: invalid param: %u", gpu->name, param);
>                 return -EINVAL;
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index e71f420f8b3a..9bd38dda4308 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -253,6 +253,8 @@ struct adreno_gpu {
>         bool gmu_is_wrapper;
>
>         bool has_ray_tracing;
> +
> +       u64 uche_trap_base;
>  };
>  #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
>
> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> index b916aab80dde..2342cb90857e 100644
> --- a/include/uapi/drm/msm_drm.h
> +++ b/include/uapi/drm/msm_drm.h
> @@ -90,6 +90,7 @@ struct drm_msm_timespec {
>  #define MSM_PARAM_RAYTRACING 0x11 /* RO */
>  #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
>  #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
> +#define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
>
>  /* For backwards compat.  The original support for preemption was based =
on
>   * a single ring per priority level so # of priority levels equals the #
> --
> 2.46.2
>
