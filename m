Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B69706BAB57
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 09:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3BE10E963;
	Wed, 15 Mar 2023 08:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 563 seconds by postgrey-1.36 at gabe;
 Wed, 15 Mar 2023 08:59:37 UTC
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C4C110E964
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 08:59:37 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 149E53F0E1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 08:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1678870213;
 bh=Q1m6NQLqRBTP8z3hsMYxofduF6uobMIX9a0HuHQkYmw=;
 h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=uXj/5fs2MeVXK9J1vF37YchdPyi3PWgEf0n33YgblXtFAKKi3EiGD60uGoE88jluu
 Qc2h14ob/dB65NhB6rJokex/xJBz27TLA22nQYmbcsnD4MGQdylIjsDZAW84Wz0KN0
 h/eF/UQ3jdQpjo/opf/f4aHNzQ+O6Ca8pupo8rif8FZjbf1+KioIbLAtzduMGnri8q
 nmClbz1zkPcUBIv84Kd4cedXyJJmbiXclQD8lYGtJSWonbPQb7Onp2jKYfDnf5NNC7
 l7T7vZ+QiJe7mChBlH89igJPpzFnJlfgRcr7rRhJRjeP9sKUIZYZkwIj0tVzohczZ4
 6PALYsjtBFSag==
Received: by mail-ed1-f69.google.com with SMTP id
 b7-20020a056402350700b004d2a3d5cd3fso25577386edd.8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 01:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678870211;
 h=mime-version:organization:references:in-reply-to:message-id:subject
 :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q1m6NQLqRBTP8z3hsMYxofduF6uobMIX9a0HuHQkYmw=;
 b=UOoGKHK34cTQjCfDluQ00OAjgGRMyTZyj8KR4M2MEmpyvyKcHkOdu5RAXU9S+xvhQR
 MX1Y3gWP0sYJvOsSyWuxsXo0LvgATDHSCToh26qjRbzKGlNRr2xG8v8hBNPDssQqOzN3
 C90e06P75+cHYJJbC4hQLy4v601O2+ZQVkCN00wrQ0A+Ql905VEIZ1EG9GizHMShW0Q7
 +r8bGSe+CB3i6RBBxTEIp1zMpnB2LjckXCRbwqQ5XVbImd1+Ae1ny+RY6s+ND0HxwyGU
 v/TThKHxEF1KqSFNpPaksCT2N0bpMT6XD42H/MSENQcaJOCplfOT5uSYCsp1GY3kpRMg
 1FSw==
X-Gm-Message-State: AO0yUKVmCkhXcmyobmwvRSph1DPdAMBMo3nXtei0sw+UcVxeEq5hqQjt
 rzxo60j+8IDA71AKv4clar6OFoZ1EiNaMatVf5c/9yn1JeiGsD/ZDRCcFOEIkj6hHxzb4X692od
 S/NerUZVgn5qr0wpwOxs1vIrEUT/iVcB4tTQCZFe8HSh/tA==
X-Received: by 2002:a17:906:b88d:b0:8b1:806b:7dbb with SMTP id
 hb13-20020a170906b88d00b008b1806b7dbbmr5311148ejb.51.1678870211622; 
 Wed, 15 Mar 2023 01:50:11 -0700 (PDT)
X-Google-Smtp-Source: AK7set8BrxBJxTiQJMn1ONR9mZPN9eAhxlL6kgUVa50qk1+ymSvM1BVw8YuKCkSkwT3Q4kYxusbG4A==
X-Received: by 2002:a17:906:b88d:b0:8b1:806b:7dbb with SMTP id
 hb13-20020a170906b88d00b008b1806b7dbbmr5311133ejb.51.1678870211242; 
 Wed, 15 Mar 2023 01:50:11 -0700 (PDT)
Received: from gollum ([194.191.244.86]) by smtp.gmail.com with ESMTPSA id
 y21-20020a1709064b1500b00905a1abecbfsm2198997eju.47.2023.03.15.01.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 01:50:10 -0700 (PDT)
