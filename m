Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AF55A4E46
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC04A10F2C4;
	Mon, 29 Aug 2022 13:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495DF10F274
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:36:27 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 i188-20020a1c3bc5000000b003a7b6ae4eb2so3220067wma.4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 06:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date;
 bh=5wpayB1lnaPj7/n3wK8pMtSfgarMRuAsk+PETC9WPK0=;
 b=1oA2RIqXljlku7LpRGyd44Edx5qjba3TQf0Pzps65/nABAPw10GcN3vR8271f/yoVp
 ZTEqKrfiC2kcHZNG3vPAvfIisARcwZZ9lsk2z6ra6uO1hFokLdkaet6Ftmublf2t7wiI
 wviY2ik7gSpLKt53nL5/Y38Sqmy998v4yEJSIRXw+c2bP9Dd1XvL/d4BbqMQvjVlQ6Do
 7UYgXxpl1wKmfcNLtV08ScYKc1NcfnrFjy1p75LyeWixlf/SnMcM6d6faWaWQCJY7N1S
 APJCdNhmVdS90jz5hoNIOJrEDISBeJLxxaqG4+EnKRCX4DbO9ZSOEbEKgepgH2jBxY1g
 7WTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=5wpayB1lnaPj7/n3wK8pMtSfgarMRuAsk+PETC9WPK0=;
 b=bFXS8BwEre+A/fRRJmgYSoypdzKj3Gp8UilKTLoL0ycmFAEX1K0A67oe+3H/42fQ+2
 iUGgmgrOHjjySSqBA/0gaF9BluNqwrjP8m4CgQkaIv1qfE92zMuEwEw/470bpAbW7L2Y
 YudoMuAFMZ1sgb4iHfpCFZgqZhP2uA84maW221h5XfQdCFClmdgwcIMhn1Ou8ij3sAII
 l2SlB8dYk3aYFPaaxd7s9TRChLrWIPPZ6/HZ4oIxepJiaeRiNsCHXY1708DD2umJli0R
 MeqBVIV+mSehFmudhf2Qnj/EIoPCa+dryxfj6pi6kXVVb8J812KayAndY+QL7/iyCGKf
 Ntfw==
X-Gm-Message-State: ACgBeo2GgsxZso4ZyHwVsMvQBD/015qgMJTCjADNnVUByr6ZXC+nhdO4
 fsBTYnVBYWGT141dPkxytyA86Q==
X-Google-Smtp-Source: AA6agR75xkNCk8kso87faHXLBNb37bhe3tyW1t3yYkEPi9tT8/pXGbngK1coP7uxxneCA8pCId/oSQ==
X-Received: by 2002:a05:600c:a02:b0:39d:bdf8:a4f4 with SMTP id
 z2-20020a05600c0a0200b0039dbdf8a4f4mr6847055wmp.201.1661780185608; 
 Mon, 29 Aug 2022 06:36:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6124:6b74:2847:d37b?
 ([2a01:e0a:982:cbb0:6124:6b74:2847:d37b])
 by smtp.gmail.com with ESMTPSA id
 q125-20020a1c4383000000b003a5f783abb8sm8990765wma.30.2022.08.29.06.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 06:36:25 -0700 (PDT)
Message-ID: <d115ad6e-1c23-e7d9-dc9f-a12903782850@baylibre.com>
Date: Mon, 29 Aug 2022 15:36:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/bridge: sii902x: add support for
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
References: <20220113144305.1074389-1-narmstrong@baylibre.com>
 <25976b46-21b4-6e3f-0182-85dd4ca2b654@gmail.com>
 <a4a36360-3f77-17a0-9239-08cb8c08de74@baylibre.com>
 <13bd6440-9a61-d444-518c-f4e8cba0b825@baylibre.com>
 <5a1df5ce-a497-760b-8e2c-130a0e659c0b@gmail.com>
 <3725619d-72c5-5c9d-513b-80bbc727dd07@baylibre.com>
 <CACRpkdbucRqf80UB+AikYQGsHPiDJffP9dqkqx+RX8Nkdg3eaw@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <CACRpkdbucRqf80UB+AikYQGsHPiDJffP9dqkqx+RX8Nkdg3eaw@mail.gmail.com>
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
Cc: jonas@kwiboo.se, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 Rob Herring <robh+dt@kernel.org>, robert.foss@linaro.org,
 andrzej.hajda@intel.com, Sudeep Holla <Sudeep.Holla@arm.com>,
 Dmitry Osipenko <digetx@gmail.com>, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/08/2022 14:48, Linus Walleij wrote:
