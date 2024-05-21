Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 807B88CAD11
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 13:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABB210EB3B;
	Tue, 21 May 2024 11:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lJaKmVOC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B1F10EB3B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 11:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716289645; x=1747825645;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=jmVByl4uVrblaTbfjRIifOvmB2Qzh1GAEzFOLjPHDZg=;
 b=lJaKmVOC4hklc2ognuuOUoE4BjVisYM2K0U66J74+G95T8pRgEO5GA/E
 hp1bOA7lLXJpS+8iZe8hnosf2jaFYH+1yy/KwxctkTUTzjNX0HGjBpALR
 9Rdid1eaaZq7pEjO9nbFRqwZkogkGJqsAso/qjeoqROJw0CHWGhsnmBut
 oLTcDVmfwqYESNVUJAz8qUsZTRIUhYV3xRf4O5N9pNrNJ5+Y0dvU7ij9e
 Y3Lb39VWG6ZPVszQFj9FgB8TYAWe8r0DOZBYBWMh+JO6Lwi853hN4Tye4
 fMEYK2uWwytx+fNVQUVQGqCrO5LMtdj2RAX+aJ9BjsvnlRfNbX3MfQG7P g==;
X-CSE-ConnectionGUID: uYu+Ig0GS1mPJE7EGG/sVw==
X-CSE-MsgGUID: TblGwikbS4iDnz133JugYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23610268"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="23610268"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 04:07:24 -0700
X-CSE-ConnectionGUID: ezTq9jI7Sam2W9BvbrfPlQ==
X-CSE-MsgGUID: Ij47oWqbRMGO/Q0WtX6T2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="32925746"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 04:07:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Iago
 Toral <itoral@igalia.com>, Jose Maria Casanova Crespo
 <jmcasanova@igalia.com>, =?utf-8?Q?Juan_A_=2E_Su=C3=A1rez?=
 <jasuarez@igalia.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v2 0/6] drm/v3d: Improve Performance Counters handling
In-Reply-To: <8702e7f7-0f3f-4ee6-b2f3-e44217dbed36@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240512222655.2792754-1-mcanal@igalia.com>
 <8702e7f7-0f3f-4ee6-b2f3-e44217dbed36@igalia.com>
Date: Tue, 21 May 2024 14:07:18 +0300
Message-ID: <87msojqv89.fsf@intel.com>
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

On Mon, 20 May 2024, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
> On 5/12/24 19:23, Ma=C3=ADra Canal wrote:>
>> Ma=C3=ADra Canal (6):
>>    drm/v3d: Add Performance Counters descriptions for V3D 4.2 and 7.1
>>    drm/v3d: Different V3D versions can have different number of perfcnt
>>    drm/v3d: Create a new V3D parameter for the maximum number of perfcnt
>>    drm/v3d: Create new IOCTL to expose performance counters information
>>    drm/v3d: Use V3D_MAX_COUNTERS instead of V3D_PERFCNT_NUM
>>    drm/v3d: Deprecate the use of the Performance Counters enum >
>>   drivers/gpu/drm/v3d/v3d_drv.c                 |  11 +
>>   drivers/gpu/drm/v3d/v3d_drv.h                 |  14 +-
>>   drivers/gpu/drm/v3d/v3d_perfmon.c             |  36 ++-
>>   .../gpu/drm/v3d/v3d_performance_counters.h    | 208 ++++++++++++++++++
>>   drivers/gpu/drm/v3d/v3d_sched.c               |   2 +-
>>   include/uapi/drm/v3d_drm.h                    |  48 ++++
>>   6 files changed, 316 insertions(+), 3 deletions(-)
>>   create mode 100644 drivers/gpu/drm/v3d/v3d_performance_counters.h
>>=20
>
> Applied to drm-misc/drm-misc-next!

What compiler do you use? I'm hitting the same as kernel test robot [1]
with arm-linux-gnueabihf-gcc 12.2.0.

In general, I don't think it's a great idea to put arrays in headers,
and then include it everywhere via v3d_drv.h. You're not just relying on
the compiler to optimize it away in compilation units where its not
referenced (likely to happen), but also for the linker to deduplicate
rodata (possible, but I'm not sure that it will happen).

I think you need to move the arrays to a .c file, and then either a) add
interfaces to access the arrays, or b) declare the arrays and make them
global. For the latter you also need to figure out how to expose the
size.

BR,
Jani.


[1] https://lore.kernel.org/r/202405211137.hueFkLKG-lkp@intel.com


--=20
Jani Nikula, Intel
