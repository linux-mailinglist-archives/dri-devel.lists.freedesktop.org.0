Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F96D1B01DD
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 08:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25A06E190;
	Mon, 20 Apr 2020 06:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0456E148
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 23:03:03 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a81so7034448wmf.5
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 16:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YxE3j3NIn1PoG9VELum1qGBU2eSWHDyuQMMYU6AQHhI=;
 b=sPjMwQZPf8EtRgmX9wyO26jKftktwCwkj1YHzEvKKwUgseGwdo27mZQtlOljPQ0Uky
 d3b7oLY6RlVZjGMEbr5iyqbcIoQaCuiGoJ/1Wkaf2uaDXeXE4kXWe84GM4hHFn8oX+bq
 ZQbNmJBZLb7Pt1mK8jWi/T9kXH0/JHnrODY4eNYRbpdGOBQhL3yhJysqP43RST4n9bw7
 c+tHv5v3Ikhq2oK5iLt1pxgHTy+O2pZg9fAC/v0Eu+L0K74rWpv7/DHBmRvjwqDDDblo
 6zjRvHmpttTIIm2aMTM+WuQKsyK2H8O1kzGzRvMrHVimUFbJecuTMVUFngmsonN1sKBM
 PqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YxE3j3NIn1PoG9VELum1qGBU2eSWHDyuQMMYU6AQHhI=;
 b=FXB3aTImS8yTw+0uAopzXnVl7Sn9qcGpYSoHleDEeoRVoJisdpzXPskbfaGNK8+tqh
 ZMBTJ5R0t8G78xLItaj9G4sm4fzIW0IbUi+/Ps1jz2jCRURkULyZw1wRBkVGC+bzP40p
 CnQlfzo4DXHL9LxsgaoPIYG6U8LraNXBr3vBIowqTd2xEJj4CD6aD605sAWQKS+E/OUa
 izxqxoW7TsXxtLXgpXCYwdABd656mP+l1FHX2QfVmUNerVwmeEkqpnqfxGZszfR+XDyE
 kZGflKLpMqKp8acDBAXr8S87nyyLxxFPAdOUXcjrawAy47k1X9STTAIzxlMsTHz5kvJQ
 HDKA==
X-Gm-Message-State: AGi0PuYn4DUYLZwCKWPe8Ub97uPt4WqZ3HXHIKQT5oVkgUEqLVAA7iM2
 +BTHyTd0IKLCRMhCCefEvYg=
X-Google-Smtp-Source: APiQypIO6mkIJ9hjSrjzSJzBpVZvH5H7mcYgD03oI7sRFKNXXQ0RN49LPX1QPLO3qyvMOa0viArMAw==
X-Received: by 2002:a1c:66d5:: with SMTP id a204mr10170935wmc.69.1587250982011; 
 Sat, 18 Apr 2020 16:03:02 -0700 (PDT)
Received: from ?IPv6:2a02:810d:340:2e50:e521:8087:8b5d:7bae?
 ([2a02:810d:340:2e50:e521:8087:8b5d:7bae])
 by smtp.gmail.com with ESMTPSA id p10sm36735344wrm.6.2020.04.18.16.03.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Apr 2020 16:03:01 -0700 (PDT)
Subject: Re: [PATCH v6 01/12] dt-bindings: add img, pvrsgx.yaml for
 Imagination GPUs
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
 Maxime Ripard <maxime@cerno.tech>
References: <cover.1586939718.git.hns@goldelico.com>
 <06fb6569259bb9183d0a0d0fe70ec4f3033b8aab.1586939718.git.hns@goldelico.com>
 <20200415101251.o3wi5t6xvf56xmhq@gilmour.lan>
 <72919514-0657-4B71-902F-3E775E528F64@goldelico.com>
 <f4fdca8a-d18c-a8d2-7f51-d1ebbbab3647@baylibre.com>
 <535CAEBE-F43E-4BFC-B989-612C81F0D7EF@goldelico.com>
 <20200415142124.yzfh6mtqq7cdq22e@gilmour.lan>
 <DC0A2DE2-3D77-46F8-8DE1-55050FDACC9B@goldelico.com>
 <20200415162151.rwym4ioqz27migfn@gilmour.lan>
 <45F411C0-150B-4FBA-A0E1-B863B3F36DF6@goldelico.com>
 <20200417102500.erayf6quenp3cvn3@gilmour.lan>
 <C8816F10-8773-4ECD-B42D-6EEF642476EB@goldelico.com>
