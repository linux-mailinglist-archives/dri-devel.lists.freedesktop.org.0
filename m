Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 571BD6C9011
	for <lists+dri-devel@lfdr.de>; Sat, 25 Mar 2023 19:33:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6527310E07D;
	Sat, 25 Mar 2023 18:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2861310E07D;
 Sat, 25 Mar 2023 18:33:24 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-17ab3a48158so5167740fac.1; 
 Sat, 25 Mar 2023 11:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679769203;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tWZ7vu1wUDpr6CzdvpmdoiQa8Pr9sPVDWbxwXHZBvIU=;
 b=bENPc4KDK7BgP6Q9AGP372cZOl3bPYj48o/Mnui1DECKw+5kUBWPs8jwy6fDjr+B7c
 bcOOyBQnIvBwuwO2twJrplNCBKn8Yz6ZJT87UVn9wEB+1RF8mlHlNwGL3x6Xsqye43z3
 S831EzPobaGsdkovBMViZH5aNmz/KwhFQs51ZA32QYikWf8xnkTUYxo809GllHvre7Et
 GPez1us7Xv4BeXDcXcCYMwbGBLIjF5gJu9yghmjeUcuZnN1Wejmn52IDdDhNtUFsfNqe
 6iADdG/sCuOC3BFNDaf5eoicHy+IWAI0T0GLDg1dR++DLYyWg0MwfPV9vKUss7sykge1
 gW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679769203;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tWZ7vu1wUDpr6CzdvpmdoiQa8Pr9sPVDWbxwXHZBvIU=;
 b=1hB9e5OgCLEAqvPy1q1vSR4SzmXoa5TnHnVczbsC3dCcTPgD3fh/6AjwF5IaoPl92v
 QRq59Cr5Fti97FZz4z/M4AO/WhaQD2JPlymRMxfDdJPQfEo116h7gVZoi+qa87uPRMDU
 lndgGSHbJ8/0IugluCpI/Gu1ONT+1rs/jEOA+RoOjualsL3b11noC2lAZaYtzr4752mI
 Mp4yJh/zIXEeo7uDdxU3cRcTXKer+3wPyBho2u/Tm4fBvLq7Zig9oNeHrv8IrSv79Z2T
 Ljb2KWXbStX9DMhhEOIvf7IuPCGmYoNrgbggLnIRF3OgKGkFce8o5EnUn25UzrtFqmnV
 EYxw==
X-Gm-Message-State: AO0yUKUQ2vjLBQsmcmBdasq/2HVcSt4TIr45/imlHciEMsObfSnDpDQB
 EuqeZ8R+Iz+7lE/xuhCVtjzeJlOsGieVPUuiY+U=
X-Google-Smtp-Source: AK7set+wblsLvOe37ueqxSs1n4zY8RDvlGOPBKK+DtMEDmZTkF0mgkBenW37Ve+R160ibxxGaDCVDW6wOAeNQT02yak=
X-Received: by 2002:a05:6871:4796:b0:17a:df9b:6b1b with SMTP id
 qa22-20020a056871479600b0017adf9b6b1bmr2581691oab.5.1679769203330; Sat, 25
 Mar 2023 11:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
 <20230223-topic-gmuwrapper-v4-4-e987eb79d03f@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v4-4-e987eb79d03f@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 25 Mar 2023 11:33:12 -0700
Message-ID: <CAF6AEGubsUBxskkWvKE1UriQJUCve7YMDBuHhMKOPiedb1bFhA@mail.gmail.com>
Subject: Re: [PATCH v4 04/14] drm/msm/a6xx: Extend and explain UBWC config
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 14, 2023 at 8:28=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> Rename lower_bit to hbb_lo and explain what it signifies.
> Add explanations (wherever possible to other tunables).
>
> Port setting min_access_length, ubwc_mode and hbb_hi from downstream.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 39 +++++++++++++++++++++++++++--=
------
>  1 file changed, 30 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index a849db8252f2..2f55dac52833 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -786,10 +786,25 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu=
)
>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> -       u32 lower_bit =3D 2;
> -       u32 amsbc =3D 0;
> +       /* Unknown, introduced with A650 family, related to UBWC mode/ver=
 4 */
>         u32 rgb565_predicator =3D 0;
> +       /* Unknown, introduced with A650 family */
>         u32 uavflagprd_inv =3D 0;
> +       /* Whether the minimum access length is 64 bits */
> +       u32 min_acc_len =3D 0;
> +       /* Entirely magic, per-GPU-gen value */
> +       u32 ubwc_mode =3D 0;
> +       /*
> +        * The Highest Bank Bit value represents the bit of the highest D=
DR bank.
> +        * We then subtract 13 from it (13 is the minimum value allowed b=
y hw) and
> +        * write the lowest two bits of the remaining value as hbb_lo and=
 the
> +        * one above it as hbb_hi to the hardware. This should ideally us=
e DRAM
> +        * type detection.
> +        */
> +       u32 hbb_hi =3D 0;
> +       u32 hbb_lo =3D 2;
> +       /* Unknown, introduced with A640/680 */
> +       u32 amsbc =3D 0;
>
>         /* a618 is using the hw default values */
>         if (adreno_is_a618(adreno_gpu))
> @@ -800,25 +815,31 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gp=
u)
>
>         if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
>                 /* TODO: get ddr type from bootloader and use 2 for LPDDR=
4 */
> -               lower_bit =3D 3;
> +               hbb_lo =3D 3;
>                 amsbc =3D 1;
>                 rgb565_predicator =3D 1;
>                 uavflagprd_inv =3D 2;
>         }
>
>         if (adreno_is_7c3(adreno_gpu)) {
> -               lower_bit =3D 1;
> +               hbb_lo =3D 1;
>                 amsbc =3D 1;
>                 rgb565_predicator =3D 1;
>                 uavflagprd_inv =3D 2;
>         }
>
>         gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
> -               rgb565_predicator << 11 | amsbc << 4 | lower_bit << 1);
> -       gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, lower_bit << 1);
> -       gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
> -               uavflagprd_inv << 4 | lower_bit << 1);
> -       gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, lower_bit << 21);
> +                 rgb565_predicator << 11 | hbb_hi << 10 | amsbc << 4 |
> +                 min_acc_len << 3 | hbb_lo << 1 | ubwc_mode);
> +
> +       gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, hbb_hi << 4 |
> +                 min_acc_len << 3 | hbb_lo << 1 | ubwc_mode);
> +
> +       gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, hbb_hi << 10 |
> +                 uavflagprd_inv << 4 | min_acc_len << 3 |
> +                 hbb_lo << 1 | ubwc_mode);
> +
> +       gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, min_acc_len << 23 | hbb_l=
o << 21);
>  }
>
>  static int a6xx_cp_init(struct msm_gpu *gpu)
>
> --
> 2.39.2
>
