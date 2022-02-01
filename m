Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D944A5964
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 10:42:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027CF10E4B5;
	Tue,  1 Feb 2022 09:42:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B149710E4B5
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 09:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643708539; x=1675244539;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0tZyjAxsCP4hOqAR4pjEHIEl2lCJLcdsBpV7uLY4i/0=;
 b=ExF6y+H4NB3lOyj36mKiJ+R95Y6gU5SsA2nQZVSDQGpb4zXJAsR8A+wz
 woJzaIBBPpP82Gnz1Xt7Mq4WYoN+H7mI7d/CF/NqKywDI4qsiW5laP4Ic
 pBIRkTruI3eq83NME2Guk/1riBosI6Sw4XBHY+xeyyL5tYW8z13GWFHS6
 w0KbMcmW1CSv63nNl3eMMxa5sci/g3y9DhX3TWbLNONzcPfYaiK/qO64A
 QpnjjAeDa8C9XwwJ4Tt8pl9oi1xMdXquTeFIyO/4RBULcTylJ2uZpuroz
 h+reVZALIhX19f2/SJX5y7J2ICeln0wer+W2Vq/C7WAFIm+rsRzjPMCC3 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="245246241"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="245246241"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 01:42:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="619743874"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 01:42:17 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nEpf0-00HFTZ-Cc; Tue, 01 Feb 2022 11:41:14 +0200
Date: Tue, 1 Feb 2022 11:41:14 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 3/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
Message-ID: <YfkAOiSlIMZrKXyl@smile.fi.intel.com>
References: <20220131202916.2374502-1-javierm@redhat.com>
 <YfhVBtv1UIA7bJja@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfhVBtv1UIA7bJja@ravnborg.org>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 31, 2022 at 10:30:46PM +0100, Sam Ravnborg wrote:
> On Mon, Jan 31, 2022 at 09:29:16PM +0100, Javier Martinez Canillas wrote:

...

> > +config TINYDRM_SSD1307
> > +	tristate "DRM support for Solomon SSD1307 OLED displays"
> Use SSD130X here - so SSD1306 users can find it.

It's better to list them all in the "help". How user would grep this?

`git grep -n -i ssd1306` ==> no match.

> > +	depends on DRM && I2C
> > +	select DRM_KMS_HELPER
> > +	select DRM_GEM_SHMEM_HELPER
> > +	select BACKLIGHT_CLASS_DEVICE
> > +	help
> > +	  DRM driver for the SSD1305, SSD1306, SSD1307 and SSD1309 Solomon
> > +	  OLED controllers that can be programmed via an I2C interface.
> > +
> > +	  If M is selected the module will be called ssd1307.

-- 
With Best Regards,
Andy Shevchenko


