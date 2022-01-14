Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5480948EB21
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 14:56:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E695810E437;
	Fri, 14 Jan 2022 13:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E00D10E437
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 13:56:32 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id x4so15748700wru.7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 05:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5udCTvqUXGS4tOVFmzGXWH5rXTQA7PPfJYqSXxKYcYQ=;
 b=7ITvWIaLhJe37XuKQXuf98Fd+kG5nDnoL/HRhUEaZA1r5ccsjpvpMYj0cLxzoZb1Bd
 OD/fYp1DajOnFUydYEhpcfgUtJI7ZKeFtVtk7rLWDnnU8S0jiMjjNYkpEjohDf5wrSMX
 WvQ6TRS8NTo1ZZhrLKP47Fj5AyVNEePU5uTHXzacuAyQwb/vCUeXlnhaIVsJF3RVxT/T
 MrB1n9kIIOIyuoNi6Qks22fUZSLCCZ7wwG124j9P/e6hvSeUA26iB1wT1BCcr8q/OdVr
 +XvmQD/ZPcbjljPbP7+XJwUvuRiR3T//xxkQijKkvlPknt92OuHK8OP5lgQ3y9mqmEhx
 qziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=5udCTvqUXGS4tOVFmzGXWH5rXTQA7PPfJYqSXxKYcYQ=;
 b=qmNS7Hei4grzoJNvvLudn1dFvzLecrj3F5DpigWI4o1PCxbKGE56SrR/mhUa/jI1m0
 I+YfC3jyGwxkoFZRjhP487yFtBZMFIs37Q4fs85BMB1Z/ZYrYhjw7Bgl9IWN3cfl19pv
 BBlz1hCqidSUE5uKz+/XzDLJaKSmhKAfgKceI6j7IpQu4fuk4CjwUOp8oIaFAKvjY21h
 yQcKhuCLYlWzcLARhXzNcjdJfwamEZVynJWzNtQJ5aTzpD9UNqwnzekiRu+TUN2wsQ3w
 /SgvTIwGRdTJ6FnAxrCnU3mZFIArplrul8QhB4xi/iPfJELbJjvXiGNcLIwN2q5wmEX+
 WMYg==
X-Gm-Message-State: AOAM530YH3RPIhrTRBHrC1NeTxL1DG6XdPzc0TwJ5daL1A/0YJEu2yxg
 NkMBGQM+EMXxO2X9wkYsKajjAg==
X-Google-Smtp-Source: ABdhPJxauR9mnkqcFHnV53qVgtix4YH8ysgrrp0WL0fPncVC+BidoxMFeeuID+BvFpFPf3X7Me9JZg==
X-Received: by 2002:adf:f789:: with SMTP id q9mr8749145wrp.200.1642168590564; 
 Fri, 14 Jan 2022 05:56:30 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:a3fc:c40b:5afc:88ee?
 ([2001:861:44c0:66c0:a3fc:c40b:5afc:88ee])
 by smtp.gmail.com with ESMTPSA id g6sm5512201wri.80.2022.01.14.05.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 05:56:30 -0800 (PST)
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
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <538b8da4-1201-5f45-2abf-ecd22c867358@baylibre.com>
Date: Fri, 14 Jan 2022 14:56:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <OS0PR01MB5922F442759BE6F228EE0B4486549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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

Hi,

