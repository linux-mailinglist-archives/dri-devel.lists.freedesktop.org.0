Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E17ABAF34
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 11:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2619310E28F;
	Sun, 18 May 2025 09:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OWcQIgYq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78A010E28F
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:59:49 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I6WV3c019610
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=K50CCOhb1oRvXdqTRxazbRT6
 Bc6ZaplqyOTawwp2iHI=; b=OWcQIgYqPHCqvOadeF2z3+wWe5ESOqrErI+jWY/x
 q5UcGZRPDiqUJTyK91vxfVqdoH9Duct/rlliGEGDrjkpiiVSahIHMCs8gCJU9Q3o
 ED87fm3cPVfb2sZLy52qX1D5b0aDz8yuor8Lk+dxJo/AB0ZF9AytO7aWktzd9P3V
 AqjfoFChpBHm3u4xdVWdsI8rKNBDnKjWPPACSNOGsrKR0/Tsre1LpxDAkwuE5gue
 Mcom6RTlP24CEwOyODkwxRYorhOfgm3RRGy53+6LyAdzyWq1cIkluphu4Nu0Hgro
 ra/7awc1wUEKsYGGVTrkFxdQChynVik1h/N94EhLI8ulLg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjp31tgj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:59:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f6f06890e2so110770306d6.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 02:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747562388; x=1748167188;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K50CCOhb1oRvXdqTRxazbRT6Bc6ZaplqyOTawwp2iHI=;
 b=vox+Q3/HZH1mEJygYRSycT4u3viaxdQlAh6DUU6Cn0+TqFVeJegh5PfcaUHzZTzjpm
 geeyxtaQhYM1KzNSEhEa5wyO4XLOyuFMUlCOx4aaxdgcJH/ooM8UyFoU2s/a8Q9dOPI8
 HaQg8sdNke3OFRd4ucf0XZWGD/ioHVOHxFYxkA6kva4TSLHu4u6TYtGzVtHo8UO0saEa
 XRYQy+W5QlR5IAMaa1HVjYvoJYzP9SM9FEnuQT+th4qYvbPs7+gQFmawGSckIV7RVOr0
 sAd3On5SnCID3Y2ugiAEQz0yD5Fqj93ltUr6PokTiFPE0E+7+jAufR/43IpJGns8nBiq
 nefw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/ht0yfgFX8MpDBGqSRzxJzKv2JU+lNGbw27M4EfnScJXXI9sDH0Za27ltKfIiaUqJUmJKbXAyKqM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yze8gCIUV/RJKYb8wgp1Ag+S+jno369K0IJYMLdLnTwqmfMMms/
 CtXZQRyih+YVNt/XVW96cm1Ln4apAWIuzXBu5Z6+uTyv83LzI0vMh8+gEJt3qPbZaTxKjajZp4A
 oqq2PHy2zqxOdFIyyWfLLZE7BV8pmdnWt0Q3ox21Ls2vuTLFI//yKrlGPptFaGkN7MLoQwlk=
X-Gm-Gg: ASbGncvViRiq5toM1l67nu1eUu28B8ULrXDpQ22OSk0yKxwkkr+++XXMfrJ31Z+GI/c
 XjV18kZoINPqE4NSPCufa2vRMF5S50uUhDAe8+qaBtGuQRD/ornkfEQcSjCxqGoL0Rt3RZ6Gzym
 goxv0Zawyfbj7sN3ZKFkshCMkYLX/YE1TKwUA1M4hOWwxFOS9Oi2bGWfgxXbpGlKzilqt9ajfoP
 b5qrR3pJ2jyppoDR3HWOCqQ09Z5MU5ctMn2MwV/MYNo/B1jfb3ljxTnoRTvnp/Xi5/C9oaWUU2k
 +xU28G5OZdoOkDESFzaKlVcOhex6bjLIRvbz6qa08o2VJTVCBx6UM2ro6d591JosPy4S2okglN4
 =
X-Received: by 2002:a05:6214:248a:b0:6f2:c81f:9ef0 with SMTP id
 6a1803df08f44-6f8b2d15058mr139256286d6.28.1747562387943; 
 Sun, 18 May 2025 02:59:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvht8meUEeI5mfZ3Bwjo3DPt0lB/3QmCreZafC8XgUYj5EDksJoZDDg/reTUlqAbsb+namaQ==
