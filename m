Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3975BAFB5
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 16:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C6110ED56;
	Fri, 16 Sep 2022 14:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941EE10E48A;
 Fri, 16 Sep 2022 14:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663340302; x=1694876302;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3X5w6VQZEL51pZ3c6c5qhhCWAI2OuqWGhfa1I4/008s=;
 b=nqBoPyhESiwZgEzMIHQtDUOJOWhb2OhqazlBYQH+Q6Y9fili9ipt0CgF
 /hVqaHKjRaJAfJTYPieyjAWEV0UH0rnYmFcHZDwEtzMvaaMWfcBRCF3CZ
 rYhFA1iJz0RhfJ3EECCpOvzSSV9bzO65RD2cY8gom8ZWznpSX3R5Bfabn
 /uwMa3SaYvyDQqHxqusEkRmk01zK1m5i2yky7o1gDfXyilMIxW7aa8k+D
 6QXkMMXKr9CiqHVIuBpk9s/9brhFk9AuMpOexMxi2FtOMRR3Wi5YDVFCd
 MbRO7qPxYbp2FihHWecKtUALEclG9uCgOe97h7djnQeAg4NiQrxyaKCMp A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="360747582"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="360747582"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 07:58:21 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="862761550"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 07:58:19 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/7] drm/i915: Add HWMON support 
Date: Fri, 16 Sep 2022 20:30:47 +0530
Message-Id: <20220916150054.807590-1-badal.nilawar@intel.com>
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
Cc: linux-hwmon@vger.kernel.org, anshuman.gupta@intel.com,
 dri-devel@lists.freedesktop.org, ashutosh.dixit@intel.com, jon.ewins@intel.com,
 riana.tauro@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds the HWMON support for DGFX

Test-with: 20220914140721.3500129-1-riana.tauro@intel.com

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
 drivers/gpu/drm/i915/i915_hwmon.c             | 761 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_hwmon.h             |  21 +
 drivers/gpu/drm/i915/i915_reg.h               |  14 +
 drivers/gpu/drm/i915/intel_mchbar_regs.h      |  12 +
 9 files changed, 901 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.c
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.h

-- 
2.25.1

