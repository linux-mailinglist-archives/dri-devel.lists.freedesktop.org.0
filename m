Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783A2A7F3E1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 07:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE0410E5BA;
	Tue,  8 Apr 2025 05:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nK42beCJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075BC10E5BA;
 Tue,  8 Apr 2025 05:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744088495; x=1775624495;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Tvo0DkmWXK5DWGOEcJi2UYP+ujY/ow0zwj9QKB4+Uas=;
 b=nK42beCJTE4DAj5Yv7EOfoIP3UY8Er4HOy/9HLhKiYdTNGfQDi9jy3JL
 aGxputG2ZkuRTIrpilUmCsFqE+jzivf2X61fRT8Gk19j0cb10ED37CvTH
 1Bw6b17WsG0+cYJXweQwHgUIL5JagsWm+ZkabXMIczyrBTTuDNN1zq9sY
 oW3NhDBvVEq5/nlsBam4x2awfDL5EQ8Dx4a5peaie3IorYWNqcpliO3Yv
 hqgYBB6wt4IxGk58l+TCg3jVCuKiegHwNNWdcsJkRIh/TOvnjXu3+n67m
 DbjD1BFt3T+lW8G7wqFts1da769/L1a6MACciW3c/2I8et5dQs+mMYWID A==;
X-CSE-ConnectionGUID: nbD8j8aIRwy47ZvPKhFD4w==
X-CSE-MsgGUID: /Wcwu15XQXm6d5GsFBjuag==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="67975295"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="67975295"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 22:01:33 -0700
X-CSE-ConnectionGUID: vJ+hueNSR3ytQZtNz8hBCg==
X-CSE-MsgGUID: GJOSk3hAR6m60lJS989YHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="133015422"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa003.jf.intel.com with ESMTP; 07 Apr 2025 22:01:31 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 0/2] Register bit definition for EDP_GENERAL_CAP2
Date: Tue,  8 Apr 2025 10:31:36 +0530
Message-Id: <20250408050138.2382452-1-suraj.kandpal@intel.com>
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

Add smooth brightness register bit definition for register
EDP_GENERAL_CAPABILITY 2

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (2):
  drm/dp: Add smooth brightness register bit definition
  drm/i915/backlight: Modify condition to use panel luminance

 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 3 ++-
 include/drm/display/drm_dp.h                          | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.34.1

