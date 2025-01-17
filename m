Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD9AA1549F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 17:45:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A290810EB41;
	Fri, 17 Jan 2025 16:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I017qijv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AA110E30A;
 Fri, 17 Jan 2025 16:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737132350; x=1768668350;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BJb8wUQNZPxoztB5IMNL3/I40pQJ5K1tdMGQeju4yIM=;
 b=I017qijvYg28KCXINXhC4qFTVbuggu15Z4NKMJl57cSHyKlN1t/37hcI
 vUxh0t5sDuTDtg0XDhrlt/CnTnej1KiGlt/P4DccHAUbQgSAf8HQUj/JQ
 VSz7RMifV3OLoQV/oeq3fHdEt0LuGBZ/Abif+1HdNoKE+7T4wKLScNuK9
 eYLJPCgizANRcGuyafaFz+QNxc87PWVx/isDHNdQpeLQMO/YecEFYUETu
 jBUkWU6f3a27sNZYCrBe1IJstd1ZVMjQqGy49Tih9GOtZ7ARuN/hwl8K3
 DnWT0RKvndBOR5mXAfN6zMoH3D5EoYe7CtwLrP8NUq6wLGgW1oLL7cCow w==;
X-CSE-ConnectionGUID: XDKAELItRLO6MgZHOSuZIA==
X-CSE-MsgGUID: D0Hao5BBQV6cGkadyzu1Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="41499354"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="41499354"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 08:45:50 -0800
X-CSE-ConnectionGUID: Fv6tx4/CQ7GmlsjMRtZFug==
X-CSE-MsgGUID: FUyZpiP1Rg+2s45cs3IcdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="136684613"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 08:45:50 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] MAINTAINERS: Also exclude xe for drm-misc
Date: Fri, 17 Jan 2025 08:45:29 -0800
Message-ID: <20250117164529.393503-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
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

When the xe driver was added, it didn't extend the exclude entries for
drm-misc, as done in commit 5a44d50f0072 ("MAINTAINERS: Update drm-misc
entry to match all drivers"). Exclude it like is done for i915 and other
drivers with dedicated maintainers.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d32d0a9428234..30d8e47a0e5f3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7606,6 +7606,7 @@ X:	drivers/gpu/drm/nouveau/
 X:	drivers/gpu/drm/radeon/
 X:	drivers/gpu/drm/renesas/rcar-du/
 X:	drivers/gpu/drm/tegra/
+X:	drivers/gpu/drm/xe/
 
 DRM DRIVERS FOR ALLWINNER A10
 M:	Maxime Ripard <mripard@kernel.org>
-- 
2.48.0

