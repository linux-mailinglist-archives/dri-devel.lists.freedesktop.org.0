Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D10A48E86C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 11:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286F610EC0C;
	Fri, 14 Jan 2022 10:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F5410EC0C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 10:42:39 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id e9so14909827wra.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 02:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gp5m+hjNnex+C5KrxF94exi88etk0hJOGkatfv4Q0bU=;
 b=R8XlGGCi3zgVrOlJxHWY3jfI+Y42tPrDUAayaOZzeN0BjiwTcKnYiWpfHf/RyPD+PA
 DMluxaRqAZF/FLUbiqhfVqmoKUCH5+PlpaZS2elAXXNYEukkKvu9KmUXOWa4tp+NrUob
 wHFBIU4SBFF/5eQWwhBelF1Px8RDqviwQoGHYiVrGUQdC5AEvxJY+7Z4Q6A9YShwuoPQ
 Rc5H9FrFvWGZ01qDSN2KjmCjPO/xOU11F8jwpuuR5GEGPN565KuEroKY9FrRWxoJLLt1
 I8dR6W+MCZGY4N34VAvXlU/8s8P0eBDOv4bZBCvqXkpOP1/p0hwkm5x9JCNdbungfjoC
 5Kow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=gp5m+hjNnex+C5KrxF94exi88etk0hJOGkatfv4Q0bU=;
 b=09fb32LfhR3xbAuVKeA8YXRpqFevpu0ayXtwDehG2E2qKbXYIfBkSMUGCT+Zu9rlMX
 CmCiOmT8AzQQtz++yTocwgTKMjD0sFdVKLABLsAVVj7mHlcQzJbOIrKEUq12mcBQvxID
 biQ37Cxljsgfp93POnZjkSEWgoFGrREfBHC5DbbQ9IFJl4Gz15Q4zc/V3f/QYKZeecJP
 ZnPKw8k1ti3IY+uCOUhjXBOtA13endCxz9cTL5n0ZP41hFslu3mHmrH1kWqoFmVmwvkz
 CklCqNaEBaA+KnxVudREaBb2LFAMJJpDXi+AMRqE+6KIT3QqnwryombAqAI7k5QQ98Hz
 V7Xw==
X-Gm-Message-State: AOAM5304sbQdEZVwLQozcE1Mn8JEHhYQa5lswXBmKiljtU+4ZYr3Br87
 CWnahlrkoYEBPyz09aeLChxBTw==
X-Google-Smtp-Source: ABdhPJyoGyFoYIArOrqbuQZfSBwAef4ylBDlWBIOjcz0yLUP3z+XxfSUcEq33rLVvTxljW/UNcrFVA==
X-Received: by 2002:a05:6000:2ce:: with SMTP id
 o14mr7927987wry.70.1642156957760; 
 Fri, 14 Jan 2022 02:42:37 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:a3fc:c40b:5afc:88ee?
 ([2001:861:44c0:66c0:a3fc:c40b:5afc:88ee])
 by smtp.gmail.com with ESMTPSA id m15sm5370531wmq.6.2022.01.14.02.42.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 02:42:37 -0800 (PST)
Subject: Re: dw_hdmi is showing wrong colour after commit
 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
 callbacks")
To: Biju Das <biju.das.jz@bp.renesas.com>, Fabio Estevam <festevam@gmail.com>
References: <OS0PR01MB59221ED76B74231F5836D5FB86539@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAOMZO5DJiCb5bJN5_nxnYa-FsK-u7QtFghWNzs_-udE42XPDeA@mail.gmail.com>
 <502f3ec4-fea4-8e14-c7a9-39418fc05d6d@baylibre.com>
 <OS0PR01MB592224EC8F50F41B7FF1DEE286549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <19dd6013-8a31-b2ed-29d5-93fc44193ce4@baylibre.com>
Date: Fri, 14 Jan 2022 11:42:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <OS0PR01MB592224EC8F50F41B7FF1DEE286549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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

On 14/01/2022 09:29, Biju Das wrote:
> Hi Neil,
>  
> + renesas-soc
> 
>> Subject: Re: dw_hdmi is showing wrong colour after commit
>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
>> callbacks")
>>
>> Hi,
>>
>> On 13/01/2022 21:01, Fabio Estevam wrote:
>>> Hi Biju,
>>>
>>> On Thu, Jan 13, 2022 at 2:45 PM Biju Das <biju.das.jz@bp.renesas.com>
>> wrote:
>>>>
>>>> Hi All,
>>>>
>>>> RZ/G2{H, M, N} SoC has dw_hdmi IP and it was working ok(colour) till
>>>> the commit
>>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
>> callbacks").
>>>>
>>>> After this patch, the screen becomes greenish(may be it is setting it
>> into YUV format??).
>>>>
>>>> By checking the code, previously it used to call get_input_fmt callback
>> and set colour as RGB24.
>>>>
>>>> After this commit, it calls get_output_fmt_callbck and returns 3
>>>> outputformats(YUV16, YUV24 and RGB24) And get_input_fmt callback, I see
>> the outputformat as YUV16 instead of RGB24.
>>>>
>>>> Not sure, I am the only one seeing this issue with dw_HDMI driver.
>>
>> This patch was introduced to maintain the bridge color format negotiation
>> after using DRM_BRIDGE_ATTACH_NO_CONNECTOR, but it seems it behaves
>> incorrectly if the first bridge doesn't implement the negotiation
>> callbacks.
>>
>> Let me check the code to see how to fix that.
> 
> Thanks for the information, I am happy to test the patch/fix.
> 
> Cheers,
> Biju
> 
>>
>>>
>>> I have tested linux-next 20220112 on a imx6q-sabresd board, which shows:
>>>
>>> dwhdmi-imx 120000.hdmi: Detected HDMI TX controller v1.30a with HDCP
>>> (DWC HDMI 3D TX PHY)
>>>
>>> The colors are shown correctly here.
>>>
>>
>> The imx doesn't use DRM_BRIDGE_ATTACH_NO_CONNECTOR so the negotiation
>> fails and use the RGB fallback input & output format.
>>
>> Anyway thanks for testing
>>
>> Neil

Can you test :

==><===============================
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c96847fc0ebc..7019acd37716 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -955,7 +955,14 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
        last_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
                                                            last_bridge);

-       if (last_bridge->funcs->atomic_get_output_bus_fmts) {
+       /*
+        * Only negociate with real values if both end of the bridge chain
+        * support negociation callbacks, otherwise you can end in a situation
+        * where the selected output format doesn't match with the first bridge
+        * output format.
+        */
+       if (bridge->funcs->atomic_get_input_bus_fmts &&
+           last_bridge->funcs->atomic_get_output_bus_fmts) {
                const struct drm_bridge_funcs *funcs = last_bridge->funcs;

                /*
@@ -980,7 +987,12 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
                if (!out_bus_fmts)
                        return -ENOMEM;

-               if (conn->display_info.num_bus_formats &&
+               /*
+                * If first bridge doesn't support negociation, use MEDIA_BUS_FMT_FIXED
+                * as a safe value for the whole bridge chain
+                */
+               if (bridge->funcs->atomic_get_input_bus_fmts &&
+                   conn->display_info.num_bus_formats &&
                    conn->display_info.bus_formats)
                        out_bus_fmts[0] = conn->display_info.bus_formats[0];
                else
==><===============================

This should exclude your situation where the first bridge doesn't support negociation.

Neil
