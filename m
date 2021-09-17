Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3902140F826
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188006EC70;
	Fri, 17 Sep 2021 12:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2806EC6E;
 Fri, 17 Sep 2021 12:42:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="286474466"
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="286474466"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 05:42:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="611265400"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 17 Sep 2021 05:42:11 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 17 Sep 2021 15:42:10 +0300
Date: Fri, 17 Sep 2021 15:42:10 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 manasi.d.navare@intel.com
Subject: Re: [PATCH v3 10/13] drm/i915/dp: add HAS_DP20 macro
Message-ID: <YUSNIlxl+fZgdmpu@intel.com>
References: <cover.1631191763.git.jani.nikula@intel.com>
 <3746e700641bc17eff270569387fe869707d92ed.1631191763.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3746e700641bc17eff270569387fe869707d92ed.1631191763.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 09, 2021 at 03:52:02PM +0300, Jani Nikula wrote:
> Let's abstract the DP 2.0 feature. Initially just DG2.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/i915_drv.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 37c1ca266bcd..14416bd789b6 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1641,6 +1641,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  #define HAS_IPS(dev_priv)	(IS_HSW_ULT(dev_priv) || IS_BROADWELL(dev_priv))
>  
>  #define HAS_DP_MST(dev_priv)	(INTEL_INFO(dev_priv)->display.has_dp_mst)
> +#define HAS_DP20(dev_priv)	(IS_DG2(dev_priv))
>  
>  #define HAS_CDCLK_CRAWL(dev_priv)	 (INTEL_INFO(dev_priv)->display.has_cdclk_crawl)
>  #define HAS_DDI(dev_priv)		 (INTEL_INFO(dev_priv)->display.has_ddi)
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