> On Wed, Aug 17, 2022 at 3:31 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>> On 15/08/2022 02:15, Dmitry Osipenko wrote:
>>> 08.08.2022 12:51, Neil Armstrong пишет:
>>>> On 08/08/2022 11:15, Neil Armstrong wrote:
> 
>>>>>> This patch broke ARM/QEMU vexpress display because of_drm_find_bridge()
>>>>>> always fail with -EPROBE_DEFER. Reverting this patch returns display
>>>>>> back. Please fix or revert, thanks in advance.
>>>>>
>>>>> Can you share a QEMU cmdline to reproduce ?
>>>>
>>>> Actually the vexpress DT has multiple input ports instead of a single
>>>> input port at @0
>>>> and an output port at @1 like documented in the bindings:
>>>>
>>>> vexpress-v2m.dtsi#L303-L307:
>>>> ports {
>>>>       #address-cells = <1>;
>>>>       #size-cells = <0>;
>>>>
>>>>       /*
>>>>        * Both the core tile and the motherboard routes their output
>>>>        * pads to this transmitter. The motherboard system controller
>>>>        * can select one of them as input using a mux register in
>>>>        * "arm,vexpress-muxfpga". The Vexpress with the CA9 core tile is
>>>>        * the only platform with this specific set-up.
>>>>        */
>>>>       port@0 {
>>>>           reg = <0>;
>>>>           dvi_bridge_in_ct: endpoint {
>>>>               remote-endpoint = <&clcd_pads_ct>;
>>>>           };
>>>>       };
>>>>       port@1 {
>>>>           reg = <1>;
>>>>           dvi_bridge_in_mb: endpoint {
>>>>               remote-endpoint = <&clcd_pads_mb>;
>>>>           };
>>>>       };
>>>> };
>>>>
>>>> bindings:
>>>>     ports:
>>>>       $ref: /schemas/graph.yaml#/properties/ports
>>>>
>>>>       properties:
>>>>         port@0:
>>>>           $ref: /schemas/graph.yaml#/properties/port
>>>>           description: Parallel RGB input port
>>>>
>>>>         port@1:
>>>>           $ref: /schemas/graph.yaml#/properties/port
>>>>           description: HDMI output port
>>>>
>>>>         port@3:
>>>>           $ref: /schemas/graph.yaml#/properties/port
>>>>           description: Sound input port
>>>>
>>>> The patch is conform to the bindings, the DT was working but is actually
>>>> not valid.
>>>
>>> I haven't looked closely at how to fix this properly, but if we can fix
>>> it using of_machine_is_compatible("arm,vexpress") workaround in the
>>> driver, then it will be good enough at least as a temporal fix, IMO.
>>
>> If other maintainers are ok with that, it can be temporary fix until the DT gets fixed.
> 
> That's fine with me, will you send a patch?

Who, me ?

> 
> I don't know how you expect the DT to get "fixed" though.
> 
> The hardware looks like this, it's maybe not the most elegant
> electronics design but it exists, so... I wrote this DT with two
> inputs, see commit f1fe12c8bf332, the code handling this
> awkward mux is part of the DRM driver, see
> drivers/gpu/drm/pl111/pl111_versatile.c function
> pl111_vexpress_clcd_init() for an idea of how it works.

The proper fix would be the other way around, adding a mux bridge before the sii902x
returning the next bridge or nothing to the right controller.

> 
> Yours,
> Linus Walleij

Neil
