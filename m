Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7C2256A40
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 23:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A376E0A5;
	Sat, 29 Aug 2020 21:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172806E0A5
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Aug 2020 21:06:03 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 02FCA804A4;
 Sat, 29 Aug 2020 23:06:00 +0200 (CEST)
Date: Sat, 29 Aug 2020 23:05:59 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: simple: Add
 AM-1280800N3TZQW-T00H
Message-ID: <20200829210559.GC796939@ravnborg.org>
References: <20200829163328.249211-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200829163328.249211-1-jagan@amarulasolutions.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=A5ZCwZeG c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=iP-xVBlJAAAA:8 a=B3g72izkqJmtQJUIFioA:9
 a=CjuIK1q_8ugA:10 a=lHLH-nfn2y1bM_0xSXwp:22
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
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan.

On Sat, Aug 29, 2020 at 10:03:27PM +0530, Jagan Teki wrote:
> Add dt-bindings for 10.1" TFT LCD module from Ampire Co. Ltd.
> as part of panel-simple.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Thanks for the quick update.
Applied both patches to drm-misc-next.

	Sam

> ---
> Changes for v2:
> - none
> 
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index d6cca1479633..f629d04f7737 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -29,6 +29,8 @@ properties:
>      # compatible must be listed in alphabetical order, ordered by compatible.
>      # The description in the comment is mandatory for each compatible.
>  
> +        # Ampire AM-1280800N3TZQW-T00H 10.1" WQVGA TFT LCD panel
> +      - ampire,am-1280800n3tzqw-t00h
>          # Ampire AM-480272H3TMQW-T01H 4.3" WQVGA TFT LCD panel
>        - ampire,am-480272h3tmqw-t01h
>          # Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
> -- 
> 2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
