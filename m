Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A9FABDA87
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 15:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5CB10E605;
	Tue, 20 May 2025 13:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="irkDxLfo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4066B10E5F1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 13:58:28 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E47474C;
 Tue, 20 May 2025 15:58:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1747749486;
 bh=cm5wVB1zkoN7qTN0thweIU/9ukqLpIMprRnoqNWzwd0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=irkDxLfokkR8JHr7+faQlFKUx6GtK4yylbKoAkYPCZMmIA/D/tsQCxCFOYIYcjan9
 59yA9y/rRUi8eckwercodkDWcQtxGqS9Oe9jE3zFNaQiIQFkqvRNqT/R0z7z/0hd7U
 q5p4gUp9tqRIO4SnXrNURgGo4u7O/udoVpltWbDk=
Date: Tue, 20 May 2025 15:58:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 03/12] drm: renesas: rz-du: mipi_dsi: Add min check
 for VCLK range
Message-ID: <20250520135820.GC13321@pendragon.ideasonboard.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250512182330.238259-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Prabhakar,

On Mon, May 12, 2025 at 07:23:21PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The VCLK range for Renesas RZ/G2L SoC is 148.5 MHz to 5.803 MHz. Add a

I would write "5.803 MHz to 148.5 MHz" as ranges are usually expressed
in increasing order.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> minimum clock check in the mode_valid callback to ensure that the clock
> value does not fall below the valid range.
> 
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
> - No changes
> 
> v3->v4:
> - No changes
> 
> v2->v3:
> - No changes
> 
> v1->v2:
> - Added reviewed tag from Biju 
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index 4550c6d84796..ec8baecb9ba5 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -584,6 +584,9 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
>  	if (mode->clock > 148500)
>  		return MODE_CLOCK_HIGH;
>  
> +	if (mode->clock < 5803)
> +		return MODE_CLOCK_LOW;
> +
>  	return MODE_OK;
>  }
>  

-- 
Regards,

Laurent Pinchart
