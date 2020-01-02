Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8672812E75E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 15:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2671F6E02A;
	Thu,  2 Jan 2020 14:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3EE6E02A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 14:46:43 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 94B52803D7;
 Thu,  2 Jan 2020 15:46:37 +0100 (CET)
Date: Thu, 2 Jan 2020 15:46:36 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 1/3] dt-bindings: display: sitronix, st7735r: Add Okaya
 rh128128t
Message-ID: <20200102144636.GA10075@ravnborg.org>
References: <20200102141246.370-1-geert+renesas@glider.be>
 <20200102141246.370-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200102141246.370-2-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=FF-hTYSRAwVgkRfqy0oA:9 a=CjuIK1q_8ugA:10 a=pHzHmUro8NiASowvMSCR:22
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
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Chris Brandt <chris.brandt@renesas.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert.

On Thu, Jan 02, 2020 at 03:12:44PM +0100, Geert Uytterhoeven wrote:
> Document support for the Okaya RH128128T display, which is a 128x128
> 1.44" TFT display driven by a Sitronix ST7715R TFT Controller/Driver.
> 
> ST7715R and ST7735R are very similar.  Their major difference is that
> the former is restricted to displays of up to 132x132 pixels, while the
> latter supports displays up to 132x162 pixels.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/display/sitronix,st7735r.txt          | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.txt b/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
> index cd5c7186890a2be7..87ebdcb294e29798 100644
> --- a/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
> +++ b/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
While touching the bindings file, can I convince you to convert it to
meta-schema format (.yaml)?


> @@ -4,7 +4,9 @@ This binding is for display panels using a Sitronix ST7735R controller in SPI
>  mode.
>  
>  Required properties:
> -- compatible:	"jianda,jd-t18003-t01", "sitronix,st7735r"
> +- compatible:	Must be one of the following combinations:
> +		  - "jianda,jd-t18003-t01", "sitronix,st7735r"
> +		  - "okaya,rh128128t", "sitronix,st7715r"

It would be nice if there was a "description" for each pair of
compatible that identified the actual panel.
In your case "Okaya RH128128T 1.44" 128x128 TFT display"
It can be looked up in git history - but better to have it in the
binding file.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
