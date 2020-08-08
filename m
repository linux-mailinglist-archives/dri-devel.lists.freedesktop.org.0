Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2EE23F8DD
	for <lists+dri-devel@lfdr.de>; Sat,  8 Aug 2020 22:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED976E0DC;
	Sat,  8 Aug 2020 20:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9DC6E0DC
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Aug 2020 20:59:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-78-184-nat.elisa-mobile.fi
 [85.76.78.184])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D2F4F9;
 Sat,  8 Aug 2020 22:59:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1596920367;
 bh=1cB/pP1jARUtsxomS+jZNhztWdWhNRAjAwHIioho3Iw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=huPpA5SZvk4brR/qr6lQVFw7SPapiwUSPED83jHTzr/G5x2NAMzFIeDgzTCpdjWP/
 /Op+gszQBh1U7nk5IF8Sis1NMgHx4Wf2OdWokeH9FlDBva1BdisjE4+3HZJCQ0pVMC
 b3utTeirTeIAWY+cYCfQ0tjZzOxklu32qNONJXrw=
Date: Sat, 8 Aug 2020 23:59:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/7] dt-bindings: display: renesas,du: Document the
 r8a7742 bindings
Message-ID: <20200808205912.GM6186@pendragon.ideasonboard.com>
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807174954.14448-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Prabhakar,

Thank you for the patch.

On Fri, Aug 07, 2020 at 06:49:48PM +0100, Lad Prabhakar wrote:
> Document the RZ/G1H (R8A7742) SoC in the R-Car DU bindings.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> index 51cd4d162770..3f1e3ca4bea9 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -3,6 +3,7 @@
>  Required Properties:
>  
>    - compatible: must be one of the following.
> +    - "renesas,du-r8a7742" for R8A7742 (RZ/G1H) compatible DU
>      - "renesas,du-r8a7743" for R8A7743 (RZ/G1M) compatible DU
>      - "renesas,du-r8a7744" for R8A7744 (RZ/G1N) compatible DU
>      - "renesas,du-r8a7745" for R8A7745 (RZ/G1E) compatible DU
> @@ -68,6 +69,7 @@ corresponding to each DU output.
>  
>                          Port0          Port1          Port2          Port3
>  -----------------------------------------------------------------------------
> + R8A7742 (RZ/G1H)       DPAD 0         LVDS 0         LVDS 1         -
>   R8A7743 (RZ/G1M)       DPAD 0         LVDS 0         -              -
>   R8A7744 (RZ/G1N)       DPAD 0         LVDS 0         -              -
>   R8A7745 (RZ/G1E)       DPAD 0         DPAD 1         -              -

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
