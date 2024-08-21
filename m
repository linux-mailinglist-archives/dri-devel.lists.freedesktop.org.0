Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 110AD9597B1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 12:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E8410E8CB;
	Wed, 21 Aug 2024 10:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kVmlrccb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B706110E8C5;
 Wed, 21 Aug 2024 10:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724236460; x=1755772460;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BKA/6mhO3EoRYZMvWrkY/tpbpS09jGedFAxJDw3ru7E=;
 b=kVmlrccb4chLLhR+o2HVgsOm3+fqNEbMoB9glOiKoM8jJ12Oeq7mAmln
 MZPOhsoFcRSHDTDzEkXQdGwLGgGVbsS5Tor9mc1j6EC+qBFKcjaCsyVxI
 vhrPN4x5sjRkTEGbkNT7hwEfJ2NBHTBQZZy9g2/dhQ+f7qrn1PFc8B5tD
 byR8XpMV81v9muSs6p71tMmnr2E4igVUVtpDbsyN3HLpmyTPURJWj4jqr
 +dyNYI8+H5ziS1rSHUHPLWC3thQXIC4K9ULFKC+ab9hTiUkidE6k6xvYu
 SbYRirG4l53c9N3XKF8Ix/oJep+TNRRgefyVYa9ZrNI62P0OqBhnamZK1 g==;
X-CSE-ConnectionGUID: o5cQ0edpQlmquunzvxz1hA==
X-CSE-MsgGUID: nz1H8ikySIKJ2/1cHUo2Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33972036"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="33972036"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 03:34:19 -0700
X-CSE-ConnectionGUID: uD4M+Sw3RTWkGIe0RctD3Q==
X-CSE-MsgGUID: 4KodI9wkTbiE0Fs5d//i2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61358083"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.24])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 03:34:17 -0700
Date: Wed, 21 Aug 2024 12:34:13 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gt: Continue creating engine sysfs files even
 after a failure
Message-ID: <ZsXCpfLfTRUjlWG0@ashyti-mobl2.lan>
References: <20240819113140.325235-1-andi.shyti@linux.intel.com>
 <ZsUJIFVKuIX_pbDw@intel.com> <ZsWYIBsuFKAqVpIS@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsWYIBsuFKAqVpIS@ashyti-mobl2.lan>
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

Hi Again, Rodrigo,

...

> > Also it looks something is off with the goto paths...
> > 
> > That if (0) is also ugly... probably better to use a
> > kobject_put with continue on every failing point as well...
> 
> ehehe... I came to like it, to be honest. Besides I like single
> exit paths instead of distributed returns. In this particular
> case we would replcate the same "kobject_put() ... dev_warn()" in
> several places, so that I'm not sure it's better.
> 
> If you like more we could do:
> 
> 	for (...) {
> 		...
> 		...
> 		/* everything goes fine */
> 		continue
> 
> err_engine:
> 		kobject_put(...);
> 		dev_warn(...);
> 	}
> 
> And we avoid using the "if (0)" that you don't like.

BTW, the purpose of the patch is to remove the break and, as I
was at it, I chhanged dev_err/dev_warn.

Refactoring the "if (0)" is a bit out of scope. Right?

Thanks,
Andi
