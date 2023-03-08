Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 310366B0A9E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 15:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE15310E5E1;
	Wed,  8 Mar 2023 14:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6876210E5E1
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 14:10:55 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-176261d7f45so18778408fac.11
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 06:10:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678284654;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BG0LVvFn1C/Da2Gc5O3YD8isCIsXrAwtxSQEVgE87AI=;
 b=UJL8uxwRecVfBQS45lxsIQWuWISOEeEryv0cpcWbyau/Gq3niURrNOEg7BuBBE/Uvm
 r6yS6/7SuvJ1gwwHulE+yLPM7RoVDP/lhAIqkc679C45SNEdqpUIzF+jWqVA1WJWHCcM
 /Z9RLyT7XQ4pM25HWH+r4JeRp+9gTjtr8MhItplirui85wgTKFcFgdgK289OrxhbEaAE
 9mrHj/yYp4wY2vM5L6RPoFtX4zku1un2loll82LfLltDEK0A8FTU3lVx1+MceNbHIeve
 40ArW/6uGMTxUxMlXKd1w0b399b1AX1WjhyjGW+2yoec7qg64tNsM/JuPnbjqGHA0ujq
 mb1g==
X-Gm-Message-State: AO0yUKULzQ9fLz1NbRapvMbtMZQ+jMaLjcjttz/GB3D32kVWaTielC2/
 lLFEUKYP1SJucHvaOfUGiQ==
X-Google-Smtp-Source: AK7set/cT2sp1M7e47IzQCQD2W8xtmPnZuAp+jI6K0s2N6oikhajQ93ypk71x4/YPZM2+Kr1qDFxTg==
X-Received: by 2002:a05:6871:b11:b0:176:3849:4e96 with SMTP id
 fq17-20020a0568710b1100b0017638494e96mr10140723oab.13.1678284654485; 
 Wed, 08 Mar 2023 06:10:54 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 f8-20020a9d2c08000000b00690dc5d9b9esm6498673otb.6.2023.03.08.06.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 06:10:54 -0800 (PST)
Received: (nullmailer pid 2719199 invoked by uid 1000);
 Wed, 08 Mar 2023 14:10:52 -0000
Date: Wed, 8 Mar 2023 08:10:52 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Fix SPI and I2C bus node names in examples
Message-ID: <167828463126.2715010.4541489267949266802.robh@kernel.org>
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
 Pavel Machek <pavel@ucw.cz>, Guenter Roeck <groeck@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Wolfgang Grandegger <wg@grandegger.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 28 Feb 2023 15:54:33 -0600, Rob Herring wrote:
