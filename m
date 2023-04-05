Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0F06D7204
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 03:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2D710E2EC;
	Wed,  5 Apr 2023 01:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D7310E2EC;
 Wed,  5 Apr 2023 01:34:51 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3351O5NQ008105; Wed, 5 Apr 2023 01:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=P7SiYqa1zJWbGddc9NIP6ezJSYtlF/knQif93GUnvLU=;
 b=V/qq+hzdx9dmuROsTL1Sm/sLf/MY6ZUFFeLyrytxR8feN4tvx5ToIUNp0mlojU+95ubm
 j45mbHbapOHxC1p60ZylcW8EAn6Pnm1gGMlI/WR+Ta15+eLuYIaYtBpFfTF32qTdzIpu
 UoKySyG5yqQJ9Pl1/43qK3Z1yYm4FaaeWHE6cyslxq/oIpdpW6U05SJ25hlsEkPsUVa3
 NNeGs7LaeQCP5AglPNHZ0bbDbp/Pj8iS0Qhnlu9xhTHLgoMkSoU14hVytmaBvnCCJEsx
 xo6NWqjXKa+PEjzhrS3Ce0T+e32SqVOHjk+WXAu7lYwzvrSXU7KFyjZ5rt7GEL4dAL6i sw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3prnvg1fkk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Apr 2023 01:34:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3351YivQ023210
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 5 Apr 2023 01:34:45 GMT
Received: from [10.110.66.70] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 4 Apr 2023
 18:34:44 -0700
Message-ID: <f47a4cd6-1287-c611-3e7f-53b8c73ff80c@quicinc.com>
Date: Tue, 4 Apr 2023 18:34:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4 31/42] drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for
 sc8280xp
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
 <20230404130622.509628-32-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230404130622.509628-32-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: jvRBFpTxf4XfWCvgjtUMrjj_hSzrX-lk
X-Proofpoint-ORIG-GUID: jvRBFpTxf4XfWCvgjtUMrjj_hSzrX-lk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_14,2023-04-04_05,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304050012
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/4/2023 6:06 AM, Dmitry Baryshkov wrote:
> Theoretically since sm8150 we should be using a single CTL for the
> source split case, but since we do not support it for now, fallback to
> DPU_CTL_SPLIT_DISPLAY.
> 

Did you mean split panel case?

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index d30b797e90e0..3dc850a681bb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -42,17 +42,18 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
>   	},
>   };
>   
> +/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>   static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
>   	{
>   	.name = "ctl_0", .id = CTL_0,
>   	.base = 0x15000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>   	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	},
>   	{
>   	.name = "ctl_1", .id = CTL_1,
>   	.base = 0x16000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>   	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	},
>   	{
