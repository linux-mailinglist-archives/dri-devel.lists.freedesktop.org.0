Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7EE4AF193
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 13:29:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5019E10E286;
	Wed,  9 Feb 2022 12:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0908910E3F1
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 12:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m6B5Bt04Ja5VdpPcQUGTQOSglLueQIXN7VBf1JB0c2s=; b=V1STQFAHja9Oh6UVDvE8unG+eY
 jaGfwHYo75r9zXjRoZILoPI1ty+NEyPUvgp/4vEvyRit9r6JBHXC3aV5XSN3cyiNDnjOKSS15WLIa
 iRe7QRmjXedaSTlPh0d0kv0be/PvU9G6RSismtq7YrM7ALEBn4VbPNqoNPalFuKvz2kfc41gm4CqP
 KTfqCtVAwFYwBHQnw7u+lrnYor9RAbTdXSSWwMbJBkZD9Un1XQB+0NDBxXuneszbTks7OJ0GwOwUW
 Fi+WYPZUwE2d5FTWxC/zCG/0X9/FlqcxhNz9Bnxrj3x7uLrlxMpZ6Khb9L/Ro012PalG5UI+A1vc+
 SBC2XWoA==;
Received: from [2a01:799:95e:a400:cca0:57ac:c55d:a485] (port=52792)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1nHm5z-0008Su-O0; Wed, 09 Feb 2022 13:29:15 +0100
Message-ID: <81d010c2-970d-093f-abf7-7834865150de@tronnes.org>
Date: Wed, 9 Feb 2022 13:29:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/3] dt-bindings: display: add bindings for MIPI DBI
 compatible SPI panels
To: Maxime Ripard <maxime@cerno.tech>, Rob Herring <robh@kernel.org>
References: <20220125175700.37408-1-noralf@tronnes.org>
 <20220125175700.37408-2-noralf@tronnes.org>
 <20220127093722.hsed3ny3gzk55o7w@houat> <YgGpWo80TvfTknhx@robh.at.kernel.org>
 <bebbd98c-ccba-b233-0299-45f58efee10b@tronnes.org>
 <20220209090436.yluv5jq6ulvkm6ij@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220209090436.yluv5jq6ulvkm6ij@houat>
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
Cc: devicetree@vger.kernel.org, david@lechnology.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 09.02.2022 10.04, skrev Maxime Ripard:
> Hi Noralf,
> 
> On Tue, Feb 08, 2022 at 01:16:44PM +0100, Noralf Trønnes wrote:
>> Den 08.02.2022 00.20, skrev Rob Herring:
>>> On Thu, Jan 27, 2022 at 10:37:22AM +0100, Maxime Ripard wrote:
>>>> Hi,
>>>>
>>>> On Tue, Jan 25, 2022 at 06:56:58PM +0100, Noralf Trønnes wrote:
>>>>> Add binding for MIPI DBI compatible SPI panels.
>>>>>
>>>>> v2:
>>>>> - Fix path for panel-common.yaml
>>>>> - Use unevaluatedProperties
>>>>> - Drop properties which are in the allOf section
>>>>> - Drop model property (Rob)
>>>>>
>>>>> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
>>>>> ---
>>>>>  .../display/panel/panel-mipi-dbi-spi.yaml     | 59 +++++++++++++++++++
>>>>>  1 file changed, 59 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..b7cbeea0f8aa
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
>>>>> @@ -0,0 +1,59 @@
>>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/display/panel/panel-mipi-dbi-spi.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: MIPI DBI SPI Panels Device Tree Bindings
>>>>> +
>>>>> +maintainers:
>>>>> +  - Noralf Trønnes <noralf@tronnes.org>
>>>>> +
>>>>> +description:
>>>>> +  This binding is for display panels using a MIPI DBI controller
>>>>> +  in SPI mode.
>>>>> +
>>>>> +allOf:
>>>>> +  - $ref: panel-common.yaml#
>>>>> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: panel-mipi-dbi-spi
>>>>
>>>> You need contains here, otherwise it will error out if you have two compatibles.
>>>
>>> Shouldn't it always have 2?
>>>
>>> Either way, this has to be split up between a common, shareable schema 
>>> and specific, complete schema(s). Like this:
>>>
>>> - A schema for everything common (that allows additional properties)
>>>
>>> - A schema for 'panel-mipi-dbi-spi' referencing the common schema plus 
>>>   'unevaluatedProperties: false'
>>>
>>> - Schemas for panels with their own additional properties (regulators, 
>>>   GPIOs, etc.)
>>>
>>> LVDS was restructured like this IIRC.
>>
>> The whole point of this exercise is to avoid the need for controller
>> specific bindings.
> 
> I'm not sure to follow you here, nothing that either Rob or I discussed
> would require a controller specific binding.
> 
> It would require a controller compatible, but the binding itself can
> just mandate a controller compatible in addition to the
> panel-mipi-dbi-spi compatible, without enforcing anything wrt the
> compatible itself.
> 
> And the driver will just match panel-mipi-dbi-spi so there won't be any
> driver change either?
> 
> In essence, it would be similar to the bindings of panel-lvds or the
> AT24 EEPROM binding: you have two compatibles, but the driver is generic
> and will just infer its behaviour based on the DT properties (and in our
> case will load a firmware based on the specific compatible).
> 
> Wouldn't that work?
> 

