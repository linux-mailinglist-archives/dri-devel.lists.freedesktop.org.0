Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A2F74C69D
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jul 2023 19:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 419A610E115;
	Sun,  9 Jul 2023 17:22:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25AA410E115;
 Sun,  9 Jul 2023 17:22:06 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 369HLtmI031886; Sun, 9 Jul 2023 17:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=5d1LgLh9nuNOMR33H8pyxp1UrgRxhQg0BTYHoVJ3Cgc=;
 b=OzWUlCRJ0jA20PW4d7zDSdX1t1ZztKIRUkcvZi7QUxREjf/AekRrcYWpfdeX4DYvHyHv
 nx6G4uSsKbIkwMyLRwqYCEmB8SKgHEzbe7P+dlPfbJRev3SHndCHAEdzpgJkmJCbCkLV
 QdQx+H4OfWajzRe7gz8nkkvJp6mT1UXq8IAD78j2QNSR8eq55wi2bZgx0skpE5RyvD4Q
 gHFRMLGq1TJgXb9vSY4JJDNaIkDQ6Q/FX6kI9oq9CmbuTvoMFBt0OtD/w+Maw5Mbw18c
 pBUx6QEcEmjrfKM1KlvZQ9jV/Z/p5LBC8hg4jeY1rWDdu0EwZdfp3Zmky3sScPGVRXAE +A== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rq01dhumt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 09 Jul 2023 17:21:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 369HLsho027370
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 9 Jul 2023 17:21:54 GMT
Received: from [10.110.47.185] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Sun, 9 Jul
 2023 10:21:53 -0700
Message-ID: <72cb729b-a9d3-3e5b-c70a-0761f47a6779@quicinc.com>
Date: Sun, 9 Jul 2023 10:21:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH v1 1/5] drm/msm/dp: remove pm_runtime_xxx()
 from dp_power.c
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <andersson@kernel.org>
References: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
 <1688773943-3887-2-git-send-email-quic_khsieh@quicinc.com>
 <fc5501cf-c335-81f7-1ad7-26fdc1b6922d@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <fc5501cf-c335-81f7-1ad7-26fdc1b6922d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 9CUYSeYKYggZIPaTeM2g9ggGYsSPPaJb
X-Proofpoint-GUID: 9CUYSeYKYggZIPaTeM2g9ggGYsSPPaJb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-09_12,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307090163
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/7/2023 5:06 PM, Dmitry Baryshkov wrote:
> On 08/07/2023 02:52, Kuogee Hsieh wrote:
>> Since both pm_runtime_resume() and pm_runtime_suspend() are not
>> populated at dp_pm_ops. Those pm_runtime_get/put() functions within
>> dp_power.c will not have any effects in addition to increase/decrease
>> power counter.
> 
> Lie.
> 

Even if the commit text is incorrect, review comments like this are not 
helping the patch nor the author and will just get ignored anyway.

>> Also pm_runtime_xxx() should be executed at top
>> layer.
> 
> Why?
> 

I guess he meant to centralize this around dp_display.c. Will elaborate 
while posting the next rev.

>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_power.c | 9 ---------
>>   1 file changed, 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c 
>> b/drivers/gpu/drm/msm/dp/dp_power.c
>> index 5cb84ca..ed2f62a 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_power.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
>> @@ -152,8 +152,6 @@ int dp_power_client_init(struct dp_power *dp_power)
>>       power = container_of(dp_power, struct dp_power_private, dp_power);
>> -    pm_runtime_enable(power->dev);
>> -
>>       return dp_power_clk_init(power);
>>   }
>> @@ -162,8 +160,6 @@ void dp_power_client_deinit(struct dp_power 
>> *dp_power)
>>       struct dp_power_private *power;
>>       power = container_of(dp_power, struct dp_power_private, dp_power);
>> -
>> -    pm_runtime_disable(power->dev);
>>   }
>>   int dp_power_init(struct dp_power *dp_power)
>> @@ -173,11 +169,7 @@ int dp_power_init(struct dp_power *dp_power)
>>       power = container_of(dp_power, struct dp_power_private, dp_power);
>> -    pm_runtime_get_sync(power->dev);
>> -
>>       rc = dp_power_clk_enable(dp_power, DP_CORE_PM, true);
>> -    if (rc)
>> -        pm_runtime_put_sync(power->dev);
>>       return rc;
>>   }
>> @@ -189,7 +181,6 @@ int dp_power_deinit(struct dp_power *dp_power)
>>       power = container_of(dp_power, struct dp_power_private, dp_power);
>>       dp_power_clk_enable(dp_power, DP_CORE_PM, false);
>> -    pm_runtime_put_sync(power->dev);
>>       return 0;
>>   }
> 
