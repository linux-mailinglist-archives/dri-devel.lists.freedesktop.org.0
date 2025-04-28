Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D6FA9FD44
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 00:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD6410E28C;
	Mon, 28 Apr 2025 22:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="O3O+5fhp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D21610E28C;
 Mon, 28 Apr 2025 22:49:02 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SGwfxK021725;
 Mon, 28 Apr 2025 22:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SNSgNixVRJ2OzCygTsEE8+iowZE9s2YjgD/URUrTvvw=; b=O3O+5fhpVOMycqBL
 B7Abop/enz4GNtbbwZspnD9/kOx225mo0eESfLTCFTZwiauwUkIBUJ8VC9SArXYt
 mayKRsXhiacA+lmqEPgH+qniBJRzx0dJMbosgRYTHJqhKCc9QC3zFLJULqzO0Gtj
 +UUDUZXQyGRQ8GTUn2A5CWyk9QCGF4GOE7KX0pAnc++0ruEwXGKj+TS4Vyj1zwV3
 +FuwKZY2PZo9A1qVLjQboYQkhrok7AJqTLjI2lRkfaR8UTiHO+I7r7bXWMbsTB+d
 37EzkRBwCZEZfPkos1uHa8mO1WxV8QiPn427FKgS2WaouJEx9kScFp7MSShVuauf
 ywUfIA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468n6jhv2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Apr 2025 22:48:54 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53SMmsNg002588
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Apr 2025 22:48:54 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Apr
 2025 15:48:53 -0700
Message-ID: <61310672-171e-4496-ae6a-ad31fbdb2b83@quicinc.com>
Date: Mon, 28 Apr 2025 15:48:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] drm/msm/dpu: program master INTF value
To: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>
References: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
 <20250307-dpu-active-ctl-v3-2-5d20655f10ca@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250307-dpu-active-ctl-v3-2-5d20655f10ca@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE4MiBTYWx0ZWRfX4upFlcHnLI08
 cD5weaYf/VbcAcsWqp8kiHNbg85HhbiDedc6i6l6R5oZNv6zkWvcXQEolODnFwpym224XGl/dLX
 H2cgMX/NcGtO3ZTOWgCzKTTBh+Yl0nzj6xBz3CooEu9nMMz1i5eeWTYaYcjxDb9NVOqMsyFbCys
 rmTPpX/1r/GIkEq9cpOgFDpN8RW1TjzoznUu9JFVkFWgPpQ5HzuTjabZl/1+mxbuVZFyB1okRr8
 MhbpdTz6xJ2n1MRJnfIMX9AyOnI4Xq8PafwledbOzB78iTFOleaRuaTMpqu8fpcl58Ckazt67kF
 7/Ex0aDWz67pVQO7sx+UTFNyHVoDxFmfnKt1ZvX5RnsFuTQ5VfVO8wpvKnYAxDSizqCytbJLeYK
 2BJ781zkP3RQEDbcGh9Oqb4xa1VmBF9eyZcxM0e7q674h/JKzS6lLVyShJ/XDccETovNsdPJ
X-Proofpoint-GUID: jZ6lApvq3ZJIw4APME12GlatR0Jf897T
X-Proofpoint-ORIG-GUID: jZ6lApvq3ZJIw4APME12GlatR0Jf897T
X-Authority-Analysis: v=2.4 cv=C8fpyRP+ c=1 sm=1 tr=0 ts=681005d6 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8
 a=tVI0ZWmoAAAA:8 a=COk6AnOGAAAA:8
 a=rxETW27_YrsaSjKoF0MA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280182
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



On 3/6/2025 10:24 PM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> If several interfaces are being handled through a single CTL, a main
> ('master') INTF needs to be programmed into a separate register. Write
> corresponding value into that register.
> 
> Co-developed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 12 ++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h |  2 ++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index cef3bfaa4af82ebc55fb8cf76adef3075c7d73e3..21f4d403e3c278d83d7eaa6a7dd53f471d9e296d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -603,6 +603,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
>   	DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE, merge_3d_active);
>   
> +	if (cfg->intf_master)
> +		DPU_REG_WRITE(c, CTL_INTF_MASTER, BIT(cfg->intf_master - INTF_0));
> +
>   	if (cfg->cdm)
>   		DPU_REG_WRITE(c, CTL_CDM_ACTIVE, cfg->cdm);
>   }
> @@ -645,6 +648,7 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   {
>   	struct dpu_hw_blk_reg_map *c = &ctx->hw;
>   	u32 intf_active = 0;
> +	u32 intf_master = 0;
>   	u32 wb_active = 0;
>   	u32 cwb_active = 0;
>   	u32 merge3d_active = 0;
> @@ -672,6 +676,14 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   		intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
>   		intf_active &= ~BIT(cfg->intf - INTF_0);
>   		DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
> +
> +		intf_master = DPU_REG_READ(c, CTL_INTF_MASTER);
> +
> +		/* Unset this intf as master, if it is the current master */
> +		if (intf_master == BIT(cfg->intf - INTF_0)) {
> +			DPU_DEBUG_DRIVER("Unsetting INTF_%d master\n", cfg->intf - INTF_0);
> +			DPU_REG_WRITE(c, CTL_INTF_MASTER, 0);
> +		}
>   	}
>   
>   	if (cfg->cwb) {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index 080a9550a0cc6530b4115165dd737857b6213d15..cea23436fc80a17a679363a47f9f287b72623a1c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -36,6 +36,7 @@ struct dpu_hw_stage_cfg {
>   /**
>    * struct dpu_hw_intf_cfg :Describes how the DPU writes data to output interface
>    * @intf :                 Interface id
> + * @intf_master:           Master interface id in the dual pipe topology
>    * @mode_3d:               3d mux configuration
>    * @merge_3d:              3d merge block used
>    * @intf_mode_sel:         Interface mode, cmd / vid
> @@ -46,6 +47,7 @@ struct dpu_hw_stage_cfg {
>    */
>   struct dpu_hw_intf_cfg {
>   	enum dpu_intf intf;
> +	enum dpu_intf intf_master;
>   	enum dpu_wb wb;
>   	enum dpu_3d_blend_mode mode_3d;
>   	enum dpu_merge_3d merge_3d;
> 

