Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C14256DCD7F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 00:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D9610E35F;
	Mon, 10 Apr 2023 22:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE1A10E2F2;
 Mon, 10 Apr 2023 22:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681166116; x=1712702116;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JELUMNIzQ+DxbdEwf6/oPDLT9vKcoy8heqXGmh9e+8k=;
 b=J6y1EOo1K+vDTiKUey114bApy3VCJJCdlIqB85uIKYj0ZRmdi7pFciVr
 txGTTymc3aYAL9/IBIPHcffqft9ORxXPO2LNuKjTlMDHc7xbvcD5OyNrT
 aAt2bhNGWxc54tvfF/2pPdSaLbjkjXUbT9Mn4RL7XkgfdvrAtOoU8g/fU
 HMN+1GH0WccPyFXOe9ZGcICmi+ly4Qp/pIDf9Fxey71Eu1EbCRZSAvF9D
 4tTWXGJ7B4GI8z75ZPEX1Bc1KzvNKtF9ORkr2YF6AaJ3D8TotUoM2iO6w
 NWN05ygpoZHgjJAl/Nr6MzHWHa7mxl3ADdUGdqaIORifUaS/EOF9cfs4f g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="342233892"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="342233892"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 15:35:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="777682121"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="777682121"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 15:35:15 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/3] drm/i915/guc: Disable PL1 power limit when loading GuC
 firmware
Date: Mon, 10 Apr 2023 15:35:06 -0700
Message-Id: <20230410223509.3593109-1-ashutosh.dixit@intel.com>
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

Updates to Patch 2/3 and Patch 3/3 in this version.

Ashutosh Dixit (3):
  drm/i915/hwmon: Get mutex and rpm ref just once in hwm_power_max_write
  drm/i915/guc: Disable PL1 power limit when loading GuC firmware
  drm/i915/hwmon: Block waiting for GuC reset to complete

 drivers/gpu/drm/i915/gt/uc/intel_uc.c | 13 +++-
 drivers/gpu/drm/i915/i915_hwmon.c     | 94 +++++++++++++++++++++++----
 drivers/gpu/drm/i915/i915_hwmon.h     |  7 ++
 3 files changed, 100 insertions(+), 14 deletions(-)

-- 
2.38.0

