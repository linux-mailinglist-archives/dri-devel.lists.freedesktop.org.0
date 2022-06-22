Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7612554F09
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 17:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689B81134FE;
	Wed, 22 Jun 2022 15:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC151134FB;
 Wed, 22 Jun 2022 15:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655911378; x=1687447378;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=87Qq8BXdj0oC27XtAdkJjn36CJVp5PFQnPwBOeB17fE=;
 b=pDOUb8raof5tCYyBZtyPMFJRB319hbx5AXAgZXxdOc+MVPmBMK7Y0Oa2
 xu0Cd1fuin6tQgtU1VbJR0bERL2+eHoWnAa9owax+El0Pz3hoIB+WsoKk
 Tm9MW9gHaMtV0CjhFhXfOKqSMzXTd+y0feQFHIWWcI36aNQmdfz2IKb0L 4=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Jun 2022 08:22:58 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 08:22:57 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 22 Jun 2022 08:22:57 -0700
Received: from [10.110.58.84] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 22 Jun
 2022 08:22:56 -0700
Message-ID: <d77d2989-7270-d1ec-fda6-7001ea337f5b@quicinc.com>
Date: Wed, 22 Jun 2022 08:22:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/3] drm/msm/dp: Remove pixel_rate from struct dp_ctrl
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Stephen Boyd
 <swboyd@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>
References: <20220617204750.2347797-1-swboyd@chromium.org>
 <20220617204750.2347797-3-swboyd@chromium.org>
 <bb98ca29-8752-6864-ddbd-19547fb6f73b@linaro.org>
 <CAE-0n51_zysbkktVEfhvXtGqpADTWcaPBAX7A7rD1FV+vcK3Uw@mail.gmail.com>
 <48d83380-edb1-ad61-3878-5fa3ac3e5169@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <48d83380-edb1-ad61-3878-5fa3ac3e5169@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/22/2022 12:24 AM, Dmitry Baryshkov wrote:
> On 22/06/2022 05:59, Stephen Boyd wrote:
>> Quoting Dmitry Baryshkov (2022-06-17 16:07:58)
>>> On 17/06/2022 23:47, Stephen Boyd wrote:
>>>> This struct member is stored to in the function that calls the 
>>>> function
>>>> which uses it. That's possible with a function argument instead of
>>>> storing to a struct member. Pass the pixel_rate as an argument instead
>>>> to simplify the code. Note that dp_ctrl_link_maintenance() was storing
>>>> the pixel_rate but never using it so we just remove the assignment 
>>>> from
>>>> there.
>>>>
>>>> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_ctrl.c | 57 
>>>> ++++++++++++++++----------------
>>>>    drivers/gpu/drm/msm/dp/dp_ctrl.h |  1 -
>>>>    2 files changed, 28 insertions(+), 30 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
>>>> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>> index bd445e683cfc..e114521af2e9 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>> @@ -1336,7 +1336,7 @@ static void dp_ctrl_set_clock_rate(struct 
>>>> dp_ctrl_private *ctrl,
>>>>                                name, rate);
>>>>    }
>>>>
>>>> -static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private 
>>>> *ctrl)
>>>> +static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private 
>>>> *ctrl, unsigned long pixel_rate)
>>>
>>>
>>> I think we can read pixel_rate here rather than getting it as an
>>> argument. We'd need to move handling (DP_TEST_LINK_PHY_TEST_PATTERN &&
>>> !ctrl->panel->dp_mode.drm_mode.clock) case here from dp_ctrl_on_link().
>>
>> This is also called from dp_ctrl_on_stream() and
>> dp_ctrl_reinitialize_mainlink(). In the dp_ctrl_on_stream() case we may
>> divide the pixel_rate by 2 with widebus. We could move the
>> dp_ctrl_on_link() code here, but then we also need to move widebus, and
>> then I'm not sure which pixel rate to use.
>>
>> It looks like the test code doesn't care about widebus? And similarly,
>> we may run the pixel clk faster until we get a modeset and then divide
>> it for widebus.
>
> Good question. I'll let Kuogee or somebody else from Qualcomm to 
> comment on test code vs widebus vs pixel rate, as I don't know these 
> details.
>
> I'm not sure if we should halve the pixel clock in 
> dp_ctrl_on_stream_phy_test_report() or not if the widebus is supported.
> From the current code I'd assume that we have to do this. Let's raise 
> this question in the corresponding patch discussion.
>
yes, phy test does not care pixel clock rate.
>> Is that why you're suggesting to check
>> !ctrl->panel->dp_mode.drm_mode.clock? I hesitate because it isn't a
>> direct conversion, instead it checks some other stashed struct member.
>>
>> I'll also note that dp_ctrl_enable_mainlink_clocks() doesn't really use
>> this argument except to print the value in drm_dbg_dp(). Maybe we should
>> simply remove it from here instead?
>
> Yes, do it please.
>
>>
>>>> @@ -1588,12 +1586,12 @@ static int 
>>>> dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
>>>>    {
>>>>        int ret;
>>>>        struct dp_ctrl_private *ctrl;
>>>> +     unsigned long pixel_rate;
>>>>
>>>>        ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>>>>
>>>> -     ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
>>>> -
>>>> -     ret = dp_ctrl_enable_stream_clocks(ctrl);
>>>> +     pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
>>>> +     ret = dp_ctrl_enable_stream_clocks(ctrl, pixel_rate);
>>>
>>> I think we can take another step forward here. Read the
>>> ctrl->panel->dp_mode.drm_mode.clock from within the
>>> dp_ctrl_enable_stream_clocks() function. This removes the need to pass
>>> pixel_rate as an argument here.
>>
>> This is also affected by widebus and if the function is called from
>> dp_ctrl_on_stream() or dp_ctrl_on_stream_phy_test_report(). Maybe it
>> would be better to inline dp_ctrl_enable_stream_clocks() to the
>> callsites? That would probably simplify things because the function is
>> mostly a wrapper around a couple functions.
>
> Yes, this sounds good. Then we can drop the drm_dbg_dp from it (as it 
> nearly duplicates the data that was just printed.
>
>
