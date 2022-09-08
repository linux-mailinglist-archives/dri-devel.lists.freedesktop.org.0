Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B74535B265F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 21:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C60910EBC5;
	Thu,  8 Sep 2022 19:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B4510EBC5;
 Thu,  8 Sep 2022 19:00:31 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 288IL7uX029071;
 Thu, 8 Sep 2022 19:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ecfwsSLv8uU5V2UGVhxLz5yzLjCC1N/8uAOnZe67fs4=;
 b=i1VBBfe+jFK23Bf1mNWYAUJiF7U94KFyxDtDLdcn0Pwn+FGlNxdBQz5ifZE0NgDLBLVG
 Fkn8VdfSyadoXXwNR4eF+XSk0dzXLy4OyZ5VHT3yvGYdLkzMXNnFZPXyAYxGxSMvEuNE
 5mwAupW7NuZqf7GojCTZxdEIdmd1CCYdG8I6cp0p+9orkDGBmSb8nFHY6OUGiymKGiZB
 pJiPfh3HKB0B2MsNg0T7f71bRye1PpRfMHGC/kuS1gbQkLtnkmE79AImpcoerjJ3V/i4
 cn7rM1Bqd16+bLd5gohPHwfuZKA3S8pagcl/FEK74sOdCbl6WHc51SGuzUVXi5/QZQq9 /g== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jf8512n6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Sep 2022 19:00:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 288J0OXh023503
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 8 Sep 2022 19:00:24 GMT
Received: from [10.111.169.242] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 8 Sep 2022
 12:00:22 -0700
Message-ID: <1191c2bc-9208-e3c9-53a2-27e3c157dca9@quicinc.com>
Date: Thu, 8 Sep 2022 12:00:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH 3/3] drm/msm: filter out modes for DP/eDP bridge
 having unsupported clock
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <freedreno@lists.freedesktop.org>
References: <1661830389-22439-1-git-send-email-quic_abhinavk@quicinc.com>
 <1661830389-22439-4-git-send-email-quic_abhinavk@quicinc.com>
 <CAE-0n52YbUaVEyqqBsVWAEHS8kTH8YL=S-H30xgyBzMFizxYkw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAE-0n52YbUaVEyqqBsVWAEHS8kTH8YL=S-H30xgyBzMFizxYkw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: UDtnvqRjDwVwnZGvQdjepPbKiz6Pkur_
X-Proofpoint-ORIG-GUID: UDtnvqRjDwVwnZGvQdjepPbKiz6Pkur_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_11,2022-09-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxlogscore=965 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209080067
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
Cc: dianders@chromium.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/7/2022 6:12 PM, Stephen Boyd wrote:
> Quoting Abhinav Kumar (2022-08-29 20:33:09)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index bfd0aeff3f0d..8b91d8adf921 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -117,6 +117,7 @@ struct dp_display_private {
>>
>>          bool wide_bus_en;
>>
>> +       int max_ext_pclk;
> 
> Same signed comment as before.

This is in Khz. It cannot be negative. I was also thinking of an 
unsigned int for this but the drm_display_mode's clock is an int so i 
also kept it like this.

227 struct drm_display_mode {
228     /**
229      * @clock:
230      *
231      * Pixel clock in kHz.
232      */
233     int clock;        /* in kHz */
234     u16 hdisplay;
> 
>>          struct dp_audio *audio;
>>   };
>>
>> @@ -986,8 +987,15 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
>>          if (dp->is_edp)
>>                  return MODE_OK;
>>
>> -       if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
>> -               return MODE_CLOCK_HIGH;
>> +       /*
>> +        * If DP/eDP supports HPD natively or through a bridge, need to make
>> +        * sure that we filter out the modes with pixel clock higher than the
>> +        * chipset capabilities
>> +        */
>> +       if ((bridge->ops & DRM_BRIDGE_OP_HPD) ||
>> +                       (dp->next_bridge && (dp->next_bridge->ops & DRM_BRIDGE_OP_HPD)))
> 
> Doesn't drm_bridge_chain_mode_valid() already run the mode_valid bridge
> function for all bridges in the chain? I don't understand why we need to
> peek at the bridge or the next bridge and only filter in that case. Why
> can't we always filter modes here? Do we want to allow higher pixel clks
> than the chip supports?

The next bridge does not know about the max capability of the previous 
bridge.

If the DP is used as a built-in display, we dont want this filter.

If the DP is used as the external display either directly or with the 
next/last bridge as the pluggable one, then we want to apply this filter.

The reason we cant always filter modes here is that lets say the DP is 
being used as a built-in display, then this filter is not needed.

Now coming to the HPD part of the next bridge, its not necessary that we 
use the DP bridge's HPD. We could be using the external bridge's HPD.

Like the DSI patch, I should change this to check the last bridge's HPD 
bridge op.

> 
>> +               if (mode->clock > dp_display->max_ext_pclk)
>> +                       return MODE_CLOCK_HIGH;
>>
