Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AEE499706
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 22:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CA310E120;
	Mon, 24 Jan 2022 21:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7CF10E1B3;
 Mon, 24 Jan 2022 21:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1643059469; x=1674595469;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+cfXczZ2nAfDwO/XJf9Hc2x2y+ptMkfQd2brKFIPpCg=;
 b=Z9JOkkRLSe9zAEIzz7yEugjAtBQC9tJ/OaRJCd4CeUT3hIV/RRJQ3aWL
 HO+0i1t8YakGD6FXQmeA5AGL/1ygzlGLGvXH8FrcOEM4NGLsZmXBu+1CP
 aR5RDFD1b0fAy0i9CIMOmlXE/Wdn95akZWQnqUsQlvuJJyJgu/Ra7Rhmj 8=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 24 Jan 2022 13:24:28 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 13:24:28 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 24 Jan 2022 13:24:27 -0800
Received: from [10.110.69.48] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 24 Jan
 2022 13:24:26 -0800
Message-ID: <28734c1c-a30c-d47f-3fc1-95035adcd33d@quicinc.com>
Date: Mon, 24 Jan 2022 13:24:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] drm/msm/dp: always add fail-safe mode into connector mode
 list
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <airlied@linux.ie>, <bjorn.andersson@linaro.org>, <daniel@ffwll.ch>,
 <dmitry.baryshkov@linaro.org>, <robdclark@gmail.com>, <sean@poorly.run>,
 <vkoul@kernel.org>
References: <1643057170-10413-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n53nFcMzuKfqVRac6PRTkoPrftXL+uVK56ZQsHVWHmivkQ@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n53nFcMzuKfqVRac6PRTkoPrftXL+uVK56ZQsHVWHmivkQ@mail.gmail.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/24/2022 1:04 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-01-24 12:46:10)
>> Some of DP link compliant test expects to return fail-safe mode
>> if prefer detailed timing mode can not be supported by mainlink's
>> lane and rate after link training. Therefore add fail-safe mode
>> into connector mode list as backup mode. This patch fixes test
>> case 4.2.2.1.
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Any Fixes tag? I also wonder why this isn't pushed into the DP core code
> somehow. Wouldn't every device need to add a 640x480 mode by default?

Original test case 4.2.2.1 always passed until we did firmware upgrade 
of our compliance test tester (Unigraph) recently.

The new firmware of tester use newer edid contains 1080p with 145.7 mhz 
which can not be supported by 2 lanes with 1.6G rate. Hence we failed 
this test case.

After discuss with Vendor, they claims we have to return fail-safe mode 
if prefer detailed timing mode can not be supported.

I think would be good to add fail-safe mode into connector mode list.




> we just run into this problem recently.
>> ---
>>   drivers/gpu/drm/msm/dp/dp_panel.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
>> index 3b02922..7743b45 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>> @@ -221,6 +221,11 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>>                  if (drm_add_modes_noedid(connector, 640, 480))
>>                          drm_set_preferred_mode(connector, 640, 480);
>>                  mutex_unlock(&connector->dev->mode_config.mutex);
>> +       } else {
>> +               /* always add fail-safe mode as backup mode */
>> +               mutex_lock(&connector->dev->mode_config.mutex);
>> +               drm_add_modes_noedid(connector, 640, 480);
>> +               mutex_unlock(&connector->dev->mode_config.mutex);
>>          }
>>
>>          if (panel->aux_cfg_update_done) {
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
