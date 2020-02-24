Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EE016B410
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 23:32:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191506E999;
	Mon, 24 Feb 2020 22:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D746E999
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 22:32:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81378E89;
 Mon, 24 Feb 2020 23:32:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582583520;
 bh=jtnl65Hr+bnftvPmBVfUadMRLZSEnfG5ViWMnjRZp4Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=etBpV2HKWNIkC6SnIBViMTcVal7FgsZewpgy7XyLZLypptycZ1GaBBlCsQUCLMEvi
 WuRIIXf2oATg5r1E/qMwx/+NjlpO1c/FDEv7VP3YPQMVjx8N4KSR14uEs9UcTkGNZl
 Ng6ENPmw+emhKN1h3H1NRMavaXWgsvrbWwo5CkaI=
Date: Tue, 25 Feb 2020 00:31:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v10 09/12] dt-bindings: display: bridge: lvds-codec: Add
 new bus-width prop
Message-ID: <20200224223139.GA29578@pendragon.ideasonboard.com>
References: <20200128135514.108171-1-boris.brezillon@collabora.com>
 <20200128135514.108171-10-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200128135514.108171-10-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Mark Rutland <mark.rutland@arm.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 intel-gfx-trybot@lists.freedesktop.org, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Boris,

Thank you for the patch.

On Tue, Jan 28, 2020 at 02:55:11PM +0100, Boris Brezillon wrote:
> Add the bus-width property to describe the input bus format.
> 
> v10:
> * Add changelog to the commit message
> * Add Rob's R-b
> 
> v8 -> v9:
> * No changes
> 
> v7:
> * Rebase on top of lvds-codec changes
> * Drop the data-mapping property
> 
> v4 -> v6:
> * Not part of the series
> 
> v3:
> * New patch
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/display/bridge/lvds-codec.yaml    | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> index 8f373029f5d2..7c4e42f4de61 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> @@ -55,6 +55,14 @@ properties:
>          description: |
>            For LVDS encoders, port 0 is the parallel input
>            For LVDS decoders, port 0 is the LVDS input
> +        properties:
> +          bus-width:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +              - enum: [18, 24]
> +              - default: 24
> +          description:
> +            Number of data lines used to transmit the RGB data.

This is a bit unclear. First of all, depending on whether the node is an
LVDS encoder or decoder, port@0 is either a parallel input or an LVDS
input. The property mentiones RGB data, does it mean it apply to LVDS
encoders only ? Or should it be in port@1 for LVDS decoders ?

Then, I'm not sure what the property describes. Is it the number of data
lanes that the chip has ? Or the number of lanes routed on the board ?
Should it be specified only if the number of lanes on the board is
different than the maximum number of lanes of the hardware ? A more
detailed description is needed.

Updating the example would also be useful.

>  
>        port@1:
>          type: object

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
