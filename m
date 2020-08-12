Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C4A242D79
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 18:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579366E92E;
	Wed, 12 Aug 2020 16:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD706E92E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 16:39:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06A9E9E7;
 Wed, 12 Aug 2020 18:39:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597250349;
 bh=BUEpf8IPUOi1xqH7MfxxBW7gupcUexVqoMDyhBP/Scs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qLETwNYmT9e8TQTUrUuKOKOTil8N+h+o5NF9AEnv3bTzcy5yntoEv/GnSgK+Gu+FC
 4aMYgGfGNqamCHC/Pgz+z8GXLt4TCeJXJmY58yyrsOk2Q9xEa9mY0cXGoX1S2JSsnT
 ORHOZW2jht6/LzxB9aBdSI1A1B5Loh5QbMFbmVGQ=
Date: Wed, 12 Aug 2020 19:38:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 0/9] r8a774e1 add support for DU, HDMI and LVDS
Message-ID: <20200812163855.GU6057@pendragon.ideasonboard.com>
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Thank you for the patches.

On Wed, Aug 12, 2020 at 03:02:08PM +0100, Lad Prabhakar wrote:
> Hi All,
> 
> This patch series adds support for DU, HDMI and LVDS to RZ/G2H SoC.

I have added patches 1/9, 2/9, 4/9, 5/9 and 7/9 to my tree. I expect
Geert to handle the rest.

> Lad Prabhakar (1):
>   arm64: dts: renesas: r8a774e1-hihope-rzg2h: Setup DU clocks
> 
> Marian-Cristian Rotariu (8):
>   dt-bindings: display: renesas,du: Document r8a774e1 bindings
>   drm: rcar-du: Add support for R8A774E1 SoC
>   arm64: dts: renesas: r8a774e1: Populate DU device node
>   dt-bindings: display: renesas,lvds: Document r8a774e1 bindings
>   dt-bindings: display: renesas,dw-hdmi: Add r8a774e1 support
>   arm64: dts: renesas: r8a774e1: Populate HDMI encoder node
>   drm: rcar-du: lvds: Add support for R8A774E1 SoC
>   arm64: dts: renesas: r8a774e1: Add LVDS device node
> 
>  .../display/bridge/renesas,dw-hdmi.txt        |  1 +
>  .../bindings/display/bridge/renesas,lvds.txt  |  1 +
>  .../bindings/display/renesas,du.txt           |  2 +
>  .../dts/renesas/r8a774e1-hihope-rzg2h.dts     | 11 ++++
>  arch/arm64/boot/dts/renesas/r8a774e1.dtsi     | 61 ++++++++++++++++++-
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c         | 30 +++++++++
>  drivers/gpu/drm/rcar-du/rcar_lvds.c           |  1 +
>  7 files changed, 104 insertions(+), 3 deletions(-)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
