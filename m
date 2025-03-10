Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7016A594AF
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 13:40:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB4C89B78;
	Mon, 10 Mar 2025 12:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OU7eweTU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A42589B78
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 12:40:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4D2FBA45B73;
 Mon, 10 Mar 2025 12:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE40BC4CEF0;
 Mon, 10 Mar 2025 12:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741610416;
 bh=H8MkukXKrs1gXyaQdWlj/mYQZibbo5Fhpikh/80QqZk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OU7eweTUodKoVT9kzSHOX2+bCR2sRfjGewUj0AL42sokgzxf+zbLLoCvkUBRMkYHr
 YqnVHTLHzG8wBV9cQFVqvTFOfjOWP5vIlPsnRotGJQD5OIbBlvPQDqO7Xsuf/L0heg
 Frq89NR/lx7PZ39bM3gmfQgOjzXS3ZrX95CjIZn3m+32cf8DBqseFi667hvz6QONN3
 hVb2aCfOLeMOHgO6/Jb+ffvfv0m/foHouvTQ44LvzUaBYY1TN0f8Fls4iOUWjThlqE
 BgK6bUDdsTF8X3lA7uovbQc3BT/2WTsUg33dxKagtAxdQOjCUFzc1bjTfJhfdQz230
 mxjaGxJJgTEkw==
Date: Mon, 10 Mar 2025 07:40:14 -0500
From: Rob Herring <robh@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 05/11] dt-bindings: allwinner: add H616 DE33 bus binding
Message-ID: <20250310124014.GA3866055-robh@kernel.org>
References: <20250310092345.31708-1-ryan@testtoast.com>
 <20250310092345.31708-6-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310092345.31708-6-ryan@testtoast.com>
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

On Mon, Mar 10, 2025 at 10:09:51PM +1300, Ryan Walklin wrote:
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
> 
> Add a display engine bus binding for the DE33 and increase reg maxItems
> to 3 to accommodate additional register blocks.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> 
> ---
> Changelog v1..v2:
> - Correct DE2 bus enum to reflect fallback devices accurately.
> 
> Changelog v2..v3:
> - Separate content into three patches for three separate subsystems
> 
> Changelog v5..v6:
> - Increase reg maxItems to 3.
> ---
>  .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml  | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> index 9845a187bdf6..317a27cf590b 100644
> --- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> +++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> @@ -24,11 +24,14 @@ properties:
>      oneOf:
>        - const: allwinner,sun50i-a64-de2
>        - items:
> -          - const: allwinner,sun50i-h6-de3
> +          - enum:
> +              - allwinner,sun50i-h6-de3
> +              - allwinner,sun50i-h616-de33
>            - const: allwinner,sun50i-a64-de2
>  
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 3

You have to define what each region is and the order.

And there should be constraints such that the existing cases don't 
now allow 2-3 entries.

>  
>    allwinner,sram:
>      description:
> -- 
> 2.48.1
> 
