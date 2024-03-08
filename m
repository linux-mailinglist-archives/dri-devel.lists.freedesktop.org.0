Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF668763C0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 12:56:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9480E10F9BE;
	Fri,  8 Mar 2024 11:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ExiAqTHt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1987A113883;
 Fri,  8 Mar 2024 11:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709898991; x=1741434991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pCwJ989y+j9spvEsft2cGhoJEcdlh4IqKS2sC6UaPkg=;
 b=ExiAqTHtBlblLFjI6VUdofHRm5n9Q1t2FCDJIHvKejm7Y6EFA6A+sss1
 fkKTnCy8GfLVGJNFhgfNACay/BDsl/CO9xCeET/Hkt/SVe0aiRPzRqynm
 XZ7UM80dTugHckZoYFyvDL1GIRX6sXzCXdVTx0ote/YHOxrxYVmEgHQoV
 qV1NZSkrFfbRLPhRAz3GzXik2NMp9hCVmulrM8HFTCW1je/m8WnXobFwV
 KQg1+HkH10vw1/WQXZWLEpYJTvvW8vz5V9HjgAZiaBqnmSuFR4MtJVFJv
 9UOZoTr9ytco7hhPlrNTgbkUjoCNN6RUyt2eCnLqlSjN6zAlPCYGgz51h A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15262261"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="15262261"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:56:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10892621"
Received: from unknown (HELO localhost) ([10.252.34.187])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:56:27 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Masahiro Yamada <masahiroy@kernel.org>, lucas.demarchi@intel.com
Subject: [PATCH v2 03/16] drm/encoder: improve drm_encoder_slave.h kernel-doc
Date: Fri,  8 Mar 2024 13:55:41 +0200
Message-Id: <19bc9672c8ae4f7aee235665a4d2360e8790193d.1709898638.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709898638.git.jani.nikula@intel.com>
References: <cover.1709898638.git.jani.nikula@intel.com>
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

Document structs drm_encoder_slave_funcs, drm_encoder_slave, and
drm_i2c_encoder_driver.

v2: Actually document the structs instead of just silencing kernel-doc

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_encoder_slave.h | 91 +++++++++++++++++++++++++++------
 1 file changed, 74 insertions(+), 17 deletions(-)

