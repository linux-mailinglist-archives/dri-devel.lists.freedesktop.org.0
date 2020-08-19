Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B6B249E0E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 14:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B561B6E17A;
	Wed, 19 Aug 2020 12:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FA16E17A;
 Wed, 19 Aug 2020 12:34:49 +0000 (UTC)
IronPort-SDR: A8+tzjjnRXpp0XKb3+O5w9LIQYPkDk+Q37iZRpWGoUTEb9UIS1t5djHmZNCb7Vn/S+7KgcYc34
 MVJFE4LYzzjA==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="173142452"
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; d="scan'208";a="173142452"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 05:34:48 -0700
IronPort-SDR: O9Ilij2IMf9HVT2IzB1dK4nW7L+FRWw4cgkeaf0zBRU7iMFIEIuImDvn1sh6zUv1PeDac/lPrs
 VT61uBkKkePQ==
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; d="scan'208";a="441587305"
Received: from mkapalax-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.47.149])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 05:34:45 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v1] drm/i915/gt: convert tasklets to use new
 tasklet_setup() API
In-Reply-To: <159783838601.667.13987031157680370712@build.alporthouse.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200819115353.59592-1-andriy.shevchenko@linux.intel.com>
 <159783838601.667.13987031157680370712@build.alporthouse.com>
Date: Wed, 19 Aug 2020 15:34:41 +0300
Message-ID: <87h7sy7r1a.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Aug 2020, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> Quoting Andy Shevchenko (2020-08-19 12:53:53)
>> In preparation for unconditionally passing the struct tasklet_struct
>> pointer to all tasklet callbacks, switch to using the new tasklet_setup()
>> and from_tasklet() to pass the tasklet pointer explicitly.
>> 
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> -Chris

Uh, what?

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
