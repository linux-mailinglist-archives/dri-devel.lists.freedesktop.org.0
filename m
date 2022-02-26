Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CBB4C5432
	for <lists+dri-devel@lfdr.de>; Sat, 26 Feb 2022 07:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79ECC10E411;
	Sat, 26 Feb 2022 06:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8B010E1B7;
 Sat, 26 Feb 2022 06:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645856720; x=1677392720;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jjUDJdhZDhgmxsIVgcAx5JSlVHcwTt3L6UcBQ6vzFac=;
 b=kEQg7OhSJlgIeL3MPqnKTl2oXD/CUd+HnC6cHr8gJu1myLqpVJ1hVKeu
 Q0GELc5EhHP8CsOcf+dtZr0ThZLlA1Td1PjlWpMgwFSHoJi055C5+ooVV
 fviaCUnK+jhLXHSRcoeb9Mw47YSA/FEBx3ZEq0oq5HnNb76KTdmC5Kixi
 Lf/ZLaK3joiYw1kiPvOw4v6Rnrse5ooIfWFy73Z2b0wYt96WzV/tY0iwh
 pUrkbmIgw+29XGJFG9mtgGA+i/KstEur8mUR0sB8AklPilb3uzXobNJR+
 q6rDeu6TBI3JR0HpUvQOQ0+Pxt6/KLx48Vfj8PXSlz3cSptqAAatvBEzO g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="233259018"
X-IronPort-AV: E=Sophos;i="5.90,138,1643702400"; d="scan'208";a="233259018"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 22:25:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,138,1643702400"; d="scan'208";a="684864180"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2022 22:25:20 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/1] Fix i915 error_state_read ptr use
Date: Fri, 25 Feb 2022 22:27:31 -0800
Message-Id: <20220226062732.747531-1-alan.previn.teres.alexis@intel.com>
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
Cc: Stuart Summers <stuart.summers@intel.com>, dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix pointer offset usage in error_state_read
when there is no i915_gpu_coredump but buf offset
is non-zero.

This is the 2nd rev of this series.

Changes from prior revs:
  v2: - Fix build issue: uninitialized var
        Reported-by: kernel test robot <lkp@intel.com>

Alan Previn (1):
  drm/i915/reset: Fix error_state_read ptr + offset use

 drivers/gpu/drm/i915/i915_sysfs.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.25.1

