Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20518C39A1F
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 09:48:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6349210E83F;
	Thu,  6 Nov 2025 08:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tmDL8kr5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9090710E83F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 08:48:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 370AB441DC;
 Thu,  6 Nov 2025 08:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870F6C116C6;
 Thu,  6 Nov 2025 08:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762418902;
 bh=zckLRNukcp03dx43dCWtDB8En+8nFsNdYJbK7sYTUZM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tmDL8kr51DyTy99fAvpjF42DJxyl9vb9C54R2cbSW/SrQCkL/yd26tEj/EqR5fJUg
 GBHKPly/rLMv1rz9xGwfnq1EIZGOty1sDFIzq5GJjH3MjsM6mkcgUXLwIK+eGnJimU
 4L+dI2D4MkmrqmigeBJbKcM1H4D6hs1lapYS61EYLJl2GdkBZjFjOieGcYW4UE+Z8n
 Jpl7mYbIC9qarWF7+lkGeyNPyAMrIijFJ01JyE23AtC3U+yYD234NQGhEN2j+NLw9W
 fWIcCkq/IHRZ4HzBSFFu0NwlMBxU38UlyGd0M7bvi36oiBo7EfRitObQbAy04zx329
 wKfQ72AQCzBww==
Date: Thu, 6 Nov 2025 09:48:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: panel: Add Samsung SOFEF00 DDIC with
 panel
Message-ID: <20251106-enlightened-centipede-of-tempering-3cfa50@kuoka>
References: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
 <20251104-sofef00-rebuild-v1-1-dfcfa17eb176@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251104-sofef00-rebuild-v1-1-dfcfa17eb176@ixit.cz>
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

On Tue, Nov 04, 2025 at 11:16:09PM +0100, David Heidelberg wrote:
> Basic description for S6E3FC2X01 DDIC with attached panels
> 
>  - Samsung AMS601NT22 6.01 inch, 1080x2160 pixels, 18:9 ratio
>  - Samsung AMS628NW01 6.28 inch, 1080x2280 pixels, 19:9 ratio
> 
> This panel has three supplies, while panel-simple-dsi is limited to one.
> There is no user of this compatible, nor the compatible make sense.

There are. git grep samsung,sofef00, gives me two users.

> Remove it from simple DSI panel definitions.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

..

>  additionalProperties: false
>  
>  required:
>    - compatible
> +  - power-supply
>    - reg
>  
>  examples:
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,sofef00.yaml b/Documentation/devicetree/bindings/display/panel/samsung,sofef00.yaml
> new file mode 100644
> index 0000000000000..527a10e3b798e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,sofef00.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,sofef00.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung SOFEF00 AMOLED DDIC
> +
> +description: The SOFEF00 is display driver IC with connected panel.

Description goes below maintainers, see example-schema.

> +
> +maintainers:
> +  - David Heidelberg <david@ixit.cz>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +            # Samsung 6.01 inch, 1080x2160 pixels, 18:9 ratio
> +          - samsung,sofef00-ams601nt22
> +            # Samsung 6.28 inch, 1080x2280 pixels, 19:9 ratio
> +          - samsung,sofef00-ams628nw01

These were not in the old binding, so please explain in the commit msg
reasons for adding new front compatibles.

> +      - const: samsung,sofef00
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios: true

Drop, not needed. It can stay required, though.

> +
> +  port: true

Drop

> +
> +  vddio-supply:
> +    description: VDD regulator
> +
> +  vci-supply:
> +    description: VCI regulator
> +
> +  poc-supply:
> +    description: POC regulator

1st poc, then vci then vddio to keep it more-or-less sorted. Same in
required list.

> +
> +required:
> +  - compatible
> +  - reset-gpios
> +  - vddio-supply
> +  - vci-supply
> +  - poc-supply
> +
> +unevaluatedProperties: false

Best regards,
Krzysztof

