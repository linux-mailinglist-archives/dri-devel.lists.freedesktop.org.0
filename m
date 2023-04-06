Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0904C6D8E79
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 06:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D9A10E23E;
	Thu,  6 Apr 2023 04:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A40B10E23E;
 Thu,  6 Apr 2023 04:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680756328; x=1712292328;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HZ/Unz1ljLHFrubdxmaXRmDGzZn4ykz8y1yovhYxWPU=;
 b=izdC6D5yIJDg7XdvGwBfbsO+hzAWp0mFv/BHV8RPSrnoHBlGTdl0ZDrQ
 +HRsrx8ZKG7RxH8DcscN2LvZoOFYK2NJEAN4hbB0Ys7HPcXaZdq14r4Ut
 BaDE7xN+8pPYrMvYpB8L02KwYlcazXzVsp77Vl8ud0fobFHXUDLHeASS1
 15/JSDcj2DSoX3j/7UCwNgeu6djFFVusw7321im9PE4gwj03X7vlottvA
 9qHR9zI0RG5WxzINhHPChxje/xhHaTv1Gq7w0T12kLhyySxazx9BjsDm9
 OAZR6QN3dq7WZIeOtkEnAoWFHLtDxuGllIS4FYuvsu8jUsQ1kwRrjGNGY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="345231903"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="345231903"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 21:45:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="830612079"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="830612079"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 21:45:26 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 0/3] drm/i915/guc: Disable PL1 power limit when loading GuC
 firmware
Date: Wed,  5 Apr 2023 21:45:19 -0700
Message-Id: <20230406044522.3108359-1-ashutosh.dixit@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Split the v3 patch into 3 patches for easier review, can squash later if needed.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>

Ashutosh Dixit (3):
  drm/i915/hwmon: Get mutex and rpm ref just once in hwm_power_max_write
  drm/i915/guc: Disable PL1 power limit when loading GuC firmware
  drm/i915/hwmon: Block waiting for GuC reset to complete

 drivers/gpu/drm/i915/gt/uc/intel_uc.c |  9 ++++
 drivers/gpu/drm/i915/i915_hwmon.c     | 75 ++++++++++++++++++++++-----
 drivers/gpu/drm/i915/i915_hwmon.h     |  7 +++
 3 files changed, 78 insertions(+), 13 deletions(-)

-- 
2.38.0

