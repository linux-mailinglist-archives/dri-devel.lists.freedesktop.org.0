Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B779B5B3421
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 11:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BE110EC49;
	Fri,  9 Sep 2022 09:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB4110EC49
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 09:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662716345; x=1694252345;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=v0yTkSbp1DpFjoebmm1PHe77n5ETDuujEpo09Co3J3g=;
 b=lakteiOw8OiXi0jbMCQnpqXULTOd+0cb+rmBI8VduILjWV5RwfojjHKl
 hmuzAcPSvM62Ksak70LhpWd4jnRcVvXbia5ceiL0TQyaO3npyeSMyn0sH
 LKLrUj+Dk4nGPcNIJ8CCcZFCxsTiTr3F+0ySaZ9NZ/fAf/tGiqDj/fdZK
 WqbVl8RIQWmIOBmyHkjxxSILP2P5FzHFFqQUOwV00bHr7geZ4phMlpa8T
 +x1kauOyI2Ldf2mck/sIe+uaDVQGl4wyW5aDWt61W7TFlkXQB8kfr0PPs
 h7mK3se6Ww/yfb4Lay38eTx8Ui4FtwLVM7g9S/xp4PpJDZPhRFSDa6AhX w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="280462944"
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; d="scan'208";a="280462944"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 02:39:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; d="scan'208";a="645471384"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga008.jf.intel.com with SMTP; 09 Sep 2022 02:39:02 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 09 Sep 2022 12:39:01 +0300
Date: Fri, 9 Sep 2022 12:39:01 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm/sun4i: tv: Include drm_atomic.h
Message-ID: <YxsJtf6VRaNTqXUa@intel.com>
References: <20220909093116.4141982-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220909093116.4141982-1-maxime@cerno.tech>
X-Patchwork-Hint: comment
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 09, 2022 at 11:31:16AM +0200, Maxime Ripard wrote:
> Commit ec491291dc94 ("drm/sun4i: tv: Merge mode_set into atomic_enable")
> has introduced a call to drm_atomic_get_new_crtc_state(), but didn't
> include drm_atomic.h.
> 
> On CONFIG_OF systems, this is fine because drm_atomic.h is included by
> drm_of.h through drm_bridge.h. However, whenever CONFIG_OF isn't set, we
> end up with a compilation error.
> 
> Fixes: ec491291dc94 ("drm/sun4i: tv: Merge mode_set into atomic_enable")
> Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Also caught by the robot since then:
https://lists.freedesktop.org/archives/dri-devel/2022-September/371257.html

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/sun4i/sun4i_tv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
> index 74ff5ad6a8b9..c65f0a89b6b0 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
> @@ -14,6 +14,7 @@
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
>  
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
> -- 
> 2.37.1

-- 
Ville Syrjälä
Intel
