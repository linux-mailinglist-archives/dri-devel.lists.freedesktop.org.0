Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E719DAAD0AC
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 00:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB6910E356;
	Tue,  6 May 2025 22:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="etknP7v8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4308810E0AD;
 Tue,  6 May 2025 22:02:29 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546AdQMM015737;
 Tue, 6 May 2025 22:02:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 S4OvY+jEnTpuGhaZupsI0euhEx/0eYlZ2z4uuDEHxpE=; b=etknP7v850ieAviU
 1orsEWvTfzYqCkII4pGWAXlu9QvxMdUqvCxM8Pq0Sx0jeyoaXPnU8s7FlZcA258B
 ktLInRGxqysfxfKbfgCPC6CB2BD0LbTqxOIQ3Zevz19ejhnCZXu7snANznHrFert
 JMTYVloULg7BUkQJDuSnp+BpmLzY9EmLsPUbcATokTOSy3jDDNqD4FQEJkbY1Ca1
 5tx5YU8F1Zr4n18Mufnnj+lh/NLylt6cQTpA5cKe8JbzUHGecJ+qT2eNt2vkuoJX
 1E/+ZQcj/uam4Lgqy+oAz5MLAm7QQ3BZW6987LnibIqkKLt8r2VHKY0DPWtLv6Cl
 w3yosw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fguuht8g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 May 2025 22:02:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 546M2ORm018435
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 6 May 2025 22:02:24 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 6 May 2025
 15:02:24 -0700
Message-ID: <3122e357-6d27-4b5e-97d3-365dccd91367@quicinc.com>
Date: Tue, 6 May 2025 15:02:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from SAR2130P
 CTL blocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250506-dpu-sar2130p-no-split-display-v1-1-b619c0fddea5@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250506-dpu-sar2130p-no-split-display-v1-1-b619c0fddea5@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=UJPdHDfy c=1 sm=1 tr=0 ts=681a86f1 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=3CHTtLT0FruqgAMyr9AA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: l5Shj5WPXuseW8ES2pZ9aIEklZvZvgUZ
X-Proofpoint-GUID: l5Shj5WPXuseW8ES2pZ9aIEklZvZvgUZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDIwOCBTYWx0ZWRfXygGfxX4djkF2
 QZ8zCIhwEugDmSOT5mMszhvaPahR+i7Fi6EQ1LRC+qYw0BH5Lr21N1tOLhE01MZlKSOBGU7m0g5
 3ED4CWMCbbKZODkcNL6A2X/JIRyWFumOzdrJBo2kSO5Zs8Y1ViO6vCvnti8sPy5neKAqfbc+onX
 bioXyNmXqiK0/VKuUPhHlAEiKOV8JL/QdQFBuueaRk3DDicIo1Y1V43YgwZS+jli70BaseYRZ9u
 z47aWp57Yf2jVzbNHkwYJUc57lqiwoS4UXBJeYdtSIA1mYYOxU4yaLor/bHGKw+s/MAwvJwUlJ3
 zdH+/CtA2r7jD1uwvcy4hlTTQUS4z7IxlI1YTCaBF1JKk3b2947/Pqcby6OyKWsw2L86bPW+zF7
 r0EYdxAcwo5NvrmBDUPaQjbqu0aSBa4/6Gf9eIAXTRqVDFAZcFrghJ1sXG6gBu73LT0AGHMq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_08,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060208
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



On 5/6/2025 5:53 AM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <lumag@kernel.org>
> 
> Follow the changes in the commit a2649952f66e ("drm/msm/dpu: remove
> DPU_CTL_SPLIT_DISPLAY from CTL blocks on DPU >= 5.0") and remove
> DPU_CTL_SPLIT_DISPLAY from the CTL blocks on the SAR2130P platform.
> Single CTL is used for all interfaces used by a single path
> 
> Fixes: 178575173472 ("drm/msm/dpu: add catalog entry for SAR2130P")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> index 22dd16c6e210e9520ecb7a851bee402032fa1ee2..5667d055fbd1d8125c3231302daa3e05de5944c9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> @@ -27,17 +27,16 @@ static const struct dpu_mdp_cfg sar2130p_mdp = {
>   	},
>   };
>   
> -/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>   static const struct dpu_ctl_cfg sar2130p_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x15000, .len = 0x290,
> -		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = CTL_SM8550_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x16000, .len = 0x290,
> -		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = CTL_SM8550_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
> 
> ---
> base-commit: 0a00723f4c2d0b273edd0737f236f103164a08eb
> change-id: 20250506-dpu-sar2130p-no-split-display-442eb0b85165
> 
> Best regards,

