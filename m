Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2866482D8
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 14:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731E010E035;
	Fri,  9 Dec 2022 13:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B18A10E035
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 13:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670593093; x=1702129093;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AEWb0npLjWYKAZ77OTmHcUwl5bx4xDS149SD5wS2qfk=;
 b=DvTTuHUFg3sDf+CaH0gumsiRtq0djot+DKzVCYMPm0mU9gBudgJ+oIEG
 evhs6OxitFz6drWsghliiWHAyPy7l7qkdXZVvcL3ALl8Ys58vfUJfXw04
 DxPYaUqbCtNjIE3p7mYGnzkzvy8ox6si8I3YqoSX/a+ku6j+tqkn8MCNT
 yAZjk2iVf8KKg8Yf5zdoD9Vvn06hYfnIlqlwIywaCHFzTsZUpmvdg6dsL
 oZzt2vxH3LqjHrJLMNirdu7x1OdsFMWF+q0NZFup6OSq8ErUqHalISPmj
 tH2yRICC+1Z/i1AAZLtz5P88qgzL+Jk0+qlNNTqRiKcCBEQfX+M8XxlgM Q==;
X-IronPort-AV: E=Sophos;i="5.96,230,1665439200"; d="scan'208";a="27866776"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 09 Dec 2022 14:38:11 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 09 Dec 2022 14:38:11 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 09 Dec 2022 14:38:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670593091; x=1702129091;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AEWb0npLjWYKAZ77OTmHcUwl5bx4xDS149SD5wS2qfk=;
 b=glhmBAg52Y1tdZhI4gHF6hZPn88lF1iPLkQvGgfMxZKqeoVesRjRzFaU
 Mr6quEgiQFJMSOivgCLiLC40zaMwtsxuG6DX79F3tRHFbJNDd3/bno8/n
 5pytBMaKz7k8NCxVacITDj3S5Wtzd6FrdaNIsnHGwEtZAeTNTvNh/OeZ6
 ZVPshTOdU/Vse78WCpAYzOD6DisR50KELkGGocIIZumuKmbwyKExT3Pjo
 xHwERsTLnKTM+3b2SyBFvGDnM+G4JamvIlBaZhzVJEbAyccoovVAzzB/m
 hdv+HJob7MPJByDoKEj+U0YE3i6rsKG9nvrVJarT8OH5suyKmfDOHoP4q w==;
X-IronPort-AV: E=Sophos;i="5.96,230,1665439200"; d="scan'208";a="27866775"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 09 Dec 2022 14:38:10 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B9FF2280071;
 Fri,  9 Dec 2022 14:38:10 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add enable
 delay property
Date: Fri, 09 Dec 2022 14:38:08 +0100
Message-ID: <2735716.BEx9A2HvPv@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <6da2330d-516e-7dc4-a000-1e68c7f7887e@denx.de>
References: <20221209083339.3780776-1-alexander.stein@ew.tq-group.com>
 <45157029.fMDQidcC6G@steina-w> <6da2330d-516e-7dc4-a000-1e68c7f7887e@denx.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, 9. Dezember 2022, 13:43:02 CET schrieb Marek Vasut:
