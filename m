Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0E555BC1A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 23:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C04E10EF25;
	Mon, 27 Jun 2022 21:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544DC10EF25
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 21:18:11 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id w17so14785145wrg.7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 14:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7fqf134knRgs1GXmfgOSjMnBIhN/vd4XYE5cKns7XrQ=;
 b=HXbtK2wb/8k7BKwx03O3vJd+frVE8kbRJOxAidgzWU3+M46idUPj4JY/ji2or61qN6
 iFQfdI2q9HbabuCUzIKyuCuZZP+svfWOurR7utrBBG8lxHgf64RUya9tYBYoq/IZnb3/
 vASCFCOveG3OPw4M9ElkzqOYoiWkSkXpjjzjUUkhiJcB7Uovli7STe8/BYj4orSkm5AF
 LTlyYI4wyNCu+hgP9xZwpFMXRxL0suMMMq/Wud/F2UCWdoxIQljh+9HLdF+xzDphLUPc
 JhfNdVvIWSYHIRmsF16qeXPK1XW0ExS6lCFXaFznUtqNyynV9EM41UOdeXzlroAzAzkv
 hWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7fqf134knRgs1GXmfgOSjMnBIhN/vd4XYE5cKns7XrQ=;
 b=LUVipR7hLuMAxHZty/R4Hf7KEXDOB7IQZEE+oGzkH48ShN5uqQe14HFfrNaVcQWtbH
 awSG76uwIAhAcj5z31Atj9+9fzp1SE67hhnJROtZ1+mzJvULZGYzJtSOYuBcDbkx7qcj
 5F8WotVzAlFZjBIIwJLKoT/VpksGl5X3pT3ORwM9sTvVbCYgCii9IdQX6I8ekcimIrWg
 /37J/zcubGHT3QtWaBIRCOb4Iy0EjCdoGJF/w1T8I6pwraOP5dIlASL1SKPdjPTHsiTQ
 nXrjY1Vz1sRft5dfH+y88K1zDzHZ6Pa8ThPhbOw+hcp+wUM2VwY11FLptRTxhWXKBcKf
 RBzA==
X-Gm-Message-State: AJIora9zIyNKN4suC1p3eGSDzTkqSWab7oQ7J+3RbiEYqWwSG82ZdAhW
 LO3KW0AFYQHhrofv5mEhM9WoYQ==
X-Google-Smtp-Source: AGRyM1v3rnjEGEokBmIwXs+uwnFrAQV1ikK8BVpbbLHWxG5jXedwQJfIfb9jsTWa7DY6Tagub7QPEA==
X-Received: by 2002:adf:d1ed:0:b0:21b:c74b:594 with SMTP id
 g13-20020adfd1ed000000b0021bc74b0594mr8958606wrd.221.1656364689777; 
 Mon, 27 Jun 2022 14:18:09 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.234.167])
 by smtp.gmail.com with ESMTPSA id
 az14-20020a05600c600e00b003a04c74efd1sm3048630wmb.21.2022.06.27.14.18.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 14:18:09 -0700 (PDT)
Message-ID: <ed893417-2c5e-c019-04c6-c7c7ee138ef1@conchuod.ie>
Date: Mon, 27 Jun 2022 22:18:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 06/16] dt-bindings: timer: add Canaan k210 to Synopsys
 DesignWare timer
Content-Language: en-US
To: Serge Semin <fancer.lancer@gmail.com>
References: <20220627194003.2395484-1-mail@conchuod.ie>
 <20220627194003.2395484-7-mail@conchuod.ie>
 <20220627211314.dc2hempelyl5ayjg@mobilestation>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220627211314.dc2hempelyl5ayjg@mobilestation>
Content-Type: text/plain; charset=UTF-8
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, alsa-devel@alsa-project.org,
 David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Heng Sia <jee.heng.sia@intel.com>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 dmaengine@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/06/2022 22:13, Serge Semin wrote:
> On Mon, Jun 27, 2022 at 08:39:54PM +0100, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> The Canaan k210 apparently has a Sysnopsys Designware timer but
>> according to the documentation & devicetree it has 2 interrupts rather
>> than the standard one. Add a custom compatible that supports the 2
>> interrupt configuration and falls back to the standard binding (which
>> is currently the one in use in the devicetree entry).
>>
> 
>> Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 58
> 
> Firstly, it's page 51 in the framework of the document pages
> enumeration.

Ah yes, sorry about that.

> 
> Judging by the comment in the document above and what the HW reference
> manual says regarding the IRQ signals, what you really have on K210 is
> the DW APB Timer IP-cores each configured with two embedded timers.
> It's done by the IP-core synthesize parameter NUM_TIMERS={1..8}, which
> in your case equals to 2. A similar situation is on our SoC and, for
> instance, here:
> 
> arch/arm/boot/dts/berlin2q.dtsi
> arch/arm/boot/dts/berlin2.dtsi
> arch/arm/boot/dts/berlin2cd.dtsi
> (Though the Berlin2 APB Timer have been configured with 8 timers.)
> 
> So the correct modification would be:
> 1. Split up the nodes into two ones with one IRQ per each node.
> 2. Make sure I was right by testing the new dts out.
> 3. Update the DT-node only and leave the DT-bindings as is.

Hmm, sounds good. Will give that a whirl tomorrow.
Thanks for the info/suggestions Sergey.

