Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8228EA50258
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 15:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952B510E830;
	Wed,  5 Mar 2025 14:36:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mEC7jkFy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D9F10E830;
 Wed,  5 Mar 2025 14:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741185381; x=1772721381;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BL5wzMcYzMDHHSMVfNy1tXsgecG11VaBErErwu3GcfY=;
 b=mEC7jkFyX8oV9aW7iUvlW09CiLu87YFfMwB6aUWboF+kj2fpwfEjQzdu
 F/yOjWwuOO4WDVoKLOsj7yw1lUI28Q4+gKLYGz2IMkzCKVrvfaY+l3Nh3
 FrdF6YQvhuvZ05nS0iD3H+n/O/IGdDISEJwIUTG2iJLyYHJDJtlNVA8xl
 pPTIsCH6z2KWFcJqF0AUCzD1LQsiPFg6KzrgzqQK0OKuzTETop6Yrpq0a
 yxN/fSnX8S6qc6xmLeM7Ze+WMNlemCucmBBroLmm2A7jpDK9Mmf4Tfl9v
 LBoV3fpgSKFu7zdsIiaS/bm2dh4ishX0aYah/dqsV/ba0R3aZtlCI1zv7 w==;
X-CSE-ConnectionGUID: tjcUCN3CTvylZ5oMHdvXVg==
X-CSE-MsgGUID: QNaTRoXsQHax2OPiVH1HtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59694993"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="59694993"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 06:36:21 -0800
X-CSE-ConnectionGUID: Kubf5F1mSWyeEAQtTZpFUQ==
X-CSE-MsgGUID: c95c5OybSYSiGNW3kpTMlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="123909099"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 06:36:16 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tppr3-0000000HRBz-1DLE; Wed, 05 Mar 2025 16:36:13 +0200
Date: Wed, 5 Mar 2025 16:36:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: mailhol.vincent@wanadoo.fr, Lucas De Marchi <lucas.demarchi@intel.com>,
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
Message-ID: <Z8hhXHporoJ6Y39X@smile.fi.intel.com>
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
 <20250305-fixed-type-genmasks-v4-1-1873dcdf6723@wanadoo.fr>
 <Z8hf_MNL3MeoXW5O@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8hf_MNL3MeoXW5O@thinkpad>
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

On Wed, Mar 05, 2025 at 09:30:20AM -0500, Yury Norov wrote:
> On Wed, Mar 05, 2025 at 10:00:13PM +0900, Vincent Mailhol via B4 Relay wrote:
> > From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > 
> > "int" was misspelled as "init" in GENMASK_U128() comments. Fix the typo.
> 
> Thanks for respinning the series. I'll take this fix in bitmap-for-next, so
> if you need v2, you'll not have to bear this thing too.

Before doing that, please read my comment first.

-- 
With Best Regards,
Andy Shevchenko


