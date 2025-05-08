Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2EFAB034F
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 21:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FB010E199;
	Thu,  8 May 2025 19:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bDJHbxst";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3FA10E199;
 Thu,  8 May 2025 19:04:09 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-22eed3b3cabso1973385ad.2; 
 Thu, 08 May 2025 12:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746731049; x=1747335849; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EjUfrthWG0OAqJqpUOlt7CMN4+3EkPk7d8LdTb15dXI=;
 b=bDJHbxstqHgaD3ecwLDAxXrGlSxuYwug2s4FymOqmoZpdW8KO68MrvFRrX/n5qLvZV
 IMaVp1++lVlLyS1mCPZrPKszvx0lagaTBmQ3aCQBlWbcQK1XvmEiKgya9lhzp8EbFuv3
 28krQbOU1Ej0E4+uTIBz/+yAqYmcvdVqowEmrA3nxGPCukOsKBdDzBxuMc/oxbS/s015
 pmCcgKsuqytSL7CQ6+AOCvdZwL7ibacQ0rOZ1Z6wK1QVA1ikvI/h2A1mMA1WQsP6OfZe
 RpRTZqDs+G/9F1HBM7vleD+JtCqpyiO/Gr4GgjPOmLUsHLSrKhToardkGnr7iwhZMZhk
 kjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746731049; x=1747335849;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EjUfrthWG0OAqJqpUOlt7CMN4+3EkPk7d8LdTb15dXI=;
 b=Ghf+hVX0uY1nDFQNMJxm20paRklzTPnrzk/0qwozO0cE4lfNbR4AUnuFsP19mpYVnH
 auYyYixLP3AM8v31a1V6n/rNHbs7Qllit7clql5UArg/ENboVTafhd89nbgs5TfsfGBL
 Ab7OQEDZiJvTVVM/3W3hiXEonSjtTFAruq+wXxTjkJUrDsoNkKeYeliczch5RgwHfm0h
 kh2xr+eBVl0DGhK1DlIkMg0K5czJ7PZ1kvbn+xZOMccpYy/yD0ZfXYAVS6tEWvmBLN0r
 zwOvecRMZy65vH6jBuyHUrjZ6S2l1wdg3GTvl12HmqeD981AEtUZiZ1Qd5nvyoiGebm6
 rUEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwCM2E3JgfsUAQjDiUqq5fn6wk3ZnpnTFakPb9r4RM8Dm6c2FT43uHrwcpqPO+NLBR9y9Hpq7Svak=@lists.freedesktop.org,
 AJvYcCXrW1/8UthGnSFrZdjii5S3pN5UkK9D0/O3gCHHC4qE5d1DTo4oEqVZ5mim7gL5iEW/K9wD8mQUMMCr@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLHJjgRQ35pfRDBnXRZUhi7kzvJXIkugKUNGmNR5A9jsajECey
 /5OSDYLDeCNEETOAJ3u9Fnmeoi44kmVLJLbMkWwM02xXBe2rmDzXZtGBo87mFjUVQJVYjaxvXhF
 ijH6oI3U0B6S9dT4bB7uM34hlpuM=
X-Gm-Gg: ASbGnctgJuNn1NyLxggf8d8DlIOu3agkBYsV5a9+jjsLgv9CESEc9KeOUDTt+bSyTwG
 u+No+q2wpAcjs4c0tQDDIc45Ztviv/qYjTjaeXPBJW+fdA3oE293JEKe6X6let4aWNQSj8y+Upx
 bqwWEeq6wU72TENOt3m4Xe1ZlhVdRTcyDa
X-Google-Smtp-Source: AGHT+IF2U5RrRWVsjD/rdOOI2zHFPBHUJygHQOjsEtJ1IQeu1u/Zg3M/zmOTehGOWHK6OpBIjEPkLTtu69d/6B9UZKQ=
X-Received: by 2002:a17:903:2988:b0:22e:663f:c4c with SMTP id
 d9443c01a7336-22fc918876bmr2639425ad.11.1746731048740; Thu, 08 May 2025
 12:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-3-035c4c5cbe50@oss.qualcomm.com>
