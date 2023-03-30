Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F38906D03A4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 13:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4975710E25A;
	Thu, 30 Mar 2023 11:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E2B10E25A;
 Thu, 30 Mar 2023 11:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680176709; x=1711712709;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=k/mv4rPn58080aiy/VkVwoYKI4gFKfYIxJEtnNThHLM=;
 b=bz0lNSO6gt5v9OpPsPbebv2rnEl333OB3/++5m6Oj/oDJcCnm7bZzYKY
 DTRTLNBIaIqfa419Gdu9mCLcOu06x4RcZn74n8VWuBVPi+JQB3C3Gs9Hu
 JHlpzqqExglRg5csnhVy0a6ABuXtkL7f3gk/+dLN+e787gG5Q7dBugHL8
 fDjjdNvz53XwW5L/NOHI3XFm6h8CbbEeG0licbdWpeSH7SU+JZPRAD3mh
 E7EjODGnHyFYfCfmFaRVCoca135b1BrKlLEa/AT10guJqOWm+xc5Tu1f/
 IAmKScn8EEycO1/EGcUEw7vTshJf5JqUat9CNTb0Xi/9D/BmsHFhJkduT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="427419849"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="427419849"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 04:45:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="858890300"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="858890300"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga005.jf.intel.com with SMTP; 30 Mar 2023 04:45:03 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 30 Mar 2023 14:45:02 +0300
Date: Thu, 30 Mar 2023 14:45:02 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm/scdc-helper: Pimp SCDC debugs
Message-ID: <ZCV2Pge2+wdB5HEI@intel.com>
References: <20230329171402.2772-1-ville.syrjala@linux.intel.com>
 <20230330084404.5uku6p42rorcuhv2@penduick>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230330084404.5uku6p42rorcuhv2@penduick>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Emma Anholt <emma@anholt.net>, Jonas Karlman <jonas@kwiboo.se>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 30, 2023 at 10:44:04AM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Mar 29, 2023 at 08:14:02PM +0300, Ville Syrjala wrote:
> > diff --git a/drivers/gpu/drm/display/drm_scdc_helper.c b/drivers/gpu/drm/display/drm_scdc_helper.c
> > index c3ad4ab2b456..2b124152384c 100644
> > --- a/drivers/gpu/drm/display/drm_scdc_helper.c
> > +++ b/drivers/gpu/drm/display/drm_scdc_helper.c
> > @@ -26,6 +26,8 @@
> >  #include <linux/delay.h>
> >  
> >  #include <drm/display/drm_scdc_helper.h>
> > +#include <drm/drm_connector.h>
> > +#include <drm/drm_device.h>
> >  #include <drm/drm_print.h>
> >  
> >  /**
> > @@ -140,6 +142,7 @@ EXPORT_SYMBOL(drm_scdc_write);
> >  
> >  /**
> >   * drm_scdc_get_scrambling_status - what is status of scrambling?
> > + * @connector: connector
> >   * @adapter: I2C adapter for DDC channel
> >   *
> >   * Reads the scrambler status over SCDC, and checks the
> > @@ -148,14 +151,17 @@ EXPORT_SYMBOL(drm_scdc_write);
> >   * Returns:
> >   * True if the scrambling is enabled, false otherwise.
> >   */
> > -bool drm_scdc_get_scrambling_status(struct i2c_adapter *adapter)
> > +bool drm_scdc_get_scrambling_status(struct drm_connector *connector,
> > +				    struct i2c_adapter *adapter)
> 
> Is there any driver where adapter isn't equal to connector->ddc?

I figured most of them since they all maintain their own ddc
pointer elsewhere. But looks like the drivers using the scdc
helper might all be setting connector->ddc for their HDMI
connectors despite that.

Even i915 does that apparently. My recollection was otherwise
since I have a branch waiting somewhere that changes the whole
driver to use connector->ddc.

I guess someone took a bunch of shortcuts to get connector->ddc
populated but then didn't finish the job by clearing out the
old pointers.

> 
> If not, there's no reason to pass both

Yeah, that did cross my mind. But left it out with in
the belief that it can't be done yet.

-- 
Ville Syrjälä
Intel
