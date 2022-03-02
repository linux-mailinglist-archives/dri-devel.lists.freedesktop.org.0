Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EADE4C9B56
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 03:46:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96BC10E609;
	Wed,  2 Mar 2022 02:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07EB10E609
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 02:46:06 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 6-20020a4a0906000000b0031d7eb98d31so427145ooa.10
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 18:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wjdqSaPpltqhLridozcEUTEQoIYV6/3L4YmJnQ5z0lY=;
 b=LN9nnhqICRhttXAVr1od9T1t/Ymtpxhtz4tHsjH3dYjcd3Rkq9C9wMhSXlkrlSYC1A
 DlJ/JptFxg1yVABD2c1AkWjsPC7Du3KLmBhl0PmcAe7J/mlUk1cp6g/yIWvbZRRK/ixo
 +bm5IDVzJdC4fxWuoEI4G5CHndK46TO9kW9KbAaQI641rdN+rU1dvb6VBLEpmuuVwgUt
 80QLDod/jgV5iicQ0WoUYh+G5NUspA9Y6GZrYqrOz6zP3KBF8+B00J/JX/kKtJbsLcZw
 Nn9Y0EtKII81vB9nbqmK7v/AXIDRsz2QxYS4EGE2oGDGOXpVkmABqBHnLwBv01oaAEdI
 u6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wjdqSaPpltqhLridozcEUTEQoIYV6/3L4YmJnQ5z0lY=;
 b=SSid0xCmZZoWfcEaz+BdJR2aTKSpqA5VD31vD0DkzXvse3+oPzTikKIDDlxJui/RvN
 XiS0kMHDL5LgSr8WESu29G7jNBXiMKMCRZgB23AEIN/LJrhNM827u602lyHjib2pTgIa
 gouJ2Wi6JvoQQ4fK7ZpHKjmd9pybrHd49Imhc2ycKWCpyvQSqr2JgLvyoxQbylkhZq08
 UPr2n1OuRR6F+VJPnjbCZ5oUflLCEWraH6c6hDboRnT1rx8SddxklMP1wS3b5ftutVKb
 ovoSxPG9UQZqJpw9uY4N/hbViGGJdnAnAPoF3pZgtu1ECNxgZWkQeQyGIMtbPnsoJiBx
 VU2g==
X-Gm-Message-State: AOAM531lSlHefKJ2+OfXuumVPti4lPWMXhXlrr8ugKiyAk1Bd7DgUyXK
 U2qqA9/MC964qPbkbZMX7v62TQ==
X-Google-Smtp-Source: ABdhPJyABJwssvqzs0MiuFje5MNOUuD4BXQpc8Bd2B6R1kdb3joprE0iJZUcrLXMN5kygRaNyqLzdA==
X-Received: by 2002:a05:6820:1396:b0:31c:59f4:2fe4 with SMTP id
 i22-20020a056820139600b0031c59f42fe4mr13722344oow.10.1646189166017; 
 Tue, 01 Mar 2022 18:46:06 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 23-20020a9d0b97000000b005ad33994e93sm7196700oth.31.2022.03.01.18.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 18:46:05 -0800 (PST)
Date: Tue, 1 Mar 2022 18:47:56 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Another pass removing cases of 'allOf'
 containing a '$ref'
Message-ID: <Yh7a3Gl6PPamTjY5@ripper>
References: <20220228213802.1639658-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
 Vignesh Raghavendra <vigneshr@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, linux-phy@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Guenter Roeck <groeck@chromium.org>, Lee Jones <lee.jones@linaro.org>,
 linux-leds@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Richard Weinberger <richard@nod.at>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 28 Feb 13:38 PST 2022, Rob Herring wrote:

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
>  .../devicetree/bindings/mtd/nand-controller.yaml  |  8 +++-----
>  .../bindings/mtd/rockchip,nand-controller.yaml    |  3 +--
>  .../devicetree/bindings/net/ti,cpsw-switch.yaml   |  3 +--
>  .../bindings/phy/phy-stm32-usbphyc.yaml           |  3 +--
>  .../bindings/power/supply/sbs,sbs-manager.yaml    |  4 +---
>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml      |  3 +--

For the remoteproc binding:

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks,
Bjorn
