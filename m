Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F33CF144D7F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7AC6F403;
	Wed, 22 Jan 2020 08:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C849E6ED28;
 Tue, 21 Jan 2020 14:32:22 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z3so3472379wru.3;
 Tue, 21 Jan 2020 06:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=k3sVQxFN9Jt4vZYxvCH5I4zJetCqBCSztJTvthu9bDk=;
 b=ZDwNg6lkgAofDtTf4YmV3wzBHeoRWwk44Ita5Sw6pJugWuO+ycqpbPP8rQAsOtrRBX
 FA9mFeMkyW8OeEEYZ45mPf8Lw9m7SzUAVyRrLE9+FmJU+N9lHAU+9f1YqsNesWmbxG0k
 byes1QMC+z0zVhm5RurL/MO6DAkW5hSM5xJ39bNylC0dxHMLVOkpLEWfxeBBqoNvOrnw
 Ye6lCM4bdsrNkuctLS15yDWnhAqWabZgpRhIJA8qeZ6sHk2UYyu+br4CRoWzFC5+LJ94
 8vmlzhFRsi97ONJqkBpMkOACxLZVw4DcmaXtA+wqtafh8oMXoX/hqTxUZpGkpi47NEqD
 bEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=k3sVQxFN9Jt4vZYxvCH5I4zJetCqBCSztJTvthu9bDk=;
 b=JlWN/UYR0zVZSmKDWJEBwVkitCQeL6CDQwkcEgGAKTu5oYRTtrcKtzHBQ1YMbKdRV7
 6AbZSDR8vCFRlXnwMwURT+bt1pjmbefOpzEmbgBSWsizNlJqiT9lKjZqH8MX1FmmdGXg
 GUj6cRVN92uq5RKQkKki/ztHF5wDMkUBPl+S27aJVfQs1TAPLoDicWSCY8KTN8wdONUy
 oKLprv13t9I1pfDsy89UbIeAeKHm4HFwina5HoUOnNLNuorVkXpycVeCLDrAgcKwlRh/
 9lecM9Q20ZHTe8T8ZW9G8Wkj6/K8e8Vx1gbBB4Vtw1rpUQDEy7+SEfKnNCiUyARbsIDv
 Xx7Q==
X-Gm-Message-State: APjAAAWralvyvZfo3k0+PcZQE7Rz5vStoWAcgCESEWkIVR+7tiHhPrAX
 QIw+ocXGlQKjaTXs+ANyrA0=
X-Google-Smtp-Source: APXvYqzdkYCRQpsDwAOkJcDDv5Rg9uCF5l895NTMvUl9TehindAQTkm+WcovDHuIwOCYso3EA42sCA==
X-Received: by 2002:adf:e58b:: with SMTP id l11mr5559237wrm.402.1579617141285; 
 Tue, 21 Jan 2020 06:32:21 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id g2sm52781284wrw.76.2020.01.21.06.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 06:32:20 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] drm/i915/hdcp: conversion to struct drm_device based
 logging macros
Date: Tue, 21 Jan 2020 17:31:55 +0300
Message-Id: <20200121143155.20856-7-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200121143155.20856-1-wambui.karugax@gmail.com>
References: <20200121143155.20856-1-wambui.karugax@gmail.com>
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Converts various instances of the printk based logging macros in
i915/display/intel_hdcp.c with the struct drm_device based macros using
coccinelle. The script matches based on the existence of an existing
struct drm_i915_private device:
@rule1@
identifier fn, T;
@@

