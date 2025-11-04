Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC4BC31911
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 15:39:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9E410E285;
	Tue,  4 Nov 2025 14:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FGHLVJp9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328B610E285
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 14:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762267194; x=1793803194;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Z4YP+k9iwjYEwdWOSOWbQLARIoGf1Wg9C9qA9L61mSE=;
 b=FGHLVJp9cDUK8f0QwAJmoLCVePbbxNsRE8n3dwrkbYJqQzyV7s0iihMB
 e9lstykVirHzxgXdFdXD7emRiMkn7jT6FYsRbBV3VeQlw9NBzdgDxsUoo
 8vWkNe/HvUtsbHB8XRTPLyOuUTa98o5UHiRVQ7+PMPa6vUdA/NInaLlxE
 ZDIoIxcRoscd2BQVJA1jucvUBhivjbP9PPj4n0KvbnISyvM6lu/mgZel8
 iy0B2gKKJACFoLkut0zoP4x84IbQQSh13u/uJwp3V0c5PtexFk/h6ltq0
 NMfkCfQm0SL/++pA13PbezLfS9xQ0OCbAS3Grier7S2UgUmRNWK+H4NZO g==;
X-CSE-ConnectionGUID: PigsmKOmSqagppU9dKlmdw==
X-CSE-MsgGUID: OkgmBJfhRz+wEGES3ZrdLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75472430"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="75472430"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 06:39:53 -0800
X-CSE-ConnectionGUID: ZNHZ4SDDSyKAdPTKQeb+vw==
X-CSE-MsgGUID: 4677MU5KS+yUq4dbL9W9RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="191265399"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.182])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 06:39:50 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com, lizhi.hou@amd.com
Subject: Re: [PATCH v2] accel/ivpu: Improve debug and warning messages
In-Reply-To: <cefbd464-2f0f-4055-ab6e-9b76047794b2@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251104090049.944152-1-karol.wachowski@linux.intel.com>
 <42f705ef5eb4c1b225d6e97007b900a51e24235e@intel.com>
 <cefbd464-2f0f-4055-ab6e-9b76047794b2@linux.intel.com>
Date: Tue, 04 Nov 2025 16:39:47 +0200
Message-ID: <d8cdb0c5c420b7ac9bf64367a25d2ad6dff95637@intel.com>
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

On Tue, 04 Nov 2025, Karol Wachowski <karol.wachowski@linux.intel.com> wrote:
> On 11/4/2025 2:00 PM, Jani Nikula wrote:
>> On Tue, 04 Nov 2025, Karol Wachowski <karol.wachowski@linux.intel.com> wrote:
>>>  #define ivpu_warn_ratelimited(vdev, fmt, ...) \
>>> -	drm_err_ratelimited(&(vdev)->drm, "%s(): " fmt, __func__, ##__VA_ARGS__)
>>> +	__drm_printk(&(vdev)->drm, warn, _ratelimited, fmt, ##__VA_ARGS__)
>> The double underscore is a hint that it's private, don't use it outside
>> of drm_print.h.
>>
>> BR,
>> Jani.
>
> Thanks, I will remove this. BTW is there a reason for
> drm_warn_ratelimited not existing in drm_print.h?

I can't think of a reason other than not having a user and not wanting
to pre-emptively add a bunch of macros that aren't used.

BR,
Jani.


-- 
Jani Nikula, Intel