diff --git a/include/drm/drm_encoder_slave.h b/include/drm/drm_encoder_slave.h
index 7214101fd731..49172166a164 100644
--- a/include/drm/drm_encoder_slave.h
+++ b/include/drm/drm_encoder_slave.h
@@ -34,12 +34,6 @@
 
 /**
  * struct drm_encoder_slave_funcs - Entry points exposed by a slave encoder driver
- * @set_config:	Initialize any encoder-specific modesetting parameters.
- *		The meaning of the @params parameter is implementation
- *		dependent. It will usually be a structure with DVO port
- *		data format settings or timings. It's not required for
- *		the new parameters to take effect until the next mode
- *		is set.
  *
  * Most of its members are analogous to the function pointers in
  * &drm_encoder_helper_funcs and they can optionally be used to
@@ -48,41 +42,85 @@
  * if the encoder is the currently selected one for the connector.
  */
 struct drm_encoder_slave_funcs {
+	/**
+	 * @set_config: Initialize any encoder-specific modesetting parameters.
+	 * The meaning of the @params parameter is implementation dependent. It
+	 * will usually be a structure with DVO port data format settings or
+	 * timings. It's not required for the new parameters to take effect
+	 * until the next mode is set.
+	 */
 	void (*set_config)(struct drm_encoder *encoder,
 			   void *params);
 
+	/**
+	 * @destroy: Analogous to &drm_encoder_funcs @destroy callback.
+	 */
 	void (*destroy)(struct drm_encoder *encoder);
+
+	/**
+	 * @dpms: Analogous to &drm_encoder_helper_funcs @dpms callback. Wrapped
+	 * by drm_i2c_encoder_dpms().
+	 */
 	void (*dpms)(struct drm_encoder *encoder, int mode);
+
+	/**
+	 * @save: Save state. Wrapped by drm_i2c_encoder_save().
+	 */
 	void (*save)(struct drm_encoder *encoder);
+
+	/**
+	 * @restore: Restore state. Wrapped by drm_i2c_encoder_restore().
+	 */
 	void (*restore)(struct drm_encoder *encoder);
+
+	/**
+	 * @mode_fixup: Analogous to &drm_encoder_helper_funcs @mode_fixup
+	 * callback. Wrapped by drm_i2c_encoder_mode_fixup().
+	 */
 	bool (*mode_fixup)(struct drm_encoder *encoder,
 			   const struct drm_display_mode *mode,
 			   struct drm_display_mode *adjusted_mode);
+
+	/**
+	 * @mode_valid: Analogous to &drm_encoder_helper_funcs @mode_valid.
+	 */
 	int (*mode_valid)(struct drm_encoder *encoder,
 			  struct drm_display_mode *mode);
+	/**
+	 * @mode_set: Analogous to &drm_encoder_helper_funcs @mode_set
+	 * callback. Wrapped by drm_i2c_encoder_mode_set().
+	 */
 	void (*mode_set)(struct drm_encoder *encoder,
 			 struct drm_display_mode *mode,
 			 struct drm_display_mode *adjusted_mode);
 
+	/**
+	 * @detect: Analogous to &drm_encoder_helper_funcs @detect
+	 * callback. Wrapped by drm_i2c_encoder_detect().
+	 */
 	enum drm_connector_status (*detect)(struct drm_encoder *encoder,
 					    struct drm_connector *connector);
+	/**
+	 * @get_modes: Get modes.
+	 */
 	int (*get_modes)(struct drm_encoder *encoder,
 			 struct drm_connector *connector);
+	/**
+	 * @create_resources: Create resources.
+	 */
 	int (*create_resources)(struct drm_encoder *encoder,
 				 struct drm_connector *connector);
+	/**
+	 * @set_property: Set property.
+	 */
 	int (*set_property)(struct drm_encoder *encoder,
 			    struct drm_connector *connector,
 			    struct drm_property *property,
 			    uint64_t val);
-
 };
 
 /**
  * struct drm_encoder_slave - Slave encoder struct
- * @base: DRM encoder object.
- * @slave_funcs: Slave encoder callbacks.
- * @slave_priv: Slave encoder private data.
- * @bus_priv: Bus specific data.
  *
  * A &drm_encoder_slave has two sets of callbacks, @slave_funcs and the
  * ones in @base. The former are never actually called by the common
@@ -95,10 +133,24 @@ struct drm_encoder_slave_funcs {
  * this.
  */
 struct drm_encoder_slave {
+	/**
+	 * @base: DRM encoder object.
+	 */
 	struct drm_encoder base;
 
+	/**
+	 * @slave_funcs: Slave encoder callbacks.
+	 */
 	const struct drm_encoder_slave_funcs *slave_funcs;
+
+	/**
+	 * @slave_priv: Slave encoder private data.
+	 */
 	void *slave_priv;
+
+	/**
+	 * @bus_priv: Bus specific data.
+	 */
 	void *bus_priv;
 };
 #define to_encoder_slave(x) container_of((x), struct drm_encoder_slave, base)
@@ -112,16 +164,20 @@ int drm_i2c_encoder_init(struct drm_device *dev,
 /**
  * struct drm_i2c_encoder_driver
  *
- * Describes a device driver for an encoder connected to the GPU
- * through an I2C bus. In addition to the entry points in @i2c_driver
- * an @encoder_init function should be provided. It will be called to
- * give the driver an opportunity to allocate any per-encoder data
- * structures and to initialize the @slave_funcs and (optionally)
- * @slave_priv members of @encoder.
+ * Describes a device driver for an encoder connected to the GPU through an I2C
+ * bus.
  */
 struct drm_i2c_encoder_driver {
+	/**
+	 * @i2c_driver: I2C device driver description.
+	 */
 	struct i2c_driver i2c_driver;
 
+	/**
+	 * @encoder_init: Callback to allocate any per-encoder data structures
+	 * and to initialize the @slave_funcs and (optionally) @slave_priv
+	 * members of @encoder.
+	 */
 	int (*encoder_init)(struct i2c_client *client,
 			    struct drm_device *dev,
 			    struct drm_encoder_slave *encoder);
@@ -133,6 +189,7 @@ struct drm_i2c_encoder_driver {
 
 /**
  * drm_i2c_encoder_get_client - Get the I2C client corresponding to an encoder
+ * @encoder: The encoder
  */
 static inline struct i2c_client *drm_i2c_encoder_get_client(struct drm_encoder *encoder)
 {
-- 
2.39.2

