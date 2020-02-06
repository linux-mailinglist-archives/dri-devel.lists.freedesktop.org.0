Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67979153FDA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:18:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D41C6F9F8;
	Thu,  6 Feb 2020 08:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843856F9DD;
 Thu,  6 Feb 2020 08:01:06 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f129so5780711wmf.2;
 Thu, 06 Feb 2020 00:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eMCXRPnCTWMN9Bx4gW4/CwZ/VPgdDo5pRazYSZ3T8lw=;
 b=KI3Uhj6QlvC/GHlTdSmFt5jwiiteRnST8EtxbrHxRzQpkaYIO9IW9RobYnKT6q0KAn
 uZ6jjGQcAbwFAeWRjnuqd1rn+aoIsUOJ+6LBexNsaZIe0Qi0h8w4f/Odth2VJ1/mMLjo
 N7KGWsBirCoygdZyaLpBsVK0kMRrD4DuPcmQKCMJQ/NlE6JbAZgcP9XPufR6SumfqyTJ
 6tKKohIsxaefyeRHQJMHbtGgTy+WQcHmAGhc76jay977M//hbVbcvNzz5WUFGUENs4zx
 hlocExH7w8ZKX4HkhRoNlAjhAw5yedVcdNt63mWqUvNggweda9uRQgeMijTh2fU6ZMrI
 No3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eMCXRPnCTWMN9Bx4gW4/CwZ/VPgdDo5pRazYSZ3T8lw=;
 b=HG97Oi12w8jS6b0ysKkBfxy0m/zZImxlvtfxA5oRUglc4pJfwMGIz13/gul8gd82HG
 WPyWFTX/UDYnAHAf3KcwoTpZ4QybwFOmWXdb2V2P8YZQZPfXrmlD3UVbL83cvvJOwRBN
 +4nyJQKgpcY7FPrqTh58FKnrX1pcUHGp6w76T2KTQLJP/d85q3ePPYdj4gTOFP9yblCV
 euYeB+9h06Dcpsc0ScT3nZDWxSGUNDOXbqdf+unma1HaVUCP4+IYDcMeYY4BkhCaSjKX
 2NELDKnPd16SkrVTCxQim9P1fy8BoFfX0Od5H/SPpcpn0uK0kaYw0jrQJrGn5PTwqEXf
 Rr+A==
X-Gm-Message-State: APjAAAUVoYd9MzYllohOn/L5kHIE8H6lF7t2/Q7rpIocHKuJ2cQbb3uQ
 PhOuHAol3mV+CJYVEXsANk0=
X-Google-Smtp-Source: APXvYqz1pXDT6v0Gj7toUBeEqxCzIubdRcs2Usi7SqQoT1+Xs9cRDU8qB+tufgySaS5r49hkADQGrQ==
X-Received: by 2002:a7b:c934:: with SMTP id h20mr2886190wml.103.1580976064935; 
 Thu, 06 Feb 2020 00:01:04 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id u8sm2635132wmm.15.2020.02.06.00.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 00:01:04 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 11/12] drm/i915/hdmi: convert to struct drm_device based
 logging macros.
Date: Thu,  6 Feb 2020 11:00:12 +0300
Message-Id: <20200206080014.13759-12-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200206080014.13759-1-wambui.karugax@gmail.com>
References: <20200206080014.13759-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Conversion of various instances of the printk based drm logging macros
to the struct drm_device based logging macros in
i915/display/intel_hdmi.c.
This also involves extraction of the drm_i915_private device from
various intel/drm types for use in the logging macros.

Note that this converts DRM_DEBUG_DRIVER() to drm_dbg().