fn(...,struct drm_i915_private *T,...) {
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

@rule2@
identifier fn, T;
@@

fn(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

New checkpatch warnings were addressed manually.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 138 +++++++++++++---------
 1 file changed, 81 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 0fdbd39f6641..01acf6c5d04d 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -217,8 +217,9 @@ static int intel_hdcp_load_keys(struct drm_i915_private *dev_priv)
 		ret = sandybridge_pcode_write(dev_priv,
 					      SKL_PCODE_LOAD_HDCP_KEYS, 1);
 		if (ret) {
-			DRM_ERROR("Failed to initiate HDCP key load (%d)\n",
-			          ret);
+			drm_err(&dev_priv->drm,
+				"Failed to initiate HDCP key load (%d)\n",
+				ret);
 			return ret;
 		}
 	} else {
@@ -245,7 +246,7 @@ static int intel_write_sha_text(struct drm_i915_private *dev_priv, u32 sha_text)
 {
 	I915_WRITE(HDCP_SHA_TEXT, sha_text);
 	if (intel_de_wait_for_set(dev_priv, HDCP_REP_CTL, HDCP_SHA1_READY, 1)) {
-		DRM_ERROR("Timed out waiting for SHA1 ready\n");
+		drm_err(&dev_priv->drm, "Timed out waiting for SHA1 ready\n");
 		return -ETIMEDOUT;
 	}
 	return 0;
@@ -270,7 +271,8 @@ u32 intel_hdcp_get_repeater_ctl(struct drm_i915_private *dev_priv,
 			return HDCP_TRANSD_REP_PRESENT |
 			       HDCP_TRANSD_SHA1_M0;
 		default:
-			DRM_ERROR("Unknown transcoder %d\n", cpu_transcoder);
+			drm_err(&dev_priv->drm, "Unknown transcoder %d\n",
+				cpu_transcoder);
 			return -EINVAL;
 		}
 	}
@@ -287,7 +289,7 @@ u32 intel_hdcp_get_repeater_ctl(struct drm_i915_private *dev_priv,
 	case PORT_E:
 		return HDCP_DDIE_REP_PRESENT | HDCP_DDIE_SHA1_M0;
 	default:
-		DRM_ERROR("Unknown port %d\n", port);
+		drm_err(&dev_priv->drm, "Unknown port %d\n", port);
 		return -EINVAL;
 	}
 }
@@ -762,25 +764,26 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
 	enum transcoder cpu_transcoder = hdcp->cpu_transcoder;
 	int ret;
 
-	DRM_DEBUG_KMS("[%s:%d] HDCP is being disabled...\n",
-		      connector->base.name, connector->base.base.id);
+	drm_dbg_kms(&dev_priv->drm, "[%s:%d] HDCP is being disabled...\n",
+		    connector->base.name, connector->base.base.id);
 
 	hdcp->hdcp_encrypted = false;
 	I915_WRITE(HDCP_CONF(dev_priv, cpu_transcoder, port), 0);
 	if (intel_de_wait_for_clear(dev_priv,
 				    HDCP_STATUS(dev_priv, cpu_transcoder, port),
 				    ~0, ENCRYPT_STATUS_CHANGE_TIMEOUT_MS)) {
-		DRM_ERROR("Failed to disable HDCP, timeout clearing status\n");
+		drm_err(&dev_priv->drm,
+			"Failed to disable HDCP, timeout clearing status\n");
 		return -ETIMEDOUT;
 	}
 
 	ret = hdcp->shim->toggle_signalling(intel_dig_port, false);
 	if (ret) {
-		DRM_ERROR("Failed to disable HDCP signalling\n");
+		drm_err(&dev_priv->drm, "Failed to disable HDCP signalling\n");
 		return ret;
 	}
 
-	DRM_DEBUG_KMS("HDCP is disabled\n");
+	drm_dbg_kms(&dev_priv->drm, "HDCP is disabled\n");
 	return 0;
 }
 
@@ -790,11 +793,11 @@ static int _intel_hdcp_enable(struct intel_connector *connector)
 	struct drm_i915_private *dev_priv = connector->base.dev->dev_private;
 	int i, ret, tries = 3;
 
