Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 396DD30D86F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 12:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A276EA77;
	Wed,  3 Feb 2021 11:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E6F6EA77
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 11:22:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B73E164DE8;
 Wed,  3 Feb 2021 11:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612351346;
 bh=wGQw7gT3qnKCIXEO+rxqRvVbPbNtV92xRV2Pv+Ej3+o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MrJAtf5mnK1C4Q4ZyKjla2kAdXf633/lnbrk7VmF4rTw8ELv9cY7AI3lYFHz5IvTs
 gW1JO8UMu0KWxpiE11pDElcoFi2aScKR/6EtEhTveStAUFXYmhZ/2VkMZcgd1/0YfE
 ni15CbrfkH0uB9TmCzEv5FfL+g5ymnw5CEbyZXJD4ppEFij+lOdgpYmtLPj5YnxQt2
 S89UXBGzveoZJe7weH0eyO7487Q9x29lPyzQEfs7eq9AcnO8mCcpuFXjNyVKHYr8yx
 p+BAk8A9gP2L8aa7Eyu5laiQUOjkYC5JRKTNmmv8FsKcsF1NgygkcixHo6F7gFSZQG
 dH3CVM+A3lgnQ==
Date: Wed, 3 Feb 2021 16:52:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: Fix errors in 'if' schemas
Message-ID: <20210203112222.GO2771@vkoul-mobl>
References: <20210202205544.24812-1-robh@kernel.org>
 <20210202205544.24812-3-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210202205544.24812-3-robh@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Vincent Cheng <vincent.cheng.xh@renesas.com>, dri-devel@lists.freedesktop.org,
 Tali Perry <tali.perry1@gmail.com>, Daniel Palmer <daniel@thingy.jp>,
 linux-i2c@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Will Deacon <will@kernel.org>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Joerg Roedel <joro@8bytes.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Joel Stanley <joel@jms.id.au>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, linux-gpio@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Avi Fishman <avifishman70@gmail.com>, Scott Branden <sbranden@broadcom.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Jeffery <andrew@aj.id.au>, iommu@lists.linux-foundation.org,
 linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02-02-21, 14:55, Rob Herring wrote:
> Properties in if/then schemas weren't getting checked by the meta-schemas.
> Enabling meta-schema checks finds several errors.
> 
> The use of an 'items' schema (as opposed to the list form) is wrong in
> some cases as it applies to all entries. 'contains' is the correct schema
> to use in the case of multiple entries.
> 
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: linux-crypto@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-leds@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/crypto/allwinner,sun8i-ce.yaml   | 3 +--
>  .../devicetree/bindings/display/brcm,bcm2835-hvs.yaml    | 2 +-
>  Documentation/devicetree/bindings/leds/ti,tca6507.yaml   | 1 +
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml  | 2 +-
>  Documentation/devicetree/bindings/phy/brcm,sata-phy.yaml | 3 +--
>  .../devicetree/bindings/phy/renesas,usb2-phy.yaml        | 5 ++---

For phy:

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
