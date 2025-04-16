Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 411D6A8B410
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 10:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC3A10E88B;
	Wed, 16 Apr 2025 08:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="njtdh6Ru";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80ECD10E88B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 08:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744792780; x=1776328780;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=p+XBvLg9rkmGGTtrb2R/3jhsKKw7S7NJINTLRBiWg1Y=;
 b=njtdh6Ru6MXXp+bIF6Tnv0blp+BgMn6fOI4MSgC1M7YXs99uztBh0erh
 8RzKVBZhfZT+xSkK04AEWXglieO+dsQvwciaKc5Yym1Lqa/4/svg0RMqf
 6m2bPyul154Erq3QqGH+Z3WXjuqZ6L//MmrIv50Cu96+ij6Kz/Vo0LzoC
 8TmWGDO8clczX1oaDm42rUu3Z3jLzJ6Uvc+1GM2KYEoTfWgaL255OeC30
 q6neWR2SsM030Azl320m6lYcluvenPdGWJA2v/1pCINYDGWoRfr1j0YZJ
 8lVMoBpqktMAHJARCheEATs49TwHA2p0A0ByELyWEG3u115K/x8ZY/+qt w==;
X-CSE-ConnectionGUID: LWd1DNmzSUSWSX2KEDV5qA==
X-CSE-MsgGUID: SyulPYCiQDmJ+Av4lvdeoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="56993340"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="56993340"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 01:39:40 -0700
X-CSE-ConnectionGUID: /kRZ9YxTRhuRDHd0IKMQyQ==
X-CSE-MsgGUID: FvUNg0alQxK2UTRq3tXh2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="135442492"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.96])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 01:39:37 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lee Jones <lee@kernel.org>, Mario Limonciello <superm1@kernel.org>
Cc: mario.limonciello@amd.com, danielt@kernel.org, jingoohan1@gmail.com,
 Lennart Poettering <lennart@poettering.net>,
 richard.purdie@linuxfoundation.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] docs: backlight: Clarify `actual_brightness`
In-Reply-To: <20250415155319.GZ372032@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250408192729.4091391-1-superm1@kernel.org>
 <20250415155319.GZ372032@google.com>
Date: Wed, 16 Apr 2025 11:39:34 +0300
Message-ID: <87r01spkjd.fsf@intel.com>
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

On Tue, 15 Apr 2025, Lee Jones <lee@kernel.org> wrote:
> On Tue, 08 Apr 2025, Mario Limonciello wrote:
>
>> From: Mario Limonciello <mario.limonciello@amd.com>
>> 
>> Currently userspace software systemd treats `brightness` and
>> `actual_brightness` identically due to a bug found in an out of tree
>> driver.
>> 
>> This however causes problems for in-tree drivers that use brightness
>> to report user requested `brightness` and `actual_brightness` to report
>> what the hardware actually has programmed.
>> 
>> Clarify the documentation to match the behavior described in commit
>> 6ca017658b1f9 ("[PATCH] backlight: Backlight Class Improvements").
>> 
>> Cc: Lennart Poettering <lennart@poettering.net>
>> Cc: richard.purdie@linuxfoundation.org
>> Link: https://github.com/systemd/systemd/pull/36881
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>  Documentation/ABI/stable/sysfs-class-backlight | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>> 
>> diff --git a/Documentation/ABI/stable/sysfs-class-backlight b/Documentation/ABI/stable/sysfs-class-backlight
>> index 6102d6bebdf9a..909cacde85041 100644
>> --- a/Documentation/ABI/stable/sysfs-class-backlight
>> +++ b/Documentation/ABI/stable/sysfs-class-backlight
>> @@ -26,7 +26,9 @@ Date:		March 2006
>>  KernelVersion:	2.6.17
>>  Contact:	Richard Purdie <rpurdie@rpsys.net>
>>  Description:
>> -		Show the actual brightness by querying the hardware.
>> +		Show the actual brightness by querying the hardware. This
>> +		takes into account other factors besides the value programmed
>> +		for 'brightness' and may not match the value in 'brightness'.
>
> Which factors?  Under what circumstances may the values not match?

At least for i915, the brightness range in sysfs isn't guaranteed to be
the range in hardware. For example, you might want sysfs to start from
0, but the hardware has a minimum that is non-zero. Or you might just
want to have a fixed range, say, 0-100 in sysfs. Any scaling may
introduce rounding errors in the round-trip.

BR,
Jani.


-- 
Jani Nikula, Intel
