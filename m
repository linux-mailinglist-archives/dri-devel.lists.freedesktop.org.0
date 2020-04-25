Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA231B8859
	for <lists+dri-devel@lfdr.de>; Sat, 25 Apr 2020 19:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54C36E479;
	Sat, 25 Apr 2020 17:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F086E479
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Apr 2020 17:58:46 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 3E92980441;
 Sat, 25 Apr 2020 19:58:44 +0200 (CEST)
Date: Sat, 25 Apr 2020 19:58:42 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: simple: Add IVO M133NWF4 R0
Message-ID: <20200425175842.GA3773@ravnborg.org>
References: <20200420215728.1927434-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200420215728.1927434-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=8nJEP1OIZ-IA:10 a=KKAkSRfTAAAA:8 a=e5mUnYsNAAAA:8
 a=VT_5SEiLe_3rwrpvr8sA:9 a=wPNLvfGTeEIA:10 a=cvBusfyB2V15izCimMoJ:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bj=F6rn.

On Mon, Apr 20, 2020 at 02:57:27PM -0700, Bjorn Andersson wrote:
> Define the vendor prefix for InfoVision Optoelectronics and add their
> M133NWF4 R0 13.3" FHD (1920x1080) TFT LCD panel to the compatible list
> of panel-simple.
> =

> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

I got OK for the vendor prefix on irc so patch is now added to
drm-misc-next.
Another time please use a dedicated patch for vendor-prefix
so it is not hidden with other stuff. This way the chance
to get the attention of the right people is better.

Also added the panel-simple patch.
Both pushed out now.

	Sam

> ---
> =

> Changes since v1:
> - Added this patch
> =

>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  Documentation/devicetree/bindings/vendor-prefixes.yaml          | 2 ++
>  2 files changed, 4 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple=
.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index daf86ba18f47..31dc88f5b2a9 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -129,6 +129,8 @@ properties:
>        - hannstar,hsd100pxn1
>          # Hitachi Ltd. Corporation 9" WVGA (800x480) TFT LCD panel
>        - hit,tx23d38vm0caa
> +        # InfoVision Optoelectronics M133NWF4 R0 13.3" FHD (1920x1080) T=
FT LCD panel
> +      - ivo,m133nwf4-r0
>          # Innolux AT043TN24 4.3" WQVGA TFT LCD panel
>        - innolux,at043tn24
>          # Innolux AT070TN92 7.0" WQVGA TFT LCD panel
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index d3891386d671..31012f91fb9a 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -463,6 +463,8 @@ patternProperties:
>      description: Infineon Technologies
>    "^inforce,.*":
>      description: Inforce Computing
> +  "^ivo,.*":
> +    description: InfoVision Optoelectronics Kunshan Co. Ltd.
>    "^ingenic,.*":
>      description: Ingenic Semiconductor
>    "^innolux,.*":
> -- =

> 2.26.0
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
