Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD1DA42A74
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 18:56:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1448210E159;
	Mon, 24 Feb 2025 17:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 81CBF10E159
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 17:56:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7991B152B;
 Mon, 24 Feb 2025 09:57:06 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D9C63F5A1;
 Mon, 24 Feb 2025 09:56:46 -0800 (PST)
Date: Mon, 24 Feb 2025 17:56:42 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Chris
 Morgan <macroalpha82@gmail.com>, Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Conor Dooley
 <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 22/27] dt-bindings: allwinner: add H616 DE33 mixer
 binding
Message-ID: <20250224175642.170c124e@donnerap.manchester.arm.com>
In-Reply-To: <20250216183710.8443-23-ryan@testtoast.com>
References: <20250216183710.8443-3-ryan@testtoast.com>
 <20250216183710.8443-23-ryan@testtoast.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 17 Feb 2025 07:36:22 +1300
Ryan Walklin <ryan@testtoast.com> wrote:

Hi,

> The Allwinner H616 and variants have a new display engine revision
> (DE33).
> 
> The mixer configuration registers are significantly different to the DE3
> and DE2 revisions, being split into separate top and display blocks,
> therefore a fallback for the mixer compatible is not provided.
> 
> Add a display engine mixer binding for the DE33.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> 
> ---
> Changelog v2..v3:
> - Separate content into three patches for three separate subsystems
> 
> Changelog v5..v6:
> - increase reg maxItems to 3 and add conditional for h616-de33
> ---
>  .../allwinner,sun8i-a83t-de2-mixer.yaml       | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> index b75c1ec686ad2..274f5e6327333 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> @@ -24,9 +24,11 @@ properties:
>        - allwinner,sun50i-a64-de2-mixer-0
>        - allwinner,sun50i-a64-de2-mixer-1
>        - allwinner,sun50i-h6-de3-mixer-0
> +      - allwinner,sun50i-h616-de33-mixer-0
>  
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 3

What are those three regions? I wonder if we should have reg-names here,
to fix the order, and to document them on the way?

>  
>    clocks:
>      items:
> @@ -61,6 +63,23 @@ properties:
>      required:
>        - port@1
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - allwinner,sun50i-h616-de33-mixer-0
> +
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 3

Should we override minItems here as well? I guess any driver would need
all three region to work?

Cheers,
Andre

> +
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 1
> +
>  required:
>    - compatible
>    - reg

