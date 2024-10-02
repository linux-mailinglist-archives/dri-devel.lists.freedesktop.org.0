Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 658F698D018
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 11:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F1010E1F6;
	Wed,  2 Oct 2024 09:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/jfdI26";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B3610E1F6
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 09:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727861219; x=1759397219;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=x2Lea59cyav6s4rmBPsAfXbrLXjdvVugkrjeXsbGoM0=;
 b=M/jfdI266yA4sL4Ta4ATC11UoctgXRoMlUqd2mjQvjORzptKVrDK1RMR
 +OrqQiAAdVwxnbrjlQ9NNCb89LzyTyr+TpfHWuVmtdyqgZo5yhwLLxzbi
 EIxjbvyX/08fiBiXeO1gGP8f7CQ9w+qXSviqPEmDNkctJcpeVcYSp5TLq
 3jCbvzu1ZmB0t+1r8NRZ63mfICgTtGbays7nLbwV4ZkzmU3OpaH8uhw+H
 rAE8UKia+qUr4IZEGh1/fo5yZRdHYJTjVGjNth+5EUbR0bp7/9WpkCwV4
 1NPYe7GmXwjty/fTTZjUquHoKuqT7+5wBQ33jflydTo5zocBrN2UACdks A==;
X-CSE-ConnectionGUID: jOA9K9pMRBSM1/yzk5qiuQ==
X-CSE-MsgGUID: EZ6wCQv6RFy+QvXzyoxUAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27111936"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="27111936"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 02:26:58 -0700
X-CSE-ConnectionGUID: pQ2E3cIVQYGGnj+wNhQSJA==
X-CSE-MsgGUID: XK7Z7LLWTPWKx/kgKAUymw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="104744897"
Received: from lbogdanm-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.49])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 02:26:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, =?utf-8?Q?Adri=C3=A1n?=
 Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v8 0/5] Support fdinfo runtime and memory stats on Panthor
In-Reply-To: <20241002105715.18ec024c@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240923230912.2207320-1-adrian.larumbe@collabora.com>
 <20241002105715.18ec024c@collabora.com>
Date: Wed, 02 Oct 2024 12:26:49 +0300
Message-ID: <877caqvorq.fsf@intel.com>
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

On Wed, 02 Oct 2024, Boris Brezillon <boris.brezillon@collabora.com> wrote:
> Queued to drm-misc-next after applying the few modifications I
> mentioned. Also added Steve's ack (given on IRC) on the first patch.

Can we have the drm-tip rebuild conflict resolution too, please?

diff --cc drivers/gpu/drm/panthor/panthor_drv.c
index c520f156e2d7,f9b93f84d611..000000000000
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@@ -1383,7 -1476,7 +1476,11 @@@ static const struct file_operations pan
        .read = drm_read,
        .llseek = noop_llseek,
        .mmap = panthor_mmap,
++<<<<<<< HEAD
 +      .fop_flags = FOP_UNSIGNED_OFFSET,
++=======
+       .show_fdinfo = drm_show_fdinfo,
++>>>>>>> drm-misc/drm-misc-next
  };
  
  #ifdef CONFIG_DEBUG_FS



>
>> 
>>  .../testing/sysfs-driver-panthor-profiling    |  10 +
>>  Documentation/gpu/panthor.rst                 |  46 +++
>>  drivers/gpu/drm/panthor/panthor_devfreq.c     |  18 +-
>>  drivers/gpu/drm/panthor/panthor_device.h      |  36 ++
>>  drivers/gpu/drm/panthor/panthor_drv.c         |  73 ++++
>>  drivers/gpu/drm/panthor/panthor_gem.c         |  12 +
>>  drivers/gpu/drm/panthor/panthor_sched.c       | 384 +++++++++++++++---
>>  drivers/gpu/drm/panthor/panthor_sched.h       |   2 +
>>  8 files changed, 531 insertions(+), 50 deletions(-)
>>  create mode 100644 Documentation/ABI/testing/sysfs-driver-panthor-profiling
>>  create mode 100644 Documentation/gpu/panthor.rst
>> 
>

-- 
Jani Nikula, Intel
