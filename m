Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0151C3241D
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 18:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C0D10E299;
	Tue,  4 Nov 2025 17:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=thorsis.com header.i=@thorsis.com header.b="gRF93W3l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3075610E258
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 10:24:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3228B14839C7; Tue,  4 Nov 2025 11:24:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
 t=1762251856; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=dBPVZv8ZAjPrctbt7IeOOktebaSybrHF8X5GDqBvhPw=;
 b=gRF93W3lpRdwy25l5NWJ3tEGdnnvKife1be96721Lgu80iB8DwHlcXqZpFoeRsIh8V1Qrr
 gfzismOMmeOhcydzxRLlUHHDSpRRyv1+2MvyDTQaDp4Pw5tQPBIAsaNeLpKbFvkRFi2sKE
 zKdY+NgcIduDDOWphmLh+mFvo3RXLVSsa3yKbQd9eBExN622o+NyzK4ytb9rLp6L/ByE9Q
 0I7hnZCZyU5oAOXb0uixzeS90BP36vcb30lb/cLcj61DyIQT7cZd7h6fp9GRD87+Eoqdgc
 RMtkAMEgsy8igmm2iiUDNHjIK9z3EgtyR9lLhqwl/QaDxo6bJRuC0pQ8tKGa6w==
Date: Tue, 4 Nov 2025 11:24:05 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH 08/10] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Message-ID: <20251104-sandal-playset-6f4ad0665c7b@thorsis.com>
Mail-Followup-To: Josua Mayer <josua@solid-run.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
References: <20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com>
 <20251027-imx8mp-hb-iiot-v1-8-683f86357818@solid-run.com>
 <2c54b7b7-4eb4-44a0-8025-8da16a28efd4@solid-run.com>
 <20251029-jittery-ambiguity-14e03ad2f0df@thorsis.com>
 <054eecb5-1296-4c41-ae86-1779abe0360c@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <054eecb5-1296-4c41-ae86-1779abe0360c@solid-run.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Tue, 04 Nov 2025 17:13:18 +0000
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

Hello Josua,

