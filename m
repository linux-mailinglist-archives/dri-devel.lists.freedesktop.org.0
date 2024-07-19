Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC39937742
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 13:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B98410EBEB;
	Fri, 19 Jul 2024 11:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7S5pgyr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28D010EBEB
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 11:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721389395; x=1752925395;
 h=date:from:to:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=4i+t9YRD9iLLoV4ZqdUtk0cjUPcXqZMCoNHfRxHTS5Q=;
 b=W7S5pgyrJLvFfdDVajmr2Xmx4pzt3sYMhvjARRv/cRmHKn+mqy2/fP8n
 GR0/P0SR8uLrSypUPFv07VN35KDpqssZPPtYEpsWraDGhFUz3qM7OOMh1
 1qucnL62oNmNUM7t2rQ2P9uEUwQasVGV4liMpivm4itI/s5oKFFwGL2+o
 Ulp3r2axjZx4TK9bJoVVJshQuJLW6VXRr8vSJHSSwOERF4lUU+37JwRdJ
 te6jFFeUOpRvUxf234P5XCA8vwRMnQ+62+/TvWylcJKxKObdhm3B73HSD
 g64JHZ7ZJb5QpH0/Y9aqCmSNdbyc1jFraNs3KzXxrFc0NYC2+Oy++wugw A==;
X-CSE-ConnectionGUID: DrE+dgD1Sv+DZ8HHafQXVg==
X-CSE-MsgGUID: mbLAMKyRQ/eX5FMu1HdLpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="29575244"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="29575244"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 04:43:14 -0700
X-CSE-ConnectionGUID: 5pmeugb/QoK0tLhGNlyuXA==
X-CSE-MsgGUID: 1k205ZbrQteaf9IHBTJ1ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="50966575"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 04:43:12 -0700
Date: Fri, 19 Jul 2024 14:43:27 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/panic: Add missing static inline to
 drm_panic_is_enabled()
Message-ID: <ZppRX2d88APfac0G@ideak-desk.fi.intel.com>
References: <20240719103615.1489714-1-jfalempe@redhat.com>
 <ZppQWb05llyndFh-@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZppQWb05llyndFh-@ideak-desk.fi.intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 19, 2024 at 02:39:11PM +0300, Imre Deak wrote:
> On Fri, Jul 19, 2024 at 12:36:08PM +0200, Jocelyn Falempe wrote:
> > This breaks build if DRM_PANIC is not enabled.
> > 
> > Fixes: de338c754d40 ("drm/panic: Add missing static inline to drm_panic_is_enabled()")

The fix is actually for 9f774c42a908 ("drm/panic: Add drm_panic_is_enabled()")

> > Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Thanks for the quick fix:
> Reviewed-by: Imre Deak <imre.deak@intel.com>
> 
> > ---
> >  drivers/gpu/drm/drm_crtc_internal.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
> > index c10de39cbe83..bbac5350774e 100644
> > --- a/drivers/gpu/drm/drm_crtc_internal.h
> > +++ b/drivers/gpu/drm/drm_crtc_internal.h
> > @@ -321,7 +321,7 @@ drm_edid_load_firmware(struct drm_connector *connector)
> >  #ifdef CONFIG_DRM_PANIC
> >  bool drm_panic_is_enabled(struct drm_device *dev);
> >  #else
> > -bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
> > +static inline bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
> >  #endif
> >  
> >  #endif /* __DRM_CRTC_INTERNAL_H__ */
> > -- 
> > 2.45.2
> > 
