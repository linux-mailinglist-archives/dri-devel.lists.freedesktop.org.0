Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFC859270A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 02:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8750398F9C;
	Mon, 15 Aug 2022 00:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408FCA09C6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 00:16:05 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id by6so6213020ljb.11
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Aug 2022 17:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=l3+yF3qhdS96OdDhc9XMFg04673o05VuwvwuRib16k4=;
 b=iP6IhE5UUNDdzXpkiESuc7r4lK/Sz4ILj1L2l2FcZ2Bcb6TD0Nswu5gkGWnehzZ+Yd
 yHTkTCXhaU9Zg5cl2LOImc7oGIaZLLN+uzL9qdFQKz6OJTwXhMW5vLO0nHTr1L6WGQHx
 QIKbH2hWClQhoBiiL/V8keNYs4jVUYpEEKz5NbOq4vlkcITA0uzXpZ7g0+NLiXs3hK3Q
 9QSsSrjhLznzEHNRvkr+7mI7HoCQ5J7MOOqw/mQe3Kwuo1s2Jvg8AyC2YvZtyPJJa9vj
 Qlhc0AsGeeu8F8ZeIBYp/7uHAmyZEoC5k98y9gOel2XWwBeMMxFCqRAebz7PSg+xgzde
 jbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=l3+yF3qhdS96OdDhc9XMFg04673o05VuwvwuRib16k4=;
 b=yRfbshMD+adPaaA11MWXmKyhZv7sO51vkNQ3Ix7B4wsFYmGZrDPybrrIUE1ZH42Xi3
 0CxyzuPrDfJRr+1p712pJUGDEzid1DTNCxNyyqGDX2f+M76sOE6f7OqeelRA+UwcF0g7
 AXrsv+ev2BbVZ5Bzg9ej4LQFSWbnZ50OnWSlmte9edUkPbCBmWaG1G0pEC/UpS9SWVeX
 AtUNlFlC5B6qzoYqhnA2Dn2xPaPejINeaBu1Br4CCvRQdf8ol0EdkB+5dt964enLQSLz
 eEgIUxipwnYgYrpSVmSqPmz64uVheuyAEmRqqU9l/zMA8AGh2x9vWyb8MyFTTT1/f5oD
 ClLg==
X-Gm-Message-State: ACgBeo0qaHjCiyiLkLzpPWQYvZBo3I3JJmOUdkbGNkVO+nVNvvEhzFzy
 M2uNONQARDMDFHZDzYyDqnE=
X-Google-Smtp-Source: AA6agR5vwbw5fkg1bibtipX+1uR4elcGwZEDSv1oZrn8eLenUGXy2mB3I2/nLNDx60tnXzBOPiKKEA==
X-Received: by 2002:a2e:9417:0:b0:261:7f6a:7ed3 with SMTP id
 i23-20020a2e9417000000b002617f6a7ed3mr2052350ljh.184.1660522563301; 
 Sun, 14 Aug 2022 17:16:03 -0700 (PDT)
Received: from [192.168.2.145] (109-252-119-13.nat.spd-mgts.ru.
 [109.252.119.13]) by smtp.googlemail.com with ESMTPSA id
 s2-20020a056512202200b0048ae8e4cebdsm936237lfs.139.2022.08.14.17.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Aug 2022 17:16:02 -0700 (PDT)
Message-ID: <5a1df5ce-a497-760b-8e2c-130a0e659c0b@gmail.com>
Date: Mon, 15 Aug 2022 03:15:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] drm/bridge: sii902x: add support for
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Content-Language: en-US
To: Neil Armstrong <narmstrong@baylibre.com>, andrzej.hajda@intel.com,
 robert.foss@linaro.org, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
References: <20220113144305.1074389-1-narmstrong@baylibre.com>
 <25976b46-21b4-6e3f-0182-85dd4ca2b654@gmail.com>
 <a4a36360-3f77-17a0-9239-08cb8c08de74@baylibre.com>
 <13bd6440-9a61-d444-518c-f4e8cba0b825@baylibre.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <13bd6440-9a61-d444-518c-f4e8cba0b825@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, jonas@kwiboo.se
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

