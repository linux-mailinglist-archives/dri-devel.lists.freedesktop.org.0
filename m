Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9A79BCEF8
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 15:19:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93ADD10E5B6;
	Tue,  5 Nov 2024 14:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gE6oQ7H0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC22110E10B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 14:19:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AB1C3A4329C;
 Tue,  5 Nov 2024 14:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33020C4CECF;
 Tue,  5 Nov 2024 14:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730816342;
 bh=yDEteXzj+wkANYRbZ2/8j1vE3zjlLibNLSifgq7pYSk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gE6oQ7H0EUgsS1B6FvmY2KI383i+2h3gtC3TXwM/hyZ0xw/jiwV5FyvyD1m9etQGV
 3j9AMRtvabcHfLWYJBuk+JdihA33Tklk5w5lY0qIafeZNQeEzk6N5yXLOc0OG1kHO9
 F++j/XhFppmDr230G6um/9knosDBrT9peFmEsx9HKbJYZ8lsBieNbgUmMDgh+7+nag
 t9ULd3afMcwLEH44KhOPTfXspCyEqp++CTFLGtkzSX6hkYIlYrav0qz1gjgw0GtlL+
 CNDV5LKXUJ8a3dkvA6J8dkHD7zmglXr5LkhCz5GIbQtZ9iYdESgzbHTpQd6RoNGAqe
 Evcp5MLdH8RNg==
Date: Tue, 5 Nov 2024 08:19:00 -0600
From: Rob Herring <robh@kernel.org>
To: Hironori KIKUCHI <kikuchan98@gmail.com>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Ryan Walklin <ryan@testtoast.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: display: panel: Rename
 rg35xx-plus-panel back to WL-355608-A8
Message-ID: <20241105141900.GA3110982-robh@kernel.org>
References: <20241105055239.1577275-1-kikuchan98@gmail.com>
 <20241105055239.1577275-2-kikuchan98@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105055239.1577275-2-kikuchan98@gmail.com>
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

On Tue, Nov 05, 2024 at 02:52:29PM +0900, Hironori KIKUCHI wrote:
> A panel assembly is changed in the recent revision of Anbernic RG35XX
> Plus, so the `anbernic,rg35xx-plus-panel` identifier is neither suitable
> nor unique for the panel anymore.
> 
> Fortunately, the panel can be distinguished by a label printed on the
> FPC cable, so use the label "WL-355608-A8" as an identifier instead.
> 
> Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
> ---
>  ...rg35xx-plus-panel.yaml => anbernic,wl-355608-a8.yaml} | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>  rename Documentation/devicetree/bindings/display/panel/{anbernic,rg35xx-plus-panel.yaml => anbernic,wl-355608-a8.yaml} (83%)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/anbernic,rg35xx-plus-panel.yaml b/Documentation/devicetree/bindings/display/panel/anbernic,wl-355608-a8.yaml
> similarity index 83%
> rename from Documentation/devicetree/bindings/display/panel/anbernic,rg35xx-plus-panel.yaml
> rename to Documentation/devicetree/bindings/display/panel/anbernic,wl-355608-a8.yaml
> index 1d67492ebd3..5e8afbea690 100644
> --- a/Documentation/devicetree/bindings/display/panel/anbernic,rg35xx-plus-panel.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/anbernic,wl-355608-a8.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/display/panel/anbernic,rg35xx-plus-panel.yaml#
> +$id: http://devicetree.org/schemas/display/panel/anbernic,wl-355608-a8.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Anbernic RG35XX series (WL-355608-A8) 3.5" 640x480 24-bit IPS LCD panel
> @@ -16,13 +16,14 @@ allOf:
>  properties:
>    compatible:
>      oneOf:
> -      - const: anbernic,rg35xx-plus-panel
> +      - const: anbernic,wl-355608-a8
>        - items:
>            - enum:
>                - anbernic,rg35xx-2024-panel
>                - anbernic,rg35xx-h-panel
>                - anbernic,rg35xx-sp-panel
> -          - const: anbernic,rg35xx-plus-panel
> +              - anbernic,rg35xx-plus-panel
> +          - const: anbernic,wl-355608-a8
>  
>    reg:
>      maxItems: 1
> @@ -47,7 +48,7 @@ examples:
>          #size-cells = <0>;
>  
>          panel@0 {
> -            compatible = "anbernic,rg35xx-plus-panel";
> +            compatible = "anbernic,wl-355608-a8";

This is an ABI break. You can't just change compatibles.

The old panel should correspond to the existing compatible. Add a new 
compatible for the new panel. The names might not be ideal, but you are 
stuck with them.

There's exceptions if things are new and not yet in use, but you have to 
explain that in the commit msg.

Rob
