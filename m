Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5744909CC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 14:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020B810E279;
	Mon, 17 Jan 2022 13:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705BC10E29B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 13:52:37 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso24521622wmj.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 05:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LiIpTlntYSITuyTI+izCWqQctqMJoHIqLwhsNG7Wr5U=;
 b=qE6ah31Sf7qAX0aKKpqgEvkfTJoD3IAZ2Et0Cs13BT9V0N1rDZwuhTshWbJsnHGkra
 RgKUBa3BR+lKePeYV+rYSMJG73zOpsLNoFTImT2ksJvXRx2UX6f18kXXHztwitoMU6uX
 waLcQOzEmt14knHnbOaeUQARObO4pzfHV2WlpZUUdEQdvJItfctT0DnOAfwPwcwV298V
 dCX9BfqpnRrNzrGTks16HWNrt7n0lVOa+yMPpflgKSuFu8/w/0jLF/CcSsP2QVaLhftu
 KKYRkjtuOzykcKJ/sV7MboGAmEhbr5eMuA+o1xpbBQaSYKG0JrJMHwmQG3BbvuscSun1
 186g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=LiIpTlntYSITuyTI+izCWqQctqMJoHIqLwhsNG7Wr5U=;
 b=VRsgBiHg49EfsR17hloramBK2Wxf1WJYDHnrZzg/Z+y8vOkwrVB5nvWvQfbhQkQQUr
 g1xkS/HsfV/U6kjsyr21rIeje7xdOzjFYD7vniuLs4KBqqmAyfEMVYLU2de1/XVBrofP
 +AQwbfcUkwmuzcYI1LRQBRsfQj7aqLkkewEiKKbgQMVOn9KbMuMNz3wZdvVamDucCm7M
 4cqZ5TInrHcQThUD+OA4Z8Mm1NdB7MxdWmpL332bhh1FUIJ8nNoVxfY/DHrtHA8GtFok
 hfH0MtuRq7lWoazpUJb52Pdsmt191cwFJZmplGBPinVBplNmy+kbOPBUdY9faT65NGeE
 5prA==
X-Gm-Message-State: AOAM532y7cLBnnp9pOrgXjfb7+jTeuChqYgS3sGqJPER/kqr0k8skJ9b
 pZ2cqeu3rUGX7tGcp1Kllxf4QA==
X-Google-Smtp-Source: ABdhPJxfCBB+2lpShPZRaKWy2/tvYRqFRbp9l+bKHXpaRFOPWnSWqP3Nzd74XiXds27wdXkgesO21A==
X-Received: by 2002:adf:fa08:: with SMTP id m8mr19312390wrr.221.1642427555728; 
 Mon, 17 Jan 2022 05:52:35 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:c004:9fe1:fbda:2d0c?
 ([2001:861:44c0:66c0:c004:9fe1:fbda:2d0c])
 by smtp.gmail.com with ESMTPSA id q206sm14506847wme.8.2022.01.17.05.52.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 05:52:35 -0800 (PST)
Subject: Re: dw_hdmi is showing wrong colour after commit
 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
 callbacks")
To: Biju Das <biju.das.jz@bp.renesas.com>, Fabio Estevam <festevam@gmail.com>
References: <OS0PR01MB59221ED76B74231F5836D5FB86539@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAOMZO5DJiCb5bJN5_nxnYa-FsK-u7QtFghWNzs_-udE42XPDeA@mail.gmail.com>
 <502f3ec4-fea4-8e14-c7a9-39418fc05d6d@baylibre.com>
 <OS0PR01MB592224EC8F50F41B7FF1DEE286549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <19dd6013-8a31-b2ed-29d5-93fc44193ce4@baylibre.com>
 <OS0PR01MB5922F442759BE6F228EE0B4486549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <538b8da4-1201-5f45-2abf-ecd22c867358@baylibre.com>
 <OS0PR01MB5922BC31FBCF85F99F17737B86549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ebaff694-a2d7-7eb8-5850-980e9d4e1e68@baylibre.com>
 <80fdc5a0-ddb8-5a0f-eb8c-ef7988ced638@baylibre.com>
 <OS0PR01MB59224F0F892D6F86DBD5D36286579@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <b52ae1a2-b211-2bca-8d62-482a840787ec@baylibre.com>
