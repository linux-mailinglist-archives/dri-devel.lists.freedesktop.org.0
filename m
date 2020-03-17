Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C63188DE5
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 20:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B996E81A;
	Tue, 17 Mar 2020 19:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6356E81A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 19:23:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AAD2F9;
 Tue, 17 Mar 2020 20:23:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1584472987;
 bh=4QVsOH0BrfLWNHQyxRY81dJlyNjXtQZ1wSJ6kExT9LQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U4tyxYDTJXiFqyrlObdum3ESFQGxgDxZEd1VQodV9KIP8GQFaaC9nvxRjO5A8eeuL
 aQwKWG396mgP/wtj5GNbM8EGW2cZWXQUD7YuvKFAFlsqVRkj4Ie5CM5CaBjErLjlsN
 3A1x7btyI526gF3lh6bgiqVEj9e6Bd/DRNwkVJ2w=
Date: Tue, 17 Mar 2020 21:23:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 1/3] dt-bindings: display: drop data-mapping from
 panel-dpi
Message-ID: <20200317192302.GB2527@pendragon.ideasonboard.com>
References: <20200314153047.2486-1-sam@ravnborg.org>
 <20200314153047.2486-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200314153047.2486-2-sam@ravnborg.org>
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

On Sat, Mar 14, 2020 at 04:30:45PM +0100, Sam Ravnborg wrote:
> data-mapping may not be the best way to describe the
> data format used between panels and display interface.
> 
> Drop it from the panel-dpi binding so we do not start to rely on it.
> We can then work out how to best describe this mapping and when
> we know it, we can add it to this binding.

I certainly welcome that, as we need to define how to express this
information in a more detailed way, taking into account all use cases.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I think this qualifies as a v5.7 fix.

> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/display/panel/panel-dpi.yaml   | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> index f63870384c00..0cd74c8dab42 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> @@ -21,15 +21,6 @@ properties:
>        - {}
>        - const: panel-dpi
>  
> -  data-mapping:
> -    enum:
> -      - rgb24
> -      - rgb565
> -      - bgr666
> -    description: |
> -      Describes the media format, how the display panel is connected
> -      to the display interface.
> -
>    backlight: true
>    enable-gpios: true
>    height-mm: true
> @@ -52,7 +43,6 @@ examples:
>          compatible = "osddisplays,osd057T0559-34ts", "panel-dpi";
>          label = "osddisplay";
>          power-supply = <&vcc_supply>;
> -        data-mapping = "rgb565";
>          backlight = <&backlight>;
>  
>          port {

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