Oh, I misunderstood then.
I looked at the panel-lvds binding and since it didn't have any example
it looked like a schema that controllers/panels would include and not
something that would be used on its own.

>> This binding will cover all specifics about these
>> controllers except for one thing and that is the controller
>> configuration. Each controller has its own configuration commands. These
>> commands will be loaded as a firmware file based on the compatible and
>> applied by the driver.
>>
>> So this binding, the panel-common and spi-peripheral-props covers
>> everything except for the controller configuration.
>>
>> Here's a copy of the DBI spec: https://www.docin.com/p-219732497.html
>>
>> This is my current version of the binding:
>>
>> # SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
>> %YAML 1.2
>> ---
>> $id: http://devicetree.org/schemas/display/panel/panel-mipi-dbi-spi.yaml#
>> $schema: http://devicetree.org/meta-schemas/core.yaml#
>>
>> title: MIPI DBI SPI Panel
>>
>> maintainers:
>>   - Noralf Trønnes <noralf@tronnes.org>
>>
>> description: |
>>   This binding is for display panels using a MIPI DBI compatible controller
>>   in SPI mode.
>>
>>   The MIPI Alliance Standard for Display Bus Interface defines the
>> electrical
>>   and logical interfaces for display controllers historically used in mobile
>>   phones. The standard defines 4 display architecture types and this
>> binding is
>>   for type 1 which has full frame memory. There are 3 interface types in the
>>   standard and type C is the serial interface.
>>
>>   The standard defines the following interface signals for type C:
>>   - Power:
>>     - Vdd: Power supply for display module
>>     - Vddi: Logic level supply for interface signals
>>     Combined into one in this binding called: power-supply
>>   - Interface:
>>     - CSx: Chip select
>>     - SCL: Serial clock
>>     - Dout: Serial out
>>     - Din: Serial in
>>     - SDA: Bidrectional in/out
>>     - D/CX: Data/command selection, high=data, low=command
>>       Called dc-gpios in this binding.
>>     - RESX: Reset when low
>>       Called reset-gpios in this binding.
>>
>>   The type C interface has 3 options:
>>
>>     - Option 1: 9-bit mode and D/CX as the 9th bit
>>       |              Command              |  the next command or
>> following data  |
>>
>> |<0><D7><D6><D5><D4><D3><D2><D1><D0>|<D/CX><D7><D6><D5><D4><D3><D2><D1><D0>|
>>
>>     - Option 2: 16-bit mode and D/CX as a 9th bit
>>       |              Command or data                              |
>>       |<X><X><X><X><X><X><X><D/CX><D7><D6><D5><D4><D3><D2><D1><D0>|
>>
>>     - Option 3: 8-bit mode and D/CX as a separate interface line
>>       |        Command or data         |
>>       |<D7><D6><D5><D4><D3><D2><D1><D0>|
>>
>>   The panel resolution is specified using the panel-timing node properties
>>   hactive (width) and vactive (height). The other mandatory panel-timing
>>   properties should be set to zero except clock-frequency which can be
>>   optionally set to inform about the actual pixel clock frequency.
>>
>>   If the panel is wired to the controller at an offset specify this using
>>   hback-porch (x-offset) and vback-porch (y-offset).
>>
>> allOf:
>>   - $ref: panel-common.yaml#
>>   - $ref: /schemas/spi/spi-peripheral-props.yaml#
>>
>> properties:
>>   compatible:
>>     contains:
>>       const: panel-dbi-spi
>>
>>   write-only:
>>     type: boolean
>>     description:
>>       Controller is not readable (ie. MISO is not wired up).
>>
>>   dc-gpios:
>>     maxItems: 1
>>     description: |
>>       Controller data/command selection (D/CX) in 4-line SPI mode.
>>       If not set, the controller is in 3-line SPI mode.
>>
>> required:
>>   - compatible
>>   - reg
>>   - panel-timing
>>
>> unevaluatedProperties: false
>>
>> examples:
>>   - |
>>     #include <dt-bindings/gpio/gpio.h>
>>
>>     spi {
>>             #address-cells = <1>;
>>             #size-cells = <0>;
>>
>>             display@0{
>>                     compatible = "sainsmart18", "panel-dbi-spi";
>>                     reg = <0>;
>>                     spi-max-frequency = <40000000>;
>>
>>                     dc-gpios = <&gpio 24 GPIO_ACTIVE_HIGH>;
>>                     reset-gpios = <&gpio 25 GPIO_ACTIVE_HIGH>;
>>                     write-only;
>>
>>                     backlight = <&backlight>;
>>
>>                     width-mm = <35>;
>>                     height-mm = <28>;
>>
>>                     panel-timing {
>>                         hactive = <160>;
>>                         vactive = <128>;
>>                         hback-porch = <0>;
>>                         vback-porch = <0>;
>>
>>                         clock-frequency = <0>;
>>                         hfront-porch = <0>;
>>                         hsync-len = <0>;
>>                         vfront-porch = <0>;
>>                         vsync-len = <0>;
>>                     };
>>             };
>>     };
>>
>> ...
> 
> Yep, this looks good to me
> 

Thanks, I'll spin a new version.

Noralf.
