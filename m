Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FD29F0DCA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 14:51:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28EA010E193;
	Fri, 13 Dec 2024 13:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ro/AlE0r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF6510E193;
 Fri, 13 Dec 2024 13:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734097909; x=1765633909;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dXTJiavmLa+FSgZqxsR2eLyZWYaFgFIvOUc9tJ9Y6FM=;
 b=Ro/AlE0rJTs87cXoUT0Dd7UouYj5SEOSLjnd2vlZ4yZoIRoXW3KxQcZ5
 0AY8Z4VFHiIsfUSOV7xo6hCuInsZKqU3iKrz8vg1f675/yrNmOx2Dnue1
 6PbAYg2RyH0i4G0GC3E9nUYHs1RIbvrD8TnwfP19CK9RtKCYd3iIUDRSa
 RWZHQzvGdix142pBqj/Nivwhgy6/Rc7kxGT66tEMPjhlI5N4qF1RUr/lF
 StzMZkKBibALau2iGDLmEF71p0k+wRXSEZ9GmSEgzMb6EErcyQjj1IgwT
 IWeUGGeAVa5QDa10HDUq0/HTizWrJoz9B40oXoZ8i6Uh8SA9Oa5uQKlvM A==;
X-CSE-ConnectionGUID: nxrCxq5eSzyQr1vUxUdE/w==
X-CSE-MsgGUID: 5RWGmR87QTStEr8s3jHlZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34462849"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="34462849"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 05:51:49 -0800
X-CSE-ConnectionGUID: zym8lQjpSa2IP97Y9QWR7w==
X-CSE-MsgGUID: CH4VQP7ITuG0Rzp495xfuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="96311171"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 05:51:44 -0800
Date: Fri, 13 Dec 2024 15:51:41 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, christian.koenig@amd.com,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v10 1/4] drm: Introduce device wedged event
Message-ID: <Z1w77fAac2vOaIEd@black.fi.intel.com>
References: <20241128153707.1294347-1-raag.jadav@intel.com>
 <20241128153707.1294347-2-raag.jadav@intel.com>
 <9557db3c-0837-4dfb-ba69-84dbaf13f082@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9557db3c-0837-4dfb-ba69-84dbaf13f082@igalia.com>
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

On Thu, Dec 12, 2024 at 03:31:01PM -0300, André Almeida wrote:
> Hi Raag,
> 
> Thank you for your patch.
> 
> Em 28/11/2024 12:37, Raag Jadav escreveu:
> 
> [...]
> 
> > +int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
> > +{
> > +	const char *recovery = NULL;
> > +	unsigned int len, opt;
> > +	/* Event string length up to 28+ characters with available methods */
> > +	char event_string[32];
> > +	char *envp[] = { event_string, NULL };
> > +
> > +	len = scnprintf(event_string, sizeof(event_string), "%s", "WEDGED=");
> > +
> > +	for_each_set_bit(opt, &method, BITS_PER_TYPE(method)) {
> > +		recovery = drm_get_wedge_recovery(opt);
> > +		if (drm_WARN(dev, !recovery, "device wedged, invalid recovery method %u\n", opt))
> > +			break;
> > +
> > +		len += scnprintf(event_string + len, sizeof(event_string), "%s,", recovery);
> > +	}
> > +
> > +	if (recovery)
> > +		/* Get rid of trailing comma */
> > +		event_string[len - 1] = '\0';
> > +	else
> > +		/* Caller is unsure about recovery, do the best we can at this point. */
> > +		snprintf(event_string, sizeof(event_string), "%s", "WEDGED=unknown");
> > +
> > +	drm_info(dev, "device wedged, needs recovery\n");
> 
> As documented in the commit message "No explicit device recovery is expected
> from the consumer in this case", I think this should be like this:
> 
> if (method != DRM_WEDGE_RECOVERY_NONE)
>     drm_info(dev, "device wedged, needs recovery\n");
> 
> and maybe a note like this:
> 
> else
>     drm_info(dev, "device reseted, but managed to recover\n");

Or perhaps

	drm_info(dev, "device wedged, but recovered through reset\n");

> Either way, this patch is:
> 
> Reviewed-by: André Almeida <andrealmeid@igalia.com>

Thanks for the review.

Raag
