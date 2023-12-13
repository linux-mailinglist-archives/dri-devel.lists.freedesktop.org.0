Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DDD812063
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 22:04:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299E010E80B;
	Wed, 13 Dec 2023 21:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A79010E80B;
 Wed, 13 Dec 2023 21:04:48 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BDKalVI028033; Wed, 13 Dec 2023 21:04:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=ihpYFWWnterI/M7n6N8lxFYsutBZIy9xyS15gKnimk4=; b=Xs
 BtDFUy4K4/9RWn93c9zZtV2xSiDP17Zoa7YnD+lKSbGfK9H1qRdXyXRlhkAbp5p5
 BwxzsBSCV7TdCVXbBUb0if3xWpaZYYp7jK54S8E9ZSzTr1IO9PEJJXLswKB79Jmg
 dsDxJ5pfJfjWme/++is2+yDckxj3SaA+f/Vv529QwgyWMuoZK+O0FdAfYJLaFfuT
 Jsz/OlOkU63A+/DteQYC9RLnYe8LG97HBJE8FI1BZUdqaJ22qYPBjKqOz5hGBt6H
 /cTzLgyOJf2Y8eKVcR4qZD0c/3EPBRBVDLPhtcJ184GoM3PxIvopFRJasWMF5qv6
 dlZ7WMG8H2RHh6Hqdbzw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uy4dhjdt7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 21:04:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BDL4apE007824
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 21:04:36 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Dec
 2023 13:04:36 -0800
Message-ID: <1505c454-aaeb-bc80-7e1e-c0b2e1aa1197@quicinc.com>
Date: Wed, 13 Dec 2023 13:04:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] drm/msm/dpu: Set input_sel bit for INTF
Content-Language: en-US
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, "Sean
 Paul" <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 "David Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20231213-encoder-fixup-v2-0-b11a4ad35e5e@quicinc.com>
 <20231213-encoder-fixup-v2-1-b11a4ad35e5e@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231213-encoder-fixup-v2-1-b11a4ad35e5e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 3oj3WGXAvEMGL8Uy7hAIQgKCDjvtCn6x
X-Proofpoint-GUID: 3oj3WGXAvEMGL8Uy7hAIQgKCDjvtCn6x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312130149
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/13/2023 12:51 PM, Jessica Zhang wrote:
> Set the input_sel bit for encoders as it was missed in the initial
> implementation.
> 
> Reported-by: Rob Clark <robdclark@gmail.com>
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/39
> Fixes: 91143873a05d ("drm/msm/dpu: Add MISR register support for interface")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 10 ++++++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  3 ++-
>   4 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 0b6a0a7dcc39..226133af7840 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -322,7 +322,7 @@ static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
>   
>   static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool enable, u32 frame_count)
>   {
> -	dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, enable, frame_count);
> +	dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, enable, frame_count, 0x1);
>   }
>   
>   static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 *misr_value)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index 25af52ab602f..bbc9756ecde9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -85,7 +85,7 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
>   
>   static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx, bool enable, u32 frame_count)
>   {
> -	dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, enable, frame_count);
> +	dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, enable, frame_count, 0x0);
>   }
>   
>   static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> index 0b05061e3e62..87716a60332e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> @@ -477,7 +477,8 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
>   
>   void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
>   		u32 misr_ctrl_offset,
> -		bool enable, u32 frame_count)
> +		bool enable, u32 frame_count,
> +		u32 input_sel)
>   {
>   	u32 config = 0;
>   
> @@ -487,8 +488,13 @@ void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
>   	wmb();
>   
>   	if (enable) {
> +		/*
> +		 * note: Aside from encoders, input_sel should be
> +		 * set to 0x0 by default
> +		 */
>   		config = (frame_count & MISR_FRAME_COUNT_MASK) |
> -			MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK;
> +			MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK |
> +			((input_sel & 0xF) << 24);
>   
>   		DPU_REG_WRITE(c, misr_ctrl_offset, config);
>   	} else {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> index fe083b2e5696..761056be272b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> @@ -357,7 +357,8 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
>   void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
>   		u32 misr_ctrl_offset,
>   		bool enable,
> -		u32 frame_count);
> +		u32 frame_count,
> +		u32 input_sel);

u8 for input_sel?

>   
>   int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
>   		u32 misr_ctrl_offset,
> 
