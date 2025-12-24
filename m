Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9239CDBD3D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 10:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C0510EA50;
	Wed, 24 Dec 2025 09:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ru1No65p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA3B10EA50
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 09:40:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CD30660120;
 Wed, 24 Dec 2025 09:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2598C4CEFB;
 Wed, 24 Dec 2025 09:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766569238;
 bh=bCuEYCXZDvI9YsvoqCOxGkjEsZb9wkFmokDUCbthdAo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ru1No65pSRKiD7dPI/P6khalxTZf5XHQBdNh2k6H1u6qHKE9l6vvT3kxqEiuu7qay
 8t/7aEH2/hnftxkqxNKXaNNmMNVHS1Ob0R5BrzUNZ+4z+AmtIAfXXCty2MRPlPQykp
 VLocVdMT/vcDAwAiaEF/hHiZKUNXq/2vmckBIo15lXnjiIF57R3pRWf/9NNYm4r5kE
 TNbwRrKEpNzNLxJ22DRTaI6IBc0LT8CWGAn5FSHxIwzm6upx0lUnDQB8WXRAtDov9A
 BV+zF4kaU8adDZUuEsKf22OAnm1PLegcriwBz7+JgOTICqmOFtFuK7LYp2Fcahyswi
 guT03ondQuKiQ==
Date: Wed, 24 Dec 2025 10:40:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Venkata Gopi Nagaraju Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Marek Vasut <marex@denx.de>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Nilesh Laad <nilesh.laad@oss.qualcomm.com>, venkata.valluru@oss.qualcomm.com,
 jessica.zhang@oss.qualcomm.com, Yi Zhang <zhanyi@qti.qualcomm.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: bridge: lt9211c: Add bindings
Message-ID: <20251224-strong-fabulous-bee-cdd620@quoll>
References: <20251224-add-lt9211c-bridge-v4-0-406e73ec28c5@oss.qualcomm.com>
 <20251224-add-lt9211c-bridge-v4-1-406e73ec28c5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251224-add-lt9211c-bridge-v4-1-406e73ec28c5@oss.qualcomm.com>
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

On Wed, Dec 24, 2025 at 12:41:40PM +0530, Venkata Gopi Nagaraju Botlagunta wrote:
> From: Yi Zhang <zhanyi@qti.qualcomm.com>
> 
> Add bindings for lt9211c.
> 
> Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
> Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
> Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
> ---
>  .../bindings/display/bridge/lontium,lt9211.yaml    | 42 ++++++++++++++++++++--
>  1 file changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
> index 9a6e9b25d14a..98079df61cbb 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
> @@ -4,19 +4,20 @@
>  $id: http://devicetree.org/schemas/display/bridge/lontium,lt9211.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Lontium LT9211 DSI/LVDS/DPI to DSI/LVDS/DPI bridge.
> +title: Lontium LT9211/LT9211C DSI/LVDS/DPI to DSI/LVDS/DPI bridge.
>  
>  maintainers:
>    - Marek Vasut <marex@denx.de>
>  
>  description: |
> -  The LT9211 are bridge devices which convert Single/Dual-Link DSI/LVDS
> +  The LT9211 and LT9211C are bridge devices which convert Single/Dual-Link DSI/LVDS
>    or Single DPI to Single/Dual-Link DSI/LVDS or Single DPI.
>  
>  properties:
>    compatible:
>      enum:
>        - lontium,lt9211
> +      - lontium,lt9211c
>  
>    reg:
>      maxItems: 1
> @@ -91,6 +92,43 @@ examples:
>  
>          vccio-supply = <&lt9211_1v8>;
>  
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +
> +            endpoint {
> +              remote-endpoint = <&dsi0_out>;
> +            };
> +          };
> +
> +          port@2 {
> +            reg = <2>;
> +
> +            endpoint {
> +              remote-endpoint = <&panel_in_lvds>;
> +            };
> +          };
> +        };
> +      };
> +    };
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      lvds-bridge@3b {
> +        compatible = "lontium,lt9211c";

Don't add unnecessary examples.

Best regards,
Krzysztof

