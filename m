Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F1EAB02E3
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 20:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAFB10E959;
	Thu,  8 May 2025 18:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iagkchts";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A725010E957;
 Thu,  8 May 2025 18:33:19 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-308218fed40so121046a91.0; 
 Thu, 08 May 2025 11:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746729199; x=1747333999; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8FQJhUt0Xs5KmiFJABZgU0fKzpM3sDlbu/it07qeVBQ=;
 b=iagkchtsenZMtmbQAR1sKxSfmJZAFNY1Pprap39KJBzusWkLoqPULU8AtYClou0Qwv
 t13A+jvt9sckK2xqXJBL04vtJd73vf5ZcVZbXy4ES+EHfxMjvIcnblIJ+QR8IjXzHRR6
 AZogRwpKoE5xn5oMwO88ei0lubohcC5jJC50qPOCB9tazDRfDrH4VB0NEaBQVrKyrz1d
 /UhQQqYCwpmVb63gwTw5rMwFTrOWebNdduawn3fmBOZpdThyfBf7PFJ/yJIS6G1WTkrx
 u1FU3CHyhqQFe8HkMdsISjPzK+QGQOfCmXI+2h0tWVmmENuto759QsVyoSAPeGG0tPl1
 ytYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746729199; x=1747333999;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8FQJhUt0Xs5KmiFJABZgU0fKzpM3sDlbu/it07qeVBQ=;
 b=Kns7YYNJgHI0uwOTSTkfLXxxgHtBxGRkpUuvmsG6phZVzqTAMpCrvugtJGqbuWxkF3
 bSXqJInggW9QYvjro0oGXp99toabN46pfXrKB3J9gLxAKkYe9p9/9jgR3hBv9OQf/ofc
 lwljVNIPSxU8xymX7nJ6brd7PsZJjBR8EbPUf4OgNWB48c66W+t56tQi5RW3WZ2vBdXN
 BIGM8XhMRuS9wkW2857NHkbWLyAqFYwh/MKdlAzSApsa6lepZL2ESnT6pxrc1SY1NM1Y
 DqaezrfoYiyPzUJDTJ4+2eTJWzTPGTt8kGxajMjuISGxo10LMHg1UFTC54wJLKayS+7u
 BOTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+ndcumqKn14FsF1bwjSASFebIr7dLH5I5GC2oPGjjuzxg8AR1oEHGpyF36i5akrtqnlFgpFuQlIs=@lists.freedesktop.org,
 AJvYcCUFy4k/jYNSFbzjq+RtCgdLZ+wngN+mqFAe2DY3KMfgRaPJ2OYa9Z782tISE8qJpdz4twXTdN4PB+Yd@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWe1ZzFOHGzmGZ3wXtkiFT/1ufAb8gRJIRrpe8uMJl9O9LXzA1
 MY2u39qk1cfo4XV1X/kce6LGmrBKsPZSh/FyEaq2wZD+x0pBZ9P8p0KDoGmr8qrVH/h4ZMFLXQK
 TGsgGP06sWgLjVvFC/e2gvDEwBkE=
X-Gm-Gg: ASbGncvuNACDskZGGrsZTxJdFw2M6bZW06VZ/T54JgwiFQV5bkWb4kQHTUjviZgMsW+
 sS9bTwM0dpaVkNfgaoLVZhYXFqOqaxWiRpIEE5HFPO5T5dM9pwlSnGwGFHU0hUUJhd8TOUXBMpW
 z2Zzcy6MofwddyOm4xaJ1huw==
X-Google-Smtp-Source: AGHT+IHpUe5YqkWw0UFJtqeULReAr+4JR57SpZTyi/DJlRlRiBws1wPRXwVJgzIDpy8odTqgv5arRpEHmEIb9VOXibA=
X-Received: by 2002:a17:90a:e7d2:b0:2fe:b972:a2c3 with SMTP id
 98e67ed59e1d1-30c3b909b29mr304390a91.0.1746729199120; Thu, 08 May 2025
 11:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-10-035c4c5cbe50@oss.qualcomm.com>
