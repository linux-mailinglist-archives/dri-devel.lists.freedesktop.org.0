Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95126BC3719
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 08:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52DF10E751;
	Wed,  8 Oct 2025 06:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YIfVNhzr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D90B10E751
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 06:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759903972; x=1791439972;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Y6GTacm5TpGrAvRU87TGRsD66ToAyAyRcV/qzREfMKU=;
 b=YIfVNhzryCbM8gZMYjNvSJ2W6mFwU2EIaUtZDCYnl6qWD+aBnk/Sgr4/
 xFDbngynGSHHVUstKid6dJ4KD/2W32Bp7gx+yaBOB2+7vfSabuuY0WCsi
 m/Xda/LPHrwNZqUr4KuSfm+x7oVU0EaY/XcxQFJ9TCeyZqO60CpW/RYPv
 VFjFoBoV+vRT2qN9SNB1HnXLTAGZy+H8WoXiNepoYzV9daHU+hou+bQd4
 TPU09tVWs7ZdoT0M/MutM4CGqY38PP5FYWU9CA4+9t/KhWa2+W9t+dVGU
 c5XrAKWoYq81xxk8VXc3x44/tRY2/fUl0mRWKD6UvRT2iY2Cti89C5mBI Q==;
X-CSE-ConnectionGUID: V5sDNQ0SQPiabQyWfwD3lw==
X-CSE-MsgGUID: /qFytaQxRdSPx0A0EXEfKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="65737203"
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="65737203"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 23:12:52 -0700
X-CSE-ConnectionGUID: 0364bUxpSjq+wfRpn4ooNA==
X-CSE-MsgGUID: S48hjOwCQUa7geQmO3BkVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="185646866"
Received: from unknown (HELO [10.102.88.35]) ([10.102.88.35])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 23:12:50 -0700
Message-ID: <c05b50a3-7493-43ae-a37f-7c667d52ab87@linux.intel.com>
Date: Wed, 8 Oct 2025 08:12:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Return correct job error status
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com,
 lizhi.hou@amd.com, Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
References: <20251007083527.2817045-1-karol.wachowski@linux.intel.com>
 <6b057daf-42d3-435a-af93-8c57e31550b7@oss.qualcomm.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <6b057daf-42d3-435a-af93-8c57e31550b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Thanks for pointing this out. Returning ABORTED was not generally a
problem, but it limited user space ability to distinguish between
different failure modes.
Changing this improves debugability and allows applications to take
actions based on separate return codes accordingly.

I have improved clarification of the change in commit message in PATCHv2.

Karol

On 10/7/2025 4:54 PM, Jeff Hugo wrote:
> On 10/7/2025 2:35 AM, Karol Wachowski wrote:
>> From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
>>
>> The driver was returning ABORTED for all error that trigger engine
>> reset.
>
> "is returning" right? The driver currently does this (without this
> patch)?
>
> Is this a bad thing? Should the driver do something different? I feel
> like there should be more explanation here.
>
>> Refactor ivpu_job_signal_and_destroy() by extracting engine error
>> handling logic into a new function ivpu_job_handle_engine_error().
>> This simplifies engine error handling logic by removing necessity of
>> calling ivpu_job_singal_and_destroy() multiple times by a single job
>> changing it's behavior based on job status.
>>
>> Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
