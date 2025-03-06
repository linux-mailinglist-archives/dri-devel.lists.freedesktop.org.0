Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 354C6A54BAB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 14:12:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C8F10E964;
	Thu,  6 Mar 2025 13:12:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BFzI3pph";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC7410E964;
 Thu,  6 Mar 2025 13:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741266761; x=1772802761;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kD0+DAAqaOpRalTEvEv3LkIwBg3q4DkH1TTKWRYyGa8=;
 b=BFzI3pphyob7j/c/WlvSdfR9+RQCHbUc/JnQjNtztyUQcZz4zlt68EJX
 BgfmIjpN6tTIlAG4Mmpg5eEOHZbi2lMpkH0ILFpMsTzHe3k8zd2ioZzN1
 fJyW5cGxXOGx6ylZh91vzvSXGkw3DuQ4kzvKP2ezXG4IZaUJH++0/s7yw
 U2AHyXkepK9qJZ57qEhu4/DSKnoMLmbrUkYewKUH8nS0r9ujAGiQFtPcH
 irIrvqDCdhCGJQmjffmJl36u4LMsYgM0opgP77f3m9Um/pO+XYEYAK/jk
 xH/tW7t4fVuRbJgS0G7rKFHpJBT2C+LtN3xUPSusy1s0pLq2BvMFuVudN g==;
X-CSE-ConnectionGUID: UaHnaxbBS2icYPtpFyJMhg==
X-CSE-MsgGUID: rl1jQSzLRi6KQK7TUR9Ngg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46043310"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="46043310"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 05:12:40 -0800
X-CSE-ConnectionGUID: +E/rE1M9SrukXMZwIvHJaw==
X-CSE-MsgGUID: ibkmCI4tQE2yVKV/WhaO0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="123975000"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 05:12:37 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tqB1d-000000007jv-2Mea; Thu, 06 Mar 2025 15:12:33 +0200
Date: Thu, 6 Mar 2025 15:12:33 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: mailhol.vincent@wanadoo.fr
Cc: Yury Norov <yury.norov@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v5 0/7] bits: Fixed-type GENMASK()/BIT()
Message-ID: <Z8mfQVP6AkFIxYcY@smile.fi.intel.com>
References: <20250306-fixed-type-genmasks-v5-0-b443e9dcba63@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-fixed-type-genmasks-v5-0-b443e9dcba63@wanadoo.fr>
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

On Thu, Mar 06, 2025 at 08:29:51PM +0900, Vincent Mailhol via B4 Relay wrote:
> Introduce some fixed width variant of the GENMASK() and the BIT()
> macros in bits.h. Note that the main goal is not to get the correct
> type, but rather to enforce more checks at compile time. For example:
> 
>   GENMASK_U16(16, 0)
> 
> will raise a build bug.

This version LGTM, just a couple of comments that you may find
in the individual replies.

-- 
With Best Regards,
Andy Shevchenko


