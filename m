Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00945A706A4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 17:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D3210E3B2;
	Tue, 25 Mar 2025 16:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OBzdh316";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F7D10E10C;
 Tue, 25 Mar 2025 16:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742919660; x=1774455660;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GjYkRvObWlrImE4cQ7gUuIKV1Cu2lgGMbmIy+oWECk0=;
 b=OBzdh316KQTOXR5a1HtRVAeLeFYgxw7fBD5aGql6ET4PlmZ22TeLbdCO
 QRVtVvH1A2SvsX8dI+tNuPuXp92t3Z7sO4S8jn4ysgXowzW7MNutOIqnc
 uWYVcDeWkjIgl3TyNfm4kU+3ehs/pX10p5BP6aVEw+9iEm1URDC3c202x
 HY3TZ533ztHtZVjN11LAraa9ZmP8OxMbeY+2Vl6nFZtbt/WTn8uMNa0Iq
 nxIMFNNLl6d8t8GM1gxiM/IvnpGszDVrcZlhZuy6cJd1JQkojrBlFyfef
 /s+NV3e5ctWrCg7PIsXwAQAVuhVTDukkWiI4Xq+XQDcP4uev/+32YfrU9 Q==;
X-CSE-ConnectionGUID: mSOr98chQqmuNfD1Fiqg5Q==
X-CSE-MsgGUID: tFidN+afT36RixfMZkLygg==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="43904461"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="43904461"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 09:21:00 -0700
X-CSE-ConnectionGUID: YfDEOEvTTumX1d8yEn9lKg==
X-CSE-MsgGUID: Iu6cG0pzTUGMZM0z5IvoLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="128579110"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 09:20:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tx71H-00000005ngL-40Jm; Tue, 25 Mar 2025 18:20:51 +0200
Date: Tue, 25 Mar 2025 18:20:51 +0200
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
 Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 1/6] bits: add comments and newlines to #if, #else and
 #endif directives
Message-ID: <Z-LX4y1pw54C_H78@smile.fi.intel.com>
References: <20250326-fixed-type-genmasks-v8-0-24afed16ca00@wanadoo.fr>
 <20250326-fixed-type-genmasks-v8-1-24afed16ca00@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-fixed-type-genmasks-v8-1-24afed16ca00@wanadoo.fr>
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

On Wed, Mar 26, 2025 at 12:59:56AM +0900, Vincent Mailhol via B4 Relay wrote:
> From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> 
> This is a preparation for the upcoming GENMASK_U*() and BIT_U*()
> changes. After introducing those new macros, there will be a lot of
> scrolling between the #if, #else and #endif.
> 
> Add a comment to the #else and #endif preprocessor macros to help keep
> track of which context we are in. Also, add new lines to better
> visually separate the non-asm and asm sections.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Thanks!

-- 
With Best Regards,
Andy Shevchenko


