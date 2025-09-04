Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C631B449F3
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 00:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3066210E03E;
	Thu,  4 Sep 2025 22:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="roBVwgBQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568CB10E03E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 22:52:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 25C4560195;
 Thu,  4 Sep 2025 22:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38DDFC4CEF0;
 Thu,  4 Sep 2025 22:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757026343;
 bh=2MViS1nqSpyNjI/P7K/k2Spz+R3IZ3I4vxgoMymb5Uo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=roBVwgBQdHjRYDAC6Yyl8gcjTa1sebepK19RtdZM5Kr+BJYNj5zWJeB02etY8KIyI
 b+RcIMOwSoGmpxXqnXcfjEYxksz+RXpt+pf2VjEB1VgJcIRHBceav+UIWYbNx2fE3K
 7+WEHceX9Cz41lRwl8VloRIumOdI4m0IKDa6VphbPJDeULrt3x0bJuAUukQ6/WKuL0
 REQt3WpNlSm3UUve2h7bV157b/yJ+NQBKzl9CGFniIjjyb7AShIWGiI11Zck6rcSys
 VyQI9wmTi+B2BLN4VmdvCQSrI8EEXTLBevvUrwyGOOOrG/WVf+G3vDakrZ7qQCvomP
 m3ZuahDyWvLeg==
Date: Fri, 5 Sep 2025 00:52:20 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Hector Martin <marcan@marcan.st>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>,
 Lee Jones <lee@kernel.org>, 
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
 Michael Turquette <mturquette@baylibre.com>,
 Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, 
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-sound@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-nvme@lists.infradead.org
Subject: Re: [PATCH 10/37] dt-bindings: i2c: apple,i2c: Add apple,t6020-i2c
 compatible
Message-ID: <f5o23zrqe2ei3bmwlxokhtkgfpeki6ctoq3ahd4f66utfu5hdk@6q55hvy4hvq4>
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
 <20250828-dt-apple-t6020-v1-10-507ba4c4b98e@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-dt-apple-t6020-v1-10-507ba4c4b98e@jannau.net>
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

Hi Janne,

On Thu, Aug 28, 2025 at 04:01:29PM +0200, Janne Grunau wrote:
> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatible "apple,i2c" anymore [1]. Use
> "apple,t8103-i2c" as fallback compatible as it is the SoC the driver
> and bindings were written for.
> 
> This block is compatible with t8103, so just add the new per-SoC
> compatible using apple,t8103-i2c as base.
> 
> [1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/
> 
> Signed-off-by: Janne Grunau <j@jannau.net>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Andi

> ---
>  .../devicetree/bindings/i2c/apple,i2c.yaml         | 27 +++++++++++++---------
>  1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> index fed3e1b8c43f67b8f5a19e5c1e046b0e17ab8017..500a965bdb7a84e4997b52e8c19dcc1a7ee0cff7 100644
> --- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> @@ -20,17 +20,22 @@ allOf:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - apple,s5l8960x-i2c
> -          - apple,t7000-i2c
> -          - apple,s8000-i2c
> -          - apple,t8010-i2c
> -          - apple,t8015-i2c
> -          - apple,t8103-i2c
> -          - apple,t8112-i2c
> -          - apple,t6000-i2c
> -      - const: apple,i2c
> +    oneOf:
> +      - items:
> +          - const: apple,t6020-i2c
> +          - const: apple,t8103-i2c
> +      - items:
> +          - enum:
> +              # Do not add additional SoC to this list.
> +              - apple,s5l8960x-i2c
> +              - apple,t7000-i2c
> +              - apple,s8000-i2c
> +              - apple,t8010-i2c
> +              - apple,t8015-i2c
> +              - apple,t8103-i2c
> +              - apple,t8112-i2c
> +              - apple,t6000-i2c
> +          - const: apple,i2c
>  
>    reg:
>      maxItems: 1
> 
> -- 
> 2.51.0
> 
