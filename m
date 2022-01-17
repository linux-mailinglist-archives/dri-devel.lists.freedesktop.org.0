Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4C84909CE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 14:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2DD10E29B;
	Mon, 17 Jan 2022 13:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6279C10E29B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 13:53:50 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 c126-20020a1c9a84000000b00346f9ebee43so22852974wme.4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 05:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8RdMF+9/fQ5hZWwPSmZWGoBB0YBFZiij5xYHusFAWUE=;
 b=WXGfVzJXHANPp62G9z6MJ44suALxf5JGlRAuyzQbAXLtJs3UmaylF2l6R5iySSWMZ7
 PD4qMG1ctpflk3KYwGB7XYaYG/WCLPK09Dk+t3mmdW8gYsXSOhZKoIQTTcwOakE1N1U8
 xMQP5PJUuerXuOgzguNStFPc1zv+5aVq87nt+UGcL8PYrIwjm4nbaNcQzD3joDqzy3Ae
 bev8RrPtsxXO4J4gRDE/8uoNmyJC3IVwGmxZXSefivw+GyX2SAufu/OJX/Mu7Jutuc0k
 t1k5M2phLaXcFeCJclIb7RwJMyB9pD5sE5OayjsSw+/gm1INIQuMZ9sxVbpLBABOi5HF
 kbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=8RdMF+9/fQ5hZWwPSmZWGoBB0YBFZiij5xYHusFAWUE=;
 b=ft9Od51fYRM6ni4wqmT7pgqduODZyzOSywZsPj3WMpSCLlNy4BLsWU0PB0ZApOyCBF
 ft+wcVK16r2xiRwEoMxz/GF8VtKFWDp2fuZ10v2Qiqnyv6nfXj4VCdGNbcLdUOJKY8Bi
 mvForWXEkomcQgU6OXk4AZqZBNJbEY6VxW8QDvBhwGlhH+hsoxNZwjHdmAEIel68XcRg
 qmqWRspG62gzPzPZkiVH1WZTN2nUU2n6Uuc1pYIdNMc5ZRdgurNs5HZHVtspPxY4ISNA
 wGpOqDWKcaegm4U+XmoqkWZCWQaV6iWs5OxLVb8qSJBMz4v2lO3CyndF0/MnZjuXooFT
 w7aA==
X-Gm-Message-State: AOAM532MoOVt5GFzF7K8KCIFq8Vys0qlv+elUKjj41EZ6SFUXD4oAIZD
 bhL/ME92QFVxq3xMGua5gep03Q==
X-Google-Smtp-Source: ABdhPJzEbMiheUpxSC17ar9zBj5SFD/A1puYd3hPnPEf39wDiSbNK40nyEDUamWRKB5zXDFvmlECtQ==
X-Received: by 2002:adf:ec92:: with SMTP id z18mr13983011wrn.207.1642427628718; 
 Mon, 17 Jan 2022 05:53:48 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:c004:9fe1:fbda:2d0c?
 ([2001:861:44c0:66c0:c004:9fe1:fbda:2d0c])
 by smtp.gmail.com with ESMTPSA id 1sm3218879wry.81.2022.01.17.05.53.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 05:53:48 -0800 (PST)
Subject: Re: dw_hdmi is showing wrong colour after commit
 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
 callbacks")
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Fabio Estevam <festevam@gmail.com>
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
 <164241711700.10801.9011781958267060147@Monstersaurus>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <4f214ea2-5f9f-1217-6e65-f92e434ed826@baylibre.com>
Date: Mon, 17 Jan 2022 14:53:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <164241711700.10801.9011781958267060147@Monstersaurus>
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