On 14/01/2022 12:08, Biju Das wrote:
> Hi Neil,
> 
>> Subject: Re: dw_hdmi is showing wrong colour after commit
>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
>> callbacks")
>>
>> On 14/01/2022 09:29, Biju Das wrote:
>>> Hi Neil,
>>>
>>> + renesas-soc
>>>
>>>> Subject: Re: dw_hdmi is showing wrong colour after commit
>>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
>>>> callbacks")
>>>>
>>>> Hi,
>>>>
>>>> On 13/01/2022 21:01, Fabio Estevam wrote:
>>>>> Hi Biju,
>>>>>
>>>>> On Thu, Jan 13, 2022 at 2:45 PM Biju Das
>>>>> <biju.das.jz@bp.renesas.com>
>>>> wrote:
>>>>>>
>>>>>> Hi All,
>>>>>>
>>>>>> RZ/G2{H, M, N} SoC has dw_hdmi IP and it was working ok(colour)
>>>>>> till the commit
>>>>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
>>>> callbacks").
>>>>>>
>>>>>> After this patch, the screen becomes greenish(may be it is setting
>>>>>> it
>>>> into YUV format??).
>>>>>>
>>>>>> By checking the code, previously it used to call get_input_fmt
>>>>>> callback
>>>> and set colour as RGB24.
>>>>>>
>>>>>> After this commit, it calls get_output_fmt_callbck and returns 3
>>>>>> outputformats(YUV16, YUV24 and RGB24) And get_input_fmt callback, I
>>>>>> see
>>>> the outputformat as YUV16 instead of RGB24.
>>>>>>
>>>>>> Not sure, I am the only one seeing this issue with dw_HDMI driver.
>>>>
>>>> This patch was introduced to maintain the bridge color format
>>>> negotiation after using DRM_BRIDGE_ATTACH_NO_CONNECTOR, but it seems
>>>> it behaves incorrectly if the first bridge doesn't implement the
>>>> negotiation callbacks.
>>>>
>>>> Let me check the code to see how to fix that.
>>>
>>> Thanks for the information, I am happy to test the patch/fix.
>>>
>>> Cheers,
>>> Biju
>>>
>>>>
>>>>>
>>>>> I have tested linux-next 20220112 on a imx6q-sabresd board, which
>> shows:
>>>>>
>>>>> dwhdmi-imx 120000.hdmi: Detected HDMI TX controller v1.30a with HDCP
>>>>> (DWC HDMI 3D TX PHY)
>>>>>
>>>>> The colors are shown correctly here.
>>>>>
>>>>
>>>> The imx doesn't use DRM_BRIDGE_ATTACH_NO_CONNECTOR so the negotiation
>>>> fails and use the RGB fallback input & output format.
>>>>
>>>> Anyway thanks for testing
>>>>
>>>> Neil
>>
>> Can you test :
>>
>> ==><===============================
>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>> index c96847fc0ebc..7019acd37716 100644
>> --- a/drivers/gpu/drm/drm_bridge.c
>> +++ b/drivers/gpu/drm/drm_bridge.c
>> @@ -955,7 +955,14 @@ drm_atomic_bridge_chain_select_bus_fmts(struct
>> drm_bridge *bridge,
>>         last_bridge_state = drm_atomic_get_new_bridge_state(crtc_state-
>>> state,
>>                                                             last_bridge);
>>
>> -       if (last_bridge->funcs->atomic_get_output_bus_fmts) {
>> +       /*
>> +        * Only negociate with real values if both end of the bridge chain
>> +        * support negociation callbacks, otherwise you can end in a
>> situation
>> +        * where the selected output format doesn't match with the first
>> bridge
>> +        * output format.
>> +        */
>> +       if (bridge->funcs->atomic_get_input_bus_fmts &&
>> +           last_bridge->funcs->atomic_get_output_bus_fmts) {
>>                 const struct drm_bridge_funcs *funcs = last_bridge->funcs;
>>
>>                 /*
>> @@ -980,7 +987,12 @@ drm_atomic_bridge_chain_select_bus_fmts(struct
>> drm_bridge *bridge,
>>                 if (!out_bus_fmts)
>>                         return -ENOMEM;
>>
>> -               if (conn->display_info.num_bus_formats &&
>> +               /*
>> +                * If first bridge doesn't support negociation, use
>> MEDIA_BUS_FMT_FIXED
>> +                * as a safe value for the whole bridge chain
>> +                */
>> +               if (bridge->funcs->atomic_get_input_bus_fmts &&
>> +                   conn->display_info.num_bus_formats &&
>>                     conn->display_info.bus_formats)
>>                         out_bus_fmts[0] = conn-
>>> display_info.bus_formats[0];
>>                 else
>> ==><===============================
>>
>> This should exclude your situation where the first bridge doesn't support
>> negociation.
> 
> I have tested this fix with Linux next-20220114. Still I see colour issue.
> 
> It is still negotiating and it is calling get_output_fmt_callbck
> 
> [    3.460155] ########dw_hdmi_bridge_atomic_get_output_bus_fmts MEDIA_BUS_FMT_UYVY8_1X16=0#########
> [    3.460180] ########dw_hdmi_bridge_atomic_get_output_bus_fmts MEDIA_BUS_FMT_YUV8_1X24=1#########
> [    3.460202] ########dw_hdmi_bridge_atomic_get_output_bus_fmts MEDIA_BUS_FMT_RGB888_1X24=2#########
> 
> And In get_input_fmt callback, I See the outputformat as YUV16 instead of RGB24.
> 
> [    3.460319] ########dw_hdmi_bridge_atomic_get_input_bus_fmts MEDIA_BUS_FMT_UYVY8_1X16#########
> [    3.473644] ########hdmi_video_sample MEDIA_BUS_FMT_UYVY8_1X16#########

OK, looking at rcar-du, the dw-hdmi bridge is directly connected to the encoder.

Let me figure that out, no sure I can find a clean solution except putting back RGB24 before YUV.

Anyway please test that:

==><===============================
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 54d8fdad395f..68f79094f648 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2589,45 +2589,44 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 	}

 	/*
-	 * Order bus formats from 16bit to 8bit and from YUV422 to RGB
+	 * Order bus formats from 16bit to 8bit and from RGB to YUV422
 	 * if supported. In any case the default RGB888 format is added
 	 */

 	if (max_bpc >= 16 && info->bpc == 16) {
+		output_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
+
 		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
 			output_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
-
-		output_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
 	}

 	if (max_bpc >= 12 && info->bpc >= 12) {
-		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
-			output_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
+		output_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;

 		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
 			output_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;

-		output_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
+		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
+			output_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
 	}

 	if (max_bpc >= 10 && info->bpc >= 10) {
-		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
-			output_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
+		output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;

 		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
 			output_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;

-		output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
+		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
+			output_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
 	}

-	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
-		output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
+	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;

 	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
 		output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;

-	/* Default 8bit RGB fallback */
-	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
+		output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;

 	*num_output_fmts = i;

==><===============================

Neil

> 
> Regards,
> Biju
> 