Date: Mon, 17 Jan 2022 14:52:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <OS0PR01MB59224F0F892D6F86DBD5D36286579@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/01/2022 13:13, Biju Das wrote:
> Hi Neil,
>> Subject: Re: dw_hdmi is showing wrong colour after commit
>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
>> callbacks")
>>
>> Hi again,
>>
>> On 14/01/2022 15:40, Neil Armstrong wrote:
>>> Hi,
>>>
>>> On 14/01/2022 15:23, Biju Das wrote:
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: Neil Armstrong <narmstrong@baylibre.com>
>>>>> Sent: 14 January 2022 13:56
>>>>> To: Biju Das <biju.das.jz@bp.renesas.com>; Fabio Estevam
>>>>> <festevam@gmail.com>
>>>>> Cc: daniel@ffwll.ch; Laurent.pinchart@ideasonboard.com;
>>>>> robert.foss@linaro.org; jonas@kwiboo.se; jernej.skrabec@gmail.com;
>>>>> martin.blumenstingl@googlemail.com;
>>>>> linux-amlogic@lists.infradead.org;
>>>>> linux-arm-kernel@lists.infradead.org;
>>>>> dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org;
>>>>> linux-renesas-soc@vger.kernel.org
>>>>> Subject: Re: dw_hdmi is showing wrong colour after commit
>>>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
>>>>> callbacks")
>>>>>
>>>>> Hi,
>>>>>
>>>>> On 14/01/2022 12:08, Biju Das wrote:
>>>>>> Hi Neil,
>>>>>>
>>>>>>> Subject: Re: dw_hdmi is showing wrong colour after commit
>>>>>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus
>>>>>>> fmts
>>>>>>> callbacks")
>>>>>>>
>>>>>>> On 14/01/2022 09:29, Biju Das wrote:
>>>>>>>> Hi Neil,
>>>>>>>>
>>>>>>>> + renesas-soc
>>>>>>>>
>>>>>>>>> Subject: Re: dw_hdmi is showing wrong colour after commit
>>>>>>>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus
>>>>>>>>> fmts
>>>>>>>>> callbacks")
>>>>>>>>>
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> On 13/01/2022 21:01, Fabio Estevam wrote:
>>>>>>>>>> Hi Biju,
>>>>>>>>>>
>>>>>>>>>> On Thu, Jan 13, 2022 at 2:45 PM Biju Das
>>>>>>>>>> <biju.das.jz@bp.renesas.com>
>>>>>>>>> wrote:
>>>>>>>>>>>
>>>>>>>>>>> Hi All,
>>>>>>>>>>>
>>>>>>>>>>> RZ/G2{H, M, N} SoC has dw_hdmi IP and it was working
>>>>>>>>>>> ok(colour) till the commit
>>>>>>>>>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus
>>>>>>>>>>> fmts
>>>>>>>>> callbacks").
>>>>>>>>>>>
>>>>>>>>>>> After this patch, the screen becomes greenish(may be it is
>>>>>>>>>>> setting it
>>>>>>>>> into YUV format??).
>>>>>>>>>>>
>>>>>>>>>>> By checking the code, previously it used to call get_input_fmt
>>>>>>>>>>> callback
>>>>>>>>> and set colour as RGB24.
>>>>>>>>>>>
>>>>>>>>>>> After this commit, it calls get_output_fmt_callbck and returns
>>>>>>>>>>> 3 outputformats(YUV16, YUV24 and RGB24) And get_input_fmt
>>>>>>>>>>> callback, I see
>>>>>>>>> the outputformat as YUV16 instead of RGB24.
>>>>>>>>>>>
>>>>>>>>>>> Not sure, I am the only one seeing this issue with dw_HDMI
>> driver.
>>>>>>>>>
>>>>>>>>> This patch was introduced to maintain the bridge color format
>>>>>>>>> negotiation after using DRM_BRIDGE_ATTACH_NO_CONNECTOR, but it
>>>>>>>>> seems it behaves incorrectly if the first bridge doesn't
>>>>>>>>> implement the negotiation callbacks.
>>>>>>>>>
>>>>>>>>> Let me check the code to see how to fix that.
>>>>>>>>
>>>>>>>> Thanks for the information, I am happy to test the patch/fix.
>>>>>>>>
>>>>>>>> Cheers,
>>>>>>>> Biju
>>>>>>>>
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> I have tested linux-next 20220112 on a imx6q-sabresd board,
>>>>>>>>>> which
>>>>>>> shows:
>>>>>>>>>>
>>>>>>>>>> dwhdmi-imx 120000.hdmi: Detected HDMI TX controller v1.30a with
>>>>>>>>>> HDCP (DWC HDMI 3D TX PHY)
>>>>>>>>>>
>>>>>>>>>> The colors are shown correctly here.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> The imx doesn't use DRM_BRIDGE_ATTACH_NO_CONNECTOR so the
>>>>>>>>> negotiation fails and use the RGB fallback input & output format.
>>>>>>>>>
>>>>>>>>> Anyway thanks for testing
>>>>>>>>>
>>>>>>>>> Neil
>>>>>>>
>>>>>>> Can you test :
>>>>>>>
>>>>>>> ==><===============================
>>>>>>> diff --git a/drivers/gpu/drm/drm_bridge.c
>>>>>>> b/drivers/gpu/drm/drm_bridge.c index c96847fc0ebc..7019acd37716
>>>>>>> 100644
>>>>>>> --- a/drivers/gpu/drm/drm_bridge.c
>>>>>>> +++ b/drivers/gpu/drm/drm_bridge.c
>>>>>>> @@ -955,7 +955,14 @@
>>>>>>> drm_atomic_bridge_chain_select_bus_fmts(struct
>>>>>>> drm_bridge *bridge,
>>>>>>>         last_bridge_state =
>>>>>>> drm_atomic_get_new_bridge_state(crtc_state-
>>>>>>>> state,
>>>>>>>
>>>>>>> last_bridge);
>>>>>>>
>>>>>>> -       if (last_bridge->funcs->atomic_get_output_bus_fmts) {
>>>>>>> +       /*
>>>>>>> +        * Only negociate with real values if both end of the
>>>>>>> + bridge
>>>>> chain
>>>>>>> +        * support negociation callbacks, otherwise you can end in
>>>>>>> + a
>>>>>>> situation
>>>>>>> +        * where the selected output format doesn't match with the
>>>>>>> + first
>>>>>>> bridge
>>>>>>> +        * output format.
>>>>>>> +        */
>>>>>>> +       if (bridge->funcs->atomic_get_input_bus_fmts &&
>>>>>>> +           last_bridge->funcs->atomic_get_output_bus_fmts) {
>>>>>>>                 const struct drm_bridge_funcs *funcs =
>>>>>>> last_bridge->funcs;
>>>>>>>
>>>>>>>                 /*
>>>>>>> @@ -980,7 +987,12 @@
>>>>>>> drm_atomic_bridge_chain_select_bus_fmts(struct
>>>>>>> drm_bridge *bridge,
>>>>>>>                 if (!out_bus_fmts)
>>>>>>>                         return -ENOMEM;
>>>>>>>
>>>>>>> -               if (conn->display_info.num_bus_formats &&
>>>>>>> +               /*
>>>>>>> +                * If first bridge doesn't support negociation,
>>>>>>> + use
>>>>>>> MEDIA_BUS_FMT_FIXED
>>>>>>> +                * as a safe value for the whole bridge chain
>>>>>>> +                */
>>>>>>> +               if (bridge->funcs->atomic_get_input_bus_fmts &&
>>>>>>> +                   conn->display_info.num_bus_formats &&
>>>>>>>                     conn->display_info.bus_formats)
>>>>>>>                         out_bus_fmts[0] = conn-
>>>>>>>> display_info.bus_formats[0];
>>>>>>>                 else
>>>>>>> ==><===============================
>>>>>>>
>>>>>>> This should exclude your situation where the first bridge doesn't
>>>>>>> support negociation.
>>>>>>
>>>>>> I have tested this fix with Linux next-20220114. Still I see colour
>>>>> issue.
>>>>>>
>>>>>> It is still negotiating and it is calling get_output_fmt_callbck
>>>>>>
>>>>>> [    3.460155] ########dw_hdmi_bridge_atomic_get_output_bus_fmts
>>>>> MEDIA_BUS_FMT_UYVY8_1X16=0#########
>>>>>> [    3.460180] ########dw_hdmi_bridge_atomic_get_output_bus_fmts
>>>>> MEDIA_BUS_FMT_YUV8_1X24=1#########
>>>>>> [    3.460202] ########dw_hdmi_bridge_atomic_get_output_bus_fmts
>>>>> MEDIA_BUS_FMT_RGB888_1X24=2#########
>>>>>>
>>>>>> And In get_input_fmt callback, I See the outputformat as YUV16
>>>>>> instead
>>>>> of RGB24.
>>>>>>
>>>>>> [    3.460319] ########dw_hdmi_bridge_atomic_get_input_bus_fmts
>>>>> MEDIA_BUS_FMT_UYVY8_1X16#########
>>>>>> [    3.473644] ########hdmi_video_sample
>>>>> MEDIA_BUS_FMT_UYVY8_1X16#########
>>>>>
>>>>> OK, looking at rcar-du, the dw-hdmi bridge is directly connected to
>>>>> the encoder.
>>>>
>>>> Yep.
>>>>
>>>>>
>>>>> Let me figure that out, no sure I can find a clean solution except
>>>>> putting back RGB24 before YUV.
>>>>>
>>>>> Anyway please test that:
>>>>
>>>> It works now after reordering.
>>>>
>>>> [    3.493302] ########dw_hdmi_bridge_atomic_get_output_bus_fmts
>> MEDIA_BUS_FMT_RGB888_1X24=0#########
>>>> [    3.493326] ########dw_hdmi_bridge_atomic_get_output_bus_fmts
>> MEDIA_BUS_FMT_YUV8_1X24=1#########
>>>> [    3.493348] ########dw_hdmi_bridge_atomic_get_output_bus_fmts
>> MEDIA_BUS_FMT_UYVY8_1X16=2#########
>>>>
>>>> [    3.493463] ########dw_hdmi_bridge_atomic_get_input_bus_fmts
>> MEDIA_BUS_FMT_RGB888_1X24#########
>>>> [    3.506797] ########hdmi_video_sample
>> MEDIA_BUS_FMT_RGB888_1X24#########
>>>>
>>>> Is it acceptable solution to the users of dw_hdmi driver? May be it is
>> worth to post a patch.
>>>> at least it is fixing the colour issue??
>>>
>>> Yes, it gets back to default behavior before negociation, nevertheless
>>> we need to think how to handle your use-case correctly at some point.
>>>
>>> I'll post this as a patch ASAP so it gets applied before landing in
>> linus master.
>>>
>>> Neil
>>>
>>>>
>>>> Regards,
>>>> Biju
>>>>
>>>>>
>> [...]
>>
>> I'm not happy with this version since it's merely a hack which makes it
>> work.
>>
>> Can you test the following change instead, it's correctly handles your
>> situation in a generic manner.
>>
>> ========================><=============================
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index 54d8fdad395f..9f2e1cac0ae2 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -2551,8 +2551,9 @@ static u32
>> *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>>         if (!output_fmts)
>>                 return NULL;
>>
>> -       /* If dw-hdmi is the only bridge, avoid negociating with ourselves
>> */
>> -       if (list_is_singular(&bridge->encoder->bridge_chain)) {
>> +       /* If dw-hdmi is the first or only bridge, avoid negociating with
>> ourselves */
>> +       if (list_is_singular(&bridge->encoder->bridge_chain) ||
>> +           list_is_first(&bridge->chain_node,
>> + &bridge->encoder->bridge_chain)) {
>>                 *num_output_fmts = 1;
>>                 output_fmts[0] = MEDIA_BUS_FMT_FIXED;
>>
>> @@ -2673,6 +2674,10 @@ static u32
>> *dw_hdmi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>         if (!input_fmts)
>>                 return NULL;
>>
>> +       /* If dw-hdmi is the first bridge fall-back to safe output format
>> */
>> +       if (list_is_first(&bridge->chain_node, &bridge->encoder-
>>> bridge_chain))
>> +               output_fmt = MEDIA_BUS_FMT_FIXED;
>> +
>>         switch (output_fmt) {
>>         /* If MEDIA_BUS_FMT_FIXED is tested, return default bus format */
>>         case MEDIA_BUS_FMT_FIXED:
>> ========================><=============================
> 
> This patch alone fixes the issue. I have tested with Linux-next.
> Do we need below code, as it is already taken care in output_bus_fmt callback.

You're right in your case the first part is enough.

> 
>> +       if (list_is_first(&bridge->chain_node, &bridge->encoder-
>>> bridge_chain))
>> +               output_fmt = MEDIA_BUS_FMT_FIXED;
> 
> Cheers,
> Biju
> 

Thanks for testing,
Neil
