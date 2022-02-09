Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7734AF720
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 17:45:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7090910E39D;
	Wed,  9 Feb 2022 16:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B7C10E39D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 16:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644425155; x=1675961155;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6o8PBrt2dlQLXaGpgRDUe/a5h6z2Gt3tbLxke74fXBE=;
 b=BoSiNaTaF/ZWlX6FT9MpJh1o9hUj+W+lIbsOOUGqG7euOLcji5tj6Fu4
 bSQoirC+Mb2TVVpHF9E7mLbPFcD8XFL/uQdTEvPcSBWQF/Rb9z+7KJOJx
 P1VNPt+WjHBWdLq04+4XTXkQSca56hNn/e/Me/qUej0VaVAbDyJ27XXiy
 0dcJbJ2yAsLeAQGindItOWWIUI2czD/ghMe/lf5cSM6qdiLEy5nJsqIr/
 R6ly69qsJfUzTQY4lVXl7E8aothRRmi1K9HGFSDaZ+OhvLWGJ1IzHdbMv
 B+vKY0O98ntPNwIlxl7s30LrxfCZP+prCtmnitvyMpsHkdFBWFYrECWT+ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="229216367"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="229216367"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 08:45:54 -0800
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="633276717"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 08:45:49 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nHq5K-002g8V-C9; Wed, 09 Feb 2022 18:44:50 +0200
Date: Wed, 9 Feb 2022 18:44:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 3/7] drm: Add driver for Solomon SSD130X OLED displays
Message-ID: <YgPvgtQ7ANd540Ht@smile.fi.intel.com>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209090314.2511959-4-javierm@redhat.com>
 <YgPZ3W0e7N7JQ1dT@smile.fi.intel.com>
 <e29eaccc-863a-21d4-e669-0b708604d723@redhat.com>
 <YgPnE0yj0Y0OJxq6@smile.fi.intel.com>
 <406152d8-13e4-de8a-9542-bf1d96dbab0a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <406152d8-13e4-de8a-9542-bf1d96dbab0a@redhat.com>
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
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 09, 2022 at 05:26:00PM +0100, Javier Martinez Canillas wrote:
> On 2/9/22 17:08, Andy Shevchenko wrote:

...

> On that topic, I even typed a SPI driver because of your feedback :)

Much appreciated, makes me much easier to test.

Thank you for doing all this!

-- 
With Best Regards,
Andy Shevchenko


