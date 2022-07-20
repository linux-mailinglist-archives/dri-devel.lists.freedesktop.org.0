Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B166257BE2D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 21:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC87D10FDF3;
	Wed, 20 Jul 2022 19:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAAF310F56D;
 Wed, 20 Jul 2022 19:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1658343698; x=1689879698;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=TOzvRVPqNoT1OqYi1zjIrLa3zYswQtJ3Ow/4dkchUlE=;
 b=cbs4O9cqiJim+uZARetsga6whMAoOTypdkwDfvBe85STvIMJidMZtNlU
 LF3yyoZb2SaIj3n2cu1Ee8JSM9OVtWIHM6HjOXLxeNlAka1eETlj5m9wY
 Z+ELY56vyDmd6hOHOrJpSNC6JcfzPU4/fw8a8KjIHzJ7kS/nTxCOhzTJE s=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 20 Jul 2022 12:01:36 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 12:01:36 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Jul 2022 12:01:36 -0700
Received: from [10.38.240.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 20 Jul
 2022 12:01:32 -0700
Message-ID: <2a33f6a4-2b23-5709-4b8a-6e4699989b85@quicinc.com>
Date: Wed, 20 Jul 2022 12:01:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4] drm/msm/dp: make eDP panel as the first connected
 connector
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
References: <1657135928-31195-1-git-send-email-quic_khsieh@quicinc.com>
 <22d4abbf-db93-82e1-ecf1-e7804e72c21b@quicinc.com>
In-Reply-To: <22d4abbf-db93-82e1-ecf1-e7804e72c21b@quicinc.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/20/2022 11:47 AM, Abhinav Kumar wrote:
> 
> 
> On 7/6/2022 12:32 PM, Kuogee Hsieh wrote:
>> Some userspace presumes that the first connected connector is the main
>> display, where it's supposed to display e.g. the login screen. For
>> laptops, this should be the main panel.
>>
>> This patch call drm_helper_move_panel_connectors_to_head() after
>> drm_bridge_connector_init() to make sure eDP stay at head of
>> connected connector list. This fixes unexpected corruption happen
>> at eDP panel if eDP is not placed at head of connected connector
>> list.
>>
>> Changes in v2:
>> -- move drm_helper_move_panel_connectors_to_head() to
>>         dpu_kms_drm_obj_init()
>>
>> Changes in v4:
>> -- move drm_helper_move_panel_connectors_to_head() to msm_drm_init()
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")

Lets drop the previous fixes tag and use this one as its more recent and 
appropriate as it added eDP support for sc7280.

Fixes: ef7837ff091c ("drm/msm/dp: Add DP controllers for sc7280")

>> ---
>>   drivers/gpu/drm/msm/msm_drv.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c 
>> b/drivers/gpu/drm/msm/msm_drv.c
>> index 4a3dda2..4d518c2 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -419,6 +419,8 @@ static int msm_drm_init(struct device *dev, const 
>> struct drm_driver *drv)
>>           }
>>       }
>> +    drm_helper_move_panel_connectors_to_head(ddev);
>> +
>>       ddev->mode_config.funcs = &mode_config_funcs;
>>       ddev->mode_config.helper_private = &mode_config_helper_funcs;
