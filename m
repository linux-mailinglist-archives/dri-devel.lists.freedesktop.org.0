Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2D71F11A7
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 05:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210886E237;
	Mon,  8 Jun 2020 03:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0B46E237
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 03:15:03 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B78224F;
 Mon,  8 Jun 2020 05:15:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1591586101;
 bh=QV+lOpDHo16YfLuKBoENBe5tM6xEu1jtBHj3UkizTv8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JfSonrYL8scdiV0ujrp9dSHanx/mEez8yCzlmmPGHkOSeVuHVmKeJoa/fcTDhnMOo
 3z1YreiphJWoe8mBDNz4NIUuPkYYq2GkVAPs1k45uN+01HsvFVSEgbKnvwBQ0849eQ
 OG4dAoWP+3Pm+35LFCOL0SYCokdrlsUrAIu0/Xzc=
Date: Mon, 8 Jun 2020 06:14:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH v2] drm/rcar-du: DRM_RCAR_WRITEBACK depends on DRM
Message-ID: <20200608031442.GP22208@pendragon.ideasonboard.com>
References: <20200608025340.3050-1-cai@lca.pw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200608025340.3050-1-cai@lca.pw>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Qian,

Thank you for the patch.

On Sun, Jun 07, 2020 at 10:53:40PM -0400, Qian Cai wrote:
> There is no need to select DRM_RCAR_WRITEBACK if DRM=n which just make

s/DRM=n/DRM_RCAR_DU=n/ here.

> the generated .config a bit ugly.
> 
>  # ARM devices
>  #
>  # end of ARM devices
> 
>  CONFIG_DRM_RCAR_WRITEBACK=y
> 
>  #
>  # Frame buffer Devices
> 
> Let DRM_RCAR_WRITEBACK depend on DRM_RCAR_DU instead.
> 
> Signed-off-by: Qian Cai <cai@lca.pw>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

No need to submit a v3 if you agree with the above change, I'll fix it
in my tree.

> ---
>  drivers/gpu/drm/rcar-du/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index 0919f1f159a4..3304b41f5611 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -48,3 +48,4 @@ config DRM_RCAR_VSP
>  config DRM_RCAR_WRITEBACK
>  	bool
>  	default y if ARM64
> +	depends on DRM_RCAR_DU

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
