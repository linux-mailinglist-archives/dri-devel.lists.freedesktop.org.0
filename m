Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A63FC57C3CF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 07:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C35810EBBB;
	Thu, 21 Jul 2022 05:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400F310EBBB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 05:41:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D033A496;
 Thu, 21 Jul 2022 07:41:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1658382105;
 bh=Ve0iRggg/q9Wh+Ur+r1w+1hnS4BcG/iP/efNI4rRoHg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AzAI9PrcwXbGbsXw4SOK1hMkH5WHoMH0QUBX2gTQhrEpZ0Y2iCXjzasILT2tZd6CY
 uI0gHDRT1DDhFGUxMAGkkVBwahEvQJvn4gGMG9Vx/TYexihYEf2dX6tHbEAjFFydy6
 kaYEvGJKmKX8dbAsDiW0YEHP2i0LSlDjTK7m9wXo=
Date: Thu, 21 Jul 2022 08:41:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] dt-bindings: vendor-prefixes: add Densitron
Message-ID: <YtjnFxA66V6bMePa@pendragon.ideasonboard.com>
References: <20220721030327.210950-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220721030327.210950-1-marex@denx.de>
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
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, robert.foss@linaro.org,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

Thank you for the patch.

On Thu, Jul 21, 2022 at 05:03:27AM +0200, Marek Vasut wrote:
> Densitron is a manufacturer of LCD panels.
> https://www.densitron.com
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Guido Günther <agx@sigxcpu.org>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 88859dd4040ee..6277240536b44 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -312,6 +312,8 @@ patternProperties:
>      description: Dell Inc.
>    "^delta,.*":
>      description: Delta Electronics, Inc.
> +  "^densitron,.*":

How about "dsn", to follow the practice of using stock names as vendor
prefixes ?

> +    description: Densitron Technologies Ltd
>    "^denx,.*":
>      description: Denx Software Engineering
>    "^devantech,.*":

-- 
Regards,

Laurent Pinchart
