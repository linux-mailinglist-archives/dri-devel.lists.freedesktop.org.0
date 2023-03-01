Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F61B6A6923
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 09:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC9B10E0A9;
	Wed,  1 Mar 2023 08:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E961F10E0A9
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 08:52:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5A9866121F;
 Wed,  1 Mar 2023 08:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 858A7C433D2;
 Wed,  1 Mar 2023 08:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677660774;
 bh=6c6cP/IHyRsWowu2tZHcz9eWebeuuAH5j8u2NP4wnVo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ed999CG6d0eqg2KNSuFTYXnvp/Q1rvY1tRn4mnKA4qF8ZX8PN1/WRkwarGFe3iqCM
 pYHJVUDK6wZLZ/mGQD7NQAvj5FsLhd6M5DbTR9Z/eISLk2eLEATdrzaJcAIwfiCHrM
 +r4R+094Rn0yoanJXQ/s20157NcE7X+yPNos8t2UHzpO3F8DCDxmpfpFQJyntUFIA0
 e/aUT4GqmU0iSpooRfo62rBs/bYFTFogO7/QauFLK4pABdzo+bpArlplZdPH2/45nd
 Mlq/RI7xFBVNMdDKz87VMGoCD7gHidR4Z+8aiV+Yv/zp9lO9EqCQ9JTqbukJeqT5Qg
 8Vqy64XZU8Lww==
Date: Wed, 1 Mar 2023 08:52:44 +0000
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Fix SPI and I2C bus node names in examples
Message-ID: <Y/8SXMHQtv6Er1Xx@google.com>
References: <20230228215433.3944508-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
 Sam Ravnborg <sam@ravnborg.org>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Chanwoo Choi <cw00.choi@samsung.com>,
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

On Tue, 28 Feb 2023, Rob Herring wrote:

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

[...]

>  .../devicetree/bindings/leds/issi,is31fl319x.yaml |  2 +-
>  .../devicetree/bindings/leds/leds-aw2013.yaml     |  2 +-
>  .../devicetree/bindings/leds/leds-rt4505.yaml     |  2 +-
>  .../devicetree/bindings/leds/ti,tca6507.yaml      |  2 +-

Acked-by: Lee Jones <lee@kernel.org>

>  .../devicetree/bindings/mfd/actions,atc260x.yaml  |  2 +-
>  .../devicetree/bindings/mfd/google,cros-ec.yaml   |  6 +++---
>  .../devicetree/bindings/mfd/ti,tps65086.yaml      |  2 +-
>  .../devicetree/bindings/mfd/x-powers,axp152.yaml  |  4 ++--
>  .../devicetree/bindings/net/asix,ax88796c.yaml    |  2 +-

Acked-by: Lee Jones <lee@kernel.org>

[...]

-- 
Lee Jones [李琼斯]
