Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA40A6BADF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 13:41:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1EA10E7BF;
	Fri, 21 Mar 2025 12:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ec7ew6+t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F5410E7BC;
 Fri, 21 Mar 2025 12:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742560869; x=1774096869;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Y2846tBuL2mWBVQlc560xA5UiYRZ8PX5caGQUYX3m5o=;
 b=Ec7ew6+tIevrsYQPXqDnjx+zMHZXHqiLEmkUXpqb0KvfwqCdRgUuFIkX
 lUJCiuKCbt0grkxgyzjVHCFppxvffECa2U5Oiy7CruyzEPPo9WLu8L4xu
 JSa8JjyADZiT8f6HXetnssd6Go7pYBN5IRvIaT2dos0V/kyj0JwdDNnQl
 jIwSn8FZJU9psg3sHxpjjcxta1zzxzqv4SVv9hKN/teQtr6vziQESY93x
 ocVCjjdBnXe/2wAc5ZH/A3d6NL7NMfvomMNxKBTDQRsxuo2Rmcoo+FQEb
 +LvfWvRAQEpJx06dtd6Ybja0MHxya11qMgJVWYCrAKGCFCwt7Wjj621Q6 A==;
X-CSE-ConnectionGUID: 1aHRvC9sRsaaGAFR51pZBg==
X-CSE-MsgGUID: gHlbvb50StWyxP9SXYmS5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="31416198"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="31416198"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 05:41:08 -0700
X-CSE-ConnectionGUID: xnWMy0feS82fNJIl+FCjBw==
X-CSE-MsgGUID: OaH24dpNSFmCPYM51NjsrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="128502379"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.201])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 05:41:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Yue Haibing
 <yuehaibing@huawei.com>, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch, dev@lankhorst.se
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] drm/i915/display: Fix build error without
 DRM_FBDEV_EMULATION
In-Reply-To: <12145722-609e-41d0-b02b-059df5b6d17f@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250315120143.2344958-1-yuehaibing@huawei.com>
 <12145722-609e-41d0-b02b-059df5b6d17f@suse.de>
Date: Fri, 21 Mar 2025 14:41:02 +0200
Message-ID: <87y0wyblpd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 17 Mar 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 15.03.25 um 13:01 schrieb Yue Haibing:
>> In file included from <command-line>:
>> ./drivers/gpu/drm/i915/display/intel_fbdev.h: In function =E2=80=98intel=
_fbdev_framebuffer=E2=80=99:
>> ./drivers/gpu/drm/i915/display/intel_fbdev.h:32:16: error: =E2=80=98NULL=
=E2=80=99 undeclared (first use in this function)
>>     32 |         return NULL;
>>        |                ^~~~
>> ./drivers/gpu/drm/i915/display/intel_fbdev.h:1:1: note: =E2=80=98NULL=E2=
=80=99 is defined in header =E2=80=98<stddef.h>=E2=80=99; did you forget to=
 =E2=80=98#include <stddef.h>=E2=80=99?
>>    +++ |+#include <stddef.h>
>>      1 | /* SPDX-License-Identifier: MIT */
>> ./drivers/gpu/drm/i915/display/intel_fbdev.h:32:16: note: each undeclare=
d identifier is reported only once for each function it appears in
>>     32 |         return NULL;
>>        |                ^~~~
>>
>> Build fails if CONFIG_DRM_FBDEV_EMULATION is n, add missing header file.
>>
>> Fixes: 9fa154f40eb6 ("drm/{i915,xe}: Run DRM default client setup")
>> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Merged to drm-intel-next, thanks for the patch and ack.

BR,
Jani.

>
>> ---
>>   drivers/gpu/drm/i915/display/intel_fbdev.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.h b/drivers/gpu/dr=
m/i915/display/intel_fbdev.h
>> index ca2c8c438f02..89bad3a2b01a 100644
>> --- a/drivers/gpu/drm/i915/display/intel_fbdev.h
>> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.h
>> @@ -6,6 +6,8 @@
>>   #ifndef __INTEL_FBDEV_H__
>>   #define __INTEL_FBDEV_H__
>>=20=20=20
>> +#include <linux/types.h>
>> +
>>   struct drm_fb_helper;
>>   struct drm_fb_helper_surface_size;
>>   struct drm_i915_private;

--=20
Jani Nikula, Intel
