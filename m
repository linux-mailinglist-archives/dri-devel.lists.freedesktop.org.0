Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C514C34AD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 19:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F36D10EE47;
	Thu, 24 Feb 2022 18:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1211010EE45;
 Thu, 24 Feb 2022 18:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645727158; x=1677263158;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Qde1pUg5es8k29N37MjjmtNG5oPS1vXt9LnI6nx5AJM=;
 b=qsCCvAHlmAusfC34xUEncK7evOW5cpaWZNsn3xlITdMgmkA/+gQg1B2i
 krHcxacfciRNnPp3DJmjD1IpOhXeCXwrNHv0edHx9zK6SkupaoLxF2N1m
 TWP1I3kxTLUovZ0nf1NCUd2zdBrwFKo3J1y67hf6XBP8mYhc1QTc+2Bw3 c=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 24 Feb 2022 10:25:57 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 10:25:57 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 24 Feb 2022 10:25:56 -0800
Received: from [10.110.44.69] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Thu, 24 Feb
 2022 10:25:56 -0800
Message-ID: <a219b978-21a8-a2d6-62c0-69c451b10c09@quicinc.com>
Date: Thu, 24 Feb 2022 10:25:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [Freedreno] [RFC PATCH v2 1/5] drm/msm/dp: fix panel bridge
 attachment
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Stephen Boyd
 <swboyd@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "Kuogee
 Hsieh" <quic_khsieh@quicinc.com>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-2-dmitry.baryshkov@linaro.org>
 <CAE-0n52iHFtHppZj-g0V1UP5oWzXjbNDjpOd-hgR+F=TqFzjVg@mail.gmail.com>
 <a1b1d3ef-4131-b8a9-5300-89092bce271b@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <a1b1d3ef-4131-b8a9-5300-89092bce271b@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/18/2022 6:26 PM, Dmitry Baryshkov wrote:
> On 19/02/2022 02:56, Stephen Boyd wrote:
>> Quoting Dmitry Baryshkov (2022-02-11 14:40:02)
>>> In commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
>>> enable and disable") the DP driver received a drm_bridge instance, which
>>> is always attached to the encoder as a root bridge. However it conflicts
>>> with the panel_bridge support for eDP panels. The panel bridge attaches
>>> to the encoder before the "dp" bridge has a chace to do so. Change
>>
>> s/chace/chance/
>>
>>> panel_bridge attachment to come after dp_bridge attachment.
>>
>> s/panel_bridge/panel bridge/ possibly? And maybe clarify that dp_bridge
>> is the "DP driver's drm_bridge instance created in
>> msm_dp_bridge_init()"?
>>
>> My understanding is that we want to pass the bridge created in
>> msm_dp_bridge_init() as the 'previous' bridge so that it attaches the
>> panel bridge to the output of the DP bridge that's attached to the
>> encoder.
> 
> Thanks! I'll update the commit log when pushing the patches.

Please correct if i am missing something here.

You are right that the eDP panel's panel bridge attaches to the encoder 
in dp_drm_connector_init() which happens before msm_dp_bridge_init() and 
hence it will attach directly to the encoder.

But we are talking about different encoders here. DP's dp_display has a 
different encoder compared to the EDP's dp_display.

So DP's bridge will still be attached to its encoder's root.

So what are we achieving with this change?

> 
>>
>>>
>>> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display 
>>> enable and disable")
>>> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>>
>>>   drivers/gpu/drm/msm/dp/dp_drm.c | 21 +++++++++++----------
>>>   1 file changed, 11 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c 
>>> b/drivers/gpu/drm/msm/dp/dp_drm.c
>>> index d4d360d19eba..26ef41a4c1b6 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
>>> @@ -169,16 +169,6 @@ struct drm_connector 
>>> *dp_drm_connector_init(struct msm_dp *dp_display)
>>>
>>>          drm_connector_attach_encoder(connector, dp_display->encoder);
>>>
>>> -       if (dp_display->panel_bridge) {
>>> -               ret = drm_bridge_attach(dp_display->encoder,
>>> -                                       dp_display->panel_bridge, NULL,
>>> -                                       DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>> -               if (ret < 0) {
>>> -                       DRM_ERROR("failed to attach panel bridge: 
>>> %d\n", ret);
>>> -                       return ERR_PTR(ret);
>>> -               }
>>> -       }
>>> -
>>>          return connector;
>>>   }
>>>
>>> @@ -246,5 +236,16 @@ struct drm_bridge *msm_dp_bridge_init(struct 
>>> msm_dp *dp_display, struct drm_devi
>>>                  return ERR_PTR(rc);
>>>          }
>>>
>>> +       if (dp_display->panel_bridge) {
>>> +               rc = drm_bridge_attach(dp_display->encoder,
>>> +                                       dp_display->panel_bridge, 
>>> bridge,
>>> +                                       DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>> +               if (rc < 0) {
>>> +                       DRM_ERROR("failed to attach panel bridge: 
>>> %d\n", rc);
>>> +                       drm_bridge_remove(bridge);
>>> +                       return ERR_PTR(rc);
>>> +               }
>>> +       }
>>> +
>>>          return bridge;
>>
>> Not a problem with this patch, but what is this pointer used for? I see
>> it's assigned to priv->bridges and num_bridges is incremented but nobody
>> seems to look at that.
> 
> 
> That's on my todo list. to remove connectors array and to destroy 
> created bridges during drm device destruction.
> 
