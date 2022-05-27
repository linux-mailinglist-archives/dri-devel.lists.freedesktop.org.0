Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6095A5364A2
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 17:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E7710E008;
	Fri, 27 May 2022 15:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A04B10F0B1;
 Fri, 27 May 2022 15:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1653665147; x=1685201147;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4AmAb1G5xdwslkVKnzE93VMW23TrnWoLURqtUMAegWE=;
 b=T9cghxPOj/KLj2uzGacuRYZahdBSNSBk20Du+WutpDwkUE7UGiXz6Ie9
 fFncuKXBDLWYFY7ufCMTvpJ2IAnULrT4Q/bxm8ZkIiyFWFT8AAft5s+Mj
 SO6fHcBDro0dLcdwX5MoAMWk31rw3oqdcJQyxn+xL5AptBinJgmslqF6D E=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 27 May 2022 08:25:46 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2022 08:25:45 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 27 May 2022 08:25:44 -0700
Received: from [10.110.46.98] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 27 May
 2022 08:25:43 -0700
Message-ID: <1f325de0-a10e-27a8-ce7a-9ecaed75465c@quicinc.com>
Date: Fri, 27 May 2022 08:25:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/msm/dp: force link training for display resolution
 change
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <airlied@linux.ie>, <bjorn.andersson@linaro.org>, <daniel@ffwll.ch>,
 <dianders@chromium.org>, <dmitry.baryshkov@linaro.org>,
 <robdclark@gmail.com>, <sean@poorly.run>, <vkoul@kernel.org>
References: <1653585978-30090-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n53Nr7o=ZmSsBWOjUxCKxMYNrVwuVdbdL0wG7WZyrPo4Yw@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n53Nr7o=ZmSsBWOjUxCKxMYNrVwuVdbdL0wG7WZyrPo4Yw@mail.gmail.com>
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


On 5/26/2022 5:07 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-05-26 10:26:18)
>> During display resolution changes display have to be disabled first
>> followed by display enable with new resolution. This patch force
>> main link always be retrained during display enable procedure to
>> simplify implementation instead of manually kicking of irq_hpd
>> handle.
> How is that better? Can you please describe how it improves things? I
> suppose it avoids some round trips through the event queue just to turn
> on the display?

This try to fix customer issues which only happen on one particular 
panel which fails on display resolution changes sometimes.

I will add more description.

>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Any Fixes tag? Or it's not fixing anything, just making things simpler?
will add.
>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 5ddb4e8..8b71013 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> index 2433edb..dcc7af21 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> @@ -20,7 +20,7 @@ struct dp_ctrl {
>>   };
>>
>>   int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
>> -int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl);
>> +int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train);
> Can we have another API like dp_ctrl_on_stream_retrain()? Or name
> 'force_link_train' to 'retrain'?
>
>>   int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
>>   int dp_ctrl_off(struct dp_ctrl *dp_ctrl);
>>   void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index bfc6581..9246421 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -892,7 +892,7 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
> Any reason why dp_display_enable() is forward declared and why it takes
> a u32 data argument? It's not part of the eventqueue calling code from
> what I can tell so we should be able to rename 'data' to 'retrain_link'?
>
>>                  return 0;
>>          }
>>
>> -       rc = dp_ctrl_on_stream(dp->ctrl);
>> +       rc = dp_ctrl_on_stream(dp->ctrl, data);
>>          if (!rc)
>>                  dp_display->power_on = true;
>>
>> @@ -1594,6 +1594,7 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
>>          int rc = 0;
>>          struct dp_display_private *dp_display;
>>          u32 state;
>> +       bool force_link_train = false;
>>
>>          dp_display = container_of(dp, struct dp_display_private, dp_display);
>>          if (!dp_display->dp_mode.drm_mode.clock) {
>> @@ -1622,10 +1623,12 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
>>
>>          state =  dp_display->hpd_state;
>>
>> -       if (state == ST_DISPLAY_OFF)
>> +       if (state == ST_DISPLAY_OFF) {
>>                  dp_display_host_phy_init(dp_display);
>> +               force_link_train = 1;
> Use true instead of 1 if the type is a bool please.
>
>> +       }
>>
>> -       dp_display_enable(dp_display, 0);
>> +       dp_display_enable(dp_display, force_link_train);
>>
>>          rc = dp_display_post_enable(dp);
>>          if (rc) {
