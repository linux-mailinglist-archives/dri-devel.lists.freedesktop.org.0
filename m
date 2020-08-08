Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB49E23F8D9
	for <lists+dri-devel@lfdr.de>; Sat,  8 Aug 2020 22:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D1689FAC;
	Sat,  8 Aug 2020 20:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B274A89FAC
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Aug 2020 20:55:59 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-78-184-nat.elisa-mobile.fi
 [85.76.78.184])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4760F9;
 Sat,  8 Aug 2020 22:55:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1596920156;
 bh=7AzBW6y7AohK848k4WmKInfvCXQ963jNC9GWH4yAtvo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gvVEBFS/9RlgkpwmVx4e22Eft0jGK4pKGXo5ziC06KmbGbbEc4SWuLFdyU14gDTeR
 fiLx1sIfp/mKBcu2fqvEHYxHbGnPR78OXnIlEFAe7Yg7/QD5+xO5B1uEIzoLqY23nA
 daRCBWP3hBNzIxJq1dIjpncO6uQAzdUvh3LyltcU=
Date: Sat, 8 Aug 2020 23:55:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 0/7] r8a7742: Enable DU and LVDS
Message-ID: <20200808205543.GL6186@pendragon.ideasonboard.com>
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Fri, Aug 07, 2020 at 06:49:47PM +0100, Lad Prabhakar wrote:
> Hi All,
> 
> This patch series adds support for DU and LVDS to r8a7742
> SoC and enables LCD support on r8a7742-iwg21d-q7 board.
> 
> This patch series applies on top of [1].
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/
>     renesas-devel.git/log/?h=renesas-arm-dt-for-v5.10

The driver changes will need to go through the DRM/KMS tree, and I'd
recommend the DT binding changes to go the same route as well. I can
handle the rebase when applying, and once the bindings get accept, you
can ask Geert to upstream the last 3 patchs. Would that work for you ?

> Lad Prabhakar (7):
>   dt-bindings: display: renesas,du: Document the r8a7742 bindings
>   drm: rcar-du: Add r8a7742 support
>   dt-bindings: display: renesas,lvds: Document r8a7742 bindings
>   drm: rcar-du: lvds: Add r8a7742 support
>   ARM: dts: r8a7742: Add DU support
>   ARM: dts: r8a7742: Add LVDS support
>   ARM: dts: r8a7742-iwg21d-q7: Add LCD support
> 
>  .../bindings/display/bridge/renesas,lvds.txt  |  1 +
>  .../bindings/display/renesas,du.txt           |  2 +
>  arch/arm/boot/dts/r8a7742-iwg21d-q7.dts       | 84 +++++++++++++++++
>  arch/arm/boot/dts/r8a7742.dtsi                | 89 +++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  5 +-
>  drivers/gpu/drm/rcar-du/rcar_lvds.c           |  1 +
>  6 files changed, 180 insertions(+), 2 deletions(-)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