From: Philipp Rossak <embed3d@gmail.com>
Message-ID: <9f33a2ae-2825-bc2d-6e3b-c09a5d226e81@gmail.com>
Date: Sun, 19 Apr 2020 01:02:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <C8816F10-8773-4ECD-B42D-6EEF642476EB@goldelico.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 20 Apr 2020 06:55:01 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 James Hogan <jhogan@kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 linux-samsung-soc@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, openpvrsgx-devgroup@letux.org,
 linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 kernel@pyra-handheld.com,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,
Hi Maxime,

>>> TI SoC seem to be the broadest number of available users
>>> of sgx5xx in the past and nowadays. Others are more the exception.
>>
>> And maybe TI has some complicated stuff around the GPU that others don't have?
> 
> Looks so.

I can only agree on this.

> 
>>
>>> What I also assume is that developers of DTS know what they do.
>>> So the risk that there is different semantics is IMHO very low.
>>
>> Well, they know what they do if you document the binding. Let's say I have two
>> clocks now on my SoC, and you just document that you want a clocks property,
>> with a generic name in clock-names like "gpu".
> 
> Yes, that is what I want to propose for v7:
> 
>    clocks:
>      maxItems: 1
> 
>    clock-names:
>      maxItems: 1
>      items:
>        - const: gpu
> 
>>
>>> If you agree I can add the clocks/clock-names property as an
>>> optional property. This should solve omap and all others.
>>
>> With the above example, what clock should I put in there? In which order? This
>> isn't some random example pulled out of nowhere. The Allwinner A31 has (at
>> least) 4 clocks for the GPU, 1 reset line and 1 regulator, so I can only assume
>> that the GPU actually needs at least that amount to be properly integrated into
>> an SoC.
> 
> Ah, now I understand your motivation: you have access and experience with
> the A31 and you know that our proposal doesn't fit to it.
> 
>  From what I know from your description is that the A31 is quite special with
> 4 GPU clocks... Are they all really for the GPU or 3 of them for the interface
> logic (like on OMAP which separates between "functional clocks" and "interface
> clocks")? Or are there 4 groups of GPU cores with a separate clock for each one?
> 
> So what would be your proposal for the A31 DT?
> 
> Then I get a chance to compare DT snippets and try to make a mixture for
> the bindings.
> 

This is my current binding for the A83T, the A31 looks similar but there 
is still something missing, since some parts are not mainlined yet:

sun8i-a83t.dtsi:
gpu: gpu@1c400000 {
	compatible = "allwinner,sun8i-a83t-sgx544-115",
		     "img,sgx544-115", "img,sgx544";
	reg = <0x01c40000 0x10000>;
	interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
	clocks = <&ccu CLK_BUS_GPU>, <&ccu CLK_GPU_CORE>,
		 <&ccu CLK_GPU_MEMORY>, <&ccu CLK_GPU_HYD>;
	clock-names = "bus", "core", "memory", "hyd";

	resets = <&ccu RST_BUS_GPU>;
};

sun8i-a83t-bananapi-m3.dts:
&gpu {
	gpu-supply = <&reg_dcdc4>;
};


> 
>> But given that the current state on the Allwinner SoCs (at least) is that you
>> can't even read a register, it might be a good idea to delay the introduction of
>> that binding until you have something that works to avoid drowning under the
>> number of special cases to deal with backward compatibility.
> 

Maxime is right. Even if you enable the regulator, write 0x0 to the GPU 
Power Off Gating Register, deassert the reset and enable the clocks you 
are not able to read the register.
You must first run: pvrsrvctl --no-module --start (user space binaries) 
to access registers otherwise the system will stuck with the following 
message when accessing them:

./devmem2 0x01C40024
/dev/mem opened.

> Philipp has something minimal working on the A83 which works with the proposed
> binding and enabled him to read out the sgx revision register.
> 
This is not correct. In the other mail I talked about my reference 
system. This is an old 3.4.39 kernel, modified by allwinner to run on 
their SOC's which don't use the common kernel techniques. So it's very 
hacky, but they got the gpu running. I'm using this system for 
comparison, to read out registers and for reverse engineering.

My current kernel module behaves similar like the reference design, but 
right now I'm not able to run "pvrsrvctl --no-module --start" without 
errors. So the initialization never get's finalized and I see the issue 
described above.

> So if you are a specialist for the A31 SGX, please make a proposal for a binding
> that covers all the A31 needs and all other SoC we know. Or define a separate
> bindings for the A31.

The A31 and the A31s have some additional clocks mentioned in their 
datasheet (@ System Control Register/SRAM Controler). Those are not 
available in the A83T datasheet, but might be there since the memory map 
looks similar and allwinner might use the same userspace binaries for 
their devices.

 From the knowledge I gained the last 3 days, we should delay the 
patches for the A83T, A31 and A31s.
The idea of the placeholder patches was to show that from this binding 
also other devices could benefit.

Cheers,
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
