Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE798CC67C
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 20:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D5F10E544;
	Wed, 22 May 2024 18:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="I3wt6WZn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 578A410E494;
 Wed, 22 May 2024 18:41:49 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44MAeuXQ031060;
 Wed, 22 May 2024 18:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=mVX8Dft+JVu95fbwvo4KYvZbifN/PZjKCR2OVWhfyg4=; b=I3
 wt6WZnaby1Wgd2OFYaSFqeaCbJVb9CJm5bPCiVy+JtjhQ3zBbmJOUSDpomqDb+IY
 s1qIyjvtYI8VjHBkggs7VDMdJunIW0zcNqNrJosW0CwWCyGNP15JAwXITNSxRAAl
 6c0PkiGpkQ+LBNHQiZ2W0o9Y4I8Vn3BgJgRrW4Jp/L/bTkTDW+roAcYE2CypbXsk
 h9d1KJRiLIf5qrSErD8BrvWPBAmeCHjE1flZMa9dJUEWVfFU1luy3tGgNopVBx+r
 A7mHohV167dbj0ZtBJ7DsYHK5U6JOeCQ1AcoF5nCgrMvjYTY/U8U6OPSLuS57Lrm
 Bmg5/nse8VP01hAg8ApQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n45su5g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 May 2024 18:41:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44MIffIb018569
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 May 2024 18:41:41 GMT
Received: from [10.110.28.32] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 May
 2024 11:41:41 -0700
Message-ID: <a349dda7-8af5-0996-0057-9da30f39dfb1@quicinc.com>
Date: Wed, 22 May 2024 11:41:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/7] drm/msm/dpu: convert vsync source defines to the enum
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
 <20240520-dpu-handle-te-signal-v1-2-f273b42a089c@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240520-dpu-handle-te-signal-v1-2-f273b42a089c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: mm8kOuUKzWqQqilQrbahzI-PiyW4fcu4
X-Proofpoint-ORIG-GUID: mm8kOuUKzWqQqilQrbahzI-PiyW4fcu4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_10,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220129
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



On 5/20/2024 5:12 AM, Dmitry Baryshkov wrote:
> Add enum dpu_vsync_source instead of a series of defines. Use this enum
> to pass vsync information.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 26 ++++++++++++++------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h  |  2 +-
>   5 files changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 119f3ea50a7c..4988a1029431 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -747,7 +747,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
>   		if (disp_info->is_te_using_watchdog_timer)
>   			vsync_cfg.vsync_source = DPU_VSYNC_SOURCE_WD_TIMER_0;
>   		else
> -			vsync_cfg.vsync_source = DPU_VSYNC0_SOURCE_GPIO;
> +			vsync_cfg.vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
>   
>   		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 225c1c7768ff..96f6160cf607 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -462,7 +462,7 @@ static int dpu_hw_intf_get_vsync_info(struct dpu_hw_intf *intf,
>   }
>   
>   static void dpu_hw_intf_vsync_sel(struct dpu_hw_intf *intf,
> -		u32 vsync_source)
> +				  enum dpu_vsync_source vsync_source)
>   {
>   	struct dpu_hw_blk_reg_map *c;
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index f9015c67a574..ac244f0b33fb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -107,7 +107,7 @@ struct dpu_hw_intf_ops {
>   
>   	int (*connect_external_te)(struct dpu_hw_intf *intf, bool enable_external_te);
>   
> -	void (*vsync_sel)(struct dpu_hw_intf *intf, u32 vsync_source);
> +	void (*vsync_sel)(struct dpu_hw_intf *intf, enum dpu_vsync_source vsync_source);
>   
>   	/**
>   	 * Disable autorefresh if enabled
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 66759623fc42..a2eff36a2224 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -54,18 +54,20 @@
>   #define DPU_BLEND_BG_INV_MOD_ALPHA	(1 << 12)
>   #define DPU_BLEND_BG_TRANSP_EN		(1 << 13)
>   
> -#define DPU_VSYNC0_SOURCE_GPIO		0
> -#define DPU_VSYNC1_SOURCE_GPIO		1
> -#define DPU_VSYNC2_SOURCE_GPIO		2
> -#define DPU_VSYNC_SOURCE_INTF_0		3
> -#define DPU_VSYNC_SOURCE_INTF_1		4
> -#define DPU_VSYNC_SOURCE_INTF_2		5
> -#define DPU_VSYNC_SOURCE_INTF_3		6
> -#define DPU_VSYNC_SOURCE_WD_TIMER_4	11
> -#define DPU_VSYNC_SOURCE_WD_TIMER_3	12
> -#define DPU_VSYNC_SOURCE_WD_TIMER_2	13
> -#define DPU_VSYNC_SOURCE_WD_TIMER_1	14
> -#define DPU_VSYNC_SOURCE_WD_TIMER_0	15
> +enum dpu_vsync_source {
> +	DPU_VSYNC_SOURCE_GPIO_0,
> +	DPU_VSYNC_SOURCE_GPIO_1,
> +	DPU_VSYNC_SOURCE_GPIO_2,
> +	DPU_VSYNC_SOURCE_INTF_0 = 3,

Do we need this assignment to 3?

Rest LGTM,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
