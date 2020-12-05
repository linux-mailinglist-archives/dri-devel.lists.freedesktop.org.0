Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0252CFE67
	for <lists+dri-devel@lfdr.de>; Sat,  5 Dec 2020 20:32:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCCE6E44D;
	Sat,  5 Dec 2020 19:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEF66E44D
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Dec 2020 19:32:33 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 53A6D804C8;
 Sat,  5 Dec 2020 20:32:30 +0100 (CET)
Date: Sat, 5 Dec 2020 20:32:29 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v6 1/8] dt-bindings: display: simple: fix alphabetical
 order for EDT compatibles
Message-ID: <20201205193229.GF332836@ravnborg.org>
References: <20201202081826.29512-1-o.rempel@pengutronix.de>
 <20201202081826.29512-2-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201202081826.29512-2-o.rempel@pengutronix.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=0SxC7ohpVnCXmJXPVTcA:9 a=CjuIK1q_8ugA:10
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
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 David Jander <david@protonic.nl>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Oleksij

On Wed, Dec 02, 2020 at 09:18:19AM +0100, Oleksij Rempel wrote:
> Reorder it alphabetically and remove one double entry.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../bindings/display/panel/panel-simple.yaml     | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index edb53ab0d9eb..428b03342fea 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -106,26 +106,24 @@ properties:
>          # Emerging Display Technology Corp. 3.5" QVGA TFT LCD panel
>        - edt,et035012dm6
>          # Emerging Display Technology Corp. 480x272 TFT Display with capacitive touch
> +      - edt,et057090dhu
> +        # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
>        - edt,etm043080dh6gp
>          # Emerging Display Technology Corp. 480x272 TFT Display
>        - edt,etm0430g0dh6
>          # Emerging Display Technology Corp. 5.7" VGA TFT LCD panel
> -      - edt,et057090dhu
> -        # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
> -      - edt,etm070080dh6
> -        # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
> -      - edt,etm0700g0dh6
> -        # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
> -        # Same as ETM0700G0DH6 but with inverted pixel clock.
>        - edt,etm070080bdh6
>          # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
>          # Same display as the ETM0700G0BDH6, but with changed hardware for the
>          # backlight and the touch interface.
> +      - edt,etm070080dh6
> +        # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
>        - edt,etm070080edh6
>          # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
>          # Same timings as the ETM0700G0DH6, but with resistive touch.
> -      - edt,etm070080dh6
> -        # Evervision Electronics Co. Ltd. VGG804821 5.0" WVGA TFT LCD Panel
> +      - edt,etm0700g0dh6
> +        # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
> +        # Same as ETM0700G0DH6 but with inverted pixel clock.
>        - evervision,vgg804821
>          # Foxlink Group 5" WVGA TFT LCD panel
>        - foxlink,fl500wvr00-a0t

Thanks for fixing this, but something is not correct.
I think you switched around the order of comment and compatible.

It goes like this

	  # This is the comment
	- compatible,for-the-comment

I always look at the first entry when I need to check the order.
Also the comment for evervision,vgg804821 seems to be lost in the above.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
