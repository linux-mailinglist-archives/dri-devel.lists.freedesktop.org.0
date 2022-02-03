Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A7F4A870C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 15:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0580110ECD3;
	Thu,  3 Feb 2022 14:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D6F10EC3C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 14:56:01 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0B83940303
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 14:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643900160;
 bh=JKwlxtatWZQCVG4GF4BszucWwjVQTt2PxoebrxL5ciY=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=i6yA7t9Cv2ukmUXvHhtNRdUE9hNLWOnYQ2g7APjSZAMHCMKpeANi/B1ZtgoguxDA5
 Nm8VGjt1PXrQCyAjvavzejgvqNwBlvEgSHGjKPyLksrXFul6IDWxivqgsLUUGcCUjS
 fYm9h6Pyw0RXim93IOsKpnABcf1QYGK+V8qRcDxd11bioFzHas2El667YHdN3q+EGT
 2qj40Z0/CY+7lpUpF8OMylyrNyz35bRpUel+rnHAY/Czwj0Tnr1Wlb+rKxCPcM4sIj
 7RfT/OhKWfuiBotVjERE1wg8fEM53q7Hpi+txS+3Vpb2pmHIpb1VidkUD8X5eEaxz4
 C9+xoRt97/5cg==
Received: by mail-ed1-f72.google.com with SMTP id
 w23-20020a50d797000000b00406d33c039dso1573017edi.11
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 06:56:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JKwlxtatWZQCVG4GF4BszucWwjVQTt2PxoebrxL5ciY=;
 b=Nf80E8nk6pJ6KxL0CcdASum03Xjp5/aN3QJP62V8VTQMLG3mdNUpz9R7c9pgSCTrS6
 fJ4V1C2+JE2owgbCFxOIsRN78DpcYfI/0Vv+GDXlE6onO7XdGJ7EUToXIz/LwjRRGbOd
 hR1DmmiWQ62aiLGAHxFxcY3j6x9mEzhQu/lodpSzmu95WnDbR8gtK6VOhdToHjOIYPzW
 TNstpqcoaL2cnEEhUJOhheUySzVeplKqrNdC2N3W5dCEGkurG6zIBf5XAf8bMcQzH/gL
 SjIyOsaQjxpT5dHa9trhe6c+ikIb6n2a37SVXCtwlqP6fa2uZ8J7D1CsDK90xJOOZa2y
 006Q==
X-Gm-Message-State: AOAM5311n/pXACyTSXXfsZ3HrfRleQmpyEGbX6E0PhIIQVCmD1UBhaOq
 CwcFfFSMyQQBqy2mYJ2pZm7O1zoCG33wplEeTz/pRrHY6rkPXVgODbv6JNjjv+YqlPb+c5bO8zO
 MfuvAhkM/fOIi61ep39c5AMVKDTFzTHO8iSUH48Z6FgxajQ==
X-Received: by 2002:a17:907:c14:: with SMTP id
 ga20mr1992479ejc.243.1643900159510; 
 Thu, 03 Feb 2022 06:55:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxET41+skPJ0t2ws3cpvdAuE3SIGtoLLzPApxhNtKVWxdECIqy/nqXcAWE2tMCANk5h/+crhA==
X-Received: by 2002:a17:907:c14:: with SMTP id
 ga20mr1992450ejc.243.1643900159293; 
 Thu, 03 Feb 2022 06:55:59 -0800 (PST)
Received: from [192.168.0.81] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id z19sm7573934eja.18.2022.02.03.06.55.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 06:55:58 -0800 (PST)
Message-ID: <e79133f2-f872-3ed6-4038-526e94e84909@canonical.com>
Date: Thu, 3 Feb 2022 15:55:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] HPE BMC GXP SUPPORT
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>, nick.hawkins@hpe.com
References: <nick.hawkins@hpe.com>
 <20220202165315.18282-1-nick.hawkins@hpe.com>
 <CAL_Jsq+K2t5WYE056so1iZgZr7CBKvDEjAwnJVTyUFQcK-VFSA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAL_Jsq+K2t5WYE056so1iZgZr7CBKvDEjAwnJVTyUFQcK-VFSA@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Wang Kefeng <wangkefeng.wang@huawei.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 verdun@hpe.com, Amit Kucheria <amitk@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, netdev <netdev@vger.kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Ard Biesheuvel <ardb@kernel.org>,
 Stanislav Jakubek <stano.jakubek@gmail.com>, Hao Fang <fanghao11@huawei.com>,
 Arnd Bergmann <arnd@arndb.de>, Richard Weinberger <richard@nod.at>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 Corey Minyard <minyard@acm.org>, Anshuman Khandual <anshuman.khandual@arm.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 linux-spi <linux-spi@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/02/2022 15:29, Rob Herring wrote:
> On Wed, Feb 2, 2022 at 10:55 AM <nick.hawkins@hpe.com> wrote:
>>
>> From: Nick Hawkins <nick.hawkins@hpe.com>
>>

(...)

>> +
>> +       vuart_a: vuart_a@80fd0200 {
> 
> serial@...

Maybe it does not look like, but this is actually a v2. Nick was asked
to change the naming for the nodes already in v1. Unfortunately it did
not happen, so we have vuart, spifi, vic and more.

It is a waste of reviewers' time to ask them to perform the same review
twice or to ignore their comments.

> 
>> +               compatible = "hpe,gxp-vuart";
>> +               reg = <0x80fd0200 0x100>;
>> +               interrupts = <2>;
>> +               interrupt-parent = <&vic1>;
>> +               clock-frequency = <1846153>;
>> +               reg-shift = <0>;
>> +               status = "okay";
>> +               serial-line = <3>;
>> +               vuart_cfg = <&vuart_a_cfg>;
>> +       };

(...)

>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> index 294093d45a23..913f722a6b8d 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> @@ -514,7 +514,9 @@ patternProperties:
>>    "^hoperun,.*":
>>      description: Jiangsu HopeRun Software Co., Ltd.
>>    "^hp,.*":
>> -    description: Hewlett Packard
>> +    description: Hewlett Packard Inc.
> 
> Why are you changing this one?

I guess this is squashing of my patch:
https://lore.kernel.org/all/20220127075229.10299-1-krzysztof.kozlowski@canonical.com/

which is fine to me, but vendor changve should be a separate commit with
its own explanation. Now it looks indeed weird.

> 
>> +  "^hpe,.*":
> 
> You used HPE elsewhere... Lowercase is preferred.




Best regards,
Krzysztof
