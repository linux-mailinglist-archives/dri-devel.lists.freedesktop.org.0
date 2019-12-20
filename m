Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6F8128434
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 23:00:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A9089C1B;
	Fri, 20 Dec 2019 22:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FDB89C1B
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 22:00:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD25EB23;
 Fri, 20 Dec 2019 23:00:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576879216;
 bh=uN7+8aUG1CIgIkMUMRu1BgxsMXDxI+3/V+nhRzxAyEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cvBA0LQ8bt0yN8zglzi7nuk91qOzfqNqV29ygAvnygzSIaz7jVhAAfiCtk8o3IJZn
 QegHdDzWP0AuZOVLa2J81o7pVqJ3XU+RhHtmtgaEcSvBkPgdUa49XCsJL1bxNBF3C4
 BlTbtiwpTu1/yQIy0q3/4TVwjA+Yc/Mlrz5lXNaE=
Date: Sat, 21 Dec 2019 00:00:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/of: Add missing static inline to
 get_dual_link_pixel_order stub
Message-ID: <20191220220002.GF4865@pendragon.ideasonboard.com>
References: <20191220213816.627188-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191220213816.627188-1-chris@chris-wilson.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris,

Thank you for the patch.

On Fri, Dec 20, 2019 at 09:38:16PM +0000, Chris Wilson wrote:
> Mark up the stub drm_of_lvds_get_dual_link_pixel_order() as being a
> static inline to avoid a double definition.
> 
> Fixes: 6529007522de ("drm: of: Add drm_of_lvds_get_dual_link_pixel_order")
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I've already submitted [1] which fixes the same issue.

Now that I look at it, I don't see Fabrizio's Reviewed-by reply in the
mailing list archive or in patchwork. Fabrizio, could you try to resend
it so it can be picked from patchwork ?

[1] https://www.spinics.net/lists/dri-devel/msg241747.html

> ---
>  include/drm/drm_of.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
> index 8ec7ca6d2369..b9b093add92e 100644
> --- a/include/drm/drm_of.h
> +++ b/include/drm/drm_of.h
> @@ -92,8 +92,9 @@ static inline int drm_of_find_panel_or_bridge(const struct device_node *np,
>  	return -EINVAL;
>  }
>  
> -int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
> -					  const struct device_node *port2)
> +static inline int
> +drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
> +				      const struct device_node *port2)
>  {
>  	return -EINVAL;
>  }

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
