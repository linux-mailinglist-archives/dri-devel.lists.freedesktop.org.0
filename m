Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 334F093776B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 14:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B7210EBF7;
	Fri, 19 Jul 2024 12:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ho4Y9oFp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A6710EBF7
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 12:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721390484; x=1752926484;
 h=date:from:to:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WNd9tR9+T8DWT12KMw4ze7wVL8WqVO5XKxb/N7DC4us=;
 b=Ho4Y9oFpEWcKXJhPuJwJOtru14S6/8YseJDSwqLrqx1OupOzWPkgDF1B
 o8pb+RNq3S0mxxXl5jNRYj/O5s4qc5z7JDCbJGkru1v+011BQoRb5r6Sk
 gl6xiUtayrjTIABrKRHs4xumHYFrOWrOxSCJqWOlShI+WalODSeen5zKK
 Ns2QyM1KT9hLnOgAT+jlf4/qR16W6ccpBam/6XF94DYyA7NjH1Y0VPdUs
 HpNMLYDobuENUNKWy7VSzDg8BE87iweG/FrCg0gGK8OuuKo46LWNu6k+u
 S39UzFii7R11VlxhBLPfCP/jQld+7GLXCVs6CLYhJ1VI+vF4mlqXDPvCG g==;
X-CSE-ConnectionGUID: rtApPKeAQXCYWTlUKUYP9Q==
X-CSE-MsgGUID: 69HmtCWTRe+XsE+revkrZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="18811513"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="18811513"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 05:01:23 -0700
X-CSE-ConnectionGUID: Ge3AtZwgTEm8Zynvhpoz3A==
X-CSE-MsgGUID: fQRqi2R7STS7FMsIiid7Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="51158455"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 05:01:18 -0700
Date: Fri, 19 Jul 2024 15:01:33 +0300
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
Message-ID: <ZppVnTtQAGUDqPdO@ideak-desk.fi.intel.com>
References: <20240719103615.1489714-1-jfalempe@redhat.com>
 <ZppQWb05llyndFh-@ideak-desk.fi.intel.com>
 <ZppRX2d88APfac0G@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZppRX2d88APfac0G@ideak-desk.fi.intel.com>
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

On Fri, Jul 19, 2024 at 02:43:27PM +0300, Imre Deak wrote:
> On Fri, Jul 19, 2024 at 02:39:11PM +0300, Imre Deak wrote:
> > On Fri, Jul 19, 2024 at 12:36:08PM +0200, Jocelyn Falempe wrote:
> > > This breaks build if DRM_PANIC is not enabled.
> > > 
> > > Fixes: de338c754d40 ("drm/panic: Add missing static inline to drm_panic_is_enabled()")
> 
> The fix is actually for 9f774c42a908 ("drm/panic: Add drm_panic_is_enabled()")

A related issue, DRM_CONFIG_PANIC=y is also borked for me:

  CC [M]  drivers/gpu/drm/drm_panic.o
drivers/gpu/drm/drm_panic.c:712:6: error: no previous prototype for ‘drm_panic_is_enabled’ [-Werror=missing-prototypes]
  712 | bool drm_panic_is_enabled(struct drm_device *dev)
      |      ^~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

> > > Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> > 
> > Thanks for the quick fix:
> > Reviewed-by: Imre Deak <imre.deak@intel.com>
> > 
> > > ---
> > >  drivers/gpu/drm/drm_crtc_internal.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
> > > index c10de39cbe83..bbac5350774e 100644
> > > --- a/drivers/gpu/drm/drm_crtc_internal.h
> > > +++ b/drivers/gpu/drm/drm_crtc_internal.h
> > > @@ -321,7 +321,7 @@ drm_edid_load_firmware(struct drm_connector *connector)
> > >  #ifdef CONFIG_DRM_PANIC
> > >  bool drm_panic_is_enabled(struct drm_device *dev);
> > >  #else
> > > -bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
> > > +static inline bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
> > >  #endif
> > >  
> > >  #endif /* __DRM_CRTC_INTERNAL_H__ */
> > > -- 
> > > 2.45.2
> > > 