In-Reply-To: <20250508-topic-ubwc_central-v1-10-035c4c5cbe50@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 8 May 2025 14:33:08 -0400
X-Gm-Features: ATxdqUE2vLeH_1fBevqnXZeORD_v0wWgDms-Rnd2Lz_3k2tRIEmXBn1VABvu08w
Message-ID: <CACu1E7EFK7dzR=hm-J58jz77pMxn2SoJVrfQvV0RHiESi1mkzA@mail.gmail.com>
Subject: Re: [PATCH RFT 10/14] drm/msm/a6xx: Stop tracking macrotile_mode
 (again)
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

On Thu, May 8, 2025 at 2:14=E2=80=AFPM Konrad Dybcio <konradybcio@kernel.or=
g> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> SC8180X (A680) and SA8775P (A663) require a write to that register,
> while other SKUs are fine with the default value. Don't overwrite it
> needlessly, requiring the developer to read the value back from
> hardware just to put it in the driver again, introducing much more room
> for error.

I'm not sure I understand that last sentence. The original reason I
always wrote it was that for host image copy we need to know the value
of macrotile_mode, so again the value exposed to userspace must match
what's set in the HW. We can't read the value from the HW and send it
to userspace, because userspace queries this when creating the
physical device during device enumeration and we really don't want to
spuriously turn on the device then. That means the safest thing is to
always program it, guaranteeing that it always matches. Otherwise we
just have to hope that the default value matches what we expect it to
be.

I know you're copying this from kgsl, but kgsl doesn't expose the
macrotile_mode to userspace. I expect that HIC was added afterwards
and only works via hacks there (if it's even supported at all on the
relevant SoCs).

Connor

>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 60f89a2d851a5c383fc14cce4c483f630132a9a6..bee7e9685aa3ea282fb20ef47=
9e4d243d28418f7 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -594,7 +594,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *g=
pu)
>
>         gpu->ubwc_config.min_acc_len =3D 0;
>         gpu->ubwc_config.ubwc_swizzle =3D 0x6;
> -       gpu->ubwc_config.macrotile_mode =3D 0;
>         gpu->ubwc_config.highest_bank_bit =3D 2;
>
>         if (adreno_is_a610(gpu)) {
> @@ -616,13 +615,8 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *=
gpu)
>         if (adreno_is_a621(gpu))
>                 gpu->ubwc_config.highest_bank_bit =3D 0;
>
> -       if (adreno_is_a623(gpu)) {
> +       if (adreno_is_a623(gpu))
>                 gpu->ubwc_config.highest_bank_bit =3D 3;
> -               gpu->ubwc_config.macrotile_mode =3D 1;
> -       }
> -
> -       if (adreno_is_a680(gpu))
> -               gpu->ubwc_config.macrotile_mode =3D 1;
>
>         if (adreno_is_a650(gpu) ||
>             adreno_is_a660(gpu) ||
> @@ -631,19 +625,15 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu =
*gpu)
>             adreno_is_a740_family(gpu)) {
>                 /* TODO: get ddr type from bootloader and use 2 for LPDDR=
4 */
>                 gpu->ubwc_config.highest_bank_bit =3D 3;
> -               gpu->ubwc_config.macrotile_mode =3D 1;
>         }
>
>         if (adreno_is_a663(gpu)) {
>                 gpu->ubwc_config.highest_bank_bit =3D 0;
> -               gpu->ubwc_config.macrotile_mode =3D 1;
>                 gpu->ubwc_config.ubwc_swizzle =3D 0x4;
>         }
>
> -       if (adreno_is_7c3(gpu)) {
> +       if (adreno_is_7c3(gpu))
>                 gpu->ubwc_config.highest_bank_bit =3D 1;
> -               gpu->ubwc_config.macrotile_mode =3D 1;
> -       }
>
>         if (adreno_is_a702(gpu)) {
>                 gpu->ubwc_config.highest_bank_bit =3D 1;
> @@ -691,8 +681,9 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>         gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL,
>                   adreno_gpu->ubwc_config.min_acc_len << 23 | hbb_lo << 2=
1);
>
> -       gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL,
> -                 adreno_gpu->ubwc_config.macrotile_mode);
> +       /* The reset value only needs altering in some cases */
> +       if (adreno_is_a680(adreno_gpu) || adreno_is_a663(adreno_gpu))
> +               gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL, BIT(0));
>  }
>
>  static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
>
> --
> 2.49.0
>
