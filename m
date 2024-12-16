Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 022009F3C55
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 22:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0436F10E621;
	Mon, 16 Dec 2024 21:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Q2qzFn5g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 773CD10E61C;
 Mon, 16 Dec 2024 21:11:47 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGKM9xi030386;
 Mon, 16 Dec 2024 21:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FNjGgAqGXlNmhe5qrVq4WK9DY381IBX6xhcAAUzOYPY=; b=Q2qzFn5g49K1pYO8
 Q0qYigwdc+tF5BAgbd/MRE+38rycj6Wx+nd8L8UxTZiYgk+vcchVGhymy3RwGrXM
 7AaOhcrK3Ey93gHUyZq732WaJpDmtODZ9HMPBWo8b0BrgCvcKm1UNe4CU/9jz2iI
 10nqeUCSIZqFj36Y/mq9YB0sVRGf9frh1h7P1tPgaesit8YDqirEEkBR85DOp9rh
 mIgpmdcL5ZpXAlnX/iqdZu1X1wHmjzSCkumESe+JU1znlYv47oyfd1+KGqn0n76d
 xDNfiZuEbGOAsS42iLOTH735jfypPZEHWSXL+MSvJQVLfVgZ+FbxC6FCfznhMm6s
 kWm08g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ju61r3bu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 21:11:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGLBelK023925
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 21:11:40 GMT
Received: from [10.110.88.253] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 13:11:36 -0800
Message-ID: <d6be6564-ce24-4a27-a014-45aa9ff28d24@quicinc.com>
Date: Mon, 16 Dec 2024 13:11:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8150
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Abel Vesa <abel.vesa@linaro.org>,
 Richard Acayan <mailingradian@gmail.com>
CC: Rob Clark <robdclark@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
 <20241216-dpu-fix-catalog-v1-1-15bf0807dba1@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241216-dpu-fix-catalog-v1-1-15bf0807dba1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: i21IZFNvATVl5g0kxaN2T_PTciKfGhC5
X-Proofpoint-ORIG-GUID: i21IZFNvATVl5g0kxaN2T_PTciKfGhC5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 malwarescore=0 clxscore=1011 phishscore=0
 adultscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412160174
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



On 12/16/2024 12:27 AM, Dmitry Baryshkov wrote:
> Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.
> 
> Fixes: 05ae91d960fd ("drm/msm/dpu: enable DSPP support on SM8[12]50")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 2 ++
>   1 file changed, 2 insertions(+)
> 

Change looks fine

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

One question below (not tied to the change but arose due to it):

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index 6ccfde82fecdb4e3612df161814b16f7af40ca5f..421afacb7248039abd9fb66bcb73b756ae0d640a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -164,6 +164,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_3,
>   		.pingpong = PINGPONG_2,
> +		.dspp = DSPP_2,
>   	}, {
>   		.name = "lm_3", .id = LM_3,
>   		.base = 0x47000, .len = 0x320,
> @@ -171,6 +172,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_2,
>   		.pingpong = PINGPONG_3,
> +		.dspp = DSPP_3,
>   	}, {
>   		.name = "lm_4", .id = LM_4,
>   		.base = 0x48000, .len = 0x320,
> 

the consumer of .dspp seems to be in the RM code which is used to map 
the DSPP to encoder_id but is there really any case where lm_id != 
dspp_id ... I guess I am missing the context of why DSPP id needs to be 
tracked as LMs and DSPPs go together. Let me also check this part 
internally.
