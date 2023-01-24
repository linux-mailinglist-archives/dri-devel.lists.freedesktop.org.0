Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD0D678D17
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 02:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D88A10E21F;
	Tue, 24 Jan 2023 01:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB5C10E21F;
 Tue, 24 Jan 2023 01:02:56 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30O0tcvL026405; Tue, 24 Jan 2023 01:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=DOX27aDqwnqUAikoNTnsxO+fiJhKl+swC6Yg9JMHvs8=;
 b=QYNmnzwrKosJVpJv6p3YfG1ca1sfNs1sLn53+RTdgYcUvBJeAHobz1tZwJXNLzropcDm
 iR3a3/u7bkLzSw6DlfbbAoPrCC383zx2P++0oWqmKorQ0t02Cj5icJcrfJkojsMZfvyD
 FFDzyjKgBy1kUJ1omdSdzCrX86sradGvgrAbKdYXC5ddNu36ui5cIOj3R5edz4D9aIzd
 9sPbjcOCNiegJ316L5ZtW96Hf3HV0dn3VnZQsqf0+M/LheC7EIgJm/L4H6fnUpAT+4r2
 0ba9Q+Kb0KWVJqIfs8N7oiBIiZ54HU5G3OSWDeA2qPGFH3dzf6t6+9kBfZ9kPYp35Tn3 Fw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89htv36k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Jan 2023 01:02:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30O12ncL004215
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Jan 2023 01:02:49 GMT
Received: from [10.110.62.90] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 23 Jan
 2023 17:02:48 -0800
Message-ID: <79f44bd5-797d-300c-166f-ef5a8cb718fb@quicinc.com>
Date: Mon, 23 Jan 2023 17:02:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dpu: fix sm8450 CTL configuration
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230123080818.3069266-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230123080818.3069266-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: BI_NHK8CQIInnGYXElkfz8qTIoqWtjyp
X-Proofpoint-GUID: BI_NHK8CQIInnGYXElkfz8qTIoqWtjyp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301240005
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



On 1/23/2023 12:08 AM, Dmitry Baryshkov wrote:
> Correct the CTL size on sm8450 platform. This fixes the incorrect merge
> of sm8350 support, which unfortunately also touched the SM8450 setup.
> 
> Fixes: 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Matches the vendor DT size for sm8450, hence

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 63a0fa3b0a17..9060dce51e2e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1017,31 +1017,31 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
>   	},
>   	{
>   	.name = "ctl_1", .id = CTL_1,
> -	.base = 0x16000, .len = 0x1e8,
> +	.base = 0x16000, .len = 0x204,
>   	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>   	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	},
>   	{
>   	.name = "ctl_2", .id = CTL_2,
> -	.base = 0x17000, .len = 0x1e8,
> +	.base = 0x17000, .len = 0x204,
>   	.features = CTL_SC7280_MASK,
>   	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>   	},
>   	{
>   	.name = "ctl_3", .id = CTL_3,
> -	.base = 0x18000, .len = 0x1e8,
> +	.base = 0x18000, .len = 0x204,
>   	.features = CTL_SC7280_MASK,
>   	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>   	},
>   	{
>   	.name = "ctl_4", .id = CTL_4,
> -	.base = 0x19000, .len = 0x1e8,
> +	.base = 0x19000, .len = 0x204,
>   	.features = CTL_SC7280_MASK,
>   	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>   	},
>   	{
>   	.name = "ctl_5", .id = CTL_5,
> -	.base = 0x1a000, .len = 0x1e8,
> +	.base = 0x1a000, .len = 0x204,
>   	.features = CTL_SC7280_MASK,
>   	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>   	},
