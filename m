Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 689164A597C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 10:49:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D66C10E547;
	Tue,  1 Feb 2022 09:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9955410E4F9
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 09:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643708957; x=1675244957;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1hNFJnAAizxu1Af2pF6YdFa5NNIbQpqKneaS5sboPdA=;
 b=WmSSLkmECoQmpKNkssCZ9v+hkbZ5dIrJkgbc7F4/3yO75T+TGMAAM+Lr
 GlMvIY41itNZfcIMRgPtmwghyTs4JCdvh7KIqBWB5RB5K3T6eeBmt7boG
 gl5B/Ij2V6ztJ41frTU9HIk25ISKCwpt0VbO/bQoiej+YZwQsq4mrULoU
 MHyrSAd/4oZE7Hk5ERFIuzqSgEsPfMsOiEPZIYJbCJLjazC/kILrHLHsN
 1wlqh81G79U9upcP6ZRLIX6XCD8c9MGO0WMz7HQi4SJ2V3daDvuPd+E6u
 Lcu96io6pho/QTHyBA8aB1LsT099ZkCASDMdhFkdjQuH1ybWyVzk9GWrb g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="247874874"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="247874874"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 01:49:17 -0800
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="482231910"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 01:49:14 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nEplj-00HFdB-No; Tue, 01 Feb 2022 11:48:11 +0200
Date: Tue, 1 Feb 2022 11:48:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
Message-ID: <YfkB229Cuqyo/qOh@smile.fi.intel.com>
References: <20220131202916.2374502-1-javierm@redhat.com>
 <cc093cd5-fba1-5d84-5894-81a6e1d039ff@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc093cd5-fba1-5d84-5894-81a6e1d039ff@suse.de>
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

On Tue, Feb 01, 2022 at 10:33:31AM +0100, Thomas Zimmermann wrote:
> Am 31.01.22 um 21:29 schrieb Javier Martinez Canillas:

> > +obj-$(CONFIG_TINYDRM_SSD1307)		+= ssd1307.o
> 
> Maybe call it ssd130x

Either way it's good to list all supported models in "help" of Kconfig.

Also here is the question, should we keep backward compatibility or not?
If not, we never can remove the old driver (until last user gone).

-- 
With Best Regards,
Andy Shevchenko


