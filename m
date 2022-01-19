Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2A349425D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 22:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0CE10E30C;
	Wed, 19 Jan 2022 21:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475CB10E21A;
 Wed, 19 Jan 2022 21:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642626543; x=1674162543;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZzYmMjvc+5ZxKARHkTHppxBXOgslf91RNegeCdTQKbM=;
 b=e8WFxZ2qNFoncplhhiFPXtf/96EijZn1k7z6GQ3xEGVTX50MQ354iUvC
 1yUfs9eiLRUAoJxqX3Zz4BXxQfl40p88Y7PJXZfRQLsktd8JShQspjBNS
 L/D1dHOHk9AgnXycusyHpVMVDQwJe419KTLebVVPZXypzfJUe0+2rwts1
 alzI2tKLaGKtO59UWpPpkuqYm4I99bLRfG3FkMEUFTiW0zF5BxPBvPCuJ
 YOlNPAlLrn9JnStPFnfB72O6Igsj3FeaNIPsLPVnPvzyRzZuBIFAd7GbF
 oOuGIIER/+Uc5pQ5SVjCLatxC80qrlB9+9KCDdWjAw4KDkbrQF0b7kZCZ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="244986658"
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="244986658"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 13:09:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="578966588"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 13:08:54 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nAIBD-00CHBb-6W; Wed, 19 Jan 2022 23:07:43 +0200
Date: Wed, 19 Jan 2022 23:07:42 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH 0/3] lib/string_helpers: Add a few string
 helpers
Message-ID: <Yeh9noiOmJd0DkRO@smile.fi.intel.com>
References: <20220119072450.2890107-1-lucas.demarchi@intel.com>
 <YegPiR7LU8aVisMf@alley> <87tudzbykz.fsf@intel.com>
 <Yeg5BpV8tknSPdSQ@phenom.ffwll.local>
 <20220119205343.kd5cwfzpg4mlsekk@ldmartin-desk2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119205343.kd5cwfzpg4mlsekk@ldmartin-desk2>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Vishal Kulkarni <vishal@chelsio.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Raju Rangoju <rajur@chelsio.com>,
 Julia Lawall <julia.lawall@lip6.fr>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mikita Lipski <mikita.lipski@amd.com>, Eryk Brol <eryk.brol@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 linux-security-module@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>, netdev@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 19, 2022 at 12:53:43PM -0800, Lucas De Marchi wrote:
> On Wed, Jan 19, 2022 at 05:15:02PM +0100, Daniel Vetter wrote:
> > On Wed, Jan 19, 2022 at 04:16:12PM +0200, Jani Nikula wrote:

...

> > Yeah we can sed this anytime later we want to, but we need to get the foot
> > in the door. There's also a pile more of these all over.
> > 
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > on the series, maybe it helps? And yes let's merge this through drm-misc.
> 
> Ok, it seems we are reaching some agreement here then:

> - Change it to use str_ prefix

Not sure about this (*), but have no strong argument against. Up to you.
Ah, yes, Jani said about additional churn this change will make if goes
together with this series. Perhaps it can be done separately?

> - Wait -rc1 to avoid conflict
> - Merge through drm-misc

*) E.g. yesno() to me doesn't sound too bad to misunderstand its meaning,
   esp.when it's used as an argument to the printf() functions.

-- 
With Best Regards,
Andy Shevchenko