In-Reply-To: <20250508-topic-ubwc_central-v1-3-035c4c5cbe50@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 8 May 2025 15:03:57 -0400
X-Gm-Features: ATxdqUHFkruH16jzsyUYwEx6TLTP20FKQA0OEl9aKVD3zll2cLYYh9IBmKdgRbM
Message-ID: <CACu1E7E5kUfJBVQG5Bk8nQTG7uqA7s8LjifuUtU9VYhpGAhNqA@mail.gmail.com>
Subject: Re: [PATCH RFT 03/14] drm/msm/adreno: Offset the HBB value by 13
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
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

On Thu, May 8, 2025 at 2:13=E2=80=AFPM Konrad Dybcio <konradybcio@kernel.or=
g> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> The value the UBWC hardware expects is 13 less than the actual value.
> To make it easier to migrate to a common UBWC configuration table,
> defer that logic to the data source (which is currently a number of
> if-else statements with assignments in case of this driver).

Don't break the value exposed to userspace!

Connor

>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  7 +++----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 30 ++++++++++++-----------------=
-
>  2 files changed, 15 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a5xx_gpu.c
> index 650e5bac225f372e819130b891f1d020b464f17f..67331a7ee750c0d9eeeead944=
0e5d08b1a09c878 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -833,8 +833,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>
>         gpu_write(gpu, REG_A5XX_RBBM_AHB_CNTL2, 0x0000003F);
>
> -       BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
> -       hbb =3D adreno_gpu->ubwc_config.highest_bank_bit - 13;
> +       hbb =3D adreno_gpu->ubwc_config.highest_bank_bit;
>
>         gpu_write(gpu, REG_A5XX_TPL1_MODE_CNTL, hbb << 7);
>         gpu_write(gpu, REG_A5XX_RB_MODE_CNTL, hbb << 1);
> @@ -1792,9 +1791,9 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *de=
v)
>
>         /* Set the highest bank bit */
>         if (adreno_is_a540(adreno_gpu) || adreno_is_a530(adreno_gpu))
> -               adreno_gpu->ubwc_config.highest_bank_bit =3D 15;
> +               adreno_gpu->ubwc_config.highest_bank_bit =3D 2;
>         else
> -               adreno_gpu->ubwc_config.highest_bank_bit =3D 14;
> +               adreno_gpu->ubwc_config.highest_bank_bit =3D 1;
>
>         /* a5xx only supports UBWC 1.0, these are not configurable */
>         adreno_gpu->ubwc_config.macrotile_mode =3D 0;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index bf3758f010f4079aa86f9c658b52a70acf10b488..b161b5cd991fc645dfcd69754=
b82be9691775ffe 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -592,32 +592,32 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu=
 *gpu)
