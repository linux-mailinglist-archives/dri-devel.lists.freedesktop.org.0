Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1237B764222
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 00:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B20210E4C7;
	Wed, 26 Jul 2023 22:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82FC310E08F;
 Wed, 26 Jul 2023 22:30:41 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36QMNUGn012369; Wed, 26 Jul 2023 22:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Q0wEARfOzU0kC6y3jNAEObKBXWo/o4eTYYY5aSTVPz4=;
 b=j8R/gcjZhMe4MF4Xyj6nEc88a1h1w2Su3AKuKYGrhqin33Gt3yoICGDf0UedjHQMM9AF
 CAdC5RMLSV+aT0+7LukBV/8ht+kukpDb7X5Z1h+zybtTiPhinkyMiAtqr+yvYYHKoF5A
 6++D07m+fHq+n1Mg9AcxaMwjsL/arH0ILu8cbn5MbsC4W3iYEOHoEnkszhmQYLsTA0Xp
 x28RhNFOk9NfKotmc22f4QqxqZ6w9CS988Ji76CaJ2jtiPxdWhk2qto5o6rJq9elsOD7
 YjUFoI9LgIkln92+J7r7E1HnwW7+DrZxyZCM35Jkv1JnQmTWxIfIWJmEWHxBgcdzZDJr gQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s2fms3pb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jul 2023 22:30:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36QMUX70010124
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jul 2023 22:30:33 GMT
Received: from [10.110.29.149] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 26 Jul
 2023 15:30:32 -0700
Message-ID: <61b0792d-aa62-03ea-bb2c-aa9392251519@quicinc.com>
Date: Wed, 26 Jul 2023 15:30:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/6] drm/msm/mdss: populate missing data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
 <20230521171026.4159495-5-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230521171026.4159495-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2MMLEOuJcb0dOEX8Z0mFtoDa4v8U7nLL
X-Proofpoint-ORIG-GUID: 2MMLEOuJcb0dOEX8Z0mFtoDa4v8U7nLL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_08,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307260201
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/21/2023 10:10 AM, Dmitry Baryshkov wrote:
> As we are going to use MDSS data for DPU programming, populate missing
> MDSS data. The UBWC 1.0 and no UBWC cases do not require MDSS
> programming, so skip them.
> 

Can you pls point me to the downstream references you used for msm8998?

Was that just taken from catalog? If so I would ask for the reference 
for the catalog too.

As per the register the decoder version is 0x0 and not 1.

Even encoder version is 0 from what i see and not 1. Thats why a 
dec_version of UBWC_1_0 is not doing anything i assume.

Some additional questions:

1) Does the whole chunk in dpu_hw_sspp_setup_format() which handles ubwc 
programming need to be protected by if (ctx->ubwc) now ?

2) The values of UBWC_x_x dont match the values of DPU_HW_UBWC_VER_xx.
What was the reason for the catalog to go with DPU_HW_UBWC_VER_xx in the 
catalog for the encoder version in the first place? Because looking at 
the registers UBWC_x_x is the correct value.


> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index ed836c659688..9bb7be4b9ebb 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -264,6 +264,10 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>   	 * UBWC_n and the rest of params comes from hw data.
>   	 */
>   	switch (msm_mdss->mdss_data->ubwc_dec_version) {
> +	case 0: /* no UBWC */
> +	case UBWC_1_0:
> +		/* do nothing */
> +		break;
>   	case UBWC_2_0:
>   		msm_mdss_setup_ubwc_dec_20(msm_mdss);
>   		break;
> @@ -502,10 +506,22 @@ static int mdss_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static const struct msm_mdss_data msm8998_data = {
> +	.ubwc_enc_version = UBWC_1_0,
> +	.ubwc_dec_version = UBWC_1_0,
> +	.highest_bank_bit = 1,
> +};
> +
> +static const struct msm_mdss_data qcm2290_data = {
> +	/* no UBWC */
> +	.highest_bank_bit = 0x2,
> +};
> +
>   static const struct msm_mdss_data sc7180_data = {
>   	.ubwc_enc_version = UBWC_2_0,
>   	.ubwc_dec_version = UBWC_2_0,
>   	.ubwc_static = 0x1e,
> +	.highest_bank_bit = 0x3,
>   };
>   
>   static const struct msm_mdss_data sc7280_data = {
> @@ -550,6 +566,7 @@ static const struct msm_mdss_data sm6115_data = {
>   	.ubwc_dec_version = UBWC_2_0,
>   	.ubwc_swizzle = 7,
>   	.ubwc_static = 0x11f,
> +	.highest_bank_bit = 0x1,
>   };
>   
>   static const struct msm_mdss_data sm8250_data = {
> @@ -574,8 +591,8 @@ static const struct msm_mdss_data sm8550_data = {
>   
>   static const struct of_device_id mdss_dt_match[] = {
>   	{ .compatible = "qcom,mdss" },
> -	{ .compatible = "qcom,msm8998-mdss" },
> -	{ .compatible = "qcom,qcm2290-mdss" },
> +	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
> +	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
>   	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
>   	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
>   	{ .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
