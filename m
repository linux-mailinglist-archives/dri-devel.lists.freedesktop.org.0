Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C87A30127
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 02:54:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A4C10E633;
	Tue, 11 Feb 2025 01:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="YRk21xpW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D9F10E62A;
 Tue, 11 Feb 2025 01:54:33 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AK3LAo003521;
 Tue, 11 Feb 2025 01:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rKbFmJKmJ7yLE97ZoFWuAbSLEitXdLyHF51i0LW2NBs=; b=YRk21xpW/JCT4DaW
 b7KJmL94CLNhMP/RVPOY357/JHK86e/e02KDmO2yRAA0ot4sTzxxgxvWfOIBzgR7
 2sxywa9u55crLfe8d8uJgaQGSB5skFi6XDsz5t86f8+QYV7LJ1a1biyT9v/wpgyx
 54wk1bV0IOwXz0FpMmX8AN9GH2U5gGIj1ewKA+GGbCtDrI68DezSvUsezE45ONAr
 8oaDV1VghNf4XdZI1e3qAYHTEfCfFX9BKikrUp/lwn0kTmkCjPfjDPpn+Lvy9BVK
 ZE9xMCdZxFlEaAj+9YkAliZudQRX1qNsrC8my9AprSvhcqjgL1MyQ28azsg8En8p
 xthmng==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dyp570-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Feb 2025 01:54:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51B1sP1D026021
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Feb 2025 01:54:25 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Feb
 2025 17:54:24 -0800
Message-ID: <a3374b07-11a0-4eec-9f57-3ca25068fe24@quicinc.com>
Date: Mon, 10 Feb 2025 17:54:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/msm/dpu: Remove arbitrary limit of 1 interface
 in DSC topology
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, "David Airlie" <airlied@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Simona Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Jordan
 Crouse" <jordan@cosmicpenguin.net>,
 <~postmarketos/upstreaming@lists.sr.ht>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Martin Botka" <martin.botka@somainline.org>, Jami Kettunen
 <jami.kettunen@somainline.org>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>
References: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
 <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-3-9a60184fdc36@somainline.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-3-9a60184fdc36@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: C9f3P0FpGCh4GPbIxlo6g5l7A6-YGmsb
X-Proofpoint-GUID: C9f3P0FpGCh4GPbIxlo6g5l7A6-YGmsb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_01,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110009
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



On 2/9/2025 1:42 PM, Marijn Suijten wrote:
> When DSC is enabled the number of interfaces is forced to be 1, and
> documented that it is a "power-optimal" layout to use two DSC encoders
> together with two Layer Mixers.  However, the same layout (two DSC
> hard-slice encoders with two LMs) is also used when the display is
> fed with data over two instead of one interface (common on 4k@120Hz
> smartphone panels with Dual-DSI).  Solve this by simply removing the
> num_intf = 1 assignment as the count is already calculated by computing
> the number of physical encoders within the virtual encoder.
> 
> Fixes: 7e9cc175b159 ("drm/msm/disp/dpu1: Add support for DSC in topology")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index b585cd17462345f94bcc2ddd57902cc7c312ae63..b0870318471bd7cceda70fd15ea7bcc8658af604 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -686,20 +686,21 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   
>   	if (dsc) {
>   		/*
> -		 * Use 2 DSC encoders and 2 layer mixers per single interface
> +		 * Use 2 DSC encoders, 2 layer mixers and 1 or 2 interfaces
>   		 * when Display Stream Compression (DSC) is enabled,
>   		 * and when enough DSC blocks are available.
>   		 * This is power-optimal and can drive up to (including) 4k
>   		 * screens.
>   		 */
> -		if (dpu_kms->catalog->dsc_count >= 2) {
> +		WARN(topology.num_intf > 2,
> +		     "DSC topology cannot support more than 2 interfaces\n");
> +		if (intf_count >= 2 || dpu_kms->catalog->dsc_count >= 2) {
>   			topology.num_dsc = 2;
>   			topology.num_lm = 2;
>   		} else {
>   			topology.num_dsc = 1;
>   			topology.num_lm = 1;
>   		}
> -		topology.num_intf = 1;
>   	}
>   
>   	return topology;
> 
> -- 
> 2.48.1
> 

