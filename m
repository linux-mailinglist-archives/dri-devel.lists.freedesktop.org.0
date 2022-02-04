Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C08BC4A9A7A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 14:58:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBA910F54E;
	Fri,  4 Feb 2022 13:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E727910F54E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 13:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643983117; x=1675519117;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2BxfKJHDVoUG3oQffGXWyy/SJf5pROrxwoiqlC67rMU=;
 b=ZCvKjs9u/1c0/e5P9OmEPvtLK2kCO1ahDLg0e0dqb8YVJ8jAdua4QilV
 fD4qE+ll4KFn9cZ6Zqby3MAVAYjkxdAmNPFxgx214vlFj8bIS4MT+GPVZ
 oqY6ymy6lb01CzD2snNYhWRA4GAEj9wCQAr7x1at3l0zKH4c2IatmAwYk
 3hDL3HqWjJ5lYsBRqhMoGy8AalNp1/1g8nhm2WcV70/DA/MmDg7LNQNJs
 NIhuNG+BnrrQojf/aKB/lYk4yFkwtJAx32am5wq1pyKrSDAl1EjezS+3m
 +G8xY1EMk6eJE22v5/8Sn188Zb24zMD+9rb/UBxBNV9tk/Ef81n0xC3x4 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="228342081"
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600"; d="scan'208";a="228342081"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 05:58:37 -0800
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600"; d="scan'208";a="627783155"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 05:58:34 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nFz5g-000o5W-Pc; Fri, 04 Feb 2022 15:57:32 +0200
Date: Fri, 4 Feb 2022 15:57:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 3/4] MAINTAINERS: Add entry for Solomon SSD130X OLED
 displays DRM driver
Message-ID: <Yf0wzOP/kaubDAhP@smile.fi.intel.com>
References: <20220204134347.1187749-1-javierm@redhat.com>
 <20220204134347.1187749-4-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220204134347.1187749-4-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 04, 2022 at 02:43:46PM +0100, Javier Martinez Canillas wrote:
> To make sure that tools like the get_maintainer.pl script will suggest
> to Cc me if patches are posted for this driver.
> 
> Also include the Device Tree binding for the old ssd1307fb fbdev driver
> since the new DRM driver was made compatible with the existing binding.

...

>  drivers/gpu/drm/drm_format_helper.c | 2 +-

Nothing about this in the commit message...

Stray change?

-- 
With Best Regards,
Andy Shevchenko


