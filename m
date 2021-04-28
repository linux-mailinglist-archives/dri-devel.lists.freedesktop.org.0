Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CACE36D847
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 15:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1B946EB3E;
	Wed, 28 Apr 2021 13:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb3-smtp-cloud9.xs4all.net (lb3-smtp-cloud9.xs4all.net
 [194.109.24.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6793C6EB3B
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 13:25:53 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id bkCIlVh38k1MGbkCNlOQ2x; Wed, 28 Apr 2021 15:25:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1619616351; bh=txogdNJnAK5ZZvHg4JWCPDmxNJE9cyJBMBCq5F7LdzU=;
 h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
 b=Poxi8ziDv/rO5nvDuETRXuhPrHwi9D8LbPEqQIFfCy53ot4bL2mIUtlGpwXuRveeN
 xH061ttzHkhFnl7PyKkjQs0NcMDyF5BgdzS9IziBMyfgYPr6X9uxNEFwC+v8ZPOrFu
 NAb1JSbsD3CFO8XFSCMdgfIyflrcDTgrOx2cH5mIyw8RMji5tePCo2YDbfFRCT0lBc
 mioeyuUD2llAF68MxhlFdYpTLJSCasp6kWVpfy9tRMKmg/ww/5J2cFVtXDrDdz70+w
 560Ie6X9hNwCcflTlbqW0T7itlv/pNPJAkfI0GD9hp5/Jv7RlR1LpiIlieVeUatfPC
 Nk10z+n7pvvKw==
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCHv3 6/6] drm/omapdrm/dss/hdmi5: add CEC support
Date: Wed, 28 Apr 2021 15:25:45 +0200
Message-Id: <20210428132545.1205162-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210428132545.1205162-1-hverkuil-cisco@xs4all.nl>
References: <20210428132545.1205162-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNLevcGa/vJcvtKdvEIiHy92QMBtnAfp4gJ5oaF5BD04x2mRHL2FhkBxrDLGL/QF5SPbt8HI0K+xfQ1Qw3yCultLrCTAHCKvOnCJ77XntJwkqGsYDCER
 sMdKdN4TwFN5jfiE+O8c2mWa1O//6otapFxvm1OLdj09IsuKC/QCGSA/qF6vVY53j2xCnRo5Lq7lCRu0n37yP915eacPs3eg8MNrT38veFJyliJ21OK7Uilr
 pkPFu/GVH+PNhH6/SQ7W1AzJH0UU03vmbsf6mFmLutLALKGFgVN99IXSsXqxQ5U8CnYVj+A9R4oIESz5JCzoMkwPMtcn4sLmjjBDzQ4eMwyKkFMV1ukiI9Hy
 WcCcb+I4wbzjr8EJgAu5yT4YxF0PSzgZw/+Y+rgTQalM2ShZZyK73V2cE3uw8B7MudRkCYV1
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
Cc: Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add HDMI CEC support for OMAP5.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/Kconfig          |   8 +
 drivers/gpu/drm/omapdrm/Makefile         |   1 +
 drivers/gpu/drm/omapdrm/dss/hdmi.h       |   1 +
 drivers/gpu/drm/omapdrm/dss/hdmi5.c      |  64 +++++--
 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c  | 209 +++++++++++++++++++++++
 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h  |  42 +++++
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.c |  35 +++-
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.h |  33 +++-
 8 files changed, 374 insertions(+), 19 deletions(-)
 create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c
 create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h

diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
index e7281da5bc6a..08866ac7d869 100644
--- a/drivers/gpu/drm/omapdrm/Kconfig
+++ b/drivers/gpu/drm/omapdrm/Kconfig
@@ -80,6 +80,14 @@ config OMAP5_DSS_HDMI
 	  Definition Multimedia Interface. See http://www.hdmi.org/ for HDMI
 	  specification.
 
+config OMAP5_DSS_HDMI_CEC
+	bool "Enable HDMI CEC support for OMAP5"
+	depends on OMAP5_DSS_HDMI
+	select CEC_CORE
+	default y
+	help
+	  When selected the HDMI transmitter will support the CEC feature.
+
 config OMAP2_DSS_SDI
 	bool "SDI support"
 	default n
diff --git a/drivers/gpu/drm/omapdrm/Makefile b/drivers/gpu/drm/omapdrm/Makefile
index 21e8277ff88f..0732bd2dae1e 100644
--- a/drivers/gpu/drm/omapdrm/Makefile
+++ b/drivers/gpu/drm/omapdrm/Makefile
@@ -29,6 +29,7 @@ omapdrm-$(CONFIG_OMAP2_DSS_HDMI_COMMON) += dss/hdmi_common.o dss/hdmi_wp.o \
 omapdrm-$(CONFIG_OMAP4_DSS_HDMI) += dss/hdmi4.o dss/hdmi4_core.o
 omapdrm-$(CONFIG_OMAP4_DSS_HDMI_CEC) += dss/hdmi4_cec.o
 omapdrm-$(CONFIG_OMAP5_DSS_HDMI) += dss/hdmi5.o dss/hdmi5_core.o
+omapdrm-$(CONFIG_OMAP5_DSS_HDMI_CEC) += dss/hdmi5_cec.o
 ccflags-$(CONFIG_OMAP2_DSS_DEBUG) += -DDEBUG
 
 obj-$(CONFIG_DRM_OMAP) += omapdrm.o
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi.h b/drivers/gpu/drm/omapdrm/dss/hdmi.h
index c4a4e07f0b99..72d8ae441da6 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi.h
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi.h
@@ -261,6 +261,7 @@ struct hdmi_core_data {
 	struct hdmi_wp_data *wp;
 	unsigned int core_pwr_cnt;
 	struct cec_adapter *adap;
+	struct clk *cec_clk;
 };
 
 static inline void hdmi_write_reg(void __iomem *base_addr, const u32 idx,
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index 65085d886da5..11941d7b1d81 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -29,12 +29,14 @@
 #include <linux/of.h>
 #include <linux/of_graph.h>
 #include <sound/omap-hdmi-audio.h>
+#include <media/cec.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_state_helper.h>
 
 #include "omapdss.h"
 #include "hdmi5_core.h"
+#include "hdmi5_cec.h"
 #include "dss.h"
 
 static int hdmi_runtime_get(struct omap_hdmi *hdmi)
@@ -105,6 +107,9 @@ static irqreturn_t hdmi_irq_handler(int irq, void *data)
 		hdmi_wp_set_phy_pwr(wp, HDMI_PHYPWRCMD_LDOON);
 	}
 
+	if (irqstatus & HDMI_IRQ_CORE)
+		hdmi5_core_handle_irqs(&hdmi->core);
+
 	return IRQ_HANDLED;
 }
 
