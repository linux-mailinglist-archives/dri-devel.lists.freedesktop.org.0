Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 276822CA1E0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 12:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280706E4DD;
	Tue,  1 Dec 2020 11:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C415E6E4DD
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 11:56:19 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 08B5B804D0;
 Tue,  1 Dec 2020 12:56:13 +0100 (CET)
Date: Tue, 1 Dec 2020 12:56:12 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v5 1/6] dt-bindings: display: simple: Add EDT
 ETM0700G0BDH6 display
Message-ID: <20201201115612.GA1989765@ravnborg.org>
References: <20201201092742.17658-1-o.rempel@pengutronix.de>
 <20201201092742.17658-2-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201201092742.17658-2-o.rempel@pengutronix.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=8OBsB-vj1QKdv3JTGIwA:9 a=CjuIK1q_8ugA:10
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
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, David Jander <david@protonic.nl>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Oleksij

On Tue, Dec 01, 2020 at 10:27:37AM +0100, Oleksij Rempel wrote:
> This display is already supported by the panel-simple driver, so add it
> to the bindings documentation.
> 
> This patch is needed to fix checkpatch warnings for the PLYM2M dts.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index edb53ab0d9eb..a011d9e44af3 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -117,6 +117,8 @@ properties:
>        - edt,etm0700g0dh6
>          # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
>          # Same as ETM0700G0DH6 but with inverted pixel clock.
> +      - edt,etm0700g0bdh6
> +        # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
>        - edt,etm070080bdh6
>          # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
>          # Same display as the ETM0700G0BDH6, but with changed hardware for the

The panels should be listed in alphabetic order which is not the case
here. Could you fix the alphabetic order for the edt panels and then
insert the new panel in the right spot?

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
