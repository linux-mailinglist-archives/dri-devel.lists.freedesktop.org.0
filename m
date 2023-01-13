Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 284BD66A3F8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 21:18:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B88C10EAD0;
	Fri, 13 Jan 2023 20:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F14310EAD0;
 Fri, 13 Jan 2023 20:18:17 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30DJx5vi007010; Fri, 13 Jan 2023 20:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=2Ubhbkx1PyJi5kYI/gyLj/rsjr5edd+3RL67+q6F1VM=;
 b=gL5dlIruerEo2311fqg2p8eJl+RWQeJBMWoj3W6GoWhEVUduQrXWEqHyj3OYycucAUDg
 xyh/GjcRBvXdDJmqUYRfJhDRBeEBm3KqhxOMca31Q/gRB4QkY1bGKbTgXCQLt+YKh4+t
 Kqi1Q4yTiY0Rw6ceQgB7qIfogLuBe4ZD5dC5WYQsg/9edBCe1O0ZC5KAYtEPHltQx6WK
 YkG5SeDNi05JssgmRmh1Q54AzTWBzwZylk4FjLMic+dTt5iiT89CfNZBRoMJry/sLasn
 3rNttnLfcS1Ut4EmRirJdK0S977niHJblucIc/q+cTMJiRj03cb1FCvusNTHmnurnKdE Sg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n32wu9up2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 20:18:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30DKIAeB027545
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 20:18:11 GMT
Received: from [10.110.70.165] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 13 Jan
 2023 12:18:10 -0800
Message-ID: <0e12c491-8150-6579-852f-27ee01333816@quicinc.com>
Date: Fri, 13 Jan 2023 12:18:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH 3/4] drm/msm/mdss: add data for sc8180xp
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20221208000850.312548-1-dmitry.baryshkov@linaro.org>
 <20221208000850.312548-4-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221208000850.312548-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: I6j4xxkB0nsRxkKAm7OgKFoggMUnSB2n
X-Proofpoint-ORIG-GUID: I6j4xxkB0nsRxkKAm7OgKFoggMUnSB2n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-13_10,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301130138
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



On 12/7/2022 4:08 PM, Dmitry Baryshkov wrote:
> Add platform data for sc8180xp based on sdmshrike-sde.dtsi.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

This matches up the docs I have, hence,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 4401f945b966..5e19ec897670 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -518,6 +518,12 @@ static const struct msm_mdss_data sc7280_data = {
>   	.macrotile_mode = 1,
>   };
>   
> +static const struct msm_mdss_data sc8180x_data = {
> +	.ubwc_version = UBWC_3_0,
> +	.highest_bank_bit = 3,
> +	.macrotile_mode = 1,
> +};
> +
>   static const struct msm_mdss_data sc8280xp_data = {
>   	.ubwc_version = UBWC_4_0,
>   	.ubwc_swizzle = 6,
> @@ -553,7 +559,7 @@ static const struct of_device_id mdss_dt_match[] = {
>   	{ .compatible = "qcom,sdm845-mdss" },
>   	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
>   	{ .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
> -	{ .compatible = "qcom,sc8180x-mdss" },
> +	{ .compatible = "qcom,sc8180x-mdss", .data = &sc8180x_data },
>   	{ .compatible = "qcom,sc8280xp-mdss", .data = &sc8280xp_data },
>   	{ .compatible = "qcom,sm6115-mdss", .data = &sm6115_data },
>   	{ .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
