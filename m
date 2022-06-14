Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F16254BD9B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 00:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB13112858;
	Tue, 14 Jun 2022 22:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD1111267A;
 Tue, 14 Jun 2022 22:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655245717; x=1686781717;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TXsGVyUodPcbLb1MebJjc7VpvV7kUIfbb97MlIz1RY0=;
 b=h3wHJ2nKe0ygZviASv8K/oNNtoInXQ5yjLlxFS0r9ELXNm3wnaPGqpo2
 b+440wUutS7LS73Od7t5BBxUJX5Mu1XJIFZvOqnmgUeetTfQW+drKgHgE
 IRzABYpjzv3HO4cDNffpqf4sAQL2BFm9vz2CeBBGW0AbyWWqjmchN5UUI U=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Jun 2022 15:28:37 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 15:28:36 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 14 Jun 2022 15:28:36 -0700
Received: from [10.110.74.141] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 14 Jun
 2022 15:28:35 -0700
Message-ID: <5afe209a-31d8-25d3-d087-2ff85eace182@quicinc.com>
Date: Tue, 14 Jun 2022 15:28:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v6] drm/msm/dp: force link training for display resolution
 change
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <airlied@linux.ie>, <bjorn.andersson@linaro.org>, <daniel@ffwll.ch>,
 <dianders@chromium.org>, <dmitry.baryshkov@linaro.org>,
 <robdclark@gmail.com>, <sean@poorly.run>, <vkoul@kernel.org>
References: <1655240702-12230-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52EAyTcQd6CiwXT1T658C-b+2r14BK_3-tf-ZiJdzqaAw@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n52EAyTcQd6CiwXT1T658C-b+2r14BK_3-tf-ZiJdzqaAw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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


On 6/14/2022 2:59 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-06-14 14:05:02)
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
>> This patch will bypass irq_hpd_hanle() in favor of directly call
> s/hanle/handle/
>
>> dp_ctrl_on_stream() to always perform link training in regardless of
>> main link status. So that no unexpected exception resolution change
>> failure cases will happen. Also this implementation are more efficient
>> than manual kicking off irq_hpd_handle function.
>>
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
>> Changes in v6:
>> -- split dp_ctrl_on_stream() for phy test case
>> -- revise commit text for modeset
>>
>> Fixes: 62671d2ef24b ("drm/msm/dp: fixes wrong connection state caused by failure of link train")
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 31 +++++++++++++++++++++++--------
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 ++-
>>   drivers/gpu/drm/msm/dp/dp_display.c | 13 ++++++-------
>>   3 files changed, 31 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index af7a80c..cb9c7af 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1807,7 +1807,27 @@ static int dp_ctrl_link_retrain(struct dp_ctrl_private *ctrl)
>>          return dp_ctrl_setup_main_link(ctrl, &training_step);
>>   }
>>
>> -int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>> +int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
>> +{
>> +       int ret = 0;
> Drop assignment please.
>
>> +       struct dp_ctrl_private *ctrl;
>> +
>> +       ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>> +
>> +       ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
>> +
>> +       ret = dp_ctrl_enable_stream_clocks(ctrl);
>> +       if (ret) {
>> +               DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       dp_ctrl_send_phy_test_pattern(ctrl);
> None of this code needs to be run in the normal display on case?
>
>> +
>> +       return 0;
>> +}
>> +
>> +int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
>>   {
>>          int ret = 0;
>>          bool mainlink_ready = false;
>> @@ -1843,12 +1863,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>>                  goto end;
>>          }
>>
>> -       if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
>> -               dp_ctrl_send_phy_test_pattern(ctrl);
>> -               return 0;
>> -       }
>> -
>> -       if (!dp_ctrl_channel_eq_ok(ctrl))
>> +       if (force_link_train || !dp_ctrl_channel_eq_ok(ctrl))
>>                  dp_ctrl_link_retrain(ctrl);
>>
>>          /* stop txing train pattern to end link training */
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index c388323..b6d25ab 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1688,10 +1689,12 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
>>
>>          state =  dp_display->hpd_state;
>>
>> -       if (state == ST_DISPLAY_OFF)
>> +       if (state == ST_DISPLAY_OFF) {
>>                  dp_display_host_phy_init(dp_display);
>> +               force_link_train = true;
>> +       }
>>
>> -       dp_display_enable(dp_display, 0);
>> +       dp_display_enable(dp_display, force_link_train);
> Do we need to pass it from here? Why can't dp_display_enable() simply
> check for 'state == ST_DISPLAY_OFF' and then force retrain the link?

can we keep this as it is?

it is more readable that we do need force link re-training due to 
ST_DISPLAY_OFF at top level.

Also we only need to do (state == ST_DISPLAY_OFF) checking one time.

