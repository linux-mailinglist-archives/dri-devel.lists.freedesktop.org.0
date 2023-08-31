Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E524578EB17
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 12:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBEE10E5EE;
	Thu, 31 Aug 2023 10:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0201E10E5EE;
 Thu, 31 Aug 2023 10:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693479114; x=1725015114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bK0hR2Wo68cckQ3fMMpTh2HEN/1JnSMIe4uhIwiTfAI=;
 b=R8RUIa7u/GEvmyuBcbCsfX9QRf0+dBLkXnurMCwVQJVgWcqQlAIkDlbG
 zWVK7hPFngTzLzZJE0kSYg2cHsbUZYLWRK9ZIdzCdjmg7cz1LF9rtt6BR
 35QTg/47EEtv+kMB0itabHf2P1A8Sxth3zxnNeGlo6vjCS7hw5IZWo61w
 uNobvTZf0AkvaTs2629rzWMlY881AA5ABX5UFnS2QUBc+i9gEMHFDjot4
 /4E6zySEE8QSAq0s4Xjfb5pq+CrPc4DvqVkTwAxxngSVR9kxaAeb0wRsR
 nKwfDoa7jrwikfUSGBVgumv2rovBnlWjr71qFqKV4iprBjJEM4QK+FLnR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="442262235"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="442262235"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 03:51:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="774497149"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="774497149"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 03:51:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] media: cec: core: add note about *_from_edid() function
 usage in drm
Date: Thu, 31 Aug 2023 13:51:44 +0300
Message-Id: <20230831105144.25923-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <7cebfea8f999d2d0d49533f9849d109830c5d1b6.1692884619.git.jani.nikula@intel.com>
References: <7cebfea8f999d2d0d49533f9849d109830c5d1b6.1692884619.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the drm subsystem, the source physical address is, in most cases,
available without having to parse the EDID again. Add notes about
preferring to use the pre-parsed address instead.

Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

v2: rephrase comments, in particular indicate cec_s_phys_addr() should
be false (Hans)
---
 drivers/media/cec/core/cec-adap.c     | 5 +++++
 drivers/media/cec/core/cec-notifier.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 241b1621b197..1109af525c35 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1688,6 +1688,11 @@ void cec_s_phys_addr(struct cec_adapter *adap, u16 phys_addr, bool block)
 }
 EXPORT_SYMBOL_GPL(cec_s_phys_addr);
 
+/*
+ * Note: In the drm subsystem, prefer calling (if possible):
+ *
+ * cec_s_phys_addr(adap, connector->display_info.source_physical_address, false);
+ */
 void cec_s_phys_addr_from_edid(struct cec_adapter *adap,
 			       const struct edid *edid)
 {
diff --git a/drivers/media/cec/core/cec-notifier.c b/drivers/media/cec/core/cec-notifier.c
index 389dc664b211..d600be0f7b67 100644
--- a/drivers/media/cec/core/cec-notifier.c
+++ b/drivers/media/cec/core/cec-notifier.c
@@ -195,6 +195,11 @@ void cec_notifier_set_phys_addr(struct cec_notifier *n, u16 pa)
 }
 EXPORT_SYMBOL_GPL(cec_notifier_set_phys_addr);
 
+/*
+ * Note: In the drm subsystem, prefer calling (if possible):
+ *
+ * cec_notifier_set_phys_addr(n, connector->display_info.source_physical_address);
+ */
 void cec_notifier_set_phys_addr_from_edid(struct cec_notifier *n,
 					  const struct edid *edid)
 {
-- 
2.39.2

