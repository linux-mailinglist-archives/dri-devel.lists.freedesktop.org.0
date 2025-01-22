Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4100BA1945D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 15:49:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3790610E70B;
	Wed, 22 Jan 2025 14:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nGNrA7TE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898AD10E6F5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 14:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737557366; x=1769093366;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=SdE5G67b0WlbIU/EDbxuOkr/Uq01Fx4uRUOxJ/YAwtc=;
 b=nGNrA7TEW0Cp0DcPz3uMNMVHfWozXkTB8EWkgyueW1al40a0WRxs3ZzW
 H0ToUYdsOFjLz6UMhKiFCnbMZ2M2dDAByuFnWxUdRFYp7mH1sjYC+/9T9
 MPmWomhd3E9k7JEKN92NieDxbXKNnYxSS6shmLMI1KttijMcAa44v4tYn
 S4FcvN6hEUeBQotr0E3cMuOBhrp/uZfHqdgDdlVSRIH0MklhE+ZioW4W9
 UV2sglfU7N6IMzqG+gbj2oNiQaFPerkw+KiuZYruCIX/DYQpEukhrfZ8I
 hD6oeD8+B/JTZrYwc+jGCVmAPaWAo5e8Ty1qrP0KbG3tPpoGIW+ykSarN w==;
X-CSE-ConnectionGUID: I2a9XwzLRF2CigMjdll0mA==
X-CSE-MsgGUID: w4jdSu01SaaApMF4crO80A==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="41946613"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="41946613"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 06:49:26 -0800
X-CSE-ConnectionGUID: 9lWAtIamQZKPhgBuMthRjA==
X-CSE-MsgGUID: M7j1mNs0Qri2+gVJG6n2zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="107770528"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.30])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 06:49:24 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/print: Include drm_device.h
In-Reply-To: <173755624141.5500.13245593483082552961@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250121210935.84357-1-gustavo.sousa@intel.com>
 <Z5DSeQjrUKym5Dzb@phenom.ffwll.local>
 <173755097154.5500.15568058785162208000@intel.com>
 <87jzanndzc.fsf@intel.com>
 <173755624141.5500.13245593483082552961@intel.com>
Date: Wed, 22 Jan 2025 16:49:21 +0200
Message-ID: <87h65qoqdq.fsf@intel.com>
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

On Wed, 22 Jan 2025, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
> Quoting Jani Nikula (2025-01-22 11:02:31-03:00)
>>On Wed, 22 Jan 2025, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
>>> Quoting Simona Vetter (2025-01-22 08:11:53-03:00)
>>>>On Tue, Jan 21, 2025 at 06:09:25PM -0300, Gustavo Sousa wrote:
>>>>> The header drm_print.h uses members of struct drm_device pointers, as
>>>>> such, it should include drm_device.h to let the compiler know the full
>>>>> type definition.
>>>>> 
>>>>> Without such include, users of drm_print.h that don't explicitly need
>>>>> drm_device.h would bump into build errors and be forced to include the
>>>>> latter.
>>>>> 
>>>>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>>>> ---
>>>>>  include/drm/drm_print.h | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>> 
>>>>> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
>>>>> index f77fe1531cf8..9732f514566d 100644
>>>>> --- a/include/drm/drm_print.h
>>>>> +++ b/include/drm/drm_print.h
>>>>> @@ -32,6 +32,7 @@
>>>>>  #include <linux/dynamic_debug.h>
>>>>>  
>>>>>  #include <drm/drm.h>
>>>>> +#include <drm/drm_device.h>
>>>>
>>>>We much prefer just a struct device forward decl to avoid monster headers.
>>>>Is that not doable here?
>>>
>>> I don't think so. This header explicitly uses members of struct
>>> drm_device, so the compiler needs to know the full type definition. As
>>> an example see the definition of drm_WARN(), it uses (drm)->dev.
>>
>>I grudgingly agree. I don't think there are actual cases where this
>>happens, but I can imagine you could create one.
>
> It happened to me, and that motivated me to send this patch.
>
> I had a local patch where I just needed the drm_print.h header, but I
> ended up having to include drm_device.h in my .c file.

Right.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
>>
>>>> Worst case I'd convert the drm_info_printer() static inline to a
>>>> macro, not sure about the exact rules here if you never deref a
>>>> pointer.
>>
>>The forward declaration is enough for passing pointers around without
>>dereferencing. It's the dereferencing in the macros that could fail the
>>build if the .c using them doesn't include drm_device.h.
>>
>>To balance things out, I think we could probably drop drm/drm.h if we
>>inlined one use of DRM_NAME to just "drm".
>>
>>
>>BR,
>>Jani.
>>
>>
>>>>-Sima
>>>>
>>>>>  
>>>>>  struct debugfs_regset32;
>>>>>  struct drm_device;
>>>>> -- 
>>>>> 2.48.1
>>>>> 
>>>>
>>>>-- 
>>>>Simona Vetter
>>>>Software Engineer, Intel Corporation
>>>>http://blog.ffwll.ch
>>
>>-- 
>>Jani Nikula, Intel

-- 
Jani Nikula, Intel
