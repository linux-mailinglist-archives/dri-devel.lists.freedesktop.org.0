Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8948454BB9F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 22:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E3D112D5C;
	Tue, 14 Jun 2022 20:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F14112D56;
 Tue, 14 Jun 2022 20:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655238435; x=1686774435;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UDEEJc0PO0iqKNgH4GebjAuPilFKCZUwgVS2lV5h30E=;
 b=uqGqLw+iSnvsflygGp21GJUfwZG8jSoEsrqrOK8TnGbdEfA3k0xW3qgz
 5WEdUIH5CvwYURJJd6iv/i0ChaxUiNfCynLb5/C03TkhHindQF5fschgg
 Lqo2T7w6eMsglNTUKyu1A5gv9pNB0Z7wEY3JQhAYgs8UI3oKOv6wmxPyG I=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Jun 2022 13:27:15 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 13:27:14 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 14 Jun 2022 13:27:14 -0700
Received: from [10.110.74.141] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 14 Jun
 2022 13:27:13 -0700
Message-ID: <19c6362a-6481-4d09-2d03-030084d27665@quicinc.com>
Date: Tue, 14 Jun 2022 13:27:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5] drm/msm/dp: force link training for display resolution
 change
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <airlied@linux.ie>, <bjorn.andersson@linaro.org>, <daniel@ffwll.ch>,
 <dianders@chromium.org>, <dmitry.baryshkov@linaro.org>,
 <robdclark@gmail.com>, <sean@poorly.run>, <vkoul@kernel.org>
References: <1655156917-21726-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n50Z92PM+j7S_wmTeLcmu5cVO3YBT+viLeoLs5QhgXZMoA@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n50Z92PM+j7S_wmTeLcmu5cVO3YBT+viLeoLs5QhgXZMoA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/14/2022 1:38 AM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-06-13 14:48:37)
>> During display resolution changes display have to be disabled first
>> followed by display enabling with new resolution. Display disable
>> will turn off both pixel clock and main link clock so that main link
>> have to be re-trained during display enable to have new video stream
>> flow again. At current implementation, display enable function manually
>> kicks up irq_hpd_handle which will read panel link status and start link
>> training if link status is not in sync state. However, there is rare
>> case that a particular panel links status keep staying in sync for
>> some period of time after main link had been shut down previously at
>> display disabled. Main link retraining will not be executed by
>> irq_hdp_handle() if the link status read from panel shows it is in
>> sync state. If this was happen, then video stream of newer display
>> resolution will fail to be transmitted to panel due to main link is
>> not in sync between host and panel. This patch force main link always
>> be retrained during display enable procedure to prevent this rare
>> failed case from happening. Also this implementation are more
>> efficient than manual kicking off irq_hpd_handle function.
> How is resolution change different from disabling and enabling the
> display? The commit text talks about resolution changes, but the code
> doesn't compare resolutions from before and after to know when to
> retrain the link. Can the code be made to actually do what the commit
> text says? It would be clearer if the code looked for actual resolution
> changes instead of hooking the dp_bridge_enable() function.
>
>> Changes in v2:
>> -- set force_link_train flag on DP only (is_edp == false)
>>
>> Changes in v3:
>> -- revise commit  text
>> -- add Fixes tag
>>
>> Changes in v4:
>> -- revise commit  text
>>
>> Changes in v5:
>> -- fix spelling at commit text
>>
>> Fixes: 62671d2ef24b ("drm/msm/dp: fixes wrong connection state caused by failure of link train")
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    |  6 +++---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>>   drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
>>   3 files changed, 12 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index af7a80c..bea93eb 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1551,7 +1551,7 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
>>
>>          ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
>>          if (!ret)
>> -               ret = dp_ctrl_on_stream(&ctrl->dp_ctrl);
>> +               ret = dp_ctrl_on_stream(&ctrl->dp_ctrl, false);
> Does this even matter if it's true or false? The 'sink_request' has
> DP_TEST_LINK_PHY_TEST_PATTERN set from what I can tell, and then
> dp_ctrl_on_stream() bails out before calling dp_ctrl_link_retrain()
> anyway. It would be nice if we could split dp_ctrl_on_stream() so that
> the part after the check for the sink request is a different function
> that is called by dp_display.c and then this code can call the 'prepare'
> function that does the first part. Then we can ignore the testing path
> in the code, and possibly remove the conditional in dp_ctrl_on_stream()?
>
>>          else
>>                  DRM_ERROR("failed to enable DP link controller\n");
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index c388323..370348d 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -872,7 +872,7 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
>>                  return 0;
>>          }
>>
>> -       rc = dp_ctrl_on_stream(dp->ctrl);
>> +       rc = dp_ctrl_on_stream(dp->ctrl, data);
>>          if (!rc)
>>                  dp_display->power_on = true;
>>
>> @@ -1654,6 +1654,7 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
>>          int rc = 0;
>>          struct dp_display_private *dp_display;
>>          u32 state;
>> +       bool force_link_train = false;
>>
>>          dp_display = container_of(dp, struct dp_display_private, dp_display);
>>          if (!dp_display->dp_mode.drm_mode.clock) {
>> @@ -1688,10 +1689,14 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
>>
>>          state =  dp_display->hpd_state;
>>
>> -       if (state == ST_DISPLAY_OFF)
>> +       if (state == ST_DISPLAY_OFF) {
>>                  dp_display_host_phy_init(dp_display);
>>
>> -       dp_display_enable(dp_display, 0);
>> +               if (!dp->is_edp)
> I didn't see any answer to my question about why edp is special on v4.
> Can you at least add a comment to the code about why edp doesn't need to
> unconditionally retrain, but DP does?

Sorry, missed this one.

This is my mistake, both DP and eDP are same. will remove is_edp flag 
checking.

>
>> +                       force_link_train = true;
>> +       }
>> +
>> +       dp_display_enable(dp_display, force_link_train);
>>
>>          rc = dp_display_post_enable(dp);
>>          if (rc) {
