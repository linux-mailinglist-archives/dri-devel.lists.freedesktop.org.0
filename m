Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6CC648253
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 13:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EB110E52D;
	Fri,  9 Dec 2022 12:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD76010E52D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 12:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670588589; x=1702124589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YwpG9O9tidDLB/IzKW92Dfwn1EwnhUAoPlNcR81FoNg=;
 b=cBEuA4Oq7ugZ2//kk377du1ErBkIzuGIRVQQgPbJjwWqvni6TllrZ8cY
 5p7Fwl1+k2/RfNuKRa5BeeQ7dl6lz+3engaUaHIlfZ3JLAgtzXShkvwuN
 zDtZMCx2Vp6MR9mFi8baI0yc5QkbALFPL8QlhilPEgAr4OmSkP6MG23+h
 GlVZe/3wbhT0+kUCPAtMY8rpGFWiRothxNp/owJUxFYRGkbD+G6loOo+3
 KGLOK+cgMkalcFU6ziZ5FFJBNMgejriPT7USIBT/7f6tbMb/ykuz/aiXy
 h/5uO3n6jLruKNv7OYVvNvD7EpM/Q/WsIrGk0VPEv+rhmZ/ZoJW8mbL4i w==;
X-IronPort-AV: E=Sophos;i="5.96,230,1665439200"; d="scan'208";a="27865059"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 09 Dec 2022 13:23:07 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 09 Dec 2022 13:23:08 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 09 Dec 2022 13:23:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670588587; x=1702124587;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YwpG9O9tidDLB/IzKW92Dfwn1EwnhUAoPlNcR81FoNg=;
 b=ZB9VAxZm19FzrRpWxImBpFzdQj9KnaCE9ZyEQNQOp7AQLUkrquib/dok
 tpTYw0BEeJCIioEFgAErK/V9GNpcAKbjGBG64qs73/wztfTLYg/Qc/iDe
 xdKgcURB0dWHgdXvB36PciuPZ2eughb1xWVk/CnzDBwMCZgwKhD8tUcze
 /w39wdZ2YlQhcazXAZm/G9vWWOQ/hZC/OcJ/Lin511z/x/f3Tz4UmdTYC
 z2sgsbYMPpWT8h8b0rBTLtK4ioeIlkCe+nretFAHHjsNXK1CV8SyrliTz
 YXMWkWUaLs1xIySFCeVKD0G3U5HYymgd01++6W2tZ/F/i3BoEBPpuDcoV A==;
X-IronPort-AV: E=Sophos;i="5.96,230,1665439200"; d="scan'208";a="27865058"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 09 Dec 2022 13:23:07 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 981BA280071;
 Fri,  9 Dec 2022 13:23:07 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add enable
 delay property
Date: Fri, 09 Dec 2022 13:23:07 +0100
Message-ID: <2139563.Icojqenx9y@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <91535d1b-300e-79a1-5f6b-8401cf1b7b2c@linaro.org>
References: <20221209083339.3780776-1-alexander.stein@ew.tq-group.com>
 <df7e4c0d-2e30-a808-584f-d302233c2931@denx.de>
 <91535d1b-300e-79a1-5f6b-8401cf1b7b2c@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am Freitag, 9. Dezember 2022, 13:10:00 CET schrieb Krzysztof Kozlowski:
> On 09/12/2022 13:02, Marek Vasut wrote:
> > On 12/9/22 10:36, Alexander Stein wrote:
> >> Hello Krzysztof,
> > 
> > Hi,
> > 
> >> Am Freitag, 9. Dezember 2022, 10:07:45 CET schrieb Krzysztof Kozlowski:
> >>> On 09/12/2022 09:54, Alexander Stein wrote:
> >>>> Hello Krzysztof,
> >>>> 
> >>>> thanks for the fast feedback.
> >>>> 
> >>>> Am Freitag, 9. Dezember 2022, 09:39:49 CET schrieb Krzysztof Kozlowski:
> >>>>> On 09/12/2022 09:33, Alexander Stein wrote:
> >>>>>> It takes some time until the enable GPIO has settled when turning on.
> >>>>>> This delay is platform specific and may be caused by e.g. voltage
> >>>>>> shifts, capacitors etc.
> >>>>>> 
> >>>>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >>>>>> ---
> >>>>>> 
> >>>>>>   .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml      | 4
> >>>>>>   ++++
> >>>>>>   1 file changed, 4 insertions(+)
> >>>>>> 
> >>>>>> diff --git
> >>>>>> a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> >>>>>> b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> >>>>>> index 48a97bb3e2e0d..3f50d497cf8ac 100644
> >>>>>> ---
> >>>>>> a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> >>>>>> +++
> >>>>>> b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> >>>>>> 
> >>>>>> @@ -32,6 +32,10 @@ properties:
> >>>>>>       maxItems: 1
> >>>>>>       description: GPIO specifier for bridge_en pin (active high).
> >>>>>> 
> >>>>>> +  ti,enable-delay-us:
> >>>>>> +    default: 10000
> >>>>>> +    description: Enable time delay for enable-gpios
> >>>>> 
> >>>>> Aren't you now mixing two separate delays? One for entire block on (I
> >>>>> would assume mostly fixed delay) and one depending on regulators
> >>>>> (regulator-ramp-delay, regulator-enable-ramp-delay). Maybe you miss
> >>>>> the
> >>>>> second delays in your power supply? If so, the first one might be
> >>>>> fixed
> >>>>> and hard-coded in the driver?
> >>>> 
> >>>> Apparently there are two different delays: reset time (t_reset) of 10ms
> >>>> as
> >>>> specified by datasheet. This is already ensured by a following delay
> >>>> after
> >>>> requesting enable_gpio as low and switching the GPIO to low in disable
> >>>> path.
> >>>> 
> >>>> When enabling this GPIO it takes some time until it is valid on the
> >>>> chip,
> >>>> this is what this series is about. It's highly platform specific.
> >>>> 
> >>>> Unfortunately this is completely unrelated to the vcc-supply regulator.
> >>>> This one has to be enabled before the enable GPIO can be enabled. So
> >>>> there is no regulator-ramp-delay.
> >>> 
> >>> Your driver does one after another - regulator followed immediately by
> >>> gpio - so this as well can be a delay from regulator (maybe not ramp but
> >>> enable delay).
> > 
> > The chip has two separate input pins:
> > 
> > VCC -- power supply that's regulator
> > EN -- reset line, that's GPIO
> > 
> > Alexander is talking about EN line here.
> 
> I know, but mainline boards seems to be missing power supply, so that
> raises questions.
> 
> Whether voltage on some input pin reaches specified level is hardly a
> problem of only this bridge. OTOH, datasheet describes another delay
> which is specific to the chip and which is fixed - t_en/ten/Ten.

The mainline board doesn't have a bridge node yet, as this issue has not been 
solved. In my tree this looks like this:

dsi_lvds_bridge: bridge@2d {
    compatible = "ti,sn65dsi83";
    reg = <0x2d>;
    enable-gpios = <&expander0 6 GPIO_ACTIVE_HIGH>;
    vcc-supply = <&reg_sn65dsi83_1v8>;
    ti,enable-delay-us = <120000>;
    status = "disabled";

    ports {
[...]
    };
};

So there is a regulator providing VCC. Once stable enable-gpio is rising EN 
pin. The rising time is what is board specific, but completely independent 
from VCC supply. But as Krzysztof noticed this is independent from this bridge 
driver and can occur everywhere where a GPIO switch/enable is involved.
I have an idea which I'll post on linux-gpio.

Regards,
Alexander