References: https://lists.freedesktop.org/archives/dri-devel/2020-January/253381.html
Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 193 ++++++++++++++--------
 1 file changed, 128 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index e68bafb76cb1..4e8e26564c19 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -691,6 +691,7 @@ void intel_read_infoframe(struct intel_encoder *encoder,
 			  union hdmi_infoframe *frame)
 {
 	struct intel_digital_port *intel_dig_port = enc_to_dig_port(encoder);
+	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
 	u8 buffer[VIDEO_DIP_DATA_SIZE];
 	int ret;
 
@@ -707,13 +708,15 @@ void intel_read_infoframe(struct intel_encoder *encoder,
 	/* see comment above for the reason for this offset */
 	ret = hdmi_infoframe_unpack(frame, buffer + 1, sizeof(buffer) - 1);
 	if (ret) {
-		DRM_DEBUG_KMS("Failed to unpack infoframe type 0x%02x\n", type);
+		drm_dbg_kms(&i915->drm,
+			    "Failed to unpack infoframe type 0x%02x\n", type);
 		return;
 	}
 
 	if (frame->any.type != type)
-		DRM_DEBUG_KMS("Found the wrong infoframe type 0x%x (expected 0x%02x)\n",
-			      frame->any.type, type);
+		drm_dbg_kms(&i915->drm,
+			    "Found the wrong infoframe type 0x%x (expected 0x%02x)\n",
+			    frame->any.type, type);
 }
 
 static bool
@@ -853,7 +856,8 @@ intel_hdmi_compute_drm_infoframe(struct intel_encoder *encoder,
 
 	ret = drm_hdmi_infoframe_set_hdr_metadata(frame, conn_state);
 	if (ret < 0) {
-		DRM_DEBUG_KMS("couldn't set HDR metadata in infoframe\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "couldn't set HDR metadata in infoframe\n");
 		return false;
 	}
 
@@ -893,8 +897,9 @@ static void g4x_set_infoframes(struct intel_encoder *encoder,
 		if (!(val & VIDEO_DIP_ENABLE))
 			return;
 		if (port != (val & VIDEO_DIP_PORT_MASK)) {
-			DRM_DEBUG_KMS("video DIP still enabled on port %c\n",
-				      (val & VIDEO_DIP_PORT_MASK) >> 29);
+			drm_dbg_kms(&dev_priv->drm,
+				    "video DIP still enabled on port %c\n",
+				    (val & VIDEO_DIP_PORT_MASK) >> 29);
 			return;
 		}
 		val &= ~(VIDEO_DIP_ENABLE | VIDEO_DIP_ENABLE_AVI |
@@ -906,8 +911,9 @@ static void g4x_set_infoframes(struct intel_encoder *encoder,
 
 	if (port != (val & VIDEO_DIP_PORT_MASK)) {
 		if (val & VIDEO_DIP_ENABLE) {
-			DRM_DEBUG_KMS("video DIP already enabled on port %c\n",
-				      (val & VIDEO_DIP_PORT_MASK) >> 29);
+			drm_dbg_kms(&dev_priv->drm,
+				    "video DIP already enabled on port %c\n",
+				    (val & VIDEO_DIP_PORT_MASK) >> 29);
 			return;
 		}
 		val &= ~VIDEO_DIP_PORT_MASK;
@@ -1264,8 +1270,8 @@ void intel_dp_dual_mode_set_tmds_output(struct intel_hdmi *hdmi, bool enable)
 	if (hdmi->dp_dual_mode.type < DRM_DP_DUAL_MODE_TYPE2_DVI)
 		return;
 
-	DRM_DEBUG_KMS("%s DP dual mode adaptor TMDS output\n",
-		      enable ? "Enabling" : "Disabling");
+	drm_dbg_kms(&dev_priv->drm, "%s DP dual mode adaptor TMDS output\n",
+		    enable ? "Enabling" : "Disabling");
 
 	drm_dp_dual_mode_set_tmds_output(hdmi->dp_dual_mode.type,
 					 adapter, enable);
@@ -1349,13 +1355,15 @@ int intel_hdmi_hdcp_write_an_aksv(struct intel_digital_port *intel_dig_port,
 	ret = intel_hdmi_hdcp_write(intel_dig_port, DRM_HDCP_DDC_AN, an,
 				    DRM_HDCP_AN_LEN);
 	if (ret) {
-		DRM_DEBUG_KMS("Write An over DDC failed (%d)\n", ret);
+		drm_dbg_kms(&dev_priv->drm, "Write An over DDC failed (%d)\n",
+			    ret);
 		return ret;
 	}
 
 	ret = intel_gmbus_output_aksv(adapter);
 	if (ret < 0) {
-		DRM_DEBUG_KMS("Failed to output aksv (%d)\n", ret);
+		drm_dbg_kms(&dev_priv->drm, "Failed to output aksv (%d)\n",
+			    ret);
 		return ret;
 	}
 	return 0;
@@ -1364,11 +1372,15 @@ int intel_hdmi_hdcp_write_an_aksv(struct intel_digital_port *intel_dig_port,
 static int intel_hdmi_hdcp_read_bksv(struct intel_digital_port *intel_dig_port,
 				     u8 *bksv)
 {
+	struct drm_i915_private *i915 =
+		intel_dig_port->base.base.dev->dev_private;
 	int ret;
+
 	ret = intel_hdmi_hdcp_read(intel_dig_port, DRM_HDCP_DDC_BKSV, bksv,
 				   DRM_HDCP_KSV_LEN);
 	if (ret)
-		DRM_DEBUG_KMS("Read Bksv over DDC failed (%d)\n", ret);
+		drm_dbg_kms(&i915->drm, "Read Bksv over DDC failed (%d)\n",
+			    ret);
 	return ret;
 }
 
@@ -1376,11 +1388,15 @@ static
 int intel_hdmi_hdcp_read_bstatus(struct intel_digital_port *intel_dig_port,
 				 u8 *bstatus)
 {
+	struct drm_i915_private *i915 =
+		intel_dig_port->base.base.dev->dev_private;
 	int ret;
+
 	ret = intel_hdmi_hdcp_read(intel_dig_port, DRM_HDCP_DDC_BSTATUS,
 				   bstatus, DRM_HDCP_BSTATUS_LEN);
 	if (ret)
-		DRM_DEBUG_KMS("Read bstatus over DDC failed (%d)\n", ret);
+		drm_dbg_kms(&i915->drm, "Read bstatus over DDC failed (%d)\n",
+			    ret);
 	return ret;
 }
 
@@ -1388,12 +1404,15 @@ static
 int intel_hdmi_hdcp_repeater_present(struct intel_digital_port *intel_dig_port,
 				     bool *repeater_present)
 {
+	struct drm_i915_private *i915 =
+		intel_dig_port->base.base.dev->dev_private;
 	int ret;
 	u8 val;
 
 	ret = intel_hdmi_hdcp_read(intel_dig_port, DRM_HDCP_DDC_BCAPS, &val, 1);
 	if (ret) {
-		DRM_DEBUG_KMS("Read bcaps over DDC failed (%d)\n", ret);
+		drm_dbg_kms(&i915->drm, "Read bcaps over DDC failed (%d)\n",
+			    ret);
 		return ret;
 	}
 	*repeater_present = val & DRM_HDCP_DDC_BCAPS_REPEATER_PRESENT;
@@ -1404,11 +1423,15 @@ static
 int intel_hdmi_hdcp_read_ri_prime(struct intel_digital_port *intel_dig_port,
 				  u8 *ri_prime)
 {
+	struct drm_i915_private *i915 =
+		intel_dig_port->base.base.dev->dev_private;
 	int ret;
+
 	ret = intel_hdmi_hdcp_read(intel_dig_port, DRM_HDCP_DDC_RI_PRIME,
 				   ri_prime, DRM_HDCP_RI_LEN);
 	if (ret)
-		DRM_DEBUG_KMS("Read Ri' over DDC failed (%d)\n", ret);
+		drm_dbg_kms(&i915->drm, "Read Ri' over DDC failed (%d)\n",
+			    ret);
 	return ret;
 }
 
@@ -1416,12 +1439,15 @@ static
 int intel_hdmi_hdcp_read_ksv_ready(struct intel_digital_port *intel_dig_port,
 				   bool *ksv_ready)
 {
+	struct drm_i915_private *i915 =
+		intel_dig_port->base.base.dev->dev_private;
 	int ret;
 	u8 val;
 
 	ret = intel_hdmi_hdcp_read(intel_dig_port, DRM_HDCP_DDC_BCAPS, &val, 1);
 	if (ret) {
-		DRM_DEBUG_KMS("Read bcaps over DDC failed (%d)\n", ret);
+		drm_dbg_kms(&i915->drm, "Read bcaps over DDC failed (%d)\n",
+			    ret);
 		return ret;
 	}
 	*ksv_ready = val & DRM_HDCP_DDC_BCAPS_KSV_FIFO_READY;
@@ -1432,11 +1458,15 @@ static
 int intel_hdmi_hdcp_read_ksv_fifo(struct intel_digital_port *intel_dig_port,
 				  int num_downstream, u8 *ksv_fifo)
 {
+	struct drm_i915_private *i915 =
+		intel_dig_port->base.base.dev->dev_private;
 	int ret;
+
 	ret = intel_hdmi_hdcp_read(intel_dig_port, DRM_HDCP_DDC_KSV_FIFO,
 				   ksv_fifo, num_downstream * DRM_HDCP_KSV_LEN);
 	if (ret) {
-		DRM_DEBUG_KMS("Read ksv fifo over DDC failed (%d)\n", ret);
+		drm_dbg_kms(&i915->drm,
+			    "Read ksv fifo over DDC failed (%d)\n", ret);
 		return ret;
 	}
 	return 0;
@@ -1446,6 +1476,8 @@ static
 int intel_hdmi_hdcp_read_v_prime_part(struct intel_digital_port *intel_dig_port,
 				      int i, u32 *part)
 {
+	struct drm_i915_private *i915 =
+		intel_dig_port->base.base.dev->dev_private;
 	int ret;
 
 	if (i >= DRM_HDCP_V_PRIME_NUM_PARTS)
@@ -1454,7 +1486,8 @@ int intel_hdmi_hdcp_read_v_prime_part(struct intel_digital_port *intel_dig_port,
 	ret = intel_hdmi_hdcp_read(intel_dig_port, DRM_HDCP_DDC_V_PRIME(i),
 				   part, DRM_HDCP_V_PRIME_PART_LEN);
 	if (ret)
-		DRM_DEBUG_KMS("Read V'[%d] over DDC failed (%d)\n", i, ret);
+		drm_dbg_kms(&i915->drm, "Read V'[%d] over DDC failed (%d)\n",
+			    i, ret);
 	return ret;
 }
 
@@ -1477,12 +1510,14 @@ static int kbl_repositioning_enc_en_signal(struct intel_connector *connector)
 
 	ret = intel_ddi_toggle_hdcp_signalling(&intel_dig_port->base, false);
 	if (ret) {
-		DRM_ERROR("Disable HDCP signalling failed (%d)\n", ret);
+		drm_err(&dev_priv->drm,
+			"Disable HDCP signalling failed (%d)\n", ret);
 		return ret;
 	}
 	ret = intel_ddi_toggle_hdcp_signalling(&intel_dig_port->base, true);
 	if (ret) {
-		DRM_ERROR("Enable HDCP signalling failed (%d)\n", ret);
+		drm_err(&dev_priv->drm,
+			"Enable HDCP signalling failed (%d)\n", ret);
 		return ret;
 	}
 
@@ -1503,8 +1538,8 @@ int intel_hdmi_hdcp_toggle_signalling(struct intel_digital_port *intel_dig_port,
 
 	ret = intel_ddi_toggle_hdcp_signalling(&intel_dig_port->base, enable);
 	if (ret) {
-		DRM_ERROR("%s HDCP signalling failed (%d)\n",
-			  enable ? "Enable" : "Disable", ret);
+		drm_err(&dev_priv->drm, "%s HDCP signalling failed (%d)\n",
+			enable ? "Enable" : "Disable", ret);
 		return ret;
 	}
 
@@ -1543,8 +1578,9 @@ bool intel_hdmi_hdcp_check_link(struct intel_digital_port *intel_dig_port)
 	/* Wait for Ri prime match */
 	if (wait_for(intel_de_read(dev_priv, HDCP_STATUS(dev_priv, cpu_transcoder, port)) &
 		     (HDCP_STATUS_RI_MATCH | HDCP_STATUS_ENC), 1)) {
-		DRM_ERROR("Ri' mismatch detected, link check failed (%x)\n",
-			  intel_de_read(dev_priv, HDCP_STATUS(dev_priv, cpu_transcoder, port)));
+		drm_err(&dev_priv->drm,
+			"Ri' mismatch detected, link check failed (%x)\n",
+			intel_de_read(dev_priv, HDCP_STATUS(dev_priv, cpu_transcoder, port)));
 		return false;
 	}
 	return true;
@@ -1597,12 +1633,15 @@ int hdcp2_detect_msg_availability(struct intel_digital_port *intel_digital_port,
 				  u8 msg_id, bool *msg_ready,
 				  ssize_t *msg_sz)
 {
+	struct drm_i915_private *i915 =
+		intel_digital_port->base.base.dev->dev_private;
 	u8 rx_status[HDCP_2_2_HDMI_RXSTATUS_LEN];
 	int ret;
 
 	ret = intel_hdmi_hdcp2_read_rx_status(intel_digital_port, rx_status);
 	if (ret < 0) {
-		DRM_DEBUG_KMS("rx_status read failed. Err %d\n", ret);
+		drm_dbg_kms(&i915->drm, "rx_status read failed. Err %d\n",
+			    ret);
 		return ret;
 	}
 
@@ -1622,6 +1661,8 @@ static ssize_t
 intel_hdmi_hdcp2_wait_for_msg(struct intel_digital_port *intel_dig_port,
 			      u8 msg_id, bool paired)
 {
+	struct drm_i915_private *i915 =
+		intel_dig_port->base.base.dev->dev_private;
 	bool msg_ready = false;
 	int timeout, ret;
 	ssize_t msg_sz = 0;
@@ -1636,8 +1677,8 @@ intel_hdmi_hdcp2_wait_for_msg(struct intel_digital_port *intel_dig_port,
 			 !ret && msg_ready && msg_sz, timeout * 1000,
 			 1000, 5 * 1000);
 	if (ret)
-		DRM_DEBUG_KMS("msg_id: %d, ret: %d, timeout: %d\n",
-			      msg_id, ret, timeout);
+		drm_dbg_kms(&i915->drm, "msg_id: %d, ret: %d, timeout: %d\n",
+			    msg_id, ret, timeout);
 
 	return ret ? ret : msg_sz;
 }
@@ -1656,6 +1697,8 @@ static
 int intel_hdmi_hdcp2_read_msg(struct intel_digital_port *intel_dig_port,
 			      u8 msg_id, void *buf, size_t size)
 {
+	struct drm_i915_private *i915 =
+		intel_dig_port->base.base.dev->dev_private;
 	struct intel_hdmi *hdmi = &intel_dig_port->hdmi;
 	struct intel_hdcp *hdcp = &hdmi->attached_connector->hdcp;
 	unsigned int offset;
@@ -1671,15 +1714,17 @@ int intel_hdmi_hdcp2_read_msg(struct intel_digital_port *intel_dig_port,
 	 * available buffer.
 	 */
 	if (ret > size) {
-		DRM_DEBUG_KMS("msg_sz(%zd) is more than exp size(%zu)\n",
-			      ret, size);
+		drm_dbg_kms(&i915->drm,
+			    "msg_sz(%zd) is more than exp size(%zu)\n",
+			    ret, size);
 		return -1;
 	}
 
 	offset = HDCP_2_2_HDMI_REG_RD_MSG_OFFSET;
 	ret = intel_hdmi_hdcp_read(intel_dig_port, offset, buf, ret);
 	if (ret)
-		DRM_DEBUG_KMS("Failed to read msg_id: %d(%zd)\n", msg_id, ret);
+		drm_dbg_kms(&i915->drm, "Failed to read msg_id: %d(%zd)\n",
+			    msg_id, ret);
 
 	return ret;
 }
@@ -1875,11 +1920,12 @@ static void intel_enable_hdmi_audio(struct intel_encoder *encoder,
 				    const struct intel_crtc_state *pipe_config,
 				    const struct drm_connector_state *conn_state)
 {
+	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
 
 	drm_WARN_ON(encoder->base.dev, !pipe_config->has_hdmi_sink);
-	DRM_DEBUG_DRIVER("Enabling HDMI audio on pipe %c\n",
-			 pipe_name(crtc->pipe));
+	drm_dbg(&i915->drm, "Enabling HDMI audio on pipe %c\n",
+		pipe_name(crtc->pipe));
 	intel_audio_codec_enable(encoder, pipe_config, conn_state);
 }
 
@@ -2299,10 +2345,12 @@ static bool
 intel_hdmi_ycbcr420_config(struct drm_connector *connector,
 			   struct intel_crtc_state *config)
 {
+	struct drm_i915_private *i915 = to_i915(connector->dev);
 	struct intel_crtc *intel_crtc = to_intel_crtc(config->uapi.crtc);
 
 	if (!connector->ycbcr_420_allowed) {
-		DRM_ERROR("Platform doesn't support YCBCR420 output\n");
+		drm_err(&i915->drm,
+			"Platform doesn't support YCBCR420 output\n");
 		return false;
 	}
 
@@ -2310,7 +2358,8 @@ intel_hdmi_ycbcr420_config(struct drm_connector *connector,
 
 	/* YCBCR 420 output conversion needs a scaler */
 	if (skl_update_scaler_crtc(config)) {
-		DRM_DEBUG_KMS("Scaler allocation for output failed\n");
+		drm_dbg_kms(&i915->drm,
+			    "Scaler allocation for output failed\n");
 		return false;
 	}
 
@@ -2352,6 +2401,7 @@ static int intel_hdmi_compute_clock(struct intel_encoder *encoder,
 				    struct intel_crtc_state *crtc_state)
 {
 	struct intel_hdmi *intel_hdmi = enc_to_intel_hdmi(encoder);
+	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 	int bpc, clock = adjusted_mode->crtc_clock;
@@ -2375,13 +2425,15 @@ static int intel_hdmi_compute_clock(struct intel_encoder *encoder,
 	if (crtc_state->pipe_bpp > bpc * 3)
 		crtc_state->pipe_bpp = bpc * 3;
 
-	DRM_DEBUG_KMS("picking %d bpc for HDMI output (pipe bpp: %d)\n",
-		      bpc, crtc_state->pipe_bpp);
+	drm_dbg_kms(&i915->drm,
+		    "picking %d bpc for HDMI output (pipe bpp: %d)\n",
+		    bpc, crtc_state->pipe_bpp);
 
 	if (hdmi_port_clock_valid(intel_hdmi, crtc_state->port_clock,
 				  false, crtc_state->has_hdmi_sink) != MODE_OK) {
-		DRM_DEBUG_KMS("unsupported HDMI clock (%d kHz), rejecting mode\n",
-			      crtc_state->port_clock);
+		drm_dbg_kms(&i915->drm,
+			    "unsupported HDMI clock (%d kHz), rejecting mode\n",
+			    crtc_state->port_clock);
 		return -EINVAL;
 	}
 
@@ -2444,7 +2496,8 @@ int intel_hdmi_compute_config(struct intel_encoder *encoder,
 
 	if (drm_mode_is_420_only(&connector->display_info, adjusted_mode)) {
 		if (!intel_hdmi_ycbcr420_config(connector, pipe_config)) {
-			DRM_ERROR("Can't support YCBCR420 output\n");
+			drm_err(&dev_priv->drm,
+				"Can't support YCBCR420 output\n");
 			return -EINVAL;
 		}
 	}
@@ -2487,22 +2540,22 @@ int intel_hdmi_compute_config(struct intel_encoder *encoder,
 	intel_hdmi_compute_gcp_infoframe(encoder, pipe_config, conn_state);
 
 	if (!intel_hdmi_compute_avi_infoframe(encoder, pipe_config, conn_state)) {
-		DRM_DEBUG_KMS("bad AVI infoframe\n");
+		drm_dbg_kms(&dev_priv->drm, "bad AVI infoframe\n");
 		return -EINVAL;
 	}
 
 	if (!intel_hdmi_compute_spd_infoframe(encoder, pipe_config, conn_state)) {
-		DRM_DEBUG_KMS("bad SPD infoframe\n");
+		drm_dbg_kms(&dev_priv->drm, "bad SPD infoframe\n");
 		return -EINVAL;
 	}
 
 	if (!intel_hdmi_compute_hdmi_infoframe(encoder, pipe_config, conn_state)) {
-		DRM_DEBUG_KMS("bad HDMI infoframe\n");
+		drm_dbg_kms(&dev_priv->drm, "bad HDMI infoframe\n");
 		return -EINVAL;
 	}
 
 	if (!intel_hdmi_compute_drm_infoframe(encoder, pipe_config, conn_state)) {
-		DRM_DEBUG_KMS("bad DRM infoframe\n");
+		drm_dbg_kms(&dev_priv->drm, "bad DRM infoframe\n");
 		return -EINVAL;
 	}
 
@@ -2552,7 +2605,8 @@ intel_hdmi_dp_dual_mode_detect(struct drm_connector *connector, bool has_edid)
 		 */
 		if (has_edid && !connector->override_edid &&
 		    intel_bios_is_port_dp_dual_mode(dev_priv, port)) {
-			DRM_DEBUG_KMS("Assuming DP dual mode adaptor presence based on VBT\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "Assuming DP dual mode adaptor presence based on VBT\n");
 			type = DRM_DP_DUAL_MODE_TYPE1_DVI;
 		} else {
 			type = DRM_DP_DUAL_MODE_NONE;
@@ -2566,9 +2620,10 @@ intel_hdmi_dp_dual_mode_detect(struct drm_connector *connector, bool has_edid)
 	hdmi->dp_dual_mode.max_tmds_clock =
 		drm_dp_dual_mode_max_tmds_clock(type, adapter);
 
-	DRM_DEBUG_KMS("DP dual mode adaptor (%s) detected (max TMDS clock: %d kHz)\n",
-		      drm_dp_get_dual_mode_type_name(type),
-		      hdmi->dp_dual_mode.max_tmds_clock);
+	drm_dbg_kms(&dev_priv->drm,
+		    "DP dual mode adaptor (%s) detected (max TMDS clock: %d kHz)\n",
+		    drm_dp_get_dual_mode_type_name(type),
+		    hdmi->dp_dual_mode.max_tmds_clock);
 }
 
 static bool
@@ -2588,7 +2643,8 @@ intel_hdmi_set_edid(struct drm_connector *connector)
 	edid = drm_get_edid(connector, i2c);
 
 	if (!edid && !intel_gmbus_is_forced_bit(i2c)) {
-		DRM_DEBUG_KMS("HDMI GMBUS EDID read failed, retry using GPIO bit-banging\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "HDMI GMBUS EDID read failed, retry using GPIO bit-banging\n");
 		intel_gmbus_force_bit(i2c, true);
 		edid = drm_get_edid(connector, i2c);
 		intel_gmbus_force_bit(i2c, false);
@@ -2620,8 +2676,8 @@ intel_hdmi_detect(struct drm_connector *connector, bool force)
 	struct intel_encoder *encoder = &hdmi_to_dig_port(intel_hdmi)->base;
 	intel_wakeref_t wakeref;
 
-	DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n",
-		      connector->base.id, connector->name);
+	drm_dbg_kms(&dev_priv->drm, "[CONNECTOR:%d:%s]\n",
+		    connector->base.id, connector->name);
 
 	wakeref = intel_display_power_get(dev_priv, POWER_DOMAIN_GMBUS);
 
@@ -2652,8 +2708,9 @@ intel_hdmi_detect(struct drm_connector *connector, bool force)
 static void
 intel_hdmi_force(struct drm_connector *connector)
 {
-	DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n",
-		      connector->base.id, connector->name);
+	drm_dbg_kms(&to_i915(connector->dev)->drm,
+		    "[CONNECTOR:%d:%s]\n",
+		    connector->base.id, connector->name);
 
 	intel_hdmi_unset_edid(connector);
 
@@ -2802,7 +2859,8 @@ static void intel_hdmi_create_i2c_symlink(struct drm_connector *connector)
 
 	ret = sysfs_create_link(connector_kobj, i2c_kobj, i2c_kobj->name);
 	if (ret)
-		DRM_ERROR("Failed to create i2c symlink (%d)\n", ret);
+		drm_err(&to_i915(connector->dev)->drm,
+			"Failed to create i2c symlink (%d)\n", ret);
 }
 
 static void intel_hdmi_remove_i2c_symlink(struct drm_connector *connector)
@@ -2931,9 +2989,10 @@ bool intel_hdmi_handle_sink_scrambling(struct intel_encoder *encoder,
 	if (!sink_scrambling->supported)
 		return true;
 
-	DRM_DEBUG_KMS("[CONNECTOR:%d:%s] scrambling=%s, TMDS bit clock ratio=1/%d\n",
-		      connector->base.id, connector->name,
-		      yesno(scrambling), high_tmds_clock_ratio ? 40 : 10);
+	drm_dbg_kms(&dev_priv->drm,
+		    "[CONNECTOR:%d:%s] scrambling=%s, TMDS bit clock ratio=1/%d\n",
+		    connector->base.id, connector->name,
+		    yesno(scrambling), high_tmds_clock_ratio ? 40 : 10);
 
 	/* Set TMDS bit clock ratio to 1/40 or 1/10, and enable/disable scrambling */
 	return drm_scdc_set_high_tmds_clock_ratio(adapter,
@@ -3075,8 +3134,9 @@ static u8 intel_hdmi_ddc_pin(struct intel_encoder *encoder)
 
 	ddc_pin = intel_bios_alternate_ddc_pin(encoder);
 	if (ddc_pin) {
-		DRM_DEBUG_KMS("Using DDC pin 0x%x for port %c (VBT)\n",
-			      ddc_pin, port_name(port));
+		drm_dbg_kms(&dev_priv->drm,
+			    "Using DDC pin 0x%x for port %c (VBT)\n",
+			    ddc_pin, port_name(port));
 		return ddc_pin;
 	}
 
@@ -3093,8 +3153,9 @@ static u8 intel_hdmi_ddc_pin(struct intel_encoder *encoder)
 	else
 		ddc_pin = g4x_port_to_ddc_pin(dev_priv, port);
 
-	DRM_DEBUG_KMS("Using DDC pin 0x%x for port %c (platform default)\n",
-		      ddc_pin, port_name(port));
+	drm_dbg_kms(&dev_priv->drm,
+		    "Using DDC pin 0x%x for port %c (platform default)\n",
+		    ddc_pin, port_name(port));
 
 	return ddc_pin;
 }
@@ -3151,8 +3212,9 @@ void intel_hdmi_init_connector(struct intel_digital_port *intel_dig_port,
 	enum port port = intel_encoder->port;
 	struct cec_connector_info conn_info;
 
-	DRM_DEBUG_KMS("Adding HDMI connector on [ENCODER:%d:%s]\n",
-		      intel_encoder->base.base.id, intel_encoder->base.name);
+	drm_dbg_kms(&dev_priv->drm,
+		    "Adding HDMI connector on [ENCODER:%d:%s]\n",
+		    intel_encoder->base.base.id, intel_encoder->base.name);
 
 	if (INTEL_GEN(dev_priv) < 12 && drm_WARN_ON(dev, port == PORT_A))
 		return;
@@ -3195,7 +3257,8 @@ void intel_hdmi_init_connector(struct intel_digital_port *intel_dig_port,
 		int ret = intel_hdcp_init(intel_connector,
 					  &intel_hdmi_hdcp_shim);
 		if (ret)
-			DRM_DEBUG_KMS("HDCP init failed, skipping.\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "HDCP init failed, skipping.\n");
 	}
 
 	/* For G4X desktop chip, PEG_BAND_GAP_DATA 3:0 must first be written
@@ -3214,7 +3277,7 @@ void intel_hdmi_init_connector(struct intel_digital_port *intel_dig_port,
 		cec_notifier_conn_register(dev->dev, port_identifier(port),
 					   &conn_info);
 	if (!intel_hdmi->cec_notifier)
-		DRM_DEBUG_KMS("CEC notifier get failed\n");
+		drm_dbg_kms(&dev_priv->drm, "CEC notifier get failed\n");
 }
 
 static enum intel_hotplug_state
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