08.08.2022 12:51, Neil Armstrong пишет:
> On 08/08/2022 11:15, Neil Armstrong wrote:
>> Hi Dmitry,
>>
>> On 31/07/2022 22:07, Dmitry Osipenko wrote:
>>> 13.01.2022 17:43, Neil Armstrong пишет:
>>>> This adds support for DRM_BRIDGE_ATTACH_NO_CONNECTOR by adding the
>>>> bridge get_edid() and detect() callbacks after refactoring the
>>>> connector
>>>> get_modes() and connector_detect() callbacks.
>>>>
>>>> In order to keep the bridge working, extra code in get_modes() has been
>>>> moved to more logical places.
>>>>
>>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>>> ---
>>>>   drivers/gpu/drm/bridge/sii902x.c | 129
>>>> ++++++++++++++++++++++++-------
>>
>> 1 file changed, 99 insertions(+), 30 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/sii902x.c
>>>> b/drivers/gpu/drm/bridge/sii902x.c
>>>> index 89558e581530..65549fbfdc87 100644
>>>> --- a/drivers/gpu/drm/bridge/sii902x.c
>>>> +++ b/drivers/gpu/drm/bridge/sii902x.c
> 
> [...]
> 
>>>>       }
>>>> +    endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 1, -1);
>>>> +    if (endpoint) {
>>>> +        struct device_node *remote =
>>>> of_graph_get_remote_port_parent(endpoint);
>>>> +
>>>> +        of_node_put(endpoint);
>>>> +        if (!remote) {
>>>> +            dev_err(dev, "Endpoint in port@1 unconnected\n");
>>>> +            return -ENODEV;
>>>> +        }
>>>> +
>>>> +        if (!of_device_is_available(remote)) {
>>>> +            dev_err(dev, "port@1 remote device is disabled\n");
>>>> +            of_node_put(remote);
>>>> +            return -ENODEV;
>>>> +        }
>>>> +
>>>> +        sii902x->next_bridge = of_drm_find_bridge(remote);
>>>> +        of_node_put(remote);
>>>> +        if (!sii902x->next_bridge)
>>>> +            return -EPROBE_DEFER;
>>>
>>> Hi,
>>>
>>> This patch broke ARM/QEMU vexpress display because of_drm_find_bridge()
>>> always fail with -EPROBE_DEFER. Reverting this patch returns display
>>> back. Please fix or revert, thanks in advance.
>>
>> Can you share a QEMU cmdline to reproduce ?
> 
> Actually the vexpress DT has multiple input ports instead of a single
> input port at @0
> and an output port at @1 like documented in the bindings:
> 
> vexpress-v2m.dtsi#L303-L307:
> ports {
>     #address-cells = <1>;
>     #size-cells = <0>;
> 
>     /*
>      * Both the core tile and the motherboard routes their output
>      * pads to this transmitter. The motherboard system controller
>      * can select one of them as input using a mux register in
>      * "arm,vexpress-muxfpga". The Vexpress with the CA9 core tile is
>      * the only platform with this specific set-up.
>      */
>     port@0 {
>         reg = <0>;
>         dvi_bridge_in_ct: endpoint {
>             remote-endpoint = <&clcd_pads_ct>;
>         };
>     };
>     port@1 {
>         reg = <1>;
>         dvi_bridge_in_mb: endpoint {
>             remote-endpoint = <&clcd_pads_mb>;
>         };
>     };
> };
> 
> bindings:
>   ports:
>     $ref: /schemas/graph.yaml#/properties/ports
> 
>     properties:
>       port@0:
>         $ref: /schemas/graph.yaml#/properties/port
>         description: Parallel RGB input port
> 
>       port@1:
>         $ref: /schemas/graph.yaml#/properties/port
>         description: HDMI output port
> 
>       port@3:
>         $ref: /schemas/graph.yaml#/properties/port
>         description: Sound input port
> 
> The patch is conform to the bindings, the DT was working but is actually
> not valid.

I haven't looked closely at how to fix this properly, but if we can fix
it using of_machine_is_compatible("arm,vexpress") workaround in the
driver, then it will be good enough at least as a temporal fix, IMO.
