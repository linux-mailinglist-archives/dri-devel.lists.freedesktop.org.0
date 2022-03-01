Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4084C88A7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 10:58:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 339E510ED64;
	Tue,  1 Mar 2022 09:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6CD610ED64
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 09:58:39 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id y5so7208259wmi.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 01:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ezdeTFdrJTsDEenywDPHfcLnhNipBCHF9MXHMNmg8uE=;
 b=V2OTBoFu/3u2MYQvlXN4XFA5Mpc0sw3VVP6kB35gAmpBt4CBakEr+BEajFVumt4As4
 0YJzO8ZkJSWBwhRj8Uy59RUU3v/hwzbgxduT2I1y1xX6HI1gg41aETpQIUdjxh7ZnBz4
 HhdMQcg8+L7O8eux9r9AapKed4y6D46u2n+k9nwiZpMaa2tu8mfi2s4ZCxAcFvaUN+tp
 HrzR1JisJxyRdZ3wNr04C/4Vuj0omTcfD+rfi5DwD/mU4leNbAbXNJMtNPKsu3bNCRus
 eGsPP4EAXhwGxUe8HQ9DLeSwcxn2uyLPYqzmE2imgxG0kXR+Hov/16dL3PxdUfxU3h53
 VE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ezdeTFdrJTsDEenywDPHfcLnhNipBCHF9MXHMNmg8uE=;
 b=iAmZYEuGM4HF3itN9vggBf6VshxR0HT1UqZDNl+DDlKGTmTOi7JqbtVHjm3SIMMMR7
 eQNdk7CmtMTjecxx4ic5KQVz1gnfZoYW/+XgxaOP+oxEQ7YlHhqjhgM8JqgKF3GopX9Z
 DMpswmaZ8StwmUIaeybm5qrZr8SCW+sFPsidf0i1A4/cz9CcOxA3MAsPlwLuZGNufap/
 eWq8Fc0Nr/dOJeaIx++RE6lW+Gm1+vsOlOlZrQhkwiOgtmekW+XDfo6tUwauwgHyBl7W
 kSaTnZ90xLM86n49baMuDLqQE8jA7FDcz75PKSy/JmSNHDo23n38F5RNeoiOmWeI2SFi
 VbwA==
X-Gm-Message-State: AOAM530csXxllBTq9ylL+1VuPAz4T94Vby6A40k7eIb+Kt6AKBQs5c+k
 MiW7KU1f0fZFz3k9szxbiAoSHQ==
X-Google-Smtp-Source: ABdhPJyd3JL277KFZFJnNY8vNt+J/UADyqWySP9nrfMl9nw+JMafV9kv9enuyMZSjvJi9JFM8u0lYg==
X-Received: by 2002:a1c:29c6:0:b0:381:51d6:9afe with SMTP id
 p189-20020a1c29c6000000b0038151d69afemr9268826wmp.0.1646128718201; 
 Tue, 01 Mar 2022 01:58:38 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 r186-20020a1c2bc3000000b0037bdd94a4e5sm1955820wmr.39.2022.03.01.01.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 01:58:37 -0800 (PST)
Date: Tue, 1 Mar 2022 09:58:34 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Another pass removing cases of 'allOf'
 containing a '$ref'
Message-ID: <Yh3uSifwByjQWpyO@google.com>
References: <20220228213802.1639658-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220228213802.1639658-1-robh@kernel.org>
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
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-remoteproc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 linux-phy@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Guenter Roeck <groeck@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-leds@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Richard Weinberger <richard@nod.at>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Feb 2022, Rob Herring wrote:

> Another pass at removing unnecessary use of 'allOf' with a '$ref'.
> 
> json-schema versions draft7 and earlier have a weird behavior in that
> any keywords combined with a '$ref' are ignored (silently). The correct
> form was to put a '$ref' under an 'allOf'. This behavior is now changed
> in the 2019-09 json-schema spec and '$ref' can be mixed with other
> keywords.
> 
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-leds@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> Cc: netdev@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-spi@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/connector/usb-connector.yaml         |  3 +--
>  .../bindings/display/brcm,bcm2711-hdmi.yaml       |  3 +--
>  .../bindings/display/bridge/adi,adv7511.yaml      |  5 ++---
>  .../bindings/display/bridge/synopsys,dw-hdmi.yaml |  5 ++---
>  .../bindings/display/panel/display-timings.yaml   |  3 +--
>  .../devicetree/bindings/display/ste,mcde.yaml     |  4 ++--
>  .../devicetree/bindings/input/adc-joystick.yaml   |  9 ++++-----
>  .../bindings/leds/cznic,turris-omnia-leds.yaml    |  3 +--
>  .../devicetree/bindings/leds/leds-lp50xx.yaml     |  3 +--

>  .../devicetree/bindings/mfd/google,cros-ec.yaml   | 12 ++++--------

Go for it.

Acked-by: Lee Jones <lee.jones@linaro.org>

>  .../devicetree/bindings/mtd/nand-controller.yaml  |  8 +++-----
>  .../bindings/mtd/rockchip,nand-controller.yaml    |  3 +--
>  .../devicetree/bindings/net/ti,cpsw-switch.yaml   |  3 +--
>  .../bindings/phy/phy-stm32-usbphyc.yaml           |  3 +--
>  .../bindings/power/supply/sbs,sbs-manager.yaml    |  4 +---
>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml      |  3 +--
>  .../devicetree/bindings/soc/ti/ti,pruss.yaml      | 15 +++------------
>  .../devicetree/bindings/sound/st,stm32-sai.yaml   |  3 +--
>  .../devicetree/bindings/sound/tlv320adcx140.yaml  | 13 ++++++-------
>  .../devicetree/bindings/spi/spi-controller.yaml   |  4 +---
>  .../devicetree/bindings/usb/st,stusb160x.yaml     |  4 +---
>  21 files changed, 39 insertions(+), 74 deletions(-)

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
