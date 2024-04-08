Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2625C89B9B7
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 10:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447F9112239;
	Mon,  8 Apr 2024 08:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZfUte0Pr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75EBA112239;
 Mon,  8 Apr 2024 08:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712563786; x=1744099786;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=92BGp6JXhIHjCCB0FTx9liwfLuaO5IB0b70sT0CrC4M=;
 b=ZfUte0PrwjKPvuFu7q2eBZFmBodL+1D7qFs88FDmJe6kgJWQG4KVhNCS
 Kvux7O6by6H6NzsziCy14MdCGtXhcx/EtuqaO6dJe0eL67Zg8GhIMft2L
 hC5/Clri6ZQK3Kq/6WomhUFLN2gkWRQmaY/1HJD5Rx3x66wwIbjI1GXog
 PY3pD18rc5RhhZT3JzZo9atgCIZeoCVzw2GldBvwawwcibvvN6/wM/Vfj
 GCkAPPrMvt7zQMBoGSjyMW6NHCcvKjT+6pv5fZWDIwPXu69qG7LuOgo9d
 x4DxLs5vfrdYlwNGXtXaan83unnCnhO9GE19OpQdyOWbIQ8BwThBVr0Bm w==;
X-CSE-ConnectionGUID: UVWw6G4PSXCSnXxhAbE8og==
X-CSE-MsgGUID: tnExMptPRP6PgNptaQGShw==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="25327653"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="25327653"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 01:09:45 -0700
X-CSE-ConnectionGUID: jpUK233HQLGo48IwE0EMYQ==
X-CSE-MsgGUID: ZRyUmMmIQqKJ0iZNBs7QHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="57270073"
Received: from bauinger-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 01:09:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>, Aishwarya TCV
 <aishwarya.tcv@arm.com>
Subject: Re: [PATCH] drm/msm: convert all pixel format logging to use %p4cc
In-Reply-To: <eondf5x3wz3nccxpnqxtb7gtvf3k5u3bz4qwhn3gbcy5pj73ku@fue4tej3xgnq>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240405092907.2334007-1-jani.nikula@intel.com>
 <eondf5x3wz3nccxpnqxtb7gtvf3k5u3bz4qwhn3gbcy5pj73ku@fue4tej3xgnq>
Date: Mon, 08 Apr 2024 11:09:38 +0300
Message-ID: <87frvwb7i5.fsf@intel.com>
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

On Fri, 05 Apr 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Fri, Apr 05, 2024 at 12:29:07PM +0300, Jani Nikula wrote:
>> Logging u32 pixel formats using %4.4s format string with a pointer to
>> the u32 is somewhat questionable, as well as dependent on byte
>> order. There's a kernel extension format specifier %p4cc to format 4cc
>> codes. Use it across the board in msm for pixel format logging.
>> 
>> This should also fix the reported build warning:
>> 
>>   include/drm/drm_print.h:536:35: warning: '%4.4s' directive argument is
>>   null [-Wformat-overflow=]
>> 
>> Reported-by: Aishwarya TCV <aishwarya.tcv@arm.com>
>> Closes: https://lore.kernel.org/r/2ac758ce-a196-4e89-a397-488ba31014c4@arm.com
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> ---
>> 
>> Tip: 'git show --color-words -w' might be the easiest way to review.
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  8 +++----
>>  .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  2 +-
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |  4 ++--
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 24 +++++++++----------
>>  drivers/gpu/drm/msm/msm_fb.c                  | 10 ++++----
>>  5 files changed, 24 insertions(+), 24 deletions(-)
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks! Do you take this via the msm tree?

BR,
Jani.


-- 
Jani Nikula, Intel
