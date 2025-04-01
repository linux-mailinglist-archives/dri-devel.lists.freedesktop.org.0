Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A46ABA776CD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 10:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E1A10E51F;
	Tue,  1 Apr 2025 08:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N6MIjHKe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DDC10E51C;
 Tue,  1 Apr 2025 08:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743497270; x=1775033270;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ZC6KW82XXEy4x+ukZzXf5jGigKEUV/aJpTmCSL59A2g=;
 b=N6MIjHKeprDwdnfAJPlzWaQddJ1p0J+ymtdh7cZzVMpEw5B8X8eEinju
 oAyMNeR9iSvutI6y65l4V4lzvCHGnY32T0CGtPwSeMGnXMdmhrc6fo2Qt
 XxExA8NtBplLwHAHd4qGhH5hVA4DcCMG/mz1RykrwcmmYSp9Yr+iASrAB
 PowIx/qMZxa54kx0Yj3ERJjbm67XCQjxds2B/RzARDgE0HfIbouWqPg3E
 oprFsu0Nv6rKFwRPO/UG+7r0JzehL/t8FlF75TWwnwp3s1RXs4Z7ZoRzM
 dy4Qc38v0F7orbH8wzdsqiHPckFCdsmldBmzGzO00YnVRFhkwsMDRw8jD A==;
X-CSE-ConnectionGUID: X7/nSFwlTxSZwyQMh+wU2Q==
X-CSE-MsgGUID: xBkqsKcHTzm/d6BATlDP0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44522871"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="44522871"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 01:47:49 -0700
X-CSE-ConnectionGUID: 63H3Bq8kTLyDjxMClZcM/g==
X-CSE-MsgGUID: Uib4Te/nRIGwb/epJJ9Ksw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="157253725"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.7])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 01:47:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Zhenyu Wang <zhenyuw.linux@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, Dave Airlie <airlied@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>, Tvrtko
 Ursulin <tursulin@ursulin.net>, Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: update MAINTAINERS
In-Reply-To: <Z-lRc1uD6sVvawHZ@dell-wzy>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250227093805.2217658-1-jani.nikula@intel.com>
 <Z-lRc1uD6sVvawHZ@dell-wzy>
Date: Tue, 01 Apr 2025 11:47:43 +0300
Message-ID: <878qok46a8.fsf@intel.com>
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

On Sun, 30 Mar 2025, Zhenyu Wang <zhenyuw.linux@gmail.com> wrote:
> On Thu, Feb 27, 2025 at 11:38:05AM +0200, Jani Nikula wrote:
>> Update GVT-g MAINTAINERS entry to reflect the current status of
>> maintenance and repositories.
>> 
>> Cc: Dave Airlie <airlied@gmail.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Simona Vetter <simona.vetter@ffwll.ch>
>> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
>> Cc: Zhenyu Wang <zhenyuw.linux@gmail.com>
>> Cc: Zhi Wang <zhi.wang.linux@gmail.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>
> Sorry for late reply. I was quite busy on personal things during last month
> that almost no chance to put hands on keyboard. ;)
>
> As I think both Zhi and I agreed before, this is totally fine with me.
>
> Acked-by: Zhenyu Wang <zhenyuw.linux@gmail.com>

Thanks for the acks, pushed to drm-intel-next.

BR,
Jani.


>
> Thanks!
>
>>  MAINTAINERS | 9 +++------
>>  1 file changed, 3 insertions(+), 6 deletions(-)
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 5b69b93f63c6..98374661f5a8 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -11649,13 +11649,10 @@ F:	drivers/gpio/gpio-tangier.c
>>  F:	drivers/gpio/gpio-tangier.h
>>  
>>  INTEL GVT-g DRIVERS (Intel GPU Virtualization)
>> -M:	Zhenyu Wang <zhenyuw.linux@gmail.com>
>> -M:	Zhi Wang <zhi.wang.linux@gmail.com>
>> -L:	intel-gvt-dev@lists.freedesktop.org
>> -L:	intel-gfx@lists.freedesktop.org
>> -S:	Supported
>> +R:	Zhenyu Wang <zhenyuw.linux@gmail.com>
>> +R:	Zhi Wang <zhi.wang.linux@gmail.com>
>> +S:	Odd Fixes
>>  W:	https://github.com/intel/gvt-linux/wiki
>> -T:	git https://github.com/intel/gvt-linux.git
>>  F:	drivers/gpu/drm/i915/gvt/
>>  
>>  INTEL HID EVENT DRIVER
>> -- 
>> 2.39.5
>> 

-- 
Jani Nikula, Intel
