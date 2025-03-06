Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C363EA54454
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 09:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75CC10E915;
	Thu,  6 Mar 2025 08:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWVAESq7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BBB910E913;
 Thu,  6 Mar 2025 08:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741248778; x=1772784778;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=cFU8Ql1QJlSlC8kpfnJhkc2MMeegxCk0ZbejIwx6MAM=;
 b=dWVAESq7pmf4LLm+7so/Q7xt65tmIDqhnHwBXOyfz+Ld0Pc8Ob/p7iAU
 GUXus6HnPQ4u/s5xqcLsezXktbswFbmK/stuccjuqUVG8yGhmpv4dfuns
 RAIF1yMrp6WsZ5s6X+Ll2FdCkCH+Up/LaxK2FiQDZbFsXf2Q0Kfhti8M6
 qAJouHEnTSTy6oENYUwOnpO7KDeXV5r/dcnl8dKb3Ov28S4PXy/pHr2l2
 F0rly1sMh1mUlE1FJbE57+UhOcrxspWQwQm15q4kJp2zuUoo5z0PN0UU2
 YtEcgwnByKtWd97c6LvrS4K2mJKfBiuLX47VECTjrnZcuRTvEtSqm3Kkk Q==;
X-CSE-ConnectionGUID: t+3uy/4bR8G9qZ8PM5/rRg==
X-CSE-MsgGUID: ZBOGy70xRPmIIiAg/nR8/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64693479"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="64693479"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 00:12:58 -0800
X-CSE-ConnectionGUID: ADzbJ8gKQlirm/Zs4gccwA==
X-CSE-MsgGUID: YKZ/Fy1oTpyRI/egBsy9Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="124052123"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.135])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 00:12:52 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: David Laight <david.laight.linux@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Yury Norov
 <yury.norov@gmail.com>, Lucas De Marchi <lucas.demarchi@intel.com>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton
 <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Andi
 Shyti <andi.shyti@linux.intel.com>, David Laight
 <David.Laight@aculab.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 4/8] bits: introduce fixed-type BIT
In-Reply-To: <20250305215027.5d9be1fa@pumpkin>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
 <20250305-fixed-type-genmasks-v4-4-1873dcdf6723@wanadoo.fr>
 <Z8hgqOB5Ym-GGykS@smile.fi.intel.com>
 <d7f3150d-0167-44be-90b2-17f8a050687c@wanadoo.fr>
 <Z8hyNXVZxLzhEzNy@smile.fi.intel.com>
 <824dc1d1-14f0-433e-aa3f-679527b87077@wanadoo.fr>
 <Z8isZodEqhZw5p7-@smile.fi.intel.com> <20250305215027.5d9be1fa@pumpkin>
Date: Thu, 06 Mar 2025 10:12:49 +0200
Message-ID: <87v7smwpa6.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 05 Mar 2025, David Laight <david.laight.linux@gmail.com> wrote:
> So it is even questionable whether BIT8() and BIT16() should even
> exist at all.

If nothing else, they do provide compile time checks for the bit being
0..7 and 0..15, respectively.

BR,
Jani.


-- 
Jani Nikula, Intel
