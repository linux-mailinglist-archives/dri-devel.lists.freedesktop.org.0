Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 548653970ED
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 12:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915E56E9CF;
	Tue,  1 Jun 2021 10:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31BE6E9DA;
 Tue,  1 Jun 2021 10:06:02 +0000 (UTC)
IronPort-SDR: LFg9r9PuQwLOda7IX8iCrNt5biS2BqYO1w2ApEx/sMz7MkKdADiFSu9ckkTS+C61ZUnvjb7nIO
 SI6Lsi7aUFcQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="183197772"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="183197772"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:05:59 -0700
IronPort-SDR: QJ1haKtiQalouPhG+W+lP8CtlmCWrlJg90tGqRukGqQfRDxGqS37CWtgxyDENCBe8U0Ab55dIN
 zQr/PLuVAcVw==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="399245266"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:05:57 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 8/9] drm/i915/xelpd: Add Pipe Color Lut caps to platform config
Date: Tue,  1 Jun 2021 16:11:34 +0530
Message-Id: <20210601104135.29020-9-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601104135.29020-1-uma.shankar@intel.com>
References: <20210601104135.29020-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>, bhanuprakash.modem@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

XE_LPD has 128 Lut entries for Degamma, with additional 3 entries for
extended range. It has 511 entries for gamma with additional 2 entries
for extended range.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 97c98f4fb265..844d08e37ec5 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -947,7 +947,8 @@ static const struct intel_device_info adl_s_info = {
 	.cpu_transcoder_mask = BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |	\
 		BIT(TRANSCODER_C) | BIT(TRANSCODER_D),			\
 	.dbuf.size = 4096,						\
-	.dbuf.slice_mask = BIT(DBUF_S1) | BIT(DBUF_S2) | BIT(DBUF_S3) | BIT(DBUF_S4)
+	.dbuf.slice_mask = BIT(DBUF_S1) | BIT(DBUF_S2) | BIT(DBUF_S3) | BIT(DBUF_S4), \
+	.color = { .degamma_lut_size = 128, .gamma_lut_size = 513 }
 
 static const struct intel_device_info adl_p_info = {
 	GEN12_FEATURES,
-- 
2.26.2

