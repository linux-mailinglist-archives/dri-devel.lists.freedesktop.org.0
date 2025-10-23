Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E58BBC00EDC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 13:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D423A10E3DF;
	Thu, 23 Oct 2025 11:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nh7K/qyJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C570210E3DF
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 11:56:54 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6tttr007459
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 11:56:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tpPdsaEHauFXuOQ3FeVM21QS
 oHXPkB2nkIlmQ3pOO0A=; b=nh7K/qyJsRELc5X2b3aQMPjE71LfYVHj/5XjCm/7
 E61pBj+4HxpY0mdkO3KDAdkb9AHseSodFeP8MTqBtJHdkFs65C/IXXQiQJzZm+ir
 TdEtWM0KUIz5whwnY8fQncaRLLfim5etOaMa2yp9kWMmtKT9yaXXOurDtph513YK
 E7O+O8hlt4aaTzbofBuOFc5bG11X9LGWDlFlYgKaHlERY0xhQfkWA9RnY6I8OO5k
 pAkNy1Us6XOijCFQ1NH5ZfGKsa6tYg8xOW/rvHaJJccEecesLa95y4Ga1WzCwQkC
 RhBfTOmV3v7mUzuegMahnE4CcO7pbY7Y2n9C73YtjSms2g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3448bar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 11:56:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e8a13eedecso19992971cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 04:56:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761220613; x=1761825413;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tpPdsaEHauFXuOQ3FeVM21QSoHXPkB2nkIlmQ3pOO0A=;
 b=qV0OM8QUVRw7GXAFbWYVOYUTvKRtjgYaTl05qmH5QvwUUGUyXML9VINavnMfy9oBdX
 golvvMv/HJe4dGwSG0RTNuIEEmbb64o9reHjMHuZFUKsyjEn4Rbqx8AzaJsR27S0MF3F
 lQ24Z+aC0hBwSoWC0tiJlduHjxOA3yeninC0EGpzP6EmGsbP1//Lw70jWA77F4pTxLB0
 o6GQdNRDhmGcgGyCR9U8VlHhh1zfhZk4j1bUnRT5QybvgIPfCBvCo6tukfL5IR3A1ExR
 UNjEcqNzJlp6GgO6/PUXswu5sRNQfzWUMK0s6RfnAqvQuMDKZfTbnAc0FSWOXGS25HXG
 ybaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT12XpQlmu6VMJB+XfLIQJ9YxPohHROxmbHHa4iI8QdW8jhfeXFDKFNvOqqFEBQEh9wmB+3RMaIs4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZDnkJ1qgyoE0LlN1jiONePtuIdueSr0xe65QCeN24jvmEXcVp
 RCbHXfopgB6HV9mw3yEjhcaUiUwB4RZUWu9SK5OZvjcBMycAQX84fDK4PxUWfc884AgxvVcaab8
 09yER10fYK14tbhE9fCfn7wAn3aC9oms5GTh0IjrmXsE4PKrxmgtD8FBGVNtwj/9U1MsB0TA=
X-Gm-Gg: ASbGncvvlL4N4Vg6d6RgthARtg9ifQ3fqKwOU3B204q/lsT3/nJjzYznKahgv0K2BsI
 v+ENUsJwfbGlRmazyXJgaxTZnPciRjiqRRp7+T6q9Dh3HfTrQwyyQIvww01+m+aNI7/4HIzv5fG
 jM8TJxlq2Ib5U73yr11aaveO86uaUXOHgHVOX3gFLCRbY9KMyseBV+HD4rRz3JLLYCqQKCKkqjc
 cmGDj1emkvft2gf20Wt7MS/Dgckp8CPKp8Wqg40EDX0x/rwTEahEdlJTOUquwzq+vMuWLfBli2y
 yfec6JclkvRwSUUoNkk0SGPs+es6ZSA3PlPhwIr38HCFxfS/AyYT3Uvfc1M8Ws9Sr0oHNyWOVnD
 oiyYx+BspDIgOG83NqXdvUczbFqu5eb8zgHVpv8ZNe0jBKcbZUFjuxnV3IW+penLl93ip/LErZz
 OEU9+eR7VGmhim
X-Received: by 2002:ac8:5993:0:b0:4e8:a6ca:8cc4 with SMTP id
 d75a77b69052e-4e8a6ca8ea4mr254047501cf.36.1761220612814; 
 Thu, 23 Oct 2025 04:56:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgWRY2Y+KuaUK4SaF+veOHZGIibqiY86yAk63PT8Vh9Dhaal9wVpNbOjWFt3nfEIC/E7BYNA==
X-Received: by 2002:ac8:5993:0:b0:4e8:a6ca:8cc4 with SMTP id
 d75a77b69052e-4e8a6ca8ea4mr254047291cf.36.1761220612307; 
 Thu, 23 Oct 2025 04:56:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-592f4cd5db4sm676385e87.48.2025.10.23.04.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 04:56:51 -0700 (PDT)
