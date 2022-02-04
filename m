Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B8D4A9AF3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 15:29:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309D210E27C;
	Fri,  4 Feb 2022 14:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD4A10E26E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 14:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643984954; x=1675520954;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3pQRZIYFfG++lCfuR7gxtikGSTVR3XAR5ZqOfqUBk84=;
 b=MsL6boqsxnFwXgORVD6lWOUoxKvwF2T7/RcqQ4cvK0Qx8jYGrnjGQtBd
 lHP24Flaf+X4AVpCV3zTKkkVV5/4N/pC3emrxV0mgsjuLBn6ib5sIDKNt
 e6/2pdyZVW4jWX6h0ScM4+qpIIDBbAVsTQipMZXiLswWQVpZGJ5uNRAbJ
 M7121h2OTo7l3SmDEjhHwQ+LHzRSzVK+wbt/jaXsGncJaSXlbNX8Xb2wg
 OzDDzm7AszzkPuGuVjQfY6to1qjk63hvZQUV2LA3ECEEsXOr5XfX5SKzs
 AO/2xXG7FKQnMkRG9a+Q+BqDUfG7wIUvKKR4j45kOvnIwP0FJiWI+Tqqg Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="334769477"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="334769477"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:29:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600"; d="scan'208";a="524322677"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:29:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nFzZI-000oW4-CM; Fri, 04 Feb 2022 16:28:08 +0200
Date: Fri, 4 Feb 2022 16:28:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 3/4] MAINTAINERS: Add entry for Solomon SSD130X OLED
 displays DRM driver
Message-ID: <Yf03+MsbqRp+uQff@smile.fi.intel.com>
References: <20220204134347.1187749-1-javierm@redhat.com>
 <20220204134347.1187749-4-javierm@redhat.com>
 <Yf0wzOP/kaubDAhP@smile.fi.intel.com>
 <5892749f-0bb0-68f5-c3d2-8ceedfc6b162@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5892749f-0bb0-68f5-c3d2-8ceedfc6b162@redhat.com>
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

On Fri, Feb 04, 2022 at 03:12:17PM +0100, Javier Martinez Canillas wrote:
> On 2/4/22 14:57, Andy Shevchenko wrote:
> > On Fri, Feb 04, 2022 at 02:43:46PM +0100, Javier Martinez Canillas wrote:

...

> > Stray change?
> 
> Sigh, I'm not sure how added that change. Just ignore it, I'll fix it
> on v3 or when applying if there isn't another revision of this series.

I believe v3 is warranted due to the other patch review.

-- 
With Best Regards,
Andy Shevchenko


