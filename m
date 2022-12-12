Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E56D6649E6A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 13:05:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4A210E1D0;
	Mon, 12 Dec 2022 12:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B466810E1D0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 12:05:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94CA16CF;
 Mon, 12 Dec 2022 13:05:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1670846734;
 bh=mI8PCmj/cnOJcB2oNJ1Dc5d6b0A6ZL0gRGJWujB/9Uo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vENgFypc+3HoroWNmP94Wa7VNOB8cgH5ZLLxBDQ5tV+dUcQ1+bCcHXw+8o47ktWW0
 zbhEWexCEmNcbFynQlZL8alEnQKADvdNdCKiw7GZGtaVG/offKJlTtUcsWNCFEJDtO
 bYuNmQIYfLKa0816zzWwUzyfDJDrwCWjvV06WXF8=
Date: Mon, 12 Dec 2022 14:05:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add enable
 delay property
Message-ID: <Y5cZDOxTHYu5SOFj@pendragon.ideasonboard.com>
References: <20221209083339.3780776-1-alexander.stein@ew.tq-group.com>
 <45157029.fMDQidcC6G@steina-w>
 <6da2330d-516e-7dc4-a000-1e68c7f7887e@denx.de>
 <2735716.BEx9A2HvPv@steina-w>
 <c6f2cc52-41c6-028f-4d3f-e8a4d5d73dcd@denx.de>
 <9f8b1c17-0bc5-ae99-b7b1-cb2f52f9310d@kontron.de>
 <Y5b1PRRFeSm2P/LB@pendragon.ideasonboard.com>
 <604d3d94-1aa2-d4bf-e934-9844e25f60a4@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <604d3d94-1aa2-d4bf-e934-9844e25f60a4@kontron.de>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 12, 2022 at 12:49:26PM +0100, Frieder Schrempf wrote:
