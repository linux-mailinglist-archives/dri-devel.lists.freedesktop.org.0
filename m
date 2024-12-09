Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 224EE9E9FE5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 20:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A0510E525;
	Mon,  9 Dec 2024 19:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y+FVbG0D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5B310E525;
 Mon,  9 Dec 2024 19:55:03 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-84192e4788dso158859039f.2; 
 Mon, 09 Dec 2024 11:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733774102; x=1734378902; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IFjXl1XiaruT75EaeRKmg8rjvdRqedIGSRaEJR+tE8Q=;
 b=Y+FVbG0DkmzE9kwUSC1KfqSy9gxLJ8h2Rql6OQA7Bnz5n7a2Rz42GlAMoDlg7Fybtl
 iP2RTFmlCe/lUfujw5HI7ieNzEg1UMQgwsFMy4K+4PjvKa8AexM1IVHRV0ABYSayvBU5
 hmfgAjcZ9/HLDVJTCBv1cmHJKT04xD73X03unMned3y9b8kYtOPFMFPS/Ph/i3Gcvxta
 YZT8u/jQ3+IUxC5dxe0JDUqjEWpRd6HkQvRflt5dRqC2lH6m2V44qL4kGA8GeBw0f3jL
 J5GsU2UTCMb81iOar7ajtdy9N10ibtOeYElgxmxrmti1mYOgaBAQLVU3fcGelvFuVYje
 momA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733774102; x=1734378902;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IFjXl1XiaruT75EaeRKmg8rjvdRqedIGSRaEJR+tE8Q=;
 b=qBLWOy+r1/L/m3YKCYRioX5QHJ+K5PPisr5RMYVYQjliIKzRn7wiyw0EySG11B6eax
 qGpxoYjX5iq2HQ/dXht74sXRBBPkMHTNScixaDfOLu8lyeHeosrqv6vGZEXXsaoXRjYE
 V8njYcrVJcf+2RTRBy/TIOiYZeRmcEygMQPxbaZmGO3Nrrs0obF0WNoVRTr2c37weQV/
 qDOPbyv9VOudkFWdh2MgjUKF3nRLi6F751+cSkj0xgSBiFiNL3G+qsqwRUcn6BR874oZ
 jfnc83eWagrVelynl+kx3vUflpc/IG+dJKZmyseKBl83FZnWPrBN/x7iVYlaDlq11Bp8
 +HBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3orQSySgt8PYvqkzrt2Cvf6KWl4wmmb7e0Udnm0ytZUkRVK4cptTeoVqNvGx87GYnhxlCka+if6U=@lists.freedesktop.org,
 AJvYcCXC5lms+4mx527BvVXHofNQ7Kbu5YKhPspgA/9rXMymU49rRq6W7Rp2TeF0xCarlcvXhCj2qS95DmDe@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylszgUl1aQxH0ghNPOphWzzOHJ5R924Qw9zbOShkur7n/BuuEy
 dlOdkuasMAuyDTbhoUeyYijYg51IupKngxVffj26HqNm3bN9dhpddbz1SPNKf4xlkoaulnafxsk
 7nRL6c1bW3UXvPXbiLlLNqjhqVWg=
X-Gm-Gg: ASbGncswouUzoz9XZpmDVyxkhAGEJ8BqxMyqFO4I+Z34xLJUKdAXeTlbCpP8b+XIeta
 9au2VcRpNlNOmllohDipSWAz3JK+32lgazAldIBGqB4djnw1kDuenFpFIAXnlZg==
X-Google-Smtp-Source: AGHT+IF7/HFOaU7S7x2Uzem9wGp/+d/CGemDqVj17q17h9PETabVi9yFbXlT1iEBPQSdt5F4c+sIpjJZM+ndKUOMHVQ=
X-Received: by 2002:a05:6e02:12ec:b0:3a7:d84c:f2a0 with SMTP id
 e9e14a558f8ab-3a9dbabfdb8mr16291535ab.7.1733774102376; Mon, 09 Dec 2024
 11:55:02 -0800 (PST)
MIME-Version: 1.0
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
In-Reply-To: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 9 Dec 2024 11:54:50 -0800
Message-ID: <CAF6AEGtKfWOGpd1gMfJ96BjCqwERZzBVmj5GzmjKxw8_vmSrJg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
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

On Mon, Dec 9, 2024 at 12:20=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> When kernel is booted in EL2, SECVID registers are accessible to the
> KMD. So we can use that to switch GPU's secure mode to avoid dependency
> on Zap firmware. Also, we can't load a secure firmware without a
> hypervisor that supports it.

Shouldn't we do this based on whether zap node is in dtb (and not disabled)=
?

slbounce applies some dtb overlays to disable the zap node when
booting in EL2 (and make some other changes due to kernel being in
control of the pci smmuv3, or something along those lines).

BR,
-R

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
