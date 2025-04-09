Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A02A829A7
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:12:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BB310E931;
	Wed,  9 Apr 2025 15:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FrFSkFNI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B54210E931;
 Wed,  9 Apr 2025 15:12:44 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-736abdac347so584877b3a.2; 
 Wed, 09 Apr 2025 08:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744211564; x=1744816364; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=spXIMkoF1Z09BVLFL9QdSknj0ntJh/yAq4L0FidyZ90=;
 b=FrFSkFNIes6hKIDhXDprSj66k8x40YyAl395iEQnu393OfTvJx3pYhnIV7awmx8s1o
 w/6ftq/a+TCrJ6XfgvvabIiwKj1ly6SNq719LaEumjhWhQ9FadVPnNa9oiW/WN333Lib
 Beu1cqmQqcauSq3khEH9Mg9QzPfU8SwuAN4FaiR26umYRTzPS0sLfslu3ovAGrPitBgY
 fvjzmcqZdRU9nNuPZnNBstgdZnauXIOZBfA48+5i/zzd76V/hzMHJqFsmh2pO/L6KWPg
 Y1Uvuoiiv1+RgxXKzFxrYR+nEX7bP3xCQgkTEkmGTxlHbVfMelvIfHqmUuHqvLbtXXlV
 URBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744211564; x=1744816364;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=spXIMkoF1Z09BVLFL9QdSknj0ntJh/yAq4L0FidyZ90=;
 b=GV72iKC4ivzObUO7kLpjGbDOvVIefAuQ1uHGlH/iQeywbZJY5uY7K+WGE+BNk3JsrS
 Gz9FR4B9LZotOY/m0M377C3rFH3PlU7G3PHhckWcmgr6NEvW0eJF21LOT6mZxsGAh1fk
 zk/dNYy76JpUnUY1+E3Wux37JVaIq4miEYK35YY46MQXIEma8cso5BvbmnKJXipDeNEO
 WjSIE6rydTX3fm/yMJEyUDawCgazZIbkOTAIl0UhQOi59/SSFpGVKQmh9wnJFP4E32gH
 jOEdVbXWc1TW5HnqsItVeP1NQgHu1GX9D8DiPtJrz25ze3VmBDdSfGLqIhV3OM0cfYAR
 lLaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPnEQynV/GL2WffabUwavVze2lWJNfMiWOqJf04S+mw8PY0EmervM6LvxVll2KR33hCSD0B21K1Aca@lists.freedesktop.org,
 AJvYcCXd+rpyDTY/eOa+c0Qk43Ur+RKXQojC3NN6yhmQ3sgaZeLI8SqilzO4WvVHUG/14kW02RWAO+p/jUA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyc4e7b2rqA4rw5s40f+AIbxbo+K4U60hZqZc5PfZpOEQTsnvxG
 satgKRL0EzM1ZXO4orjMvMuG1ddPJMwhDewu6Ne7Z/tFdvjybA0+s8IIEoJ6+GSAj9xnd5g++VC
 RLj4ErCsPbLYMZ5jt9SnYU/7JAK4=
X-Gm-Gg: ASbGncvUdPD5w82wYOEDAcjuz+kki26Dmxe722es2AMi3vf5xThz4ZuKSgnGD1DroqF
 3sCFXkaKWhVeVMcIujVgpUuzDV0jah554roit5fuYSjqS3YeeDQtBDH/eleij6hBZFQhXAU8ybK
 u1OT6JfB3TaTWyE6F0C/n66g==
X-Google-Smtp-Source: AGHT+IGmvjw/CZ0ahGJko3AXY/wq4QVFoHwj3QvuU8T+/npoxIO1lkE99naDDV8VaKBZcMlrX9YQHA07xRRq12EhXRk=
X-Received: by 2002:a05:6a00:3c96:b0:730:8526:5db2 with SMTP id
 d2e1a72fcca58-73bae54fb51mr1430135b3a.5.1744211563880; Wed, 09 Apr 2025
 08:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <20250409-topic-smem_dramc-v1-3-94d505cd5593@oss.qualcomm.com>
In-Reply-To: <20250409-topic-smem_dramc-v1-3-94d505cd5593@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 9 Apr 2025 11:12:31 -0400
X-Gm-Features: ATxdqUHV6LVmuZ52LZQ7mUM3HFrIL30_gejAbDkXbhXaGiKJi8H-XzjJ57AVTyE
Message-ID: <CACu1E7GMf0Mx2ZX_t76h+b1CPin49LGix7c5uvoWaJZC3dKyOw@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

On Wed, Apr 9, 2025 at 10:48=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.o=
rg> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> The Highest Bank address Bit value can change based on memory type used.
>
> Attempt to retrieve it dynamically, and fall back to a reasonable
> default (the one used prior to this change) on error.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..0cc397378c99db35315209d02=
65ad9223e8b55c7 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -13,6 +13,7 @@
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/pm_domain.h>
>  #include <linux/soc/qcom/llcc-qcom.h>
> +#include <linux/soc/qcom/smem.h>
>
>  #define GPU_PAS_ID 13
>
> @@ -669,17 +670,22 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu=
 *gpu)
>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> +       u32 hbb =3D qcom_smem_dram_get_hbb();
> +       u32 ubwc_mode =3D adreno_gpu->ubwc_config.ubwc_swizzle & 1;
> +       u32 level2_swizzling_dis =3D !(adreno_gpu->ubwc_config.ubwc_swizz=
le & 2);
> +       u32 hbb_hi, hbb_lo;
> +
>         /*
>          * We subtract 13 from the highest bank bit (13 is the minimum va=
lue
>          * allowed by hw) and write the lowest two bits of the remaining =
value
>          * as hbb_lo and the one above it as hbb_hi to the hardware.
>          */
> -       BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
> -       u32 hbb =3D adreno_gpu->ubwc_config.highest_bank_bit - 13;
> -       u32 hbb_hi =3D hbb >> 2;
> -       u32 hbb_lo =3D hbb & 3;
> -       u32 ubwc_mode =3D adreno_gpu->ubwc_config.ubwc_swizzle & 1;
> -       u32 level2_swizzling_dis =3D !(adreno_gpu->ubwc_config.ubwc_swizz=
le & 2);
> +       if (hbb < 0)
> +               hbb =3D adreno_gpu->ubwc_config.highest_bank_bit;

No. The value we expose to userspace must match what we program.
You'll break VK_EXT_host_image_copy otherwise.

Connor

> +       hbb -=3D 13;
> +       BUG_ON(hbb < 0);
> +       hbb_hi =3D hbb >> 2;
> +       hbb_lo =3D hbb & 3;
>
>         gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
>                   level2_swizzling_dis << 12 |
> @@ -2467,6 +2473,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *d=
ev)
>         bool is_a7xx;
>         int ret;
>
> +       /* We need data from SMEM to retrieve HBB in set_ubwc_config() */
> +       if (!qcom_smem_is_available())
> +               return ERR_PTR(-EPROBE_DEFER);
> +
>         a6xx_gpu =3D kzalloc(sizeof(*a6xx_gpu), GFP_KERNEL);
>         if (!a6xx_gpu)
>                 return ERR_PTR(-ENOMEM);
>
> --
> 2.49.0
>
