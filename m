Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1B7A82AD6
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4989D10E27D;
	Wed,  9 Apr 2025 15:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W035egiv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0F810E06E;
 Wed,  9 Apr 2025 15:44:23 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7393eab4a75so866411b3a.2; 
 Wed, 09 Apr 2025 08:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744213463; x=1744818263; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pzRTGH1ny0vv7Ey4MKuvYlccmkZb3G5nEDPJcfHDxZg=;
 b=W035egivoC+iBYkFVT8LNOwZvmBIXKo2KLrIzjQ/dSk+TCNLobeoD/MSh+58wvF6Bo
 Uy2alV6fY9DEkVGI/tFmdHp/51ZWtXWC5/0vnt6kBaPe6lXUr8qvB7mQzBemXzFTIpi+
 0J5LASSJrnkidn4WqWAS9JD3uDzCUtY50k9zSHgJYEwTWgG6cjm1OGwx4Om401hGcwLK
 rOFxSZgvPQwVABxl1wAoQjKYjmf7LnWgTEH8K/pSJXOX/edaENmNIo+KUYcxg3UgzPE/
 /XA8G8KddO1XWj1UjgWLKS19zKj/HbvTpEwsEiL7RBPF1QjY8z1OnWVffiqQ9PWXnqpd
 vdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744213463; x=1744818263;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pzRTGH1ny0vv7Ey4MKuvYlccmkZb3G5nEDPJcfHDxZg=;
 b=jMr4KLkd4XKvkjzEnFTYt1Ve/Dt7GreUzS8th/6xjSTaNK4hpD57o22vDU51Zxe3Wo
 L1KPIvgGrRpWi86b68Sc5ZNODWRobgCrcFxMAV3AypyuOhWduH6RUSgAV8rnoHItCMLQ
 TzlkDIJR0fbF9yFk7JrZGXU8xeWAu7HQKY0+u4tgr1+82vFMSe517J3V811pCw2IpK8e
 lkt3o4USJThdHWt6J60UEi5tHBSG99BB+JrP7NYTa+faGye0kRdc9JJ2OM2cBHWg7KyN
 JyHJflFiuoRlKVuToPmlhTPSleRIXvfHEPpazqm7q1Q88EXUw4YjLkbgNWTIIWH4oC5D
 GdGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ0NgzxOY97gh5hPlg0MbNIvBhc7t8tJwZeS5XQzkwivuHMARZjv1MKBqmxacZ/bqfvEjzUDTV/YA=@lists.freedesktop.org,
 AJvYcCVGheSreWc2QKBdaCZrQHa1G9IV7dM7L9DFtjLo9Hu6uHeWW0Vh4IDMVpDiaKrP+d2CTK6d+5jH1vHP@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwW9db3pLCgTJ72UG8h/vbgj6I2Psg6J8uyF5enWZuMpPt0E4RC
 NApBLyfYFg2RzbH1MMxKn/NAonajPbX75MDuZG0i85ts26aWSGLPZk4DPND6vCFGVW34sNiJdrP
 kPrAChx7n72186h6ERc7zlYFj5RE=
X-Gm-Gg: ASbGncscEB42U2HArWGNmP9mLIeJyteaMStB9bEdj1eZDP9TTmkcrhhfdXlj09CmFvB
 c7vmkedWLgxvbyI9Gt55wWnwz6YQQIRX4qCR+imQW4jj6b1FL95BNboYnKEzeZUFupxd86obUvp
 KFNhf6L5Vxpw0BFdQb2Hw6Xw==
X-Google-Smtp-Source: AGHT+IF5oThqq2ezhfnJ6WCfpy2FnPDcHZNg2MdPGxfC5acUPxiGFCloLJ76HFGANCkrc6gQf5RcO2ZdqDZ2EJeWKG4=
X-Received: by 2002:a05:6a00:2410:b0:730:87b2:e848 with SMTP id
 d2e1a72fcca58-73bae54d12amr1658559b3a.5.1744213462627; Wed, 09 Apr 2025
 08:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <20250409-topic-smem_dramc-v1-3-94d505cd5593@oss.qualcomm.com>
 <CACu1E7GMf0Mx2ZX_t76h+b1CPin49LGix7c5uvoWaJZC3dKyOw@mail.gmail.com>
 <c2dac38b-bbe5-4cd1-9d33-b4bba629d54b@oss.qualcomm.com>
 <CACu1E7F71M0Z5KUdArRYbLEMXoS3jQEtp=0-4LEYFRysOsYZfA@mail.gmail.com>
 <9a12e042-487b-4937-a583-709f0c37ab12@oss.qualcomm.com>
In-Reply-To: <9a12e042-487b-4937-a583-709f0c37ab12@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 9 Apr 2025 11:44:11 -0400
X-Gm-Features: ATxdqUESO1yUGm43W-4aJ0p1YKGgK-hvQNegRseX9b5IIsphXiy86aIo60d1HwI
Message-ID: <CACu1E7Hto_Ms3RxQjXXYB+RB+FC5n1VFtohKbe4EzKWgEk9uiQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org, 
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