Am Thu, Oct 30, 2025 at 04:44:40PM +0000 schrieb Josua Mayer:
> Hi Alex,
> 
> Am 29.10.25 um 10:23 schrieb Alexander Dahl:
> > Hello Josua,
> >
> > Am Tue, Oct 28, 2025 at 12:24:36PM +0000 schrieb Josua Mayer:
> >> Am 27.10.25 um 18:48 schrieb Josua Mayer:
> >>
> >>> Add description for the SolidRun i.MX8MP HummingBoard IIoT.
> >>> The board is a new design around the i.MX8MP System on Module, not
> >>> sharing much with previous HummingBoards.
> >>>
> >>> It comes with some common features:
> >>> - 3x USB-3.0 Type A connector
> >>> - 2x 1Gbps RJ45 Ethernet
> >>> - USB Type-C Console Port
> >>> - microSD connector
> >>> - RTC with backup battery
> >>> - RGB Status LED
> >>> - 1x M.2 M-Key connector with PCI-E Gen. 3 x1
> >>> - 1x M.2 B-Key connector with USB-2.0/3.0 + SIM card holder
> >>> - 1x LVDS Display Connector
> >>> - 1x DSI Display Connector
> >>> - GPIO header
> >>> - 2x RS232/RS485 ports (configurable)
> >>> - 2x CAN
> >>>
> >>> In addition there is a board-to-board expansion connector to support
> >>> custom daughter boards with access to SPI, a range of GPIOs and -
> >>> notably - CAN and UART. Both 2x CAN and 2x UART can be muxed either
> >>> to this b2b connector, or a termianl block connector on the base board.
> >>>
> >>> The routing choice for UART and CAN is expressed through gpio
> >>> mux-controllers in DT and can be changed by applying dtb addons.
> >>>
> >>> Four dtb addons are provided:
> >>>
> >>> - dsi panel Winstar WJ70N3TYJHMNG0
> >>> - lvds panel Winstar WF70A8SYJHLNGA
> >>> - RS485 on UART port "A" (default rs232)
> >>> - RS485 on UART port "B" (default rs232)
> >>>
> >>> Signed-off-by: Josua Mayer <josua@solid-run.com>
> >>> ---
> >>>  arch/arm64/boot/dts/freescale/Makefile             |   6 +
> >>>  ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |  70 ++
> >>>  ...ummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso | 105 +++
> >>>  .../imx8mp-hummingboard-iiot-rs485-a.dtso          |  18 +
> >>>  .../imx8mp-hummingboard-iiot-rs485-b.dtso          |  18 +
> >>>  .../dts/freescale/imx8mp-hummingboard-iiot.dts     | 710 +++++++++++++++++++++
> >>>  6 files changed, 927 insertions(+)
> >> cut
> >>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts
> >>> new file mode 100644
> >>> index 0000000000000..2e4cb676bc9da
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts
> >> cut
> >>> +	led-controller@30 {
> >>> +		compatible = "ti,lp5562";
> >>> +		reg = <0x30>;
> >>> +		/* use internal clock, could use external generated by rtc */
> >>> +		clock-mode = /bits/ 8 <1>;
> >>> +		#address-cells = <1>;
> >>> +		#size-cells = <0>;
> >>> +
> >>> +		multi-led@0 {
> >>> +			reg = <0x0>;
> >>> +			color = <LED_COLOR_ID_RGB>;
> >>> +			#address-cells = <1>;
> >>> +			#size-cells = <0>;
> >>> +
> >>> +			led@0 {
> >>> +				reg = <0x0>;
> >>> +				color = <LED_COLOR_ID_RED>;
> >>> +				led-cur = /bits/ 8 <0x32>;
> >>> +				max-cur = /bits/ 8 <0x64>;
> >>> +			};
> >>> +
> >>> +			led@1 {
> >>> +				reg = <0x1>;
> >>> +				color = <LED_COLOR_ID_GREEN>;
> >>> +				led-cur = /bits/ 8 <0x19>;
> >>> +				max-cur = /bits/ 8 <0x32>;
> >>> +			};
> >>> +
> >>> +			led@2 {
> >>> +				reg = <0x2>;
> >>> +				color = <LED_COLOR_ID_BLUE>;
> >>> +				led-cur = /bits/ 8 <0x19>;
> >>> +				max-cur = /bits/ 8 <0x32>;
> >>> +			};
> >>> +		};
> >>> +
> >>> +		led@3 {
> >>> +			reg = <3>;
> >>> +			chan-name = "D8";
> >> chan-name gives the led the name D6 in sysfs.
> >>
> >> The bindings do not allow however setting chan-name on
> >> the multi-led, and it has an auto-generated name in sysfs.
> >>
> >> Am I missing something? Can multi-leds have a custom name?
> > The sysfs names are auto-generated based on the attributes "color",
> > "function", and "label" with the last being discouraged for new
> > designs.
> Thank you for reminding me of this one!
> > If the "ti,lp5562" driver does nothing special,you could
> > add "function" to the multi-led node and see if that fits your needs.
> The board is not a complete product by itself so we have not chosen
> a specific function for each led.
> Therefore only color and label are actually applicable.

In such cases I use a generic function and the enumerator,
something like this (in this case for a different led driver):

    led_11_red: led-0 {
            function = LED_FUNCTION_INDICATOR;
            function-enumerator = <0>;
            color = <LED_COLOR_ID_RED>;
            gpios = <&pioC 18 GPIO_ACTIVE_HIGH>;
    };

…

    led_13_red: led-2 {
            function = LED_FUNCTION_INDICATOR;
            function-enumerator = <1>;
            color = <LED_COLOR_ID_RED>;
            gpios = <&pioC 20 GPIO_ACTIVE_HIGH>;
    };

This gives stable sysfs paths like this:

  /sys/class/leds/red:indicator-0
  /sys/class/leds/red:indicator-1

Of course only with a LED driver supporting that automatic naming
scheme.

> After testing on v6.18-rc1 I can state that leds-lp5562 driver does
> something special - function and label properties do not have any
> impact on the names in sysfs.
> 
> However I could set label on both LEDs regardless?

When using the 'label' attribute, color and function attributes are
more or less informational only, because label determines the sysfs
path.  Someone could change the leds-lp5562 driver to behave like the
other drivers, but then I would advise to explicitly set label in this
case, so you won't end up with changed sysfs paths after the driver is
changed.

Not sure if this helps you.  Sorry.

Greets
Alex

> 
> >
> > Adding linux-leds to Cc, because this is a LED related question.
> >
> > Greets
> > Alex
> >
> >> In v6.6 leds-lp5562 driver if I set in each multi-led led@[0-2] sub-node
> >> chan-name to the same string "D7" - then the sysfs name becomes D7.
> >>
> >>> +			color = <LED_COLOR_ID_GREEN>;
> >>> +			led-cur = /bits/ 8 <0x19>;
> >>> +			max-cur = /bits/ 8 <0x64>;
> >>> +		};
> >>> +	};
