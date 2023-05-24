Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2378E710197
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 01:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EFC410E69D;
	Wed, 24 May 2023 23:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED79A10E69A;
 Wed, 24 May 2023 23:16:29 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34ON0fYa030579; Wed, 24 May 2023 23:16:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/MtK5Q5yPT1hBdBsWtiNKMk10i6Lx8vd1JnfyOjcCoQ=;
 b=apSUPDvY9xdko3aYxWxgT2UogZwznZlcfsBXiqGABdbWOgJjPvEeff03j6W8R2erRS0P
 OaySbrbAVrIEM2z1d2TTywZIhJTtFR7IqxwjM9KR/PkAITPkgAC7zbrZ9hOR9KjwJGm3
 1TY6D68CQ+mdTGWurx59xgBTq6OrSYN00HLF0TNzZjR02clKt5wVTWQQ58ImejTy+Y4W
 qUVbIO2YeX+l71oYSBqm0Vn15NrnM91dDHABqDfpHkxckg4zTDqGA0LdMkNHd/l5Ijkp
 VDvizXCTggBM9YToWQ9AeyxUm7LZiQ77CBnzUUHblwIfZ3Cv5EW/fSbtkqhHNlO55wM9 GA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qsp508s48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 May 2023 23:16:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34ONGM9a009926
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 May 2023 23:16:22 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 24 May
 2023 16:16:21 -0700
Message-ID: <2a003674-29ef-f6c6-9a23-3eb93d2e479f@quicinc.com>
Date: Wed, 24 May 2023 16:16:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v2 10/13] drm/msm/dpu: add list of supported formats
 to the DPU caps
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-11-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230321011821.635977-11-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: yODsO1DS0nJy6P0__pBm51I_mXvc6LBP
X-Proofpoint-ORIG-GUID: yODsO1DS0nJy6P0__pBm51I_mXvc6LBP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_16,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305240193
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
> As we are going to add virtual planes, add the list of supported formats
> to the hw catalog entry. It will be used to setup universal planes, with
> later selecting a pipe depending on whether the YUV format is used for
> the framebuffer.
> 

If your usage of format_list is going to be internal to dpu_plane.c, I 
can think of another idea for this change.

This essentially translates to if (num_vig >= 1)

