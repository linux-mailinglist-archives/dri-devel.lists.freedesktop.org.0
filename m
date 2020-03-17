Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E29C188DED
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 20:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F2D6E81D;
	Tue, 17 Mar 2020 19:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DC16E81D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 19:25:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA292F9;
 Tue, 17 Mar 2020 20:25:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1584473128;
 bh=1J1a3nDhjILNyfZ31fOuVZ2/V7hX5L9hOruGiVgN/XU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OxLsh1Svr1+gDyY9ofWpQckY5tjmh6/JOw/OCgrtloYU6RZS1E+46UBKNyYIxySeN
 rFWZ6UQxAaOdh9iSxjnPmYOkolQC3L3bb8zBEzINyHknMFM6mHFF+QSTXxFMzNmPiH
 v6CMieiGy9et6r8agHSYYlLv2OAzpUBnAvWNLqQM=
Date: Tue, 17 Mar 2020 21:25:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 3/3] dt-bindings: display: grammar fixes in panel/
Message-ID: <20200317192522.GD2527@pendragon.ideasonboard.com>
References: <20200314153047.2486-1-sam@ravnborg.org>
 <20200314153047.2486-4-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200314153047.2486-4-sam@ravnborg.org>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Sat, Mar 14, 2020 at 04:30:47PM +0100, Sam Ravnborg wrote:
> Fix a few grammar/editorial issues spotted by Laurent Pinchart.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/display/panel/display-timings.yaml           | 8 ++++----
>  .../devicetree/bindings/display/panel/panel-common.yaml   | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/display-timings.yaml b/Documentation/devicetree/bindings/display/panel/display-timings.yaml
> index c8c0c9cb0492..56903ded005e 100644
> --- a/Documentation/devicetree/bindings/display/panel/display-timings.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/display-timings.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/display/panel/display-timings.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: display timing bindings
> +title: display timings bindings
>  
>  maintainers:
>    - Thierry Reding <thierry.reding@gmail.com>
> @@ -14,7 +14,7 @@ maintainers:
>  description: |
>    A display panel may be able to handle several display timings,
>    with different resolutions.
> -  The display-timings node makes it possible to specify the timing
> +  The display-timings node makes it possible to specify the timings
>    and to specify the timing that is native for the display.
>  
>  properties:
> @@ -25,8 +25,8 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: |
>        The default display timing is the one specified as native-mode.
> -      If no native-mode is specified then the first node is assumed the
> -      native mode.
> +      If no native-mode is specified then the first node is assumed
> +      to be the native mode.
>  
>  patternProperties:
>    "^timing":
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> index ed051ba12084..dee4faffd204 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> @@ -63,9 +63,9 @@ properties:
>  
>    display-timings:
>      description:
> -      Some display panels supports several resolutions with different timing.
> +      Some display panels supports several resolutions with different timings.

s/supports/support/

>        The display-timings bindings supports specifying several timings and
> -      optional specify which is the native mode.
> +      optionally specify which is the native mode.

s/specify/specifying/ ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>      allOf:
>        - $ref: display-timings.yaml#
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
