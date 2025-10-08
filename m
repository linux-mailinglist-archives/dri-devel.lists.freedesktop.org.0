Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E605BC60CD
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 18:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7F510E874;
	Wed,  8 Oct 2025 16:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JLH9Hjqg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FA910E868
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 16:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759941618; x=1791477618;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=x9CPtiF3u5sPA1xRgSyVIHR7dRlSeKZgj5ET9pk5xhU=;
 b=JLH9Hjqg1jzBiCunJJj56IHT0dEndeKLgA1RwAOsQhJRpUHA54vM1uH9
 RQ7mxofmWgUrRM4hAyJVvkmkrVx8phQ9XBHb8jqyCY1vm2M0kOtR267ea
 vpV4f06Q3ghjhxsOAwLcJ7U4tWniOc14mQnx1pQtmvFiXpwrbxbRMW2gp
 MLzRqPfwTWH5Br7/BYutaYFgw3sz112L0liZAwThLM+D8cWd+kSDS5AmO
 lk0KDDo7EQZDBovKHmkRDAT9LcfNNeVg/lZqm8U1lXH2g5DxXOAjrA/m4
 uQ3mn4+NYBrnMe76IuFI6ico3rS6vpMG2anR/lLL0ma0GEvUsSXWJzEX0 A==;
X-CSE-ConnectionGUID: mX7Z22kdSa2sbevv7xiP8A==
X-CSE-MsgGUID: gMO7Lfm1ShqYB3UStmmpWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="61846407"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="61846407"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 09:40:17 -0700
X-CSE-ConnectionGUID: MwOrjWBFQCOC3ibw5+ML2A==
X-CSE-MsgGUID: Q4sWSgRTQ+aiGFqnIxh1Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="204194379"
Received: from kwachows-mobl.ger.corp.intel.com (HELO [10.246.18.173])
 ([10.246.18.173])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 09:40:16 -0700
Message-ID: <ddbec02e-29c8-452b-a95a-59fbd7eb3d10@linux.intel.com>
Date: Wed, 8 Oct 2025 18:40:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/ivpu: Return correct job error status
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com,
 lizhi.hou@amd.com, Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
References: <20251008061255.2909794-1-karol.wachowski@linux.intel.com>
 <b84df96a-16c9-4369-b3a2-7f4204416261@oss.qualcomm.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <b84df96a-16c9-4369-b3a2-7f4204416261@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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


On 10/8/2025 5:03 PM, Jeff Hugo wrote:
> On 10/8/2025 12:12 AM, Karol Wachowski wrote:
>> From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
>>
>> The driver was returning ABORTED for all errors that trigger engine
>> reset.
>
> This is past tense (was). I believe coding style says that commit text
> should be in the present tense (is). "The driver is returning ABORTED..." 
Fixed that commit message before merging.
>
>> It is better to distinguish between different error types by returning
>> the actual error code reported by firmware. This allows userspace to
>> take different actions based on the error type and improves
>> debuggability.
>>
>> Refactor ivpu_job_signal_and_destroy() by extracting engine error
>> handling logic into a new function ivpu_job_handle_engine_error().
>> This simplifies engine error handling logic by removing necessity of
>> calling ivpu_job_singal_and_destroy() multiple times by a single job
>> changing it's behavior based on job status.
>>
>> Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>
> I don't see a need for a v3 to do a minor tweak to the commit text
> when it seems reasonable to just inline that at merge. 
Thank you. Applied with corrected text to drm-misc-next.
>
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
