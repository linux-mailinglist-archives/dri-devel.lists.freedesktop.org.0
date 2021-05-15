Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D982381B40
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 23:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7A488071;
	Sat, 15 May 2021 21:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69EB89623
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 21:48:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E53CD436;
 Sat, 15 May 2021 23:48:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1621115295;
 bh=3HDfMZnFR3gpMA8k29TFZe4vdG02tiejMNDF+HfebMc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O0Tcm91ua7Gr4QLSDXPAVeEqzKH/KAAP0oxM3mnYgAEj9jnwAbW9DcknsHaRDEM50
 NXximMjWZX4VhDRAD1FyMClFGHAz6UfFVk90seQs4f40F7gBcoM5luosQtsPNaWVrm
 QTG9/24e/iSxDx0HKV7OVCiTTckSMRLUAQlizfzk=
Date: Sun, 16 May 2021 00:48:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] dt-bindings: display: bridge: lvds-codec: Fix spacing
Message-ID: <YKBBlWXXK8LUc8ac@pendragon.ideasonboard.com>
References: <20210515203932.366799-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210515203932.366799-1-marex@denx.de>
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
 Sam Ravnborg <sam@ravnborg.org>, ch@denx.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

Thank you for the patch.

On Sat, May 15, 2021 at 10:39:32PM +0200, Marek Vasut wrote:
> Add missing spaces to make the diagrams readable, no functional change.

Looks better indeed. The patch view looks bad though, because of the
tabs. Maybe you could replace them with spaces, while at it ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
>  .../devicetree/bindings/display/panel/lvds.yaml      | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> index 31164608ba1d..06d7ca692d0d 100644
> --- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> @@ -52,9 +52,9 @@ properties:
>          [VESA] specifications. Data are transferred as follows on 3 LVDS lanes.
>  
>        Slot	    0       1       2       3       4       5       6
> -            ________________                         _________________
> +                ________________                         _________________
>        Clock	                \_______________________/
> -              ______  ______  ______  ______  ______  ______  ______
> +                  ______  ______  ______  ______  ______  ______  ______
>        DATA0	><__G0__><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__><
>        DATA1	><__B1__><__B0__><__G5__><__G4__><__G3__><__G2__><__G1__><
>        DATA2	><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__><
> @@ -63,9 +63,9 @@ properties:
>          specifications. Data are transferred as follows on 4 LVDS lanes.
>  
>        Slot	    0       1       2       3       4       5       6
> -            ________________                         _________________
> +                ________________                         _________________
>        Clock	                \_______________________/
> -              ______  ______  ______  ______  ______  ______  ______
> +                  ______  ______  ______  ______  ______  ______  ______
>        DATA0	><__G2__><__R7__><__R6__><__R5__><__R4__><__R3__><__R2__><
>        DATA1	><__B3__><__B2__><__G7__><__G6__><__G5__><__G4__><__G3__><
>        DATA2	><_CTL2_><_CTL1_><_CTL0_><__B7__><__B6__><__B5__><__B4__><
> @@ -75,9 +75,9 @@ properties:
>          Data are transferred as follows on 4 LVDS lanes.
>  
>        Slot	    0       1       2       3       4       5       6
> -            ________________                         _________________
> +                ________________                         _________________
>        Clock	                \_______________________/
> -              ______  ______  ______  ______  ______  ______  ______
> +                  ______  ______  ______  ______  ______  ______  ______
>        DATA0	><__G0__><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__><
>        DATA1	><__B1__><__B0__><__G5__><__G4__><__G3__><__G2__><__G1__><
>        DATA2	><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__><

-- 
Regards,

Laurent Pinchart
