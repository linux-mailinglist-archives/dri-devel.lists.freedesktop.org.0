Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BF3958D05
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 19:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE20F10E7E9;
	Tue, 20 Aug 2024 17:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XDGJSjkp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B1D10E7E9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 17:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724174279; x=1755710279;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OxdLYrw3Fv4z03xq74l/9FObGzEEUxYeWrEJIG/DXRY=;
 b=XDGJSjkpHrVg3kbWNEivfPy5XXlReVRJaeoWkblEdCHcmf0IMH+4ewUd
 tnhdK2sQL3qac/6MEXPJAX+j55cw8J2+uNZIT4Vl1LSSkyemo8OYXbgU7
 7Ma+Qqvc280N0tq9NVBrayFUqSfgDWmgTDua+SY93cnrgEzW2xN4c/07T
 hEyyKpeAgKgt3f2kxPLV3ysugmczFw4BWr1N4uRFhurdUXwzAWmteOzPX
 OURbVb7TbySFp1H5aB7vcrq1G8KlkXQss1/f6GnvMU7U33XrmQ9x13nGX
 kqgF5EpxNvRskOoX0eJs65cyt/hpRnxAJwwT5URnlFdtY48XElVAdlm/A Q==;
X-CSE-ConnectionGUID: DeY+8udSRLOCtT9twQqeqQ==
X-CSE-MsgGUID: DC5gXJn4QJCQNEGYTXC4qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="39950000"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="39950000"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:17:58 -0700
X-CSE-ConnectionGUID: xJWUE69HSnCyTK9IAsxu8w==
X-CSE-MsgGUID: WQyr+7NyRB+hSvQh/sg7og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="64998703"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:17:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sgSUM-0000000HNmN-3fcK; Tue, 20 Aug 2024 20:17:46 +0300
Date: Tue, 20 Aug 2024 20:17:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, devicetree@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Benson Leung <bleung@chromium.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, Guenter Roeck <groeck@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>,
 Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tzung-Bi Shih <tzungbi@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Scally <djrscally@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 02/17] drm/bridge: Verify lane assignment is going to
 work during atomic_check
Message-ID: <ZsTPuvoTIFVFHw6o@smile.fi.intel.com>
References: <20240819223834.2049862-1-swboyd@chromium.org>
 <20240819223834.2049862-3-swboyd@chromium.org>
 <ZsRrWfoPPVGC4Dqy@smile.fi.intel.com>
 <CAE-0n536OWtoOoRSM=6u=wA75A+0WtBktiY=6Y6VjKKTQWPcNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n536OWtoOoRSM=6u=wA75A+0WtBktiY=6Y6VjKKTQWPcNw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Tue, Aug 20, 2024 at 10:12:55AM -0700, Stephen Boyd wrote:
> Quoting Andy Shevchenko (2024-08-20 03:09:29)
> > On Mon, Aug 19, 2024 at 03:38:16PM -0700, Stephen Boyd wrote:

...

> > Yeah, I really think that the appearance of this thousandth time in the Git
> > history has almost no value and just pollutes the commit message makes it not
> > very well readable. The only outcome is exercising the compression algo used
> > by Git.
> 
> I'll leave the decision up to the maintainers.

Sure!

...

> > > +     /*
> > > +      * Ensure this bridge is aware that the next bridge wants to
> > > +      * reassign lanes.
> > > +      */
> > > +     for (i = 0; i < num_input_lanes; i++)
> > > +             if (i != input_lanes[i].logical && !num_output_lanes)
> > > +                     return -ENOTSUPP;
> >
> > Besides missing {} this code is internal to the Linux kernel. Is it okay?
> 
> ENOTSUPP is used by select_bus_fmt_recursive() so I simply followed that
> style.

Okay, just be aware of that side effect of that code, also checkpatch may
complain (however it might be false positive).

-- 
With Best Regards,
Andy Shevchenko


