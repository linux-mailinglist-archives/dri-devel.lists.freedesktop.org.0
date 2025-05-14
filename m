Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9BFAB75CF
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 21:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A4B10E064;
	Wed, 14 May 2025 19:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9/CpuFq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B513310E700
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:24:26 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJDpe4003408
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=eQR1rmDpKGw6ihZhkLYKtVUs
 1c4G12XUKIRhR29qxqc=; b=W9/CpuFqoxFk4oct/DL5v0YiVYX4xl0t48emWGK6
 nHUDG+2YZD2RF9UsYCRLzxUxEd2i1PARLuBxNiq/1otJ0aS9ECQWm3AGrYMhRBaT
 ua5cKMV6co9F+z5sYjjkV4TT+TYK7NTXCceeYKpF8wvVa0Kr+8xEOn7Nj5A/0V1q
 xsd6puGFb6fLTQtGEVu5Alt+CJfh0zlqRaLU8bk/hXMqAnZ6Cq67ZmFAfgV30Joa
 AnGPB0LCabrkA37m61riZ9hXyzcCgm4e4ui5IxovbeQqxs7Fj976W0E8xrfIjBf2
 loW/a8s7dAbyxDjdnrMIWI+VR77KmizxfyqO7QF/PqUGdQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpbudu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:24:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5d608e703so18345785a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 12:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747250665; x=1747855465;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eQR1rmDpKGw6ihZhkLYKtVUs1c4G12XUKIRhR29qxqc=;
 b=McCUGUiEFEsInf3Y7bPoCvSK5FW3DjHytsMyNwt5pQYTImy2WMsJ47VhcztkGFyiHl
 1z1gFVLv9LAbDkv0Xt5n6vfbVQXVZT/H08R1Efk6inzqnpeLwIESezqMC67tlOh/8yAC
 gzLPf5QWGbQzqVHDAuBBcNC+oqm6ksEVyeOkURFF9/X+a3Vg73Z6uIYqUDA86GOVJG6b
 nDKTFWCUvKedF1WDPi7zLPytDLtiBT+EqSlLWOwirSTFBmBnJ4vsHRFiY/HqxmgGCXPw
 lQ7ROltFwVZ8gq30QuROT+abpT4g3ZcRTAlHh74ciM3CkJT0HBUV8Dd/DnQqDnEOH23n
 Oo7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXTQ6AHdw20J3t0Vu7hMv/zD/B5zUzywYOS1BLP3L5YaJD7JZ4RNBxVyfRor9SHgSs0WRMPyDuRsU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8u2ORaU1EHbI/1SEDOwE4jSteVDUrkDWc5Zwx0vixTtXiqdCi
 IFa6dayFAE/xY8KjuxmZPQQLp8nu2lW0wUUDTuSOppzpnglKi0fCJyL9NAw+L8RiAGNdWMt/QyT
 eD8WHeRAzac+BgzB8PxxUV5yPLShGTlKoIUZw1Vyv+5uAY65PEdHcUs9/oyjHWCY8+Ug=
X-Gm-Gg: ASbGncumk4OKELvwXoQstPQEc2ZNHsc1Aq89uRBQ/+dpF7ma3M9KX6ddsxT7LpYhY+6
 UqzBLRN3N2aO6RJsh0eyWSpdgi/kkYzhrfRVUXEff1HfGn6DSPBkG4mt9CZbV7+6e78+q0yXv0S
 +gS3c5er/2+G5Xm5UenkWhzUHzg+VF2i4sVzfsYsAt5+BkTfnx5MErzpf55lt6AgFt34biVrRCC
 HlIDRHZgaubXnCq/wDLlhcIK3pNqmksq1oxza96GNbvx8mwUwQN6CEHlSZxYUuBcgHbT9UsbvgU
 qjDnY+gVwDfTWUGhkOwhdw1cIFPL/IYzlrlzwygCD1XKaJGEWEPSySVm3csr6RE+45huxXlnsXI
 =
X-Received: by 2002:a05:620a:44d3:b0:7ca:f3d0:e7c8 with SMTP id
 af79cd13be357-7cd2886351bmr772937885a.52.1747250664760; 
 Wed, 14 May 2025 12:24:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHes7rh6PmmaQxowWjXZMS7oaqmm/UsyM7XnI3cwPhtlFFbqaLiln/a23/dcBouCmzLjoUuRA==
