Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D1CA20910
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 11:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9742810E648;
	Tue, 28 Jan 2025 10:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L1hr0C/n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224A110E648
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 10:56:25 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 968EC6DF;
 Tue, 28 Jan 2025 11:55:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1738061716;
 bh=FoU1Bn2fATcpBi0/ZF4ZzVjOlm3v0fAt6pCwFUvlt2w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L1hr0C/nku3UQfyc+n71GfVy68QOpkXUcTJnmma5QpyfmRnHh5uGD1a39L2S//L8F
 qJTcASuKvE1NLl+CPmLMdmkRKyhqWf9HSeZ6gO02R2O47pS4Lkia86PIYs0Oh+H5CW
 PBRNeifTryjVn06kSWjTiOPw+ISoBZS+3+oO5RcA=
Date: Tue, 28 Jan 2025 12:56:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Update drm/rcar-du maintainers
Message-ID: <20250128105612.GC13628@pendragon.ideasonboard.com>
References: <20250128-rcar-du-maintainers-v1-1-c429ca421c52@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250128-rcar-du-maintainers-v1-1-c429ca421c52@ideasonboard.com>
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

Hi Tomi,

Thank you for the patch.

On Tue, Jan 28, 2025 at 12:28:48PM +0200, Tomi Valkeinen wrote:
> Add myself as drm/rcar-du maintainer. Switch Kieran from a maintainer to
> reviewer.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ed86d884ee0d..5b1bf5fd56fd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7760,7 +7760,8 @@ F:	include/uapi/drm/tegra_drm.h
>  
>  DRM DRIVERS FOR RENESAS R-CAR
>  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> -M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> +M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Shouldn't this be

M:	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

? While at it, you can add +renesas to my e-mail address too.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +R:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>  L:	dri-devel@lists.freedesktop.org
>  L:	linux-renesas-soc@vger.kernel.org
>  S:	Supported
> 
> ---
> base-commit: e2a81c0cd7de6cb063058be304b18f200c64802b
> change-id: 20250128-rcar-du-maintainers-34ee66948f04

-- 
Regards,

Laurent Pinchart
