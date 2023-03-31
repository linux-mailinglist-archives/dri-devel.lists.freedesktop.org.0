Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC5E6D1B89
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D35E10F163;
	Fri, 31 Mar 2023 09:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D8A10F15E
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:12:13 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id l7so19826830pjg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 02:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680253933;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gGGKzbmOJHJetpV86XjzHcSuJS44DGDhzc2Zyy/6+EA=;
 b=dO5oclukP9Hc87eAuOzY3zJxCUvCHr3IQ+MxPHosVX7RFpsvr4Cc0hc0AutQlxYUNP
 YJY9975a7P6kaFPX9Qvza02NPlbly+R51XW0fqt8oQnKPtzehn1YNDQaJc+Uoqxqbohr
 oRNrJNJaiPIk4I3yGf/5JjKMqacRG7uQIPI8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680253933;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gGGKzbmOJHJetpV86XjzHcSuJS44DGDhzc2Zyy/6+EA=;
 b=mBKLRz+5oYKIllY8gQ6IzW2nvkZaC0KuBMuiaMZpUDACqiU4sWvvFDfEG4o9PYdAEv
 elM9mXt8iJGdto6rt89pyKwCI9ildNqR42T9bmbrBiMFgjqoYZEMMqm1R2R4OFI6dSv6
 ZHcObvWZyLN6bLU2WbGZdfbDUhSK6dnvfkUNlJba7tParYvddAiCB3aa1mH2Sk1K+6hh
 oFHMQVf39OKs9XzVVgLeZ7mhuVpo4NVyz9cWFlq5NqbOd0EpCEkFviptGGNUXJHN9Iq/
 k85pwb+Hq1ioXMmw0+tSYXVOWK+o9U6n1dn8OHZVsNdjVy9zklei0NmGvDBRsMvG68AD
 WiBA==
X-Gm-Message-State: AO0yUKUSOfuBEOpXNbYCcU4krYXcRMFzzU4u9tUmwPX2+7zsQkO4w4Vo
 K4IU3Z+0aKRlqCxkx3WUYT3OZA==
X-Google-Smtp-Source: AK7set9ffTvrotQskTIuIrIDRoEX5dekzioLmBROkDGnKiTg7HaN5DAhFntLCmUaaBVHsqnyTaLKEg==
X-Received: by 2002:a05:6a20:811a:b0:db:d1d5:1e00 with SMTP id
 g26-20020a056a20811a00b000dbd1d51e00mr22479443pza.60.1680253933245; 
 Fri, 31 Mar 2023 02:12:13 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:ae9d:db7a:8a71:d458])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a62e506000000b006227c3d5e29sm1360905pff.16.2023.03.31.02.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 02:12:13 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v15 03/10] drm/display: Add Type-C switch helpers
Date: Fri, 31 Mar 2023 17:11:38 +0800
Message-Id: <20230331091145.737305-4-treapking@chromium.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230331091145.737305-1-treapking@chromium.org>
References: <20230331091145.737305-1-treapking@chromium.org>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, YueHaibing <yuehaibing@huawei.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Jani Nikula <jani.nikula@intel.com>,
 Stephen Boyd <swboyd@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 David Zhang <dingchen.zhang@amd.com>, Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add helpers to register and unregister Type-C "switches" for bridges
capable of switching their output between two downstream devices.

The helper registers USB Type-C mode switches when the "mode-switch"
and the "reg" properties are available in Device Tree.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v15:
- Change the struct definition order for the Type-C switch helpers
- Fix style issues
- Updated the docs for the return value
- Updated the description in Kconfig
- Use dev_name as the typec_mux name

Changes in v14:
- Introduce a new Kconfig because it didn't build when CONFIG_TYPEC=m
- Add comments about devm_* usage
- Fix style issues

Changes in v13:
- Add typec_mode_switch_node_count helper
- Fix style issues

Changes in v12:
- Add fwnode_for_each_typec_mode_switch macro
- Remove a duplicated dmesg in the helper
- Used IS_REACHABLE instead to guard the function signatures

Changes in v11:
- Use fwnode helpers instead of DT
- Moved the helpers to a new file
- Use "reg" instead of "data-lanes" to determine the port number
- Dropped collected tags due to new changes

