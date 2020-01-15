Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1856D13CE80
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 22:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0EB6EB3B;
	Wed, 15 Jan 2020 21:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F201B6EB3B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 21:02:02 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id BF5AA8051D;
 Wed, 15 Jan 2020 22:02:00 +0100 (CET)
Date: Wed, 15 Jan 2020 22:01:59 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 2/5] dt-bindings: display: sitronix, st7735r: Add Okaya
 RH128128T
Message-ID: <20200115210159.GB28904@ravnborg.org>
References: <20200115124548.3951-1-geert+renesas@glider.be>
 <20200115124548.3951-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115124548.3951-3-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=I7rRU4mLAAAA:8
 a=7gkXJVJtAAAA:8 a=WZHNqt2aAAAA:8 a=wqR4KbatVpAo1aFId44A:9
 a=CjuIK1q_8ugA:10 a=zVIc4Sw0WK5ZSny7osSx:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=PrHl9onO2p7xFKlKy1af:22 a=pHzHmUro8NiASowvMSCR:22
 a=6VlIyEUom7LUIeUMNQJH:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Lechner <david@lechnology.com>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Chris Brandt <chris.brandt@renesas.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 15, 2020 at 01:45:45PM +0100, Geert Uytterhoeven wrote:
> Document support for the Okaya RH128128T display, which is a 128x128
> 1.44" TFT display driven by a Sitronix ST7715R TFT Controller/Driver.
> It can be found on e.g. the Renesas YRSK-LCD-PMOD extension board, which
> comes with various Renesas development kits (e.g. Renesas Starter Kit+
> for RZ/A1H[1]).
> 
> ST7715R and ST7735R are very similar.  Their major difference is that
> the former is restricted to displays of up to 132x132 pixels, while the
> latter supports displays up to 132x162 pixels.
> 
> [1] https://renesasrulz.com/the_vault/f/archive-forum/4981/upgrading-to-the-renesas-rz-a1h
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
> v2:
>   - Rebase on top of DT schema conversion,
>   - Add YRSK-LCD-PMOD reference and links.
> ---
>  .../devicetree/bindings/display/sitronix,st7735r.yaml  | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
> index 21bccc91f74255e1..8892d79e6e100b79 100644
> --- a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
> +++ b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
> @@ -10,8 +10,8 @@ maintainers:
>    - David Lechner <david@lechnology.com>
>  
>  description:
> -  This binding is for display panels using a Sitronix ST7735R controller in
> -  SPI mode.
> +  This binding is for display panels using a Sitronix ST7715R or ST7735R
> +  controller in SPI mode.
>  
>  allOf:
>    - $ref: panel/panel-common.yaml#
> @@ -25,6 +25,12 @@ properties:
>            - enum:
>                - jianda,jd-t18003-t01
>            - const: sitronix,st7735r
> +      - description:
> +          Okaya 1.44" 128x128 Color TFT LCD (E.g. Renesas YRSK-LCD-PMOD)
> +        items:
> +          - enum:
> +              - okaya,rh128128t
> +          - const: sitronix,st7715r
>  
>    spi-max-frequency:
>      maximum: 32000000
> -- 
> 2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
