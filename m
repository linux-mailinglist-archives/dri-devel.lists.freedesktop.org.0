Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 651F6BB3EE4
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 14:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F038F10E7DA;
	Thu,  2 Oct 2025 12:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vaZHRXzz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FE410E7DA
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 12:47:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3B185929;
 Thu,  2 Oct 2025 14:46:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1759409171;
 bh=10qfnOH1V7V4fSOnAg7xdvk9UP941K9D3WD/YuFXX9I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vaZHRXzzpFB2cXLirBHqrnXxqjS540/w70XXVMhh0eUix7BcmEOA6Hfrjt3A/3OeX
 TSC+MLCSB9cuQHWT6+19J4UmatH4U5GPoAxM6IFPhQzrYUXxMQ6/+bv0L8lKvasATq
 6knGIviTJ9vMBpJp5iHh1DXpJqOOx7BlInPwTa8c=
Date: Thu, 2 Oct 2025 15:47:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] drm: renesas: rz-du: Drop ARCH_RZG2L dependency
Message-ID: <20251002124735.GB10198@pendragon.ideasonboard.com>
References: <20251002123452.146610-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251002123452.146610-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Thu, Oct 02, 2025 at 01:34:52PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The RZ/G2L DU driver is now also used on other Renesas SoCs such as
> RZ/V2H(P) and RZ/V2N. Restricting it to ARCH_RZG2L prevents enabling it
> on these newer platforms.
> 
> Replace the ARCH_RZG2L dependency with ARCH_RENESAS to allow the driver
> to be built on all relevant Renesas SoCs.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Happy to see the driver getting used more widely. Coming-of-age is
always a special time, for software too :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/rz-du/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/renesas/rz-du/Kconfig
> index 34d515eb798b..8bbcc66ca3f0 100644
> --- a/drivers/gpu/drm/renesas/rz-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  config DRM_RZG2L_DU
>  	tristate "DRM Support for RZ/G2L Display Unit"
> -	depends on ARCH_RZG2L || COMPILE_TEST
> +	depends on ARCH_RENESAS || COMPILE_TEST
>  	depends on DRM && OF
>  	depends on VIDEO_RENESAS_VSP1
>  	select DRM_CLIENT_SELECTION

-- 
Regards,

Laurent Pinchart
