Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 239715FB777
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 17:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D344E10E81E;
	Tue, 11 Oct 2022 15:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBF310E81E;
 Tue, 11 Oct 2022 15:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665502781; x=1697038781;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qugFPqyrKp2dvC4lex1KAYAs4NlXmCknPxIeyZaAxoc=;
 b=CrEIE4N6C2SiibaChD7OkaerbYyUVODAmXgSaljD0gLPVqdIVhBHc+2n
 FnkLN+l/nhyCPec2JExlelz7TnOPfuylRfyP1wJAAvW2wykw18Z7mkBLz
 1v3ak7TYUqU3mI6yHtwjtmvSqKlKbJ4XAx3biKfEzp96NYYhJqHK62Ibt
 ryDOb+8XHcjifZ5ztsrGY4TkzLwd1mck8gsHQG9FVq10isiAiNbE66pI+
 Wrh5BHBXhgk408PIlDRL8hgkgIJdFZ4QvDh+NZqVSZbdVzh6cZjX5ALJb
 GmSK6JhNCYs8IXVZzpYSKuf0Adb7bPLXVeLLdkDfNMqnsGEhF6iCmQ5FU w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="305591630"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="305591630"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 08:39:26 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="768839274"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="768839274"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 08:39:26 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/i915: Add intel_ prefix to struct ip_version
Date: Tue, 11 Oct 2022 08:38:50 -0700
Message-Id: <20221011153851.3781507-1-radhakrishna.sripada@intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename struct ip_version to intel_ip_version to comply with the
naming conventions for structures.

Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/intel_device_info.c | 2 +-
 drivers/gpu/drm/i915/intel_device_info.h | 8 ++++----
 drivers/gpu/drm/i915/intel_step.c        | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index 090097bb3c0a..37267c662dc6 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -289,7 +289,7 @@ static void intel_device_info_subplatform_init(struct drm_i915_private *i915)
 	RUNTIME_INFO(i915)->platform_mask[pi] |= mask;
 }
 
-static void ip_ver_read(struct drm_i915_private *i915, u32 offset, struct ip_version *ip)
+static void ip_ver_read(struct drm_i915_private *i915, u32 offset, struct intel_ip_version *ip)
 {
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	void __iomem *addr;
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index bc87d3156b14..0a37c0a3edc5 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -196,7 +196,7 @@ enum intel_ppgtt_type {
 	func(overlay_needs_physical); \
 	func(supports_tv);
 
-struct ip_version {
+struct intel_ip_version {
 	u8 ver;
 	u8 rel;
 	u8 step;
@@ -208,13 +208,13 @@ struct intel_runtime_info {
 	 * render, compute and copy behavior.
 	 */
 	struct {
-		struct ip_version ip;
+		struct intel_ip_version ip;
 	} graphics;
 	struct {
-		struct ip_version ip;
+		struct intel_ip_version ip;
 	} media;
 	struct {
-		struct ip_version ip;
+		struct intel_ip_version ip;
 	} display;
 
 	/*
diff --git a/drivers/gpu/drm/i915/intel_step.c b/drivers/gpu/drm/i915/intel_step.c
index 91e7c51991b0..75d7a86c60c0 100644
--- a/drivers/gpu/drm/i915/intel_step.c
+++ b/drivers/gpu/drm/i915/intel_step.c
@@ -136,7 +136,7 @@ static const struct intel_step_info adlp_n_revids[] = {
 };
 
 static u8 gmd_to_intel_step(struct drm_i915_private *i915,
-			    struct ip_version *gmd)
+			    struct intel_ip_version *gmd)
 {
 	u8 step = gmd->step + STEP_A0;
 
-- 
2.34.1