@@ -112,9 +117,12 @@ static int hdmi_power_on_core(struct omap_hdmi *hdmi)
 {
 	int r;
 
+	if (hdmi->core.core_pwr_cnt++)
+		return 0;
+
 	r = regulator_enable(hdmi->vdda_reg);
 	if (r)
-		return r;
+		goto err_reg_enable;
 
 	r = hdmi_runtime_get(hdmi);
 	if (r)
@@ -129,12 +137,17 @@ static int hdmi_power_on_core(struct omap_hdmi *hdmi)
 
 err_runtime_get:
 	regulator_disable(hdmi->vdda_reg);
+err_reg_enable:
+	hdmi->core.core_pwr_cnt--;
 
 	return r;
 }
 
 static void hdmi_power_off_core(struct omap_hdmi *hdmi)
 {
+	if (--hdmi->core.core_pwr_cnt)
+		return;
+
 	hdmi->core_enabled = false;
 
 	hdmi_runtime_put(hdmi);
@@ -168,9 +181,9 @@ static int hdmi_power_on_full(struct omap_hdmi *hdmi)
 		pc, &hdmi_cinfo);
 
 	/* disable and clear irqs */
-	hdmi_wp_clear_irqenable(&hdmi->wp, 0xffffffff);
+	hdmi_wp_clear_irqenable(&hdmi->wp, ~HDMI_IRQ_CORE);
 	hdmi_wp_set_irqstatus(&hdmi->wp,
-			hdmi_wp_get_irqstatus(&hdmi->wp));
+			hdmi_wp_get_irqstatus(&hdmi->wp) & ~HDMI_IRQ_CORE);
 
 	r = dss_pll_enable(&hdmi->pll.pll);
 	if (r) {
@@ -225,7 +238,7 @@ static int hdmi_power_on_full(struct omap_hdmi *hdmi)
 
 static void hdmi_power_off_full(struct omap_hdmi *hdmi)
 {
-	hdmi_wp_clear_irqenable(&hdmi->wp, 0xffffffff);
+	hdmi_wp_clear_irqenable(&hdmi->wp, ~HDMI_IRQ_CORE);
 
 	hdmi_wp_video_stop(&hdmi->wp);
 
@@ -273,11 +286,11 @@ static void hdmi_stop_audio_stream(struct omap_hdmi *hd)
 	REG_FLD_MOD(hd->wp.base, HDMI_WP_SYSCONFIG, hd->wp_idlemode, 3, 2);
 }
 
-static int hdmi_core_enable(struct omap_hdmi *hdmi)
+int hdmi5_core_enable(struct omap_hdmi *hdmi)
 {
 	int r = 0;
 
-	DSSDBG("ENTER omapdss_hdmi_core_enable\n");
+	DSSDBG("ENTER %s\n", __func__);
 
 	mutex_lock(&hdmi->lock);
 
@@ -295,9 +308,9 @@ static int hdmi_core_enable(struct omap_hdmi *hdmi)
 	return r;
 }
 
-static void hdmi_core_disable(struct omap_hdmi *hdmi)
+void hdmi5_core_disable(struct omap_hdmi *hdmi)
 {
-	DSSDBG("Enter omapdss_hdmi_core_disable\n");
+	DSSDBG("ENTER %s\n", __func__);
 
 	mutex_lock(&hdmi->lock);
 
@@ -424,6 +437,15 @@ static void hdmi5_bridge_disable(struct drm_bridge *bridge,
 	mutex_unlock(&hdmi->lock);
 }
 
+static void hdmi5_bridge_hpd_notify(struct drm_bridge *bridge,
+				    enum drm_connector_status status)
+{
+	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
+
+	if (status == connector_status_disconnected)
+		hdmi5_cec_set_phys_addr(&hdmi->core, NULL);
+}
+
 static struct edid *hdmi5_bridge_get_edid(struct drm_bridge *bridge,
 					  struct drm_connector *connector)
 {
@@ -436,7 +458,7 @@ static struct edid *hdmi5_bridge_get_edid(struct drm_bridge *bridge,
 	need_enable = hdmi->core_enabled == false;
 
 	if (need_enable) {
-		r = hdmi_core_enable(hdmi);
+		r = hdmi5_core_enable(hdmi);
 		if (r)
 			return NULL;
 	}
@@ -460,12 +482,31 @@ static struct edid *hdmi5_bridge_get_edid(struct drm_bridge *bridge,
 	hdmi_runtime_put(hdmi);
 	mutex_unlock(&hdmi->lock);
 
+	hdmi5_cec_set_phys_addr(&hdmi->core, edid);
+
 	if (need_enable)
-		hdmi_core_disable(hdmi);
+		hdmi5_core_disable(hdmi);
 
 	return (struct edid *)edid;
 }
 
+static int hdmi5_bridge_connector_attach(struct drm_bridge *bridge,
+					 struct drm_connector *conn)
+{
+	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
+
+	hdmi5_cec_init(hdmi->pdev, &hdmi->core, &hdmi->wp, conn);
+	return 0;
+}
+
+static void hdmi5_bridge_connector_detach(struct drm_bridge *bridge,
+					  struct drm_connector *conn)
+{
+	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
+
+	hdmi5_cec_uninit(&hdmi->core);
+}
+
 static const struct drm_bridge_funcs hdmi5_bridge_funcs = {
 	.attach = hdmi5_bridge_attach,
 	.mode_set = hdmi5_bridge_mode_set,
@@ -474,7 +515,10 @@ static const struct drm_bridge_funcs hdmi5_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_enable = hdmi5_bridge_enable,
 	.atomic_disable = hdmi5_bridge_disable,
+	.hpd_notify = hdmi5_bridge_hpd_notify,
 	.get_edid = hdmi5_bridge_get_edid,
+	.connector_attach = hdmi5_bridge_connector_attach,
+	.connector_detach = hdmi5_bridge_connector_detach,
 };
 
 static void hdmi5_bridge_init(struct omap_hdmi *hdmi)
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c b/drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c
new file mode 100644
index 000000000000..9df6805a5cb4
--- /dev/null
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * HDMI CEC
+ *
+ * Copyright 2019 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
+ */
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/clk.h>
+
+#include "dss.h"
+#include "hdmi.h"
+#include "hdmi5_core.h"
+#include "hdmi5_cec.h"
+
+static int hdmi5_cec_log_addr(struct cec_adapter *adap, u8 logical_addr)
+{
+	struct hdmi_core_data *core = cec_get_drvdata(adap);
+	u8 v;
+
+	if (logical_addr == CEC_LOG_ADDR_INVALID) {
+		hdmi_write_reg(core->base, HDMI_CORE_CEC_ADDR_L, 0);
+		hdmi_write_reg(core->base, HDMI_CORE_CEC_ADDR_H, 0);
+
+		return 0;
+	}
+
+	if (logical_addr <= 7) {
+		v = hdmi_read_reg(core->base, HDMI_CORE_CEC_ADDR_L);
+		v |= 1 << logical_addr;
+		hdmi_write_reg(core->base, HDMI_CORE_CEC_ADDR_L, v);
+		v = hdmi_read_reg(core->base, HDMI_CORE_CEC_ADDR_H);
+		v |= 1 << 7;
+		hdmi_write_reg(core->base, HDMI_CORE_CEC_ADDR_H, v);
+	} else {
+		v = hdmi_read_reg(core->base, HDMI_CORE_CEC_ADDR_H);
+		v |= 1 << (logical_addr - 8);
+		v |= 1 << 7;
+		hdmi_write_reg(core->base, HDMI_CORE_CEC_ADDR_H, v);
+	}
+
+	return 0;
+}
+
+static int hdmi5_cec_transmit(struct cec_adapter *adap, u8 attempts,
+			      u32 signal_free_time, struct cec_msg *msg)
+{
+	struct hdmi_core_data *core = cec_get_drvdata(adap);
+	unsigned int i, ctrl;
+
+	switch (signal_free_time) {
+	case CEC_SIGNAL_FREE_TIME_RETRY:
+		ctrl = CEC_CTRL_RETRY;
+		break;
+	case CEC_SIGNAL_FREE_TIME_NEW_INITIATOR:
+	default:
+		ctrl = CEC_CTRL_NORMAL;
+		break;
+	case CEC_SIGNAL_FREE_TIME_NEXT_XFER:
+		ctrl = CEC_CTRL_IMMED;
+		break;
+	}
+
+	for (i = 0; i < msg->len; i++)
+		hdmi_write_reg(core->base,
+			       HDMI_CORE_CEC_TX_DATA0 + i * 4, msg->msg[i]);
+
+	hdmi_write_reg(core->base, HDMI_CORE_CEC_TX_CNT, msg->len);
+	hdmi_write_reg(core->base, HDMI_CORE_CEC_CTRL,
+		       ctrl | CEC_CTRL_START);
+
+	return 0;
+}
+
+void hdmi5_cec_irq(struct hdmi_core_data *core, unsigned int stat)
+{
+	struct cec_adapter *adap = core->adap;
+
+	if (stat & CEC_STAT_ERROR_INIT)
+		cec_transmit_attempt_done(adap, CEC_TX_STATUS_ERROR);
+	else if (stat & CEC_STAT_DONE)
+		cec_transmit_attempt_done(adap, CEC_TX_STATUS_OK);
+	else if (stat & CEC_STAT_NACK)
+		cec_transmit_attempt_done(adap, CEC_TX_STATUS_NACK);
+
+	if (stat & CEC_STAT_EOM) {
+		struct cec_msg msg = {};
+		unsigned int len, i;
+
+		len = hdmi_read_reg(core->base, HDMI_CORE_CEC_RX_CNT);
+		if (len > sizeof(msg.msg))
+			len = sizeof(msg.msg);
+
+		for (i = 0; i < len; i++)
+			msg.msg[i] =
+				hdmi_read_reg(core->base,
+					      HDMI_CORE_CEC_RX_DATA0 + i * 4);
+
+		hdmi_write_reg(core->base, HDMI_CORE_CEC_LOCK, 0);
+
+		msg.len = len;
+		cec_received_msg(adap, &msg);
+	}
+}
+
+static int hdmi5_cec_enable(struct cec_adapter *adap, bool enable)
+{
+	struct hdmi_core_data *core = cec_get_drvdata(adap);
+	struct omap_hdmi *hdmi = container_of(core, struct omap_hdmi, core);
+	unsigned int irqs;
+	int err;
+
+	if (!enable) {
+		hdmi_write_reg(core->base, HDMI_CORE_CEC_MASK, ~0);
+		hdmi_write_reg(core->base, HDMI_CORE_IH_MUTE_CEC_STAT0, ~0);
+		hdmi_wp_clear_irqenable(core->wp, HDMI_IRQ_CORE);
+		hdmi_wp_set_irqstatus(core->wp, HDMI_IRQ_CORE);
+		REG_FLD_MOD(core->base, HDMI_CORE_MC_CLKDIS, 0x01, 5, 5);
+		hdmi5_core_disable(hdmi);
+
+		return 0;
+	}
+
+	err = hdmi5_core_enable(hdmi);
+	if (err)
+		return err;
+
+	REG_FLD_MOD(core->base, HDMI_CORE_MC_CLKDIS, 0x00, 5, 5);
+	hdmi_write_reg(core->base, HDMI_CORE_IH_I2CM_STAT0, ~0);
+	hdmi_write_reg(core->base, HDMI_CORE_IH_MUTE_I2CM_STAT0, ~0);
+	hdmi_write_reg(core->base, HDMI_CORE_CEC_CTRL, 0);
+	hdmi_write_reg(core->base, HDMI_CORE_IH_CEC_STAT0, ~0);
+	hdmi_write_reg(core->base, HDMI_CORE_CEC_LOCK, 0);
+	hdmi_write_reg(core->base, HDMI_CORE_CEC_TX_CNT, 0);
+
+	hdmi5_cec_log_addr(adap, CEC_LOG_ADDR_INVALID);
+
+	/* Enable HDMI core interrupts */
+	hdmi_wp_set_irqenable(core->wp, HDMI_IRQ_CORE);
+
+	irqs = CEC_STAT_ERROR_INIT | CEC_STAT_NACK | CEC_STAT_EOM |
+	       CEC_STAT_DONE;
+	hdmi_write_reg(core->base, HDMI_CORE_CEC_MASK, ~irqs);
+	hdmi_write_reg(core->base, HDMI_CORE_IH_MUTE_CEC_STAT0, ~irqs);
+
+	return 0;
+}
+
+static const struct cec_adap_ops hdmi5_cec_ops = {
+	.adap_enable = hdmi5_cec_enable,
+	.adap_log_addr = hdmi5_cec_log_addr,
+	.adap_transmit = hdmi5_cec_transmit,
+};
+
+void hdmi5_cec_set_phys_addr(struct hdmi_core_data *core, struct edid *edid)
+{
+	cec_s_phys_addr_from_edid(core->adap, edid);
+}
+
+int hdmi5_cec_init(struct platform_device *pdev, struct hdmi_core_data *core,
+		   struct hdmi_wp_data *wp, struct drm_connector *conn)
+{
+	const u32 caps = CEC_CAP_DEFAULTS | CEC_CAP_CONNECTOR_INFO;
+	struct cec_connector_info conn_info;
+	int ret;
+
+	core->cec_clk = devm_clk_get(&pdev->dev, "cec");
+	if (IS_ERR(core->cec_clk))
+		return PTR_ERR(core->cec_clk);
+	ret = clk_prepare_enable(core->cec_clk);
+	if (ret)
+		return ret;
+
+	core->adap = cec_allocate_adapter(&hdmi5_cec_ops, core,
+					  "omap5", caps, CEC_MAX_LOG_ADDRS);
+	ret = PTR_ERR_OR_ZERO(core->adap);
+	if (ret < 0)
+		goto disable_clk;
+
+	cec_fill_conn_info_from_drm(&conn_info, conn);
+	cec_s_conn_info(core->adap, &conn_info);
+	core->wp = wp;
+
+	ret = cec_register_adapter(core->adap, &pdev->dev);
+	if (ret < 0)
+		goto delete_adap;
+
+	return 0;
+
+delete_adap:
+	cec_delete_adapter(core->adap);
+disable_clk:
+	clk_disable_unprepare(core->cec_clk);
+	core->adap = NULL;
+	return ret;
+}
+
+void hdmi5_cec_uninit(struct hdmi_core_data *core)
+{
+	if (IS_ERR_OR_NULL(core->adap))
+		return;
+
+	cec_unregister_adapter(core->adap);
+	clk_disable_unprepare(core->cec_clk);
+}
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h b/drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h
new file mode 100644
index 000000000000..d7732f9a675a
--- /dev/null
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * HDMI header definition for OMAP5 HDMI CEC IP
+ *
+ * Copyright 2019 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
+ */
+
+#ifndef _HDMI5_CEC_H_
+#define _HDMI5_CEC_H_
+
+/* HDMI CEC funcs */
+#ifdef CONFIG_OMAP5_DSS_HDMI_CEC
+void hdmi5_cec_set_phys_addr(struct hdmi_core_data *core,
+			     struct edid *edid);
+void hdmi5_cec_irq(struct hdmi_core_data *core, unsigned int stat);
+int hdmi5_cec_init(struct platform_device *pdev, struct hdmi_core_data *core,
+		   struct hdmi_wp_data *wp, struct drm_connector *conn);
+void hdmi5_cec_uninit(struct hdmi_core_data *core);
+#else
+static inline void hdmi5_cec_set_phys_addr(struct hdmi_core_data *core,
+					   struct edid *edid)
+{
+}
+
+static inline void hdmi5_cec_irq(struct hdmi_core_data *core, unsigned int stat)
+{
+}
+
+static inline int hdmi5_cec_init(struct platform_device *pdev,
+				 struct hdmi_core_data *core,
+				 struct hdmi_wp_data *wp,
+				 struct drm_connector *conn)
+{
+	return 0;
+}
+
+static inline void hdmi5_cec_uninit(struct hdmi_core_data *core)
+{
+}
+#endif
+
+#endif
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
index 6cc2ad7a420c..de57384ad159 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
@@ -22,6 +22,7 @@
 #include <sound/asoundef.h>
 
 #include "hdmi5_core.h"
+#include "hdmi5_cec.h"
 
 void hdmi5_core_ddc_init(struct hdmi_core_data *core)
 {
@@ -229,6 +230,19 @@ void hdmi5_core_dump(struct hdmi_core_data *core, struct seq_file *s)
 	DUMPCORE(HDMI_CORE_I2CM_FS_SCL_LCNT_1_ADDR);
 	DUMPCORE(HDMI_CORE_I2CM_FS_SCL_LCNT_0_ADDR);
 	DUMPCORE(HDMI_CORE_I2CM_SDA_HOLD_ADDR);
+
+	DUMPCORE(HDMI_CORE_IH_CEC_STAT0);
+	DUMPCORE(HDMI_CORE_IH_MUTE_CEC_STAT0);
+	DUMPCORE(HDMI_CORE_CEC_CTRL);
+	DUMPCORE(HDMI_CORE_CEC_MASK);
+	DUMPCORE(HDMI_CORE_CEC_ADDR_L);
+	DUMPCORE(HDMI_CORE_CEC_ADDR_H);
+	DUMPCORE(HDMI_CORE_CEC_TX_CNT);
+	DUMPCORE(HDMI_CORE_CEC_RX_CNT);
+	DUMPCORE(HDMI_CORE_CEC_TX_DATA0);
+	DUMPCORE(HDMI_CORE_CEC_RX_DATA0);
+	DUMPCORE(HDMI_CORE_CEC_LOCK);
+	DUMPCORE(HDMI_CORE_CEC_WKUPCTRL);
 }
 
 static void hdmi_core_init(struct hdmi_core_vid_config *video_cfg,
@@ -513,8 +527,6 @@ static void hdmi_core_mask_interrupts(struct hdmi_core_data *core)
 	REG_FLD_MOD(base, HDMI_CORE_AUD_INT, 0x3, 3, 2);
 	REG_FLD_MOD(base, HDMI_CORE_AUD_GP_MASK, 0x3, 1, 0);
 
-	REG_FLD_MOD(base, HDMI_CORE_CEC_MASK, 0x7f, 6, 0);
-
 	REG_FLD_MOD(base, HDMI_CORE_I2CM_CTLINT, 0x1, 6, 6);
 	REG_FLD_MOD(base, HDMI_CORE_I2CM_CTLINT, 0x1, 2, 2);
 	REG_FLD_MOD(base, HDMI_CORE_I2CM_INT, 0x1, 2, 2);
@@ -532,8 +544,6 @@ static void hdmi_core_mask_interrupts(struct hdmi_core_data *core)
 
 	REG_FLD_MOD(base, HDMI_CORE_IH_AS_STAT0, 0x7, 2, 0);
 
-	REG_FLD_MOD(base, HDMI_CORE_IH_CEC_STAT0, 0x7f, 6, 0);
-
 	REG_FLD_MOD(base, HDMI_CORE_IH_I2CM_STAT0, 0x3, 1, 0);
 
 	REG_FLD_MOD(base, HDMI_CORE_IH_PHY_STAT0, 0xff, 7, 0);
@@ -548,14 +558,24 @@ static void hdmi_core_enable_interrupts(struct hdmi_core_data *core)
 int hdmi5_core_handle_irqs(struct hdmi_core_data *core)
 {
 	void __iomem *base = core->base;
+	unsigned int stat = hdmi_read_reg(base, HDMI_CORE_IH_CEC_STAT0);
+
+	if (stat) {
+		hdmi_write_reg(base, HDMI_CORE_IH_CEC_STAT0, stat);
+		hdmi5_cec_irq(core, stat);
+	}
 
+	/*
+	 * Clear all possible IRQ_CORE interrupts except for
+	 * HDMI_CORE_IH_I2CM_STAT0 (that interrupt is muted and
+	 * is handled by polling elsewhere) and HDMI_CORE_IH_CEC_STAT0
+	 * which is handled by the CEC code above.
+	 */
 	REG_FLD_MOD(base, HDMI_CORE_IH_FC_STAT0, 0xff, 7, 0);
 	REG_FLD_MOD(base, HDMI_CORE_IH_FC_STAT1, 0xff, 7, 0);
 	REG_FLD_MOD(base, HDMI_CORE_IH_FC_STAT2, 0xff, 7, 0);
 	REG_FLD_MOD(base, HDMI_CORE_IH_AS_STAT0, 0xff, 7, 0);
 	REG_FLD_MOD(base, HDMI_CORE_IH_PHY_STAT0, 0xff, 7, 0);
-	REG_FLD_MOD(base, HDMI_CORE_IH_I2CM_STAT0, 0xff, 7, 0);
-	REG_FLD_MOD(base, HDMI_CORE_IH_CEC_STAT0, 0xff, 7, 0);
 	REG_FLD_MOD(base, HDMI_CORE_IH_VP_STAT0, 0xff, 7, 0);
 	REG_FLD_MOD(base, HDMI_CORE_IH_I2CMPHY_STAT0, 0xff, 7, 0);
 
@@ -879,5 +899,8 @@ int hdmi5_core_init(struct platform_device *pdev, struct hdmi_core_data *core)
 	if (IS_ERR(core->base))
 		return PTR_ERR(core->base);
 
+	REG_FLD_MOD(core->base, HDMI_CORE_CEC_MASK, 0x7f, 6, 0);
+	REG_FLD_MOD(core->base, HDMI_CORE_IH_CEC_STAT0, 0x7f, 6, 0);
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
index 070cbf5fb57d..6bcef70a87cc 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
@@ -30,8 +30,18 @@
 #define HDMI_CORE_IH_PHY_STAT0			0x00410
 #define HDMI_CORE_IH_I2CM_STAT0			0x00414
 #define HDMI_CORE_IH_CEC_STAT0			0x00418
+#define CEC_STAT_DONE				BIT(0)
+#define CEC_STAT_EOM				BIT(1)
+#define CEC_STAT_NACK				BIT(2)
+#define CEC_STAT_ARBLOST			BIT(3)
+#define CEC_STAT_ERROR_INIT			BIT(4)
+#define CEC_STAT_ERROR_FOLL			BIT(5)
+#define CEC_STAT_WAKEUP				BIT(6)
+
 #define HDMI_CORE_IH_VP_STAT0			0x0041C
 #define HDMI_CORE_IH_I2CMPHY_STAT0		0x00420
+#define HDMI_CORE_IH_MUTE_I2CM_STAT0		0x00614
+#define HDMI_CORE_IH_MUTE_CEC_STAT0		0x00618
 #define HDMI_CORE_IH_MUTE			0x007FC
 
 /* HDMI Video Sampler */
@@ -233,9 +243,6 @@
 /* HDMI HDCP */
 #define HDMI_CORE_HDCP_MASK			0x14020
 
-/* HDMI CEC */
-#define HDMI_CORE_CEC_MASK			0x17408
-
 /* HDMI I2C Master */
 #define HDMI_CORE_I2CM_SLAVE			0x157C8
 #define HDMI_CORE_I2CM_ADDRESS			0x157CC
@@ -258,6 +265,24 @@
 #define HDMI_CORE_I2CM_FS_SCL_LCNT_0_ADDR	0x15810
 #define HDMI_CORE_I2CM_SDA_HOLD_ADDR		0x15814
 
+/* HDMI CEC */
+#define HDMI_CORE_CEC_CTRL			0x153C8
+#define CEC_CTRL_START				BIT(0)
+#define CEC_CTRL_FRAME_TYP			(3 << 1)
+#define CEC_CTRL_RETRY				(0 << 1)
+#define CEC_CTRL_NORMAL				(1 << 1)
+#define CEC_CTRL_IMMED				(2 << 1)
+
+#define HDMI_CORE_CEC_MASK			0x153D0
+#define HDMI_CORE_CEC_ADDR_L			0x153DC
+#define HDMI_CORE_CEC_ADDR_H			0x153E0
+#define HDMI_CORE_CEC_TX_CNT			0x153E4
+#define HDMI_CORE_CEC_RX_CNT			0x153E8
+#define HDMI_CORE_CEC_TX_DATA0			0x15408
+#define HDMI_CORE_CEC_RX_DATA0			0x15448
+#define HDMI_CORE_CEC_LOCK			0x15488
+#define HDMI_CORE_CEC_WKUPCTRL			0x1548C
+
 enum hdmi_core_packet_mode {
 	HDMI_PACKETMODERESERVEDVALUE = 0,
 	HDMI_PACKETMODE24BITPERPIXEL = 4,
@@ -290,6 +315,8 @@ int hdmi5_core_handle_irqs(struct hdmi_core_data *core);
 void hdmi5_configure(struct hdmi_core_data *core, struct hdmi_wp_data *wp,
 			struct hdmi_config *cfg);
 int hdmi5_core_init(struct platform_device *pdev, struct hdmi_core_data *core);
+int hdmi5_core_enable(struct omap_hdmi *hdmi);
+void hdmi5_core_disable(struct omap_hdmi *hdmi);
 
 int hdmi5_audio_config(struct hdmi_core_data *core, struct hdmi_wp_data *wp,
 			struct omap_dss_audio *audio, u32 pclk);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
