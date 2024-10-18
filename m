Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFA79A4899
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 22:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F66510E994;
	Fri, 18 Oct 2024 20:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dnrHSf9O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E134E10E081;
 Fri, 18 Oct 2024 20:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729284922; x=1760820922;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xsb+MlbefWkfErGw4ehMlHRMWMXvWlWWT5Gi7TPgva0=;
 b=dnrHSf9OjBzIpYCv5dHgYKdch5t8nQFpAG5BaJ7xIVUOfhom1bhP3FUI
 ct96dUVomfJpRnZVPbF9+d29ziguvoiLSebOP0CNqq82Cebrilb5rtvFZ
 n5ugzQxPz/QSd3WHAKZEAClEdxtX+aj1LnZ74qmre+1+SLPu8KzpcChJw
 kjoItK7+XU9oNQv78E6Yu6kokrAspbAVSHe9ICkrkODQjmFZ600bnM1Ed
 YcaKRDRXEQtRwcDRtJeyF9b70+frZH9zexbWig9KBZfeBu6bc8+hNONJl
 yDN75+dGO4v2QLeGCE3UbeD804DfaNbKNbB5/RaBTdrCysQgnKSw85Tfg Q==;
X-CSE-ConnectionGUID: 8JXhfXD1SzeKqfa3JhTXog==
X-CSE-MsgGUID: BJraxtNMSnGnGUzLyQ/wEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28937232"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28937232"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 13:55:22 -0700
X-CSE-ConnectionGUID: yDrGyNKlSFqwN6i2aueNxg==
X-CSE-MsgGUID: eakAKJrTTY6FAzazjAPSnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="78628372"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa007.fm.intel.com with ESMTP; 18 Oct 2024 13:55:22 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v1 0/1] FOR-CI: drm/i915/guc: Disable ct during GuC reset
Date: Fri, 18 Oct 2024 13:55:18 -0700
Message-Id: <20241018205519.86326-1-zhanjun.dong@intel.com>
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

During GuC reset prepare, interrupt disabled before hardware reset.
Add disable ct to prevent unnecessary message processing.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

Zhanjun Dong (1):
  drm/i915/guc: Disable ct during GuC reset

 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c         | 3 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 ++
 2 files changed, 5 insertions(+)

-- 
2.34.1

