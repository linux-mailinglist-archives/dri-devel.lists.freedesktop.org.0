Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF00E47A37A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 03:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B33010E12E;
	Mon, 20 Dec 2021 02:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7011410E12E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 02:06:25 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32E89B9C;
 Mon, 20 Dec 2021 03:06:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1639965983;
 bh=doVUZtwd5suRhhpyA1TOQ5UWylcW5PU8HR/k3Gpy9LU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oGs/Ukpy0P0ijodXgNAMUbGjMn6G1ZYq3bolXsskCIMG5IyhwSlzCYDtevcrXPvcV
 RCJGCyAI70wq84ph/d9qI3T8TDZQwqlpS83Po4iKJtDD5ki9GMJqLU6uGyumHvuK9N
 982lTvEV1qc3ev5sQ27mTRHnGjqW7E9A884v5qM0=
Date: Mon, 20 Dec 2021 04:06:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] dt-bindings: display: bridge: lvds-codec: Document TI
 DS90CF364A decoder
Message-ID: <Yb/lHeBIFM1Ih7zo@pendragon.ideasonboard.com>
References: <20211218152309.256183-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211218152309.256183-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

Thank you for the patch.

On Sat, Dec 18, 2021 at 04:23:09PM +0100, Marek Vasut wrote:
> Add compatible string for TI DS90CF364A, which is another LVDS to DPI
> decoder similar to DS90CF384A, except it is using smaller package and
> only provides 18bit DPI bus.

We could add a rule to disallow jeida-24 and vesa-24 when the compatible
string contains ti,ds90cf384a, but that may be overkill.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
>  Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> index 1faae3e323a4..99c13f879916 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> @@ -39,6 +39,7 @@ properties:
>            - const: lvds-encoder # Generic LVDS encoder compatible fallback
>        - items:
>            - enum:
> +              - ti,ds90cf364a # For the DS90CF364A FPD-Link LVDS Receiver
>                - ti,ds90cf384a # For the DS90CF384A FPD-Link LVDS Receiver
>            - const: lvds-decoder # Generic LVDS decoders compatible fallback
>        - enum:

-- 
Regards,

Laurent Pinchart
