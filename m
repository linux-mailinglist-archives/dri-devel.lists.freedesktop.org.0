Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DF6916F06
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 19:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079B610E6F3;
	Tue, 25 Jun 2024 17:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J4fKWb6F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8914910E6F1;
 Tue, 25 Jun 2024 17:21:44 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-57d0699fd02so3216332a12.0; 
 Tue, 25 Jun 2024 10:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719336103; x=1719940903; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PF8X3EVfaOc0m47BxMvYz7nb1AddbCK1NzyBkiDSsiE=;
 b=J4fKWb6FUawTPa5Ig9JPd2qw4xQ9xVVTdt3h7rFpaCs96F7VD18u1TT9MO5EGItZyR
 9dxVthPPeplcOEVQ4g7aC20NVE0YZOfO2o0tzy9Vv9d6V74XY6NT5w30fbxUxn1OHpUd
 PnWGT/LvVq4BpWZLP3BiU1kZinhVl4grkrzOdEWVFmAL7PBR8hiddghKHNmsBbtErPnl
 2VbSr+SMkzAQeMuRZ48nKA42Hp9yMeO3gZhON81hTJCEosn5KoMULoVXhQ7BgO7CyAjK
 JukL32Y5G+8PMF1LHnCICAT2OTXqYpXMYgbJk8kgN9kE3LvSiCeNoz6A1XlVPLwLgUxl
 wDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719336103; x=1719940903;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PF8X3EVfaOc0m47BxMvYz7nb1AddbCK1NzyBkiDSsiE=;
 b=KVp0aR3dXkUqXcufkUZw+5t9PjXDsDcbEbL9xX5tWEr85Kz1CzDIzbG3fDSUXnZWl+
 sWA4vsCPS+rR86QFLxA5vhv+Ov+RaLbm/rPvHTqkDbEV9x664BDDmax27vVHq9J3WPM/
 YoMfQWCH+BUAV67j6QaaudDk74lfSVkzflLBO40gyD8Ol6vn/JEKdWkDI8cvcE5c8F6+
 NL0Bs/cWJnMBv4Lw++y8fHfzRQigKCIO8XgQwsCbqpuntN0+JaKRui5ejhCapujJHDDB
 jqg5O65ADLNocHPZLwwxgKD1Nh4zLDBUedmAbYsfB1p4BFDk1PwKnH8bhbr5WvcffABb
 j7uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXjWsDVJyRErnlk7aYNfpcd9s312dlMNk4A8rl5WN0M7MwEXVe+WCZfkfnYxorISQAEBrY5NHtHWJE9GFnRfDJgf1PBdAh/Pq+VzhcFw9f0leB9GVJqYf3dSJU+HCd6ve+x9cMiDBs1b6jYS8o/OCF
X-Gm-Message-State: AOJu0Yx56FFtKUfFWvYPTW/RrHe/UxBk7gEUIRdcNm3LHxBrHqWB9PZz
 hBSLpaKoF9gZa0I4bOXO5fJ61LdJXXgQNlnYszys9HSJfiJHFWCCrksOSR2VdfavTLPM1C0lLxj
 Bd/IBVAaSGuBhV5MAHi2WaxVyZhQ=
X-Google-Smtp-Source: AGHT+IFeIuyJQKXKtU7lWnptJ+g4b8NhOfTie3eIuQqqinLgHNlVbZ9//tdM3Vu2irFhjN3um1vvb0W6+8VMOyR8YoE=
X-Received: by 2002:a50:cdd2:0:b0:57c:5f77:1136 with SMTP id
 4fb4d7f45d1cf-57d4bd8fcf3mr7296749a12.24.1719336102439; Tue, 25 Jun 2024
 10:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
 <20240605-topic-smem_speedbin-v2-4-8989d7e3d176@linaro.org>
In-Reply-To: <20240605-topic-smem_speedbin-v2-4-8989d7e3d176@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 25 Jun 2024 10:21:30 -0700
Message-ID: <CAF6AEGsqv3c8EfBK_CxP7Xgoxj5w6n+XdHcGMC8HxrC8C=D8qg@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] drm/msm/adreno: Add speedbin data for SM8550 / A740
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
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

On Wed, Jun 5, 2024 at 1:10=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro.=
org> wrote:
>
> Add speebin data for A740, as found on SM8550 and derivative SoCs.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm=
/msm/adreno/adreno_device.c
> index 901ef767e491..e00eef8099ae 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -570,6 +570,10 @@ static const struct adreno_info gpulist[] =3D {
>                 .zapfw =3D "a740_zap.mdt",
>                 .hwcg =3D a740_hwcg,
>                 .address_space_size =3D SZ_16G,
> +               .speedbins =3D ADRENO_SPEEDBINS(
> +                       { ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
> +                       { ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },

Did you really mean for these both to map to the same speedbin?

> +               ),
>         }, {
>                 .chip_ids =3D ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
>                 .family =3D ADRENO_7XX_GEN3,
>
> --
> 2.43.0
>
