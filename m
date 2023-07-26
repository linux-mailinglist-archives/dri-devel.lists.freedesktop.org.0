Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C310D764272
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 01:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE1610E4C9;
	Wed, 26 Jul 2023 23:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D85710E4C9;
 Wed, 26 Jul 2023 23:14:18 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36QMqDmO021212; Wed, 26 Jul 2023 23:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=5YQJKQZuNgBUEpjxaxoyWdIrfgT+lVDaDsWW4xwQ6iY=;
 b=KlQ9GcesZxviAgScz805x+VImqiN6vsHUQ0S6m/fFR7ncboBHtUG7cWyGah9ZNcUaE9H
 GpexPvxD8Oy9LJ4L6AhrsX+u2eyUwIfgbLD9p1085htWG8QHHLFJeWyDHrbzmeMc0SG7
 zmpBlpY8cpySy/iTxYAaKTIQK1S39s1YRTTseY6w8IjTMOasPelQAOdPldosLSc6KLrq
 6JAEijgJlwPdt1qfe//lDrfT7UmKfuRMxqtvj8YeLpwy07dtKQxJsxqxybrMDsOuCet7
 I/gdR1bNAboLEWQkOPRutft0XxWMU9xShn/wRJxpdX+4eD0aGsgzv6UgipyVPZOwKo9I tg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s37g0gkae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jul 2023 23:14:13 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36QNEBYg027251
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jul 2023 23:14:11 GMT
Received: from [10.110.29.149] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 26 Jul
 2023 16:14:10 -0700
Message-ID: <13784945-8029-9b21-f226-8692e348ec1e@quicinc.com>
Date: Wed, 26 Jul 2023 16:14:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/6] drm/msm/mdss: populate missing data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
 <20230521171026.4159495-5-dmitry.baryshkov@linaro.org>
 <61b0792d-aa62-03ea-bb2c-aa9392251519@quicinc.com>
 <CAA8EJpp+uO_BZVQ9A+ZjKe3+b_H=xJc_yCfd8bKSPenU8Mf5FQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpp+uO_BZVQ9A+ZjKe3+b_H=xJc_yCfd8bKSPenU8Mf5FQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ISxJS2vYdcRMXtQQAezN3FhUmGlrs96-
X-Proofpoint-ORIG-GUID: ISxJS2vYdcRMXtQQAezN3FhUmGlrs96-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_08,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 spamscore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307260207
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
Cc: Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/26/2023 3:58 PM, Dmitry Baryshkov wrote:
> On Thu, 27 Jul 2023 at 01:30, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 5/21/2023 10:10 AM, Dmitry Baryshkov wrote:
>>> As we are going to use MDSS data for DPU programming, populate missing
>>> MDSS data. The UBWC 1.0 and no UBWC cases do not require MDSS
>>> programming, so skip them.
>>>
>>
>> Can you pls point me to the downstream references you used for msm8998?
> 
> msm-3.18, drivers/video/msm/mdss/mdss_mdp.c
> 
> See the function mdss_mdp_hw_rev_caps_init(). It sets has_ubwc for MDP
> 1.07 (msm8996), 1.14 (msm8937) / 1.16  (msm8953) and 3.0 (msm8998).
> 

It sets has_ubwc but I still cannot locate where it says version is 1.0.
Because the 0x58 register reads 0 and not 1 for msm8998.

>> Was that just taken from catalog? If so I would ask for the reference
>> for the catalog too.
>>
>> As per the register the decoder version is 0x0 and not 1.
>>
>> Even encoder version is 0 from what i see and not 1. Thats why a
>> dec_version of UBWC_1_0 is not doing anything i assume.
>>
>> Some additional questions:
>>
>> 1) Does the whole chunk in dpu_hw_sspp_setup_format() which handles ubwc
>> programming need to be protected by if (ctx->ubwc) now ?
> 
> It's hard to discuss the question which is irrelevant for this patch.
> Nevertheless, yes, it needs to be protected because e.g. qcm2290
> doesn't have UBWC support.
> 

Sorry but your commit text made me look into this function and wonder 
now what happens to that code. But I will continue this in this next 
patch so that you can see the code and the question together.

>> 2) The values of UBWC_x_x dont match the values of DPU_HW_UBWC_VER_xx.
>> What was the reason for the catalog to go with DPU_HW_UBWC_VER_xx in the
>> catalog for the encoder version in the first place? Because looking at
>> the registers UBWC_x_x is the correct value.
> 
> Huh. This definitely should be asked next to the code that you wish to
> discuss. The DPU_HW_UBWC_VER_xx values come from the first DPU
> revision.
> 

Sure, so again the next patch.

>>
>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/msm_mdss.c | 21 +++++++++++++++++++--
>>>    1 file changed, 19 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
>>> index ed836c659688..9bb7be4b9ebb 100644
>>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>>> @@ -264,6 +264,10 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>>>         * UBWC_n and the rest of params comes from hw data.
>>>         */
>>>        switch (msm_mdss->mdss_data->ubwc_dec_version) {
>>> +     case 0: /* no UBWC */
>>> +     case UBWC_1_0:
>>> +             /* do nothing */
>>> +             break;
>>>        case UBWC_2_0:
>>>                msm_mdss_setup_ubwc_dec_20(msm_mdss);
>>>                break;
>>> @@ -502,10 +506,22 @@ static int mdss_remove(struct platform_device *pdev)
>>>        return 0;
>>>    }
>>>
>>> +static const struct msm_mdss_data msm8998_data = {
>>> +     .ubwc_enc_version = UBWC_1_0,
>>> +     .ubwc_dec_version = UBWC_1_0,
>>> +     .highest_bank_bit = 1,
>>> +};
>>> +
>>> +static const struct msm_mdss_data qcm2290_data = {
>>> +     /* no UBWC */
>>> +     .highest_bank_bit = 0x2,
>>> +};
>>> +
>>>    static const struct msm_mdss_data sc7180_data = {
>>>        .ubwc_enc_version = UBWC_2_0,
>>>        .ubwc_dec_version = UBWC_2_0,
>>>        .ubwc_static = 0x1e,
>>> +     .highest_bank_bit = 0x3,
>>>    };
>>>
>>>    static const struct msm_mdss_data sc7280_data = {
>>> @@ -550,6 +566,7 @@ static const struct msm_mdss_data sm6115_data = {
>>>        .ubwc_dec_version = UBWC_2_0,
>>>        .ubwc_swizzle = 7,
>>>        .ubwc_static = 0x11f,
>>> +     .highest_bank_bit = 0x1,
>>>    };
>>>
>>>    static const struct msm_mdss_data sm8250_data = {
>>> @@ -574,8 +591,8 @@ static const struct msm_mdss_data sm8550_data = {
>>>
>>>    static const struct of_device_id mdss_dt_match[] = {
>>>        { .compatible = "qcom,mdss" },
>>> -     { .compatible = "qcom,msm8998-mdss" },
>>> -     { .compatible = "qcom,qcm2290-mdss" },
>>> +     { .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
>>> +     { .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
>>>        { .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
>>>        { .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
>>>        { .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
> 
> 
> 
