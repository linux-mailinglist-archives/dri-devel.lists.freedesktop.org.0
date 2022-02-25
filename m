Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 601A44C3B5F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 03:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5443F10E1E1;
	Fri, 25 Feb 2022 02:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D4510E1E1;
 Fri, 25 Feb 2022 02:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645754466; x=1677290466;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SJJC8z/VPDe1vAc6GcuJV6DiVRoR3WeMA4ImoW+jaJU=;
 b=kdkuGYc7j2/HH9X79x1dLXsmpZkFZnwSNf7kcweEWkW5wnectpUiBY0g
 swKs4o7iirhco54yrIOFD0HaCF8LMMirOHehnaM+dJUm/Kh/0nE4lmo4n
 H/BGlZoyDKwUnkFEnJhYfZpxQSb62qas7Ds/DK40PAVPQiJjKlkSZGYOc M=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 24 Feb 2022 18:01:06 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 18:01:05 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 24 Feb 2022 18:01:05 -0800
Received: from [10.110.44.69] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Thu, 24 Feb
 2022 18:01:04 -0800
Message-ID: <9398567b-6517-8eb3-f5d5-d8c88cb10814@quicinc.com>
Date: Thu, 24 Feb 2022 18:01:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [Freedreno] [RFC PATCH v2 1/5] drm/msm/dp: fix panel bridge
 attachment
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-2-dmitry.baryshkov@linaro.org>
 <CAE-0n52iHFtHppZj-g0V1UP5oWzXjbNDjpOd-hgR+F=TqFzjVg@mail.gmail.com>
 <a1b1d3ef-4131-b8a9-5300-89092bce271b@linaro.org>
 <a219b978-21a8-a2d6-62c0-69c451b10c09@quicinc.com>
 <CAA8EJpp5RjazoHD3GEE-1wJZtG3hZV9PRc3TtsBFFCcsB4zCNg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpp5RjazoHD3GEE-1wJZtG3hZV9PRc3TtsBFFCcsB4zCNg@mail.gmail.com>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/24/2022 12:41 PM, Dmitry Baryshkov wrote:
> On Thu, 24 Feb 2022 at 21:25, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 2/18/2022 6:26 PM, Dmitry Baryshkov wrote:
>>> On 19/02/2022 02:56, Stephen Boyd wrote:
>>>> Quoting Dmitry Baryshkov (2022-02-11 14:40:02)
>>>>> In commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
>>>>> enable and disable") the DP driver received a drm_bridge instance, which
>>>>> is always attached to the encoder as a root bridge. However it conflicts
>>>>> with the panel_bridge support for eDP panels. The panel bridge attaches
>>>>> to the encoder before the "dp" bridge has a chace to do so. Change
>>>>
>>>> s/chace/chance/
>>>>
>>>>> panel_bridge attachment to come after dp_bridge attachment.
>>>>
>>>> s/panel_bridge/panel bridge/ possibly? And maybe clarify that dp_bridge
>>>> is the "DP driver's drm_bridge instance created in
>>>> msm_dp_bridge_init()"?
>>>>
>>>> My understanding is that we want to pass the bridge created in
>>>> msm_dp_bridge_init() as the 'previous' bridge so that it attaches the
>>>> panel bridge to the output of the DP bridge that's attached to the
>>>> encoder.
>>>
>>> Thanks! I'll update the commit log when pushing the patches.
>>
>> Please correct if i am missing something here.
>>
>> You are right that the eDP panel's panel bridge attaches to the encoder
>> in dp_drm_connector_init() which happens before msm_dp_bridge_init() and
>> hence it will attach directly to the encoder.
>>
>> But we are talking about different encoders here. DP's dp_display has a
>> different encoder compared to the EDP's dp_display.
> 
> The encoders are different. However both encoders use the same
> codepath, which includes dp_bridge. It controls dp_display by calling
> msm_dp_display_foo() functions.
> 
>> So DP's bridge will still be attached to its encoder's root.
> 
> There is one dp_bridge per each encoder. Consider sc8180x which has 3
> DP controllers (and thus 3 dp_bridges).
> 

Sorry, but I still didnt follow this.

So for eDP, dp_drm_connector_init() will attach the panel_bridge
and then msm_dp_bridge_init() will add a drm_bridge.

And yes in that case, the drm_bridge will be after the panel_bridge

But since panel_bridge is at the root for eDP it should be okay.

Your commit text was mentioning about DP.

For DP, for each controller in the catalog, we will call modeset_init() 
which should skip this part for DP

   if (dp_display->panel_bridge) {
         ret = drm_bridge_attach(dp_display->encoder,
                     dp_display->panel_bridge, NULL,
                     DRM_BRIDGE_ATTACH_NO_CONNECTOR);
         if (ret < 0) {
             DRM_ERROR("failed to attach panel bridge: %d\n", ret);
             return ERR_PTR(ret);
         }
     }

Followed by calling msm_dp_bridge_init() which will actually attach the 
bridge:

drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);

Now, even for 3 DP controllers, this shall be true as there will be 3 
separate encoders and 3 dp_displays and hence 3 drm_bridges.

What am i missing here?

>>
>> So what are we achieving with this change?
>>
>>>
>>>>
>>>>>
>>>>> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
>>>>> enable and disable")
>>>>> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>
>>>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>>>>
>>>>>    drivers/gpu/drm/msm/dp/dp_drm.c | 21 +++++++++++----------
>>>>>    1 file changed, 11 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c
>>>>> b/drivers/gpu/drm/msm/dp/dp_drm.c
>>>>> index d4d360d19eba..26ef41a4c1b6 100644
>>>>> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
>>>>> @@ -169,16 +169,6 @@ struct drm_connector
>>>>> *dp_drm_connector_init(struct msm_dp *dp_display)
>>>>>
>>>>>           drm_connector_attach_encoder(connector, dp_display->encoder);
>>>>>
>>>>> -       if (dp_display->panel_bridge) {
>>>>> -               ret = drm_bridge_attach(dp_display->encoder,
>>>>> -                                       dp_display->panel_bridge, NULL,
>>>>> -                                       DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>>>> -               if (ret < 0) {
>>>>> -                       DRM_ERROR("failed to attach panel bridge:
>>>>> %d\n", ret);
>>>>> -                       return ERR_PTR(ret);
>>>>> -               }
>>>>> -       }
>>>>> -
>>>>>           return connector;
>>>>>    }
>>>>>
>>>>> @@ -246,5 +236,16 @@ struct drm_bridge *msm_dp_bridge_init(struct
>>>>> msm_dp *dp_display, struct drm_devi
>>>>>                   return ERR_PTR(rc);
>>>>>           }
>>>>>
>>>>> +       if (dp_display->panel_bridge) {
>>>>> +               rc = drm_bridge_attach(dp_display->encoder,
>>>>> +                                       dp_display->panel_bridge,
>>>>> bridge,
>>>>> +                                       DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>>>> +               if (rc < 0) {
>>>>> +                       DRM_ERROR("failed to attach panel bridge:
>>>>> %d\n", rc);
>>>>> +                       drm_bridge_remove(bridge);
>>>>> +                       return ERR_PTR(rc);
>>>>> +               }
>>>>> +       }
>>>>> +
>>>>>           return bridge;
>>>>
>>>> Not a problem with this patch, but what is this pointer used for? I see
>>>> it's assigned to priv->bridges and num_bridges is incremented but nobody
>>>> seems to look at that.
>>>
>>>
>>> That's on my todo list. to remove connectors array and to destroy
>>> created bridges during drm device destruction.
>>>
> 
> 
> 
