Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EBA76495D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 09:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8DE10E502;
	Thu, 27 Jul 2023 07:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB05210E506
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 07:52:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2FEDF4A9;
 Thu, 27 Jul 2023 09:51:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1690444276;
 bh=hLYS7QNXgw79aP9ZeDf0oH24DQ1yvOeoY44cgIG36to=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xo0m6d/4sKt30bXOaOQ9157Rxbwm4gi0gF5CcRfrxPcBQYLZN2HIwCYDp9Eb+nDDc
 HwmqVm2nDOuQDyXN/Q97JN8RYJogM7E0qtVLZuXTvGJDC+Gn5sSK+b4acQS2nZaqrw
 IyeWs60FVNjpURgjLXtpv6LSK/hZ8h1UH6yfjDQU=
Date: Thu, 27 Jul 2023 10:52:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: Move HannStar
 HSD101PWW2 to LVDS
Message-ID: <20230727075220.GB25174@pendragon.ideasonboard.com>
References: <20230726184857.2294570-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230726184857.2294570-1-thierry.reding@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Svyatoslav Ryhel <clamor95@gmail.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thierry,

Thank you for the patch.

On Wed, Jul 26, 2023 at 08:48:55PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The HannStar HSD101PWW2 is an LVDS panel, so move it to the correct
> bindings file.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> index 929fe046d1e7..344e5df40c2f 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> @@ -40,6 +40,8 @@ properties:
>      items:
>        - enum:
>            - auo,b101ew05
> +          # HannStar Display Corp. HSD101PWW2 10.1" WXGA (1280x800) LVDS panel
> +          - hannstar,hsd101pww2
>            - tbs,a711-panel
>  
>        - const: panel-lvds
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index df1cec8fd21b..f4d9da4afefd 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -168,8 +168,6 @@ properties:
>        - hannstar,hsd070pww1
>          # HannStar Display Corp. HSD100PXN1 10.1" XGA LVDS panel
>        - hannstar,hsd100pxn1

I'm wondering if it would make sense to move them all in one go ?
Regardless, this patch is OK, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> -        # HannStar Display Corp. HSD101PWW2 10.1" WXGA (1280x800) LVDS panel
> -      - hannstar,hsd101pww2
>          # Hitachi Ltd. Corporation 9" WVGA (800x480) TFT LCD panel
>        - hit,tx23d38vm0caa
>          # InfoVision Optoelectronics M133NWF4 R0 13.3" FHD (1920x1080) TFT LCD panel

-- 
Regards,

Laurent Pinchart