-	DRM_DEBUG_KMS("[%s:%d] HDCP is being enabled...\n",
-		      connector->base.name, connector->base.base.id);
+	drm_dbg_kms(&dev_priv->drm, "[%s:%d] HDCP is being enabled...\n",
+		    connector->base.name, connector->base.base.id);
 
 	if (!hdcp_key_loadable(dev_priv)) {
-		DRM_ERROR("HDCP key Load is not possible\n");
+		drm_err(&dev_priv->drm, "HDCP key Load is not possible\n");
 		return -ENXIO;
 	}
 
@@ -805,7 +808,8 @@ static int _intel_hdcp_enable(struct intel_connector *connector)
 		intel_hdcp_clear_keys(dev_priv);
 	}
 	if (ret) {
-		DRM_ERROR("Could not load HDCP keys, (%d)\n", ret);
+		drm_err(&dev_priv->drm, "Could not load HDCP keys, (%d)\n",
+			ret);
 		return ret;
 	}
 
@@ -817,13 +821,14 @@ static int _intel_hdcp_enable(struct intel_connector *connector)
 			return 0;
 		}
 
-		DRM_DEBUG_KMS("HDCP Auth failure (%d)\n", ret);
+		drm_dbg_kms(&dev_priv->drm, "HDCP Auth failure (%d)\n", ret);
 
 		/* Ensuring HDCP encryption and signalling are stopped. */
 		_intel_hdcp_disable(connector);
 	}
 
-	DRM_DEBUG_KMS("HDCP authentication failed (%d tries/%d)\n", tries, ret);
+	drm_dbg_kms(&dev_priv->drm,
+		    "HDCP authentication failed (%d tries/%d)\n", tries, ret);
 	return ret;
 }
 
@@ -854,10 +859,11 @@ static int intel_hdcp_check_link(struct intel_connector *connector)
 	}
 
 	if (WARN_ON(!intel_hdcp_in_use(dev_priv, cpu_transcoder, port))) {
-		DRM_ERROR("%s:%d HDCP link stopped encryption,%x\n",
-			  connector->base.name, connector->base.base.id,
-			  I915_READ(HDCP_STATUS(dev_priv, cpu_transcoder,
-						port)));
+		drm_err(&dev_priv->drm,
+			"%s:%d HDCP link stopped encryption,%x\n",
+			connector->base.name, connector->base.base.id,
+			I915_READ(HDCP_STATUS(dev_priv, cpu_transcoder,
+					      port)));
 		ret = -ENXIO;
 		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
 		schedule_work(&hdcp->prop_work);
@@ -872,12 +878,13 @@ static int intel_hdcp_check_link(struct intel_connector *connector)
 		goto out;
 	}
 