Date: Thu, 23 Oct 2025 14:56:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 02/12] drm/msm/dpu: Add support for Kaanapali DPU
Message-ID: <b35l5nwswf6t4k32edqccytrfjbvaloqoh4hksfkqrqmrsx4ee@3aatdgwmxp4g>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-3-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023075401.1148-3-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-GUID: 6LWHIxYdgXWyAJI9Ezi5_J_rShC_PyZd
X-Proofpoint-ORIG-GUID: 6LWHIxYdgXWyAJI9Ezi5_J_rShC_PyZd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX5U6u/DCL03ry
 GGlIP+eDiKWwUpXFxGyPeI0k1HVOkbuuqfpsnepr2QszEMt+uLVbhhsBpkUYfhu2IEN9Rr6i3DU
 Y25c0FzW78aeQ6brs9X16nZRmq1pD7OLyG5X2JTkFJQ1fKu6eXyd6havMro9Z5KT+KQCJQw52r2
 0EgKSFGaGWPkozgA0eZzOUIe3nbIR/yqWhdIIWUgHOYgYn8WU7JcDXwkr7+cmgxXjUB1pEy3pZT
 7y6Wzt1HK6+Hs+MK+yypYHNbgxgURA/FhoGHlFlKrt0GAARysT/RiJM0hR3R8xSntM0PuQxqGXh
 Da3HDyhTHlu6czlQW0wtNglCmp0Q+K2PMzii2tzoWScpVYcCdD4VHwkN6LU3oo496ZCEepdsX/4
 3iPfBcu47Tp3UHgWrD082iist4U5WQ==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68fa1806 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=3f62vzWW0BdxBdE7m60A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023
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

On Thu, Oct 23, 2025 at 03:53:51PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add support for Display Processing Unit (DPU) version 13.0
> on the Kaanapali platform. This version introduces changes
> to the SSPP sub-block structure. Add common block and rectangle
> blocks to accommodate these structural modifications for compatibility.

This needs to come up differently: first implement driver changes for
the changed SSPP blocks, then add Kaananapali catalog entries.

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../disp/dpu1/catalog/dpu_13_0_kaanapali.h    | 492 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  44 ++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  29 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>  4 files changed, 565 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
> 
> +
> +static const struct dpu_cwb_cfg kaanapali_cwb[] = {
> +	{
> +		.name = "cwb_0", .id = CWB_0,
> +		.base = 0x169200, .len = 0x20,
> +	},
> +	{
> +		.name = "cwb_1", .id = CWB_1,
> +		.base = 0x169600, .len = 0x20,
> +	},
> +	{
> +		.name = "cwb_2", .id = CWB_2,
> +		.base = 0x16A200, .len = 0x20,
> +	},
> +	{
> +		.name = "cwb_3", .id = CWB_3,
> +		.base = 0x16A600, .len = 0x20,

lowercase hex

> +	},
> +};
> +

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 6641455c4ec6..5a24ed0f818c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -241,6 +241,25 @@ static const u32 wb2_formats_rgb_yuv[] = {
>  	.rotation_cfg = NULL, \
>  	}
>  
> +/* kaanapali SSPP common configuration */
> +#define _KAANAPALI_VIG_SBLK(scaler_ver) \

And then it gets reused for some other platform... No. Please come up
with a generic enough name.


