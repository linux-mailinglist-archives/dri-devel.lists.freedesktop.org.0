Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C068996B64F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 11:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFFD289854;
	Wed,  4 Sep 2024 09:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NkPSiHj/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F39E089854
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 09:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725441532; x=1756977532;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9qyTCBSYWa24du+tZSxAeaPaBNxxQsd45X0TXUxVmd4=;
 b=NkPSiHj/1zz+Y5B5y7/eG9klUb2/3OMfBApsuCdCDSdHVIgLwAuoLN2K
 Q8Cka4BAOZYjmwssImd0AFvC9QARcN3sU8qqggYJ0kiWMY+j+sy5/PCuw
 wSru+BGvU74yT1CKBaQnDpKkBotavD2Je2J8B0R7fMpbT+1pn1ML2L85f
 vBFqEaccJFmcYgx+YRzvtTjYD/I3YGNxPwoKpTSmV7oCOH/IICcb47Q+Y
 RAkOkLT2svVP0jO1p2g8v3qoDyJGsc9uECh3fQQNnn9ExxtLqJPSGsdY8
 zPQfz2/0y3RWEK3/Yw8M6FXwISzHjMiqOuB82vwyoi9jMvPtT1LPhRcMR A==;
X-CSE-ConnectionGUID: vSLW3aLWQaiRw7QvHWH/wg==
X-CSE-MsgGUID: WbGis0FuTBOLl2fh1QOV7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="27006033"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="27006033"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 02:18:51 -0700
X-CSE-ConnectionGUID: oIpY0DE7QV6KMWmwAZBfqg==
X-CSE-MsgGUID: ATsHl5LIQTK1/5/QyoNsPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="65940486"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.18])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 02:18:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 1/1] drm/mm: Mark drm_mm_interval_tree*() functions
 with __maybe_unused
In-Reply-To: <87ttf2utg5.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240829154640.1120050-1-andriy.shevchenko@linux.intel.com>
 <87ttf2utg5.fsf@intel.com>
Date: Wed, 04 Sep 2024 12:18:30 +0300
Message-ID: <87ttevsro9.fsf@intel.com>
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

On Fri, 30 Aug 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Thu, 29 Aug 2024, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>> The INTERVAL_TREE_DEFINE() uncoditionally provides a bunch of helper
>> functions which in some cases may be not used. This, in particular,
>> prevents kernel builds with `make W=1` and CONFIG_WERROR=y:
>>
>> .../drm/drm_mm.c:152:1: error: unused function 'drm_mm_interval_tree_insert' [-Werror,-Wunused-function]
>>   152 | INTERVAL_TREE_DEFINE(struct drm_mm_node, rb,
>>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>   153 |                      u64, __subtree_last,
>>       |                      ~~~~~~~~~~~~~~~~~~~~
>>   154 |                      START, LAST, static inline, drm_mm_interval_tree)
>>       |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> Fix this by marking drm_mm_interval_tree*() functions with __maybe_unused.
>>
>> Fixes: 202b52b7fbf7 ("drm: Track drm_mm nodes with an interval tree")
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> As discussed in [1], the key combo is W=1 and Clang, which enables
> detection for unused static inlines.
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Pushed to drm-misc-next, thanks for the patch.

BR,
Jani.

>
>
> BR,
> Jani.
>
>
> [1] https://lore.kernel.org/r/20240829155950.1141978-1-andriy.shevchenko@linux.intel.com
>
>
>> ---
>>  drivers/gpu/drm/drm_mm.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
>> index 5ace481c1901..1ed68d3cd80b 100644
>> --- a/drivers/gpu/drm/drm_mm.c
>> +++ b/drivers/gpu/drm/drm_mm.c
>> @@ -151,7 +151,7 @@ static void show_leaks(struct drm_mm *mm) { }
>>  
>>  INTERVAL_TREE_DEFINE(struct drm_mm_node, rb,
>>  		     u64, __subtree_last,
>> -		     START, LAST, static inline, drm_mm_interval_tree)
>> +		     START, LAST, static inline __maybe_unused, drm_mm_interval_tree)
>>  
>>  struct drm_mm_node *
>>  __drm_mm_interval_first(const struct drm_mm *mm, u64 start, u64 last)

-- 
Jani Nikula, Intel