If we can just have a small helper to detect that from the catalog can 
we use that instead of adding formats to the dpu caps?

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 26 +++++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  4 +++
>   2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 212d546b6c5d..2d6944a9679a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -315,6 +315,8 @@ static const struct dpu_caps msm8998_dpu_caps = {
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>   	.max_hdeci_exp = MAX_HORZ_DECIMATION,
>   	.max_vdeci_exp = MAX_VERT_DECIMATION,
> +	.format_list = plane_formats_yuv,
> +	.num_formats = ARRAY_SIZE(plane_formats_yuv),
>   };
>   
>   static const struct dpu_caps qcm2290_dpu_caps = {
> @@ -324,6 +326,8 @@ static const struct dpu_caps qcm2290_dpu_caps = {
>   	.has_idle_pc = true,
>   	.max_linewidth = 2160,
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +	.format_list = plane_formats_yuv,
> +	.num_formats = ARRAY_SIZE(plane_formats_yuv),
>   };
>   
>   static const struct dpu_caps sdm845_dpu_caps = {
> @@ -339,6 +343,8 @@ static const struct dpu_caps sdm845_dpu_caps = {
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>   	.max_hdeci_exp = MAX_HORZ_DECIMATION,
>   	.max_vdeci_exp = MAX_VERT_DECIMATION,
> +	.format_list = plane_formats_yuv,
> +	.num_formats = ARRAY_SIZE(plane_formats_yuv),
>   };
>   
>   static const struct dpu_caps sc7180_dpu_caps = {
> @@ -350,6 +356,8 @@ static const struct dpu_caps sc7180_dpu_caps = {
>   	.has_idle_pc = true,
>   	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +	.format_list = plane_formats_yuv,
> +	.num_formats = ARRAY_SIZE(plane_formats_yuv),
>   };
>   
>   static const struct dpu_caps sm6115_dpu_caps = {
> @@ -361,6 +369,8 @@ static const struct dpu_caps sm6115_dpu_caps = {
>   	.has_idle_pc = true,
>   	.max_linewidth = 2160,
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +	.format_list = plane_formats_yuv,
> +	.num_formats = ARRAY_SIZE(plane_formats_yuv),
>   };
>   
>   static const struct dpu_caps sm8150_dpu_caps = {
> @@ -376,6 +386,8 @@ static const struct dpu_caps sm8150_dpu_caps = {
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>   	.max_hdeci_exp = MAX_HORZ_DECIMATION,
>   	.max_vdeci_exp = MAX_VERT_DECIMATION,
> +	.format_list = plane_formats_yuv,
> +	.num_formats = ARRAY_SIZE(plane_formats_yuv),
>   };
>   
>   static const struct dpu_caps sc8180x_dpu_caps = {
> @@ -391,6 +403,8 @@ static const struct dpu_caps sc8180x_dpu_caps = {
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>   	.max_hdeci_exp = MAX_HORZ_DECIMATION,
>   	.max_vdeci_exp = MAX_VERT_DECIMATION,
> +	.format_list = plane_formats_yuv,
> +	.num_formats = ARRAY_SIZE(plane_formats_yuv),
>   };
>   
>   static const struct dpu_caps sc8280xp_dpu_caps = {
> @@ -404,6 +418,8 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
>   	.has_3d_merge = true,
>   	.max_linewidth = 5120,
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +	.format_list = plane_formats_yuv,
> +	.num_formats = ARRAY_SIZE(plane_formats_yuv),
>   };
>   
>   static const struct dpu_caps sm8250_dpu_caps = {
> @@ -417,6 +433,8 @@ static const struct dpu_caps sm8250_dpu_caps = {
>   	.has_3d_merge = true,
>   	.max_linewidth = 900,
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +	.format_list = plane_formats_yuv,
> +	.num_formats = ARRAY_SIZE(plane_formats_yuv),
>   };
>   
>   static const struct dpu_caps sm8350_dpu_caps = {
> @@ -430,6 +448,8 @@ static const struct dpu_caps sm8350_dpu_caps = {
>   	.has_3d_merge = true,
>   	.max_linewidth = 4096,
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +	.format_list = plane_formats_yuv,
> +	.num_formats = ARRAY_SIZE(plane_formats_yuv),
>   };
>   
>   static const struct dpu_caps sm8450_dpu_caps = {
> @@ -443,6 +463,8 @@ static const struct dpu_caps sm8450_dpu_caps = {
>   	.has_3d_merge = true,
>   	.max_linewidth = 5120,
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +	.format_list = plane_formats_yuv,
> +	.num_formats = ARRAY_SIZE(plane_formats_yuv),
>   };
>   
>   static const struct dpu_caps sm8550_dpu_caps = {
> @@ -456,6 +478,8 @@ static const struct dpu_caps sm8550_dpu_caps = {
>   	.has_3d_merge = true,
>   	.max_linewidth = 5120,
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +	.format_list = plane_formats_yuv,
> +	.num_formats = ARRAY_SIZE(plane_formats_yuv),
>   };
>   
>   static const struct dpu_caps sc7280_dpu_caps = {
> @@ -467,6 +491,8 @@ static const struct dpu_caps sc7280_dpu_caps = {
>   	.has_idle_pc = true,
>   	.max_linewidth = 2400,
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +	.format_list = plane_formats_yuv,
> +	.num_formats = ARRAY_SIZE(plane_formats_yuv),
>   };
>   
>   static const struct dpu_mdp_cfg msm8998_mdp[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 89b372cdca92..4847aae78db2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -404,6 +404,8 @@ struct dpu_rotation_cfg {
>    * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
>    * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
>    * @max_vdeci_exp      max vertical decimation supported (max is 2^value)
> + * @format_list: Pointer to list of supported formats
> + * @num_formats: Number of supported formats
>    */
>   struct dpu_caps {
>   	u32 max_mixer_width;
> @@ -419,6 +421,8 @@ struct dpu_caps {
>   	u32 pixel_ram_size;
>   	u32 max_hdeci_exp;
>   	u32 max_vdeci_exp;
> +	const u32 *format_list;
> +	u32 num_formats;
>   };
>   
>   /**
