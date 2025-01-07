Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45421A044F7
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 16:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093B810E70F;
	Tue,  7 Jan 2025 15:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jYFO584k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0BE10E710;
 Tue,  7 Jan 2025 15:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736264559; x=1767800559;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fA7CMA11Qw4DTDub+jfMpSojxEdXHZaLNnYyCHIeSfo=;
 b=jYFO584kmL9p5M/UC0lmAUrt9is8MXcJr06imNqyAA58Nz4L9OIQ2W+d
 s/WmWsrIUnhSGC34mTauN5go/2+GLy2oRkPNmDwaiSjIS2mQys+lzxINN
 dHpPNRr9akYnbmf5Nxw00MS24phQDK4dNJ+1evmetLrlVdRHNNPI7Cm/S
 FMWkqY8To9J3JJViw8QEacz63bPL4bkB19dmUjycLDwHW5ZteQ6kTH3Ay
 MZf3kCMBCImIWj7NUbzH1oTb+2D2I3kyQTF5i+0dXdQU5JhAWh+vTssQm
 ArvqhBwVdroC4oGrkjtF8g0rxY8pOH18NlO4euUCHxSb4z5Yi5jCFESD3 Q==;
X-CSE-ConnectionGUID: zMmcGvvCSTm6FxEnkWsuWg==
X-CSE-MsgGUID: BxXVrXhPRia6xJEfqJEQNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="46950251"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="46950251"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 07:42:39 -0800
X-CSE-ConnectionGUID: aXFzjChES+GakfutdCUdNg==
X-CSE-MsgGUID: IbXgNmH5TSyXLFRDCnu3tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="102867507"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 07:42:36 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V6 0/1] Add mmap support for pci membarrier
Date: Tue,  7 Jan 2025 21:17:49 +0530
Message-Id: <20250107154750.2942358-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
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

Test-with: 20250107140023.2940684-1-tejas.upadhyay@intel.com

Tejas Upadhyay (1):
  drm/xe/mmap: Add mmap support for PCI memory barrier

 drivers/gpu/drm/xe/xe_bo.c     |  16 ++++-
 drivers/gpu/drm/xe/xe_bo.h     |   2 +
 drivers/gpu/drm/xe/xe_device.c | 103 ++++++++++++++++++++++++++++++++-
 include/uapi/drm/xe_drm.h      |  29 +++++++++-
 4 files changed, 147 insertions(+), 3 deletions(-)

-- 
2.34.1

