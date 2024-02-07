Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C849E84D125
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 19:25:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BB910E814;
	Wed,  7 Feb 2024 18:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ZaCgEz1h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2DFC10E70D;
 Wed,  7 Feb 2024 18:25:39 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 417GwMgn005540; Wed, 7 Feb 2024 18:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=DNGi1YuawnNGPvxuU/R67KNRx2k3Pf4Cv/X30yQEooQ=; b=Za
 CgEz1hdKcV8pYpPq8T9YT9DgWVWPYT25vU6X3Hzu5UCnHvvdl/ZTQytl3CKhr72b
 /B8ni48yNRE1lVtBSnXsNsv4SaO04u5AaSRufWXPgBZUm77ikQCHTJO/+9BTcEw8
 7MvovK4C358zCoSAiLRguf64qGesKJNhH63iCeaLmRPCZxLUO3ycLAHGYwCuXEmk
 jTEF5Oh+q2xIOL6dUxxMtFU21x/TA5cfmjcSM1J+AR8C5B5OzKIcbbqk4qb+ce/B
 kM7UB2FpLX6PUrZmeQuGThJv3UmfFVsI/y+EDfQGDDumFxSzLbRVf5FGbf9N4pK6
 y2PrBlcG+ISz6H9lI53A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w46r816p3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Feb 2024 18:25:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 417IPaXW010243
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 7 Feb 2024 18:25:36 GMT
Received: from [10.110.9.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 7 Feb
 2024 10:25:36 -0800
Message-ID: <89d02d5c-4af1-9f40-483f-1efb39b2a33d@quicinc.com>
Date: Wed, 7 Feb 2024 10:25:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/4] drm/msm/mdss: generate MDSS data for MDP5 platforms
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20240106-fd-migrate-mdp5-v3-0-3d2750378063@linaro.org>
 <20240106-fd-migrate-mdp5-v3-1-3d2750378063@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240106-fd-migrate-mdp5-v3-1-3d2750378063@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Ku-_XetKQn9Z-QJtOK3bUvStBZ-fSlPN
X-Proofpoint-ORIG-GUID: Ku-_XetKQn9Z-QJtOK3bUvStBZ-fSlPN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-07_09,2024-02-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 adultscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402070136
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



On 1/5/2024 3:34 PM, Dmitry Baryshkov wrote:
> Older (mdp5) platforms do not use per-SoC compatible strings. Instead
> they use a single compat entry 'qcom,mdss'. To facilitate migrating
> these platforms to the DPU driver provide a way to generate the MDSS /
> UBWC data at runtime, when the DPU driver asks for it.
> 
> It is not possible to generate this data structure at the probe time,
> since some platforms might not have MDP_CLK enabled, which makes reading
> HW_REV register return 0.
> 

I would have expected a crash if clock was not enabled and we tried to 
access the hw_rev register.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 51 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 455b2e3a0cdd..566a5dd5b8e8 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -3,6 +3,7 @@
>    * Copyright (c) 2018, The Linux Foundation
>    */
>   
> +#include <linux/bitfield.h>
>   #include <linux/clk.h>
>   #include <linux/delay.h>
>   #include <linux/interconnect.h>
> @@ -213,6 +214,49 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
>   	}
>   }
>   
> +#define MDSS_HW_MAJ_MIN		GENMASK(31, 16)
> +
> +#define MDSS_HW_MSM8996		0x1007
> +#define MDSS_HW_MSM8937		0x100e
> +#define MDSS_HW_MSM8956		0x1010

This should be 0x100B in the docs I see.

> +#define MDSS_HW_MSM8998		0x3000
> +#define MDSS_HW_SDM660		0x3002
> +#define MDSS_HW_SDM630		0x3003
> +
> +/*
> + * MDP5 platforms use generic qcom,mdp5 compat string, so we have to generate this data
> + */
> +static const struct msm_mdss_data *msm_mdss_generate_mdp5_mdss_data(struct msm_mdss *mdss)
> +{
> +	struct msm_mdss_data *data;
> +	u32 hw_rev;
> +
> +	data = devm_kzalloc(mdss->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return NULL;
> +
> +	hw_rev = readl_relaxed(mdss->mmio + HW_REV);
> +	hw_rev = FIELD_GET(MDSS_HW_MAJ_MIN, hw_rev);
> +
> +	if (hw_rev == MDSS_HW_MSM8996 ||
> +	    hw_rev == MDSS_HW_MSM8937 ||
> +	    hw_rev == MDSS_HW_MSM8956 ||
> +	    hw_rev == MDSS_HW_MSM8998 ||
> +	    hw_rev == MDSS_HW_SDM660 ||
> +	    hw_rev == MDSS_HW_SDM630) {
> +		data->ubwc_dec_version = UBWC_1_0;
> +		data->ubwc_enc_version = UBWC_1_0;
> +	}
> +
> +	if (hw_rev == MDSS_HW_MSM8996 ||
> +	    hw_rev == MDSS_HW_MSM8998)
> +		data->highest_bank_bit = 2;
> +	else
> +		data->highest_bank_bit = 1;
> +
> +	return data;
> +}
> +
>   const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
>   {
>   	struct msm_mdss *mdss;
> @@ -222,6 +266,13 @@ const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
>   
>   	mdss = dev_get_drvdata(dev);
>   
> +	/*
> +	 * We could not do it at the probe time, since hw revision register was
> +	 * not readable. Fill data structure now for the MDP5 platforms.
> +	 */
> +	if (!mdss->mdss_data && mdss->is_mdp5)
> +		mdss->mdss_data = msm_mdss_generate_mdp5_mdss_data(mdss);
> +
>   	return mdss->mdss_data;
>   }
>   
> 
