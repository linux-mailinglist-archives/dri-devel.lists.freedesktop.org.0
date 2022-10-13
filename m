Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA025FDD77
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 17:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE2310E8F6;
	Thu, 13 Oct 2022 15:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F49A10E297;
 Thu, 13 Oct 2022 15:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665675989; x=1697211989;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xq2t2MmFZUfrde9u2sznaDBrsOgx6c52zrtyTYrYhEk=;
 b=mWnIRWqqwzLH4nwamlccPfbQ8PnrW6eI8Y8uJpvCODoa9xLgeVtrJvgs
 S3eszu5zc96LVnKi88rYx+HXWiHrhuJ7xroWOxEvWHyWt1FbE6mQ4Srx7
 IxW0qjbxTsCD+Bgiv1QbNwsBnFtdWQod2ZT4SYusr7hsdTZT0T3KVRZ0d
 QB8p0yh9XnnguLCBDNBnR4Xmu+gZ3Hj3vIku93ZmgALCfyZt8RbUtyWlM
 J8kEggyxPTFijTLExqdYtajgoGv/tA4b6LaFSxOIBsIQ91z8Z/IXBIdHB
 vvSiD826qYfA9iF/E0f8qzabGX2zF/42LMW3taseqJk78DUzyxiwe93/y g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="284842742"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; d="scan'208";a="284842742"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2022 08:45:32 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="660381003"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; d="scan'208";a="660381003"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2022 08:45:30 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/7] drm/i915: Add HWMON support
Date: Thu, 13 Oct 2022 08:45:19 -0700
Message-Id: <20221013154526.2105579-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
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
Cc: linux-hwmon@vger.kernel.org, Andi Shyti <andi.shyti@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds the HWMON support for DGFX

Test-with: 20221013151400.2086268-1-ashutosh.dixit@intel.com

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

v9: Addressed review comments from Rodrigo and Andi

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
 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/i915/Makefile                 |   3 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   8 +
 drivers/gpu/drm/i915/i915_driver.c            |   5 +
 drivers/gpu/drm/i915/i915_drv.h               |   2 +
 drivers/gpu/drm/i915/i915_hwmon.c             | 738 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_hwmon.h             |  20 +
 drivers/gpu/drm/i915/i915_reg.h               |   6 +
 drivers/gpu/drm/i915/intel_mchbar_regs.h      |  21 +
 10 files changed, 879 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.c
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.h

-- 
2.38.0

