Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDEA39A661
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 18:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDEC6F4DE;
	Thu,  3 Jun 2021 16:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962546F4D4;
 Thu,  3 Jun 2021 16:55:06 +0000 (UTC)
IronPort-SDR: g1JKnO2ES7VSRIku8u6T3chkamY/gqm5+2bXJMCqjv5mrlQ7ps5Vunlx/tW+d2NEtP3CpZ77Nm
 5m4kx6hEugMw==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="184464199"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="184464199"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 09:54:52 -0700
IronPort-SDR: GqLJE2HEhU9Ojt7kUHmlUM+om8xvoQChVN4+FY43oBqMinWI275/mMPQVdWBkul5Qo+3j3MERq
 riYxCTmuFGHQ==
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="400643687"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 09:54:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 7/7] drm/i915/display: replace IS_GEN() in commented code
Date: Thu,  3 Jun 2021 09:54:28 -0700
Message-Id: <20210603165428.3625495-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603165428.3625495-1-lucas.demarchi@intel.com>
References: <20210603165428.3625495-1-lucas.demarchi@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we are replacing IS_GEN() with GRAPHICS_VER(), make sure we take
care of the comments as well.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/display/intel_tv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
index ce73ebdfc669..aa52af7891f0 100644
--- a/drivers/gpu/drm/i915/display/intel_tv.c
+++ b/drivers/gpu/drm/i915/display/intel_tv.c
@@ -1307,7 +1307,7 @@ intel_tv_compute_config(struct intel_encoder *encoder,
 	 * the active portion. Hence following this formula seems
 	 * more trouble that it's worth.
 	 *
-	 * if (IS_GEN(dev_priv, 4)) {
+	 * if (GRAPHICS_VER(dev_priv) == 4) {
 	 *	num = cdclk * (tv_mode->oversample >> !tv_mode->progressive);
 	 *	den = tv_mode->clock;
 	 * } else {
-- 
2.31.1

