Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 616D063CC43
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 01:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7018A10E3F7;
	Wed, 30 Nov 2022 00:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EF910E3F3;
 Wed, 30 Nov 2022 00:08:52 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ATNtRlv027019; Wed, 30 Nov 2022 00:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=cMfhvGu8gnk240Ky57fJE8zipaaLCQWGyZdEWoo56WU=;
 b=lfmFeiUjHSU4VnPokT92OegpYJ6LxL5N0EN5aC3qhilhYJdIbvM4TVMZ7fRjYcAMD41C
 Ym1d9uPCj0Y6FmUykJJrJ7lSmmHxmIw7qq5QrvzV9hvfSFGYJrCghhVyORIeKIDNTBCM
 yyNHUfD3eZOoHqcc8hyb1/oCYpaTTPOYNN6u13N1bwLo+P/o/Ul/8mHeDJWtIr1P3eCs
 SJZM2XubrFQNJqGV20l5uHz27Su9LVmmJ0Xhy25oj+O3Oqsi2DfAyGThBT+vBf5dAebK
 +xcMqMaPOcxQBr9rLdOJpvLwhE7PpU9qaeH6OpD9HJOBzVGLsM+kLATqBTp1ctUzzfnq Kg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m5bnh2rnr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Nov 2022 00:08:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AU08iqK011654
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Nov 2022 00:08:44 GMT
Received: from [10.110.20.134] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 29 Nov
 2022 16:08:43 -0800
Message-ID: <0bd08349-d6ec-bec4-e1bd-6f98d1af5968@quicinc.com>
Date: Tue, 29 Nov 2022 16:08:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 2/2] drm/msm/dp: add support of max dp link rate
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <agross@kernel.org>
References: <1668725369-6331-1-git-send-email-quic_khsieh@quicinc.com>
 <1668725369-6331-3-git-send-email-quic_khsieh@quicinc.com>
 <8d75f389-9698-891f-5eff-2b76ddecad2b@linaro.org>
