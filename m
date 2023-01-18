Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A272A672776
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 19:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1D110E1F3;
	Wed, 18 Jan 2023 18:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F0D10E1F3;
 Wed, 18 Jan 2023 18:48:25 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30IHfcmW002033; Wed, 18 Jan 2023 18:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=uJfm5CL/+NdI4EnWijvhwjnyLf6yI1gudIzQEf072OI=;
 b=DZsGaA77VC7M5bskA84Uunz/EKEwyb6b3y04He3t12U3i683HxZ5wK/uGcwq8asaGyPL
 7P2YwrrCOVFPQgnZojdE0xw4ARpWdgu7H0eVbeosF4VmJ0BzEpwSYtlwKHrsOjlOpZMj
 Yh2Tf1kdd9dGrwn4aawH7uOnzlMaBrB2f3ImhAVO7w2gmNg/EBHcU4w09gJ6apgJ6zr7
 erkGHX8zNv2I1ptRuJZJh6Crcc8Tdwz+Wpc5jrFn5FEqQpC52Wpi48tPUiB38q3469BE
 GTn9cx+x7YvNIp7C6MpmuP866TVBjRavNR49SOYnA69zm1q/5CewMB1Ezt7tlqQQohAH /g== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n602k2tgd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 18:48:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30IImJrm006460
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 18:48:19 GMT
Received: from [10.110.108.90] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 18 Jan
 2023 10:48:18 -0800
Message-ID: <62d4838d-5d32-15d7-5c48-d5c3df95c80e@quicinc.com>
Date: Wed, 18 Jan 2023 10:48:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH] drm/msm/dpu: enable DPU_MDP_AUDIO_SELECT for sc8180x
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230115140022.489881-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230115140022.489881-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: p0myEsuXdL9uMa1r4H3TlKGMCfoMIRRE
X-Proofpoint-GUID: p0myEsuXdL9uMa1r4H3TlKGMCfoMIRRE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_05,2023-01-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301180158
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



On 1/15/2023 6:00 AM, Dmitry Baryshkov wrote:
> According to the discussion ([1]) on the mailing list, platforms before
> sm8250 (and derivatives) should program HDMI_DP_CORE_SELECT register to
> route audio to the DP ports. Enable DPU_MDP_AUDIO_SELECT on sc8180x to
> program correponding register.
> 
> [1] https://lore.kernel.org/all/f86504ba-835a-6e30-6c30-8bb89b1359c4@quicinc.com/
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Yes, I confirm this is correct, hence

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 2664fa3665b0..b94b0a772ca8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -550,7 +550,7 @@ static const struct dpu_mdp_cfg sc8180x_mdp[] = {
>   	{
>   	.name = "top_0", .id = MDP_TOP,
>   	.base = 0x0, .len = 0x45C,
> -	.features = 0,
> +	.features = BIT(DPU_MDP_AUDIO_SELECT),
>   	.highest_bank_bit = 0x3,
>   	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
>   			.reg_off = 0x2AC, .bit_off = 0},
