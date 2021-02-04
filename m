Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CECDD30FCDA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 20:34:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75FE6E890;
	Thu,  4 Feb 2021 19:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E6E6EE0C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 18:09:40 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DWmm21BHnz1qs49;
 Thu,  4 Feb 2021 19:09:38 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DWmm20KWLz1t6pv;
 Thu,  4 Feb 2021 19:09:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Tzu0XRqSusCs; Thu,  4 Feb 2021 19:09:36 +0100 (CET)
X-Auth-Info: ujjjqwMaeZTKy1rSImM1CUauDTf2R99VzkFErwv17UU=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  4 Feb 2021 19:09:36 +0100 (CET)
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add TI
 SN65DSI83 bindings
To: Doug Anderson <dianders@chromium.org>
References: <20210130181014.161457-1-marex@denx.de>
 <CAD=FV=UzkP8Rp6BDNVr1FmOK4GY9_dSeT6fCjQLMatHftyj9iA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <c7df0302-c2c1-6ccb-7f7f-8b781d9e3d9b@denx.de>
Date: Thu, 4 Feb 2021 19:09:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=UzkP8Rp6BDNVr1FmOK4GY9_dSeT6fCjQLMatHftyj9iA@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 04 Feb 2021 19:34:32 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/4/21 6:15 PM, Doug Anderson wrote:

Hi,

[...]

>> +properties:
>> +  compatible:
>> +    const: ti,sn65dsi83
>> +
>> +  reg:
>> +    const: 0x2d
>> +
>> +  enable-gpios:
>> +    maxItems: 1
>> +    description: GPIO specifier for bridge_en pin (active high).
> 
> I see two regulators: vcc and vcore.  Shouldn't those be listed?

Those are not implemented and not tested, so if someone needs them later 
on, they can be added then.

> I also see an interrupt pin on the datasheet.  Probably should be
> listed too even if the chip can be made to work fine without hooking
> it up.  It can just be optional, right?

It is optional and again completely untested, so it can be added later 
if needed.

> It wouldn't hurt to list the refclk here too even if the code doesn't
> use it.  From sn65dsi86 it was handy that the bindings already had all
> this type of stuff so that when we added the feature we didn't have to
> go back to the bindings.

In my case, the refclock are derived from the DSI link.

>> +  ports:
>> +    type: object
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      "#address-cells":
>> +        const: 1
>> +
>> +      "#size-cells":
>> +        const: 0
>> +
>> +      port@0:
>> +        type: object
>> +        additionalProperties: false
>> +
>> +        description:
>> +          Video port for MIPI DSI input
>> +
>> +        properties:
>> +          reg:
>> +            const: 0
>> +
>> +          endpoint:
>> +            type: object
>> +            additionalProperties: false
>> +            properties:
>> +              remote-endpoint: true
>> +              data-lanes:
>> +                description: array of physical DSI data lane indexes.
> 
> The chip doesn't allow for arbitrary remapping here, right?  So you're
> just using this as the official way to specify the number of lanes?  I
> guess the only valid values are:
> 
> <0>
> <0 1>
> <0 1 2>
> <0 1 2 3>

Shouldn't that be <1 2 3 4> ?

> In sn65dsi86 we attempted to enforce that a valid option was selected
> for the output lanes.  Could you do something similar?  If nothing
> else adding a description of the valid options would be good.

I saw the binding, but I was under the impressions the DSI86 can do lane 
reordering, isn't that the case ? Maybe I misunderstood it.

But yes, if you have a suggestion how to make a non-cryptic list of 
those four lane mapping options, please do share this info.

>> +        required:
>> +          - reg
>> +
>> +      port@1:
>> +        type: object
>> +        additionalProperties: false
>> +
>> +        description:
>> +          Video port for LVDS output (panel or bridge).
>> +
>> +        properties:
>> +          reg:
>> +            const: 1
>> +
>> +          endpoint:
>> +            type: object
>> +            additionalProperties: false
>> +            properties:
>> +              remote-endpoint: true
> 
> Worth adding the data-lanes here too?  I guess this part allows you
> two different orders for the LVDS outputs?

I don't really want to add any properties which I cannot test and then 
end up with DT bindings which would become poor ABI in the future.

>> +
>> +        required:
>> +          - reg
>> +
>> +    required:
>> +      - "#address-cells"
>> +      - "#size-cells"
>> +      - port@0
>> +      - port@1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - enable-gpios
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    i2c {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
>> +      bridge@2d {
>> +        compatible = "ti,sn65dsi83";
>> +        reg = <0x2d>;
>> +
>> +        enable-gpios = <&gpio2 1 GPIO_ACTIVE_HIGH>;
>> +
>> +        ports {
>> +          #address-cells = <1>;
>> +          #size-cells = <0>;
>> +
>> +          port@0 {
>> +            reg = <0>;
>> +            endpoint {
>> +              remote-endpoint = <&dsi0_out>;
>> +              data-lanes = <1 2 3 4>;
> 
> Should the above be <0 1 2 3>?

Well, git grep data-lanes seems to indicate some count from 1, some from 0 .
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
