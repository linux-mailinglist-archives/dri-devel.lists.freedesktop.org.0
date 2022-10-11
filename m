Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F605FB3D2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 15:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99DB10E816;
	Tue, 11 Oct 2022 13:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FBB10E80F;
 Tue, 11 Oct 2022 13:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665496249; x=1697032249;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Am4j+GvFXLxifRz4sMf1taSKtRVa/iXJrtRRE92Dn0o=;
 b=XlY4y5D/m2cS/PYnv46k7e7jhvPMcvo2upnjd34fY7CHbyjwmxUIlJEG
 2rsXnd5h0WdsQetf7PraPT+66VSeX/v2K/4gUzZdlhdhwh6Po3qux/sNk
 L8k+2tpgh/4Q+hTDWXgdAPEKmYcOTPjDWQ2cByR1spxG3Me/JO974MGyd
 I8Y9AJXkZqpnt+EoEfGM4OkVDeCnV6E19ODx5enBAGEpavYbnDRP+6Qk7
 5lG4YFJUDWPQzO8XYPM/a2lz5p05Yo4EnTeZZCO82r3zDTPHnzrsm8ws1
 ywwk516j4hSvItX6DH4wGteh8xwRt4wwT0kcPo4JOhbImTHoL0TJpj+3y Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="303244833"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="303244833"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:50:48 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="604150598"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="604150598"
Received: from milawils-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:50:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/15] drm/edid/firmware: rename drm_load_edid_firmware() to
 drm_edid_load_firmware()
Date: Tue, 11 Oct 2022 16:49:45 +0300
Message-Id: <91b8b40b2ef4da1d7d1c30adad6eaed611551a3b.1665496046.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1665496046.git.jani.nikula@intel.com>
References: <cover.1665496046.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Follow the usual naming convention by file name.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c      | 10 +++++-----
 drivers/gpu/drm/drm_edid_load.c |  2 +-
 include/drm/drm_edid.h          |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 0f2898badd51..2c66a901474d 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2211,7 +2211,7 @@ static struct edid *drm_get_override_edid(struct drm_connector *connector,
 		override = drm_edid_duplicate(connector->edid_override->edid);
 
 	if (!override)
-		override = drm_load_edid_firmware(connector);
+		override = drm_edid_load_firmware(connector);
 
 	/* FIXME: Get alloc size from deeper down the stack */
 	if (!IS_ERR_OR_NULL(override) && alloc_size)
@@ -2443,7 +2443,7 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
  * adapter and use drm_get_edid() instead of abusing this function.
  *
  * The EDID may be overridden using debugfs override_edid or firmware EDID
- * (drm_load_edid_firmware() and drm.edid_firmware parameter), in this priority
+ * (drm_edid_load_firmware() and drm.edid_firmware parameter), in this priority
  * order. Having either of them bypasses actual EDID reads.
  *
  * Return: Pointer to valid EDID or NULL if we couldn't find any.
@@ -2621,7 +2621,7 @@ EXPORT_SYMBOL(drm_get_edid);
  * this function.
  *
  * The EDID may be overridden using debugfs override_edid or firmware EDID
- * (drm_load_edid_firmware() and drm.edid_firmware parameter), in this priority
+ * (drm_edid_load_firmware() and drm.edid_firmware parameter), in this priority
  * order. Having either of them bypasses actual EDID reads.
  *
  * The returned pointer must be freed using drm_edid_free().
@@ -2659,7 +2659,7 @@ EXPORT_SYMBOL(drm_edid_read_custom);
  * Read EDID using the given I2C adapter.
  *
  * The EDID may be overridden using debugfs override_edid or firmware EDID
- * (drm_load_edid_firmware() and drm.edid_firmware parameter), in this priority
+ * (drm_edid_load_firmware() and drm.edid_firmware parameter), in this priority
  * order. Having either of them bypasses actual EDID reads.
  *
  * Prefer initializing connector->ddc with drm_connector_init_with_ddc() and
@@ -2695,7 +2695,7 @@ EXPORT_SYMBOL(drm_edid_read_ddc);
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

