Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC54AB045F
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 22:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F0810E205;
	Thu,  8 May 2025 20:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P1CKPDk+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122FD10E0DC;
 Thu,  8 May 2025 20:12:43 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-b2001aafc3cso75343a12.2; 
 Thu, 08 May 2025 13:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746735162; x=1747339962; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FMf96FXuSnX5qhllALH1Rp7ykWLVVc//J13jd72kjmw=;
 b=P1CKPDk+ymMpSEnGDOZO2hDIjKSzGdZ2pHLSxyyUx2aQprRy7jq8ETMw2JIp63p0rz
 /MrfKO5i9kt7reBnB1/91xJd4U9bpkd0hD7RceaFd5Zl6ieoPut60t+IvlW2begKjOD+
 yBO14gHu07ix0fTSL46Iu3+0J+legXhews8s6mMv9lkQk1sbU+b7HELa0H0VcsisfwdN
 7jC+JaIb9akyehIvDKVsD+dNzAiiMvdKfAfrrV8/TjnP8LbA685J9RWyRYiaTsRS15hN
 8F5W74RCPleIMWCLWhi0sVsXBbsTr7J3dj2HVQJlUiWvK8URSAaqXnetf9yUjPK3MUml
 3Qdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746735162; x=1747339962;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FMf96FXuSnX5qhllALH1Rp7ykWLVVc//J13jd72kjmw=;
 b=dun6i4rgNZjjxQz4JTqFMDeJKHmADmJiEV2E1ZflIGF6KFdYNwhHXIgCZv3TeGrpMg
 V3H4RB0PLB4gtIOp8k+pAst242/LJmG0kPU0wbBF0Ux+8/uCeoU+I6WP/W4yVYS26XQN
 7myFLggLoeYz5LhBF5icEFwbErjzFHz6eoArSZ6nMuJzVG6HzNjmRR3Pv60otSlZHMcJ
 Y0icBhA520U3qkbCx8DjE+y1hlQvpr3t5BeO4qK7QwLtv6xaAZWGwNqRmBnb9Vn0Dche
 gbw97ea9ecE4VBN9lILbMvwVgkuRU1ctzUkr51DjcVjnuCjak9spDMk4pIS4oEECYF5f
 Y2yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDa9h4gMOfbH5X7mL2F4gZtbvaEI4nrELenka7JudAuJna1aZ2iMpqPfJHBqQu7abHWsDvtJQo3BA=@lists.freedesktop.org,
 AJvYcCXSdQmg4epE1eZI0laSJacEGO+nTzTgFd1U0C6eQPYO6hjxz/WNuzll+tTnhVb98PO9Y53fRTWyjCBT@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaWKtIDqjF4y63CaWmP6rlpaoHzMOtOZ0yQU3T5HerbMfEaggW
 K59+Z+42xqplPVE9XGzymt+Sl/MJOIoP7vY1eQ2/D5yXLNdckz02X/YR2NCwfc9IgHxHdIguj5u
 JjvHynJuoPQrJVuNaDQbEkkor7Yw=
X-Gm-Gg: ASbGncvt97oEac1b0NYeIsa/z0FR+r1F5Tc1dpEyI8zYShdUhPVqca/MqqfsGPbuY1J
 sX0gG5+6VxsvKc8vWi6n1G/Y87Jnf08xi3S0VdnHZOULKO/J1OTIkJrCGyLgCBJgFKRzi4/3l+A
 8W+wdO1f0B+5L1RK7aYw3ttA==
X-Google-Smtp-Source: AGHT+IH6e7+ed1G549/Z8OklJ1akRAitkFCuoHZTNQf9ToGv6/llgXkTnKyiPfQLlz+Ew6c4JK4FwZ+5NaQf2W/o6dQ=
X-Received: by 2002:a17:90b:3e83:b0:30a:a50a:8c93 with SMTP id
 98e67ed59e1d1-30c3d674dadmr436380a91.7.1746735162384; Thu, 08 May 2025
 13:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-1-035c4c5cbe50@oss.qualcomm.com>
