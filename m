Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1456C8D521
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 09:23:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F81C10E0F3;
	Thu, 27 Nov 2025 08:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mvvIFTQS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB33910E0F3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 08:22:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5493643F38;
 Thu, 27 Nov 2025 08:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D197C4CEF8;
 Thu, 27 Nov 2025 08:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764231778;
 bh=FrDI2ieJqEBfuFRmvhVdPA0bMoE9b3ZQoHAErfl47D0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mvvIFTQSEm/78XVyalyb+RBNlDOj1u7ekd4vQAFRbP/SDE3lbDu8CIu00JcyFZ2af
 8pKAlwXHVwkcT/fEiLjwIQBgkTposFdi23KEwpOg84LOyokGTwsliUyhh5OkET/Pch
 gR38yPLuADhehUAma+ooUkgeWPfAsXLrTSjHK4A6JyoCZNPAI2mXEbD8GEu7wSA8IB
 42MXCbeEAJnI44CSFcWBXgr211OfCjBimRCsrO6FXN8UPe1NGcTFDM5f3HNX+cYgWX
 E528IaacO0YyLQ19ufgMxfGBLF8SjUGacmgRuVe2W9/llEKRIoyuYHBO5JA5Gjj1cx
 gmWjiGw/qr+4A==
Date: Thu, 27 Nov 2025 09:22:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Tony Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 02/21] dt-bindings: display: tilcdc: Add fifo-threshold
 property
Message-ID: <20251127-subtle-prophetic-corgi-68aab1@kuoka>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
 <20251126-feature_tilcdc-v1-2-49b9ef2e3aa0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251126-feature_tilcdc-v1-2-49b9ef2e3aa0@bootlin.com>
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

On Wed, Nov 26, 2025 at 06:35:44PM +0100, Kory Maincent (TI.com) wrote:
> Add the fifo-threshold property to control the DMA FIFO threshold level,
> which specifies the number of words that must be loaded before the DMA
> FIFO becomes ready.
> 
> This property is needed to support the da850-evm board configuration
> which requires a non-default FIFO threshold value. Currently, this value
> is specified through the deprecated ti,tilcdc,panel binding. Adding this
> property to the tilcdc binding allows for proper configuration while
> migrating away from the non-standard panel binding.
> 
> The default value is 8 words, with valid values being powers of 2 from
> 8 to 512.
> 
> Related commit: 55da73fa7a68c ("ARM: dts: davinci: da850-evm: Increase
> fifo threshold")

Please use syntax pointed out by checkpatch. The checkpatch error (not
even a warning) is there for reason, so we can apply filter/grep
easily.

> 
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
>  Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml
> index 34ac1fd04d5c6..bf6d506e25e17 100644
> --- a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml
> +++ b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml
> @@ -46,6 +46,13 @@ properties:
>        The maximum pixel clock that can be supported by the lcd controller
>        in KHz.
>  
> +  fifo-threshold:

Why this is not deducible from the compatible? Feels like a specific SoC
issue.

Anyway, missing vendor prefix

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [8, 16, 32, 64, 128, 256, 512]
> +    description:
> +      Number of words loaded before the DMA fifo becomes ready. The default
> +      value is 8.

missing default and drop free form text in description.

> +
>    blue-and-red-wiring:
>      enum: [straight, crossed]
>      description:
> 
> -- 
> 2.43.0
> 
