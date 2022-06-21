Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4534C552CA7
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 10:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC2010E78F;
	Tue, 21 Jun 2022 08:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9657A10E78F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 08:15:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A307104;
 Tue, 21 Jun 2022 10:15:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1655799351;
 bh=1fJkWA34sSxyS4pG2LuUtpwFWeVCMLXYGaocTwp3L3k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ss4ZbZJJGJ85IgEX7cxHKlpU+ThSQHoUTmht2inNWpBGV1SjbYj66PnwUL0Jz24D6
 RKnPTSewoEwHJYqwjJGSjjgXXee8Q4c3qYNqAzZuPS0RhIdu5xCOLWmLcgOriF2LOC
 8kMi4KuUait7MJbloufepu24dJ0uW/wHn76zUw+0=
Date: Tue, 21 Jun 2022 11:15:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/xlnx: Fix build failure due to missing include
Message-ID: <YrF+J5J5l6UEgPcU@pendragon.ideasonboard.com>
References: <20220621075648.7717-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220621075648.7717-1-ville.syrjala@linux.intel.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Hyun Kwon <hyun.kwon@xilinx.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville,

Thank you for the patch.

On Tue, Jun 21, 2022 at 10:56:48AM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Dropping drm_blend.h from drm_crtc.h broke the
> xlnx driver. Make it build again by including
> drm_blend.h from the driver directly.
> 
> My .config was missing some required dependencies so
> I never build tested it :/
> 
> Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Fixes: 90bb087f6674 ("drm: Drop drm_blend.h from drm_crtc.h")
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index 11c409cbc88e..cc32aa89cf8f 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -12,6 +12,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_atomic_uapi.h>
> +#include <drm/drm_blend.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_fb_cma_helper.h>

-- 
Regards,

Laurent Pinchart
