Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 394457373A2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 20:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C749010E0CC;
	Tue, 20 Jun 2023 18:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9F010E0CC;
 Tue, 20 Jun 2023 18:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687285169; x=1718821169;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=fxp7O1IFxzgSra3+U3m4CdtMmU0xIakqiwOKj7ZMuzc=;
 b=drQ4exi1zC82dS29KaQ8wCmwHmtvs8XpEiEcJG4Zk46iXkzPEYRG9p22
 d+gfWswQDcdDcIEMJWgeJSrMedQafmwKe3zvNkFfLYn+nW2XODLXAbBUk
 SP8qtLmh+zN+NeI/RnFB3zTVrfla7qJ7nnrGAjo4LheouNsPkbgZIUFIV
 DzU5Vy9cVOEbxS7FibR9ge/UXNXK5v3qfisI3w5mw1IiWMtllFdnchEwK
 SC9foQMcZeoeexjsjORyxe01kqbPbhRaURdgqPqyypJWm1LTWAJdu/gI4
 jZVoS6p8I0DU7Bq1VazxgCOE7UCaeR9hg9axDC9bY7SaQK+IJDIrgknPE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="363368703"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; d="scan'208";a="363368703"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 11:19:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="838309700"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; d="scan'208";a="838309700"
Received: from dshvarts-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.62.204])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 11:19:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [Intel-xe] [PATCH 2/3] linux/bits.h: Add fixed-width GENMASK
 and BIT macros
In-Reply-To: <ZJHkthMktY83pwvy@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230509051403.2748545-1-lucas.demarchi@intel.com>
 <20230509051403.2748545-3-lucas.demarchi@intel.com>
 <ZF4fi5B7PPlgZBOI@smile.fi.intel.com> <87pm75kd0h.fsf@intel.com>
 <ZF4j0NPoBGMBT8CO@smile.fi.intel.com> <87mt29kc34.fsf@intel.com>
 <ZIs0CC2J7nu0LHEK@smile.fi.intel.com> <875y7igph5.fsf@intel.com>
 <ZJG91zMQW3Rnvdbe@smile.fi.intel.com>
 <amgwl5mthhqgvgkqnor6tjfcr3x3pgwvpqin5efwwjfpdhvvpa@vhzhiq5mzsdg>
 <ZJHkthMktY83pwvy@smile.fi.intel.com>
Date: Tue, 20 Jun 2023 21:19:20 +0300
Message-ID: <87ttv2f13r.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas Gleixner <tglx@linutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 20 Jun 2023, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> So, what does prevent you from using GENMASK_ULL()?
>
> Another point, you may teach GENMASK() to issue a warning if hi and/or lo
> bigger than BITS_PER_LONG.

What good does that do if you want the warning for a fixed size
different from unsigned long or long long? Worse, sizeof(long) depends
on arch, while the GENMASK you want depends on the use case.

> I still don't see the usefulness of that churn.

This thread is turning into a prime example of why drivers and
subsystems reinvent their own wheels instead of trying to get generally
useful stuff merged in kernel headers. :p


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