> On 12/9/22 13:21, Alexander Stein wrote:
> > Hi Marek,
> > 
> > Am Freitag, 9. Dezember 2022, 13:02:10 CET schrieb Marek Vasut:
> >> On 12/9/22 10:36, Alexander Stein wrote:
> >>> Hello Krzysztof,
> >> 
> >> Hi,
> >> 
> >>> Am Freitag, 9. Dezember 2022, 10:07:45 CET schrieb Krzysztof Kozlowski:
> >>>> On 09/12/2022 09:54, Alexander Stein wrote:
> >>>>> Hello Krzysztof,
> >>>>> 
> >>>>> thanks for the fast feedback.
> >>>>> 
> >>>>> Am Freitag, 9. Dezember 2022, 09:39:49 CET schrieb Krzysztof 
Kozlowski:
> >>>>>> On 09/12/2022 09:33, Alexander Stein wrote:
> >>>>>>> It takes some time until the enable GPIO has settled when turning
> >>>>>>> on.
> >>>>>>> This delay is platform specific and may be caused by e.g. voltage
> >>>>>>> shifts, capacitors etc.
> >>>>>>> 
> >>>>>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >>>>>>> ---
> >>>>>>> 
> >>>>>>>    .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml      | 4
> >>>>>>>    ++++
> >>>>>>>    1 file changed, 4 insertions(+)
> >>>>>>> 
> >>>>>>> diff --git
> >>>>>>> a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> >>>>>>> b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> >>>>>>> index 48a97bb3e2e0d..3f50d497cf8ac 100644
> >>>>>>> ---
> >>>>>>> a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> >>>>>>> +++
> >>>>>>> b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> >>>>>>> 
> >>>>>>> @@ -32,6 +32,10 @@ properties:
> >>>>>>>        maxItems: 1
> >>>>>>>        description: GPIO specifier for bridge_en pin (active high).
> >>>>>>> 
> >>>>>>> +  ti,enable-delay-us:
> >>>>>>> +    default: 10000
> >>>>>>> +    description: Enable time delay for enable-gpios
> >>>>>> 
> >>>>>> Aren't you now mixing two separate delays? One for entire block on (I
> >>>>>> would assume mostly fixed delay) and one depending on regulators
> >>>>>> (regulator-ramp-delay, regulator-enable-ramp-delay). Maybe you miss
> >>>>>> the
> >>>>>> second delays in your power supply? If so, the first one might be
> >>>>>> fixed
> >>>>>> and hard-coded in the driver?
> >>>>> 
> >>>>> Apparently there are two different delays: reset time (t_reset) of
> >>>>> 10ms
> >>>>> as
> >>>>> specified by datasheet. This is already ensured by a following delay
> >>>>> after
> >>>>> requesting enable_gpio as low and switching the GPIO to low in disable
> >>>>> path.
> >>>>> 
> >>>>> When enabling this GPIO it takes some time until it is valid on the
> >>>>> chip,
> >>>>> this is what this series is about. It's highly platform specific.
> >>>>> 
> >>>>> Unfortunately this is completely unrelated to the vcc-supply
> >>>>> regulator.
> >>>>> This one has to be enabled before the enable GPIO can be enabled. So
> >>>>> there is no regulator-ramp-delay.
> >>>> 
> >>>> Your driver does one after another - regulator followed immediately by
> >>>> gpio - so this as well can be a delay from regulator (maybe not ramp
> >>>> but
> >>>> enable delay).
> >> 
> >> The chip has two separate input pins:
> >> 
> >> VCC -- power supply that's regulator
> >> EN -- reset line, that's GPIO
> >> 
> >> Alexander is talking about EN line here.
> >> 
> >>> But this will introduce a section which must not be interrupted or
> >>> delayed.
> >>> This is impossible as the enable gpio is attached to an i2c expander in
> >>> my
> >>> case.
> >>> 
> >>> Given the following time chart:
> >>>    vcc                  set             EN
> >>> 
> >>> enable               GPIO             PAD
> >>> 
> >>>     |                    |<-- t_raise -->|
> >>>     | 
> >>>     | <-- t_vcc_gpio --> |               |
> >>>     | <--        t_enable_delay      --> |
> >>> 
> >>> t_raise is the time from changing the GPIO output at the expander until
> >>> voltage on the EN (input) pad from the bridge has reached high voltage
> >>> level. This is an electrical characteristic I can not change and have to
> >>> take into account.
> >>> t_vcc_gpio is the time from enabling supply voltage to enabling the
> >>> bridge
> >>> (removing from reset). Minimum t_vcc_gpio is something which can be
> >>> addressed by the regulator and is no problem so far. But there is no
> >>> upper bound to it.
> >> 
> >> What exactly is your EN signal rise time (should be ns or so)? Can you
> >> look at that with a scope , maybe even with relation to the VCC regulator
> >> ?
> > 
> > I checked EN rise time using a scope, it's ~110ms. I not an expert in
> > hardware but on the mainboard there is some capacitor attached to this
> > line, which increased the time, independent from the internal pull-up.
> 
> This does seem like a hardware bug right there, can you double-check
> this with the hardware engineer ?

Yep, checked with hardware engineer. An 470nF is attached, together with an 
open drain output and only the internal pull-up. So yes ~113ms rising time 
until 0.7 x VCC.

Best regards,
Alexander

> I would expect the capacitor to charge quickly when you flip the I2C
> expander output HIGH, unless the I2C expander output is open drain, at
> which point the transistor in the output is closed when the output is
> set to HIGH and the capacitor is charging over the DSI83 EN pullup ,
> which might be slow.




