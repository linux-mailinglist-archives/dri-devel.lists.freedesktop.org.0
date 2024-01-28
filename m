Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E71383F431
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 06:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF8910F0C5;
	Sun, 28 Jan 2024 05:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8099E10E6D2;
 Sun, 28 Jan 2024 05:42:50 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40S5F9cr008048; Sun, 28 Jan 2024 05:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=JWZ3eTkWdwA+9VW/GPodMwu+3brNgl1GQ0c9G+ej9kc=; b=g+
 kvyO0U2rAdLblwp95epUgTbYbDRBp3G5S8S9uhSs2kG5HXmCMqniglr1Ip9qLFhu
 lLqANZM6FZwkDt/Tv0JyO/028hODeUI3FKVMESVZE1EXLgIYoOYZexSBk3OCJmnt
 Yto0/GBdBhVtTZXoxGXVsDtGNEMQpf/NmyOOCweCA5Pu/FuLe6JFR6FBpF62Tojr
 tLd9Z67gezFrgrKqQFi6l7xBJr2GNzkZEpGFD87yqO8GxdbmZI9pZlX3zAsE6xiL
 wg+FaLhqeP2eKY2YqjG8mhCoAFKaTJwI8tZrFfeC874XaFYCnU53cXrZZd02tGiw
 oaQ8UT4YNaUJpe8YlmWQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvt7c1dyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jan 2024 05:42:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40S5gk4p019343
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jan 2024 05:42:46 GMT
Received: from [10.110.114.127] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 27 Jan
 2024 21:42:44 -0800
Message-ID: <3b471ecc-a62a-27c0-b21b-123f244ad6ab@quicinc.com>
Date: Sat, 27 Jan 2024 21:42:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 13/17] drm/msm/dp: enable SDP and SDE periph flush update
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-14-quic_parellan@quicinc.com>
 <64c9c8ee-6ae3-4db5-8952-b8b1fff71d8b@linaro.org>
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <64c9c8ee-6ae3-4db5-8952-b8b1fff71d8b@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Fpp--WXySIFeFkIiklfJRVktvna1BqOj
X-Proofpoint-GUID: Fpp--WXySIFeFkIiklfJRVktvna1BqOj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 mlxlogscore=671
 mlxscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401280040
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


On 1/25/2024 1:50 PM, Dmitry Baryshkov wrote:
> On 25/01/2024 21:38, Paloma Arellano wrote:
>> DP controller can be setup to operate in either SDP update flush mode or
>> peripheral flush mode based on the DP controller hardware version.
>>
>> Starting in DP v1.2, the hardware documents require the use of
>> peripheral flush mode for SDP packets such as PPS OR VSC SDP packets.
>>
>> In-line with this guidance, lets program the DP controller to use
>> peripheral flush mode starting DP v1.2
>>
>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_catalog.c | 18 ++++++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    |  1 +
>>   drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
>>   4 files changed, 22 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c 
>> b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> index 7e4c68be23e56..b43083b9c2df6 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> @@ -446,6 +446,24 @@ void dp_catalog_ctrl_config_misc(struct 
>> dp_catalog *dp_catalog,
>>       dp_write_link(catalog, REG_DP_MISC1_MISC0, misc_val);
>>   }
>>   +void dp_catalog_setup_peripheral_flush(struct dp_catalog *dp_catalog)
>> +{
>> +    u32 mainlink_ctrl;
>> +    u16 major = 0, minor = 0;
>> +    struct dp_catalog_private *catalog = container_of(dp_catalog,
>> +                struct dp_catalog_private, dp_catalog);
>> +
>> +    mainlink_ctrl = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
>> +
>> +    dp_catalog_hw_revision(dp_catalog, &major, &minor);
>> +    if (major >= 1 && minor >= 2)
>
> if (major > 1 || (major == 1 && minor >= 2))
>
> As a check, which of the values should be written for maj.min = 2.1?
Ack. My mistake
>
>> +        mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
>> +    else
>> +        mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
>> +
>> +    dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
>> +}
>> +
>>   void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
>>                       u32 rate, u32 stream_rate_khz,
>>                       bool fixed_nvid, bool is_ycbcr_420)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h 
>> b/drivers/gpu/drm/msm/dp/dp_catalog.h
>> index 6b757249c0698..1d57988aa6689 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
>> @@ -169,6 +169,7 @@ void dp_catalog_ctrl_config_ctrl(struct 
>> dp_catalog *dp_catalog, u32 config);
>>   void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog);
>>   void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog, 
>> bool enable);
>>   void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog 
>> *dp_catalog, bool enable);
>> +void dp_catalog_setup_peripheral_flush(struct dp_catalog *dp_catalog);
>>   void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 
>> cc, u32 tb);
>>   void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 
>> rate,
>>                   u32 stream_rate_khz, bool fixed_nvid, bool 
>> is_ycbcr_420);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
>> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index ddd92a63d5a67..c375b36f53ce1 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -170,6 +170,7 @@ static void 
>> dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
>>         dp_catalog_ctrl_lane_mapping(ctrl->catalog);
>>       dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
>> +    dp_catalog_setup_peripheral_flush(ctrl->catalog);
>>         dp_ctrl_config_ctrl(ctrl);
>>   diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h 
>> b/drivers/gpu/drm/msm/dp/dp_reg.h
>> index 756ddf85b1e81..05a1009d2f678 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
>> @@ -102,6 +102,8 @@
>>   #define DP_MAINLINK_CTRL_ENABLE            (0x00000001)
>>   #define DP_MAINLINK_CTRL_RESET            (0x00000002)
>>   #define DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER    (0x00000010)
>> +#define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP    (0x00800000)
>> +#define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE (0x01800000)
>>   #define DP_MAINLINK_FB_BOUNDARY_SEL        (0x02000000)
>>     #define REG_DP_STATE_CTRL            (0x00000004)
>
