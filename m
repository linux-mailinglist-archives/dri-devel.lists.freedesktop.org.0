Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A961AA1B505
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 12:50:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3882E10E961;
	Fri, 24 Jan 2025 11:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kc7D5WVa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396E510E030;
 Fri, 24 Jan 2025 11:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737719419; x=1769255419;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=zbxsNyljWdmJzH4uPLi8LebX9qW8qfajl2uu6enOqzo=;
 b=Kc7D5WVaPiL4ahB3N6Pv6TIYMce1aJ6JJD11CxDFx+xpxevB/++1djy5
 1BPG3+wUDXa/B6aJaweSbg+y4XW6HgqQP2Eug3okGXLvAuXGsxxvp2oHD
 e0wa0mquif4M4vPG6u2JP4B5MK9mslOOBb4qzNHJOsAeMgtOUi3QAxyUh
 sC1PSJv7OcpIOm7/iEOm0IGi7MD0quN2DwuJkscgyUNdA6+kjyXaC1Qcp
 zMX5IwhH+a0COmy28uBL3nfPcOpeSqFOLHPC+tWztWK0XanY1+BB91d95
 kc+zN2qPHgdnqo8m58dxQwlbpmMonc/vF7kHuGiNZd+uCx9DvPJ9uVHOy w==;
X-CSE-ConnectionGUID: eva/tqPGQbG45xQnEyi2mA==
X-CSE-MsgGUID: VBN4AK8iSmaZPphbJ8w8cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38393617"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="38393617"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 03:50:19 -0800
X-CSE-ConnectionGUID: 5IJylNmGRuyzVVHuCj9m8g==
X-CSE-MsgGUID: juN5rbGYQHedwAYwFd+Mnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144984676"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.170])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 03:50:18 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 4/5] drm/print: Include drm_device.h
In-Reply-To: <173764885189.34727.4688059102283695255@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1737644530.git.jani.nikula@intel.com>
 <11497a3e490c001f3a884acb310b4812b643a9a0.1737644530.git.jani.nikula@intel.com>
 <8734h9mujs.fsf@intel.com>
 <173764885189.34727.4688059102283695255@intel.com>
Date: Fri, 24 Jan 2025 13:50:14 +0200
Message-ID: <87jzakbfd5.fsf@intel.com>
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

On Thu, 23 Jan 2025, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
> Quoting Jani Nikula (2025-01-23 12:14:31-03:00)
>>On Thu, 23 Jan 2025, Jani Nikula <jani.nikula@intel.com> wrote:
>>> From: Gustavo Sousa <gustavo.sousa@intel.com>
>>>
>>> The header drm_print.h uses members of struct drm_device pointers, as
>>> such, it should include drm_device.h to let the compiler know the full
>>> type definition.
>>>
>>> Without such include, users of drm_print.h that don't explicitly need
>>> drm_device.h would bump into build errors and be forced to include the
>>> latter.
>>>
>>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>>
>>This posting should have had
>>
>>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>
>>but obviously not needed if the original [1] is merged instead.
>>
>>
>>[1] https://lore.kernel.org/r/20250121210935.84357-1-gustavo.sousa@intel.com
>
> Hm. Since that's in the upper drm layer, I thought I was not supposed to
> merge it myself.
>
> Am I? In that case, is it okay to merge it via drm-intel-next?

It's generally not okay to merge non-i915 stuff via drm-intel-next,
because only i915 is under our maintenance. We'd need rationale and acks
for that, which we occasionally do, but there's no reason here.

But you can apply for drm-misc commit rights, similar to drm-intel, and
apply the patches to drm-misc-next yourself. See the maintainer tools
documentation.


BR,
Jani.


>
> --
> Gustavo Sousa
>
>>
>>>
>>> ---
>>>
>>> Including here as a dependency. May be merged independently.
>>> ---
>>>  include/drm/drm_print.h | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
>>> index f77fe1531cf8..9732f514566d 100644
>>> --- a/include/drm/drm_print.h
>>> +++ b/include/drm/drm_print.h
>>> @@ -32,6 +32,7 @@
>>>  #include <linux/dynamic_debug.h>
>>>  
>>>  #include <drm/drm.h>
>>> +#include <drm/drm_device.h>
>>>  
>>>  struct debugfs_regset32;
>>>  struct drm_device;
>>
>>-- 
>>Jani Nikula, Intel

-- 
Jani Nikula, Intel
