Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEED964D7A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 20:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8148610E75D;
	Thu, 29 Aug 2024 18:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NBWNYcF2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5511110E75D;
 Thu, 29 Aug 2024 18:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724955048; x=1756491048;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vSKxJ++u4xJtuxTxpywMX3Pg61Yfik+zQcyDUxiVr8E=;
 b=NBWNYcF2pKb3oAXDInEGUxFFkHzuuRjOMU1H6UrI607rlPNCRqMs+XZU
 QvRrNCBllRl+PsTpJBxFQsRX/j1fox67Q/bnfpkfmUghCY1E+PLQKe9gS
 DF8Ux2/gkOHGTJR+681gAe2YDrgC/DDHecFsftkIIXUHymbSoNEMX1cxk
 id5EoOw5cw86Ze9TogWXOZc6WtAGqOJvhXdINAfo/8Y/9HK9t/oSpUfoG
 huNZUPjAa5/qV5gTOSWYvYBqwooniNepiTn/wenURumFabCIFXXER4EhX
 Xv1XC2AR8EBLbtPLeJZfK9NAAfeVxGoU/qUG2fb6XYBhXoO1qaFVV64Fi A==;
X-CSE-ConnectionGUID: 58BGAU6QRO6p85FJs9mu9g==
X-CSE-MsgGUID: gaVbIWbkSqCwcPcWpD5Mbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34185600"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="34185600"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 11:10:47 -0700
X-CSE-ConnectionGUID: pJkcAG+DS6CfOpuFvtJcEQ==
X-CSE-MsgGUID: 7YB0f0vSS02HTmku9UBoHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="68329336"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 11:10:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sjjbV-000000036ZQ-48E7; Thu, 29 Aug 2024 21:10:41 +0300
Date: Thu, 29 Aug 2024 21:10:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 0/2] drm/i915/fence: A couple of build fixes
Message-ID: <ZtC5oXSzUuuIgLiQ@smile.fi.intel.com>
References: <20240829155950.1141978-1-andriy.shevchenko@linux.intel.com>
 <87cylrwahb.fsf@intel.com> <ZtCnhXwtO-gd1fMf@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtCnhXwtO-gd1fMf@smile.fi.intel.com>
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

On Thu, Aug 29, 2024 at 07:53:25PM +0300, Andy Shevchenko wrote:
> On Thu, Aug 29, 2024 at 07:38:08PM +0300, Jani Nikula wrote:
> > On Thu, 29 Aug 2024, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > With CONFIG_WERROR=y and `make W=1` build fails on my x86_64 machine.
> > > This is due to some unused functions. Hence these quick fixes.
> > 
> > Since when have we been getting the warnings for static inlines?
> 
> Do you want to see any additional information of my building environment?
> 
> Debian clang version 18.1.8 (9)

FWIW, clang-16 also behaves in the same way, Cc'ed to CLANG maintainers.

-- 
With Best Regards,
Andy Shevchenko


