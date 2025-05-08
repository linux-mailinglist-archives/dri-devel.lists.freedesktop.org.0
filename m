Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0D8AB03A8
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 21:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D103610E963;
	Thu,  8 May 2025 19:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C4qP5bow";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAD410E21C;
 Thu,  8 May 2025 19:26:15 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-30a892f8124so165753a91.3; 
 Thu, 08 May 2025 12:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746732375; x=1747337175; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0hKru1L8dMScGzoC6BZyI54uV4RakPZMb8WHsDI441M=;
 b=C4qP5bowNmk1rkwarVwKPSVJaD7GSK2yhvaVadux1wicnFfrgPiEH9RyUBsQAyBTgg
 N2jVtgeF9T06kQknkIDm0XH64fbOsu/TTDX3M3xyjSwgyHNPlFa9v684294fjfGxLm0j
 L9TuGTIjaAI5mVSE7Q9TIdPShjg6xtrrlf5CpYcOlzJwQZM5EvfGmNYGhEWZr/ZvYuV2
 baB5hXoQQENey+rifA0qPg3detF9t0JFkoR3MDnYCsNIVGHLGTtf8wK5yQU0UXp/C7nF
 pLdCTa5kqmzQNuuXWy3smzGzp7Jyi8+7clSTy+fn+CMa1u/g/rY7Do1GsT7Skf1EgHMk
 6a0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746732375; x=1747337175;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0hKru1L8dMScGzoC6BZyI54uV4RakPZMb8WHsDI441M=;
 b=sn9pKCs1MWt9Rb8v5NHTItSRzlugUczTWa5FMwyPNe4u/NGSa/inLIhM+5KbypLHpa
 saawYcQtmoCjteo9ffgOekO2yQNYjVPTZT6HGb7fUxBTrTOqxNMO0du7ihCnsEY+DXTf
 a2dZ/58SY8XrH8BuFvrENLiunuiXe6Wayfmv8LLq5sO0CcpoDZel3LoeqjHcZU5Yvl4L
 9A6Nzw2GGO38Y/OWozH8EDjofltgIW4c9pfIf6yrMoOvxLh2SZxgWYVWS8NXNuv42mLf
 K4cKG3A+Tj2Jk8uRsFQCgkExsAOcWvFucnzcjOcnEMXodImOgiYWE30ZjL3gRfQ1w/an
 bTpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv+0BSs4JJt+K1TPay+3wL2QpmcgwJxribkw2VTzh8NwTCBu7iXQq27X60vL0/ytXmr/fBwVp39LM=@lists.freedesktop.org,
 AJvYcCV8m8BBwN+qdtwaKrnPLBYYqMfwoWMw+yTrjoXKFOI/W60QZU1PQe9/tB9A38byaRrAwOoBduUICQT7@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsG2FjGGEuCw4rG0RurRKokgqJZt8lUVQfjljKN8HLAfTXLYzZ
 zwVWHdicAWju8KPkHM1+lpCliKgbHPPlb46Z84GrzpBv5FunJNATUIW/1WFgtuOr0xDTXXu1e54
 dwk/ipfBZz9itELafAcbVgdoZptQ=
X-Gm-Gg: ASbGncuHYr9wEm4z/7bCQ9DutWLdIw1UjwQtPI8Z78hNo/Bj0Xy3qtbe1NemXIXrnWp
 R0xwfbUx4xLoFJxj34x94Tyir6RUE5J146qouDO8n5Jj2SedUL9mup8K4QOBNHhIhemTFiUp4W4
 ocw8yxbYfDmO3Nh4R0txs0fg==
X-Google-Smtp-Source: AGHT+IGSpiN7eaDH3O4Uokp10YbmchAx5slpcUK4Ki93gIDNWaqoAmMgsVOGKoMSaAoqs8hgzbmH4KVxaKA8k0N96h4=
X-Received: by 2002:a17:90b:3e83:b0:30a:a50a:8c93 with SMTP id
 98e67ed59e1d1-30c3d674dadmr365318a91.7.1746732375030; Thu, 08 May 2025
 12:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-13-035c4c5cbe50@oss.qualcomm.com>
In-Reply-To: <20250508-topic-ubwc_central-v1-13-035c4c5cbe50@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 8 May 2025 15:26:04 -0400
X-Gm-Features: ATxdqUECrHAxamM6cf9DmM-j_slTE2IU4QDuio4QvANymnYvV5oJYBJ2BHROTFg
Message-ID: <CACu1E7E9yU-cygZxBqVypP7aFkXJCNTfXA2uqdvU84mi9T51Xg@mail.gmail.com>
Subject: Re: [PATCH RFT 13/14] drm/msm/a6xx: Drop cfg->ubwc_swizzle override
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
> On A663 (SA8775P) the value matches exactly.
>
> On A610, the value matches on SM6115, but is different on SM6125. That
> turns out not to be a problem, as the bits that differ aren't even
> interpreted.

This is definitely going to break userspace, because the kernel
doesn't expose the UBWC version, instead exposing just the swizzle and
userspace expects that it sets the right value for older UBWC versions
before it became configurable (0x7 for UBWC 1.0 and 0x6 for 2.0-3.0).
It looks like the data for SM6125 is just wrong.

Connor

>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 28ba0cddd7d222b0a287c7c3a111e123a73b1d39..d96f8cec854a36a77896d39b8=
8c320c29c787edd 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -597,13 +597,10 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu =
*gpu)
>
>         *cfg =3D *common_cfg;
>
> -       cfg->ubwc_swizzle =3D 0x6;
>         cfg->highest_bank_bit =3D 2;
>
> -       if (adreno_is_a610(gpu)) {
> +       if (adreno_is_a610(gpu))
>                 cfg->highest_bank_bit =3D 0;
> -               cfg->ubwc_swizzle =3D 0x7;
> -       }
>
>         if (adreno_is_a618(gpu))
>                 cfg->highest_bank_bit =3D 1;
> @@ -630,10 +627,8 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *=
gpu)
>                 cfg->highest_bank_bit =3D 3;
>         }
>
> -       if (adreno_is_a663(gpu)) {
> +       if (adreno_is_a663(gpu))
>                 cfg->highest_bank_bit =3D 0;
> -               cfg->ubwc_swizzle =3D 0x4;
> -       }
>
>         if (adreno_is_7c3(gpu))
>                 cfg->highest_bank_bit =3D 1;
>
> --
> 2.49.0
>
