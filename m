Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D2294A844
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 15:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F62A10E506;
	Wed,  7 Aug 2024 13:05:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="knXEP9ki";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C7210E09B;
 Wed,  7 Aug 2024 13:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723035950; x=1754571950;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kICZsdQb3eRc7HGJcwPMLiqu/hhbweSSHcMuSEwS0jE=;
 b=knXEP9kiqQSpjbw9/V8S+Obsoh9t/VQvomj4+1oSm7sqydRkMEudN5Xk
 p63TpAnnPD+TntunNscFnRJsnFhEEXiCjD5oAX5l2kZZJ7mb03AAMGV9E
 ZwCqZPs2oJBBLb5Xo1Z+P/wm9P1iSQCL1scUHjiXGLVhVrrst5kVzJyRm
 Q+XaSNe1vusmRxZtQd1vZhbsOtCqXSvoD7Nl8FVPcXE+4o1Tify9THvaE
 ZZE2WvV+IahdUn9Cmc6RV3zMmbiDoZfR9Fj5n/YQUcpdbFPJBFP+qKjiO
 yzXNa9QLTkzmq6O9P0/bY54s/+ZlFEf5h5+2xuQBXoa4Akin8TyIZD9Sr Q==;
X-CSE-ConnectionGUID: 8YlnUytJR7qDNIJeUD8Xiw==
X-CSE-MsgGUID: IDTmogECQJqQHPWkD7ERHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="20979948"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="20979948"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 06:05:50 -0700
X-CSE-ConnectionGUID: vxAL6vX9QfqyNI+QeWCdmA==
X-CSE-MsgGUID: +Up38rT5QpmwywSYn1oJIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="61726432"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 intel.com) ([10.245.245.2])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 06:05:46 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH 0/2] Trivial double space style fix
Date: Wed,  7 Aug 2024 14:05:14 +0100
Message-ID: <20240807130516.491053-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
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

Hi,

I was bothered a few times to see the double space in the
parameters list so that I decided to replace once and for all all
the double spaces that are not added on purpose to maintain some
visual alignment in the code.

Checkpatch doesn't have any rules for that because, indeed, this
is used also to put in columns parameters in repetitive function
calls or declarations. Nevertheless, it doesn't mean it's
stylistically correct.

Thanks,
Andi

Andi Shyti (2):
  drm/i915: Replace double blank with single blank after comma in gem/ and gt/
  drm/i915: Replace double blank with single blank after comma

 drivers/gpu/drm/i915/display/i9xx_wm.c               | 2 +-
 drivers/gpu/drm/i915/display/intel_ddi.c             | 2 +-
 drivers/gpu/drm/i915/display/intel_display.c         | 2 +-
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 2 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c         | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h     | 2 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c           | 2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c                | 2 +-
 drivers/gpu/drm/i915/gvt/trace.h                     | 2 +-
 drivers/gpu/drm/i915/i915_driver.c                   | 6 +++---
 drivers/gpu/drm/i915/i915_sysfs.c                    | 4 ++--
 drivers/gpu/drm/i915/selftests/intel_memory_region.c | 2 +-
 12 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.45.2

