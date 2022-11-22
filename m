Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C57F163337D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 03:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2EC10E1B8;
	Tue, 22 Nov 2022 02:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B0A10E1B8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 02:44:27 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E628E890;
 Tue, 22 Nov 2022 03:44:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669085065;
 bh=SwBmGGTHhJI7Z1rP8nglgS74H8wm/hKxQunWQGksy+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CdJr4OOO1FTG1fdXEnUb3Ha/k7O2rjPusEwiosthXzaexP+77bw2/HvZTgjbTFhTW
 rQ0FnJ0zitw04U8BkEOfpZBPbzJLgqoS+Dfy9BAdgIY7NO49uBz/NQ1nC0HiFq9v3w
 YtC+MUWW2SBtMt5A9o6+XgtbBUCU8GE6/Jc2eaU0=
Date: Tue, 22 Nov 2022 04:44:09 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v1 1/8] dt-bindings: display: renesas,du: Provide
 bindings for r8a779g0
Message-ID: <Y3w3ecXLyZIMnilP@pendragon.ideasonboard.com>
References: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
 <20221117122547.809644-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221117122547.809644-2-tomi.valkeinen@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Thu, Nov 17, 2022 at 02:25:40PM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Extend the Renesas DU display bindings to support the r8a779g0 V4H.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/display/renesas,du.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> index b3e588022082..d4830f52c512 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -40,6 +40,7 @@ properties:
>        - renesas,du-r8a77990 # for R-Car E3 compatible DU
>        - renesas,du-r8a77995 # for R-Car D3 compatible DU
>        - renesas,du-r8a779a0 # for R-Car V3U compatible DU
> +      - renesas,du-r8a779g0 # for R-Car V4H compatible DU
>  
>    reg:
>      maxItems: 1
> @@ -762,6 +763,7 @@ allOf:
>            contains:
>              enum:
>                - renesas,du-r8a779a0
> +              - renesas,du-r8a779g0
>      then:
>        properties:
>          clocks:

-- 
Regards,

Laurent Pinchart
