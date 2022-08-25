Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8452E5A0BE9
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 10:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F068111A91C;
	Thu, 25 Aug 2022 08:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0F311A694;
 Thu, 25 Aug 2022 08:51:48 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 564422B3;
 Thu, 25 Aug 2022 10:51:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661417506;
 bh=hqjjTfpHavt0j/vu7b/diKsDIw1QdqTc5yyTW7GYfo8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z8pStjaw+wTHpUqjfkrNYv4yhEOMiZpey4BovUqFDdUKaiJRG3zr27mJb+3KOVnqv
 SeSwIWuxOsniVY0CtkTuJBrvvODxoS4qbCjAnkQGfS00GuyUS1Limb9dDBRxhVsFoW
 HVOrzfbF2aIEGVjQzg6fMImib3ZqHBM+/31mCM9o=
Date: Thu, 25 Aug 2022 11:51:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: Add missing
 (unevaluated|additional)Properties on child nodes
Message-ID: <Ywc4HGS+7aq9Fbk1@pendragon.ideasonboard.com>
References: <20220823145649.3118479-11-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220823145649.3118479-11-robh@kernel.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-samsung-soc@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>, linux-arm-msm@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, Andre Przywara <andre.przywara@arm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thank you for the patch.

On Tue, Aug 23, 2022 at 09:56:42AM -0500, Rob Herring wrote:
> In order to ensure only documented properties are present, node schemas
> must have unevaluatedProperties or additionalProperties set to false
> (typically).
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/display/arm,komeda.yaml        | 1 +
>  Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
>  Documentation/devicetree/bindings/display/msm/gpu.yaml           | 1 +
>  .../bindings/display/samsung/samsung,exynos7-decon.yaml          | 1 +
>  .../devicetree/bindings/display/samsung/samsung,fimd.yaml        | 1 +
>  5 files changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/arm,komeda.yaml b/Documentation/devicetree/bindings/display/arm,komeda.yaml
> index 9f4aade97f10..3ad3eef89ca8 100644
> --- a/Documentation/devicetree/bindings/display/arm,komeda.yaml
> +++ b/Documentation/devicetree/bindings/display/arm,komeda.yaml
> @@ -58,6 +58,7 @@ properties:
>  patternProperties:
>    '^pipeline@[01]$':
>      type: object
> +    additionalProperties: false
>      description:
>        clocks
>  
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> index 3a8614e0f627..84aafcbf0919 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> @@ -51,6 +51,7 @@ properties:
>      properties:
>        port@0:
>          $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
>          description: |
>            For LVDS encoders, port 0 is the parallel input
>            For LVDS decoders, port 0 is the LVDS input
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> index 3397bc31d087..0179c816fa6d 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -81,6 +81,7 @@ properties:
>  
>    zap-shader:
>      type: object
> +    additionalProperties: false
>      description: |
>        For a5xx and a6xx devices this node contains a memory-region that
>        points to reserved memory to store the zap shader that can be used to
> diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
> index 969bd8c563a5..dec1c9058876 100644
> --- a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
> +++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
> @@ -37,6 +37,7 @@ properties:
>  
>    i80-if-timings:
>      type: object
> +    additionalProperties: false
>      description: timing configuration for lcd i80 interface support
>      properties:
>        cs-setup:
> diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml
> index 5d5cc220f78a..7593938601bb 100644
> --- a/Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml
> +++ b/Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml
> @@ -40,6 +40,7 @@ properties:
>  
>    i80-if-timings:
>      type: object
> +    additionalProperties: false
>      description: |
>        Timing configuration for lcd i80 interface support.
>        The parameters are defined as::

-- 
Regards,

Laurent Pinchart
