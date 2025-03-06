Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D442A54B66
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 14:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F87E10E0C0;
	Thu,  6 Mar 2025 13:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TveEw6+o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8497610E0C0;
 Thu,  6 Mar 2025 13:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741266170; x=1772802170;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zvqUPQ5xDGGVdVd7TADQXHUeO+pBV6JYWZxWMCQ6W98=;
 b=TveEw6+ojd2MfBUfvIM/w59GQh3VX5qpnFMwk1TA2Xi6c36Fvs46Amf+
 YN++zWpiLPVGN1CmGLrF1BQpSl4YPcxxCepFsVLdFciEg5NihPQ7ahXZu
 Tjxs/ZUrUzWI3sZ3QRmwt1LkL67MM/uoZ5okn59RXjKPtrTI3LGcpe9fs
 JFSxHs4tIzMtTS/MI291LqaTr3XS8X4t2pUpM80xrLAmVQF4ujebS7XB9
 pfgICkDNT4IEslYG6OAzwMA+YpAh4Z2Fjp71lj8b3c8NqtUJX8iMR3vTu
 CMjQ/x55BMkx0FnbbBpFFw8TjqfmD1K7c2/4Ui0wRI+hwfoKnXMp2hW81 A==;
X-CSE-ConnectionGUID: tomaS9qtRaSNbFhpCAocKg==
X-CSE-MsgGUID: l0iSEhpXTtyQ4U55ntM5rA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42297517"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="42297517"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 05:02:50 -0800
X-CSE-ConnectionGUID: eosJfhSsRX2NIO7VsGruiQ==
X-CSE-MsgGUID: Gf9Mmk6QSXi1wI72FPblKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118929453"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 05:02:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tqAs6-000000007dA-2FVL; Thu, 06 Mar 2025 15:02:42 +0200
Date: Thu, 6 Mar 2025 15:02:42 +0200
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
Message-ID: <Z8mc8t_OJzUGFjH-@smile.fi.intel.com>
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
> 
> This series is a continuation of:
> 
>   https://lore.kernel.org/intel-xe/20240208074521.577076-1-lucas.demarchi@intel.com
> 
> from Lucas De Marchi. Above series is one year old. I really think
> that this was a good idea and I do not want this series to die. So I
> am volunteering to revive it.
> 
> Meanwhile, many changes occurred in bits.h. The most significant
> change is that __GENMASK() was moved to the uapi headers.
> 
> In v4 an onward, I introduce one big change: split the definition of
> the asm and non-asm GENMASK(). I think this is controversial.
> Especially, Yury commented that he did not want such split. So I
> initially implemented a first draft in which both the asm and non-asm
> version would rely on the same helper macro, i.e. adding this:
> 
>   #define __GENMASK_t(t, w, h, l)			\

I thought we agreed on renaming...

>   	(((t)~_ULL(0) - ((t)1 << (l)) + 1) &		\
>   	 ((t)~_ULL(0) >> (w - 1 - (h))))
>     
> to uapi/bits.h. And then, the different GENMASK()s would look like
> this:
> 
>   #define __GENMASK(h, l) __GENMASK_t(unsigned long, __BITS_PER_LONG, h, l)

Ditto.

> and so on.
>     
> I implemented it, and the final result looks quite ugly. Not only do
> we need to manually provide the width each time, the biggest concern
> is that adding this to the uapi is asking for trouble. Who knows how
> people are going to use this? And once it is in the uapi, there is
> virtually no way back.
> 
> Finally, I do not think it makes sense to expose the fixed width
> variants to the asm. The fixed width integers type are a C
> concept. For asm, the long and long long variants seems sufficient.
> 
> And so, after implementing both, the asm and non-asm split seems way
> more clean and I think this is the best compromise. Let me know what
> you think :)
> 
> As requested, here are the bloat-o-meter stats:
> 
>   $ ./scripts/bloat-o-meter vmlinux_before.o vmlinux_after.o 
>   add/remove: 0/0 grow/shrink: 4/2 up/down: 5/-4 (1)
>   Function                                     old     new   delta
>   intel_psr_invalidate                         666     668      +2
>   mst_stream_compute_config                   1652    1653      +1
>   intel_psr_flush                              977     978      +1
>   intel_dp_compute_link_config                1327    1328      +1
>   cfg80211_inform_bss_data                    5109    5108      -1
>   intel_drrs_activate                          379     376      -3
>   Total: Before=22723481, After=22723482, chg +0.00%
> 
> (done with GCC 12.4.1 on a defconfig)

What defconfig? x86_64_defconfig?

-- 
With Best Regards,
Andy Shevchenko


