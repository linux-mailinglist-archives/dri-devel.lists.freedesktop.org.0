Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06149EBE38
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 23:52:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B2110E9BE;
	Tue, 10 Dec 2024 22:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bTn70sUq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE9D10E2D8;
 Tue, 10 Dec 2024 22:52:38 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2ef05d0ef18so1057073a91.0; 
 Tue, 10 Dec 2024 14:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733871158; x=1734475958; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9y1I2I1Lv//kUkxugZdreKtdIGZcLmNy7KGul5oUZkU=;
 b=bTn70sUq63d1wCdwIoOCkVFuhLq3qzayXH8IQvmA7cXfye6t0LkxIua+E+w195LS9Y
 5M5p/yGbGvnMsB7Xm+d6+cGYHtZIlT+DO0Hq5CmE0KhQcyqVsjIBDK5jxVN6ZGqQkS+S
 QexQVyaQxrhKKZJHnEACBxQz/X15/jy4LxRCJ+1m1dGl8NOPHG5iEaHSRvIdp5vAu5Xs
 yUldsPCR/0xpwU2fpDr17aeEgBdZaJazOhr/Ww4IXL1KgKwz1AC7ukPoX6irg9YekXW/
 4galknKV3ItjKZdb8bqnNUjFJYqhUOo9mQ/Kx3ut6ceV2vAAnAtfGG30i4lxG34SkbMn
 xXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733871158; x=1734475958;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9y1I2I1Lv//kUkxugZdreKtdIGZcLmNy7KGul5oUZkU=;
 b=ew3ApjUdM0cRDgkgOTh+u03SKnnBljqmhv3mn5RmiiK0hp+pt+6P5RxVtqT82UzzZa
 cjbWGl4ewQxpINqK5GtUaMhvYfHSJhSInCKDP3Zc2uuKRyaoXYUb1SgNMIOipPiA8zqe
 EO/E+kAWnkxIoVKiccs6akdEzhnFOWGkdovtpJbbWg0UxgLkGH2YoF+fAXyydMFUkyQK
 APUAtt0bKKgPHihuQnU9AGEeYJlZOcX/Q8oHJI2hg/XlrspBG1Jspioo+CeW4RaFxnK0
 ZZH1E2DkHqceWXe3SWgV8COOOLFD9SOKfB6l+QtDKLfDOXZUlT0uVddNnimoNlWpDZOM
 SgvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCTHl8hSw8SahvqaJJmQYjdZ2OvEKtTcCmURZhky/EpjLhwsim8+1Gx7SCiXhioTtzhMAw/ovzrlA=@lists.freedesktop.org,
 AJvYcCWYx8N3qHUvM1g3yC5vJQuZKBEg/uEdeSnKiKKVqz4mCuITLLdVEVTo8/IAiuLh4GmryLInwLyh30Ss@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGS/4p0EvCfpmF2Fa1KoBE1dVQYCYzoMYC06wu5hOSMlabgg5d
 2gDXe4eYYG5xvrE9+ZyS81priVhAGhtJnTMPpEUiwtDL68YSfRJPK/WvtFTX1rCa6cMEW6eGjKr
 xThkqygBtJsEXN9LXxMR1aG1jMlxmmQ==
X-Gm-Gg: ASbGnctD+hVgXwEYFZzZxCROIDJUDkcZ9QU3hoio0WOLjnT1kXCfE4/nfdZRhauJcn1
 DXMxalxxh81AyPbzVPyrdX4TClmK7iKwQW74=
X-Google-Smtp-Source: AGHT+IHEJTNOho7BUDDopkeda9yA5Z701i8CutzK0zfqoByGzrIBsEAW6Mu56ec7j9m/mz9A92VEqVBhwSBZplche6I=
X-Received: by 2002:a17:90b:1a92:b0:2ee:35a1:c291 with SMTP id
 98e67ed59e1d1-2f127fbeba0mr408351a91.3.1733871158318; Tue, 10 Dec 2024
 14:52:38 -0800 (PST)
MIME-Version: 1.0
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
In-Reply-To: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 10 Dec 2024 17:52:27 -0500
Message-ID: <CACu1E7H0-zzEPv8ytmx_9XRe1t-RCc7enshgwk2r9-0gWK44hw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Elliot Berman <quic_eberman@quicinc.com>, 
 Pavan Kondeti <quic_pkondeti@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Mon, Dec 9, 2024 at 3:20=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicinc=
.com> wrote:
>
> When kernel is booted in EL2, SECVID registers are accessible to the
> KMD. So we can use that to switch GPU's secure mode to avoid dependency
> on Zap firmware. Also, we can't load a secure firmware without a
> hypervisor that supports it.
>
> Tested following configurations on sa8775p chipset (Adreno 663 gpu):
>
> 1. Gunyah (No KVM) - Loads zap shader based on DT
> 2. KVM in VHE - Skips zap shader load and programs SECVID register
> 3. KVM in nVHE - Loads zap shader based on DT
> 4. Kernel in EL2 with CONFIG_KVM=3Dn - Skips zap shader load and
>         programs SECVID register
>
> For (1) and (3) configuration, this patch doesn't have any impact.
> Driver loads secure firmware based on other existing hints.
>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

