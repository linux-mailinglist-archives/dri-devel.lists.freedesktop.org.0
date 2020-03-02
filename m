Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5BD175B95
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 14:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1269A6E409;
	Mon,  2 Mar 2020 13:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DD86E3EF;
 Mon,  2 Mar 2020 13:28:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BCB19D0;
 Mon,  2 Mar 2020 14:28:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583155704;
 bh=uZsuH7X6ASAn+5GpGL00id9lZWpdGCeWDkVOOpg016c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IqXeQHyCjTpTMpUxsZ/HKu1kdPLfv4+oYVk9mFaLNrFQ9zPnNxbfQF4gvwyQ3iY4P
 om5vanNRSYHzFCql07959ZGNTBoDsGV5tVD3mzgZL0MEGKDDELNhWJ+H+XpIkTwUaF
 2MK8q4SEeAocvnUWVl9WE9kMBZRjZ4TzaDgTgw18=
Date: Mon, 2 Mar 2020 15:27:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: [PATCH 8/9] drm/fb-helper: Remove drm_fb_helper add, add_all and
 remove connector functions
Message-ID: <20200302132758.GO11960@pendragon.ideasonboard.com>
References: <20200302125649.61443-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200302125649.61443-9-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302125649.61443-9-pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pankaj,

Thank you for the patch.

On Mon, Mar 02, 2020 at 06:26:48PM +0530, Pankaj Bharadiya wrote:
> drm_fb_helper_single_add_all_connectors(), drm_fb_helper_add_one_connector()
> and drm_fb_helper_remove_one_connector() doesn't keep an array of

s/doesn't/don't/

> connectors anymore and are just dummy. Now we have no callers to these
> functions hence remove them.
> 
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>

I like this :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/drm/drm_fb_helper.h | 21 ---------------------
>  1 file changed, 21 deletions(-)
> 
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index 62e8dda6d1d1..208dbf87afa3 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -451,27 +451,6 @@ drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp)
>  
>  #endif
>  
> -/* TODO: There's a todo entry to remove these three */
> -static inline int
> -drm_fb_helper_single_add_all_connectors(struct drm_fb_helper *fb_helper)
> -{
> -	return 0;
> -}
> -
> -static inline int
> -drm_fb_helper_add_one_connector(struct drm_fb_helper *fb_helper,
> -				struct drm_connector *connector)
> -{
> -	return 0;
> -}
> -
> -static inline int
> -drm_fb_helper_remove_one_connector(struct drm_fb_helper *fb_helper,
> -				   struct drm_connector *connector)
> -{
> -	return 0;
> -}
> -
>  /**
>   * drm_fb_helper_remove_conflicting_framebuffers - remove firmware-configured framebuffers
>   * @a: memory range, users of which are to be removed

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
