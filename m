Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B404A5959
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 10:38:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51F710E5C5;
	Tue,  1 Feb 2022 09:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6D610E5C5
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 09:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643708323; x=1675244323;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=v3bwci/IZNUC13Df1rGNpVJ3VxQmJjDUPftTWX/BcSA=;
 b=DBACtYp0bJHbni63uOA0K1iF6JknELX6BTBj1kwpVcBbYT9fZ1WR99Cm
 tSK6Jb6YEu1k+OWCl+Q4e1NLNtKnCJB4MnjfDKga8GkwymjPqqMA0lNTk
 SSSIOusX0LMVEi2y0GhxmrISbyztvVGMIaom4LObQwq7LPg0v7R0OMFPn
 uv4a6iEwMbV8xuB0GiCvGBVm3bp4RVFn+sC7DB2KIUDCKb/uymunCaAcZ
 LgfJqkgATlrJR6zS4LwmZs6Kw82TPGhLTAmJoSqqMr+/Kz3LE9PcrM/Be
 ZsyyCBMnvuBoCMgMc6NVS36inmtDQv5VVhLO6FcCQg9qHcJXtJHX9HUUm Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="245245739"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="245245739"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 01:38:42 -0800
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="565540154"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 01:38:36 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nEpbR-00HFPS-0n; Tue, 01 Feb 2022 11:37:33 +0200
Date: Tue, 1 Feb 2022 11:37:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
Message-ID: <Yfj/XGRRDNABsLPm@smile.fi.intel.com>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <YfhM97cVH3+lJKg0@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfhM97cVH3+lJKg0@ravnborg.org>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 31, 2022 at 09:56:23PM +0100, Sam Ravnborg wrote:
> On Mon, Jan 31, 2022 at 09:12:20PM +0100, Javier Martinez Canillas wrote:

...

> > Patch #3 adds the driver. The name ssd1307 was used instead of ssd130x
> > (which would be more accurate) to avoid confusion for users who want to
> > migrate from the existing ssd1307fb fbdev driver.
> Looking forward the name ssd130x would make more sense. There is only so
> many existing users and a potential of much more new users.
> So in my color of the world the naming that benefits the most users
> wins.

It depends if the binding is going to be preserved. Also this series doesn't
answer to the question what to do with the old driver.

If you leave it, I would expect the backward compatibility, otherwise the
series misses removal of the old driver.

-- 
With Best Regards,
Andy Shevchenko