On 17/01/2022 11:58, Kieran Bingham wrote:
> Hi Neil,
> 
> Quoting Neil Armstrong (2022-01-17 10:08:38)
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
>>>>> martin.blumenstingl@googlemail.com; linux-amlogic@lists.infradead.org;
>>>>> linux-arm-kernel@lists.infradead.org; dri-devel@lists.freedesktop.org;
>>>>> linux-kernel@vger.kernel.org; linux-renesas-soc@vger.kernel.org
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
>>>>>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
>>>>>>> callbacks")
>>>>>>>
>>>>>>> On 14/01/2022 09:29, Biju Das wrote:
>>>>>>>> Hi Neil,
>>>>>>>>
>>>>>>>> + renesas-soc
>>>>>>>>
>>>>>>>>> Subject: Re: dw_hdmi is showing wrong colour after commit
>>>>>>>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
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
>>>>>>>>>>> RZ/G2{H, M, N} SoC has dw_hdmi IP and it was working ok(colour)
>>>>>>>>>>> till the commit
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
>>>>>>>>>>> After this commit, it calls get_output_fmt_callbck and returns 3
>>>>>>>>>>> outputformats(YUV16, YUV24 and RGB24) And get_input_fmt callback,
>>>>>>>>>>> I see
>>>>>>>>> the outputformat as YUV16 instead of RGB24.
>>>>>>>>>>>
>>>>>>>>>>> Not sure, I am the only one seeing this issue with dw_HDMI driver.
>>>>>>>>>
>>>>>>>>> This patch was introduced to maintain the bridge color format
>>>>>>>>> negotiation after using DRM_BRIDGE_ATTACH_NO_CONNECTOR, but it
>>>>>>>>> seems it behaves incorrectly if the first bridge doesn't implement
>>>>>>>>> the negotiation callbacks.
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
>>>>>>>>>> I have tested linux-next 20220112 on a imx6q-sabresd board, which
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
>>>>>>> @@ -955,7 +955,14 @@ drm_atomic_bridge_chain_select_bus_fmts(struct
>>>>>>> drm_bridge *bridge,
>>>>>>>         last_bridge_state =
>>>>>>> drm_atomic_get_new_bridge_state(crtc_state-
>>>>>>>> state,
>>>>>>>
>>>>>>> last_bridge);
>>>>>>>
>>>>>>> -       if (last_bridge->funcs->atomic_get_output_bus_fmts) {
>>>>>>> +       /*
>>>>>>> +        * Only negociate with real values if both end of the bridge
>>>>> chain
>>>>>>> +        * support negociation callbacks, otherwise you can end in a
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
>>>>>>> @@ -980,7 +987,12 @@ drm_atomic_bridge_chain_select_bus_fmts(struct
>>>>>>> drm_bridge *bridge,
>>>>>>>                 if (!out_bus_fmts)
>>>>>>>                         return -ENOMEM;
>>>>>>>
>>>>>>> -               if (conn->display_info.num_bus_formats &&
>>>>>>> +               /*
>>>>>>> +                * If first bridge doesn't support negociation, use
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
> 
> This fixes the issue for me here on an H3 Salvator-XS.
> 
> Could you add...
> 
> Bisected-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> alongside Biju's Reported-by: tag when posting as a fix please?


Which patch did you test ?

Neil

> 
> 
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
>>>>>> And In get_input_fmt callback, I See the outputformat as YUV16 instead
>>>>> of RGB24.
>>>>>>
>>>>>> [    3.460319] ########dw_hdmi_bridge_atomic_get_input_bus_fmts
>>>>> MEDIA_BUS_FMT_UYVY8_1X16#########
>>>>>> [    3.473644] ########hdmi_video_sample
>>>>> MEDIA_BUS_FMT_UYVY8_1X16#########
>>>>>
>>>>> OK, looking at rcar-du, the dw-hdmi bridge is directly connected to the
>>>>> encoder.
>>>>
>>>> Yep.
>>>>
>>>>>
>>>>> Let me figure that out, no sure I can find a clean solution except putting
>>>>> back RGB24 before YUV.
>>>>>
>>>>> Anyway please test that:
>>>>
>>>> It works now after reordering.
>>>>
>>>> [    3.493302] ########dw_hdmi_bridge_atomic_get_output_bus_fmts MEDIA_BUS_FMT_RGB888_1X24=0#########
>>>> [    3.493326] ########dw_hdmi_bridge_atomic_get_output_bus_fmts MEDIA_BUS_FMT_YUV8_1X24=1#########
>>>> [    3.493348] ########dw_hdmi_bridge_atomic_get_output_bus_fmts MEDIA_BUS_FMT_UYVY8_1X16=2#########
>>>>
>>>> [    3.493463] ########dw_hdmi_bridge_atomic_get_input_bus_fmts MEDIA_BUS_FMT_RGB888_1X24#########
>>>> [    3.506797] ########hdmi_video_sample MEDIA_BUS_FMT_RGB888_1X24#########
>>>>
>>>> Is it acceptable solution to the users of dw_hdmi driver? May be it is worth to post a patch.
>>>> at least it is fixing the colour issue??
>>>
>>> Yes, it gets back to default behavior before negociation, nevertheless we need to think
>>> how to handle your use-case correctly at some point.
>>>
>>> I'll post this as a patch ASAP so it gets applied before landing in linus master.
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
>> I'm not happy with this version since it's merely a hack which makes it work.
>>
>> Can you test the following change instead, it's correctly handles your situation in a generic manner.
>>
>> ========================><=============================
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index 54d8fdad395f..9f2e1cac0ae2 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -2551,8 +2551,9 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>>         if (!output_fmts)
>>                 return NULL;
>>
>> -       /* If dw-hdmi is the only bridge, avoid negociating with ourselves */
>> -       if (list_is_singular(&bridge->encoder->bridge_chain)) {
>> +       /* If dw-hdmi is the first or only bridge, avoid negociating with ourselves */
>> +       if (list_is_singular(&bridge->encoder->bridge_chain) ||
>> +           list_is_first(&bridge->chain_node, &bridge->encoder->bridge_chain)) {
>>                 *num_output_fmts = 1;
>>                 output_fmts[0] = MEDIA_BUS_FMT_FIXED;
>>
>> @@ -2673,6 +2674,10 @@ static u32 *dw_hdmi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>         if (!input_fmts)
>>                 return NULL;
>>
>> +       /* If dw-hdmi is the first bridge fall-back to safe output format */
>> +       if (list_is_first(&bridge->chain_node, &bridge->encoder->bridge_chain))
>> +               output_fmt = MEDIA_BUS_FMT_FIXED;
>> +
>>         switch (output_fmt) {
>>         /* If MEDIA_BUS_FMT_FIXED is tested, return default bus format */
>>         case MEDIA_BUS_FMT_FIXED:
>> ========================><=============================
>>
>> Thanks,
>> Neil
>>
>>
>>>>>
>>>>> Neil
>>>>>
>>>>>>
>>>>>> Regards,
>>>>>> Biju
>>>>>>
>>>>
>>>
>>