>         gpu->ubwc_config.min_acc_len =3D 0;
>         gpu->ubwc_config.ubwc_swizzle =3D 0x6;
>         gpu->ubwc_config.macrotile_mode =3D 0;
> -       gpu->ubwc_config.highest_bank_bit =3D 15;
> +       gpu->ubwc_config.highest_bank_bit =3D 2;
>
>         if (adreno_is_a610(gpu)) {
> -               gpu->ubwc_config.highest_bank_bit =3D 13;
> +               gpu->ubwc_config.highest_bank_bit =3D 0;
>                 gpu->ubwc_config.min_acc_len =3D 1;
>                 gpu->ubwc_config.ubwc_swizzle =3D 0x7;
>         }
>
>         if (adreno_is_a618(gpu))
> -               gpu->ubwc_config.highest_bank_bit =3D 14;
> +               gpu->ubwc_config.highest_bank_bit =3D 1;
>
>         if (adreno_is_a619(gpu))
>                 /* TODO: Should be 14 but causes corruption at e.g. 1920x=
1200 on DP */
> -               gpu->ubwc_config.highest_bank_bit =3D 13;
> +               gpu->ubwc_config.highest_bank_bit =3D 0;
>
>         if (adreno_is_a619_holi(gpu))
> -               gpu->ubwc_config.highest_bank_bit =3D 13;
> +               gpu->ubwc_config.highest_bank_bit =3D 0;
>
>         if (adreno_is_a621(gpu)) {
> -               gpu->ubwc_config.highest_bank_bit =3D 13;
> +               gpu->ubwc_config.highest_bank_bit =3D 0;
>                 gpu->ubwc_config.amsbc =3D 1;
>                 gpu->ubwc_config.uavflagprd_inv =3D 2;
>         }
>
>         if (adreno_is_a623(gpu)) {
> -               gpu->ubwc_config.highest_bank_bit =3D 16;
> +               gpu->ubwc_config.highest_bank_bit =3D 3;
>                 gpu->ubwc_config.amsbc =3D 1;
>                 gpu->ubwc_config.rgb565_predicator =3D 1;
>                 gpu->ubwc_config.uavflagprd_inv =3D 2;
> @@ -636,7 +636,7 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *=
gpu)
>             adreno_is_a730(gpu) ||
>             adreno_is_a740_family(gpu)) {
>                 /* TODO: get ddr type from bootloader and use 2 for LPDDR=
4 */
> -               gpu->ubwc_config.highest_bank_bit =3D 16;
> +               gpu->ubwc_config.highest_bank_bit =3D 3;
>                 gpu->ubwc_config.amsbc =3D 1;
>                 gpu->ubwc_config.rgb565_predicator =3D 1;
>                 gpu->ubwc_config.uavflagprd_inv =3D 2;
> @@ -644,7 +644,7 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *=
gpu)
>         }
>
>         if (adreno_is_a663(gpu)) {
> -               gpu->ubwc_config.highest_bank_bit =3D 13;
> +               gpu->ubwc_config.highest_bank_bit =3D 0;
>                 gpu->ubwc_config.amsbc =3D 1;
>                 gpu->ubwc_config.rgb565_predicator =3D 1;
>                 gpu->ubwc_config.uavflagprd_inv =3D 2;
> @@ -653,14 +653,14 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu=
 *gpu)
>         }
>
>         if (adreno_is_7c3(gpu)) {
> -               gpu->ubwc_config.highest_bank_bit =3D 14;
> +               gpu->ubwc_config.highest_bank_bit =3D 1;
>                 gpu->ubwc_config.amsbc =3D 1;
>                 gpu->ubwc_config.uavflagprd_inv =3D 2;
>                 gpu->ubwc_config.macrotile_mode =3D 1;
>         }
>
>         if (adreno_is_a702(gpu)) {
> -               gpu->ubwc_config.highest_bank_bit =3D 14;
> +               gpu->ubwc_config.highest_bank_bit =3D 1;
>                 gpu->ubwc_config.min_acc_len =3D 1;
>         }
>  }
> @@ -668,13 +668,7 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu =
*gpu)
>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> -       /*
> -        * We subtract 13 from the highest bank bit (13 is the minimum va=
lue
> -        * allowed by hw) and write the lowest two bits of the remaining =
value
> -        * as hbb_lo and the one above it as hbb_hi to the hardware.
> -        */
> -       BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
> -       u32 hbb =3D adreno_gpu->ubwc_config.highest_bank_bit - 13;
> +       u32 hbb =3D adreno_gpu->ubwc_config.highest_bank_bit;
>         u32 hbb_hi =3D hbb >> 2;
>         u32 hbb_lo =3D hbb & 3;
>         u32 ubwc_mode =3D adreno_gpu->ubwc_config.ubwc_swizzle & 1;
>
> --
> 2.49.0
>
