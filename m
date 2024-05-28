Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB2C8D250F
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 21:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7DC10E564;
	Tue, 28 May 2024 19:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZsuCUYTX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88C710E564
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 19:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716925518; x=1748461518;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kM/pIC/ppuRtK19qJ4UbJ+BXfYwVPpDieRmUguFn1Xo=;
 b=ZsuCUYTXVl0l8bYFmURmWJSyBhQkc80fxmtN4ou5Cj9NQNCLn8NBA/oG
 pWtK+7tQLlqofnhOeFe5LB+UWRQ40yu1UlKWrRMJ31y6+Ma8/u4w0dk69
 bVwIJblZBaaEANyRDFzgoNRgWRVF3+cLtWktnE1iQlenj443EpW5FndXi
 tAhVkqhfgQFjgC0wDuoEA5MrTe7LjKZLAZ1Se8R7NQTIkJvUYUmU5UMmk
 Lk/lCmMr1FD0uCAOADcUslwBNL23U9ggJSTXTxIy5hbqDsOW6V5g9YYO8
 pMNtfvZi2PASZnJ1HitH7HM8AvozVqJH4I4ZaJ83NXIFoTA571IXmnG6K g==;
X-CSE-ConnectionGUID: lEtmLsZ7THGEXQXo2VG5XA==
X-CSE-MsgGUID: ttVRV9DCRYmCo6r/fFIGow==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13066915"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="13066915"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 12:45:17 -0700
X-CSE-ConnectionGUID: 7EqFwjA5Tz6b+VCWL3vHmg==
X-CSE-MsgGUID: /oKYEW/5RA+hM8LJcy29kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="35161746"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 28 May 2024 12:45:15 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 28 May 2024 22:45:14 +0300
Date: Tue, 28 May 2024 22:45:14 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 07/21] drm/sti: Allow build with COMPILE_TEST=y
Message-ID: <ZlY0SuKRdNu-WqQD@intel.com>
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
 <20240408170426.9285-8-ville.syrjala@linux.intel.com>
 <20240527152909.GB714350@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240527152909.GB714350@gnbcxd0016.gnb.st.com>
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

On Mon, May 27, 2024 at 05:29:09PM +0200, Alain Volmat wrote:
> Hi Ville,
> 
> thank you for your patch.
> 
> On Mon, Apr 08, 2024 at 08:04:12PM +0300, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Allow sti to be built with COMPILE_TEST=y for greater
> > coverage. Builds fine on x86/x86_64 at least.
> > 
> > Cc: Alain Volmat <alain.volmat@foss.st.com>
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/sti/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/sti/Kconfig b/drivers/gpu/drm/sti/Kconfig
> > index 3c7a5feff8de..75c301aadcbc 100644
> > --- a/drivers/gpu/drm/sti/Kconfig
> > +++ b/drivers/gpu/drm/sti/Kconfig
> > @@ -1,7 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  config DRM_STI
> >  	tristate "DRM Support for STMicroelectronics SoC stiH4xx Series"
> > -	depends on OF && DRM && ARCH_STI
> > +	depends on OF && DRM && (ARCH_STI || COMPILE_TEST)
> >  	select RESET_CONTROLLER
> >  	select DRM_KMS_HELPER
> >  	select DRM_GEM_DMA_HELPER
> > -- 
> > 2.43.2
> > 
> 
> Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Thanks. Pushed both sti patches to drm-misc-next.

-- 
Ville Syrjälä
Intel
