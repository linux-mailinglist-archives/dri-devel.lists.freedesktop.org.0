Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 544DC5A0141
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 20:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E2CBBFE1;
	Wed, 24 Aug 2022 18:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE0B8E820
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 13:31:03 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id f8so2530386wru.13
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 06:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc;
 bh=E0iQOazQDO/obbGYZRzh6D7dwqi0LcqsAFY3GtyIoRw=;
 b=DvxtYW38/k0Lm9cACp2Dabef+D2MTdJpxYG8BUjqhqGGndVuajRRfjDrNjZNk4Rt7M
 V8zCSbMxVW/jCs2l/y9kaeCHqz3dA2VWQuDEfkaNh5rMGByjA8aHu+0HwOgPgaGv9cgk
 c1ZqSg8OF+VGXk4zYrj2xRTBLmJOEGPWSSIgZsFDZmt3LMqj+WHxDQrF1Sv3xpn4F4AQ
 UEP0VSi/3cApAnsztS1LpXIj9C2P0Gr9L3i9yzwk3u0Gy4bn2b+hgOWHRQACYXvok6Hn
 cYOLstqE6Y4oLA7nehcusWvm1lEwoFtAg/McDdLC1UzpJ/kYPV7WbsM9Q6nWG4ptwzQF
 lAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=E0iQOazQDO/obbGYZRzh6D7dwqi0LcqsAFY3GtyIoRw=;
 b=xHv13aI6xrgD8VzckOxaOWg3vd5kbHX9noDUYviQ+yK2ZN6qW4O1mGfaJGLltVUZ0N
 7QRPQod4951w5DshtH1HB0uBqZPguIPZ3B9D00U4WxLqJxFH4zvlIOcWrofd4gvTc2N3
 vZsu/b7zZMUo/kHsUFmxtLjjxlbMmp3FN9Sr3kF6sMnFGWhU/1fGInSTTQjECVeiIDbI
 MpQhft4sHOxeLCPEImrRSkgaPCOO5lL8fFR4nsmET+AnRxQ4HMlaquFNp8L24suyxPh0
 vxOfVTi0zX9pJuygRMsUgbCJ5JVC+l5SPDby7PYJidHVYAB5+EOivEZ4WSZMqKEcYP/T
 x93A==
X-Gm-Message-State: ACgBeo2uWfgHICF0TaLx3YkMcOAMHUoel2V300qPC90bBxXU0LrCh4sP
 bsoz1dAnmWedEUoQOLEwgtzizw==
X-Google-Smtp-Source: AA6agR7WBqTmQBAeJul9q4fCb/OqNE31bC9f+464k9EY/T94d+BYyelwyzCKOSOVr8Hx9EMdHKyrbw==
X-Received: by 2002:a5d:4283:0:b0:225:2231:3fd0 with SMTP id
 k3-20020a5d4283000000b0022522313fd0mr2348511wrq.382.1660743061896; 
 Wed, 17 Aug 2022 06:31:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a5c:3576:8e69:3edc?
 ([2a01:e0a:982:cbb0:a5c:3576:8e69:3edc])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c4ecb00b003a4c6e67f01sm2634186wmq.6.2022.08.17.06.31.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 06:31:01 -0700 (PDT)
Message-ID: <3725619d-72c5-5c9d-513b-80bbc727dd07@baylibre.com>
Date: Wed, 17 Aug 2022 15:31:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/bridge: sii902x: add support for
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Content-Language: en-US
To: Dmitry Osipenko <digetx@gmail.com>, andrzej.hajda@intel.com,
 robert.foss@linaro.org, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
References: <20220113144305.1074389-1-narmstrong@baylibre.com>
 <25976b46-21b4-6e3f-0182-85dd4ca2b654@gmail.com>
 <a4a36360-3f77-17a0-9239-08cb8c08de74@baylibre.com>
 <13bd6440-9a61-d444-518c-f4e8cba0b825@baylibre.com>
 <5a1df5ce-a497-760b-8e2c-130a0e659c0b@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <5a1df5ce-a497-760b-8e2c-130a0e659c0b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 15/08/2022 02:15, Dmitry Osipenko wrote:
> 08.08.2022 12:51, Neil Armstrong пишет:
>> On 08/08/2022 11:15, Neil Armstrong wrote:
>>> Hi Dmitry,
>>>
>>> On 31/07/2022 22:07, Dmitry Osipenko wrote:
>>>> 13.01.2022 17:43, Neil Armstrong пишет:
>>>>> This adds support for DRM_BRIDGE_ATTACH_NO_CONNECTOR by adding the
>>>>> bridge get_edid() and detect() callbacks after refactoring the
>>>>> connector
>>>>> get_modes() and connector_detect() callbacks.
>>>>>
>>>>> In order to keep the bridge working, extra code in get_modes() has been
>>>>> moved to more logical places.
>>>>>
>>>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>>>> ---
>>>>>    drivers/gpu/drm/bridge/sii902x.c | 129
>>>>> ++++++++++++++++++++++++-------
>>>
>>> 1 file changed, 99 insertions(+), 30 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/bridge/sii902x.c
>>>>> b/drivers/gpu/drm/bridge/sii902x.c
>>>>> index 89558e581530..65549fbfdc87 100644
>>>>> --- a/drivers/gpu/drm/bridge/sii902x.c
>>>>> +++ b/drivers/gpu/drm/bridge/sii902x.c
>>
>> [...]
>>
>>>>>        }
>>>>> +    endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 1, -1);
>>>>> +    if (endpoint) {
>>>>> +        struct device_node *remote =
>>>>> of_graph_get_remote_port_parent(endpoint);
>>>>> +
>>>>> +        of_node_put(endpoint);
>>>>> +        if (!remote) {
>>>>> +            dev_err(dev, "Endpoint in port@1 unconnected\n");
>>>>> +            return -ENODEV;
>>>>> +        }
>>>>> +
>>>>> +        if (!of_device_is_available(remote)) {
>>>>> +            dev_err(dev, "port@1 remote device is disabled\n");
>>>>> +            of_node_put(remote);
>>>>> +            return -ENODEV;
>>>>> +        }
>>>>> +
>>>>> +        sii902x->next_bridge = of_drm_find_bridge(remote);
>>>>> +        of_node_put(remote);
>>>>> +        if (!sii902x->next_bridge)
>>>>> +            return -EPROBE_DEFER;
>>>>
>>>> Hi,
>>>>
>>>> This patch broke ARM/QEMU vexpress display because of_drm_find_bridge()
>>>> always fail with -EPROBE_DEFER. Reverting this patch returns display
>>>> back. Please fix or revert, thanks in advance.
>>>
>>> Can you share a QEMU cmdline to reproduce ?
>>
>> Actually the vexpress DT has multiple input ports instead of a single
>> input port at @0
>> and an output port at @1 like documented in the bindings:
>>
>> vexpress-v2m.dtsi#L303-L307:
>> ports {
>>      #address-cells = <1>;
>>      #size-cells = <0>;
>>
>>      /*
>>       * Both the core tile and the motherboard routes their output
>>       * pads to this transmitter. The motherboard system controller
>>       * can select one of them as input using a mux register in
>>       * "arm,vexpress-muxfpga". The Vexpress with the CA9 core tile is
>>       * the only platform with this specific set-up.
>>       */
>>      port@0 {
>>          reg = <0>;
>>          dvi_bridge_in_ct: endpoint {
>>              remote-endpoint = <&clcd_pads_ct>;
>>          };
>>      };
>>      port@1 {
>>          reg = <1>;
>>          dvi_bridge_in_mb: endpoint {
>>              remote-endpoint = <&clcd_pads_mb>;
>>          };
>>      };
>> };
>>
>> bindings:
>>    ports:
>>      $ref: /schemas/graph.yaml#/properties/ports
>>
>>      properties:
>>        port@0:
>>          $ref: /schemas/graph.yaml#/properties/port
>>          description: Parallel RGB input port
>>
>>        port@1:
>>          $ref: /schemas/graph.yaml#/properties/port
>>          description: HDMI output port
>>
>>        port@3:
>>          $ref: /schemas/graph.yaml#/properties/port
>>          description: Sound input port
>>
>> The patch is conform to the bindings, the DT was working but is actually
>> not valid.
> 
> I haven't looked closely at how to fix this properly, but if we can fix
> it using of_machine_is_compatible("arm,vexpress") workaround in the
> driver, then it will be good enough at least as a temporal fix, IMO.

If other maintainers are ok with that, it can be temporary fix until the DT gets fixed.

Neil

