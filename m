Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E336A8722
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 17:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D319A10E273;
	Thu,  2 Mar 2023 16:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5EA10E273
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 16:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=sAIc9DICHOwHXe3hoL0M1Cz46v91ph++acz6kjkneyk=;
 b=kDFUay36skYmps2/wdqt4fAH3ooPZbYWVp4pqBqM961wiZduj7P0xLgJw2P+NpMGf7kg1DoicLT6s
 g6l09K8HwL4RYQ8zGGoaFGn4km6zQYbAroP+EN+9HlyJrhV1W8t5cDqTAwscYUwdLDpYbIiHboO9rZ
 aMzoAa0S/vUdoj1kf/OGdJTZUpW+MrjaNGUTQavNWIRuYfGMKTi7Tl3hROfbZVtoTWtbKeUCJQ2L0I
 vgAjzdLxgJIXjLXCeRFb3ZpkshGAWy49N0muwOqA6SWUqwPx0aPY3DSGC5+6RFk99RSbDSFXHj01s6
 xLMWjzebL84uGzeen8v31LzBEjuhwEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=sAIc9DICHOwHXe3hoL0M1Cz46v91ph++acz6kjkneyk=;
 b=dTZtzyqF/jIMi0Zr3bfFJbyk3/PAmHQdX/XPn81EeMGXIgD+hYOJ9q2VlxqlJBJy6Rr6S2UsHglzv
 pur80rgBQ==
X-HalOne-ID: 943971d9-b919-11ed-babc-11abd97b9443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id 943971d9-b919-11ed-babc-11abd97b9443;
 Thu, 02 Mar 2023 16:45:06 +0000 (UTC)
Date: Thu, 2 Mar 2023 17:45:04 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Fix SPI and I2C bus node names in examples
Message-ID: <ZADSkGa6dK4H9p75@ravnborg.org>
References: <20230228215433.3944508-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228215433.3944508-1-robh@kernel.org>
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
Cc: alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Guenter Roeck <groeck@chromium.org>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Lee Jones <lee@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Miguel Ojeda <ojeda@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Kalle Valo <kvalo@kernel.org>, Wolfgang Grandegger <wg@grandegger.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob.

>  .../bindings/display/bridge/analogix,anx7625.yaml |  2 +-
>  .../bindings/display/bridge/anx6345.yaml          |  2 +-
>  .../bindings/display/bridge/lontium,lt8912b.yaml  |  2 +-
>  .../bindings/display/bridge/nxp,ptn3460.yaml      |  2 +-
>  .../bindings/display/bridge/ps8640.yaml           |  2 +-
>  .../bindings/display/bridge/sil,sii9234.yaml      |  2 +-
>  .../bindings/display/bridge/ti,dlpc3433.yaml      |  2 +-
>  .../bindings/display/bridge/toshiba,tc358762.yaml |  2 +-
>  .../bindings/display/bridge/toshiba,tc358768.yaml |  2 +-
>  .../bindings/display/panel/nec,nl8048hl11.yaml    |  2 +-
Acked-by: Sam Ravnborg <sam@ravnborg.org>



> index 669f70b1b4c4..8bd58913804a 100644
> --- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> @@ -226,7 +226,7 @@ unevaluatedProperties: false
>  
>  examples:
>    - |
> -    i2c1 {
> +    i2c {
>              #address-cells = <1>;
>              #size-cells = <0>;
>  
> @@ -239,7 +239,7 @@ examples:
>  
>              ssd1306_i2c: oled@3d {
>                      compatible = "solomon,ssd1306";
> -                    reg = <0x3c>;
> +                    reg = <0x3d>;
>                      pwms = <&pwm 4 3000>;
>                      reset-gpios = <&gpio2 7>;
>                      solomon,com-lrremap;

I can see this align the example with i2c-mux-gpio.yaml so the change
should be fine. I am just positive surprised the tooling caught it.

The change is
Acked-by: Sam Ravnborg <sam@ravnborg.org>

the above was just me thinking loud.

	Sam
