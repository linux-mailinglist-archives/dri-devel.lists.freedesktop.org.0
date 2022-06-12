Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3975547AD6
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jun 2022 17:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0352210E3E7;
	Sun, 12 Jun 2022 15:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F4110E3E7
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 15:39:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2009451C;
 Sun, 12 Jun 2022 17:39:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1655048352;
 bh=DBACanEoDtCFyfbrlzWg2ZMJWzGjDeaS0ZNau1BohsU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=doLvBjWZSgFyKl+zsgQO6Up3ANHe7/LABwvqP3QTUCNUFOpikwJcjPHbP7UU1VroN
 RwFKZt1O06p/U8eo7rvFmNQ/1TGrRwwJ8Ws7EjqxzgqI11Nb3puCInDAhL0hTS+8uM
 D+9BtPTu10Q/FxxHgEewjf9FEixOWgzLq7WKZqDw=
Date: Sun, 12 Jun 2022 18:39:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/3] drm: of: Mark empty drm_of_get_data_lanes_count and
 drm_of_get_data_lanes_ep static
Message-ID: <YqYImIEjCQQuVBqk@pendragon.ideasonboard.com>
References: <20220612132152.91052-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220612132152.91052-1-marex@denx.de>
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
Cc: kernel test robot <lkp@intel.com>, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

Thank you for the patch.

On Sun, Jun 12, 2022 at 03:21:50PM +0200, Marek Vasut wrote:
> Mark empty implementations of drm_of_get_data_lanes_count and
> drm_of_get_data_lanes_ep as static inline, just like the rest
> of empty implementations of various functions in drm_of.h .
> Add missing comma to drm_of_get_data_lanes_count_ep() .
> 
> Fixes: fc801750b197 ("drm: of: Add drm_of_get_data_lanes_count and drm_of_get_data_lanes_ep")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> To: dri-devel@lists.freedesktop.org

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/drm/drm_of.h | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
> index 92387eabcb6f0..10ab58c407467 100644
> --- a/include/drm/drm_of.h
> +++ b/include/drm/drm_of.h
> @@ -112,16 +112,18 @@ drm_of_lvds_get_data_mapping(const struct device_node *port)
>  	return -EINVAL;
>  }
>  
> -int drm_of_get_data_lanes_count(const struct device_node *endpoint,
> -				const unsigned int min, const unsigned int max)
> +static inline int
> +drm_of_get_data_lanes_count(const struct device_node *endpoint,
> +			    const unsigned int min, const unsigned int max)

Unrelated to this patch, do we need "const" for the unsigned int
arguments ?

>  {
>  	return -EINVAL;
>  }
>  
> -int drm_of_get_data_lanes_count_ep(const struct device_node *port,
> -				   int port_reg, int reg
> -				   const unsigned int min,
> -				   const unsigned int max)
> +static inline int
> +drm_of_get_data_lanes_count_ep(const struct device_node *port,
> +			       int port_reg, int reg,
> +			       const unsigned int min,
> +			       const unsigned int max)
>  {
>  	return -EINVAL;
>  }

-- 
Regards,

Laurent Pinchart