-	DRM_DEBUG_KMS("[%s:%d] HDCP link failed, retrying authentication\n",
-		      connector->base.name, connector->base.base.id);
+	drm_dbg_kms(&dev_priv->drm,
+		    "[%s:%d] HDCP link failed, retrying authentication\n",
+		    connector->base.name, connector->base.base.id);
 
 	ret = _intel_hdcp_disable(connector);
 	if (ret) {
-		DRM_ERROR("Failed to disable hdcp (%d)\n", ret);
+		drm_err(&dev_priv->drm, "Failed to disable hdcp (%d)\n", ret);
 		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
 		schedule_work(&hdcp->prop_work);
 		goto out;
@@ -885,7 +892,7 @@ static int intel_hdcp_check_link(struct intel_connector *connector)
 
 	ret = _intel_hdcp_enable(connector);
 	if (ret) {
-		DRM_ERROR("Failed to enable hdcp (%d)\n", ret);
+		drm_err(&dev_priv->drm, "Failed to enable hdcp (%d)\n", ret);
 		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
 		schedule_work(&hdcp->prop_work);
 		goto out;
@@ -944,7 +951,8 @@ hdcp2_prepare_ake_init(struct intel_connector *connector,
 
 	ret = comp->ops->initiate_hdcp2_session(comp->mei_dev, data, ake_data);
 	if (ret)
-		DRM_DEBUG_KMS("Prepare_ake_init failed. %d\n", ret);
+		drm_dbg_kms(&dev_priv->drm, "Prepare_ake_init failed. %d\n",
+			    ret);
 	mutex_unlock(&dev_priv->hdcp_comp_mutex);
 
 	return ret;
@@ -974,7 +982,8 @@ hdcp2_verify_rx_cert_prepare_km(struct intel_connector *connector,
 							 rx_cert, paired,
 							 ek_pub_km, msg_sz);
 	if (ret < 0)
-		DRM_DEBUG_KMS("Verify rx_cert failed. %d\n", ret);
+		drm_dbg_kms(&dev_priv->drm, "Verify rx_cert failed. %d\n",
+			    ret);
 	mutex_unlock(&dev_priv->hdcp_comp_mutex);
 
 	return ret;
@@ -998,7 +1007,7 @@ static int hdcp2_verify_hprime(struct intel_connector *connector,
 
 	ret = comp->ops->verify_hprime(comp->mei_dev, data, rx_hprime);
 	if (ret < 0)
-		DRM_DEBUG_KMS("Verify hprime failed. %d\n", ret);
+		drm_dbg_kms(&dev_priv->drm, "Verify hprime failed. %d\n", ret);
 	mutex_unlock(&dev_priv->hdcp_comp_mutex);
 
 	return ret;
@@ -1023,7 +1032,8 @@ hdcp2_store_pairing_info(struct intel_connector *connector,
 
 	ret = comp->ops->store_pairing_info(comp->mei_dev, data, pairing_info);
 	if (ret < 0)
-		DRM_DEBUG_KMS("Store pairing info failed. %d\n", ret);
+		drm_dbg_kms(&dev_priv->drm, "Store pairing info failed. %d\n",
+			    ret);
 	mutex_unlock(&dev_priv->hdcp_comp_mutex);
 
 	return ret;
@@ -1048,7 +1058,8 @@ hdcp2_prepare_lc_init(struct intel_connector *connector,
 
 	ret = comp->ops->initiate_locality_check(comp->mei_dev, data, lc_init);
 	if (ret < 0)
-		DRM_DEBUG_KMS("Prepare lc_init failed. %d\n", ret);
+		drm_dbg_kms(&dev_priv->drm, "Prepare lc_init failed. %d\n",
+			    ret);
 	mutex_unlock(&dev_priv->hdcp_comp_mutex);
 
 	return ret;
@@ -1073,7 +1084,8 @@ hdcp2_verify_lprime(struct intel_connector *connector,
 
 	ret = comp->ops->verify_lprime(comp->mei_dev, data, rx_lprime);
 	if (ret < 0)
-		DRM_DEBUG_KMS("Verify L_Prime failed. %d\n", ret);
+		drm_dbg_kms(&dev_priv->drm, "Verify L_Prime failed. %d\n",
+			    ret);
 	mutex_unlock(&dev_priv->hdcp_comp_mutex);
 
 	return ret;
@@ -1097,7 +1109,8 @@ static int hdcp2_prepare_skey(struct intel_connector *connector,
 
 	ret = comp->ops->get_session_key(comp->mei_dev, data, ske_data);
 	if (ret < 0)
-		DRM_DEBUG_KMS("Get session key failed. %d\n", ret);
+		drm_dbg_kms(&dev_priv->drm, "Get session key failed. %d\n",
+			    ret);
 	mutex_unlock(&dev_priv->hdcp_comp_mutex);
 
 	return ret;
@@ -1126,7 +1139,8 @@ hdcp2_verify_rep_topology_prepare_ack(struct intel_connector *connector,
 							 rep_topology,
 							 rep_send_ack);
 	if (ret < 0)
-		DRM_DEBUG_KMS("Verify rep topology failed. %d\n", ret);
+		drm_dbg_kms(&dev_priv->drm,
+			    "Verify rep topology failed. %d\n", ret);
 	mutex_unlock(&dev_priv->hdcp_comp_mutex);
 
 	return ret;
@@ -1151,7 +1165,7 @@ hdcp2_verify_mprime(struct intel_connector *connector,
 
 	ret = comp->ops->verify_mprime(comp->mei_dev, data, stream_ready);
 	if (ret < 0)
-		DRM_DEBUG_KMS("Verify mprime failed. %d\n", ret);
+		drm_dbg_kms(&dev_priv->drm, "Verify mprime failed. %d\n", ret);
 	mutex_unlock(&dev_priv->hdcp_comp_mutex);
 
 	return ret;
@@ -1174,7 +1188,8 @@ static int hdcp2_authenticate_port(struct intel_connector *connector)
 
 	ret = comp->ops->enable_hdcp_authentication(comp->mei_dev, data);
 	if (ret < 0)
-		DRM_DEBUG_KMS("Enable hdcp auth failed. %d\n", ret);
+		drm_dbg_kms(&dev_priv->drm, "Enable hdcp auth failed. %d\n",
+			    ret);
 	mutex_unlock(&dev_priv->hdcp_comp_mutex);
 
 	return ret;
@@ -1536,8 +1551,9 @@ static int hdcp2_enable_encryption(struct intel_connector *connector)
 	if (hdcp->shim->toggle_signalling) {
 		ret = hdcp->shim->toggle_signalling(intel_dig_port, true);
 		if (ret) {
-			DRM_ERROR("Failed to enable HDCP signalling. %d\n",
-				  ret);
+			drm_err(&dev_priv->drm,
+				"Failed to enable HDCP signalling. %d\n",
+				ret);
 			return ret;
 		}
 	}
@@ -1582,13 +1598,14 @@ static int hdcp2_disable_encryption(struct intel_connector *connector)
 				      LINK_ENCRYPTION_STATUS,
 				      ENCRYPT_STATUS_CHANGE_TIMEOUT_MS);
 	if (ret == -ETIMEDOUT)
-		DRM_DEBUG_KMS("Disable Encryption Timedout");
+		drm_dbg_kms(&dev_priv->drm, "Disable Encryption Timedout");
 
 	if (hdcp->shim->toggle_signalling) {
 		ret = hdcp->shim->toggle_signalling(intel_dig_port, false);
 		if (ret) {
-			DRM_ERROR("Failed to disable HDCP signalling. %d\n",
-				  ret);
+			drm_err(&dev_priv->drm,
+				"Failed to disable HDCP signalling. %d\n",
+				ret);
 			return ret;
 		}
 	}
@@ -1691,9 +1708,10 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
 	}
 
 	if (WARN_ON(!intel_hdcp2_in_use(dev_priv, cpu_transcoder, port))) {
-		DRM_ERROR("HDCP2.2 link stopped the encryption, %x\n",
-			  I915_READ(HDCP2_STATUS(dev_priv, cpu_transcoder,
-						 port)));
+		drm_err(&dev_priv->drm,
+			"HDCP2.2 link stopped the encryption, %x\n",
+			I915_READ(HDCP2_STATUS(dev_priv, cpu_transcoder,
+					       port)));
 		ret = -ENXIO;
 		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
 		schedule_work(&hdcp->prop_work);
@@ -1713,25 +1731,29 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
 		if (hdcp->value == DRM_MODE_CONTENT_PROTECTION_UNDESIRED)
 			goto out;
 
-		DRM_DEBUG_KMS("HDCP2.2 Downstream topology change\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "HDCP2.2 Downstream topology change\n");
 		ret = hdcp2_authenticate_repeater_topology(connector);
 		if (!ret) {
 			hdcp->value = DRM_MODE_CONTENT_PROTECTION_ENABLED;
 			schedule_work(&hdcp->prop_work);
 			goto out;
 		}
-		DRM_DEBUG_KMS("[%s:%d] Repeater topology auth failed.(%d)\n",
-			      connector->base.name, connector->base.base.id,
-			      ret);
+		drm_dbg_kms(&dev_priv->drm,
+			    "[%s:%d] Repeater topology auth failed.(%d)\n",
+			    connector->base.name, connector->base.base.id,
+			    ret);
 	} else {
-		DRM_DEBUG_KMS("[%s:%d] HDCP2.2 link failed, retrying auth\n",
-			      connector->base.name, connector->base.base.id);
+		drm_dbg_kms(&dev_priv->drm,
+			    "[%s:%d] HDCP2.2 link failed, retrying auth\n",
+			    connector->base.name, connector->base.base.id);
 	}
 
 	ret = _intel_hdcp2_disable(connector);
 	if (ret) {
-		DRM_ERROR("[%s:%d] Failed to disable hdcp2.2 (%d)\n",
-			  connector->base.name, connector->base.base.id, ret);
+		drm_err(&dev_priv->drm,
+			"[%s:%d] Failed to disable hdcp2.2 (%d)\n",
+			connector->base.name, connector->base.base.id, ret);
 		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
 		schedule_work(&hdcp->prop_work);
 		goto out;
@@ -1739,9 +1761,10 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
 
 	ret = _intel_hdcp2_enable(connector);
 	if (ret) {
-		DRM_DEBUG_KMS("[%s:%d] Failed to enable hdcp2.2 (%d)\n",
-			      connector->base.name, connector->base.base.id,
-			      ret);
+		drm_dbg_kms(&dev_priv->drm,
+			    "[%s:%d] Failed to enable hdcp2.2 (%d)\n",
+			    connector->base.name, connector->base.base.id,
+			    ret);
 		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
 		schedule_work(&hdcp->prop_work);
 		goto out;
@@ -1772,7 +1795,7 @@ static int i915_hdcp_component_bind(struct device *i915_kdev,
 {
 	struct drm_i915_private *dev_priv = kdev_to_i915(i915_kdev);
 
-	DRM_DEBUG("I915 HDCP comp bind\n");
+	drm_dbg(&dev_priv->drm, "I915 HDCP comp bind\n");
 	mutex_lock(&dev_priv->hdcp_comp_mutex);
 	dev_priv->hdcp_master = (struct i915_hdcp_comp_master *)data;
 	dev_priv->hdcp_master->mei_dev = mei_kdev;
@@ -1786,7 +1809,7 @@ static void i915_hdcp_component_unbind(struct device *i915_kdev,
 {
 	struct drm_i915_private *dev_priv = kdev_to_i915(i915_kdev);
 
-	DRM_DEBUG("I915 HDCP comp unbind\n");
+	drm_dbg(&dev_priv->drm, "I915 HDCP comp unbind\n");
 	mutex_lock(&dev_priv->hdcp_comp_mutex);
 	dev_priv->hdcp_master = NULL;
 	mutex_unlock(&dev_priv->hdcp_comp_mutex);
@@ -1854,7 +1877,7 @@ static inline int initialize_hdcp_port_data(struct intel_connector *connector,
 					sizeof(struct hdcp2_streamid_type),
 					GFP_KERNEL);
 	if (!data->streams) {
-		DRM_ERROR("Out of Memory\n");
+		drm_err(&dev_priv->drm, "Out of Memory\n");
 		return -ENOMEM;
 	}
 
@@ -1888,7 +1911,8 @@ void intel_hdcp_component_init(struct drm_i915_private *dev_priv)
 	ret = component_add_typed(dev_priv->drm.dev, &i915_hdcp_component_ops,
 				  I915_COMPONENT_HDCP);
 	if (ret < 0) {
-		DRM_DEBUG_KMS("Failed at component add(%d)\n", ret);
+		drm_dbg_kms(&dev_priv->drm, "Failed at component add(%d)\n",
+			    ret);
 		mutex_lock(&dev_priv->hdcp_comp_mutex);
 		dev_priv->hdcp_comp_added = false;
 		mutex_unlock(&dev_priv->hdcp_comp_mutex);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
