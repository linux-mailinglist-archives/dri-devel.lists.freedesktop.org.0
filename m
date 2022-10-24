Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C2460A665
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 14:35:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB66B10E517;
	Mon, 24 Oct 2022 12:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD5410E50E;
 Mon, 24 Oct 2022 12:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666614881; x=1698150881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dJxW3nUHrZchJW+JTsPiZdfGw+qcOp753dPWcmuEAlU=;
 b=RfIPZUpvA34nGhZaBL9B1SLXTeZtpioNf2Sjm+g2rebjR7n9/UZHE/Jt
 Ks3vomvCfR6OXxkOQYQCbDiXeU3qbkYG1bCLd1JpYuPZHq5LujjhJ80+B
 Evyq1WCRY7w6Wn++Bt6ZX10ATMbJZWgOxLxs6yyxQHB/DcONPzz4gc/AG
 MtnAtqYMqPnnqSYFUeePTNMlf7XaTE/xfteb0UtxvU+7ADQriqfPtynyr
 xebspDqToDenGtZRWr1fOOY6BzDQBTfbSrQAyR+Ni8+NjtLi8goLSEhyp
 4F3J4LAjVgSAshPAO5P/+D5g/oTTTH83nOCgqo4FwSlqyqp8IVH42J650 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="309091509"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="309091509"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:34:40 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="626055735"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="626055735"
Received: from emontau-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.221])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:34:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 11/16] drm/edid/firmware: rename drm_load_edid_firmware()
 to drm_edid_load_firmware()
Date: Mon, 24 Oct 2022 15:33:39 +0300
Message-Id: <d6714ae737d789764bd2bdb6e7c9a5f56c99eef3.1666614699.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666614699.git.jani.nikula@intel.com>
References: <cover.1666614699.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Follow the usual naming convention by file name.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c      | 10 +++++-----
 drivers/gpu/drm/drm_edid_load.c |  2 +-
 include/drm/drm_edid.h          |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index b8d07e4d6215..5e5e1463e45f 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2215,7 +2215,7 @@ static struct edid *drm_get_override_edid(struct drm_connector *connector,
 	mutex_unlock(&connector->edid_override_mutex);
 
 	if (!override)
-		override = drm_load_edid_firmware(connector);
+		override = drm_edid_load_firmware(connector);
 
 	/* FIXME: Get alloc size from deeper down the stack */
 	if (!IS_ERR_OR_NULL(override) && alloc_size)
@@ -2462,7 +2462,7 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
  * adapter and use drm_get_edid() instead of abusing this function.
  *
  * The EDID may be overridden using debugfs override_edid or firmware EDID
- * (drm_load_edid_firmware() and drm.edid_firmware parameter), in this priority
+ * (drm_edid_load_firmware() and drm.edid_firmware parameter), in this priority
  * order. Having either of them bypasses actual EDID reads.
  *
  * Return: Pointer to valid EDID or NULL if we couldn't find any.
@@ -2640,7 +2640,7 @@ EXPORT_SYMBOL(drm_get_edid);
  * this function.
  *
  * The EDID may be overridden using debugfs override_edid or firmware EDID
- * (drm_load_edid_firmware() and drm.edid_firmware parameter), in this priority
+ * (drm_edid_load_firmware() and drm.edid_firmware parameter), in this priority
  * order. Having either of them bypasses actual EDID reads.
  *
  * The returned pointer must be freed using drm_edid_free().
@@ -2678,7 +2678,7 @@ EXPORT_SYMBOL(drm_edid_read_custom);
  * Read EDID using the given I2C adapter.
  *
  * The EDID may be overridden using debugfs override_edid or firmware EDID
- * (drm_load_edid_firmware() and drm.edid_firmware parameter), in this priority
+ * (drm_edid_load_firmware() and drm.edid_firmware parameter), in this priority
  * order. Having either of them bypasses actual EDID reads.
  *
  * Prefer initializing connector->ddc with drm_connector_init_with_ddc() and
@@ -2714,7 +2714,7 @@ EXPORT_SYMBOL(drm_edid_read_ddc);
  * Read EDID using the connector's I2C adapter.
  *
  * The EDID may be overridden using debugfs override_edid or firmware EDID
- * (drm_load_edid_firmware() and drm.edid_firmware parameter), in this priority
+ * (drm_edid_load_firmware() and drm.edid_firmware parameter), in this priority
  * order. Having either of them bypasses actual EDID reads.
  *
  * The returned pointer must be freed using drm_edid_free().
diff --git a/drivers/gpu/drm/drm_edid_load.c b/drivers/gpu/drm/drm_edid_load.c
index 13cdbfb991eb..bc6b96abd1b3 100644
--- a/drivers/gpu/drm/drm_edid_load.c
+++ b/drivers/gpu/drm/drm_edid_load.c
@@ -262,7 +262,7 @@ static void *edid_load(struct drm_connector *connector, const char *name)
 	return edid;
 }
 
-struct edid *drm_load_edid_firmware(struct drm_connector *connector)
+struct edid *drm_edid_load_firmware(struct drm_connector *connector)
 {
 	char *edidname, *last, *colon, *fwstr, *edidstr, *fallback = NULL;
 	struct edid *edid;
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index a2e25e7e6ee5..dc7467d25cd8 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -388,12 +388,12 @@ int drm_av_sync_delay(struct drm_connector *connector,
 		      const struct drm_display_mode *mode);
 
 #ifdef CONFIG_DRM_LOAD_EDID_FIRMWARE
-struct edid *drm_load_edid_firmware(struct drm_connector *connector);
+struct edid *drm_edid_load_firmware(struct drm_connector *connector);
 int __drm_set_edid_firmware_path(const char *path);
 int __drm_get_edid_firmware_path(char *buf, size_t bufsize);
 #else
 static inline struct edid *
-drm_load_edid_firmware(struct drm_connector *connector)
+drm_edid_load_firmware(struct drm_connector *connector)
 {
 	return ERR_PTR(-ENOENT);
 }
-- 
2.34.1

