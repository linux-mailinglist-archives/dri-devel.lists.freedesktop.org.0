Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 962F34A593D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 10:33:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8355210EC37;
	Tue,  1 Feb 2022 09:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E713210EC31
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 09:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643707989; x=1675243989;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ziky2M7C1UqU0dFMGza2JJFco5ugvRYxY1sxp7+XL7I=;
 b=VgxYLoe4AY2YuW/1zF0OVrvvZMMeLDoxV3rt/4DAyjPLLNuqxaz3xtXB
 XPABb0tlno5O7en9ksA/9vP0wxfexny+Fb1rnxs7n/4f7UXd3PxKLqiNi
 WmXenlUwFNvPtfaBn536FkT6QQHM9WrzH9YKpoQIm8QPC1sa1Ci9UiE7L
 xS4cu/r+m4r9vpgOFyeLCjwgiPxq35xEIYFlFNXQ79QXbRW3+yujYbEWG
 Y0A0mv/Tl/0JibcGVvFURAxhM/Z7d2gH4AGKoG7ZWuEpThj1C2ZtG6MdN
 ArdrD5b2aIuBFQRLiRLnl05HCKdX9RxzwuNa5//NB3aGXUlt18y2nGKyn g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="247871896"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="247871896"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 01:33:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="626677567"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 01:33:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nEpW8-00HFId-SB; Tue, 01 Feb 2022 11:32:04 +0200
Date: Tue, 1 Feb 2022 11:32:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 4/4] MAINTAINERS: Add entry for Solomon SSD1307 OLED
 displays DRM driver
Message-ID: <Yfj+FOELlbtdhvRa@smile.fi.intel.com>
References: <20220131201537.2325487-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131201537.2325487-1-javierm@redhat.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 31, 2022 at 09:15:37PM +0100, Javier Martinez Canillas wrote:
> To make sure that tools like the get_maintainer.pl script will suggest
> to Cc me if patches are posted for this driver.
> 
> Also include the Device Tree binding for the old ssd1307fb fbdev driver
> since the new DRM driver was made compatible with the existing binding.

Dunno why you have patches 3 and 4 missed references (in terms of email
thread).

> +DRM DRIVER FOR SOLOMON SSD1307 OLED DISPLAYS
> +M:	Javier Martinez Canillas <javierm@redhat.com>
> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> +F:	drivers/gpu/drm/tiny/ssd1307.c

I think it makes sense to add ssd1307fb as well. At least you may point out
people patching old driver about new one until it's gone completely.

-- 
With Best Regards,
Andy Shevchenko