> +	{ \
> +	.cmn_blk = {.name = "cmn_blk", \
> +		.base = 0, .len = 0x100,},	\

No, sblks shouldn't have .base set to 0. It's the main block.

> +	.sspp_rec0_blk = {.name = "sspp_rec0", \
> +		.base = 0x1000, .len = 0x180,},	\
> +	.csc_blk = {.name = "csc", \
> +		.base = 0x1800, .len = 0x100,}, \
> +	.scaler_blk = {.name = "scaler", \
> +		.version = scaler_ver, \
> +		.base = 0x2000, .len = 0xec,}, \
> +	.sspp_rec1_blk = {.name = "sspp_rec1", \
> +		.base = 0x3000, .len = 0x180,},	\
> +	.format_list = plane_formats_yuv, \
> +	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
> +	.rotation_cfg = NULL, \
> +	}
> +
>  #define _VIG_SBLK_ROT(scaler_ver, rot_cfg) \
>  	{ \
>  	.scaler_blk = {.name = "scaler", \
> @@ -329,6 +348,9 @@ static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_3 =
>  static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_4 =
>  				_VIG_SBLK(SSPP_SCALER_VER(3, 4));
>  
> +static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_5 =
> +				_KAANAPALI_VIG_SBLK(SSPP_SCALER_VER(3, 5));
> +
>  static const struct dpu_sspp_sub_blks dpu_rgb_sblk = _RGB_SBLK();
>  
>  static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
> @@ -412,6 +434,11 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>  	.len = 0x20, .version = 0x20000},
>  };
>  
> +static const struct dpu_pingpong_sub_blks kaanapali_pp_sblk = {
> +	.dither = {.name = "dither", .base = 0xc0,
> +	.len = 0x40, .version = 0x30000},
> +};
> +
>  /*************************************************************
>   * DSC sub blocks config
>   *************************************************************/
> @@ -452,6 +479,13 @@ static const struct dpu_cdm_cfg dpu_cdm_5_x = {
>  	.base = 0x79200,
>  };
>  
> +static const struct dpu_cdm_cfg dpu_cdm_kaanapali_x = {

13_x

> +	.name = "cdm_0",
> +	.id = CDM_0,
> +	.len = 0x240,
> +	.base = 0x19e000,
> +};
> +
>  /*************************************************************
>   * VBIF sub blocks config
>   *************************************************************/
> @@ -639,6 +673,10 @@ static const struct dpu_qos_lut_entry sc7180_qos_linear[] = {
>  	{.fl = 0, .lut = 0x0011222222335777},
>  };
>  
> +static const struct dpu_qos_lut_entry kaanapali_qos_linear[] = {
> +	{.fl = 0, .lut = 0x0011223344556666},
> +};
> +
>  static const struct dpu_qos_lut_entry sm6350_qos_linear_macrotile[] = {
>  	{.fl = 0, .lut = 0x0011223445566777 },
>  };
> @@ -668,6 +706,10 @@ static const struct dpu_qos_lut_entry sc7180_qos_macrotile[] = {
>  	{.fl = 0, .lut = 0x0011223344556677},
>  };
>  
> +static const struct dpu_qos_lut_entry kaanapali_qos_macrotile[] = {
> +	{.fl = 0, .lut = 0x0011223344556666},
> +};
> +
>  static const struct dpu_qos_lut_entry sc8180x_qos_macrotile[] = {
>  	{.fl = 10, .lut = 0x0000000344556677},
>  };
> @@ -726,3 +768,5 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
>  
>  #include "catalog/dpu_10_0_sm8650.h"
>  #include "catalog/dpu_12_0_sm8750.h"
> +#include "catalog/dpu_13_0_kaanapali.h"
> +
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index f0768f54e9b3..99c81c24630f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -208,6 +208,30 @@ struct dpu_dsc_blk {
>  	u32 len;
>  };
>  
> +/**
> + * struct dpu_sspp_rec_blk - sspp rec sub-blk information

SSPP, REC

> + * @name: string name for debug purposes
> + * @base: offset of this sub-block relative to the block offset
> + * @len: register block length of this sub-block
> + */
> +struct dpu_sspp_rec_blk {
> +	char name[DPU_HW_BLK_NAME_LEN];
> +	u32 base;
> +	u32 len;
> +};
> +
> +/**
> + * struct dpu_sspp_cmn_blk - sspp common sub-blk information
> + * @name: string name for debug purposes
> + * @base: offset of this sub-block relative to the block offset
> + * @len: register block length of this sub-block
> + */
> +struct dpu_sspp_cmn_blk {
> +	char name[DPU_HW_BLK_NAME_LEN];
> +	u32 base;
> +	u32 len;
> +};
> +
>  /**
>   * enum dpu_qos_lut_usage - define QoS LUT use cases
>   */
> @@ -294,7 +318,9 @@ struct dpu_sspp_sub_blks {
>  	u32 qseed_ver;
>  	struct dpu_scaler_blk scaler_blk;
>  	struct dpu_pp_blk csc_blk;
> -
> +	struct dpu_sspp_cmn_blk cmn_blk;
> +	struct dpu_sspp_rec_blk sspp_rec0_blk;
> +	struct dpu_sspp_rec_blk sspp_rec1_blk;
>  	const u32 *format_list;
>  	u32 num_formats;
>  	const struct dpu_rotation_cfg *rotation_cfg;
> @@ -778,6 +804,7 @@ extern const struct dpu_mdss_cfg dpu_sa8775p_cfg;
>  extern const struct dpu_mdss_cfg dpu_sm8550_cfg;
>  extern const struct dpu_mdss_cfg dpu_sm8650_cfg;
>  extern const struct dpu_mdss_cfg dpu_sm8750_cfg;
> +extern const struct dpu_mdss_cfg dpu_kaanapali_cfg;
>  extern const struct dpu_mdss_cfg dpu_x1e80100_cfg;
>  
>  #endif /* _DPU_HW_CATALOG_H */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 4e5a8ecd31f7..15bec44324d5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1505,6 +1505,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
>  };
>  
>  static const struct of_device_id dpu_dt_match[] = {
> +	{ .compatible = "qcom,kaanapali-dpu", .data = &dpu_kaanapali_cfg, },
>  	{ .compatible = "qcom,msm8917-mdp5", .data = &dpu_msm8917_cfg, },
>  	{ .compatible = "qcom,msm8937-mdp5", .data = &dpu_msm8937_cfg, },
>  	{ .compatible = "qcom,msm8953-mdp5", .data = &dpu_msm8953_cfg, },
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
