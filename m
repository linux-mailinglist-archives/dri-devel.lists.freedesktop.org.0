Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9592DA03055
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 20:16:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB5310E9D3;
	Mon,  6 Jan 2025 19:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="psvQ0/Oi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B52B110E9D2;
 Mon,  6 Jan 2025 19:16:26 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506GKT86025731;
 Mon, 6 Jan 2025 19:16:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iKSQvMeypoLEznLmQ0L2TDYdOo0EcLINZHEWJ/9oWmA=; b=psvQ0/OiL64hS7qb
 wl9vDwl7+LRGrlhdWfu7CNtNK+O0cYi+J3VNgGyKXJj4jaZVhmOA3z/aX3XaDdhm
 GzBjDAx4Epmg3CREtzFR0V+/63AJdhM+sNWvGHAR3zgDvsaqlJNMmh28DrZpBUAV
 VfjqJtmU5dO0ck1wF0xzFxCyQty43YeSnOUPRYaQ1L1Y5/f6zQLdD2RPzbRfcgBb
 ltATyrIF6dSkCYAomh0ki7kltRpFdPkDMFmCtqpVKvSEVcnMsWWzsZ3Jt4CFztFW
 fTeJSVzRPAcGU6HJ0Ho/0OR8Zwv+ayAAptNTUMbNbyDT+l0sRwV28JPLVR9p/9DX
 6/zrRQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440jm20cgr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2025 19:16:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 506JGMGx020960
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 6 Jan 2025 19:16:22 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 Jan 2025
 11:16:22 -0800
Message-ID: <acd91ca7-1951-4711-b76a-afe583eb0b27@quicinc.com>
Date: Mon, 6 Jan 2025 11:15:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Add writeback support for SM6150
To: Fange Zhang <quic_fangez@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Li Liu
 <quic_lliu6@quicinc.com>, Xiangxu Yin <quic_xiangxuy@quicinc.com>
References: <20250106-add-writeback-support-for-sm6150-v1-1-1d2d69fc4bae@quicinc.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250106-add-writeback-support-for-sm6150-v1-1-1d2d69fc4bae@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: EXheKS7_5y4KdAcr8ZAMdUkAN8PYBnxy
X-Proofpoint-ORIG-GUID: EXheKS7_5y4KdAcr8ZAMdUkAN8PYBnxy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501060169
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



On 1/5/2025 10:39 PM, Fange Zhang wrote:
> On the SM6150 platform there is WB_2 block. Add it to the SM6150 catalog.
> 
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
> A followup patch to add writeback configuration for the SM6150 catalog
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> index 621a2140f675fa28b3a7fcd8573e59b306cd6832..6d32deead77728264b6de6d5fd2843a81afdf355 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> @@ -27,6 +27,7 @@ static const struct dpu_mdp_cfg sm6150_mdp = {
>   		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
>   		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
>   		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
> +		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
>   	},
>   };
>   
> @@ -164,6 +165,21 @@ static const struct dpu_pingpong_cfg sm6150_pp[] = {
>   	},
>   };
>   
> +static const struct dpu_wb_cfg sm6150_wb[] = {
> +	{
> +		.name = "wb_2", .id = WB_2,
> +		.base = 0x66000, .len = 0x2c8,

This is not correct.

WB_2 offset is at 0x66000. However, MDP base address accounts for the 
0x1000 offset. So this should still be 0x65000.

Why is 0x66000 used here? It does not match the docs.

How was this change verified?

> +		.features = WB_SM8250_MASK,
> +		.format_list = wb2_formats_rgb,
> +		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
> +		.clk_ctrl = DPU_CLK_CTRL_WB2,
> +		.xin_id = 6,
> +		.vbif_idx = VBIF_RT,
> +		.maxlinewidth = 2160,
> +		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
> +	},
> +};
> +
>   static const struct dpu_intf_cfg sm6150_intf[] = {
>   	{
>   		.name = "intf_0", .id = INTF_0,
> @@ -244,6 +260,8 @@ const struct dpu_mdss_cfg dpu_sm6150_cfg = {
>   	.dspp = sm6150_dspp,
>   	.pingpong_count = ARRAY_SIZE(sm6150_pp),
>   	.pingpong = sm6150_pp,
> +	.wb_count = ARRAY_SIZE(sm6150_wb),
> +	.wb = sm6150_wb,
>   	.intf_count = ARRAY_SIZE(sm6150_intf),
>   	.intf = sm6150_intf,
>   	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> 
> ---
> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> change-id: 20250106-add-writeback-support-for-sm6150-ba7657196ea8
> 
> Best regards,