For initializing CX_MISC_SW_FUSE_VALUE in a7xx_cx_mem_init(), we used
!qcom_scm_is_available() to assume that the register is writable
instead - can you just do that?

Connor

> ---
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 82 +++++++++++++++++++++++------=
------
>  1 file changed, 54 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 019610341df1..9dcaa8472430 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -14,6 +14,10 @@
>  #include <linux/pm_domain.h>
>  #include <linux/soc/qcom/llcc-qcom.h>
>
> +#ifdef CONFIG_ARM64
> +#include <asm/virt.h>
> +#endif
> +
>  #define GPU_PAS_ID 13
>
>  static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
> @@ -998,6 +1002,54 @@ static int a6xx_zap_shader_init(struct msm_gpu *gpu=
)
>         return ret;
>  }
>
> +static int a6xx_switch_secure_mode(struct msm_gpu *gpu)
> +{
> +       int ret;
> +
> +#ifdef CONFIG_ARM64
> +       /*
> +        * We can access SECVID_TRUST_CNTL register when kernel is booted=
 in EL2 mode. So, use it
> +        * to switch the secure mode to avoid the dependency on zap shade=
r.
> +        */
> +       if (is_kernel_in_hyp_mode())
> +               goto direct_switch;
> +#endif
> +
> +       /*
> +        * Try to load a zap shader into the secure world. If successful
> +        * we can use the CP to switch out of secure mode. If not then we
> +        * have no resource but to try to switch ourselves out manually. =
If we
> +        * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL regist=
er will
> +        * be blocked and a permissions violation will soon follow.
> +        */
> +       ret =3D a6xx_zap_shader_init(gpu);
> +       if (ret =3D=3D -ENODEV) {
> +               /*
> +                * This device does not use zap shader (but print a warni=
ng
> +                * just in case someone got their dt wrong.. hopefully th=
ey
> +                * have a debug UART to realize the error of their ways..=
.
> +                * if you mess this up you are about to crash horribly)
> +                */
> +               dev_warn_once(gpu->dev->dev,
> +                       "Zap shader not enabled - using SECVID_TRUST_CNTL=
 instead\n");
> +               goto direct_switch;
> +       } else if (ret)
> +               return ret;
> +
> +       OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
> +       OUT_RING(gpu->rb[0], 0x00000000);
> +
> +       a6xx_flush(gpu, gpu->rb[0]);
> +       if (!a6xx_idle(gpu, gpu->rb[0]))
> +               return -EINVAL;
> +
> +       return 0;
> +
> +direct_switch:
> +       gpu_write(gpu, REG_A6XX_RBBM_SECVID_TRUST_CNTL, 0x0);
> +       return 0;
> +}
> +
>  #define A6XX_INT_MASK (A6XX_RBBM_INT_0_MASK_CP_AHB_ERROR | \
>                        A6XX_RBBM_INT_0_MASK_RBBM_ATB_ASYNCFIFO_OVERFLOW |=
 \
>                        A6XX_RBBM_INT_0_MASK_CP_HW_ERROR | \
> @@ -1341,35 +1393,9 @@ static int hw_init(struct msm_gpu *gpu)
>         if (ret)
>                 goto out;
>
> -       /*
> -        * Try to load a zap shader into the secure world. If successful
> -        * we can use the CP to switch out of secure mode. If not then we
> -        * have no resource but to try to switch ourselves out manually. =
If we
> -        * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL regist=
er will
> -        * be blocked and a permissions violation will soon follow.
> -        */
> -       ret =3D a6xx_zap_shader_init(gpu);
> -       if (!ret) {
> -               OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
> -               OUT_RING(gpu->rb[0], 0x00000000);
> -
> -               a6xx_flush(gpu, gpu->rb[0]);
> -               if (!a6xx_idle(gpu, gpu->rb[0]))
> -                       return -EINVAL;
> -       } else if (ret =3D=3D -ENODEV) {
> -               /*
> -                * This device does not use zap shader (but print a warni=
ng
> -                * just in case someone got their dt wrong.. hopefully th=
ey
> -                * have a debug UART to realize the error of their ways..=
.
> -                * if you mess this up you are about to crash horribly)
> -                */
> -               dev_warn_once(gpu->dev->dev,
> -                       "Zap shader not enabled - using SECVID_TRUST_CNTL=
 instead\n");
> -               gpu_write(gpu, REG_A6XX_RBBM_SECVID_TRUST_CNTL, 0x0);
> -               ret =3D 0;
> -       } else {
> +       ret =3D a6xx_switch_secure_mode(gpu);
> +       if (!ret)
>                 return ret;
> -       }
>
>  out:
>         if (adreno_has_gmu_wrapper(adreno_gpu))
>
> ---
> base-commit: f4a867a46862c1743501bbe8c813238456ec8699
> change-id: 20241120-drm-msm-kvm-support-cd6e6744ced6
>
> Best regards,
> --
> Akhil P Oommen <quic_akhilpo@quicinc.com>
>
