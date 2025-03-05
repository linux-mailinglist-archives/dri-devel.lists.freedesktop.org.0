Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA41DA50256
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 15:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A9910E7F5;
	Wed,  5 Mar 2025 14:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kNaiNb52";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B6A10E7F4;
 Wed,  5 Mar 2025 14:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741185268; x=1772721268;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Q20ygQOXxZfWxH1QwL6EtkQDkXQTKlkx9YZgOavk7ng=;
 b=kNaiNb52ELgCM1QguObpfPTUAQTEJfxbLXGmG1ztRFksfcDjGyWgCmcw
 zWNY859jkzUHQlNinwgVeJX7/mU6ttB3m9hC6pMdXb4mRq/XtRjpHGI7/
 ce1Aetp+5U4MWiBfxr2qN4mpvNpRkkcr0A7mKwHgTzhc1sq11vuDvBT1Z
 yFDhhWNJM95CBG2BTx3TTkEiSMM7I6MNwca++trZDcToMB1yLG5Vd99hu
 cXqoNLue6vHUBtmkDNhRWi+6XQMvQ1ouCWs9R9bFxO27t0MaVY/svew3K
 OM5wcUpdvRQbRFc4DCk5X7B+Wz+f1xCa2XKAH/TxNgberCt2PJHVQM4KJ g==;
X-CSE-ConnectionGUID: y+aJOCYoRJKEyYlOmQ+TeQ==
X-CSE-MsgGUID: qXwNWjVDTz+MKpha2ovbSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42058793"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="42058793"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 06:34:27 -0800
X-CSE-ConnectionGUID: 1SlVJIArRA+WKeKR7nzDPA==
X-CSE-MsgGUID: dR5c/5nSRISnK44rdgG4Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119625346"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 06:34:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tpppE-0000000HRAs-2Xou; Wed, 05 Mar 2025 16:34:20 +0200
Date: Wed, 5 Mar 2025 16:34:20 +0200
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 1/8] bits: fix typo 'unsigned __init128' -> 'unsigned
 __int128'
Message-ID: <Z8hg7J1jqlFF1Uka@smile.fi.intel.com>
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
 <20250305-fixed-type-genmasks-v4-1-1873dcdf6723@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305-fixed-type-genmasks-v4-1-1873dcdf6723@wanadoo.fr>
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

On Wed, Mar 05, 2025 at 10:00:13PM +0900, Vincent Mailhol via B4 Relay wrote:
> From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> 
> "int" was misspelled as "init" in GENMASK_U128() comments. Fix the typo.

Please, fix it everywhere:

$ git grep -lw __init128
include/linux/bits.h
include/uapi/linux/const.h
tools/include/linux/bits.h
tools/include/uapi/linux/const.h

-- 
With Best Regards,
Andy Shevchenko


