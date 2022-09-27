Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BE65EB9ED
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 07:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB2010E3D8;
	Tue, 27 Sep 2022 05:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C3D10E359;
 Tue, 27 Sep 2022 05:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664257660; x=1695793660;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OhVp/Gyhr/Zw+SvZJtMCwlmQOVcfxilaqZ2j0NhiYrw=;
 b=XyYmkHDWI3R92BD2ugiHOjXCPMjcCkseUAT/cqCQob6T2zzG1J0I/lwH
 stzcgu7FkJLiBkmHGG68FmqLB5y8teGKcYvWvz456aHcoOAxla8RHRZ2I
 d83yutPHgu2i5sw2QhlSpoZHX8ECfJrYiZ0eHwBVuU/jx7ToCFA/R8dwx
 UxTzuHNDx/OBR1MZF2U/1h/paknkxD0R2aa7p1Fr9/vtYaWPGTZf7XSJu
 JVN1MV9KtNrK7ysE7/c0qAXmpyl14kMfaG5xlKuYYwCgz/45KbngM5mpj
 IyDFOiz2SsEc9ziGNvhjavAWgGKXdaWgZA5zdh2EZlgHiMB6Fqc3YrdLe w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="363066381"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; d="scan'208";a="363066381"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 22:47:39 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="725376796"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; d="scan'208";a="725376796"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 22:47:36 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/7] drm/i915: Add HWMON support 
Date: Tue, 27 Sep 2022 11:20:13 +0530
Message-Id: <20220927055020.3499420-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-hwmon@vger.kernel.org, andi.shyti@intel.com, tvrtko.ursulin@intel.com,
 anshuman.gupta@intel.com, dri-devel@lists.freedesktop.org,
 ashutosh.dixit@intel.com, jon.ewins@intel.com, riana.tauro@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds the HWMON support for DGFX

Test-with: 20220919144408.251981-1-riana.tauro@intel.com

v2:
  - Reorganized series. Created first patch as infrastructure patch
    followed by feature patches. (Ashutosh)
  - Fixed review comments (Jani)
  - Fixed review comments (Ashutosh)

v3:
  - Fixed review comments from Guenter
  - Exposed energy inferface as standard hwmon interface (Ashutosh)
  - For power interface added entries for critical power and maintained
    standard interface for all the entries except 
    power1_max_interval
  - Extended support for XEHPSDV (Ashutosh)

v4:
  - Fixed review comment from Guenter
  - Cleaned up unused code

v5:
  - Fixed review comments (Jani)

v6: 
  - Fixed review comments (Ashutosh)
  - Updated date and kernel version in documentation

v7:
  - Fixed review comments (Anshuman)
  - KernelVersion: 6.2, Date: February 2023 in doc (Tvrtko) 

v8: s/hwmon_device_register_with_info/
      devm_hwmon_device_register_with_info/ (Ashutosh)

Ashutosh Dixit (2):
  drm/i915/hwmon: Expose card reactive critical power
  drm/i915/hwmon: Expose power1_max_interval

Dale B Stimson (4):
  drm/i915/hwmon: Add HWMON infrastructure
  drm/i915/hwmon: Power PL1 limit and TDP setting
  drm/i915/hwmon: Show device level energy usage
  drm/i915/hwmon: Extend power/energy for XEHPSDV

Riana Tauro (1):
  drm/i915/hwmon: Add HWMON current voltage support

 .../ABI/testing/sysfs-driver-intel-i915-hwmon |  75 ++
 drivers/gpu/drm/i915/Makefile                 |   3 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   8 +
 drivers/gpu/drm/i915/i915_driver.c            |   5 +
 drivers/gpu/drm/i915/i915_drv.h               |   2 +
 drivers/gpu/drm/i915/i915_hwmon.c             | 736 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_hwmon.h             |  20 +
 drivers/gpu/drm/i915/i915_reg.h               |   6 +
 drivers/gpu/drm/i915/intel_mchbar_regs.h      |  21 +
 9 files changed, 876 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.c
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.h

-- 
2.25.1

