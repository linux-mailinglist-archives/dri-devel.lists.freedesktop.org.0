Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7568996847F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 12:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62A310E281;
	Mon,  2 Sep 2024 10:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GrvWrLVI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0707910E281;
 Mon,  2 Sep 2024 10:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725272435; x=1756808435;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vAyw3DGRUW2gmpJRcyy957TXVSU43KBF/YFLb11XwAs=;
 b=GrvWrLVIX7ELath3BNnFn+nMSNlWbXHgljFEo89cOA5LUjqo4TDqdzF8
 C06sXPRpIlKcKXQMNCn5d7WPslpT4JRkJP9XhWPtPNB8axzWY63wV77nN
 FMvIpbRZ0DoqR+w58FmP2kfLIh8MVFDgxsK9hu/e7qWlGTYrHRCf7J8TE
 Hn8M4/vuUSNG0WLWhfRwQLCl760If/ohBQeOX04z4AJQ1dlx0UXjUDcNR
 GBxExfnUT96sKCDF1AX64ChNq6QCiddBs8DQ+g3nBnTm/NNXXc9LfpNs6
 3clQkC6IKiiCNHNX4oKUbxfXoZkCCnOyYry1GYC1m77qwaohU/VKGmW1j w==;
X-CSE-ConnectionGUID: IvXoj6TxQGuSRdL7mCJ3Vw==
X-CSE-MsgGUID: DEvRmmo6TDmKhwgHb6PxZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23360153"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="23360153"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 03:20:34 -0700
X-CSE-ConnectionGUID: JKq8O8QDSIm7GjIdEJwMZQ==
X-CSE-MsgGUID: /q6j8+V8QBKhxdhbT6nl8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64923875"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 03:20:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sl4Ae-00000004Jho-2Owa; Mon, 02 Sep 2024 13:20:28 +0300
Date: Mon, 2 Sep 2024 13:20:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 0/2] drm/i915/fence: A couple of build fixes
Message-ID: <ZtWRbMAMUxZyq5xz@smile.fi.intel.com>
References: <20240829155950.1141978-1-andriy.shevchenko@linux.intel.com>
 <87cylrwahb.fsf@intel.com> <ZtCnhXwtO-gd1fMf@smile.fi.intel.com>
 <ZtC5oXSzUuuIgLiQ@smile.fi.intel.com>
 <20240829182255.GA1468662@thelio-3990X> <87a5gvw4y9.fsf@intel.com>
 <87frqiv4s2.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frqiv4s2.fsf@intel.com>
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

On Mon, Sep 02, 2024 at 11:27:57AM +0300, Jani Nikula wrote:
> On Thu, 29 Aug 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > The TL;DR is,
> >
> > Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> >
> > on the series.
> 
> Both pushed to drm-intel-next, thanks for the patches and discussion.
> 
> I amended the commit message about clang, config options and commit
> 6863f5643dd7 ("kbuild: allow Clang to find unused static inline
> functions for W=1 build") while pushing.

It all makes sense. Thank you!

-- 
With Best Regards,
Andy Shevchenko


