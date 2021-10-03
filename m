Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 725464203DD
	for <lists+dri-devel@lfdr.de>; Sun,  3 Oct 2021 22:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3B46E881;
	Sun,  3 Oct 2021 20:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E006E880
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Oct 2021 20:09:52 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 b136-20020a1c808e000000b0030d60716239so3569745wmd.4
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Oct 2021 13:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jEAW2JDycPrYbnmrUhgv36yBgTx5v6E09lPMQlvzCRM=;
 b=hWH4k5HOvygjKKNcDdamAbSwFECinkYE/CxaQE1LmVRZddWH4zv9gQ6oDqWrAZxka4
 QLHPGOQ6r3ZS2t7BlQqcdtuEPWeiRoyPIaiseCq261bjKl3vwqAb99t4SPpnE9NlEs5R
 Zpa2fxfbiH6ld0uM/YRi5efsqN5TYxLAdEhLM7G88+VrtP4ZVr/oX7jCVccfX/rst/0h
 kj9kDfPH+FI5RVxFYItyFnP5aCLA6NpcUAvudiem/So6PACb05MdrjH8HN5zuybz+J4Q
 q3yty092tskhviHiDiXj7bt5IJOvc9tr5naDl2hSBqgdWDWD9QfRswMbbdTN3y7uBJwW
 oyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jEAW2JDycPrYbnmrUhgv36yBgTx5v6E09lPMQlvzCRM=;
 b=s5S72GJd5EAvgnVTpObO5/EdioiEzomnDdnDRSwCDAXvGrMauRbeoI4cHbA4XsPdir
 45PpRkC3skBi23Ope/ZX0fE/3IKEs6UkefsnYyrJDlqYldRyZQVLJRbJ0MWsP5XB8wsx
 zt3XlDiwtrqTJygSrcbcqzkEQ1EboTHAHFLg1Dxq4bHGC/OGDWc43d2nMNdnmehWvRUt
 tUi8SGZXvl6EJbLZNmYoXZVkKUNkKD2ncvGeH0XQR1chMIrWqJnzGcpugS7J8WRGIkwA
 4qDM0TqCcAuhi2CWvOWMkjxrPMVF0opjkkwIFoXjCK1ktQ6SKNZtG+b2Fgzfc63cPEoP
 sTrg==
X-Gm-Message-State: AOAM53381wR9GzCGC+48UuFhXPcX9uCt16lzuvgZZxmsDlsYZwHjyebd
 uLB7QZg/S7zEno95sxuoA9E=
X-Google-Smtp-Source: ABdhPJzYwjzAKP1V/lVGtyNTF8UAtIkwPGTrL1vjoZFASQjjSNshv8vl95gUctiJ47zXQ/uhzU5xSA==
X-Received: by 2002:a1c:a9d3:: with SMTP id s202mr6327534wme.128.1633291790673; 
 Sun, 03 Oct 2021 13:09:50 -0700 (PDT)
Received: from [192.168.0.14]
 (095160158079.dynamic-2-waw-k-4-2-0.vectranet.pl. [95.160.158.79])
 by smtp.gmail.com with ESMTPSA id i6sm1706254wrv.61.2021.10.03.13.09.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 13:09:50 -0700 (PDT)
Subject: Re: Questions over DSI within DRM.
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <CAPY8ntBUKRkSam59Y+72dW_6XOeKVswPWffzPj3uvgE6pV4ZGQ@mail.gmail.com>
 <YN9BxNP5IfhbJGGk@pendragon.ideasonboard.com>
 <CAPY8ntDRKcq0V_q04q25_EemsBiT4xHKNv1260Fr8kKGtZDpxw@mail.gmail.com>
 <20210706151320.kwn4dwu6buvy4isa@gilmour>
 <CAPY8ntDPQg76JTgZ5iJG=m3sWjKMwi-vXUHyAPqS_HGFbGGkkA@mail.gmail.com>
 <20210715095022.5plcocz6plxnb3xr@gilmour>
 <YVm7U0q6F8T9K32h@pendragon.ideasonboard.com>
From: Andrzej Hajda <andrzej.hajda@gmail.com>
Message-ID: <c7b84073-3213-63e7-c1eb-826366c01221@gmail.com>
Date: Sun, 3 Oct 2021 22:09:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVm7U0q6F8T9K32h@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Thanks Laurent for reviving the thread, I have missed it entirely.


On 03.10.2021 16:16, Laurent Pinchart wrote:
> Hello,
> 
> Reviving a bit of an old thread.
> 
> On Thu, Jul 15, 2021 at 11:50:22AM +0200, Maxime Ripard wrote:
>> On Tue, Jul 06, 2021 at 05:44:58PM +0100, Dave Stevenson wrote:
>>> On Tue, 6 Jul 2021 at 16:13, Maxime Ripard wrote:
>>>>>>> On a similar theme, some devices want the clock lane in HS mode early
>>>>>>> so they can use it in place of an external oscillator, but the data
>>>>>>> lanes still in LP-11. There appears to be no way for the
>>>>>>> display/bridge to signal this requirement or it be achieved.
>>>>>>
>>>>>> You're right. A loooong time ago, the omapdrm driver had an internal
>>>>>> infrastructure that didn't use drm_bridge or drm_panel and instead
>>>>>> required omapdrm-specific drivers for those components. It used to model
>>>>>> the display pipeline in a different way than drm_bridge, with the sync
>>>>>> explicitly setting the source state. A DSI sink could thus control its
>>>>>> enable sequence, interleaving programming of the sink with control of
>>>>>> the source.
>>>>>>
>>>>>> Migrating omapdrm to the drm_bridge model took a really large effort,
>>>>>> which makes me believe that transitioning the whole subsystem to
>>>>>> sink-controlled sources would be close to impossible. We could add
>>>>>> DSI-specific operations, or add another enable bridge operation
>>>>>> (post_pre_enable ? :-D). Neither would scale, but it may be enough.
>>>>>
>>>>> I haven't thought it through for all generic cases, but I suspect it's
>>>>> more a pre_pre_enable that is needed to initialise the PHY etc,
>>>>> probably from source to sink.
> 
> I believe it could be implemented as a pre-pre-enable indeed. It feels
> like a bit of a hack, as the next time we need more fine-grained control
> over the startup sequence, we'll have to add a pre-pre-pre-enable. Given
> that the startup sequence requirements come from the sink device, it
> would make sense to let it explicitly control the initialization,
> instead of driving it from the source. I don't think we'll be able to
> rework the bridge API in that direction though, so I'm fine with a hack.

As I remember I have suggested in similar discussion [1] adding to 
mipi_dsi_host_ops requested operations:
power_on - power on DSI bus (do we really need it?)
init - enter LP11 (or HS-stop state if I remember correctly)
and then call them from the right place in DSI device, probably 
pre_enable callback.

This way we could avoid polluting drm_bridge_ops, with DSI specific stuff.

[1]: 
https://lore.kernel.org/dri-devel/6700c90f-d0e0-5cbf-1616-0c1d158441b1@samsung.com/#t


Sorry for addressing only this issue, but I need to read whole thread, 
to re-read whole thread, and today it is too late for me :)

Regards
Andrzej


