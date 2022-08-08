Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8C458C5EB
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 11:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5380514B7DC;
	Mon,  8 Aug 2022 09:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852EB14AC08
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 09:51:47 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id b6so4502838wmq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Aug 2022 02:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc;
 bh=nWag6UrPcWinHgoAJevy+Oro++k7EWNcad6rYT4Tmgc=;
 b=LFPpoy0gsD/Y4LYEwKe+UPpJLNkvx1j3UhIASi9lUCypoOE+vROBJt1JFsHvnTq2SJ
 gpDxykGMX20mEFyNSa6ZPMwcYhv8ZqS44arJKjKeCHPm3Lzk+/zZ2b97I/1QJfatSq76
 MHXKfmL6WwJ+BeeR/UZUIBi7h/Y4QdhuKhFK2jdRKWxz4DL9M3sKtQEc3m0y8f4t9rAk
 WSpoB4o4ul7/cJOuK5b5gQG0xxKTyLKNTrCxNKg12S/HFRDNUBAzBSN2XLuiGcomjTmf
 lFTKX/jbpPumo3wMCTaqUCB7PX53rzIAsRYHNmPsTzSU2k6L/YyqkQ0pIxXW2CLTXz7t
 O14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=nWag6UrPcWinHgoAJevy+Oro++k7EWNcad6rYT4Tmgc=;
 b=wedFz6R9ln0S5y2dWYu72Xa+YBqD205n4z+AORHu89cqljghVNOEGNCPCCdZ6a/B0W
 IG1W7CqaBX1zHMoOKSgPSaKcaBmgpRTRaw0V9A2iNtoYSE6RzVEVmwdm3f+Hddi24t47
 gxSmMtHoXrBhBbnUvw71sZ29fR8J4GTR5+1s2IOG+mNKzLTQJt1rhRMs+nDl3vR+LRuh
 9DttfxKzGmLa1XKU606YjscjFEhMTIOWG97AhnGAJRzl7ItmRvnGm8cUEQPCXS0Y/9ul
 lnLYOA0famHGSTSCmgnCipHhoH7YFerFAise67Uk6azuPCpNqo6i19sIWKrHq1XVJJZA
 mYSw==
X-Gm-Message-State: ACgBeo2hPG/LY8xLNMdZKLd2T7CI1nE+woKnU34cJc622S1EsHUPeE4d
 DRIGogAHBUN0fuV4v6QU0h4Pvw==
X-Google-Smtp-Source: AA6agR551GIgJ/HMEKVyKgoHpuBdzhbtPeXVZ+BGlBP7BnDRRJcxaIJyMLYYClT0KUKZxaXFiQiOaw==
X-Received: by 2002:a05:600c:a4c:b0:39c:34d0:fd25 with SMTP id
 c12-20020a05600c0a4c00b0039c34d0fd25mr12339790wmq.172.1659952305617; 
 Mon, 08 Aug 2022 02:51:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:1832:7d81:d0f6:dc4b?
 ([2a01:e0a:982:cbb0:1832:7d81:d0f6:dc4b])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1ced02000000b003a3170a7af9sm12929566wmh.4.2022.08.08.02.51.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 02:51:45 -0700 (PDT)
Message-ID: <13bd6440-9a61-d444-518c-f4e8cba0b825@baylibre.com>
Date: Mon, 8 Aug 2022 11:51:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/bridge: sii902x: add support for
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Content-Language: en-US
From: Neil Armstrong <narmstrong@baylibre.com>
To: Dmitry Osipenko <digetx@gmail.com>, andrzej.hajda@intel.com,
 robert.foss@linaro.org, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
References: <20220113144305.1074389-1-narmstrong@baylibre.com>
 <25976b46-21b4-6e3f-0182-85dd4ca2b654@gmail.com>
 <a4a36360-3f77-17a0-9239-08cb8c08de74@baylibre.com>
Organization: Baylibre
In-Reply-To: <a4a36360-3f77-17a0-9239-08cb8c08de74@baylibre.com>
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

On 08/08/2022 11:15, Neil Armstrong wrote:
> Hi Dmitry,
> 
> On 31/07/2022 22:07, Dmitry Osipenko wrote:
>> 13.01.2022 17:43, Neil Armstrong пишет:
>>> This adds support for DRM_BRIDGE_ATTACH_NO_CONNECTOR by adding the
>>> bridge get_edid() and detect() callbacks after refactoring the connector
>>> get_modes() and connector_detect() callbacks.
>>>
>>> In order to keep the bridge working, extra code in get_modes() has been
>>> moved to more logical places.
>>>
>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>> ---
>>>   drivers/gpu/drm/bridge/sii902x.c | 129 ++++++++++++++++++++++++-------
> 
> 1 file changed, 99 insertions(+), 30 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
>>> index 89558e581530..65549fbfdc87 100644
>>> --- a/drivers/gpu/drm/bridge/sii902x.c
>>> +++ b/drivers/gpu/drm/bridge/sii902x.c

[...]

>>>       }
>>> +    endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 1, -1);
>>> +    if (endpoint) {
>>> +        struct device_node *remote = of_graph_get_remote_port_parent(endpoint);
>>> +
>>> +        of_node_put(endpoint);
>>> +        if (!remote) {
>>> +            dev_err(dev, "Endpoint in port@1 unconnected\n");
>>> +            return -ENODEV;
>>> +        }
>>> +
>>> +        if (!of_device_is_available(remote)) {
>>> +            dev_err(dev, "port@1 remote device is disabled\n");
>>> +            of_node_put(remote);
>>> +            return -ENODEV;
>>> +        }
>>> +
>>> +        sii902x->next_bridge = of_drm_find_bridge(remote);
>>> +        of_node_put(remote);
>>> +        if (!sii902x->next_bridge)
>>> +            return -EPROBE_DEFER;
>>
>> Hi,
>>
>> This patch broke ARM/QEMU vexpress display because of_drm_find_bridge()
>> always fail with -EPROBE_DEFER. Reverting this patch returns display
>> back. Please fix or revert, thanks in advance.
> 
> Can you share a QEMU cmdline to reproduce ?

Actually the vexpress DT has multiple input ports instead of a single input port at @0
and an output port at @1 like documented in the bindings:

vexpress-v2m.dtsi#L303-L307:
ports {
	#address-cells = <1>;
	#size-cells = <0>;

	/*
	 * Both the core tile and the motherboard routes their output
	 * pads to this transmitter. The motherboard system controller
	 * can select one of them as input using a mux register in
	 * "arm,vexpress-muxfpga". The Vexpress with the CA9 core tile is
	 * the only platform with this specific set-up.
	 */
	port@0 {
		reg = <0>;
		dvi_bridge_in_ct: endpoint {
			remote-endpoint = <&clcd_pads_ct>;
		};
	};
	port@1 {
		reg = <1>;
		dvi_bridge_in_mb: endpoint {
			remote-endpoint = <&clcd_pads_mb>;
		};
	};
};

bindings:
   ports:
     $ref: /schemas/graph.yaml#/properties/ports

     properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
         description: Parallel RGB input port

       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description: HDMI output port

       port@3:
         $ref: /schemas/graph.yaml#/properties/port
         description: Sound input port

The patch is conform to the bindings, the DT was working but is actually not valid.

Neil

> 
> Neil