X-Received: by 2002:a05:6214:248a:b0:6f2:c81f:9ef0 with SMTP id
 6a1803df08f44-6f8b2d15058mr139256106d6.28.1747562387580; 
 Sun, 18 May 2025 02:59:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085f5d17sm13804061fa.113.2025.05.18.02.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 02:59:46 -0700 (PDT)
Date: Sun, 18 May 2025 12:59:45 +0300
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
Subject: Re: [PATCH RFT v3 13/14] soc: qcom: ubwc: Fill in UBWC swizzle cfg
 for platforms that lack one
Message-ID: <k57pmwohvnubbsxjxc7y74nkuayiktcrolbqlm5vorayrifemw@uuou33ffwdlb>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-13-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-13-3c8465565f86@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=B8u50PtM c=1 sm=1 tr=0 ts=6829af95 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=IaUOA4i9ptLxJl9v6jsA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 4s_Ph2umXqxFezLbelB5Gu4tozaGR1tQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5NCBTYWx0ZWRfXzZmMogd9ihHV
 SAnFwCZ4GNct3nRIIIk+RIlSg0zhsWqaQmGDsvEEjwtwFhOjJdqxHXgq2Wn173/28/fLyTBEGOz
 PhHvcjGOVARDjxQhEC8u+9/FOB/eCfxtlyvcEfreqlWu/xnom+46z2GoZP1hXAef6QIRO54i/CA
 TfXlhg3Dj23mww9xBZYgsVsrz5edw/oxdu4Pqrado28cVwWixO+0eKsAKKhiIG3lgVFwj5wrbMb
 noBFfBnbckTaXiNx8zq1FJTb/dZsdjmcuR8tfhqvVN/mv2XTo1CTYbbKU4b9pDXZWtnbDYbN26h
 lcW+7i3+f8a+P6HsaqYL2tJd3Y5suSHA+nHx+OpHAZQ6uuT24VVzo7/cb6qn5zRZHgVy+dGY0yk
 CPwne1C/lZU7ZTUFCoPmcEz2cx/qFkIPeD50Zu+wjsReiOXSOGe0xl4xvxPjCASAscYi6W0i
X-Proofpoint-GUID: 4s_Ph2umXqxFezLbelB5Gu4tozaGR1tQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180094
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

On Sat, May 17, 2025 at 07:32:47PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The UBWC 1.0 case is easy - it must be all 3 enabled.
> UBWC2.0 and 3.x require that level1 is removed, follow suit.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Ideally we should test this on relevant platforms, the commit LGTM

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index fe874ccd8df6acb4fac65f7d261afb05861117c2..a4b730dac6c4aaa609d41b2782c9dc522387d8dd 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -15,12 +15,18 @@
>  static const struct qcom_ubwc_cfg_data msm8937_data = {
>  	.ubwc_enc_version = UBWC_1_0,
>  	.ubwc_dec_version = UBWC_1_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
> +			UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 14,
>  };
>  
>  static const struct qcom_ubwc_cfg_data msm8998_data = {
>  	.ubwc_enc_version = UBWC_1_0,
>  	.ubwc_dec_version = UBWC_1_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
> +			UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 15,
>  };
>  
> @@ -70,6 +76,8 @@ static const struct qcom_ubwc_cfg_data sc7280_data = {
>  static const struct qcom_ubwc_cfg_data sc8180x_data = {
>  	.ubwc_enc_version = UBWC_3_0,
>  	.ubwc_dec_version = UBWC_3_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 16,
>  	.macrotile_mode = true,
>  };
> @@ -87,12 +95,16 @@ static const struct qcom_ubwc_cfg_data sc8280xp_data = {
>  static const struct qcom_ubwc_cfg_data sdm670_data = {
>  	.ubwc_enc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 14,
>  };
>  
>  static const struct qcom_ubwc_cfg_data sdm845_data = {
>  	.ubwc_enc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 15,
>  };
>  
> @@ -118,6 +130,8 @@ static const struct qcom_ubwc_cfg_data sm6125_data = {
>  static const struct qcom_ubwc_cfg_data sm6150_data = {
>  	.ubwc_enc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 14,
>  };
>  
> @@ -133,12 +147,16 @@ static const struct qcom_ubwc_cfg_data sm6350_data = {
>  static const struct qcom_ubwc_cfg_data sm7150_data = {
>  	.ubwc_enc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 14,
>  };
>  
>  static const struct qcom_ubwc_cfg_data sm8150_data = {
>  	.ubwc_enc_version = UBWC_3_0,
>  	.ubwc_dec_version = UBWC_3_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 15,
>  };
>  
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
