Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 545654B2783
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 15:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A5010EC81;
	Fri, 11 Feb 2022 14:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E680410EC81
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 14:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gg/5jkS91FoXJoLCEDnxyXrvscxrFdR1zUA5z7+9xLY=; b=g3F9Bt1uD+8ltjmASNczobqcX3
 bJxQajG/iSxeO16E+e2PLpkBhVMXIlS/fyAYiCnyeDRev4xOYO4pv7CZJB7xx7vUasYHAMzpypC9o
 I7h9b6y5wetftZqNIo/eMzH86l1EwGgeRdp3BUH8skfvU4i19rrYsPofep5bR8gDZT4PStyaKKXNZ
 //tAO+B/jXm36K5y/A4yWUSqOICfP4uNCOR2drewLOMBfFSsN9tIivS19luzM018r/o+Vgxl5JGls
 GbheuA6t5/4tb8dsjHrs+gAf2bP5xbyFJnd/MG7bf5a1aL+i2PmDPVc1aYIaYIXz8EgmnR7wD3RWU
 ipJAfpRw==;
Received: from [2a01:799:95e:a400:cca0:57ac:c55d:a485] (port=55962)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1nIWY3-0007Bm-LX; Fri, 11 Feb 2022 15:05:19 +0100
Message-ID: <2eac54d1-5b6a-1776-70e5-645d1fffa191@tronnes.org>
Date: Fri, 11 Feb 2022 15:05:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 1/3] dt-bindings: display: add bindings for MIPI DBI
 compatible SPI panels
To: Maxime Ripard <maxime@cerno.tech>
References: <20220211130434.20732-1-noralf@tronnes.org>
 <20220211130434.20732-2-noralf@tronnes.org>
 <20220211132745.h5vyo7b7hrq6rkla@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220211132745.h5vyo7b7hrq6rkla@houat>
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
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 11.02.2022 14.27, skrev Maxime Ripard:
> On Fri, Feb 11, 2022 at 02:04:32PM +0100, Noralf Trønnes wrote:
>> Add binding for MIPI DBI compatible SPI panels.
>>
>> v3:
>> - Move properties to Device Tree (Maxime)
>> - Use contains for compatible (Maxime)
>> - Add backlight property to example
>> - Flesh out description
>>
>> v2:
>> - Fix path for panel-common.yaml
>> - Use unevaluatedProperties
>> - Drop properties which are in the allOf section
>> - Drop model property (Rob)
>>
>> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
>> ---
>>  .../display/panel/panel-mipi-dbi-spi.yaml     | 124 ++++++++++++++++++
>>  1 file changed, 124 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
>> new file mode 100644
>> index 000000000000..4d017a36ad4d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
>> @@ -0,0 +1,124 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/panel-mipi-dbi-spi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MIPI DBI SPI Panel
>> +
>> +maintainers:
>> +  - Noralf Trønnes <noralf@tronnes.org>
>> +
>> +description: |
>> +  This binding is for display panels using a MIPI DBI compatible controller
>> +  in SPI mode.
>> +
>> +  The MIPI Alliance Standard for Display Bus Interface defines the electrical
>> +  and logical interfaces for display controllers historically used in mobile
>> +  phones. The standard defines 4 display architecture types and this binding is
>> +  for type 1 which has full frame memory. There are 3 interface types in the
>> +  standard and type C is the serial interface.
>> +
>> +  The standard defines the following interface signals for type C:
>> +  - Power:
>> +    - Vdd: Power supply for display module
>> +    - Vddi: Logic level supply for interface signals
>> +    Combined into one in this binding called: power-supply
>> +  - Interface:
>> +    - CSx: Chip select
>> +    - SCL: Serial clock
>> +    - Dout: Serial out
>> +    - Din: Serial in
>> +    - SDA: Bidrectional in/out
>> +    - D/CX: Data/command selection, high=data, low=command
>> +      Called dc-gpios in this binding.
>> +    - RESX: Reset when low
>> +      Called reset-gpios in this binding.
>> +
>> +  The type C interface has 3 options:
>> +
>> +    - Option 1: 9-bit mode and D/CX as the 9th bit
>> +      |              Command              |  the next command or following data  |
>> +      |<0><D7><D6><D5><D4><D3><D2><D1><D0>|<D/CX><D7><D6><D5><D4><D3><D2><D1><D0>|
>> +
>> +    - Option 2: 16-bit mode and D/CX as a 9th bit
>> +      |              Command or data                              |
>> +      |<X><X><X><X><X><X><X><D/CX><D7><D6><D5><D4><D3><D2><D1><D0>|
>> +
>> +    - Option 3: 8-bit mode and D/CX as a separate interface line
>> +      |        Command or data         |
>> +      |<D7><D6><D5><D4><D3><D2><D1><D0>|
>> +
>> +  The panel resolution is specified using the panel-timing node properties
>> +  hactive (width) and vactive (height). The other mandatory panel-timing
>> +  properties should be set to zero except clock-frequency which can be
>> +  optionally set to inform about the actual pixel clock frequency.
>> +
>> +  If the panel is wired to the controller at an offset specify this using
>> +  hback-porch (x-offset) and vback-porch (y-offset).
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    contains:
>> +      const: panel-dbi-spi
> 
> This could be further improved by using
> 
> properties:
>   compatible:
>     items:
>       - {} # Panel Specific Compatible
>       - const: panel-dbi-spi
> 
> To make it obvious we expect two compatible, and what the first one should be.
> 

Ok.

I see that for some reason I've dropped the mipi infix here in the
compatible and in the example. I'll fix that and make it
panel-mipi-dbi-spi in the next version.

Noralf.

> Once fixed,
> 
> Acked-by: Maxime Ripard <maxime@cerno.tech>
> 
> Maxime