Changes in v10:
- Collected Reviewed-by and Tested-by tags
- Replaced "void *" with "typec_mux_set_fn_t" for mux_set callbacks
- Print out the node name when errors on parsing DT
- Use dev_dbg instead of dev_warn when no Type-C switch nodes available
- Made the return path of drm_dp_register_mode_switch clearer

Changes in v8:
- Fixed the build issue when CONFIG_TYPEC=m
- Fixed some style issues

Changes in v7:
- Extracted the common codes to a helper function
- New in v7

 drivers/gpu/drm/display/Kconfig               |   8 ++
 drivers/gpu/drm/display/Makefile              |   2 +
 drivers/gpu/drm/display/drm_dp_typec_helper.c | 107 ++++++++++++++++++
 include/drm/display/drm_dp_helper.h           |  46 ++++++++
 4 files changed, 163 insertions(+)
 create mode 100644 drivers/gpu/drm/display/drm_dp_typec_helper.c

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 09712b88a5b8..4eaf00380a1f 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -29,6 +29,14 @@ config DRM_DISPLAY_HDMI_HELPER
 	help
 	  DRM display helpers for HDMI.
 
+config DRM_DISPLAY_DP_TYPEC_HELPER
+	def_bool y
+	depends on DRM_DISPLAY_HELPER
+	depends on DRM_DISPLAY_HELPER=TYPEC || TYPEC=y
+	help
+	  Choose this option to enable helpers for registering USB Type-C
+	  switches when USB Type-C DisplayPort Alternate mode is used.
+
 config DRM_DP_AUX_CHARDEV
 	bool "DRM DP AUX Interface"
 	depends on DRM && DRM_DISPLAY_HELPER
diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index 17ac4a1006a8..2202a6aea38e 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -8,6 +8,8 @@ drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_HELPER) += \
 	drm_dp_helper.o \
 	drm_dp_mst_topology.o \
 	drm_dsc_helper.o
+drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_TYPEC_HELPER) += \
+	drm_dp_typec_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDCP_HELPER) += drm_hdcp_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_HELPER) += \
 	drm_hdmi_helper.o \
diff --git a/drivers/gpu/drm/display/drm_dp_typec_helper.c b/drivers/gpu/drm/display/drm_dp_typec_helper.c
new file mode 100644
index 000000000000..48c1bbf57b2d
--- /dev/null
+++ b/drivers/gpu/drm/display/drm_dp_typec_helper.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/usb/typec_mux.h>
+#include <drm/display/drm_dp_helper.h>
+
+static int drm_dp_register_mode_switch(struct device *dev,
+				       struct fwnode_handle *fwnode,
+				       struct drm_dp_typec_switch_desc *switch_desc,
+				       void *data, typec_mux_set_fn_t mux_set)
+{
+	struct drm_dp_typec_port_data *port_data;
+	struct typec_mux_desc mux_desc = {};
+	char name[32];
+	u32 port_num;
+	int ret;
+
+	ret = fwnode_property_read_u32(fwnode, "reg", &port_num);
+	if (ret) {
+		dev_err(dev, "Failed to read reg property: %d\n", ret);
+		return ret;
+	}
+
+	port_data = &switch_desc->typec_ports[port_num];
+	port_data->data = data;
+	port_data->port_num = port_num;
+	port_data->fwnode = fwnode;
+	mux_desc.fwnode = fwnode;
+	mux_desc.drvdata = port_data;
+	snprintf(name, sizeof(name), "%s-%u", dev_name(dev), port_num);
+	mux_desc.name = name;
+	mux_desc.set = mux_set;
+
+	port_data->typec_mux = typec_mux_register(dev, &mux_desc);
+	ret = PTR_ERR_OR_ZERO(port_data->typec_mux);
+	if (ret)
+		dev_err(dev, "Mode switch register for port %d failed: %d\n",
+			port_num, ret);
+
+	return ret;
+}
+
+/**
+ * drm_dp_register_typec_switches() - register Type-C switches
+ * @dev: Device that registers Type-C switches
+ * @port: Device node for the switch
+ * @switch_desc: A Type-C switch descriptor
+ * @data: Private data for the switches
+ * @mux_set: Callback function for typec_mux_set
+ *
+ * This function registers USB Type-C switches for DP bridges that can switch
+ * the output signal between their output pins. This function uses devm_kcalloc
+ * to allocate memory, so it is expected to only call this in the driver probe
+ * functions.
+ *
+ * Currently only mode switches are implemented, and the function assumes the
+ * given @port device node has endpoints with "mode-switch" property.
+ * The port number is determined by the "reg" property of the endpoint.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int drm_dp_register_typec_switches(struct device *dev, struct fwnode_handle *port,
+				   struct drm_dp_typec_switch_desc *switch_desc,
+				   void *data, typec_mux_set_fn_t mux_set)
+{
+	struct fwnode_handle *sw;
+	int ret;
+
+	switch_desc->num_typec_switches = typec_mode_switch_node_count(port);
+	if (!switch_desc->num_typec_switches) {
+		dev_dbg(dev, "No Type-C switches node found\n");
+		return 0;
+	}
+
+	switch_desc->typec_ports = devm_kcalloc(dev, switch_desc->num_typec_switches,
+						sizeof(*switch_desc->typec_ports),
+						GFP_KERNEL);
+	if (!switch_desc->typec_ports)
+		return -ENOMEM;
+
+	/* Register switches for each connector. */
+	for_each_typec_mode_switch_node(port, sw) {
+		ret = drm_dp_register_mode_switch(dev, sw, switch_desc, data, mux_set);
+		if (ret)
+			goto err_unregister_typec_switches;
+	}
+
+	return 0;
+
+err_unregister_typec_switches:
+	fwnode_handle_put(sw);
+	drm_dp_unregister_typec_switches(switch_desc);
+	return ret;
+}
+EXPORT_SYMBOL(drm_dp_register_typec_switches);
+
+/**
+ * drm_dp_unregister_typec_switches() - unregister Type-C switches
+ * @switch_desc: A Type-C switch descriptor
+ */
+void drm_dp_unregister_typec_switches(struct drm_dp_typec_switch_desc *switch_desc)
+{
+	unsigned int i;
+
+	for (i = 0; i < switch_desc->num_typec_switches; i++)
+		typec_mux_unregister(switch_desc->typec_ports[i].typec_mux);
+}
+EXPORT_SYMBOL(drm_dp_unregister_typec_switches);
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index ab55453f2d2c..8c2d50c05335 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -25,6 +25,7 @@
 
 #include <linux/delay.h>
 #include <linux/i2c.h>
