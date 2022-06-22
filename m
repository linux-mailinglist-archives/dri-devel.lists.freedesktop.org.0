Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D436554F05
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 17:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106431125B2;
	Wed, 22 Jun 2022 15:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CA11124EC;
 Wed, 22 Jun 2022 15:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655911323; x=1687447323;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TRZjpIn58SQu0SVEKwga6r31mUEtI9Ahtm4FmxL6kQ4=;
 b=gppD/KyQtC7Fk3DJ6FQyc+I/xesuloY5FTen3l+soKb2MRzBEWnZQ0gE
 vcsPwCwyt8cPPaCJIBGac3YQKyxGnVNAy8G1Sj4JdOPzuCnu1X6ZyXr3w
 g2AKIVTwKtnRNgUxxyJWV4jcwMHG3Uc8aPr9gAanKb+ezPFQ23L70Dhs9 E=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 22 Jun 2022 08:22:03 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 08:22:02 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 22 Jun 2022 08:22:01 -0700
Received: from [10.110.58.84] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 22 Jun
 2022 08:22:00 -0700
Message-ID: <e27517c8-874e-1002-938b-1471fc338bb9@quicinc.com>
Date: Wed, 22 Jun 2022 08:21:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v8 1/2] drm/msm/dp: force link training for display
 resolution change
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>, <sean@poorly.run>,
 <swboyd@chromium.org>, <dianders@chromium.org>, <vkoul@kernel.org>,
 <daniel@ffwll.ch>, <airlied@linux.ie>, <agross@kernel.org>,
 <bjorn.andersson@linaro.org>
References: <1655399361-10842-1-git-send-email-quic_khsieh@quicinc.com>
 <1655399361-10842-2-git-send-email-quic_khsieh@quicinc.com>
 <f127060a-5648-fa40-81a0-be1be05b3951@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <f127060a-5648-fa40-81a0-be1be05b3951@linaro.org>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/22/2022 12:26 AM, Dmitry Baryshkov wrote:
> On 16/06/2022 20:09, Kuogee Hsieh wrote:
>> Display resolution change is implemented through drm modeset. Older
>> modeset (resolution) has to be disabled first before newer modeset
>> (resolution) can be enabled. Display disable will turn off both
>> pixel clock and main link clock so that main link have to be
>> re-trained during display enable to have new video stream flow
>> again. At current implementation, display enable function manually
>> kicks up irq_hpd_handle which will read panel link status and start
>> link training if link status is not in sync state.
>>
>> However, there is rare case that a particular panel links status keep
>> staying in sync for some period of time after main link had been shut
>> down previously at display disabled. In this case, main link retraining
>> will not be executed by irq_hdp_handle(). Hence video stream of newer
>> display resolution will fail to be transmitted to panel due to main
>> link is not in sync between host and panel.
>>
>> This patch will bypass irq_hpd_handle() in favor of directly call
>> dp_ctrl_on_stream() to always perform link training in regardless of
>> main link status. So that no unexpected exception resolution change
>> failure cases will happen. Also this implementation are more efficient
>> than manual kicking off irq_hpd_handle function.
>>
>> Changes in v2:
>> -- set force_link_train flag on DP only (is_edp == false)
>>
>> Changes in v3:
>> -- revise commit  text
>> -- add Fixes tag
>>
>> Changes in v4:
>> -- revise commit  text
>>
>> Changes in v5:
>> -- fix spelling at commit text
>>
>> Changes in v6:
>> -- split dp_ctrl_on_stream() for phy test case
>> -- revise commit text for modeset
>>
>> Changes in v7:
>> -- drop 0 assignment at local variable (ret = 0)
>>
>> Changes in v8:
>> -- add patch to remove pixel_rate from dp_ctrl
>>
>> Fixes: 62671d2ef24b ("drm/msm/dp: fixes wrong connection state caused 
>> by failure of link train")
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 31 
>> +++++++++++++++++++++++--------
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 ++-
>>   drivers/gpu/drm/msm/dp/dp_display.c | 13 ++++++-------
>>   3 files changed, 31 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
>> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index af7a80c..01028b5 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1551,7 +1551,7 @@ static int 
>> dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
>>         ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
>>       if (!ret)
>> -        ret = dp_ctrl_on_stream(&ctrl->dp_ctrl);
>> +        ret = dp_ctrl_on_stream_phy_test_report(&ctrl->dp_ctrl);
>>       else
>>           DRM_ERROR("failed to enable DP link controller\n");
>>   @@ -1807,7 +1807,27 @@ static int dp_ctrl_link_retrain(struct 
>> dp_ctrl_private *ctrl)
>>       return dp_ctrl_setup_main_link(ctrl, &training_step);
>>   }
>>   -int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>> +int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
>> +{
>> +    int ret;
>> +    struct dp_ctrl_private *ctrl;
>> +
>> +    ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>> +
>> +    ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
>
> Stephen has raised an interesting question. Comparing this to the 
> dp_ctrl_on_stream(), he noticed that we do not halve the pixel clock 
> here (if the wide bus is supported). So, the question is if this is 
> correct or not.
>
pixel is for video stream which has nothing to do phy test.

Therefore no half pixel clock rate required for phy test.

>> +
>> +    ret = dp_ctrl_enable_stream_clocks(ctrl);
>> +    if (ret) {
>> +        DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    dp_ctrl_send_phy_test_pattern(ctrl);
>> +
>> +    return 0;
>> +}
>> +
>> +int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
>>   {
>>       int ret = 0;
>>       bool mainlink_ready = false;
>> @@ -1843,12 +1863,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>>           goto end;
>>       }
>>   -    if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
>> -        dp_ctrl_send_phy_test_pattern(ctrl);
>> -        return 0;
>> -    }
>> -
>> -    if (!dp_ctrl_channel_eq_ok(ctrl))
>> +    if (force_link_train || !dp_ctrl_channel_eq_ok(ctrl))
>>           dp_ctrl_link_retrain(ctrl);
>>         /* stop txing train pattern to end link training */
>
>