On Wed, Apr 9, 2025 at 11:40=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/9/25 5:30 PM, Connor Abbott wrote:
> > On Wed, Apr 9, 2025 at 11:22=E2=80=AFAM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 4/9/25 5:12 PM, Connor Abbott wrote:
> >>> On Wed, Apr 9, 2025 at 10:48=E2=80=AFAM Konrad Dybcio <konradybcio@ke=
rnel.org> wrote:
> >>>>
> >>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>
> >>>> The Highest Bank address Bit value can change based on memory type u=
sed.
> >>>>
> >>>> Attempt to retrieve it dynamically, and fall back to a reasonable
> >>>> default (the one used prior to this change) on error.
> >>>>
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 22 ++++++++++++++++------
> >>>>  1 file changed, 16 insertions(+), 6 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm=
/msm/adreno/a6xx_gpu.c
> >>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..0cc397378c99db353152=
09d0265ad9223e8b55c7 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>> @@ -13,6 +13,7 @@
> >>>>  #include <linux/firmware/qcom/qcom_scm.h>
> >>>>  #include <linux/pm_domain.h>
> >>>>  #include <linux/soc/qcom/llcc-qcom.h>
> >>>> +#include <linux/soc/qcom/smem.h>
> >>>>
> >>>>  #define GPU_PAS_ID 13
> >>>>
> >>>> @@ -669,17 +670,22 @@ static void a6xx_calc_ubwc_config(struct adren=
o_gpu *gpu)
> >>>>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
> >>>>  {
> >>>>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> >>>> +       u32 hbb =3D qcom_smem_dram_get_hbb();
> >>>> +       u32 ubwc_mode =3D adreno_gpu->ubwc_config.ubwc_swizzle & 1;
> >>>> +       u32 level2_swizzling_dis =3D !(adreno_gpu->ubwc_config.ubwc_=
swizzle & 2);
> >>>> +       u32 hbb_hi, hbb_lo;
> >>>> +
> >>>>         /*
> >>>>          * We subtract 13 from the highest bank bit (13 is the minim=
um value
> >>>>          * allowed by hw) and write the lowest two bits of the remai=
ning value
> >>>>          * as hbb_lo and the one above it as hbb_hi to the hardware.
> >>>>          */
> >>>> -       BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
> >>>> -       u32 hbb =3D adreno_gpu->ubwc_config.highest_bank_bit - 13;
> >>>> -       u32 hbb_hi =3D hbb >> 2;
> >>>> -       u32 hbb_lo =3D hbb & 3;
> >>>> -       u32 ubwc_mode =3D adreno_gpu->ubwc_config.ubwc_swizzle & 1;
> >>>> -       u32 level2_swizzling_dis =3D !(adreno_gpu->ubwc_config.ubwc_=
swizzle & 2);
> >>>> +       if (hbb < 0)
> >>>> +               hbb =3D adreno_gpu->ubwc_config.highest_bank_bit;
> >>>
> >>> No. The value we expose to userspace must match what we program.
> >>> You'll break VK_EXT_host_image_copy otherwise.
> >>
> >> I didn't know that was exposed to userspace.
> >>
> >> The value must be altered either way - ultimately, the hardware must
> >> receive the correct information. ubwc_config doesn't seem to be const,
> >> so I can edit it there if you like it better.
> >>
> >> Konrad
> >
> > Yes, you should be calling qcom_smem_dram_get_hbb() in
> > a6xx_calc_ubwc_config(). You can already see there's a TODO there to
> > plug it in.
>
> Does this look good instead?
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 0cc397378c99..ae8dbc250e6a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -588,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>
>  static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>  {
> +       u8 hbb;

You can't make it u8 and then test for a negative value on error.
Other than that, looks good.

Connor

> +
>         gpu->ubwc_config.rgb565_predicator =3D 0;
>         gpu->ubwc_config.uavflagprd_inv =3D 0;
>         gpu->ubwc_config.min_acc_len =3D 0;
> @@ -636,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *=
gpu)
>             adreno_is_a690(gpu) ||
>             adreno_is_a730(gpu) ||
>             adreno_is_a740_family(gpu)) {
> -               /* TODO: get ddr type from bootloader and use 2 for LPDDR=
4 */
>                 gpu->ubwc_config.highest_bank_bit =3D 16;
>                 gpu->ubwc_config.amsbc =3D 1;
>                 gpu->ubwc_config.rgb565_predicator =3D 1;
> @@ -665,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu =
*gpu)
>                 gpu->ubwc_config.highest_bank_bit =3D 14;
>                 gpu->ubwc_config.min_acc_len =3D 1;
>         }
> +
> +       /* Attempt to retrieve HBB data from SMEM, keep the above default=
s in case of error */
> +       hbb =3D qcom_smem_dram_get_hbb();
> +       if (hbb < 0)
> +               return;
> +
> +       gpu->ubwc_config.highest_bank_bit =3D hbb;
>  }
>
>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>
>
> Konrad
