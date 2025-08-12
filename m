Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F18EB220A4
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 10:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7782610E5D5;
	Tue, 12 Aug 2025 08:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Feeee8Fy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665F710E5C5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 08:23:09 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-7682560a2f2so5355382b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 01:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1754986989; x=1755591789;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2+ApBBIww/CD03e0b3YPmz5HPcIxQrsuvUlv8WI11Ow=;
 b=Feeee8Fyg3uBG7jNKFpsUNxYZsyvLBXjqMm5mUwnYwAj8kCovKu7GI1frzWLFJ9arP
 Iu0PJn0bUgVCribHbjTh/3OOCPqIcHFml8k2ABA5gfPENfCZjvv2LF0cmv/QyMxQucSY
 hnHvHfvEKCup/MS0rrwKuDlJnIZlvkF9kpV7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754986989; x=1755591789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2+ApBBIww/CD03e0b3YPmz5HPcIxQrsuvUlv8WI11Ow=;
 b=TMyh1U28/wTbkAETyH7jtY51W9pafKWPfv+8k2UplfW5ENEs+YEGHXMDMzKZj6QjSM
 aAclXfppGZQjwMpRmK4ZNnPwRsHGORdycsAVYHlv4AtG8y1YSiSgWtdHKO0fKEGTrTb7
 oxb0EVGnTH8gCKxmCawzPNgfTB+xagOG8QGyke0SWbMDXfwZ7ME8kwrED44hQOTNOnrv
 UZgiZjMXhGbii8tdFwC6w2osrHuAbbF2FljXh4vx+GzHCbdMdvtRcCmoP30RF5qQTI++
 NGn+HWsy8+vNqp6+71VM+2Ka9HKjV521F65MXne4lGeQi6UOt9uvJAyjnWDdwDk0onbg
 Oy5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW83Tp8+cgAS/E0QZ37orFK///8z7U6Fs2aTUR8Dxzc1nC8JPY3Xc/Eoy1URzEEtQFZ2R+gxFSIkUk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQ7pNrnkTmUIy8/3w4fONePNgoySnyS0NKNVGZh59tFg5PbTxf
 aDe4qFJOJTJy/9NGBq3JKx+AczYHDfaY64iBFSu1FlbokLqpjXhjReV8yWvzZK4t4w==
X-Gm-Gg: ASbGnctjmY1vcPjapSM0yQUe8Zd0R/TsIMHMJDmNrIqzeZ4a1L+4pJCnnr/sj3X7FmH
 m8uMywUEVAGAfyn1SMEYANSY79E+mUMCfhg1kJetDHOryIR9VlSjQKs1Nufo98l3LFAwet/UIfI
 QOsYrO/37kB6WWjAUVjwlEOnP2QbEiB7fDe/pSEqETqOXnn3MKC3XG/qZFitI7fybanNepy1iLn
 3SZPQi1nxrJV+OqZ/q5Frg5v4nNS8lNSi56XEaR64eyrqHIhrX4U+X67K0uEpSf6GIDAL6wn8Ch
 NcuVs8S7XdhQoHZ6C9GccrocUFk4zQdtM8YFP+ZDjasTG8Ndd6GosJq+iCqpnJiFH6GrVKBg1bV
 N641fgmriP531XosoJwRmyFQYE1ddnysH6bjpzWQT
X-Google-Smtp-Source: AGHT+IFBxmWzFIiHhb5XfrGSojOd5d60/WZ6emuFjM8ECLdSIxa2VC0bJOfLpoOVpWHpRQX+LCpt0A==
X-Received: by 2002:aa7:9888:0:b0:76b:fdac:d884 with SMTP id
 d2e1a72fcca58-76e0de69077mr2857234b3a.3.1754986988784; 
 Tue, 12 Aug 2025 01:23:08 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com
 ([2401:fa00:1:10:8e8:f5ef:865c:a4fa])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bf77210aesm22722064b3a.113.2025.08.12.01.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 01:23:08 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Hubert Mazur <hmazur@google.com>, Sean Paul <seanpaul@chromium.org>,
 Fei Shao <fshao@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/2] drm_bridge: register content protect property
Date: Tue, 12 Aug 2025 16:17:58 +0800
Message-ID: <20250812082135.3351172-2-fshao@chromium.org>
X-Mailer: git-send-email 2.51.0.rc0.205.g4a044479a3-goog
In-Reply-To: <20250812082135.3351172-1-fshao@chromium.org>
References: <20250812082135.3351172-1-fshao@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hsin-Yi Wang <hsinyi@chromium.org>

Some bridges can update HDCP status based on userspace requests if they
support HDCP.

The HDCP property is created after connector initialization and before
registration, just like other connector properties.

Add the content protection property to the connector if a bridge
supports HDCP.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Signed-off-by: Fei Shao <fshao@chromium.org>
Reviewed-by: Sean Paul <seanpaul@chromium.org>
---

Changes in v8:
- rebase on top of next-20250731

 drivers/gpu/drm/display/drm_bridge_connector.c | 9 +++++++++
 include/drm/drm_bridge.h                       | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 5eb7e9bfe361..20376d9616ec 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -20,6 +20,7 @@
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/display/drm_hdcp_helper.h>
 #include <drm/display/drm_hdmi_audio_helper.h>
 #include <drm/display/drm_hdmi_cec_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
@@ -641,6 +642,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	struct drm_bridge *bridge, *panel_bridge = NULL;
 	unsigned int supported_formats = BIT(HDMI_COLORSPACE_RGB);
 	unsigned int max_bpc = 8;
+	bool support_hdcp = false;
 	int connector_type;
 	int ret;
 
@@ -763,6 +765,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 
 		if (drm_bridge_is_panel(bridge))
 			panel_bridge = bridge;
+
+		if (bridge->support_hdcp)
+			support_hdcp = true;
 	}
 
 	if (connector_type == DRM_MODE_CONNECTOR_Unknown)
@@ -845,6 +850,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (panel_bridge)
 		drm_panel_bridge_set_orientation(connector, panel_bridge);
 
+	if (support_hdcp && IS_REACHABLE(CONFIG_DRM_DISPLAY_HELPER) &&
+	    IS_ENABLED(CONFIG_DRM_DISPLAY_HDCP_HELPER))
+		drm_connector_attach_content_protection_property(connector, true);
+
 	return connector;
 }
 EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 8ed80cad77ec..c0c02d65a3fb 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1122,6 +1122,10 @@ struct drm_bridge {
 	 * before the peripheral.
 	 */
 	bool pre_enable_prev_first;
+	/**
+	 * @support_hdcp: Indicate that the bridge supports HDCP.
+	 */
+	bool support_hdcp;
 	/**
 	 * @ddc: Associated I2C adapter for DDC access, if any.
 	 */
-- 
2.51.0.rc0.205.g4a044479a3-goog