> On 12.12.22 10:32, Laurent Pinchart wrote:
> > On Mon, Dec 12, 2022 at 10:09:45AM +0100, Frieder Schrempf wrote:
> >> On 09.12.22 15:49, Marek Vasut wrote:
> >>> On 12/9/22 14:38, Alexander Stein wrote:
> >>>> Am Freitag, 9. Dezember 2022, 13:43:02 CET schrieb Marek Vasut:
> >>>>> On 12/9/22 13:21, Alexander Stein wrote:
> >>>>>> Am Freitag, 9. Dezember 2022, 13:02:10 CET schrieb Marek Vasut:
> >>>>>>> On 12/9/22 10:36, Alexander Stein wrote:
> >>>>>>>> Am Freitag, 9. Dezember 2022, 10:07:45 CET schrieb Krzysztof Kozlowski:
> >>>>>>>>> On 09/12/2022 09:54, Alexander Stein wrote:
> >>>>>>>>>> Am Freitag, 9. Dezember 2022, 09:39:49 CET schrieb Krzysztof Kozlowski:
> >>>>>>>>>>> On 09/12/2022 09:33, Alexander Stein wrote:
> >>>>>>>>>>>> It takes some time until the enable GPIO has settled when turning on.
> >>>>>>>>>>>> This delay is platform specific and may be caused by e.g. voltage
> >>>>>>>>>>>> shifts, capacitors etc.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >>>>>>>>>>>> ---
> >>>>>>>>>>>>
> >>>>>>>>>>>>    
> >>>>>>>>>>>> .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml      | 4
> >>>>>>>>>>>>     ++++
> >>>>>>>>>>>>     1 file changed, 4 insertions(+)
> >>>>>>>>>>>>
> >>>>>>>>>>>> diff --git
> >>>>>>>>>>>> a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> >>>>>>>>>>>> b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> >>>>>>>>>>>> index 48a97bb3e2e0d..3f50d497cf8ac 100644
> >>>>>>>>>>>> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> >>>>>>>>>>>> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> >>>>>>>>>>>>
> >>>>>>>>>>>> @@ -32,6 +32,10 @@ properties:
> >>>>>>>>>>>>         maxItems: 1
> >>>>>>>>>>>>         description: GPIO specifier for bridge_en pin (active high).
> >>>>>>>>>>>>
> >>>>>>>>>>>> +  ti,enable-delay-us:
> >>>>>>>>>>>> +    default: 10000
> >>>>>>>>>>>> +    description: Enable time delay for enable-gpios
> >>>>>>>>>>>
> >>>>>>>>>>> Aren't you now mixing two separate delays? One for entire block (I
> >>>>>>>>>>> would assume mostly fixed delay) and one depending on regulators
> >>>>>>>>>>> (regulator-ramp-delay, regulator-enable-ramp-delay). Maybe you miss the
> >>>>>>>>>>> second delays in your power supply? If so, the first one might be fixed
> >>>>>>>>>>> and hard-coded in the driver?
> >>>>>>>>>>
> >>>>>>>>>> Apparently there are two different delays: reset time (t_reset) of 10ms as
> >>>>>>>>>> specified by datasheet. This is already ensured by a following delay after
> >>>>>>>>>> requesting enable_gpio as low and switching the GPIO to low in disable
> >>>>>>>>>> path.
> >>>>>>>>>>
> >>>>>>>>>> When enabling this GPIO it takes some time until it is valid on the chip,
> >>>>>>>>>> this is what this series is about. It's highly platform specific.
> >>>>>>>>>>
> >>>>>>>>>> Unfortunately this is completely unrelated to the vcc-supply regulator.
> >>>>>>>>>> This one has to be enabled before the enable GPIO can be enabled. So
> >>>>>>>>>> there is no regulator-ramp-delay.
> >>>>>>>>>
> >>>>>>>>> Your driver does one after another - regulator followed immediately by
> >>>>>>>>> gpio - so this as well can be a delay from regulator (maybe not ramp but
> >>>>>>>>> enable delay).
> >>>>>>>
> >>>>>>> The chip has two separate input pins:
> >>>>>>>
> >>>>>>> VCC -- power supply that's regulator
> >>>>>>> EN -- reset line, that's GPIO
> >>>>>>>
> >>>>>>> Alexander is talking about EN line here.
> >>>>>>>
> >>>>>>>> But this will introduce a section which must not be interrupted or delayed.
> >>>>>>>> This is impossible as the enable gpio is attached to an i2c expander in my
> >>>>>>>> case.
> >>>>>>>>
> >>>>>>>> Given the following time chart:
> >>>>>>>>     vcc                  set             EN
> >>>>>>>>
> >>>>>>>> enable               GPIO             PAD
> >>>>>>>>
> >>>>>>>>      |                    |<-- t_raise -->|
> >>>>>>>>      |
> >>>>>>>>      | <-- t_vcc_gpio --> |               |
> >>>>>>>>      | <--        t_enable_delay      --> |
> >>>>>>>>
> >>>>>>>> t_raise is the time from changing the GPIO output at the expander until
> >>>>>>>> voltage on the EN (input) pad from the bridge has reached high voltage
> >>>>>>>> level. This is an electrical characteristic I can not change and have to
> >>>>>>>> take into account.
> >>>>>>>> t_vcc_gpio is the time from enabling supply voltage to enabling the bridge
> >>>>>>>> (removing from reset). Minimum t_vcc_gpio is something which can be
> >>>>>>>> addressed by the regulator and is no problem so far. But there is no
> >>>>>>>> upper bound to it.
> >>>>>>>
> >>>>>>> What exactly is your EN signal rise time (should be ns or so)? Can you
> >>>>>>> look at that with a scope , maybe even with relation to the VCC
> >>>>>>> regulator
> >>>>>>> ?
> >>>>>>
> >>>>>> I checked EN rise time using a scope, it's ~110ms. I not an expert in
> >>>>>> hardware but on the mainboard there is some capacitor attached to this
> >>>>>> line, which increased the time, independent from the internal pull-up.
> >>>>>
> >>>>> This does seem like a hardware bug right there, can you double-check
> >>>>> this with the hardware engineer ?
> >>>>
> >>>> Yep, checked with hardware engineer. An 470nF is attached, together with an
> >>>> open drain output and only the internal pull-up. So yes ~113ms rising time
> >>>> until 0.7 x VCC.
> >>>
> >>> I don't suppose you can have that capacitor reduced or better yet, some
> >>> external pull up added, can you ?
> >>
> >> Actually our HW engineers have implemented a similar RC circuit to
> >> provide a hardware delay for the EN signal. I think this is due to a
> >> design note in the datasheet (see chapter 7.4.1) and therefore it's
> >> probably widely spread.
> > 
> > RC delay circuits are very common when tying a control signal to a power
> > rail. I'm surprise to see it recommended (with such a large time
> > constant) when the EN signal is actively controlled. It makes sense if
> > the SN65DSI83 supply comes up before the GPIO can be actively driven low
> > (for instance if the supply isn't manually controllable but tied to an
> > always-on power rail), in other cases it's quite counter-productive (I
> > really hope the EN input has a Schmitt trigger).
> 
> On our hardware there's also a pulldown resistor parallel to the
> capacitor which makes sure EN is low from the beginning even if the GPIO
> is not driven yet.
> 
> I don't really understand what the capacitor should be good for, or why
> TI recommends it. It looks counter-productive to me, too.

There's an internal pull-up to VCC, so in case the GPIO is not driven,
the capacitor ensures that the EN voltage rises slowly enough to match
the required timings. If you ensure it gets driven, there should be no
concern.

-- 
Regards,

Laurent Pinchart
