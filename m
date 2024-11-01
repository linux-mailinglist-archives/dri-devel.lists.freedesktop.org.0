Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E097D9B9A51
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 22:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A10A10EA16;
	Fri,  1 Nov 2024 21:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Kus+8N4p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E629810EA16;
 Fri,  1 Nov 2024 21:41:33 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1C4w92019835;
 Fri, 1 Nov 2024 21:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WxyvEmleRomRRpxzwY/QMB3t1MlR8jcEBupWPgJsTo0=; b=Kus+8N4pVUbJI4AW
 hCJVVQaDExoYXKQS2dCi/c8BdGLsmg9fgm9nlNxFy0WlX5mkoNfFi9NOHLXZDXMy
 xooGn7IXsoYESSqaZCpiUw6G1aLBZzqVuTorB4IBspfu+Rd7AlyKbr1V4Uy0ygKR
 NFGzf0Nolmf1o2kteNQnFoaCr2ehHD8Vper0AMUYekADE1qvjdqV4TCcWUGnM2bs
 1SndpLjHIsFIQuPMzEytMS0L4kcgqfGWimr+5wD7BXpbplw4Jf76DNRp8j16cEzI
 MdQe43DXLCgFJUQpJTs7cQ79CqTgfjlyQ/64eGw7CTA5c6oQ9J8uMj5g/31SW7Mp
 VHK+0w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kmp0rnud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Nov 2024 21:41:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A1LfTpK009637
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Nov 2024 21:41:29 GMT
Received: from [10.110.96.174] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 1 Nov 2024
 14:41:28 -0700
Message-ID: <52229a96-64b0-48d0-9868-31be42b12db1@quicinc.com>
Date: Fri, 1 Nov 2024 14:41:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/hdmi: mark interlace_allowed as true
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241019-msm-hdmi-interlaced-v1-1-03bf85133445@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241019-msm-hdmi-interlaced-v1-1-03bf85133445@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: TjgjCD5ik6jnu8KxeyIsSuO1o5H0Q3TF
X-Proofpoint-ORIG-GUID: TjgjCD5ik6jnu8KxeyIsSuO1o5H0Q3TF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411010156
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



On 10/18/2024 2:10 PM, Dmitry Baryshkov wrote:
> The MSM HDMI driver supports interlaced modes. Set the corresponding
> flag to allow interlaced modes on the corresponding connectors.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> index 4a5b5112227f..643c152e6380 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -336,6 +336,7 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
>   	bridge->funcs = &msm_hdmi_bridge_funcs;
>   	bridge->ddc = hdmi->i2c;
>   	bridge->type = DRM_MODE_CONNECTOR_HDMIA;
> +	bridge->interlace_allowed = true;
>   	bridge->ops = DRM_BRIDGE_OP_HPD |
>   		DRM_BRIDGE_OP_DETECT |
>   		DRM_BRIDGE_OP_EDID;
> 

I had quite a bit of discussion on this internally because this spans 
quite a few generations of chipsets.

On very old hardware, even before msm8996, there was dedicated hardware 
de-interlacer. But even on msm8996 or other HDMI supported chipsets 
where the handling of if (mode->flags & DRM_MODE_FLAG_INTERLACE) is 
present, these were because its carry forward of older interface code.

The way we handle interlaced formats today, is software needs to handle 
the part of dividing height / 2 and width * 2 and adjust the source crop 
if necessary. This part has moved to userspace for recent chips.

Othwerise, we will need to add this part in the dpu driver to adjust 
this. I am not seeing this part there yet. So may I know how you 
validated this change? Something similar to :

https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/LE.UM.1.3.r3.25/drivers/gpu/drm/msm/sde/sde_plane.c#L1340

If we add this part first to dpu code, then we can mark interlace_allowed.

> ---
> base-commit: c4f364c621d0d509190d673d80a9b23250607b4a
> change-id: 20241019-msm-hdmi-interlaced-1508c1dc9bb9
> 
> Best regards,
