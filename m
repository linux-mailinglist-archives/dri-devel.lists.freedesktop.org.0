Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27407A31FF9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 08:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1166710E7C8;
	Wed, 12 Feb 2025 07:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VIDJiHEf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1846B10E7C6;
 Wed, 12 Feb 2025 07:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739345315; x=1770881315;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vHR2fkHr2dMEQm2+y+aEeuXq2JtCv+bMQq4mIUaZm/M=;
 b=VIDJiHEfU1m66sWkIzJTv3iBnqBsA2xuCkjPVSc03jKC2GAG+DoitOS/
 aklICxUjTFSEpboOg0DHzIxr70Kwv9WVoUam2Lld038ZF8+HoHSJ1tfEs
 5kqkB5JXOQZGKGp3VZzvLj/K/WD6eSe8GastYPLMTbtMzhHU2Kbq2FeJ9
 eCUUada0vaTrePi1lTBvQ1XCnNRJ+FOQFYzX7ojU9rqdRWxx9P/WS+pmA
 OjOkTz+DdA6qvPPbnlHrEIt+30V6pAHCd/F9OKMvaifw+9Vm2jH9JgW9H
 dMOFloa8KHZzFukv+m0j9/wKy6tHCD+Myg8ee0hj+vVlxUL9d5ERJCw0D w==;
X-CSE-ConnectionGUID: cq6uvzVZQS2cC53VS6YP6g==
X-CSE-MsgGUID: 71OugrpLSj+/WcH1M4KFIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="40254313"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="40254313"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 23:28:34 -0800
X-CSE-ConnectionGUID: rr0J+1LuQF+plVqM7Q+/mw==
X-CSE-MsgGUID: 28ttyhzcR1mKYUhloiM2TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="112496966"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.244.101])
 ([10.245.244.101])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 23:28:31 -0800
Message-ID: <7ca7be00-f6d9-43b7-b3d0-0984306ac302@linux.intel.com>
Date: Wed, 12 Feb 2025 08:28:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] drm/{i915,xe}: Convert to DRM client setup
To: Thomas Zimmermann <tzimmermann@suse.de>, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, jfalempe@redhat.com, javierm@redhat.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20241212170913.185939-1-tzimmermann@suse.de>
 <de8325a9-49b2-48ec-ba56-4349140564b1@suse.de>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <de8325a9-49b2-48ec-ba56-4349140564b1@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hey,

I'll give it a spin on xe today. It seems someone already tried on i915,
so I expect no issues.

The only question I have is do we still inherit the BIOS fb on boot
for fbdev?

The really active bit seems to be replacing the fbdev stuff with
drm_client_setup_with_color_mode

Patches themselves look good.

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

On 2025-02-11 08:17, Thomas Zimmermann wrote:
> ping for a review
> 
> Am 12.12.24 um 18:08 schrieb Thomas Zimmermann:
>> i915 and xe are the last remaining drivers that still implement their
>> own fbdev client. All other clients have been mass converted to DRM's
>> client setup in in the series at [1]. As Intel drivers require more
>> effort than others, their changes have been moved into this separate
>> series.
>>
>> With DRM's client setup, DRM picks the in-kernel client from the
>> kernel's config and parameters. Besides fbdev there's also drm_log
>> available. For fbdev support, the driver only has to implement struct
>> drm_driver.fbdev_probe, a callback that allocates a compatible
>> framebuffer.
>>
>> At first, some details of the Intel implementation have to be rebuild
>> for the generic client and fbdev handling. Patches 1 to 6 do that.
>> Hotplugging and suspend/resume are then hidden behind callbacks. Some
>> Intel-specifics in the restore and suspend code get their own hooks.
>>
>> Patches 7 to 9 prepare Intel's fbdev implementation ot get things
>> out of the way.
>>
>> Patch 10 converts i915 and xe to DRM's client setup. Patches 11 and
>> 12 clean up the remaining code.
>>
>> Tested with i915 and xe hardware.
>>
>> [1] https://patchwork.freedesktop.org/series/137391/
>>
>> Thomas Zimmermann (12):
>>    drm/{i915,xe}: Suspend/resume fbdev emulation via client interfaces
>>    drm/client: Add client-hotplug helper
>>    drm/client: Send pending hotplug events after resume
>>    drm/i915/display: Remove fbdev suspend and hotplug tracking
>>    drm/i915/display: fbdev: Move custom restore code to new callback
>>    drm/i915/display: fbdev: Move custom suspend code to new callback
>>    drm/i915/display: Remove preferred_bpp from struct intel_fbdev
>>    drm/i915/display: Remove struct drm_fb_helper from struct intel_fbdev
>>    drm/i915/display: Move fbdev code around
>>    drm/{i915,xe}: Run DRM default client setup
>>    drm/i915/display: Remove compile guard around fbdev debugfs output
>>    drm/fb-helper: Remove struct drm_fb_helper.fb_probe
>>
>>   drivers/gpu/drm/drm_client_event.c            |  41 ++-
>>   drivers/gpu/drm/drm_fb_helper.c               |  20 +-
>>   .../gpu/drm/i915/display/intel_display_core.h |   1 -
>>   .../drm/i915/display/intel_display_debugfs.c  |   2 -
>>   drivers/gpu/drm/i915/display/intel_fbdev.c    | 338 ++++--------------
>>   drivers/gpu/drm/i915/display/intel_fbdev.h    |  17 +-
>>   drivers/gpu/drm/i915/i915_driver.c            |  10 +-
>>   drivers/gpu/drm/xe/display/xe_display.c       |  12 +-
>>   include/drm/drm_client.h                      |   8 +
>>   include/drm/drm_fb_helper.h                   |  44 ++-
>>   10 files changed, 176 insertions(+), 317 deletions(-)
>>
>>
>> base-commit: 7bbcd7df9387f0d9004f997df33f7a9472d9c080
> 

