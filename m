Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9F56E6807
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 17:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8D310E088;
	Tue, 18 Apr 2023 15:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C4510E088
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 15:26:03 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 467D2DE5;
 Tue, 18 Apr 2023 17:25:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1681831555;
 bh=Rn9zMjlac/6epNW7W26E/R1d5UVOmKmvZINuWM+EkTU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A6T6jLkn7Y2230g3yPvEvXyj78mRG6iZHUGkhEezcvGQgSpgOwNnRwtOFU2YkguXg
 aX1X4jccRbnXOO4QB5YbZETyRIHCoDcf5Txn9shQfWWpVnBc4YARCC29vZMFxerg1z
 Gc+VPNx+vU9iNuKsR6bvb0gKakWBcIY3PSfdg+jo=
Date: Tue, 18 Apr 2023 18:26:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: Fix lvds.yaml references
Message-ID: <20230418152612.GF30837@pendragon.ideasonboard.com>
References: <20230418150658.1535120-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230418150658.1535120-1-robh@kernel.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Heiko Stuebner <heiko.stuebner@bq.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thank you for the patch.

On Tue, Apr 18, 2023 at 10:06:57AM -0500, Rob Herring wrote:
> The trailing "/" in "lvds.yaml/#" is not a valid JSON pointer. The existing
> jsonschema package allows it, but coming changes make allowed "$ref" URIs
> stricter.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../devicetree/bindings/display/panel/advantech,idk-1110wr.yaml | 2 +-
>  .../devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml  | 2 +-
>  .../devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml | 2 +-
>  .../devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml | 2 +-
>  Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 +-
>  .../devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml    | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
> index 3a8c2c11f9bd..f6fea9085aab 100644
> --- a/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
> @@ -12,7 +12,7 @@ maintainers:
>  
>  allOf:
>    - $ref: panel-common.yaml#
> -  - $ref: /schemas/display/lvds.yaml/#
> +  - $ref: /schemas/display/lvds.yaml#
>  
>  select:
>    properties:
> diff --git a/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml b/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml
> index 566e11f6bfc0..ab6b7be88341 100644
> --- a/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml
> @@ -12,7 +12,7 @@ maintainers:
>  
>  allOf:
>    - $ref: panel-common.yaml#
> -  - $ref: /schemas/display/lvds.yaml/#
> +  - $ref: /schemas/display/lvds.yaml#
>  
>  select:
>    properties:
> diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
> index 5cf3c588f46d..3623ffa6518d 100644
> --- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
> @@ -12,7 +12,7 @@ maintainers:
>  
>  allOf:
>    - $ref: panel-common.yaml#
> -  - $ref: /schemas/display/lvds.yaml/#
> +  - $ref: /schemas/display/lvds.yaml#
>  
>  select:
>    properties:
> diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
> index 54750cc5440d..37f01d847aac 100644
> --- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
> @@ -12,7 +12,7 @@ maintainers:
>  
>  allOf:
>    - $ref: panel-common.yaml#
> -  - $ref: /schemas/display/lvds.yaml/#
> +  - $ref: /schemas/display/lvds.yaml#
>  
>  select:
>    properties:
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> index c77ee034310a..929fe046d1e7 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> @@ -12,7 +12,7 @@ maintainers:
>  
>  allOf:
>    - $ref: panel-common.yaml#
> -  - $ref: /schemas/display/lvds.yaml/#
> +  - $ref: /schemas/display/lvds.yaml#
>  
>  select:
>    properties:
> diff --git a/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml b/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
> index 2e75e3738ff0..e32d9188a3e0 100644
> --- a/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
> @@ -12,7 +12,7 @@ maintainers:
>  
>  allOf:
>    - $ref: panel-common.yaml#
> -  - $ref: /schemas/display/lvds.yaml/#
> +  - $ref: /schemas/display/lvds.yaml#
>  
>  select:
>    properties:

-- 
Regards,

Laurent Pinchart
