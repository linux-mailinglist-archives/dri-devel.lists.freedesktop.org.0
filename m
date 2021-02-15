Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81D431BDE3
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 16:59:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406C96E2BC;
	Mon, 15 Feb 2021 15:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8706E159;
 Mon, 15 Feb 2021 15:58:55 +0000 (UTC)
IronPort-SDR: Bu7BN6u8Yl7XkpsIl11D0FAFzCb+qLBeLG8HbpWAOPmZv4YW9WjLRoExyeujy7W/QXw4WyNhJv
 SVTv7yeuYSbw==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="169843274"
X-IronPort-AV: E=Sophos;i="5.81,181,1610438400"; d="scan'208";a="169843274"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 07:58:55 -0800
IronPort-SDR: qUBcDnMNGWB44uoh1MTupZsdb45fxio3m0E/f9VI6r96twT5vE68fSmGs0x7S+Ia9ZGYH1KBSs
 erfQ6tr1Worg==
X-IronPort-AV: E=Sophos;i="5.81,181,1610438400"; d="scan'208";a="580213026"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 07:58:50 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lBgGs-005GNG-Ra; Mon, 15 Feb 2021 17:58:46 +0200
Date: Mon, 15 Feb 2021 17:58:46 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v1 1/3] string: Consolidate yesno() helpers under
 string.h hood
Message-ID: <YCqaNnr7ynRydczE@smile.fi.intel.com>
References: <20210215142137.64476-1-andriy.shevchenko@linux.intel.com>
 <87y2fpbdmp.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y2fpbdmp.fsf@intel.com>
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
Cc: Eryk Brol <eryk.brol@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Leo Li <sunpeng.li@amd.com>, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Raju Rangoju <rajur@chelsio.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, David Airlie <airlied@linux.ie>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Jakub Kicinski <kuba@kernel.org>, Mikita Lipski <mikita.lipski@amd.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 15, 2021 at 04:37:50PM +0200, Jani Nikula wrote:
> On Mon, 15 Feb 2021, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > We have already few similar implementation and a lot of code that can benefit
> > of the yesno() helper.  Consolidate yesno() helpers under string.h hood.
> 
> Good luck. I gave up after just four versions. [1]

Thanks for a pointer! I like your version, but here we also discussing a
possibility to do something like %py[DOY]. It will consolidate all those RO or
whatever sections inside one data structure.

> Acked-by: Jani Nikula <jani.nikula@intel.com>
> 
> [1] http://lore.kernel.org/r/20191023131308.9420-1-jani.nikula@intel.com


-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
