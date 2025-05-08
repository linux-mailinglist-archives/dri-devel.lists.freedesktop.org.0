Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EACBBAB02A5
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 20:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B86110E956;
	Thu,  8 May 2025 18:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dyej77jL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2884A10E954;
 Thu,  8 May 2025 18:25:30 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-309e54e469cso169883a91.1; 
 Thu, 08 May 2025 11:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746728729; x=1747333529; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=waEbCrslf02j0euz1Hyel1xKxpuwwD71wy+gaLfyWXA=;
 b=Dyej77jLtR+ZBhPWBEgO5Ut2u4TzrV7s8N+mw/3f40a+tbBYL4FXhEOlWXsIXIAWS2
 VK/xXwY9dq0Lqa58ezammpf+yoWj6pbWz/jyqU0RFlJMWu+eGSX+i0geZfAISK3j7rsI
 8XPEQ5NLtpEixiezb8pNFdR24VJM9Jfj/49NIxNLENZWIZzv/tHHwILCUmGS0RC+mLcG
 RO+a4J7nWC8GjBg1SbVnbFtKY4bmPNvHocLGSvGfBvcAnDfjzKmJUz5FrDDwCgGPL9Wt
 ddwxfrbyJxpHJFlyIE77LKG057SpaHcXtpDgofxvtI0fl7CWqjD5VnenVdYGAU/pJeA+
 fHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746728729; x=1747333529;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=waEbCrslf02j0euz1Hyel1xKxpuwwD71wy+gaLfyWXA=;
 b=GhQkCDbFGIlJnmEnHxQcrGcSh+fZg0EUm2vxcRDhNZLVpVnWDGYKsoJfe5kJf/FN+Y
 5hsV3S3yS2mzJEbtRrrjKSv8mOE9T+rBxe4FvMRvwix30c3NfBOWYDtuE56gYwS2XS+l
 YdvPolNi79JcEzZaV6e4400yaaVSFXpPvRG14kNsBeW+QE9b7ka6x+/dd4A6zrNOeIC2
 oVJaKUZtN3FSdwLnWgrUupEXueqMLgCvBzlgXbkj86Mpdnt5oTVnOow5cFVw8filc/3h
 0yQ8iHsMhHIAtSsyIkNFytoQt2v7rXN2P14gAO6mfQm8tr5eo48W0GtWwFaPllVeWJXH
 /PyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhtvEqCFqyUasMGOTlrGD8lW5ehevQcYx/Rp0/nBlbBDaxxs6yYlyKcjzj5E5tGIhvbmMTQc9vH6YN@lists.freedesktop.org,
 AJvYcCXMlkFyxqyNPnfrW8Q1MjZsX7vLrs1YQL6xFM33jYOuEOSqgi0cv/Id94jEJsJfk2VpPmMrcSsuU50=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3w199KDz1ZGuttfL9/s8YvoaTl1s8gCIUSVl5DhGaAg2hdBJ+
 ecKEL4C+QpLEgZH9CzdXuT56wV64Myp+nP4WmEEYQAhlFjm+PdH7sdwXvmcs9RprY0tzpsH9xvV
 L4aAta2GOfYCJ71hjj7nwxxs8+0Y=
X-Gm-Gg: ASbGncvxJmVxzQVF7P0k2yaR8eO3g5awARVAbOOZD7a73JfZsy2q4MyWcyCgLk437nX
 vub14rCCv5oRWr86uB0MzHsBgFh90QpR6fkbDGVuNbDiG5LWvKm3OZ89PbpQaQsNCPyAbahqRpU
 r2OTqWUY5a9lnHPp1bi606dA==
X-Google-Smtp-Source: AGHT+IHm+1k+jR7TnUT8ZSpFd7U5tcrz5KJivMD+5bDfj/leop0E5igVUwVXpDEwEgoS20vzCAfVm+cD5wr/rcq2wGs=
X-Received: by 2002:a17:90b:3812:b0:2ff:4be6:c5e2 with SMTP id
 98e67ed59e1d1-30c3d669070mr276315a91.7.1746728729571; Thu, 08 May 2025
 11:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-7-035c4c5cbe50@oss.qualcomm.com>
In-Reply-To: <20250508-topic-ubwc_central-v1-7-035c4c5cbe50@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 8 May 2025 14:25:18 -0400
X-Gm-Features: ATxdqUGGKzILlDDNdGb-69ow4qakqzEaJcVTZgzzDN8Bbo3FXuGdXfNDVeMIZAU
Message-ID: <CACu1E7H9_EkGFkjL1MRU9M-_YFHnPb5v9SxDg6fXm0m-imzC2Q@mail.gmail.com>
Subject: Re: [PATCH RFT 07/14] drm/msm/a6xx: Resolve the meaning of UBWC_MODE
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
> This bit is set iff the UBWC version is 1.0. That notably does not
> include QCM2290's "no UBWC".

While this is technically true, AFAIK the only difference between UBWC
1.0 and 2.0 is that newer UBWC disables level 1 bank swizzling, which
is why I originally wrote it this way. There's a bit of redundancy
between the UBWC version and ubwc_swizzle bit 0.

Connor

>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index e1eab0906b6c460528da82a94a285ef181e0b479..d47726ea8818a9660eadd52d9=
7dde1489a884684 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -663,10 +663,10 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gp=
u)
>         u8 uavflagprd_inv =3D adreno_is_a650_family(adreno_gpu) || adreno=
_is_a7xx(adreno_gpu) ? 2 : 0;
>         const struct qcom_ubwc_cfg_data *cfg =3D adreno_gpu->common_ubwc_=
cfg;
>         u32 hbb =3D adreno_gpu->ubwc_config.highest_bank_bit;
> +       bool ubwc_mode =3D cfg->ubwc_enc_version =3D=3D UBWC_1_0;
>         bool amsbc =3D cfg->ubwc_enc_version >=3D UBWC_3_0;
>         u32 hbb_hi =3D hbb >> 2;
>         u32 hbb_lo =3D hbb & 3;
> -       u32 ubwc_mode =3D adreno_gpu->ubwc_config.ubwc_swizzle & 1;
>         u32 level2_swizzling_dis =3D !(adreno_gpu->ubwc_config.ubwc_swizz=
le & 2);
>
>         gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
>
> --
> 2.49.0
>