> SPI and I2C bus node names are expected to be "spi" or "i2c",
> respectively, with nothing else, a unit-address, or a '-N' index. A
> pattern of 'spi0' or 'i2c0' or similar has crept in. Fix all these
> cases. Mostly scripted with the following commands:
> 
> git grep -l '\si2c[0-9] {' Documentation/devicetree/ | xargs sed -i -e 's/i2c[0-9] {/i2c {/'
> git grep -l '\sspi[0-9] {' Documentation/devicetree/ | xargs sed -i -e 's/spi[0-9] {/spi {/'
> 
> With this, a few errors in examples were exposed and fixed.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Wolfgang Grandegger <wg@grandegger.com>
> Cc: Kalle Valo <kvalo@kernel.org>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-clk@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-leds@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-can@vger.kernel.org
> Cc: linux-wireless@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-usb@vger.kernel.org
> ---
>  .../bindings/auxdisplay/holtek,ht16k33.yaml       |  2 +-
>  .../bindings/chrome/google,cros-ec-typec.yaml     |  2 +-
>  .../chrome/google,cros-kbd-led-backlight.yaml     |  2 +-
>  .../devicetree/bindings/clock/ti,lmk04832.yaml    |  2 +-
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
>  .../bindings/display/solomon,ssd1307fb.yaml       |  4 ++--
>  .../devicetree/bindings/eeprom/at25.yaml          |  2 +-
>  .../bindings/extcon/extcon-usbc-cros-ec.yaml      |  2 +-
>  .../bindings/extcon/extcon-usbc-tusb320.yaml      |  2 +-
>  .../devicetree/bindings/gpio/gpio-pca9570.yaml    |  2 +-
>  .../devicetree/bindings/gpio/gpio-pca95xx.yaml    |  8 ++++----
>  .../bindings/i2c/google,cros-ec-i2c-tunnel.yaml   |  2 +-
>  .../bindings/leds/cznic,turris-omnia-leds.yaml    |  2 +-
>  .../devicetree/bindings/leds/issi,is31fl319x.yaml |  2 +-
>  .../devicetree/bindings/leds/leds-aw2013.yaml     |  2 +-
>  .../devicetree/bindings/leds/leds-rt4505.yaml     |  2 +-
>  .../devicetree/bindings/leds/ti,tca6507.yaml      |  2 +-
>  .../bindings/media/i2c/aptina,mt9p031.yaml        |  2 +-
>  .../bindings/media/i2c/aptina,mt9v111.yaml        |  2 +-
>  .../devicetree/bindings/media/i2c/imx219.yaml     |  2 +-
>  .../devicetree/bindings/media/i2c/imx258.yaml     |  4 ++--
>  .../devicetree/bindings/media/i2c/mipi-ccs.yaml   |  2 +-
>  .../bindings/media/i2c/ovti,ov5648.yaml           |  2 +-
>  .../bindings/media/i2c/ovti,ov772x.yaml           |  2 +-
>  .../bindings/media/i2c/ovti,ov8865.yaml           |  2 +-
>  .../bindings/media/i2c/ovti,ov9282.yaml           |  2 +-
>  .../bindings/media/i2c/rda,rda5807.yaml           |  2 +-
>  .../bindings/media/i2c/sony,imx214.yaml           |  2 +-
>  .../bindings/media/i2c/sony,imx274.yaml           |  2 +-
>  .../bindings/media/i2c/sony,imx334.yaml           |  2 +-
>  .../bindings/media/i2c/sony,imx335.yaml           |  2 +-
>  .../bindings/media/i2c/sony,imx412.yaml           |  2 +-
>  .../devicetree/bindings/mfd/actions,atc260x.yaml  |  2 +-
>  .../devicetree/bindings/mfd/google,cros-ec.yaml   |  6 +++---
>  .../devicetree/bindings/mfd/ti,tps65086.yaml      |  2 +-
>  .../devicetree/bindings/mfd/x-powers,axp152.yaml  |  4 ++--
>  .../devicetree/bindings/net/asix,ax88796c.yaml    |  2 +-
>  .../bindings/net/can/microchip,mcp251xfd.yaml     |  2 +-
>  .../bindings/net/dsa/microchip,ksz.yaml           |  2 +-
>  .../bindings/net/nfc/samsung,s3fwrn5.yaml         |  2 +-
>  .../bindings/net/vertexcom-mse102x.yaml           |  2 +-
>  .../bindings/net/wireless/ti,wlcore.yaml          | 10 ++++++++--
>  .../devicetree/bindings/pinctrl/pinmux-node.yaml  |  2 +-
>  .../bindings/pinctrl/starfive,jh7100-pinctrl.yaml |  2 +-
>  .../devicetree/bindings/power/supply/bq2415x.yaml |  2 +-
>  .../devicetree/bindings/power/supply/bq24190.yaml |  2 +-
>  .../devicetree/bindings/power/supply/bq24257.yaml |  4 ++--
>  .../devicetree/bindings/power/supply/bq24735.yaml |  2 +-
>  .../devicetree/bindings/power/supply/bq2515x.yaml |  2 +-
>  .../devicetree/bindings/power/supply/bq25890.yaml |  2 +-
>  .../devicetree/bindings/power/supply/bq25980.yaml |  2 +-
>  .../devicetree/bindings/power/supply/bq27xxx.yaml | 15 ++++++++-------
>  .../bindings/power/supply/lltc,ltc294x.yaml       |  2 +-
>  .../bindings/power/supply/ltc4162-l.yaml          |  2 +-
>  .../bindings/power/supply/maxim,max14656.yaml     |  2 +-
>  .../bindings/power/supply/maxim,max17040.yaml     |  4 ++--
>  .../bindings/power/supply/maxim,max17042.yaml     |  2 +-
>  .../bindings/power/supply/richtek,rt9455.yaml     |  2 +-
>  .../bindings/power/supply/ti,lp8727.yaml          |  2 +-
>  .../bindings/regulator/active-semi,act8865.yaml   |  2 +-
>  .../regulator/google,cros-ec-regulator.yaml       |  2 +-
>  .../bindings/regulator/nxp,pf8x00-regulator.yaml  |  2 +-
>  .../devicetree/bindings/sound/everest,es8316.yaml |  2 +-
>  .../devicetree/bindings/sound/tas2562.yaml        |  2 +-
>  .../devicetree/bindings/sound/tas2770.yaml        |  2 +-
>  .../devicetree/bindings/sound/tas27xx.yaml        |  2 +-
>  .../devicetree/bindings/sound/tas5805m.yaml       |  2 +-
>  .../devicetree/bindings/sound/tlv320adcx140.yaml  |  2 +-
>  .../devicetree/bindings/sound/zl38060.yaml        |  2 +-
>  .../devicetree/bindings/usb/maxim,max33359.yaml   |  2 +-
>  .../bindings/usb/maxim,max3420-udc.yaml           |  2 +-
>  .../bindings/usb/mediatek,mt6360-tcpc.yaml        |  2 +-
>  .../devicetree/bindings/usb/richtek,rt1711h.yaml  |  2 +-
>  .../devicetree/bindings/usb/richtek,rt1719.yaml   |  2 +-
>  .../devicetree/bindings/usb/st,stusb160x.yaml     |  2 +-
>  .../devicetree/bindings/usb/ti,hd3ss3220.yaml     |  2 +-
>  .../devicetree/bindings/usb/ti,tps6598x.yaml      |  2 +-
>  86 files changed, 110 insertions(+), 103 deletions(-)
> 

Applied, thanks!