Content-Language: en-US
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <8d75f389-9698-891f-5eff-2b76ddecad2b@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: OqjB7sBk9zUjl1Yj4zduLECGR8_MPi2d
X-Proofpoint-GUID: OqjB7sBk9zUjl1Yj4zduLECGR8_MPi2d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_13,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 mlxscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290145
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/18/2022 3:04 AM, Dmitry Baryshkov wrote:
> On 18/11/2022 01:49, Kuogee Hsieh wrote:
>> dp_out endpoint contains both data-lanes and link-frequencies 
>> properties.
>> This patch parser dp_out endpoint properties and acquire dp_max_lanes 
>> and
>> dp_max_link_rate from respective property. Finally, comparing them 
>> against
>> both data lane and link rate read back from sink to ensure both data 
>> lane
>> and link rate are supported by platform.
>> In the case there is no data-lanes or link-frequencies property 
>> defined at
>> dp_out endpoint, the default value are 4 data lanes with 5.4 Ghz link 
>> rate.
>>
>> Changes in v2:
>> -- add max link rate from dtsi
>>
>> Changes in v3:
>> -- parser max_data_lanes and max_dp_link_rate from dp_out endpoint
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi |  1 +
>
> Should not be a part of this patch.
>
>>   drivers/gpu/drm/msm/dp/dp_display.c  | 4 ++++
>>   drivers/gpu/drm/msm/dp/dp_panel.c    |  7 ++++---
>>   drivers/gpu/drm/msm/dp/dp_panel.h    |  1 +
>>   drivers/gpu/drm/msm/dp/dp_parser.c   | 30 
>> ++++++++++++++++++++++--------
>>   drivers/gpu/drm/msm/dp/dp_parser.h   |  2 ++
>>   6 files changed, 34 insertions(+), 11 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 4afe53b..d456e76 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -3897,6 +3897,7 @@
>>                           reg = <0>;
>>                           dp_in: endpoint {
>>                               remote-endpoint = <&dpu_intf0_out>;
>> +                            data-lanes = <0 1 2 3>;
>>                           };
>>                       };
>>                   };
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 29c9845..4fe2092 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -390,6 +390,10 @@ static int dp_display_process_hpd_high(struct 
>> dp_display_private *dp)
>>       struct edid *edid;
>>         dp->panel->max_dp_lanes = dp->parser->max_dp_lanes;
>> +    dp->panel->max_dp_link_rate = dp->parser->max_dp_link_rate;
>> +
>> +    drm_dbg_dp(dp->drm_dev, "max_lanes=%d max_link_rate=%d\n",
>> +        dp->panel->max_dp_lanes, dp->panel->max_dp_link_rate);
>>         rc = dp_panel_read_sink_caps(dp->panel, 
>> dp->dp_display.connector);
>>       if (rc)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c 
>> b/drivers/gpu/drm/msm/dp/dp_panel.c
>> index 5149ceb..933fa9c 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>> @@ -75,12 +75,13 @@ static int dp_panel_read_dpcd(struct dp_panel 
>> *dp_panel)
>>       link_info->rate = 
>> drm_dp_bw_code_to_link_rate(dpcd[DP_MAX_LINK_RATE]);
>>       link_info->num_lanes = dpcd[DP_MAX_LANE_COUNT] & 
>> DP_MAX_LANE_COUNT_MASK;
>>   +    /* Limit data lanes from data-lanes of endpoint properity of 
>> dtsi */
>>       if (link_info->num_lanes > dp_panel->max_dp_lanes)
>>           link_info->num_lanes = dp_panel->max_dp_lanes;
>>   -    /* Limit support upto HBR2 until HBR3 support is added */
>> -    if (link_info->rate >= 
>> (drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4)))
>> -        link_info->rate = drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4);
>> +    /* Limit link rate from link-frequencies of endpoint properity 
>> of dtsi */
>> +    if (link_info->rate > dp_panel->max_dp_link_rate)
>> +        link_info->rate = dp_panel->max_dp_link_rate;
>>         drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
>>       drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h 
>> b/drivers/gpu/drm/msm/dp/dp_panel.h
>> index d861197a..f04d021 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
>> @@ -50,6 +50,7 @@ struct dp_panel {
>>         u32 vic;
>>       u32 max_dp_lanes;
>> +    u32 max_dp_link_rate;
>>         u32 max_bw_code;
>>   };
>> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c 
>> b/drivers/gpu/drm/msm/dp/dp_parser.c
>> index dd73221..667981e 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
>> @@ -94,16 +94,30 @@ static int dp_parser_ctrl_res(struct dp_parser 
>> *parser)
>>   static int dp_parser_misc(struct dp_parser *parser)
>>   {
>>       struct device_node *of_node = parser->pdev->dev.of_node;
>> -    int len;
>> -
>> -    len = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
>> -    if (len < 0) {
>> -        DRM_WARN("Invalid property \"data-lanes\", default max DP 
>> lanes = %d\n",
>> -             DP_MAX_NUM_DP_LANES);
>> -        len = DP_MAX_NUM_DP_LANES;
>> +    struct device_node *endpoint;
>> +    int cnt;
>> +    u32 frequence = 0;
>> +
>> +    endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0);
>> +
>> +    if (endpoint) {
>> +        cnt = of_property_count_u32_elems(endpoint, "data-lanes");
>> +        if (cnt < 0)
>> +            parser->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
>> +        else
>> +            parser->max_dp_lanes = cnt;
>
> This should be a separate patch. And now what, 
> drm_of_get_data_lanes_count() can be used here too. Why are you 
> dropping the generic function for the sake of your custom implementatoin.
drm_of_get_data_lanes_count() expect the parent node of endpoint.

It will locate endpoint first and call of_property_count_u32_elems() to 
retrieve count of elements and there is no similar function for 
link-frequencies.

To get link-frequencies we have to locate endpoint already. so why not 
use same endpoint for both data-lanes and link-frequencies.

So that consistent way are used  to retrieve both data-lanes and 
link-frequencies.




>
>> +
>> +        cnt = of_property_count_u32_elems(endpoint, 
>> "link-frequencies");
>> +        if (cnt < 0) {
>> +            parser->max_dp_link_rate = DP_LINK_FREQUENCY_HBR2; /* 
>> 54000 khz */
>> +        } else {
>> +            of_property_read_u32_array(endpoint, "link-frequencies", 
>> &frequence, 1);
>
> link-frequencies is u64 array.
>
>> +            parser->max_dp_link_rate = frequence;
>> +        }
>>       }
>>   -    parser->max_dp_lanes = len;
>> +    pr_err("%s: kuogee, lane=%d frequency=%d\n", __func__, 
>> parser->max_dp_lanes, parser->max_dp_link_rate);
>> +
>
> Leftover?
>
>>       return 0;
>>   }
>>   diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h 
>> b/drivers/gpu/drm/msm/dp/dp_parser.h
>> index 866c1a8..76ddb751 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
>> @@ -15,6 +15,7 @@
>>   #define DP_LABEL "MDSS DP DISPLAY"
>>   #define DP_MAX_PIXEL_CLK_KHZ    675000
>>   #define DP_MAX_NUM_DP_LANES    4
>> +#define DP_LINK_FREQUENCY_HBR2    540000
>>     enum dp_pm_type {
>>       DP_CORE_PM,
>> @@ -119,6 +120,7 @@ struct dp_parser {
>>       struct dp_io io;
>>       struct dp_display_data disp_data;
>>       u32 max_dp_lanes;
>> +    u32 max_dp_link_rate;
>>       struct drm_bridge *next_bridge;
>>         int (*parse)(struct dp_parser *parser);
>
