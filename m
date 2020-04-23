Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F01651B5E7D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 17:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F95B6E885;
	Thu, 23 Apr 2020 15:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7016E885
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 15:00:53 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u16so6893542wmc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 08:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x7NZn7nlpSOqnkIXT5l3jRVWmAs32CPHZtB2TMxSM3g=;
 b=ansPsNh2nSLy7gZmpFMCDAWeF79eT5FadJke44IlCFoAGYSy7QyCyXSfQ41d8/jCMM
 rxEU0s78dHA+EWfp7Bpn4UhJeQsVa6JijFp+/eILBca3pRE7AcRXcu6ufX3yjGYhKoL/
 PABBChMmhsG6JDYyqslPrf8TdMVeEl2v/oy29vFkNJTKbfzIsq/s0uHm/lQbbtODl2H5
 ZnY730s9WMWD08jD1GATvoP1VHO6E1UvdTLPj4xcPS+iAmwPdSUjc9dAtnayothl44gV
 goatioRxz2VnpJ58YipqdCtnWI1+Li+R+UTG2oFiF5OEJD5HpafREm2kJN50UqxDIT8J
 +FJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=x7NZn7nlpSOqnkIXT5l3jRVWmAs32CPHZtB2TMxSM3g=;
 b=I9koGGDagzPnZIo8WrFTRalR1vfZRmGc2NW3o7vjEIbdznhhoXypgVxKfdwvfIRLbt
 SFg4WVRA2zJeOOS+3T2P0tMBts0veA8iixmDTLKgYtSpNRfkoDUjvXv7V8OW78OqJRpM
 iUnXOXaAvHPrI+qRU5k06Gjcl9Uuo6tpK8O+7mCUT5MVpd8n+Unb7gMt/7578NW2sd19
 QAEtErDnfnxAyyP5YohhSGlvV7lYmMpWDKRZssCMqLVD+Bn0L07sdvZVdkNTJ/v3xRMf
 yA42csVA+iY8/ICRORmPqe6lGSZUsyW/yLE+RxKhxwqIcCg6SwlEilB2drez1lq3U1or
 mJyA==
X-Gm-Message-State: AGi0PubJKgPjpXTy2kuRb2jnJ0K7zvT1JC9ws6SeKR5TPYybxJEBdkY4
 +Y1u63MROUTH3ZSMIzGh8lrVYA==
X-Google-Smtp-Source: APiQypIYBC1vkZGlUmKk4RSHgb1OGl008wycUJ2gnA+uYh+hSUCwcQn24FHKdNWDf/TB/+juWIrx8w==
X-Received: by 2002:a1c:3c87:: with SMTP id j129mr4437294wma.157.1587654052295; 
 Thu, 23 Apr 2020 08:00:52 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56?
 ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id s17sm3717429wmc.48.2020.04.23.08.00.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2020 08:00:51 -0700 (PDT)
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the
 PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
 Maxime Ripard <maxime@cerno.tech>
References: <20200415130233.rgn7xrtwqicptke2@gilmour.lan>
 <C589D06E-435E-4316-AD0A-8498325039E3@goldelico.com>
 <10969e64-fe1f-d692-4984-4ba916bd2161@gmail.com>
 <20200420073842.nx4xb3zqvu23arkc@gilmour.lan>
 <b5a06c19-7a3e-bcb8-5ae3-76901b9c6c35@gmail.com>
 <20200421112129.zjmkmzo3aftksgka@gilmour.lan>
 <20200421141543.GU37466@atomide.com>
 <D9D4D057-A73D-485F-898D-5C05E89C16B7@goldelico.com>
 <20200422065859.quy6ane5v7vsy5tf@gilmour.lan>
 <1AA57A0C-48E6-49BB-BB9A-2AAFFB371BCD@goldelico.com>
 <20200422151328.2oyqz7gqkbunmd6o@gilmour.lan>
 <07923B6C-4CCD-4B81-A98F-E19C43412A89@goldelico.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <43688597-4b99-8f4d-9ad5-548ddff07f52@baylibre.com>
Date: Thu, 23 Apr 2020 17:00:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <07923B6C-4CCD-4B81-A98F-E19C43412A89@goldelico.com>
Content-Language: en-US
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
Cc: Mark Rutland <mark.rutland@arm.com>, Tony Lindgren <tony@atomide.com>,
 James Hogan <jhogan@kernel.org>, Jonathan Bakker <xc-racer2@live.ca>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, linux-samsung-soc@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap <linux-omap@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>,
 OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
 linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 kernel@pyra-handheld.com,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/04/2020 18:09, H. Nikolaus Schaller wrote:
> Hi Maxime,
> 
>> Am 22.04.2020 um 17:13 schrieb Maxime Ripard <maxime@cerno.tech>:
>>
>> On Wed, Apr 22, 2020 at 09:10:57AM +0200, H. Nikolaus Schaller wrote:
>>>> Am 22.04.2020 um 08:58 schrieb Maxime Ripard <maxime@cerno.tech>:
>>>>>
>>>>> It also allows to handle different number of clocks (A31 seems to
>>>>> need 4, Samsung, A83 and JZ4780 one) without changing the sgx bindings
>>>>> or making big lists of conditionals. This variance would be handled
>>>>> outside the sgx core bindings and driver.
>>>>
>>>> I disagree. Every other GPU binding and driver is handling that just fine, and
>>>> the SGX is not special in any case here.
>>>
>>> Can you please better explain this? With example or a description
>>> or a proposal?
>>
>> I can't, I don't have any knowledge about this GPU.
> 
> Hm. Now I am fully puzzled.
> You have no knowledge about this GPU but disagree with our proposal?
> Is it just gut feeling?
> 
> Anyways, we need to find a solution. Together.
> 
>>
>>> I simply do not have your experience with "every other GPU" as you have.
>>> And I admit that I can't read from your statement what we should do
>>> to bring this topic forward.
>>>
>>> So please make a proposal how it should be in your view.
>>
>> If you need some inspiration, I guess you could look at the mali and vivante
>> bindings once you have an idea of what the GPU needs across the SoCs it's
>> integrated in.
> 
> Well, I do not need inspiration, we need to come to an agreement about
> img,pvrsgx.yaml and we need some maintainer to finally pick it up.
> 
> I wonder how we can come to this stage.
> 
> If I look at vivante,gc.yaml or arm,mali-utgard.yaml I don't
> see big differences to what we propose and those I see seem to come
> from technical differences between sgx, vivante, mali etc. So there
> is no single scheme that fits all different gpu types.
> 
> One thing we can learn is that "core" seems to be a de facto standard 
> for the core clock-name. An alternative "gpu" is used by nvidia,gk20a.txt.

Usually IPs needs a few clocks:
- pclk or apb or reg: the clock clocking the "slave" bus to serve the registers
- axi or bus or ahb: the bus clocking the the "master" bus to get data from system memory
- core: the actual clock feeding the GPU logic

Sometimes you have a single clock for slave and master bus.

But you can also have separate clocks for shader cores, .. this depends on the IP and it's architecture.
The IP can also have memories with separate clocks, etc...

But all these clocks can be source by an unique clock on a SoC, but different on another
SoC, this is why it's important to list them all, even optional.

You'll certainly have at least a reset signal, and a power domain, these should exist and be optional.

Neil

> 
> BR and thanks,
> Nikolaus
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
