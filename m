Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 054F2C26F20
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 21:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425BD10E309;
	Fri, 31 Oct 2025 20:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="TVcKljdn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f73.google.com (mail-yx1-f73.google.com
 [74.125.224.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1238010E309
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 20:45:40 +0000 (UTC)
Received: by mail-yx1-f73.google.com with SMTP id
 956f58d0204a3-63610e0c8eeso3635629d50.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 13:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1761943539; x=1762548339;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=dAFZN1qzmVhhaKz6NVC3iiBzUvV2f7Uo61GpVfWUGSI=;
 b=TVcKljdnlU9QTbtV/u3qsAu/fiiwQKEn0XOf9Doj9lkbF+Xxmhtp9XPAZbeqmD0N2H
 L1qYnwiXkEEZasOKRfM/8buy+R97ehF2eJc6L3UJYH+8YSkgtktZPZgtdAwk3v0ZJNGn
 J7LPHCHCLEklLW1odKCKRpz8lhTJLW4vyVVfJAofDS/KarCI/0O60J5EntUtLeeI2rtU
 z8PU0jHo4BSVFHsK1NeKUKjESi9btA/kbitueQhCd4FB8XJwXvQfGJ8lHLNOQJzLIF8N
 Enf4DWe8tdP7gp8Pf1r9vw1VlJawK3sBazXyLi0W6CpEU8MP11z57xu4KeUfJ1LDaebL
 +4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761943539; x=1762548339;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dAFZN1qzmVhhaKz6NVC3iiBzUvV2f7Uo61GpVfWUGSI=;
 b=VZIebvZ0YPQ+K3HN0/K7KhusWdE7+N+GfsOnXQWLRYfJiujTztIvpVxF42JmB6uG5E
 A8nDTKRP5bs4VfrBmh41uLcAJPP2rtQdhaTcnhAUMtiWA4cirINO2mwqkB0bk4cRHQuW
 WAOOZmLP+5rIMUhbfe/dPNGplAG32wDob9pPa4Bdu8gd0tILy/WDgXxvCWJCWXTtvKPd
 a/PXfWv458C/vSTTP2oX2Z1hjbHRNR1joMvf5V4FZOslmi0KaXhW6A3Uw/AmrVwKH/7s
 kSqQopfu48bA0HM8J9zfPUPumK6cZjY5J1eL6g+bLC2gb7x+QN6nedQeJN9OcrXaw52C
 8z4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFuX432v6WAVEiNwtLZTfTZfYMBwSL+/QgS50UPeWQTLKu39lMgc4jDNGCqBN+JRHXH30gl8daeTc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwO9qlbGTAzfsR5V4/KPmdECB5GNPHvzYm3PU0nV0dgCcjIJMdQ
 wC+RFT2jRQZ08sda6Iwj2uTGVDqRf+B4jxRrEer6kHRh+bm+3AS2HegrGkPZshJlDVmjthH5Y3M
 Zp9xJGIue/DIlWNvyDbm9rMUHQ0eRxKYuTA==
X-Google-Smtp-Source: AGHT+IEkRglqY0knltuXPsTfhSVZFHRqw+oV9Ee7qClLBpsRzP1xsh0CriK/LzSnTmZ08nYFjF7zFGwiuiYXmqafGmJt
X-Received: from yxtc1.prod.google.com ([2002:a53:ab01:0:b0:63f:2d9a:652d])
 (user=sashamcintosh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:690e:c4b:b0:63f:99b1:3a83 with SMTP id
 956f58d0204a3-63f99b13cb8mr2553010d50.61.1761943538406; 
 Fri, 31 Oct 2025 13:45:38 -0700 (PDT)
Date: Fri, 31 Oct 2025 16:45:34 -0400
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251031204534.659180-1-sashamcintosh@google.com>
Subject: [PATCH] drm: Add "min bpc" connector property
From: Sasha McIntosh <sashamcintosh@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, trivial@kernel.org, 
 Sasha McIntosh <sashamcintosh@google.com>
Content-Type: text/plain; charset="UTF-8"
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

[Why]
When playing HDR or WCG content, bandwidth constraints may force the
driver to downgrade to 6bpc, resulting in visual artifacts like banding.

Userspace should be able to configure a minimum allowed bpc.

[How]
Introduce the "min bpc" connector property so the user can limit the
minimum bpc. Mirror the "mac bpc" implementation.

Signed-off-by: Sasha McIntosh <sashamcintosh@google.com>
---
 drivers/gpu/drm/drm_atomic.c        | 12 +++++++++
 drivers/gpu/drm/drm_atomic_helper.c |  4 +++
 drivers/gpu/drm/drm_atomic_uapi.c   |  4 +++
 drivers/gpu/drm/drm_connector.c     | 41 +++++++++++++++++++++++++++++
 include/drm/drm_connector.h         | 20 ++++++++++++++
 5 files changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index be2cb6e43cb0..f85ad9c55e69 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -468,6 +468,17 @@ static int drm_atomic_connector_check(struct drm_connector *connector,
 	state->max_bpc = info->bpc ? info->bpc : 8;
 	if (connector->max_bpc_property)
 		state->max_bpc = min(state->max_bpc, state->max_requested_bpc);
+	if (connector->min_bpc_property)
+		state->min_bpc = state->min_requested_bpc;
+	if (connector->max_bpc_property && connector->min_bpc_property &&
+	    state->max_requested_bpc < state->min_requested_bpc) {
+		drm_dbg_atomic(connector->dev,
+			       "[CONNECTOR:%d:%s] max bpc %d < min bpc %d\n",
+			       connector->base.id, connector->name,
+			       state->max_requested_bpc,
+			       state->min_requested_bpc);
+		return -EINVAL;
+	}
 
 	if ((connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK) || !writeback_job)
 		return 0;
@@ -1195,6 +1206,7 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
 	drm_printf(p, "\tinterlace_allowed=%d\n", connector->interlace_allowed);
 	drm_printf(p, "\tycbcr_420_allowed=%d\n", connector->ycbcr_420_allowed);
 	drm_printf(p, "\tmax_requested_bpc=%d\n", state->max_requested_bpc);
+	drm_printf(p, "\tmin_requested_bpc=%d\n", state->min_requested_bpc);
 	drm_printf(p, "\tcolorspace=%s\n", drm_get_colorspace_name(state->colorspace));
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 5a473a274ff0..75659d46c6fe 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -736,6 +736,10 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 			if (old_connector_state->max_requested_bpc !=
 			    new_connector_state->max_requested_bpc)
 				new_crtc_state->connectors_changed = true;
+
+			if (old_connector_state->min_requested_bpc !=
+			    new_connector_state->min_requested_bpc)
+				new_crtc_state->connectors_changed = true;
 		}
 
 		if (funcs->atomic_check)
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 85dbdaa4a2e2..f99649f9c51f 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -776,6 +776,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 						   fence_ptr);
 	} else if (property == connector->max_bpc_property) {
 		state->max_requested_bpc = val;
+	} else if (property == connector->min_bpc_property) {
+		state->min_requested_bpc = val;
 	} else if (property == connector->privacy_screen_sw_state_property) {
 		state->privacy_screen_sw_state = val;
 	} else if (property == connector->broadcast_rgb_property) {
@@ -861,6 +863,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		*val = 0;
 	} else if (property == connector->max_bpc_property) {
 		*val = state->max_requested_bpc;
+	} else if (property == connector->min_bpc_property) {
+		*val = state->min_requested_bpc;
 	} else if (property == connector->privacy_screen_sw_state_property) {
 		*val = state->privacy_screen_sw_state;
 	} else if (property == connector->broadcast_rgb_property) {
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 272d6254ea47..2d9cfd4f5118 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1699,6 +1699,13 @@ EXPORT_SYMBOL(drm_hdmi_connector_get_output_format_name);
  *	drm_connector_attach_max_bpc_property() to create and attach the
  *	property to the connector during initialization.
  *
+ * min bpc:
+ *	This range property is used by userspace to set a lower bound for the bit
+ *	depth. When used the driver would set the bpc in accordance with the
+ *	valid range supported by the hardware and sink. Drivers to use the function
+ *	drm_connector_attach_min_bpc_property() to create and attach the
+ *	property to the connector during initialization.
+ *
  * Connectors also have one standardized atomic property:
  *
  * CRTC_ID:
@@ -2845,6 +2852,40 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
 
+/**
+ * drm_connector_attach_min_bpc_property - attach "min bpc" property
+ * @connector: connector to attach min bpc property on.
+ * @min: The minimum bit depth supported by the connector.
+ * @max: The maximum bit depth supported by the connector.
+ *
+ * This is used to add support for limiting the bit depth on a connector.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_connector_attach_min_bpc_property(struct drm_connector *connector,
+					  int min, int max)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_property *prop;
+
+	prop = connector->min_bpc_property;
+	if (!prop) {
+		prop = drm_property_create_range(dev, 0, "min bpc", min, max);
+		if (!prop)
+			return -ENOMEM;
+
+		connector->min_bpc_property = prop;
+	}
+
+	drm_object_attach_property(&connector->base, prop, min);
+	connector->state->min_requested_bpc = min;
+	connector->state->min_bpc = min;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_attach_min_bpc_property);
+
 /**
  * drm_connector_attach_hdr_output_metadata_property - attach "HDR_OUTPUT_METADA" property
  * @connector: connector to attach the property on.
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8f34f4b8183d..7581f965b015 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1126,12 +1126,24 @@ struct drm_connector_state {
 	 */
 	u8 max_requested_bpc;
 
+	/**
+	 * @min_requested_bpc: Connector property to limit the minimum bit
+	 * depth of the pixels.
+	 */
+	u8 min_requested_bpc;
+
 	/**
 	 * @max_bpc: Connector max_bpc based on the requested max_bpc property
 	 * and the connector bpc limitations obtained from edid.
 	 */
 	u8 max_bpc;
 
+	/**
+	 * @min_bpc: Connector min_bpc based on the requested min_bpc property
+	 * and the connector bpc limitations obtained from edid.
+	 */
+	u8 min_bpc;
+
 	/**
 	 * @privacy_screen_sw_state: See :ref:`Standard Connector
 	 * Properties<standard_connector_properties>`
@@ -2079,6 +2091,12 @@ struct drm_connector {
 	 */
 	struct drm_property *max_bpc_property;
 
+	/**
+	 * @min_bpc_property: Default connector property for the min bpc to be
+	 * driven out of the connector.
+	 */
+	struct drm_property *min_bpc_property;
+
 	/** @privacy_screen: drm_privacy_screen for this connector, or NULL. */
 	struct drm_privacy_screen *privacy_screen;
 
@@ -2482,6 +2500,8 @@ int drm_connector_set_orientation_from_panel(
 	struct drm_panel *panel);
 int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 					  int min, int max);
+int drm_connector_attach_min_bpc_property(struct drm_connector *connector,
+					  int min, int max);
 void drm_connector_create_privacy_screen_properties(struct drm_connector *conn);
 void drm_connector_attach_privacy_screen_properties(struct drm_connector *conn);
 void drm_connector_attach_privacy_screen_provider(

base-commit: 098456f3141bf9e0c0d8973695ca38a03465ccd6
-- 
2.51.1.851.g4ebd6896fd-goog

