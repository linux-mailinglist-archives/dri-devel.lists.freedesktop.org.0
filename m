Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5760B46C0E7
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 17:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE60C7BB71;
	Tue,  7 Dec 2021 16:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715B3737F6
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 16:44:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F70F556;
 Tue,  7 Dec 2021 17:44:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1638895457;
 bh=bWd6lEiREDRAZ+PDNC285hxwR6IPlUo4UOngm3Ag1Rc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vvf11SNig+AISPQZgOWs4IVJVw8w4TpobVC0ZeGsWIY6m8GlycE1D4l6/3VnWV9oq
 gFUKidx6WLphcY54U5GvBnBTwVLSV6CJhVO3luz1H6a5UBbLh0AA6La3p1DOZ7ggP0
 8cgL0CEbfHmt+fv/ye1dW2eHxwDV68MEBvMhUzjQ=
Date: Tue, 7 Dec 2021 18:43:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/4] dt-bindings: display: bridge: tc358867: Document DPI
 output support
Message-ID: <Ya+PRMvq3cjJ46s/@pendragon.ideasonboard.com>
References: <20211127032405.283435-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211127032405.283435-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

Thank you for the patch.

On Sat, Nov 27, 2021 at 04:24:02AM +0100, Marek Vasut wrote:
> The TC358767/TC358867/TC9595 are all capable of operating in multiple
> modes, DPI-to-(e)DP, DSI-to-(e)DP, DSI-to-DPI. Document support for the
> DPI output port, which can now be connected both as input and output.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
>  .../devicetree/bindings/display/bridge/toshiba,tc358767.yaml  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
> index f1541cc05297..5cfda6f2ba69 100644
> --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
> @@ -61,8 +61,8 @@ properties:
>        port@1:
>          $ref: /schemas/graph.yaml#/properties/port
>          description: |
> -            DPI input port. The remote endpoint phandle should be a
> -            reference to a valid DPI output endpoint node
> +            DPI input/output port. The remote endpoint phandle should be a
> +            reference to a valid DPI output or input endpoint node.

I assume the mode of operation (input or output) will be fixed for a
given hardware design. Isn't this something that should be recorded in
DT ? It would simplify configuration of the device in the driver.

>  
>        port@2:
>          $ref: /schemas/graph.yaml#/properties/port
> 

-- 
Regards,

Laurent Pinchart
