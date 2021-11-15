Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F8D4503B9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 12:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1B96E90A;
	Mon, 15 Nov 2021 11:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094346E043;
 Mon, 15 Nov 2021 11:43:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="230885121"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="230885121"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 03:43:11 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="505889270"
Received: from csrini4x-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.218.37])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 03:43:05 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v1 1/3] string: Consolidate yesno() helpers under string.h
 hood
In-Reply-To: <YZI/VB+RhScL1wAi@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210215142137.64476-1-andriy.shevchenko@linux.intel.com>
 <20211005213423.dklsii4jx37pjvb4@ldmartin-desk2>
 <YZI/VB+RhScL1wAi@smile.fi.intel.com>
Date: Mon, 15 Nov 2021 13:43:02 +0200
Message-ID: <874k8d3ard.fsf@intel.com>
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
Cc: Eryk Brol <eryk.brol@amd.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 15 Nov 2021, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Oct 05, 2021 at 02:34:23PM -0700, Lucas De Marchi wrote:
>> On Mon, Feb 15, 2021 at 04:21:35PM +0200, Andy Shevchenko wrote:
>> > We have already few similar implementation and a lot of code that can benefit
>> > of the yesno() helper.  Consolidate yesno() helpers under string.h hood.
>> 
>> I was taking a look on i915_utils.h to reduce it and move some of it
>> elsewhere to be shared with others.  I was starting with these helpers
>> and had [1] done, then Jani pointed me to this thread and also his
>> previous tentative. I thought the natural place for this would be
>> include/linux/string_helpers.h, but I will leave it up to you.
>
> Seems reasonable to use string_helpers (headers and/or C-file).
>
>> After reading the threads, I don't see real opposition to it.
>> Is there a tree you plan to take this through?
>
> I rest my series in favour of Jani's approach, so I suppose there is no go
> for _this_ series.

If you want to make it happen, please pick it up and drive it. I'm
thoroughly had enough of this.

BR,
Jani.


>
>> [1] https://lore.kernel.org/lkml/20211005212634.3223113-1-lucas.demarchi@intel.com/T/#u

-- 
Jani Nikula, Intel Open Source Graphics Center