+#include <linux/usb/typec_mux.h>
 
 #include <drm/display/drm_dp.h>
 #include <drm/drm_connector.h>
@@ -763,4 +764,49 @@ bool drm_dp_downstream_rgb_to_ycbcr_conversion(const u8 dpcd[DP_RECEIVER_CAP_SIZ
 					       const u8 port_cap[4], u8 color_spc);
 int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8 color_spc);
 
+struct drm_dp_typec_port_data {
+	struct typec_mux_dev *typec_mux;
+	struct fwnode_handle *fwnode;
+	void *data;
+	int port_num;
+};
+
+struct drm_dp_typec_switch_desc {
+	struct drm_dp_typec_port_data *typec_ports;
+	int num_typec_switches;
+};
+
+#define for_each_typec_mode_switch_node(port, sw)	\
+	fwnode_for_each_child_node((port), (sw))	\
+		for_each_if(fwnode_property_present((sw), "mode-switch"))
+
+static inline unsigned int typec_mode_switch_node_count(struct fwnode_handle *port)
+{
+	struct fwnode_handle *sw;
+	unsigned int count = 0;
+
+	for_each_typec_mode_switch_node(port, sw)
+		count++;
+
+	return count;
+}
+
+#ifdef CONFIG_DRM_DISPLAY_DP_TYPEC_HELPER
+void drm_dp_unregister_typec_switches(struct drm_dp_typec_switch_desc *switch_desc);
+int drm_dp_register_typec_switches(struct device *dev, struct fwnode_handle *port,
+				   struct drm_dp_typec_switch_desc *switch_desc,
+				   void *data, typec_mux_set_fn_t mux_set);
+#else
+static inline void drm_dp_unregister_typec_switches(struct drm_dp_typec_switch_desc *switch_desc)
+{
+}
+static inline int drm_dp_register_typec_switches(
+		struct device *dev, struct fwnode_handle *port,
+		struct drm_dp_typec_switch_desc *switch_desc, void *data,
+		typec_mux_set_fn_t mux_set)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
 #endif /* _DRM_DP_HELPER_H_ */
-- 
2.40.0.348.gf938b09366-goog

