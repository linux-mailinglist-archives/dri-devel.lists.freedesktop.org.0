Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69195C0C564
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866A310E030;
	Mon, 27 Oct 2025 08:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mHbgc7+z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C4910E030
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:38:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 892E743934;
 Mon, 27 Oct 2025 08:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49DF5C4CEF1;
 Mon, 27 Oct 2025 08:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761554308;
 bh=3UVOZ10a6KVsOB9uBphk7NDnZ8EZ4fSZxfjX8dQKj8c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mHbgc7+zeFsmcfToHxSHVEecMmuXvsXbqGD06+L22hqz0ePN/C2tyLwMzo1MDOG02
 FF/lesCC5W42F5ZQQ9OhCeolEzsxiUhwibDLHtXoev21y9/n/l8RTpjFE147PnDpUB
 h1EP4Gt+5TCCooxloYIYMDml9So5JxPGDEOAdPMPZJ43FCpTGOsJX0stlGUiFGwgQz
 ddpZuRQ2mJ8WNOBhpTfJM1eye4y1ofvsO6I3wROpXYQ/q+TYnJQWJxlsqp9qh/Abs9
 8HmwOwGsHXI3ciO9ZikDPLbn4+Bwcw3OpjIq7NxpvvbqQwypZj6gOHuNbaSts8ZfSS
 4ZrnIsOiXRtRw==
Message-ID: <c32970a8-c1d1-4130-839b-981bca5373f3@kernel.org>
Date: Mon, 27 Oct 2025 09:38:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: leds: backlight: Add Awinic AW99706
 backlight
To: Junjie Cao <caojunjie650@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
References: <20251026123923.1531727-1-caojunjie650@gmail.com>
 <20251026123923.1531727-2-caojunjie650@gmail.com>
 <c17c10d4-cc1f-46fd-8719-e7bb9ffa91ba@kernel.org>
 <CAK6c68gqHMR-FpH3MY9E_9R+V0J75V9zOii=x81e+bRcnBYOig@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAK6c68gqHMR-FpH3MY9E_9R+V0J75V9zOii=x81e+bRcnBYOig@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/10/2025 07:58, Junjie Cao wrote:
> On Sun, Oct 26, 2025 at 9:48 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 26/10/2025 13:39, Junjie Cao wrote:
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  enable-gpios:
>>> +    description: GPIO to use to enable/disable the backlight (HWEN pin).
>>> +    maxItems: 1
>>> +
>>> +  awinic,dim-mode:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description: >
>>> +      Select dimming mode of the device.
>>> +        0 = Bypass mode.
>>> +        1 = DC mode.
>>> +        2 = MIX mode.
>>> +        3 = MIX-26k.
>>> +    enum: [0, 1, 2, 3]
>>> +    default: 1
>>> +
>>> +  awinic,sw-freq:
>>
>> Please use proper units, see:
>> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml
>> and other examples
>>
>> Same everywhere else.
>>
> 
> ACK
> 
>>
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description: Boost switching frequency in kHz.
>>> +    enum: [300, 400, 500, 600, 660, 750, 850, 1000, 1200, 1330, 1500, 1700]
>>> +    default: 750
>>> +
>>> +  awinic,sw-ilmt:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description: Switching current limitation in mA.
>>> +    enum: [1500, 2000, 2500, 3000]
>>> +    default: 3000
>>> +
>>> +  awinic,iled-max:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description: Maximum LED current setting in uA.
>>> +    minimum: 5000
>>> +    maximum: 50000
>>> +    multipleOf: 500
>>> +    default: 20000
>>> +
>>> +  awinic,uvlo-thres:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description: UVLO(Under Voltage Lock Out) in mV.
>>> +    enum: [2200, 5000]
>>> +    default: 2200
>>> +
>>> +  awinic,fade-time:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description: Fade In/Out Time(per step) in us.
>>> +    enum: [8, 16, 32, 64, 128, 256, 512, 1024]
>>
>> Why would this be fixed setting? This really looks like runtime, drop.
>>
> 
> Yes, it is fixed. I am quoting this from the datasheet.

Fixed per board.


> AW99706B provides Fade in/out mode to transform backlight from one brightness
> to another or turn on/off backlight with a fixed slope. Writing 0b00 into
> RAMP_CTR (CFG 0x06) to enter Fade in/out mode, and the the slope of current
> transition can be set in FADE_TIME (CFG 0x06).
> 
>>> +    default: 16
>>> +
>>> +  awinic,slope-time:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description: Slope time in ms.
>>
>> Slope of what?
>>
> 
> Ramp time in slope mode, it is retained from downstream drivers, it will
> be more clear in the next version.
> 
>>> +    enum: [8, 24, 48, 96, 200, 300, 400, 500]
>>> +    default: 300
>>> +
>>> +  awinic,ramp-ctl:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description: >
>>> +      Select ramp control and filter of the device.
>>> +        0 = Fade in/fade out.
>>> +        1 = Light filter.
>>> +        2 = Medium filter.
>>> +        3 = Heavy filter.
>>> +    enum: [0, 1, 2, 3]
>>> +    default: 2
>>> +
>>> +  awinic,brt-mode:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description: >
>>> +      Select brightness control of the device.
>>> +        0 = PWM.
>>> +        1 = IIC.
>>> +        2 = IIC x PWM.
>>> +        3 = IIC x PWM(P-ramp).
>>> +    enum: [0, 1, 2, 3]
>>> +    default: 1
>>> +
>>> +  awinic,onoff-time:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description: Turn on/off time(per step) in ns.
>>> +    enum: [250, 500, 1000, 2000, 4000, 8000, 16000]
>>
>> Not a DT property.
>>
> 
> It is mandatory in the downstream driver, I keep it.

Huh? I don't care about downstream driver. Again, not a DT property. You
cannot add here runtime properties and when, we tell you that, you just
ignore our review.

NAK


> 
> The following is the description about it,
> 
> If the value in ONOFF_CTR(CFG 0x08 [4:3]) is 0b00, the turning on/off ramp of
> AW99706B is soft start and fast end. In this mode, the ramp time can be
> programmed by ONOFF_TIME (CFG 0x08 [2:0]).
> 
>>> +    default: 2000
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - enable-gpios
>>> +
>>> +unevaluatedProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/gpio/gpio.h>
>>> +
>>> +    i2c {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        aw99706@76 {
>>> +            compatible = "awinic,aw99706";
>>> +            reg = <0x76>;
>>> +            enable-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
>>
>> Where are other properties from common.yaml? Looks like you re-invented
>> some parts.
>>
> 
> Sorry, I forgot it, when writing the bindings, I used ktz8866.yaml as a
> template. I  should have dropped the common.yaml. This driver does
> not require other properties in common.yaml.


I don't care about driver much, but anyway it should use common.yaml.
Please read the feedback very carefully.

Best regards,
Krzysztof
