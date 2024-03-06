Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B038A873F36
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:32:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79F4113434;
	Wed,  6 Mar 2024 18:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SqZ3nEMK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE39D11341F;
 Wed,  6 Mar 2024 18:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709749939; x=1741285939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wp1/dgHbJLoKJL3datdyIpmCxU38lXk94i+f51fDodk=;
 b=SqZ3nEMKxmne1jfRa2nGIJR9IBDkAhZjKhIJ4yc26weV0lwMiicNAuQc
 G0hY4QSfd+4yMCblB8pA4JAbp6xugeEqr2+5kOm4ispbQWqXjnOkyjE56
 LQphyioPI5diJGRy8MUkgYv/Uh3NHViIXlUGQlioCSLrkFuj4MVV7juH/
 ncEk6RGZVsjIbMk9EqZwDLdzX7rTtqi+CeD/cgv3F48u+JlB3flXABWk6
 lYGHkO+T3zCZcKhFY6Hz4cQ5Hed+DXmhgX/RV3cAYTitG6bUww9S3D3fp
 MdirJvYXvZHjmeAt5gpVo5K6Tv68JQeZvceH0uYHtN61ChjgexrOGmHGD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="8142928"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="8142928"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:32:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9709884"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:32:12 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 08/22] drm/encoder: silence drm_encoder_slave.h kernel-doc
Date: Wed,  6 Mar 2024 20:31:13 +0200
Message-Id: <431d705e2364e710bd09769fe579af403bdd37fa.1709749576.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709749576.git.jani.nikula@intel.com>
References: <cover.1709749576.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mark some parts private to silence kernel-doc warnings, and add FIXME.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_encoder_slave.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/drm_encoder_slave.h b/include/drm/drm_encoder_slave.h
index 7214101fd731..7f0ee97bb3a5 100644
--- a/include/drm/drm_encoder_slave.h
+++ b/include/drm/drm_encoder_slave.h
@@ -51,6 +51,7 @@ struct drm_encoder_slave_funcs {
 	void (*set_config)(struct drm_encoder *encoder,
 			   void *params);
 
+	/* private: FIXME: document the hooks */
 	void (*destroy)(struct drm_encoder *encoder);
 	void (*dpms)(struct drm_encoder *encoder, int mode);
 	void (*save)(struct drm_encoder *encoder);
@@ -120,6 +121,7 @@ int drm_i2c_encoder_init(struct drm_device *dev,
  * @slave_priv members of @encoder.
  */
 struct drm_i2c_encoder_driver {
+	/* private: FIXME: document the members */
 	struct i2c_driver i2c_driver;
 
 	int (*encoder_init)(struct i2c_client *client,
@@ -133,6 +135,7 @@ struct drm_i2c_encoder_driver {
 
 /**
  * drm_i2c_encoder_get_client - Get the I2C client corresponding to an encoder
+ * @encoder: The encoder
  */
 static inline struct i2c_client *drm_i2c_encoder_get_client(struct drm_encoder *encoder)
 {
-- 
2.39.2

