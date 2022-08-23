Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC8459DABC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 12:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09E811231B;
	Tue, 23 Aug 2022 10:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF39D10F68E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 10:40:56 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E3BA440;
 Tue, 23 Aug 2022 12:40:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661251254;
 bh=qtB/GHrhmBGbFTFOqU8r92UoGanWbvaJR09DP0TwpEI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tS2Rs/F+MOfHTNWsI+H3m05aDeJAOtf8tSyFbGcMxlDkCQsCPLhe9L8m1+l+krphh
 JlthAFo+rUPhGU1YsAd/yehvqfSLWAh4rBTy2J6WB+Cf615tZMk5HlMmB7VHw4Rme+
 ogK54hF/L1LRWOeI4VuxuMQk4A33kWS6CnDFPN7o=
Date: Tue, 23 Aug 2022 13:40:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: synopsys,dw-hdmi: drop ref from
 reg-io-width
Message-ID: <YwSusqWrapWASOSK@pendragon.ideasonboard.com>
References: <20220823101031.387082-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220823101031.387082-1-krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

Thank you for the patch.

On Tue, Aug 23, 2022 at 01:10:31PM +0300, Krzysztof Kozlowski wrote:
> reg-io-width is a standard property, so no need for defining its type
> with $ref.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml     | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> index b00246faea57..4b7e54a8f037 100644
> --- a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> @@ -26,7 +26,6 @@ properties:
>    reg-io-width:
>      description:
>        Width (in bytes) of the registers specified by the reg property.
> -    $ref: /schemas/types.yaml#/definitions/uint32
>      enum: [1, 4]
>      default: 1
>  

-- 
Regards,

Laurent Pinchart