Date: Wed, 15 Mar 2023 09:50:08 +0100
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 1/3] drm/msm/adreno: Add Adreno A690 support
Message-ID: <20230315095008.7d650ebe@gollum>
In-Reply-To: <20230208034052.2047681-2-quic_bjorande@quicinc.com>
References: <20230208034052.2047681-1-quic_bjorande@quicinc.com>
 <20230208034052.2047681-2-quic_bjorande@quicinc.com>
Organization: Canonical Ltd
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ku5ZPn.n_cuALSq6c8Lqvju";
 protocol="application/pgp-signature"; micalg=pgp-sha512
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
Cc: devicetree@vger.kernel.org, mani@kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, johan@kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/ku5ZPn.n_cuALSq6c8Lqvju
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Feb 2023 19:40:50 -0800
Bjorn Andersson <quic_bjorande@quicinc.com> wrote:

> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>=20
> Introduce support for the Adreno A690, found in Qualcomm SC8280XP.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 120 ++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c      |  34 ++++++
>  drivers/gpu/drm/msm/adreno/adreno_device.c |  14 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  10 +-
>  4 files changed, 173 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index aae60cbd9164..81dfcc5073ad 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -588,6 +588,63 @@ const struct adreno_reglist a660_hwcg[] =3D {
>  	{},
>  };
> =20
> +const struct adreno_reglist a690_hwcg[] =3D {
> +	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
> +	{REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000F3CF},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111},
> +	{REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01002222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220},
> +	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040F00},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x25222022},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011},
> +	{REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222},
> +	{REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222},
> +	{REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x00222222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002},
> +	{REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004},
> +	{REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_TEX_FCHE, 0x00000222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_TEX_FCHE, 0x00000111},
> +	{REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002},
> +	{REG_A6XX_RBBM_CLOCK_CNTL, 0x8AA8AA82},
> +	{REG_A6XX_RBBM_ISDB_CNT, 0x00000182},
> +	{REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000},
> +	{REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
> +	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
> +	{REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL, 0x20200},
> +	{REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL, 0x10111},
> +	{REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL, 0x5555},
> +	{}
> +};
> +
>  static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>  {
>  	struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> @@ -747,6 +804,45 @@ static const u32 a660_protect[] =3D {
>  	A6XX_PROTECT_NORDWR(0x1f8c0, 0x0000), /* note: infinite range */
>  };
> =20
> +/* These are for a690 */
> +static const u32 a690_protect[] =3D {
> +	A6XX_PROTECT_RDONLY(0x00000, 0x004ff),
> +	A6XX_PROTECT_RDONLY(0x00501, 0x00001),
> +	A6XX_PROTECT_RDONLY(0x0050b, 0x002f4),
> +	A6XX_PROTECT_NORDWR(0x0050e, 0x00000),
> +	A6XX_PROTECT_NORDWR(0x00510, 0x00000),
> +	A6XX_PROTECT_NORDWR(0x00534, 0x00000),
> +	A6XX_PROTECT_NORDWR(0x00800, 0x00082),
> +	A6XX_PROTECT_NORDWR(0x008a0, 0x00008),
> +	A6XX_PROTECT_NORDWR(0x008ab, 0x00024),
> +	A6XX_PROTECT_RDONLY(0x008d0, 0x000bc),
> +	A6XX_PROTECT_NORDWR(0x00900, 0x0004d),
> +	A6XX_PROTECT_NORDWR(0x0098d, 0x00272),
> +	A6XX_PROTECT_NORDWR(0x00e00, 0x00001),
> +	A6XX_PROTECT_NORDWR(0x00e03, 0x0000c),
> +	A6XX_PROTECT_NORDWR(0x03c00, 0x000c3),
> +	A6XX_PROTECT_RDONLY(0x03cc4, 0x01fff),
> +	A6XX_PROTECT_NORDWR(0x08630, 0x001cf),
> +	A6XX_PROTECT_NORDWR(0x08e00, 0x00000),
> +	A6XX_PROTECT_NORDWR(0x08e08, 0x00008),
> +	A6XX_PROTECT_NORDWR(0x08e50, 0x0001f),
> +	A6XX_PROTECT_NORDWR(0x08e80, 0x0027f),
> +	A6XX_PROTECT_NORDWR(0x09624, 0x001db),
> +	A6XX_PROTECT_NORDWR(0x09e60, 0x00011),
> +	A6XX_PROTECT_NORDWR(0x09e78, 0x00187),
> +	A6XX_PROTECT_NORDWR(0x0a630, 0x001cf),
> +	A6XX_PROTECT_NORDWR(0x0ae02, 0x00000),
> +	A6XX_PROTECT_NORDWR(0x0ae50, 0x0012f),
> +	A6XX_PROTECT_NORDWR(0x0b604, 0x00000),
> +	A6XX_PROTECT_NORDWR(0x0b608, 0x00006),
> +	A6XX_PROTECT_NORDWR(0x0be02, 0x00001),
> +	A6XX_PROTECT_NORDWR(0x0be20, 0x0015f),
> +	A6XX_PROTECT_NORDWR(0x0d000, 0x005ff),
> +	A6XX_PROTECT_NORDWR(0x0f000, 0x00bff),
> +	A6XX_PROTECT_RDONLY(0x0fc00, 0x01fff),
> +	A6XX_PROTECT_NORDWR(0x11c00, 0x00000), /*note: infiite range */
> +};
> +
>  static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> @@ -758,6 +854,11 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>  		count =3D ARRAY_SIZE(a650_protect);
>  		count_max =3D 48;
>  		BUILD_BUG_ON(ARRAY_SIZE(a650_protect) > 48);
> +	} else if (adreno_is_a690(adreno_gpu)) {
> +		regs =3D a690_protect;
> +		count =3D ARRAY_SIZE(a690_protect);
> +		count_max =3D 48;
> +		BUILD_BUG_ON(ARRAY_SIZE(a690_protect) > 48);
>  	} else if (adreno_is_a660_family(adreno_gpu)) {
>  		regs =3D a660_protect;
>  		count =3D ARRAY_SIZE(a660_protect);
> @@ -806,6 +907,13 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  		uavflagprd_inv =3D 2;
>  	}
> =20
> +	if (adreno_is_a690(adreno_gpu)) {
> +		lower_bit =3D 2;
> +		amsbc =3D 1;
> +		rgb565_predicator =3D 1;
> +		uavflagprd_inv =3D 2;
> +	}
> +
>  	if (adreno_is_7c3(adreno_gpu)) {
>  		lower_bit =3D 1;
>  		amsbc =3D 1;
> @@ -1065,13 +1173,18 @@ static int hw_init(struct msm_gpu *gpu)
>  	if (adreno_is_a660_family(adreno_gpu))
>  		gpu_write(gpu, REG_A6XX_CP_LPAC_PROG_FIFO_SIZE, 0x00000020);
> =20
> +	if (adreno_is_a690(adreno_gpu)) {
> +		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x0);
> +		gpu_write(gpu, REG_A6XX_CP_LPAC_PROG_FIFO_SIZE, 0x00000020);
> +	}
> +
>  	/* Setting the mem pool size */
>  	gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 128);
> =20
>  	/* Setting the primFifo thresholds default values,
>  	 * and vccCacheSkipDis=3D1 bit (0x200) for A640 and newer
>  	*/
> -	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
> +	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu) || adreno_=
is_a690(adreno_gpu))
>  		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
>  	else if (adreno_is_a640_family(adreno_gpu) || adreno_is_7c3(adreno_gpu))
>  		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
> @@ -1579,7 +1692,7 @@ static void a6xx_llc_activate(struct a6xx_gpu *a6xx=
_gpu)
>  		/* On A660, the SCID programming for UCHE traffic is done in
>  		 * A6XX_GBIF_SCACHE_CNTL0[14:10]
>  		 */
> -		if (adreno_is_a660_family(adreno_gpu))
> +		if (adreno_is_a660_family(adreno_gpu) || adreno_is_a690(adreno_gpu))
>  			gpu_rmw(gpu, REG_A6XX_GBIF_SCACHE_CNTL0, (0x1f << 10) |
>  				(1 << 8), (gpu_scid << 10) | (1 << 8));
>  	}
> @@ -2006,7 +2119,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *de=
v)
>  	info =3D adreno_info(config->rev);
> =20
>  	if (info && (info->revn =3D=3D 650 || info->revn =3D=3D 660 ||
> -			adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), info->rev)))
> +		     info->revn =3D=3D 690 ||
> +		     adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), info->rev)))
>  		adreno_gpu->base.hw_apriv =3D true;
> =20
>  	a6xx_llc_slices_init(pdev, a6xx_gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/=
adreno/a6xx_hfi.c
> index 2cc83e049613..4d6d68a25931 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -4,6 +4,7 @@
>  #include <linux/completion.h>
>  #include <linux/circ_buf.h>
>  #include <linux/list.h>
> +#include <soc/qcom/cmd-db.h>
> =20
>  #include "a6xx_gmu.h"
>  #include "a6xx_gmu.xml.h"
> @@ -414,6 +415,37 @@ static void a650_build_bw_table(struct a6xx_hfi_msg_=
bw_table *msg)
>  	msg->cnoc_cmds_data[1][0] =3D  0x60000001;
>  }
> =20
> +static void a690_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +{
> +	/*
> +	 * Send a single "off" entry just to get things running
> +	 * TODO: bus scaling
> +	 */
> +	msg->bw_level_num =3D 1;
> +
> +	msg->ddr_cmds_num =3D 3;
> +	msg->ddr_wait_bitmask =3D 0x01;
> +
> +	msg->ddr_cmds_addrs[0] =3D cmd_db_read_addr("SH0");
> +	msg->ddr_cmds_addrs[1] =3D cmd_db_read_addr("MC0");
> +	msg->ddr_cmds_addrs[2] =3D cmd_db_read_addr("ACV");
> +
> +	msg->ddr_cmds_data[0][0] =3D  0x40000000;
> +	msg->ddr_cmds_data[0][1] =3D  0x40000000;
> +	msg->ddr_cmds_data[0][2] =3D  0x40000000;
> +
> +	/*
> +	 * These are the CX (CNOC) votes - these are used by the GMU but the
> +	 * votes are known and fixed for the target
> +	 */
> +	msg->cnoc_cmds_num =3D 1;
> +	msg->cnoc_wait_bitmask =3D 0x01;
> +
> +	msg->cnoc_cmds_addrs[0] =3D cmd_db_read_addr("CN0");
> +	msg->cnoc_cmds_data[0][0] =3D  0x40000000;
> +	msg->cnoc_cmds_data[1][0] =3D  0x60000001;
> +}
> +
>  static void a660_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  {
>  	/*
> @@ -531,6 +563,8 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gm=
u)
>  		adreno_7c3_build_bw_table(&msg);
>  	else if (adreno_is_a660(adreno_gpu))
>  		a660_build_bw_table(&msg);
> +	else if (adreno_is_a690(adreno_gpu))
> +		a690_build_bw_table(&msg);
>  	else
>  		a6xx_build_bw_table(&msg);
> =20
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm=
/msm/adreno/adreno_device.c
> index ca38b837dedb..437515e46e5a 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -355,6 +355,20 @@ static const struct adreno_info gpulist[] =3D {
>  		.init =3D a6xx_gpu_init,
>  		.zapfw =3D "a640_zap.mdt",
>  		.hwcg =3D a640_hwcg,
> +	}, {
> +		.rev =3D ADRENO_REV(6, 9, 0, ANY_ID),
> +		.revn =3D 690,
> +		.name =3D "A690",
> +		.fw =3D {
> +			[ADRENO_FW_SQE] =3D "a660_sqe.fw",
> +			[ADRENO_FW_GMU] =3D "a690_gmu.bin",
> +		},
> +		.gmem =3D SZ_4M,
> +		.inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> +		.init =3D a6xx_gpu_init,
> +		.zapfw =3D "a690_zap.mdt",
> +		.hwcg =3D a690_hwcg,
> +		.address_space_size =3D SZ_16G,
>  	},
>  };

This needs

MODULE_FIRMWARE("qcom/a660_sqe.fw");
MODULE_FIRMWARE("qcom/a690_gmu.bin");
MODULE_FIRMWARE("qcom/a690_zap.mbn");

...Juerg

 =20
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index b4f9b1343d63..da29bd392388 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -55,7 +55,7 @@ struct adreno_reglist {
>  	u32 value;
>  };
> =20
> -extern const struct adreno_reglist a615_hwcg[], a630_hwcg[], a640_hwcg[]=
, a650_hwcg[], a660_hwcg[];
> +extern const struct adreno_reglist a615_hwcg[], a630_hwcg[], a640_hwcg[]=
, a650_hwcg[], a660_hwcg[], a690_hwcg[];
> =20
>  struct adreno_info {
>  	struct adreno_rev rev;
> @@ -272,6 +272,11 @@ static inline int adreno_is_a660(struct adreno_gpu *=
gpu)
>  	return gpu->revn =3D=3D 660;
>  }
> =20
> +static inline int adreno_is_a690(struct adreno_gpu *gpu)
> +{
> +	return gpu->revn =3D=3D 690;
> +};
> +
>  /* check for a615, a616, a618, a619 or any derivatives */
>  static inline int adreno_is_a615_family(struct adreno_gpu *gpu)
>  {
> @@ -286,7 +291,8 @@ static inline int adreno_is_a660_family(struct adreno=
_gpu *gpu)
>  /* check for a650, a660, or any derivatives */
>  static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
>  {
> -	return gpu->revn =3D=3D 650 || gpu->revn =3D=3D 620 || adreno_is_a660_f=
amily(gpu);
> +	return gpu->revn =3D=3D 650 || gpu->revn =3D=3D 620  || gpu->revn =3D=
=3D 690 ||
> +	       adreno_is_a660_family(gpu);
>  }
> =20
>  u64 adreno_private_address_space_size(struct msm_gpu *gpu);


--Sig_/ku5ZPn.n_cuALSq6c8Lqvju
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhZfU96IuprviLdeLD9OLCQumQrcFAmQRhsAACgkQD9OLCQum
QrcaEg/+KR5Z168oZC28DaAtwaoOf6caom+zx2RWTcFnxbGC+y1txYE9vacG7CMT
Py3wvkWaVmwYNxa1LuJR5VpBG1LWk5tFlKAV/oVK9/ggvErq6qkN0uKiFONkYaxW
rc2Mc9m6nvOS/uV2ZBU2a+9TjdkxekTGAXlyAk1uYZ53uzx9eW4zFy3OpmmDlPzp
4J9Xdn7uT/NejOmklbVZZN2Uerk4+PXAHKu6mpzJQQMmHLPlykSaJqwgq36vzgFC
Jckf2/CAWLllJ+5ETa9yc0kTk3zI5580Aor7e4ovVVrImpW+vzWCMqcJfC9vJpOZ
RHdkcp1q3owGTvwtlrZS9Etbi/qxv4FuEgP+piSBpT5tqY5UFci7fvZ+DheB7waE
ydG85WLtsPjRT0g3S53v+UCqnhU/vl7WIp70pR6i8vW4a8kFgrXuzXgk/EQ3mLwP
4Oe3Penz/6nM48+lt3EwwryhcqkhjYq6Nj0tCDU47ocW9fwUWcNpTUOJbNMOY4Jw
HrIB6hQuDyQuDohhTNRssbQGFygLCuMB7UYoWFP6naFwxcAajoE8RkICIcnKqVSQ
e7ApBKhwn6b17e3ugoW8q2vtB0huy6L5+3hrMHNKhiKWJ9ss893Q7DrmgkLGVBTc
iSCbu7XfoFUqJK65NEH/9ZXvB+CHHzy2yXe5rw59twQSNFeT+34=
=rJ4c
-----END PGP SIGNATURE-----

--Sig_/ku5ZPn.n_cuALSq6c8Lqvju--
