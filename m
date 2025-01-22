Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1981DA1933D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 15:02:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B7E10E1E6;
	Wed, 22 Jan 2025 14:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NZDz+Ki2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1150310E1E6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 14:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737554556; x=1769090556;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Y5tZimirdv9Fm6GP7p0N1o61qB70lxNm9N0aU4EBlJo=;
 b=NZDz+Ki2ZutVE/p7AwH3KrMkZV/TPViwjHgscB1IIYio8OaViRKp275X
 1y+AUgJEUsokyX+nz9JrUxpsN+GBTIDsCLCwZd0C7zGUM/IVNSgzOlE1t
 z72BDAn/rJOKNEIAI0qqOOozgGgOygk0V68hxQ/4V6Ke9P3QxXHD6WsCR
 gNJg3Xrjj4bYof3VV0XJ7oo0ymY+CUjwyr4BDaG0I2zDgLC07SWAjF/wa
 2uLTgJpWKsHKFqNrSXx8iAPmYcv9Oxo9675KyLev/YrCPvzrxen+q+PF4
 q/nJFiDi2CNe75Zu5ahoX9GBD+F2PfAFVtMye4ZMUWdLIzrzpE7v/RvCn A==;
X-CSE-ConnectionGUID: 73eqZNs8TkmdXjM3G8zTOg==
X-CSE-MsgGUID: s8nWqEClSkqcYmrwqfoBHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="41769277"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="41769277"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 06:02:35 -0800
X-CSE-ConnectionGUID: IKDw3YQSRVaOn6yUxha1QQ==
X-CSE-MsgGUID: RE8ng8GLTiSJ9t5HkYhrJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="107172478"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.30])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 06:02:34 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/print: Include drm_device.h
In-Reply-To: <173755097154.5500.15568058785162208000@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250121210935.84357-1-gustavo.sousa@intel.com>
 <Z5DSeQjrUKym5Dzb@phenom.ffwll.local>
 <173755097154.5500.15568058785162208000@intel.com>
Date: Wed, 22 Jan 2025 16:02:31 +0200
Message-ID: <87jzanndzc.fsf@intel.com>
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
> Quoting Simona Vetter (2025-01-22 08:11:53-03:00)
>>On Tue, Jan 21, 2025 at 06:09:25PM -0300, Gustavo Sousa wrote:
>>> The header drm_print.h uses members of struct drm_device pointers, as
>>> such, it should include drm_device.h to let the compiler know the full
>>> type definition.
>>> 
>>> Without such include, users of drm_print.h that don't explicitly need
>>> drm_device.h would bump into build errors and be forced to include the
>>> latter.
>>> 
>>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
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
>>
>>We much prefer just a struct device forward decl to avoid monster headers.
>>Is that not doable here?
>
> I don't think so. This header explicitly uses members of struct
> drm_device, so the compiler needs to know the full type definition. As
> an example see the definition of drm_WARN(), it uses (drm)->dev.

I grudgingly agree. I don't think there are actual cases where this
happens, but I can imagine you could create one.

>> Worst case I'd convert the drm_info_printer() static inline to a
>> macro, not sure about the exact rules here if you never deref a
>> pointer.

The forward declaration is enough for passing pointers around without
dereferencing. It's the dereferencing in the macros that could fail the
build if the .c using them doesn't include drm_device.h.

To balance things out, I think we could probably drop drm/drm.h if we
inlined one use of DRM_NAME to just "drm".


BR,
Jani.


>>-Sima
>>
>>>  
>>>  struct debugfs_regset32;
>>>  struct drm_device;
>>> -- 
>>> 2.48.1
>>> 
>>
>>-- 
>>Simona Vetter
>>Software Engineer, Intel Corporation
>>http://blog.ffwll.ch

-- 
Jani Nikula, Intel
