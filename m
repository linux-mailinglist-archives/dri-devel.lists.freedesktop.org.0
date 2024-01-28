Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B20B083F40A
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 06:31:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FDEE10EDF5;
	Sun, 28 Jan 2024 05:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9361E10ED48;
 Sun, 28 Jan 2024 05:31:04 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40S5MwkY031612; Sun, 28 Jan 2024 05:31:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=41ixPQB5CUjksvACxMf4iIh0FszvCOOxYkAOrJP58A4=; b=HM
 R1kRF4fYrfgWjh3zVgLb7RypeLLWh1aNo+O2iI/pD64S6NlJMPwul6km9yarF8Qg
 bwdG0kDu3EXYWFSX+1eyHADnkeH90izkScuSW7YvlJHplh1TXxCTa1lN3GxPrZgC
 adSjW0mLQuboO+zoZcjHlHNMPC+J0rBW6ytn8bemWHDTtvWodIp3wLLYLA/RyrUY
 7y+BS0wbuRaPN1WUqEqJ/l3wM7OaK3PdqXnjfONyviLNfWOSeNntfP5JYO+soJB3
 oFTSZ5in3VZP/N4b8KsNL2Sobe0SFYlBAoTMys1flaiLwTI23sW9B4UvDPSXheyf
 yywVpbYQQKrQ1vT4N2eg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvrub9fcg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jan 2024 05:31:02 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40S5V1Yn007487
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jan 2024 05:31:01 GMT
Received: from [10.110.54.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 27 Jan
 2024 21:30:59 -0800
Message-ID: <c1133eaa-703b-21fb-8715-602e7932586e@quicinc.com>
Date: Sat, 27 Jan 2024 21:30:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 10/17] drm/msm/dp: modify dp_catalog_hw_revision to show
 major and minor val
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-11-quic_parellan@quicinc.com>
 <c06c4a5d-6042-4d0a-a0ca-6321792f1061@linaro.org>
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <c06c4a5d-6042-4d0a-a0ca-6321792f1061@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: lvCVFc1uB8w8qyqrKBLqNYgHWW7FEkvb
X-Proofpoint-GUID: lvCVFc1uB8w8qyqrKBLqNYgHWW7FEkvb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401280038
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/25/2024 2:07 PM, Dmitry Baryshkov wrote:
> On 25/01/2024 21:38, Paloma Arellano wrote:
>> Modify dp_catalog_hw_revision to make the major and minor version values
>> known instead of outputting the entire hex value of the hardware version
>> register in preparation of using it for VSC SDP programming.
>>
>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_catalog.c | 12 +++++++++---
>>   drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
>>   2 files changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c 
>> b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> index 5d84c089e520a..c025786170ba5 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> @@ -24,6 +24,9 @@
>>   #define DP_INTERRUPT_STATUS_ACK_SHIFT    1
>>   #define DP_INTERRUPT_STATUS_MASK_SHIFT    2
>>   +#define DP_HW_VERSION_MAJOR(reg)    FIELD_GET(GENMASK(31, 28), reg)
>> +#define DP_HW_VERSION_MINOR(reg)    FIELD_GET(GENMASK(27, 16), reg)
>> +
>>   #define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
>>     #define DP_INTERRUPT_STATUS1 \
>> @@ -531,15 +534,18 @@ int 
>> dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog *dp_catalog,
>>    *
>>    * @dp_catalog: DP catalog structure
>>    *
>> - * Return: DP controller hw revision
>> + * Return: void
>>    *
>>    */
>> -u32 dp_catalog_hw_revision(const struct dp_catalog *dp_catalog)
>> +void dp_catalog_hw_revision(const struct dp_catalog *dp_catalog, u16 
>> *major, u16 *minor)
>>   {
>>       const struct dp_catalog_private *catalog = 
>> container_of(dp_catalog,
>>                   struct dp_catalog_private, dp_catalog);
>> +    u32 reg_dp_hw_version;
>>   -    return dp_read_ahb(catalog, REG_DP_HW_VERSION);
>> +    reg_dp_hw_version = dp_read_ahb(catalog, REG_DP_HW_VERSION);
>> +    *major = DP_HW_VERSION_MAJOR(reg_dp_hw_version);
>> +    *minor = DP_HW_VERSION_MINOR(reg_dp_hw_version);
>
> After looking at the code, it might be easier to keep 
> dp_catalog_hw_revision as is, add define for hw revision 1.2 and 
> corepare to it directly.
I thought having a  define value of the version would be harder to 
follow than what's here currently. Since having it compare to the 
version value looks a little difficult to read versus having an explicit 
major and minor value version to compare to. For example having (major 
 >= 1 && minor >= 2) versus having something like (hw_version >= 
DPU_HW_VERSION_1_2)
>
>>   }
>>     /**
>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h 
>> b/drivers/gpu/drm/msm/dp/dp_catalog.h
>> index 563903605b3a7..94c377ef90c35 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
>> @@ -170,7 +170,7 @@ void dp_catalog_ctrl_config_misc(struct 
>> dp_catalog *dp_catalog, u32 cc, u32 tb);
>>   void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 
>> rate,
>>                   u32 stream_rate_khz, bool fixed_nvid, bool 
>> is_ycbcr_420);
>>   int dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog 
>> *dp_catalog, u32 pattern);
>> -u32 dp_catalog_hw_revision(const struct dp_catalog *dp_catalog);
>> +void dp_catalog_hw_revision(const struct dp_catalog *dp_catalog, u16 
>> *major, u16 *minor);
>>   void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog);
>>   bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog);
>>   void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool 
>> enable);
>