In-Reply-To: <20250508-topic-ubwc_central-v1-1-035c4c5cbe50@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 8 May 2025 16:12:31 -0400
X-Gm-Features: ATxdqUHnQejBvfmedAIjJ-kKl1wBYL5mqv2oNp-sfYWhNCI_Ftp14XuxAX2kJ04
Message-ID: <CACu1E7H6FGm0npQnG+M3Jzn9RSL9CYkkDg3rtH+=on4_caPTZQ@mail.gmail.com>
Subject: Re: [PATCH RFT 01/14] soc: qcom: Add UBWC config provider
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
> Add a file that will serve as a single source of truth for UBWC
> configuration data for various multimedia blocks.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/Kconfig       |   8 ++
>  drivers/soc/qcom/Makefile      |   1 +
>  drivers/soc/qcom/ubwc_config.c | 255 +++++++++++++++++++++++++++++++++++=
++++++
>  include/linux/soc/qcom/ubwc.h  |  31 +++++
>  4 files changed, 295 insertions(+)
>
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 58e63cf0036ba8554e4082da5184a620ca807a9e..2caadbbcf8307ff94f5afbdd1=
481e5e5e291749f 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -296,3 +296,11 @@ config QCOM_PBS
>           PBS trigger event to the PBS RAM.
>
>  endmenu
> +
> +config QCOM_UBWC_CONFIG
> +       tristate
> +       help
> +         Most Qualcomm SoCs feature a number of Universal Bandwidth Comp=
ression
> +         (UBWC) engines across various IP blocks, which need to be initi=
alized
> +         with coherent configuration data. This module functions as a si=
ngle
> +         source of truth for that information.
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index acbca2ab5cc2a9ab3dce1ff38efd048ba2fab31e..b7f1d2a5736748b8772c090fd=
24462fa91f321c6 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -39,3 +39,4 @@ obj-$(CONFIG_QCOM_ICC_BWMON)  +=3D icc-bwmon.o
>  qcom_ice-objs                  +=3D ice.o
>  obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)        +=3D qcom_ice.o
>  obj-$(CONFIG_QCOM_PBS) +=3D      qcom-pbs.o
> +obj-$(CONFIG_QCOM_UBWC_CONFIG) +=3D ubwc_config.o
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_confi=
g.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..3f81fb2aab284dc9a5bcf53e5=
d638aaba44b6f2d
> --- /dev/null
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -0,0 +1,255 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/debugfs.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +
> +#include <linux/soc/qcom/ubwc.h>
> +
> +static const struct qcom_ubwc_cfg_data msm8937_data =3D {
> +       .ubwc_enc_version =3D UBWC_1_0,
> +       .ubwc_dec_version =3D UBWC_1_0,
> +       .highest_bank_bit =3D 1,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data msm8998_data =3D {
> +       .ubwc_enc_version =3D UBWC_1_0,
> +       .ubwc_dec_version =3D UBWC_1_0,
> +       .highest_bank_bit =3D 2,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data qcm2290_data =3D {
> +       /* no UBWC */
> +       .highest_bank_bit =3D 2,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sa8775p_data =3D {
> +       .ubwc_enc_version =3D UBWC_4_0,
> +       .ubwc_dec_version =3D UBWC_4_0,
> +       .ubwc_swizzle =3D 4,
> +       .ubwc_bank_spread =3D true,
> +       .highest_bank_bit =3D 0,
> +       .macrotile_mode =3D true,
> +       .mdss_reg_bus_bw =3D 74000,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sar2130p_data =3D {
> +       .ubwc_enc_version =3D UBWC_3_0, /* 4.0.2 in hw */
> +       .ubwc_dec_version =3D UBWC_4_3,
> +       .ubwc_swizzle =3D 6,
> +       .ubwc_bank_spread =3D true,
> +       .highest_bank_bit =3D 0,
> +       .macrotile_mode =3D true,
> +       .mdss_reg_bus_bw =3D 74000,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sc7180_data =3D {
> +       .ubwc_enc_version =3D UBWC_2_0,
> +       .ubwc_dec_version =3D UBWC_2_0,
> +       .ubwc_swizzle =3D 6,
> +       .ubwc_bank_spread =3D true,
> +       .highest_bank_bit =3D 1,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sc7280_data =3D {
> +       .ubwc_enc_version =3D UBWC_3_0,
> +       .ubwc_dec_version =3D UBWC_4_0,
> +       .ubwc_swizzle =3D 6,
> +       .ubwc_bank_spread =3D true,
> +       .highest_bank_bit =3D 1,
> +       .macrotile_mode =3D true,
> +       .mdss_reg_bus_bw =3D 74000,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sc8180x_data =3D {
> +       .ubwc_enc_version =3D UBWC_3_0,
> +       .ubwc_dec_version =3D UBWC_3_0,
> +       .highest_bank_bit =3D 3,
> +       .macrotile_mode =3D true,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sc8280xp_data =3D {
> +       .ubwc_enc_version =3D UBWC_4_0,
> +       .ubwc_dec_version =3D UBWC_4_0,
> +       .ubwc_swizzle =3D 6,
> +       .ubwc_bank_spread =3D true,
> +       .highest_bank_bit =3D 3,
> +       .macrotile_mode =3D true,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sdm670_data =3D {
> +       .ubwc_enc_version =3D UBWC_2_0,
> +       .ubwc_dec_version =3D UBWC_2_0,
> +       .highest_bank_bit =3D 1,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sdm845_data =3D {
> +       .ubwc_enc_version =3D UBWC_2_0,
> +       .ubwc_dec_version =3D UBWC_2_0,
> +       .highest_bank_bit =3D 2,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm6115_data =3D {
> +       .ubwc_enc_version =3D UBWC_1_0,
> +       .ubwc_dec_version =3D UBWC_2_0,
> +       .ubwc_swizzle =3D 7,
> +       .ubwc_bank_spread =3D true,
> +       .highest_bank_bit =3D 1,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm6125_data =3D {
> +       .ubwc_enc_version =3D UBWC_1_0,
> +       .ubwc_dec_version =3D UBWC_3_0,
> +       .ubwc_swizzle =3D 1,
> +       .highest_bank_bit =3D 1,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm6150_data =3D {
> +       .ubwc_enc_version =3D UBWC_2_0,
> +       .ubwc_dec_version =3D UBWC_2_0,
> +       .highest_bank_bit =3D 1,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm6350_data =3D {
> +       .ubwc_enc_version =3D UBWC_2_0,
> +       .ubwc_dec_version =3D UBWC_2_0,
> +       .ubwc_swizzle =3D 6,
> +       .ubwc_bank_spread =3D true,
> +       .highest_bank_bit =3D 1,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm7150_data =3D {
> +       .ubwc_enc_version =3D UBWC_2_0,
> +       .ubwc_dec_version =3D UBWC_2_0,
> +       .highest_bank_bit =3D 1,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm8150_data =3D {
> +       .ubwc_enc_version =3D UBWC_3_0,
> +       .ubwc_dec_version =3D UBWC_3_0,
> +       .highest_bank_bit =3D 2,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm8250_data =3D {
> +       .ubwc_enc_version =3D UBWC_4_0,
> +       .ubwc_dec_version =3D UBWC_4_0,
> +       .ubwc_swizzle =3D 6,
> +       .ubwc_bank_spread =3D true,
> +       /* TODO: highest_bank_bit =3D 2 for LP_DDR4 */
> +       .highest_bank_bit =3D 3,
> +       .macrotile_mode =3D true,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm8350_data =3D {
> +       .ubwc_enc_version =3D UBWC_4_0,
> +       .ubwc_dec_version =3D UBWC_4_0,
> +       .ubwc_swizzle =3D 6,
> +       .ubwc_bank_spread =3D true,
> +       /* TODO: highest_bank_bit =3D 2 for LP_DDR4 */
> +       .highest_bank_bit =3D 3,
> +       .macrotile_mode =3D true,
> +       .mdss_reg_bus_bw =3D 74000,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm8550_data =3D {
> +       .ubwc_enc_version =3D UBWC_4_0,
> +       .ubwc_dec_version =3D UBWC_4_3,
> +       .ubwc_swizzle =3D 6,
> +       .ubwc_bank_spread =3D true,
> +       /* TODO: highest_bank_bit =3D 2 for LP_DDR4 */
> +       .highest_bank_bit =3D 3,
> +       .macrotile_mode =3D true,
> +       .mdss_reg_bus_bw =3D 57000,
> +};
> +
> +static const struct qcom_ubwc_cfg_data x1e80100_data =3D {
> +       .ubwc_enc_version =3D UBWC_4_0,
> +       .ubwc_dec_version =3D UBWC_4_3,
> +       .ubwc_swizzle =3D 6,
> +       .ubwc_bank_spread =3D true,
> +       /* TODO: highest_bank_bit =3D 2 for LP_DDR4 */
> +       .highest_bank_bit =3D 3,
> +       .macrotile_mode =3D true,
> +       /* TODO: Add mdss_reg_bus_bw with real value */
> +};
> +
> +static const struct of_device_id qcom_ubwc_configs[] __maybe_unused =3D =
{
> +       { .compatible =3D "qcom,apq8096", .data =3D &msm8998_data },
> +       { .compatible =3D "qcom,msm8917", .data =3D &msm8937_data },
> +       { .compatible =3D "qcom,msm8937", .data =3D &msm8937_data },
> +       { .compatible =3D "qcom,msm8953", .data =3D &msm8937_data },
> +       { .compatible =3D "qcom,msm8956", .data =3D &msm8937_data },
> +       { .compatible =3D "qcom,msm8976", .data =3D &msm8937_data },
> +       { .compatible =3D "qcom,msm8996", .data =3D &msm8998_data },
> +       { .compatible =3D "qcom,msm8998", .data =3D &msm8998_data },
> +       { .compatible =3D "qcom,qcm2290", .data =3D &qcm2290_data, },
> +       { .compatible =3D "qcom,qcm6490", .data =3D &sc7280_data, },
> +       { .compatible =3D "qcom,sa8155p", .data =3D &sm8150_data, },
> +       { .compatible =3D "qcom,sa8540p", .data =3D &sc8280xp_data, },
> +       { .compatible =3D "qcom,sa8775p", .data =3D &sa8775p_data, },
> +       { .compatible =3D "qcom,sc7180", .data =3D &sc7180_data },
> +       { .compatible =3D "qcom,sc7280", .data =3D &sc7280_data, },
> +       { .compatible =3D "qcom,sc8180x", .data =3D &sc8180x_data, },
> +       { .compatible =3D "qcom,sc8280xp", .data =3D &sc8280xp_data, },
> +       { .compatible =3D "qcom,sdm630", .data =3D &msm8937_data },
> +       { .compatible =3D "qcom,sdm636", .data =3D &msm8937_data },
> +       { .compatible =3D "qcom,sdm660", .data =3D &msm8937_data },
> +       { .compatible =3D "qcom,sdm670", .data =3D &sdm670_data, },
> +       { .compatible =3D "qcom,sdm845", .data =3D &sdm845_data, },
> +       { .compatible =3D "qcom,sm4250", .data =3D &sm6115_data, },
> +       { .compatible =3D "qcom,sm6115", .data =3D &sm6115_data, },
> +       { .compatible =3D "qcom,sm6125", .data =3D &sm6125_data, },
> +       { .compatible =3D "qcom,sm6150", .data =3D &sm6150_data, },
> +       { .compatible =3D "qcom,sm6350", .data =3D &sm6350_data, },
> +       { .compatible =3D "qcom,sm6375", .data =3D &sm6350_data, },
> +       { .compatible =3D "qcom,sm7125", .data =3D &sc7180_data },
> +       { .compatible =3D "qcom,sm7150", .data =3D &sm7150_data, },
> +       { .compatible =3D "qcom,sm8150", .data =3D &sm8150_data, },
> +       { .compatible =3D "qcom,sm8250", .data =3D &sm8250_data, },
> +       { .compatible =3D "qcom,sm8350", .data =3D &sm8350_data, },
> +       { .compatible =3D "qcom,sm8450", .data =3D &sm8350_data, },
> +       { .compatible =3D "qcom,sm8550", .data =3D &sm8550_data, },
> +       { .compatible =3D "qcom,sm8650", .data =3D &sm8550_data, },
> +       { .compatible =3D "qcom,x1e80100", .data =3D &x1e80100_data, },
> +       { .compatible =3D "qcom,x1p42100", .data =3D &x1e80100_data, },
> +       { }
> +};
> +
> +const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> +{
> +       const struct of_device_id *match;
> +       struct device_node *root;
> +
> +       root =3D of_find_node_by_path("/");
> +       if (!root)
> +               return ERR_PTR(-ENODEV);
> +
> +       match =3D of_match_node(qcom_ubwc_configs, root);
> +       of_node_put(root);
> +       if (!match) {
> +               pr_err("Couldn't find UBWC config data for this platform!=
\n");
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       return match->data;
> +}
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.=
h
> new file mode 100644
> index 0000000000000000000000000000000000000000..450106e6aea06f9f752bb7312=
ec3074e375eee4d
> --- /dev/null
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2018, The Linux Foundation
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __QCOM_UBWC_H__
> +#define __QCOM_UBWC_H__
> +
> +#include <linux/types.h>
> +
> +struct qcom_ubwc_cfg_data {
> +       u32 ubwc_enc_version;
> +       /* Can be read from MDSS_BASE + 0x58 */
> +       u32 ubwc_dec_version;
> +       u32 ubwc_swizzle;
> +       int highest_bank_bit;
> +       bool ubwc_bank_spread;
> +       bool macrotile_mode;
> +       u32 mdss_reg_bus_bw;

This doesn't really seem relevant to UBWC?

> +};

The comments should be copied over from the Adreno struct. That was
the main way the meaning of most of these was documented and you're
deleting it here.

> +
> +#define UBWC_1_0 0x10000000
> +#define UBWC_2_0 0x20000000
> +#define UBWC_3_0 0x30000000
> +#define UBWC_4_0 0x40000000
> +#define UBWC_4_3 0x40030000
> +
> +const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void);
> +
> +#endif /* __QCOM_UBWC_H__ */
>
> --
> 2.49.0
>