X-Received: by 2002:a05:620a:44d3:b0:7ca:f3d0:e7c8 with SMTP id
 af79cd13be357-7cd2886351bmr772934685a.52.1747250664349; 
 Wed, 14 May 2025 12:24:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64ccef0sm2342528e87.237.2025.05.14.12.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 12:24:23 -0700 (PDT)
Date: Wed, 14 May 2025 22:24:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v2 14/15] soc: qcom: ubwc: Add #defines for UBWC
 swizzle bits
Message-ID: <c3txdoumutgk4exshhyi53ef4xziu5bbe3ib67hw4gsvulh4yt@522qphwu3ocx>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-14-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-14-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-GUID: ZYHY5ftH0WDBWvrSXDE2U7chefNvJ1vV
X-Proofpoint-ORIG-GUID: ZYHY5ftH0WDBWvrSXDE2U7chefNvJ1vV
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=6824edea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=BqShQr9RomFUbj8HExkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NyBTYWx0ZWRfX73bnL06cYfHr
 rFfiIdRRt2JGLkIggn9tLTBU9r/hR2dxBL7LqzoEeFsEQgL0HvNqcFXJMrEuNlHLQ5F5ZyGHWNA
 ZEyapnsXOaQL1gMYuMS84IG5/1O32Av4QK3+MF2lNSNm9LLCekneirmm3VEqDMYxEghD6/StuRZ
 Pyabsj0EK4qc/MMYsZbX58cnxJXtJ4Xh6BGNjTZyfZreMJYDQbkkRU5FHpGNZrEZ4OclFmCSxQR
 6qWunCl7VvzLzLqpD4fLBlb+qmoMuEPCJMhmETzewWmBBsx18uL0AMlCbL16b6bkEJ9KF6+ZkJC
 8TSIZ0CcqI2OnES0O9YkgylQkL3Nl6uApeQYgcBIUJOGCupYIplYQDYWUmQmz2+X0DdvI4nwFsc
 cKweUvU7pr9ZYjkTIl+xWHR3Rt8Acdq7HyWE/Nv7Cmh6r1ZevXOBhtfwd/UE7LfZBa+f8LpJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140177
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

On Wed, May 14, 2025 at 05:10:34PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Make the values a bit more meaningful.

Not sure if it's more meaningful or not. In the end, we all can read hex
masks.

> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 33 +++++++++++++++++++++------------
>  include/linux/soc/qcom/ubwc.h  |  2 ++
>  2 files changed, 23 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index 96b94cf01218cce2dacdba22c7573ba6148fcdd1..06ddf78eb08d31bcdd11f23dcf9ff32e390d2eff 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -32,7 +32,7 @@ static const struct qcom_ubwc_cfg_data qcm2290_data = {
>  static const struct qcom_ubwc_cfg_data sa8775p_data = {
>  	.ubwc_enc_version = UBWC_4_0,
>  	.ubwc_dec_version = UBWC_4_0,
> -	.ubwc_swizzle = 4,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(3),
>  	.ubwc_bank_spread = true,
>  	.highest_bank_bit = 13,
>  	.macrotile_mode = true,
> @@ -41,7 +41,8 @@ static const struct qcom_ubwc_cfg_data sa8775p_data = {
>  static const struct qcom_ubwc_cfg_data sar2130p_data = {
>  	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
>  	.ubwc_dec_version = UBWC_4_3,
> -	.ubwc_swizzle = 6,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
> +			UBWC_SWIZZLE_ENABLE_LVL(3),
>  	.ubwc_bank_spread = true,
>  	.highest_bank_bit = 13,
>  	.macrotile_mode = true,
> @@ -50,7 +51,8 @@ static const struct qcom_ubwc_cfg_data sar2130p_data = {
>  static const struct qcom_ubwc_cfg_data sc7180_data = {
>  	.ubwc_enc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
> -	.ubwc_swizzle = 6,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
> +			UBWC_SWIZZLE_ENABLE_LVL(3),
>  	.ubwc_bank_spread = true,
>  	.highest_bank_bit = 14,
>  };
> @@ -58,7 +60,8 @@ static const struct qcom_ubwc_cfg_data sc7180_data = {
>  static const struct qcom_ubwc_cfg_data sc7280_data = {
>  	.ubwc_enc_version = UBWC_3_0,
>  	.ubwc_dec_version = UBWC_4_0,
> -	.ubwc_swizzle = 6,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
> +			UBWC_SWIZZLE_ENABLE_LVL(3),
>  	.ubwc_bank_spread = true,
>  	.highest_bank_bit = 14,
>  	.macrotile_mode = true,
> @@ -74,7 +77,8 @@ static const struct qcom_ubwc_cfg_data sc8180x_data = {
>  static const struct qcom_ubwc_cfg_data sc8280xp_data = {
>  	.ubwc_enc_version = UBWC_4_0,
>  	.ubwc_dec_version = UBWC_4_0,
> -	.ubwc_swizzle = 6,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
> +			UBWC_SWIZZLE_ENABLE_LVL(3),
>  	.ubwc_bank_spread = true,
>  	.highest_bank_bit = 16,
>  	.macrotile_mode = true,
> @@ -95,7 +99,7 @@ static const struct qcom_ubwc_cfg_data sdm845_data = {
>  static const struct qcom_ubwc_cfg_data sm6115_data = {
>  	.ubwc_enc_version = UBWC_1_0,
>  	.ubwc_dec_version = UBWC_2_0,
> -	.ubwc_swizzle = 7,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_ALL,
>  	.ubwc_bank_spread = true,
>  	.highest_bank_bit = 14,
>  };
> @@ -103,7 +107,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
>  static const struct qcom_ubwc_cfg_data sm6125_data = {
>  	.ubwc_enc_version = UBWC_1_0,
>  	.ubwc_dec_version = UBWC_3_0,
> -	.ubwc_swizzle = 7,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_ALL,
>  	.highest_bank_bit = 14,
>  };
>  
> @@ -116,7 +120,8 @@ static const struct qcom_ubwc_cfg_data sm6150_data = {
>  static const struct qcom_ubwc_cfg_data sm6350_data = {
>  	.ubwc_enc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
> -	.ubwc_swizzle = 6,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
> +			UBWC_SWIZZLE_ENABLE_LVL(3),
>  	.ubwc_bank_spread = true,
>  	.highest_bank_bit = 14,
>  };
> @@ -136,7 +141,8 @@ static const struct qcom_ubwc_cfg_data sm8150_data = {
>  static const struct qcom_ubwc_cfg_data sm8250_data = {
>  	.ubwc_enc_version = UBWC_4_0,
>  	.ubwc_dec_version = UBWC_4_0,
> -	.ubwc_swizzle = 6,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
> +			UBWC_SWIZZLE_ENABLE_LVL(3),
>  	.ubwc_bank_spread = true,
>  	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
>  	.highest_bank_bit = 16,
> @@ -146,7 +152,8 @@ static const struct qcom_ubwc_cfg_data sm8250_data = {
>  static const struct qcom_ubwc_cfg_data sm8350_data = {
>  	.ubwc_enc_version = UBWC_4_0,
>  	.ubwc_dec_version = UBWC_4_0,
> -	.ubwc_swizzle = 6,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
> +			UBWC_SWIZZLE_ENABLE_LVL(3),
>  	.ubwc_bank_spread = true,
>  	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
>  	.highest_bank_bit = 16,
> @@ -156,7 +163,8 @@ static const struct qcom_ubwc_cfg_data sm8350_data = {
>  static const struct qcom_ubwc_cfg_data sm8550_data = {
>  	.ubwc_enc_version = UBWC_4_0,
>  	.ubwc_dec_version = UBWC_4_3,
> -	.ubwc_swizzle = 6,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
> +			UBWC_SWIZZLE_ENABLE_LVL(3),
>  	.ubwc_bank_spread = true,
>  	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
>  	.highest_bank_bit = 16,
> @@ -166,7 +174,8 @@ static const struct qcom_ubwc_cfg_data sm8550_data = {
>  static const struct qcom_ubwc_cfg_data x1e80100_data = {
>  	.ubwc_enc_version = UBWC_4_0,
>  	.ubwc_dec_version = UBWC_4_3,
> -	.ubwc_swizzle = 6,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
> +			UBWC_SWIZZLE_ENABLE_LVL(3),
>  	.ubwc_bank_spread = true,
>  	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
>  	.highest_bank_bit = 16,
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> index 30d9744c5d2e06d4aa93b64f7d2bc0e855c7a10b..2a12e054ec62ae7e76c3f3291d6963da726eee4f 100644
> --- a/include/linux/soc/qcom/ubwc.h
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -26,6 +26,8 @@ struct qcom_ubwc_cfg_data {
>  	 * controls level 2, and BIT(2) enables level 3.
>  	 */
>  	u32 ubwc_swizzle;
> +#define UBWC_SWIZZLE_ENABLE_ALL		GENMASK(2, 0)
> +#define UBWC_SWIZZLE_ENABLE_LVL(n)	BIT(((n) - 1))
>  
>  	/**
>  	 * @highest_bank_bit: Highest Bank Bit
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
