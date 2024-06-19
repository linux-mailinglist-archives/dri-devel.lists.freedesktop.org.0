Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEF290F5C6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 20:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C49A10E1D9;
	Wed, 19 Jun 2024 18:11:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="lpke3Ls2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE8910E18C;
 Wed, 19 Jun 2024 18:11:07 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J9Bsmi010717;
 Wed, 19 Jun 2024 18:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CrVbCF7GLKxDvvXz4Jh+wVm6bfs1xvQ++zSF7apYK6Q=; b=lpke3Ls2dBvxbY//
 o19kEGp0j1sKEwMZM1cuwEYk/v3BWGN1HpivolMxN7i3YIgJonkGpDhV9yOxDPrM
 tCUv+TJRGEpgeXxgkZyIkOYgoYsvGq7DiqOh8YTQLcqnu0KlfLF8MRdtuESmtq4U
 cyk+HFxaHWfPBgmeB7HMf2Cukiv8Wo2c5bl7sbscAmKV2B6YQp9va3bplQ2sam2G
 yexf0mrOV2ecy2otBmJB6lYBF3EklvzxYu9vW7bIVUkFnH3+wcaS/Vlxp2TBCW5l
 XtaexCO1stmyLiav/rExp2Qrj3HPpVyUkl9uTJawks7/abXb8zNDCZ/uEbd4BnKe
 idt5/A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuj9tjgaf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jun 2024 18:11:04 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45JIB3K0011391
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jun 2024 18:11:03 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Jun
 2024 11:11:02 -0700
Message-ID: <74679ab7-da92-43bc-96e8-5c6e3a1dee62@quicinc.com>
Date: Wed, 19 Jun 2024 11:11:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/14] drm/msm/hdmi: expand the HDMI_CFG macro
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
 <20240522-fd-hdmi-hpd-v2-11-c30bdb7c5c7e@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-11-c30bdb7c5c7e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ah9FMWTw14ldEQO3f1xzZYNURm3aTeLD
X-Proofpoint-ORIG-GUID: ah9FMWTw14ldEQO3f1xzZYNURm3aTeLD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406190137
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



On 5/22/2024 3:51 AM, Dmitry Baryshkov wrote:
> Expand the HDMI_CFG() macro in HDMI config description. It has no added
> value other than hiding some boilerplate declarations.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/hdmi/hdmi.c | 16 ++++++++--------
>   drivers/gpu/drm/msm/hdmi/hdmi.h |  2 +-
>   2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index c39a1f3a7505..e160a23e962e 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -223,24 +223,24 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>    * The hdmi device:
>    */
>   
> -#define HDMI_CFG(item, entry) \
> -	.item ## _names = item ##_names_ ## entry, \
> -	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
> -
>   static const char *pwr_reg_names_8960[] = {"core-vdda"};
>   static const char *pwr_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
>   
>   static const struct hdmi_platform_config hdmi_tx_8960_config = {
> -		HDMI_CFG(pwr_reg, 8960),
> -		HDMI_CFG(pwr_clk, 8960),
> +	.pwr_reg_names = pwr_reg_names_8960,
> +	.pwr_reg_cnt = ARRAY_SIZE(pwr_reg_names_8960),
> +	.pwr_clk_names = pwr_clk_names_8960,
> +	.pwr_clk_cnt = ARRAY_SIZE(pwr_clk_names_8960),
>   };
>   
>   static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
>   static const char *pwr_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
>   
>   static const struct hdmi_platform_config hdmi_tx_8974_config = {
> -		HDMI_CFG(pwr_reg, 8x74),
> -		HDMI_CFG(pwr_clk, 8x74),
> +	.pwr_reg_names = pwr_reg_names_8x74,
> +	.pwr_reg_cnt = ARRAY_SIZE(pwr_reg_names_8x74),
> +	.pwr_clk_names = pwr_clk_names_8x74,
> +	.pwr_clk_cnt = ARRAY_SIZE(pwr_clk_names_8x74),
>   };
>   
>   /*
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
> index 1e346e697f8e..2a98efa8b6bd 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.h
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
> @@ -89,7 +89,7 @@ struct hdmi_platform_config {
>   	const char **pwr_reg_names;
>   	int pwr_reg_cnt;
>   
> -	/* clks that need to be on for hpd: */
> +	/* clks that need to be on: */
>   	const char **pwr_clk_names;
>   	int pwr_clk_cnt;
>   };
> 
> -- 
> 2.39.2
> 
