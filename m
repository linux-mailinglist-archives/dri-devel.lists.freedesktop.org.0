Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A52A39EAF29
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 12:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AAF10E3A0;
	Tue, 10 Dec 2024 11:08:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U8tXGh05";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600B310E3A0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 11:08:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F3EF752;
 Tue, 10 Dec 2024 12:08:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733828891;
 bh=DBnbhjkdJSnKBI/tnnIo1zsbOX9XVkFGe0UVm4dZi6g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U8tXGh05b6ghXdhKFpG7CRTTeNJngGryJSdzasrk3K9EpbHS3qtJOg04YslNCwAZl
 IU6mSe35Cn7xwtuulASj8SAmTaqjJqSasx5ZrhbmIHshr+iJ7qdCXg7CG3QQ7x4l8K
 4SljSuIVpjZKdZCxEAf58Vbd+IKF3k+lO3nZIBpw=
Date: Tue, 10 Dec 2024 13:08:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v2 1/2] drm: renesas: rz-du: Drop DU_MCR0_DPI_OE macro
Message-ID: <20241210110827.GE573@pendragon.ideasonboard.com>
References: <20241022082433.32513-1-biju.das.jz@bp.renesas.com>
 <20241022082433.32513-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022082433.32513-2-biju.das.jz@bp.renesas.com>
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

Hi Biju,

Thank you for the patch.

On Tue, Oct 22, 2024 at 09:24:23AM +0100, Biju Das wrote:
> The DPI_OE bit is removed from the latest RZ/G2UL and RZ/G2L hardware
> manual. So, drop this macro.
> 
> Fixes: b330f1480172 ("drm: renesas: rz-du: Add RZ/G2UL DU Support")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v1->v2:
>  * Added Fixes tag.
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> index c4c1474d487e..6e7aac6219be 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> @@ -28,7 +28,6 @@
>  #include "rzg2l_du_vsp.h"
>  
>  #define DU_MCR0			0x00
> -#define DU_MCR0_DPI_OE		BIT(0)
>  #define DU_MCR0_DI_EN		BIT(8)
>  
>  #define DU_DITR0		0x10
> @@ -217,14 +216,9 @@ static void rzg2l_du_crtc_put(struct rzg2l_du_crtc *rcrtc)
>  
>  static void rzg2l_du_start_stop(struct rzg2l_du_crtc *rcrtc, bool start)
>  {
> -	struct rzg2l_du_crtc_state *rstate = to_rzg2l_crtc_state(rcrtc->crtc.state);
>  	struct rzg2l_du_device *rcdu = rcrtc->dev;
> -	u32 val = DU_MCR0_DI_EN;
>  
> -	if (rstate->outputs & BIT(RZG2L_DU_OUTPUT_DPAD0))
> -		val |= DU_MCR0_DPI_OE;
> -
> -	writel(start ? val : 0, rcdu->mmio + DU_MCR0);
> +	writel(start ? DU_MCR0_DI_EN : 0, rcdu->mmio + DU_MCR0);
>  }
>  
>  static void rzg2l_du_crtc_start(struct rzg2l_du_crtc *rcrtc)

-- 
Regards,

Laurent Pinchart
