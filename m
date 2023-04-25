Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC1C6EDA68
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 04:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7BE10E21C;
	Tue, 25 Apr 2023 02:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F71110E21C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 02:59:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3652375B;
 Tue, 25 Apr 2023 04:59:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1682391580;
 bh=cvn4DhnPBPMal8Tb5PuWsyC0mX3H2c28QvPlu4ba/Ik=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ahw99SUp1Q8PGl1UoX5Sn8kXQOijNZs8iwyLV/GGnonr/Yv7knOCIg4tVXHrcQESQ
 mWzvj5s1A8bKMhbU47hvlDthi4oGfTnXFwEWCDJ2ZFHYjUYqqNzd9rDTjBSzXbjxO1
 9tcixpkbLIHb0kJ8MEBt/FS7ZR6ylC7+fhIxxmO8=
Date: Tue, 25 Apr 2023 06:00:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v8 5/5] MAINTAINERS: Add maintainer for RZ DU drivers
Message-ID: <20230425030001.GC11371@pendragon.ideasonboard.com>
References: <20230424161024.136316-1-biju.das.jz@bp.renesas.com>
 <20230424161024.136316-6-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230424161024.136316-6-biju.das.jz@bp.renesas.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

Thank you for the patch.

On Mon, Apr 24, 2023 at 05:10:24PM +0100, Biju Das wrote:
> Add my self as maintainer for RZ DU drivers.
> While at it, update the entries for rcar-du and shmobile.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v8:
>  * New patch
> ---
>  MAINTAINERS | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1218a2ec6d97..42db5be4482c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6948,7 +6948,7 @@ F:	drivers/gpu/host1x/
>  F:	include/linux/host1x.h
>  F:	include/uapi/drm/tegra_drm.h
>  
> -DRM DRIVERS FOR RENESAS
> +DRM DRIVERS FOR RENESAS RCAR AND SHMOBILE
>  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>  L:	dri-devel@lists.freedesktop.org
> @@ -6959,9 +6959,18 @@ F:	Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
>  F:	Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
>  F:	Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
>  F:	Documentation/devicetree/bindings/display/renesas,du.yaml
> -F:	drivers/gpu/drm/renesas/
> +F:	drivers/gpu/drm/renesas/rcar-du/
> +F:	drivers/gpu/drm/renesas/shmobile/
>  F:	include/linux/platform_data/shmob_drm.h
>  
> +DRM DRIVERS FOR RENESAS RZ
> +M:	Biju Das <biju.das.jz@bp.renesas.com>
> +L:	dri-devel@lists.freedesktop.org
> +L:	linux-renesas-soc@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> +F:	drivers/gpu/drm/renesas/rz-du/
> +
>  DRM DRIVERS FOR ROCKCHIP
>  M:	Sandy Huang <hjc@rock-chips.com>
>  M:	Heiko Stübner <heiko@sntech.de>

-- 
Regards,

Laurent Pinchart
