Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB53D2312B3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96526E3B0;
	Tue, 28 Jul 2020 19:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E7889B95
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 10:08:28 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id 74so2393963pfx.13
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 03:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ao2yzy+xMey414LkakzCpyOF47WLqakCyOKohXKpe5Q=;
 b=BaP6G5qmC/pI2dHn24EhYqAsgVflINazwmC/PmUsjiUB+5Qw/zqp2oe8vOQVS0tv5T
 AgQw6JMlVC/0/Xm2vu0MuO25R3k2iEB14CF7kZ9EqnZhCsP29inG0XURWdMGR0zVVbOw
 JnUo91vAGMQm6nqVwfjUGxfEJ28yOR0FGgXKwPGGCOsOw9MC5wKrGBSxAZEzyFCGhilg
 ShYjFYfwVIFuzZuEQ1A3S/yXqo3cPX+gUdbQDNxvMRQMkBqlrWzmQYPrCTguGxSMnyDI
 2QIWziquAFoxMyNZp6TaIdDgqnR0IJIpaUMvLgIlG2HcQbJTpZy+QAz45bPk8uuRgzTF
 30Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ao2yzy+xMey414LkakzCpyOF47WLqakCyOKohXKpe5Q=;
 b=aPTI5VM7LGF+DPdqoRZB27M9j18PmRWVg4hiBdhBmuoDTEl73hfBih2woebFLliUoJ
 xqqIMCnHUIXfRaI/Ahnu0xbS6O39OFrs4ul9IS4DmTnkPabTGb0s5XZQbsxoN3QG5jzX
 rTk3JxZESNKPxkMFSOXb9rpcCIm2QXmNDNTWsh7cgrzUQXsEygK7q3LTb1yHI7vFszTE
 NfGe3q3swlwMrHDCIrkqsyhuAq+bjhdWFNzPU+wCOUf0zUF6GL5QyQDX6sTs4TzxdCPk
 y+fJMPWuq7TSUd4qMZbHAFfbcFsSNT9k6Jfy0i0unMPSluIAVvO7dipKkb4bzbkerO9s
 gJ5A==
X-Gm-Message-State: AOAM533f7wnsBO64oICTQvl8HIf9hF7fE26B8W15DZOJXPBGf1Zef/hP
 0r6i1DK8Mmm1yNJWPz5CryQ=
X-Google-Smtp-Source: ABdhPJxOtRdEI/Md87uPV9bohABcrOrbPVakKgiXFuyt0u+I2kaZqdb6dVY54V07UKBzojtCDRUTVA==
X-Received: by 2002:a63:fe42:: with SMTP id x2mr24125671pgj.207.1595930907622; 
 Tue, 28 Jul 2020 03:08:27 -0700 (PDT)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id e76sm1704593pfh.108.2020.07.28.03.08.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Jul 2020 03:08:26 -0700 (PDT)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v6 6/6] drm/sprd: add Unisoc's drm mipi dsi&dphy driver
Date: Tue, 28 Jul 2020 18:07:59 +0800
Message-Id: <1595930879-2478-7-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595930879-2478-1-git-send-email-kevin3.tang@gmail.com>
References: <1595930879-2478-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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
Cc: orsonzhai@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhang.lyra@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Tang <kevin.tang@unisoc.com>

Adds dsi host controller support for the Unisoc's display subsystem.
Adds dsi phy support for the Unisoc's display subsystem.
Only MIPI DSI Displays supported, DP/TV/HMDI will be support
in the feature.

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin3.tang@gmail.com>
---
 drivers/gpu/drm/sprd/Makefile                     |    7 +-
 drivers/gpu/drm/sprd/disp_lib.c                   |   57 +
 drivers/gpu/drm/sprd/disp_lib.h                   |   16 +
 drivers/gpu/drm/sprd/dphy/Makefile                |    7 +
 drivers/gpu/drm/sprd/dphy/pll/Makefile            |    3 +
 drivers/gpu/drm/sprd/dphy/pll/megacores_sharkle.c |  473 +++++++
 drivers/gpu/drm/sprd/dphy/sprd_dphy_api.c         |  201 +++
 drivers/gpu/drm/sprd/dphy/sprd_dphy_api.h         |   22 +
 drivers/gpu/drm/sprd/dsi/Makefile                 |    8 +
 drivers/gpu/drm/sprd/dsi/core/Makefile            |    4 +
 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c     |  964 ++++++++++++++
 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.h     | 1477 +++++++++++++++++++++
 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c |  328 +++++
 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.h |   32 +
 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.c           |  590 ++++++++
 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.h           |   26 +
 drivers/gpu/drm/sprd/sprd_dphy.c                  |  209 +++
 drivers/gpu/drm/sprd/sprd_dphy.h                  |   50 +
 drivers/gpu/drm/sprd/sprd_dpu.c                   |   22 +
 drivers/gpu/drm/sprd/sprd_dpu.h                   |    3 +
 drivers/gpu/drm/sprd/sprd_dsi.c                   |  571 ++++++++
 drivers/gpu/drm/sprd/sprd_dsi.h                   |  108 ++
 22 files changed, 5177 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/sprd/disp_lib.c
 create mode 100644 drivers/gpu/drm/sprd/disp_lib.h
 create mode 100644 drivers/gpu/drm/sprd/dphy/Makefile
 create mode 100644 drivers/gpu/drm/sprd/dphy/pll/Makefile
 create mode 100644 drivers/gpu/drm/sprd/dphy/pll/megacores_sharkle.c
 create mode 100644 drivers/gpu/drm/sprd/dphy/sprd_dphy_api.c
 create mode 100644 drivers/gpu/drm/sprd/dphy/sprd_dphy_api.h
 create mode 100644 drivers/gpu/drm/sprd/dsi/Makefile
 create mode 100644 drivers/gpu/drm/sprd/dsi/core/Makefile
 create mode 100644 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c
 create mode 100644 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.h
 create mode 100644 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c
 create mode 100644 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.h
 create mode 100644 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.c
 create mode 100644 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_dphy.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_dphy.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.h

diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makefile
index 88ab32a..c78565d 100644
--- a/drivers/gpu/drm/sprd/Makefile
+++ b/drivers/gpu/drm/sprd/Makefile
@@ -3,6 +3,11 @@
 subdir-ccflags-y += -I$(srctree)/$(src)
 
 obj-y := sprd_drm.o \
-	sprd_dpu.o
+	sprd_dpu.o \
+	sprd_dsi.o \
+	sprd_dphy.o
 
+obj-y += disp_lib.o
 obj-y += dpu/
+obj-y += dsi/
+obj-y += dphy/
diff --git a/drivers/gpu/drm/sprd/disp_lib.c b/drivers/gpu/drm/sprd/disp_lib.c
new file mode 100644
index 0000000..b2f8202
--- /dev/null
+++ b/drivers/gpu/drm/sprd/disp_lib.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Unisoc Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of_graph.h>
+#include <linux/of_platform.h>
+#include <linux/slab.h>
+
+#include "disp_lib.h"
+
+struct device *sprd_disp_pipe_get_by_port(struct device *dev, int port)
+{
+	struct device_node *np = dev->of_node;
+	struct device_node *endpoint;
+	struct device_node *remote_node;
+	struct platform_device *remote_pdev;
+
+	endpoint = of_graph_get_endpoint_by_regs(np, port, 0);
+	if (!endpoint) {
+		DRM_ERROR("%s/port%d/endpoint0 was not found\n",
+			  np->full_name, port);
+		return NULL;
+	}
+
+	remote_node = of_graph_get_remote_port_parent(endpoint);
+	if (!remote_node) {
+		DRM_ERROR("device node was not found by endpoint0\n");
+		return NULL;
+	}
+
+	remote_pdev = of_find_device_by_node(remote_node);
+	if (remote_pdev == NULL) {
+		DRM_ERROR("find %s platform device failed\n",
+			  remote_node->full_name);
+		return NULL;
+	}
+
+	return &remote_pdev->dev;
+}
+
+struct device *sprd_disp_pipe_get_input(struct device *dev)
+{
+	return sprd_disp_pipe_get_by_port(dev, 1);
+}
+
+struct device *sprd_disp_pipe_get_output(struct device *dev)
+{
+	return sprd_disp_pipe_get_by_port(dev, 0);
+}
+
+MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
+MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
+MODULE_DESCRIPTION("Unisoc display common API library");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/sprd/disp_lib.h b/drivers/gpu/drm/sprd/disp_lib.h
new file mode 100644
index 0000000..adbd239
--- /dev/null
+++ b/drivers/gpu/drm/sprd/disp_lib.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 Unisoc Inc.
+ */
+
+#ifndef _DISP_LIB_H_
+#define _DISP_LIB_H_
+
+#include <linux/list.h>
+#include <drm/drm_print.h>
+
+struct device *sprd_disp_pipe_get_by_port(struct device *dev, int port);
+struct device *sprd_disp_pipe_get_input(struct device *dev);
+struct device *sprd_disp_pipe_get_output(struct device *dev);
+
+#endif /* _DISP_LIB_H_ */
diff --git a/drivers/gpu/drm/sprd/dphy/Makefile b/drivers/gpu/drm/sprd/dphy/Makefile
new file mode 100644
index 0000000..6637c27
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dphy/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+
+subdir-ccflags-y += -I$(srctree)/$(src)
+
+obj-y := sprd_dphy_api.o
+
+obj-y += pll/
diff --git a/drivers/gpu/drm/sprd/dphy/pll/Makefile b/drivers/gpu/drm/sprd/dphy/pll/Makefile
new file mode 100644
index 0000000..59e74ec
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dphy/pll/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-y += megacores_sharkle.o
diff --git a/drivers/gpu/drm/sprd/dphy/pll/megacores_sharkle.c b/drivers/gpu/drm/sprd/dphy/pll/megacores_sharkle.c
new file mode 100644
index 0000000..a6869cc0
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dphy/pll/megacores_sharkle.c
@@ -0,0 +1,473 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Unisoc Inc.
+ */
+
+#include <asm/div64.h>
+#include <linux/delay.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/regmap.h>
+#include <linux/string.h>
+
+#include "sprd_dphy.h"
+
+#define L						0
+#define H						1
+#define CLK						0
+#define DATA					1
+#define INFINITY				0xffffffff
+#define MIN_OUTPUT_FREQ			(100)
+
+#define AVERAGE(a, b) (min(a, b) + abs((b) - (a)) / 2)
+
+enum TIMING {
+	NONE,
+	REQUEST_TIME,
+	PREPARE_TIME,
+	SETTLE_TIME,
+	ZERO_TIME,
+	TRAIL_TIME,
+	EXIT_TIME,
+	CLKPOST_TIME,
+	TA_GET,
+	TA_GO,
+	TA_SURE,
+	TA_WAIT,
+};
+
+struct pll_regs {
+	union __reg_03__ {
+		struct __03 {
+			u8 prbs_bist: 1;
+			u8 en_lp_treot: 1;
+			u8 lpf_sel: 4;
+			u8 txfifo_bypass: 1;
+			u8 freq_hopping: 1;
+		} bits;
+		u8 val;
+	} _03;
+	union __reg_04__ {
+		struct __04 {
+			u8 div: 3;
+			u8 masterof8lane: 1;
+			u8 hop_trig: 1;
+			u8 cp_s: 2;
+			u8 fdk_s: 1;
+		} bits;
+		u8 val;
+	} _04;
+	union __reg_06__ {
+		struct __06 {
+			u8 nint: 7;
+			u8 mod_en: 1;
+		} bits;
+		u8 val;
+	} _06;
+	union __reg_07__ {
+		struct __07 {
+			u8 kdelta_h: 8;
+		} bits;
+		u8 val;
+	} _07;
+	union __reg_08__ {
+		struct __08 {
+			u8 vco_band: 1;
+			u8 sdm_en: 1;
+			u8 refin: 2;
+			u8 kdelta_l: 4;
+		} bits;
+		u8 val;
+	} _08;
+	union __reg_09__ {
+		struct __09 {
+			u8 kint_h: 8;
+		} bits;
+		u8 val;
+	} _09;
+	union __reg_0a__ {
+		struct __0a {
+			u8 kint_m: 8;
+		} bits;
+		u8 val;
+	} _0a;
+	union __reg_0b__ {
+		struct __0b {
+			u8 out_sel: 4;
+			u8 kint_l: 4;
+		} bits;
+		u8 val;
+	} _0b;
+	union __reg_0c__ {
+		struct __0c {
+			u8 kstep_h: 8;
+		} bits;
+		u8 val;
+	} _0c;
+	union __reg_0d__ {
+		struct __0d {
+			u8 kstep_m: 8;
+		} bits;
+		u8 val;
+	} _0d;
+	union __reg_0e__ {
+		struct __0e {
+			u8 pll_pu_byp: 1;
+			u8 pll_pu: 1;
+			u8 hsbist_len: 2;
+			u8 stopstate_sel: 1;
+			u8 kstep_l: 3;
+		} bits;
+		u8 val;
+	} _0e;
+
+	union __reg_0f__ {
+		struct __0f {
+			u8 det_delay:2;
+			u8 kdelta: 4;
+			u8 ldo0p4:2;
+		} bits;
+		u8 val;
+	} _0f;
+
+};
+
+struct dphy_pll {
+	u8 refin; /* Pre-divider control signal */
+	u8 cp_s; /* 00: SDM_EN=1, 10: SDM_EN=0 */
+	u8 fdk_s; /* PLL mode control: integer or fraction */
+	u8 sdm_en;
+	u8 div;
+	u8 int_n; /* integer N PLL */
+	u32 ref_clk; /* dphy reference clock, unit: MHz */
+	u32 freq; /* panel config, unit: KHz */
+	u32 fvco; /* MHz */
+	u32 potential_fvco; /* MHz */
+	u32 nint; /* sigma delta modulator NINT control */
+	u32 kint; /* sigma delta modulator KINT control */
+	u8 lpf_sel; /* low pass filter control */
+	u8 out_sel; /* post divider control */
+	u8 vco_band; /* vco range */
+	u8 det_delay;
+};
+
+static struct pll_regs regs;
+static struct dphy_pll pll;
+
+/* sharkle */
+#define VCO_BAND_LOW	750
+#define VCO_BAND_MID	1100
+#define VCO_BAND_HIGH	1500
+#define PHY_REF_CLK	26000
+
+static int dphy_calc_pll_param(struct dphy_pll *pll)
+{
+	int i;
+	const u32 khz = 1000;
+	const u32 mhz = 1000000;
+	const unsigned long long factor = 100;
+	unsigned long long tmp;
+
+	pll->potential_fvco = pll->freq / khz; /* MHz */
+	pll->ref_clk = PHY_REF_CLK / khz; /* MHz */
+
+	for (i = 0; i < 4; ++i) {
+		if (pll->potential_fvco >= VCO_BAND_LOW &&
+			pll->potential_fvco <= VCO_BAND_HIGH) {
+			pll->fvco = pll->potential_fvco;
+			pll->out_sel = BIT(i);
+			break;
+		}
+		pll->potential_fvco <<= 1;
+	}
+	if (pll->fvco == 0)
+		return -EINVAL;
+
+	if (pll->fvco >= VCO_BAND_LOW && pll->fvco <= VCO_BAND_MID) {
+		/* vco band control */
+		pll->vco_band = 0x0;
+		/* low pass filter control */
+		pll->lpf_sel = 1;
+	} else if (pll->fvco > VCO_BAND_MID && pll->fvco <= VCO_BAND_HIGH) {
+		pll->vco_band = 0x1;
+		pll->lpf_sel = 0;
+	} else
+		return -EINVAL;
+
+	pll->nint = pll->fvco / pll->ref_clk;
+	tmp = pll->fvco * factor * mhz;
+	do_div(tmp, pll->ref_clk);
+	tmp = tmp - pll->nint * factor * mhz;
+	tmp *= BIT(20);
+	do_div(tmp, 100000000);
+	pll->kint = (u32)tmp;
+	pll->refin = 3; /* pre-divider bypass */
+	pll->sdm_en = true; /* use fraction N PLL */
+	pll->fdk_s = 0x1; /* fraction */
+	pll->cp_s = 0x0;
+	pll->det_delay = 0x1;
+
+	return 0;
+}
+
+static void dphy_set_pll_reg(struct regmap *regmap, struct dphy_pll *pll)
+{
+	int i;
+	u8 *val;
+
+	u8 regs_addr[] = {
+		0x03, 0x04, 0x06, 0x08, 0x09,
+		0x0a, 0x0b, 0x0e, 0x0f
+	};
+
+	regs._03.bits.prbs_bist = 1;
+	regs._03.bits.en_lp_treot = true;
+	regs._03.bits.lpf_sel = pll->lpf_sel;
+	regs._03.bits.txfifo_bypass = 0;
+	regs._04.bits.div = pll->div;
+	regs._04.bits.masterof8lane = 1;
+	regs._04.bits.cp_s = pll->cp_s;
+	regs._04.bits.fdk_s = pll->fdk_s;
+	regs._06.bits.nint = pll->nint;
+	regs._08.bits.vco_band = pll->vco_band;
+	regs._08.bits.sdm_en = pll->sdm_en;
+	regs._08.bits.refin = pll->refin;
+	regs._09.bits.kint_h = pll->kint >> 12;
+	regs._0a.bits.kint_m = (pll->kint >> 4) & 0xff;
+	regs._0b.bits.out_sel = pll->out_sel;
+	regs._0b.bits.kint_l = pll->kint & 0xf;
+	regs._0e.bits.pll_pu_byp = 0;
+	regs._0e.bits.pll_pu = 0;
+	regs._0e.bits.stopstate_sel = 1;
+	regs._0f.bits.det_delay = pll->det_delay;
+
+	val = (u8 *)&regs;
+
+	for (i = 0; i < sizeof(regs_addr); ++i) {
+		regmap_write(regmap, regs_addr[i], val[i]);
+		DRM_DEBUG("%02x: %02x\n", regs_addr[i], val[i]);
+	}
+}
+
+static int dphy_pll_config(struct dphy_context *ctx)
+{
+	int ret;
+	struct regmap *regmap = ctx->regmap;
+
+	pll.freq = ctx->freq;
+
+	/* FREQ = 26M * (NINT + KINT / 2^20) / out_sel */
+	ret = dphy_calc_pll_param(&pll);
+	if (ret) {
+		DRM_ERROR("failed to calculate dphy pll parameters\n");
+		return ret;
+	}
+	dphy_set_pll_reg(regmap, &pll);
+
+	return 0;
+}
+
+static void dphy_set_timing_regs(struct regmap *regmap, int type, u8 val[])
+{
+	switch (type) {
+	case REQUEST_TIME:
+		regmap_write(regmap, 0x31, val[CLK]);
+		regmap_write(regmap, 0x41, val[DATA]);
+		regmap_write(regmap, 0x51, val[DATA]);
+		regmap_write(regmap, 0x61, val[DATA]);
+		regmap_write(regmap, 0x71, val[DATA]);
+
+		regmap_write(regmap, 0x90, val[CLK]);
+		regmap_write(regmap, 0xa0, val[DATA]);
+		regmap_write(regmap, 0xb0, val[DATA]);
+		regmap_write(regmap, 0xc0, val[DATA]);
+		regmap_write(regmap, 0xd0, val[DATA]);
+		break;
+	case PREPARE_TIME:
+		regmap_write(regmap, 0x32, val[CLK]);
+		regmap_write(regmap, 0x42, val[DATA]);
+		regmap_write(regmap, 0x52, val[DATA]);
+		regmap_write(regmap, 0x62, val[DATA]);
+		regmap_write(regmap, 0x72, val[DATA]);
+
+		regmap_write(regmap, 0x91, val[CLK]);
+		regmap_write(regmap, 0xa1, val[DATA]);
+		regmap_write(regmap, 0xb1, val[DATA]);
+		regmap_write(regmap, 0xc1, val[DATA]);
+		regmap_write(regmap, 0xd1, val[DATA]);
+		break;
+	case ZERO_TIME:
+		regmap_write(regmap, 0x33, val[CLK]);
+		regmap_write(regmap, 0x43, val[DATA]);
+		regmap_write(regmap, 0x53, val[DATA]);
+		regmap_write(regmap, 0x63, val[DATA]);
+		regmap_write(regmap, 0x73, val[DATA]);
+
+		regmap_write(regmap, 0x92, val[CLK]);
+		regmap_write(regmap, 0xa2, val[DATA]);
+		regmap_write(regmap, 0xb2, val[DATA]);
+		regmap_write(regmap, 0xc2, val[DATA]);
+		regmap_write(regmap, 0xd2, val[DATA]);
+		break;
+	case TRAIL_TIME:
+		regmap_write(regmap, 0x34, val[CLK]);
+		regmap_write(regmap, 0x44, val[DATA]);
+		regmap_write(regmap, 0x54, val[DATA]);
+		regmap_write(regmap, 0x64, val[DATA]);
+		regmap_write(regmap, 0x74, val[DATA]);
+
+		regmap_write(regmap, 0x93, val[CLK]);
+		regmap_write(regmap, 0xa3, val[DATA]);
+		regmap_write(regmap, 0xb3, val[DATA]);
+		regmap_write(regmap, 0xc3, val[DATA]);
+		regmap_write(regmap, 0xd3, val[DATA]);
+		break;
+	case EXIT_TIME:
+		regmap_write(regmap, 0x36, val[CLK]);
+		regmap_write(regmap, 0x46, val[DATA]);
+		regmap_write(regmap, 0x56, val[DATA]);
+		regmap_write(regmap, 0x66, val[DATA]);
+		regmap_write(regmap, 0x76, val[DATA]);
+
+		regmap_write(regmap, 0x95, val[CLK]);
+		regmap_write(regmap, 0xA5, val[DATA]);
+		regmap_write(regmap, 0xB5, val[DATA]);
+		regmap_write(regmap, 0xc5, val[DATA]);
+		regmap_write(regmap, 0xd5, val[DATA]);
+		break;
+	case CLKPOST_TIME:
+		regmap_write(regmap, 0x35, val[CLK]);
+		regmap_write(regmap, 0x94, val[CLK]);
+		break;
+
+	/* the following just use default value */
+	case SETTLE_TIME:
+	case TA_GET:
+	case TA_GO:
+	case TA_SURE:
+		break;
+	default:
+		break;
+	}
+}
+
+static void dphy_timing_config(struct dphy_context *ctx)
+{
+	u8 val[2];
+	u32 tmp = 0;
+	u32 range[2], constant;
+	u32 t_ui, t_byteck, t_half_byteck;
+	const u32 factor = 2;
+	const u32 scale = 100;
+	struct regmap *regmap = ctx->regmap;
+
+	/* t_ui: 1 ui, byteck: 8 ui, half byteck: 4 ui */
+	t_ui = 1000 * scale / (ctx->freq / 1000);
+	t_byteck = t_ui << 3;
+	t_half_byteck = t_ui << 2;
+	constant = t_ui << 1;
+
+	/* REQUEST_TIME: HS T-LPX: LP-01
+	 * For T-LPX, mipi spec defined min value is 50ns,
+	 * but maybe it shouldn't be too small, because BTA,
+	 * LP-10, LP-00, LP-01, all of this is related to T-LPX.
+	 */
+	range[L] = 50 * scale;
+	range[H] = INFINITY;
+	val[CLK] = DIV_ROUND_UP(range[L] * (factor << 1), t_byteck) - 2;
+	val[DATA] = val[CLK];
+	dphy_set_timing_regs(regmap, REQUEST_TIME, val);
+
+	/* PREPARE_TIME: HS sequence: LP-00 */
+	range[L] = 38 * scale;
+	range[H] = 95 * scale;
+	tmp = AVERAGE(range[L], range[H]);
+	val[CLK] = DIV_ROUND_UP(AVERAGE(range[L], range[H]),
+			t_half_byteck) - 1;
+	range[L] = 40 * scale + 4 * t_ui;
+	range[H] = 85 * scale + 6 * t_ui;
+	tmp |= AVERAGE(range[L], range[H]) << 16;
+	val[DATA] = DIV_ROUND_UP(AVERAGE(range[L], range[H]),
+			t_half_byteck) - 1;
+	dphy_set_timing_regs(regmap, PREPARE_TIME, val);
+
+	/* ZERO_TIME: HS-ZERO */
+	range[L] = 300 * scale;
+	range[H] = INFINITY;
+	val[CLK] = DIV_ROUND_UP(range[L] * factor + (tmp & 0xffff)
+			- 525 * t_byteck / 100, t_byteck) - 2;
+	range[L] = 145 * scale + 10 * t_ui;
+	val[DATA] = DIV_ROUND_UP(range[L] * factor
+			+ ((tmp >> 16) & 0xffff) - 525 * t_byteck / 100,
+			t_byteck) - 2;
+	dphy_set_timing_regs(regmap, ZERO_TIME, val);
+
+	/* TRAIL_TIME: HS-TRAIL */
+	range[L] = 60 * scale;
+	range[H] = INFINITY;
+	val[CLK] = DIV_ROUND_UP(range[L] * factor - constant, t_half_byteck);
+	range[L] = max(8 * t_ui, 60 * scale + 4 * t_ui);
+	val[DATA] = DIV_ROUND_UP(range[L] * 3 / 2 - constant, t_half_byteck) - 2;
+	dphy_set_timing_regs(regmap, TRAIL_TIME, val);
+
+	/* EXIT_TIME: */
+	range[L] = 100 * scale;
+	range[H] = INFINITY;
+	val[CLK] = DIV_ROUND_UP(range[L] * factor, t_byteck) - 2;
+	val[DATA] = val[CLK];
+	dphy_set_timing_regs(regmap, EXIT_TIME, val);
+
+	/* CLKPOST_TIME: */
+	range[L] = 60 * scale + 52 * t_ui;
+	range[H] = INFINITY;
+	val[CLK] = DIV_ROUND_UP(range[L] * factor, t_byteck) - 2;
+	val[DATA] = val[CLK];
+	dphy_set_timing_regs(regmap, CLKPOST_TIME, val);
+
+	/* SETTLE_TIME:
+	 * This time is used for receiver. So for transmitter,
+	 * it can be ignored.
+	 */
+
+	/* TA_GO:
+	 * transmitter drives bridge state(LP-00) before releasing control,
+	 * reg 0x1f default value: 0x04, which is good.
+	 */
+
+	/* TA_SURE:
+	 * After LP-10 state and before bridge state(LP-00),
+	 * reg 0x20 default value: 0x01, which is good.
+	 */
+
+	/* TA_GET:
+	 * receiver drives Bridge state(LP-00) before releasing control
+	 * reg 0x21 default value: 0x03, which is good.
+	 */
+}
+
+/**
+ * Force D-PHY PLL to stay on while in ULPS
+ * @param phy: pointer to structure
+ *  which holds information about the d-phy module
+ * @param force (1) disable (0)
+ * @note To follow the programming model, use wakeup_pll function
+ */
+static void dphy_force_pll(struct dphy_context *ctx, int force)
+{
+	u8 data;
+	struct regmap *regmap = ctx->regmap;
+
+	if (force)
+		data = 0x03;
+	else
+		data = 0x0;
+
+	/* for megocores, to force pll, dphy register should be set */
+	regmap_write(regmap, 0x0e, data);
+}
+
+const struct dphy_pll_ops sharkle_dphy_pll_ops = {
+	.pll_config = dphy_pll_config,
+	.timing_config = dphy_timing_config,
+	.force_pll = dphy_force_pll,
+};
diff --git a/drivers/gpu/drm/sprd/dphy/sprd_dphy_api.c b/drivers/gpu/drm/sprd/dphy/sprd_dphy_api.c
new file mode 100644
index 0000000..e90d1f7
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dphy/sprd_dphy_api.c
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Unisoc Inc.
+ */
+
+#include <linux/kernel.h>
+#include <linux/delay.h>
+
+#include "sprd_dphy_api.h"
+#include "dsi/core/dsi_ctrl_r1p0_ppi.h"
+
+static int dphy_wait_pll_locked(struct dphy_context *ctx)
+{
+	int i;
+
+	for (i = 0; i < 50000; i++) {
+		if (dsi_phy_is_pll_locked(ctx))
+			return 0;
+		udelay(3);
+	}
+
+	DRM_ERROR("error: dphy pll can not be locked\n");
+	return -ETIMEDOUT;
+}
+
+static int dphy_wait_datalane_stop_state(struct dphy_context *ctx, u8 mask)
+{
+	int i;
+
+	for (i = 0; i < 5000; i++) {
+		if (dsi_phy_is_stop_state_datalane(ctx) == mask)
+			return 0;
+		udelay(10);
+	}
+
+	DRM_ERROR("wait datalane stop-state time out\n");
+	return -ETIMEDOUT;
+}
+
+static int dphy_wait_datalane_ulps_active(struct dphy_context *ctx, u8 mask)
+{
+	int i;
+
+	for (i = 0; i < 5000; i++) {
+		if (dsi_phy_is_ulps_active_datalane(ctx) == mask)
+			return 0;
+		udelay(10);
+	}
+
+	DRM_ERROR("wait datalane ulps-active time out\n");
+	return -ETIMEDOUT;
+}
+
+static int dphy_wait_clklane_stop_state(struct dphy_context *ctx)
+{
+	int i;
+
+	for (i = 0; i < 5000; i++) {
+		if (dsi_phy_is_stop_state_clklane(ctx))
+			return 0;
+		udelay(10);
+	}
+
+	DRM_ERROR("wait clklane stop-state time out\n");
+	return -ETIMEDOUT;
+}
+
+static int dphy_wait_clklane_ulps_active(struct dphy_context *ctx)
+{
+	int i;
+
+	for (i = 0; i < 5000; i++) {
+		if (dsi_phy_is_ulps_active_clklane(ctx))
+			return 0;
+		udelay(10);
+	}
+
+	DRM_ERROR("wait clklane ulps-active time out\n");
+	return -ETIMEDOUT;
+}
+
+int sprd_dphy_power_on(struct sprd_dphy *dphy)
+{
+	const struct dphy_pll_ops *pll = dphy->pll;
+	struct dphy_context *ctx = &dphy->ctx;
+	int ret;
+
+	dsi_phy_rstz(ctx, 0);
+	dsi_phy_shutdownz(ctx, 0);
+	dsi_phy_clklane_en(ctx, 0);
+
+	dsi_phy_test_clr(ctx, 0);
+	dsi_phy_test_clr(ctx, 1);
+	dsi_phy_test_clr(ctx, 0);
+
+	pll->pll_config(ctx);
+	pll->timing_config(ctx);
+
+	dsi_phy_shutdownz(ctx, 1);
+	dsi_phy_rstz(ctx, 1);
+	dsi_phy_stop_wait_time(ctx, 0x1C);
+	dsi_phy_clklane_en(ctx, 1);
+	dsi_phy_datalane_en(ctx);
+
+	ret = dphy_wait_pll_locked(ctx);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+void sprd_dphy_power_off(struct sprd_dphy *dphy)
+{
+	struct dphy_context *ctx = &dphy->ctx;
+
+	dsi_phy_rstz(ctx, 0);
+	dsi_phy_shutdownz(ctx, 0);
+	dsi_phy_rstz(ctx, 1);
+}
+
+void sprd_dphy_data_ulps_enter(struct sprd_dphy *dphy)
+{
+	struct dphy_context *ctx = &dphy->ctx;
+	u8 lane_mask = (1 << ctx->lanes) - 1;
+
+	dsi_phy_datalane_ulps_rqst(ctx, 1);
+	dphy_wait_datalane_ulps_active(ctx, lane_mask);
+	dsi_phy_datalane_ulps_rqst(ctx, 0);
+}
+
+void sprd_dphy_data_ulps_exit(struct sprd_dphy *dphy)
+{
+	struct dphy_context *ctx = &dphy->ctx;
+	u8 lane_mask = (1 << ctx->lanes) - 1;
+
+	dsi_phy_datalane_ulps_exit(ctx, 1);
+	dphy_wait_datalane_stop_state(ctx, lane_mask);
+	dsi_phy_datalane_ulps_exit(ctx, 0);
+}
+
+void sprd_dphy_clk_ulps_enter(struct sprd_dphy *dphy)
+{
+	struct dphy_context *ctx = &dphy->ctx;
+
+	dsi_phy_clklane_ulps_rqst(ctx, 1);
+	dphy_wait_clklane_ulps_active(ctx);
+	dsi_phy_clklane_ulps_rqst(ctx, 0);
+}
+
+void sprd_dphy_clk_ulps_exit(struct sprd_dphy *dphy)
+{
+	struct dphy_context *ctx = &dphy->ctx;
+
+	dsi_phy_clklane_ulps_exit(ctx, 1);
+	dphy_wait_clklane_stop_state(ctx);
+	dsi_phy_clklane_ulps_exit(ctx, 0);
+}
+
+void sprd_dphy_force_pll(struct sprd_dphy *dphy, bool enable)
+{
+	struct dphy_context *ctx = &dphy->ctx;
+
+	dsi_phy_force_pll(ctx, enable);
+}
+
+void sprd_dphy_hs_clk_en(struct sprd_dphy *dphy, bool enable)
+{
+	struct dphy_context *ctx = &dphy->ctx;
+
+	dsi_phy_clk_hs_rqst(ctx, enable);
+	dphy_wait_pll_locked(ctx);
+}
+
+void sprd_dphy_test_write(struct sprd_dphy *dphy, u8 address, u8 data)
+{
+	struct dphy_context *ctx = &dphy->ctx;
+
+	dsi_phy_test_en(ctx, 1);
+	dsi_phy_test_din(ctx, address);
+	dsi_phy_test_clk(ctx, 1);
+	dsi_phy_test_clk(ctx, 0);
+	dsi_phy_test_en(ctx, 0);
+	dsi_phy_test_din(ctx, data);
+	dsi_phy_test_clk(ctx, 1);
+	dsi_phy_test_clk(ctx, 0);
+}
+
+u8 sprd_dphy_test_read(struct sprd_dphy *dphy, u8 address)
+{
+	struct dphy_context *ctx = &dphy->ctx;
+
+	dsi_phy_test_en(ctx, 1);
+	dsi_phy_test_din(ctx, address);
+	dsi_phy_test_clk(ctx, 1);
+	dsi_phy_test_clk(ctx, 0);
+	dsi_phy_test_en(ctx, 0);
+
+	udelay(1);
+
+	return dsi_phy_test_dout(ctx);
+}
diff --git a/drivers/gpu/drm/sprd/dphy/sprd_dphy_api.h b/drivers/gpu/drm/sprd/dphy/sprd_dphy_api.h
new file mode 100644
index 0000000..5def380
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dphy/sprd_dphy_api.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 Unisoc Inc.
+ */
+
+#ifndef _SPRD_DPHY_API_H_
+#define _SPRD_DPHY_API_H_
+
+#include "sprd_dphy.h"
+
+int sprd_dphy_power_on(struct sprd_dphy *dphy);
+void sprd_dphy_power_off(struct sprd_dphy *dphy);
+void sprd_dphy_data_ulps_enter(struct sprd_dphy *dphy);
+void sprd_dphy_data_ulps_exit(struct sprd_dphy *dphy);
+void sprd_dphy_clk_ulps_enter(struct sprd_dphy *dphy);
+void sprd_dphy_clk_ulps_exit(struct sprd_dphy *dphy);
+void sprd_dphy_force_pll(struct sprd_dphy *dphy, bool enable);
+void sprd_dphy_hs_clk_en(struct sprd_dphy *dphy, bool enable);
+void sprd_dphy_test_write(struct sprd_dphy *dphy, u8 address, u8 data);
+u8 sprd_dphy_test_read(struct sprd_dphy *dphy, u8 address);
+
+#endif /* _SPRD_DPHY_API_H_ */
\ No newline at end of file
diff --git a/drivers/gpu/drm/sprd/dsi/Makefile b/drivers/gpu/drm/sprd/dsi/Makefile
new file mode 100644
index 0000000..d95189c
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dsi/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+
+subdir-ccflags-y += -I$(srctree)/$(src)
+
+obj-y += sprd_dsi_api.o
+
+obj-y += core/
+
diff --git a/drivers/gpu/drm/sprd/dsi/core/Makefile b/drivers/gpu/drm/sprd/dsi/core/Makefile
new file mode 100644
index 0000000..41f6477
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dsi/core/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-y += dsi_ctrl_r1p0.o dsi_ctrl_r1p0_ppi.o
+
diff --git a/drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c b/drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c
new file mode 100644
index 0000000..83bc37c
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c
@@ -0,0 +1,964 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Unisoc Inc.
+ */
+
+#include <linux/io.h>
+#include <linux/init.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+
+#include "dsi_ctrl_r1p0.h"
+
+/**
+ * Get DSI Host core version
+ * @param instance pointer to structure holding the DSI Host core information
+ * @return ascii number of the version
+ */
+bool dsi_check_version(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	u32 version = readl(&reg->DSI_VERSION);
+
+	if (version == 0x100)
+		return true;
+	else if (version == 0x200)
+		return true;
+	else if (version == 0x300)
+		return true;
+	else
+		return false;
+}
+/**
+ * Modify power status of DSI Host core
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param on (1) or off (0)
+ */
+void dsi_power_enable(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(enable, &reg->SOFT_RESET);
+}
+/**
+ * Enable/disable DPI video mode
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param enable (1) - disable (0)
+ */
+void dsi_video_mode(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(0, &reg->DSI_MODE_CFG);
+}
+/**
+ * Enable command mode (Generic interface)
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param enable
+ */
+void dsi_cmd_mode(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(1, &reg->DSI_MODE_CFG);
+}
+
+bool dsi_is_cmd_mode(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	return readl(&reg->DSI_MODE_CFG);
+}
+/**
+ * Configure the read back virtual channel for the generic interface
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param vc to listen to on the line
+ */
+void dsi_rx_vcid(struct dsi_context *ctx, u8 vc)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x1C virtual_channel_id;
+
+	virtual_channel_id.val = readl(&reg->VIRTUAL_CHANNEL_ID);
+	virtual_channel_id.bits.gen_rx_vcid = vc;
+
+	writel(virtual_channel_id.val, &reg->VIRTUAL_CHANNEL_ID);
+}
+/**
+ * Write the DPI video virtual channel destination
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param vc virtual channel
+ */
+void dsi_video_vcid(struct dsi_context *ctx, u8 vc)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x1C virtual_channel_id;
+
+	virtual_channel_id.val = readl(&reg->VIRTUAL_CHANNEL_ID);
+	virtual_channel_id.bits.video_pkt_vcid = vc;
+
+	writel(virtual_channel_id.val, &reg->VIRTUAL_CHANNEL_ID);
+}
+/**
+ * Set DPI video mode type (burst/non-burst - with sync pulses or events)
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param type
+ * @return error code
+ */
+void dsi_dpi_video_burst_mode(struct dsi_context *ctx, int mode)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x38 vid_mode_cfg;
+
+	vid_mode_cfg.val = readl(&reg->VID_MODE_CFG);
+	vid_mode_cfg.bits.vid_mode_type = mode;
+
+	writel(vid_mode_cfg.val, &reg->VID_MODE_CFG);
+}
+/**
+ * Set DPI video color coding
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param color_coding enum (configuration and color depth)
+ * @return error code
+ */
+void dsi_dpi_color_coding(struct dsi_context *ctx, int coding)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x20 dpi_video_format;
+
+	dpi_video_format.val = readl(&reg->DPI_VIDEO_FORMAT);
+	dpi_video_format.bits.dpi_video_mode_format = coding;
+
+	writel(dpi_video_format.val, &reg->DPI_VIDEO_FORMAT);
+}
+/**
+ * Configure the Horizontal Line time
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param byte_cycle taken to transmit the total of the horizontal line
+ */
+void dsi_dpi_hline_time(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x2C video_line_time;
+
+	video_line_time.val = readl(&reg->VIDEO_LINE_TIME);
+	video_line_time.bits.video_line_time = byte_cycle;
+
+	writel(video_line_time.val, &reg->VIDEO_LINE_TIME);
+}
+/**
+ * Configure the Horizontal back porch time
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param byte_cycle taken to transmit the horizontal back porch
+ */
+void dsi_dpi_hbp_time(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x28 video_line_hblk_time;
+
+	video_line_hblk_time.val = readl(&reg->VIDEO_LINE_HBLK_TIME);
+	video_line_hblk_time.bits.video_line_hbp_time = byte_cycle;
+
+	writel(video_line_hblk_time.val, &reg->VIDEO_LINE_HBLK_TIME);
+}
+/**
+ * Configure the Horizontal sync time
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param byte_cycle taken to transmit the horizontal sync
+ */
+void dsi_dpi_hsync_time(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x28 video_line_hblk_time;
+
+	video_line_hblk_time.val = readl(&reg->VIDEO_LINE_HBLK_TIME);
+	video_line_hblk_time.bits.video_line_hsa_time = byte_cycle;
+
+	writel(video_line_hblk_time.val, &reg->VIDEO_LINE_HBLK_TIME);
+}
+/**
+ * Configure the vertical active lines of the video stream
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param lines
+ */
+void dsi_dpi_vact(struct dsi_context *ctx, u16 lines)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x34 video_active_lines;
+
+	video_active_lines.val = readl(&reg->VIDEO_VACTIVE_LINES);
+	video_active_lines.bits.vactive_lines = lines;
+
+	writel(video_active_lines.val, &reg->VIDEO_VACTIVE_LINES);
+}
+/**
+ * Configure the vertical front porch lines of the video stream
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param lines
+ */
+void dsi_dpi_vfp(struct dsi_context *ctx, u16 lines)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x30 video_vblk_lines;
+
+	video_vblk_lines.val = readl(&reg->VIDEO_VBLK_LINES);
+	video_vblk_lines.bits.vfp_lines = lines;
+
+	writel(video_vblk_lines.val, &reg->VIDEO_VBLK_LINES);
+}
+/**
+ * Configure the vertical back porch lines of the video stream
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param lines
+ */
+void dsi_dpi_vbp(struct dsi_context *ctx, u16 lines)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x30 video_vblk_lines;
+
+	video_vblk_lines.val = readl(&reg->VIDEO_VBLK_LINES);
+	video_vblk_lines.bits.vbp_lines = lines;
+
+	writel(video_vblk_lines.val, &reg->VIDEO_VBLK_LINES);
+}
+/**
+ * Configure the vertical sync lines of the video stream
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param lines
+ */
+void dsi_dpi_vsync(struct dsi_context *ctx, u16 lines)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x30 video_vblk_lines;
+
+	video_vblk_lines.val = readl(&reg->VIDEO_VBLK_LINES);
+	video_vblk_lines.bits.vsa_lines = lines;
+
+	writel(video_vblk_lines.val, &reg->VIDEO_VBLK_LINES);
+}
+/**
+ * Enable return to low power mode inside horizontal front porch periods when
+ *  timing allows
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param enable (1) - disable (0)
+ */
+void dsi_dpi_hporch_lp_en(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x38 vid_mode_cfg;
+
+	vid_mode_cfg.val = readl(&reg->VID_MODE_CFG);
+
+	vid_mode_cfg.bits.lp_hfp_en = enable;
+	vid_mode_cfg.bits.lp_hbp_en = enable;
+
+	writel(vid_mode_cfg.val, &reg->VID_MODE_CFG);
+}
+/**
+ * Enable return to low power mode inside vertical active lines periods when
+ *  timing allows
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param enable (1) - disable (0)
+ */
+void dsi_dpi_vporch_lp_en(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x38 vid_mode_cfg;
+
+	vid_mode_cfg.val = readl(&reg->VID_MODE_CFG);
+
+	vid_mode_cfg.bits.lp_vact_en = enable;
+	vid_mode_cfg.bits.lp_vfp_en = enable;
+	vid_mode_cfg.bits.lp_vbp_en = enable;
+	vid_mode_cfg.bits.lp_vsa_en = enable;
+
+	writel(vid_mode_cfg.val, &reg->VID_MODE_CFG);
+}
+/**
+ * Enable FRAME BTA ACK
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param enable (1) - disable (0)
+ */
+void dsi_dpi_frame_ack_en(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x38 vid_mode_cfg;
+
+	vid_mode_cfg.val = readl(&reg->VID_MODE_CFG);
+	vid_mode_cfg.bits.frame_bta_ack_en = enable;
+
+	writel(vid_mode_cfg.val, &reg->VID_MODE_CFG);
+}
+/**
+ * Write no of chunks to core - taken into consideration only when multi packet
+ * is enabled
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param no of chunks
+ */
+void dsi_dpi_chunk_num(struct dsi_context *ctx, u16 num)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x24 video_pkt_config;
+
+	video_pkt_config.val = readl(&reg->VIDEO_PKT_CONFIG);
+	video_pkt_config.bits.video_line_chunk_num = num;
+
+	writel(video_pkt_config.val, &reg->VIDEO_PKT_CONFIG);
+}
+/**
+ * Write the null packet size - will only be taken into account when null
+ * packets are enabled.
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param size of null packet
+ * @return error code
+ */
+void dsi_dpi_null_packet_size(struct dsi_context *ctx, u16 size)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0xC0 video_nullpkt_size;
+
+	video_nullpkt_size.val = readl(&reg->VIDEO_NULLPKT_SIZE);
+	video_nullpkt_size.bits.video_nullpkt_size = size;
+
+	writel(video_nullpkt_size.val, &reg->VIDEO_NULLPKT_SIZE);
+}
+/**
+ * Write video packet size. obligatory for sending video
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param size of video packet - containing information
+ * @return error code
+ */
+void dsi_dpi_video_packet_size(struct dsi_context *ctx, u16 size)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x24 video_pkt_config;
+
+	video_pkt_config.val = readl(&reg->VIDEO_PKT_CONFIG);
+	video_pkt_config.bits.video_pkt_size = size;
+
+	writel(video_pkt_config.val, &reg->VIDEO_PKT_CONFIG);
+}
+/**
+ * Specifiy the size of the packet memory write start/continue
+ * @param instance pointer to structure holding the DSI Host core information
+ * @ size of the packet
+ * @note when different than zero (0) eDPI is enabled
+ */
+void dsi_edpi_max_pkt_size(struct dsi_context *ctx, u16 size)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0xC4 dcs_wm_pkt_size;
+
+	dcs_wm_pkt_size.val = readl(&reg->DCS_WM_PKT_SIZE);
+	dcs_wm_pkt_size.bits.dcs_wm_pkt_size = size;
+
+	writel(dcs_wm_pkt_size.val, &reg->DCS_WM_PKT_SIZE);
+}
+/**
+ * Enable tear effect acknowledge
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param enable (1) - disable (0)
+ */
+void dsi_tear_effect_ack_en(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x68 cmd_mode_cfg;
+
+	cmd_mode_cfg.val = readl(&reg->CMD_MODE_CFG);
+	cmd_mode_cfg.bits.tear_fx_en = enable;
+
+	writel(cmd_mode_cfg.val, &reg->CMD_MODE_CFG);
+}
+/**
+ * Set DCS command packet transmission to transmission type
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param no_of_param of command
+ * @param lp transmit in low power
+ * @return error code
+ */
+void dsi_cmd_mode_lp_cmd_en(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x68 cmd_mode_cfg;
+
+	cmd_mode_cfg.val = readl(&reg->CMD_MODE_CFG);
+
+	cmd_mode_cfg.bits.gen_sw_0p_tx = enable;
+	cmd_mode_cfg.bits.gen_sw_1p_tx = enable;
+	cmd_mode_cfg.bits.gen_sw_2p_tx = enable;
+	cmd_mode_cfg.bits.gen_lw_tx = enable;
+	cmd_mode_cfg.bits.dcs_sw_0p_tx = enable;
+	cmd_mode_cfg.bits.dcs_sw_1p_tx = enable;
+	cmd_mode_cfg.bits.dcs_lw_tx = enable;
+	cmd_mode_cfg.bits.max_rd_pkt_size = enable;
+
+	cmd_mode_cfg.bits.gen_sr_0p_tx = enable;
+	cmd_mode_cfg.bits.gen_sr_1p_tx = enable;
+	cmd_mode_cfg.bits.gen_sr_2p_tx = enable;
+	cmd_mode_cfg.bits.dcs_sr_0p_tx = enable;
+
+	writel(cmd_mode_cfg.val, &reg->CMD_MODE_CFG);
+}
+/**
+ * Set DCS read command packet transmission to transmission type
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param no_of_param of command
+ * @param lp transmit in low power
+ * @return error code
+ */
+void dsi_video_mode_lp_cmd_en(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x38 vid_mode_cfg;
+
+	vid_mode_cfg.val = readl(&reg->VID_MODE_CFG);
+	vid_mode_cfg.bits.lp_cmd_en = enable;
+
+	writel(vid_mode_cfg.val, &reg->VID_MODE_CFG);
+}
+
+/**
+ * Write command header in the generic interface
+ * (which also sends DCS commands) as a subset
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param vc of destination
+ * @param packet_type (or type of DCS command)
+ * @param ls_byte (if DCS, it is the DCS command)
+ * @param ms_byte (only parameter of short DCS packet)
+ * @return error code
+ */
+void dsi_set_packet_header(struct dsi_context *ctx,
+				   u8 vc,
+				   u8 type,
+				   u8 wc_lsb,
+				   u8 wc_msb)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x6C gen_hdr;
+
+	gen_hdr.bits.gen_dt = type;
+	gen_hdr.bits.gen_vc = vc;
+	gen_hdr.bits.gen_wc_lsbyte = wc_lsb;
+	gen_hdr.bits.gen_wc_msbyte = wc_msb;
+
+	writel(gen_hdr.val, &reg->GEN_HDR);
+}
+/**
+ * Write the payload of the long packet commands
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param payload array of bytes of payload
+ * @return error code
+ */
+void dsi_set_packet_payload(struct dsi_context *ctx, u32 payload)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(payload, &reg->GEN_PLD_DATA);
+}
+/**
+ * Write the payload of the long packet commands
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param payload pointer to 32-bit array to hold read information
+ * @return error code
+ */
+u32 dsi_get_rx_payload(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	return readl(&reg->GEN_PLD_DATA);
+}
+
+/**
+ * Enable Bus Turn-around request
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param enable
+ */
+void dsi_bta_en(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(enable, &reg->TA_EN);
+}
+/**
+ * Enable EOTp reception
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param enable
+ */
+void dsi_eotp_rx_en(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0xBC eotp_en;
+
+	eotp_en.val = readl(&reg->EOTP_EN);
+	eotp_en.bits.rx_eotp_en = enable;
+
+	writel(eotp_en.val, &reg->EOTP_EN);
+}
+/**
+ * Enable EOTp transmission
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param enable
+ */
+void dsi_eotp_tx_en(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0xBC eotp_en;
+
+	eotp_en.val = readl(&reg->EOTP_EN);
+	eotp_en.bits.tx_eotp_en = enable;
+
+	writel(eotp_en.val, &reg->EOTP_EN);
+}
+/**
+ * Enable ECC reception, error correction and reporting
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param enable
+ */
+void dsi_ecc_rx_en(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0xB4 rx_pkt_check_config;
+
+	rx_pkt_check_config.val = readl(&reg->RX_PKT_CHECK_CONFIG);
+	rx_pkt_check_config.bits.rx_pkt_ecc_en = enable;
+
+	writel(rx_pkt_check_config.val, &reg->RX_PKT_CHECK_CONFIG);
+}
+/**
+ * Enable CRC reception, error reporting
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param enable
+ */
+void dsi_crc_rx_en(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0xB4 rx_pkt_check_config;
+
+	rx_pkt_check_config.val = readl(&reg->RX_PKT_CHECK_CONFIG);
+	rx_pkt_check_config.bits.rx_pkt_crc_en = enable;
+
+	writel(rx_pkt_check_config.val, &reg->RX_PKT_CHECK_CONFIG);
+}
+/**
+ * NOTE: dsi-ctrl-r1p0 only
+ *
+ * Get status of read command
+ * @param instance pointer to structure holding the DSI Host core information
+ * @return 1 if busy
+ */
+bool dsi_is_bta_returned(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x98 cmd_mode_status;
+
+	cmd_mode_status.val = readl(&reg->CMD_MODE_STATUS);
+
+	return cmd_mode_status.bits.gen_cmd_rdcmd_done;
+}
+/**
+ * Get the FULL status of generic read payload fifo
+ * @param instance pointer to structure holding the DSI Host core information
+ * @return 1 if fifo full
+ */
+bool dsi_is_rx_payload_fifo_full(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x98 cmd_mode_status;
+
+	cmd_mode_status.val = readl(&reg->CMD_MODE_STATUS);
+
+	return cmd_mode_status.bits.gen_cmd_rdata_fifo_full;
+}
+/**
+ * Get the EMPTY status of generic read payload fifo
+ * @param instance pointer to structure holding the DSI Host core information
+ * @return 1 if fifo empty
+ */
+bool dsi_is_rx_payload_fifo_empty(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x98 cmd_mode_status;
+
+	cmd_mode_status.val = readl(&reg->CMD_MODE_STATUS);
+
+	return cmd_mode_status.bits.gen_cmd_rdata_fifo_empty;
+}
+/**
+ * Get the FULL status of generic write payload fifo
+ * @param instance pointer to structure holding the DSI Host core information
+ * @return 1 if fifo full
+ */
+bool dsi_is_tx_payload_fifo_full(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x98 cmd_mode_status;
+
+	cmd_mode_status.val = readl(&reg->CMD_MODE_STATUS);
+
+	return cmd_mode_status.bits.gen_cmd_wdata_fifo_full;
+}
+/**
+ * Get the EMPTY status of generic write payload fifo
+ * @param instance pointer to structure holding the DSI Host core information
+ * @return 1 if fifo empty
+ */
+bool dsi_is_tx_payload_fifo_empty(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x98 cmd_mode_status;
+
+	cmd_mode_status.val = readl(&reg->CMD_MODE_STATUS);
+
+	return cmd_mode_status.bits.gen_cmd_wdata_fifo_empty;
+}
+/**
+ * Get the FULL status of generic command fifo
+ * @param instance pointer to structure holding the DSI Host core information
+ * @return 1 if fifo full
+ */
+bool dsi_is_tx_cmd_fifo_full(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x98 cmd_mode_status;
+
+	cmd_mode_status.val = readl(&reg->CMD_MODE_STATUS);
+
+	return cmd_mode_status.bits.gen_cmd_cmd_fifo_full;
+}
+/**
+ * Get the EMPTY status of generic command fifo
+ * @param instance pointer to structure holding the DSI Host core information
+ * @return 1 if fifo empty
+ */
+bool dsi_is_tx_cmd_fifo_empty(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x98 cmd_mode_status;
+
+	cmd_mode_status.val = readl(&reg->CMD_MODE_STATUS);
+
+	return cmd_mode_status.bits.gen_cmd_cmd_fifo_empty;
+}
+
+/* only if DPI */
+/**
+ * DPI interface signal delay config
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param byte_cycle period for waiting after controller receiving HSYNC from
+ *       DPI interface to start read pixel data from memory.
+ */
+void dsi_dpi_sig_delay(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0xD0 video_sig_delay_config;
+
+	video_sig_delay_config.val = readl(&reg->VIDEO_SIG_DELAY_CONFIG);
+	video_sig_delay_config.bits.video_sig_delay = byte_cycle;
+
+	writel(video_sig_delay_config.val, &reg->VIDEO_SIG_DELAY_CONFIG);
+}
+/**
+ * Configure how many cycles of byte clock would the PHY module take
+ * to switch data lane from high speed to low power
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param byte_cycle
+ * @return error code
+ */
+void dsi_datalane_hs2lp_config(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0xAC phy_datalane_time_config;
+
+	phy_datalane_time_config.val = readl(&reg->PHY_DATALANE_TIME_CONFIG);
+	phy_datalane_time_config.bits.phy_datalane_hs_to_lp_time = byte_cycle;
+
+	writel(phy_datalane_time_config.val, &reg->PHY_DATALANE_TIME_CONFIG);
+}
+/**
+ * Configure how many cycles of byte clock would the PHY module take
+ * to switch the data lane from to low power high speed
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param byte_cycle
+ * @return error code
+ */
+void dsi_datalane_lp2hs_config(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0xAC phy_datalane_time_config;
+
+	phy_datalane_time_config.val = readl(&reg->PHY_DATALANE_TIME_CONFIG);
+	phy_datalane_time_config.bits.phy_datalane_lp_to_hs_time = byte_cycle;
+
+	writel(phy_datalane_time_config.val, &reg->PHY_DATALANE_TIME_CONFIG);
+}
+/**
+ * Configure how many cycles of byte clock would the PHY module take
+ * to switch clock lane from high speed to low power
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param byte_cycle
+ * @return error code
+ */
+void dsi_clklane_hs2lp_config(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0xA8 phy_clklane_time_config;
+
+	phy_clklane_time_config.val = readl(&reg->PHY_CLKLANE_TIME_CONFIG);
+	phy_clklane_time_config.bits.phy_clklane_hs_to_lp_time = byte_cycle;
+
+	writel(phy_clklane_time_config.val, &reg->PHY_CLKLANE_TIME_CONFIG);
+}
+/**
+ * Configure how many cycles of byte clock would the PHY module take
+ * to switch clock lane from to low power high speed
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param byte_cycle
+ * @return error code
+ */
+void dsi_clklane_lp2hs_config(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0xA8 phy_clklane_time_config;
+
+	phy_clklane_time_config.val = readl(&reg->PHY_CLKLANE_TIME_CONFIG);
+	phy_clklane_time_config.bits.phy_clklane_lp_to_hs_time = byte_cycle;
+
+	writel(phy_clklane_time_config.val, &reg->PHY_CLKLANE_TIME_CONFIG);
+}
+/**
+ * Configure how many cycles of byte clock would the PHY module take
+ * to turn the bus around to start receiving
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param byte_cycle
+ * @return error code
+ */
+void dsi_max_read_time(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(byte_cycle, &reg->MAX_READ_TIME);
+}
+/**
+ * Enable the automatic mechanism to stop providing clock in the clock
+ * lane when time allows
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param enable
+ * @return error code
+ */
+void dsi_nc_clk_en(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x74 phy_clk_lane_lp_ctrl;
+
+	phy_clk_lane_lp_ctrl.val = readl(&reg->PHY_CLK_LANE_LP_CTRL);
+	phy_clk_lane_lp_ctrl.bits.auto_clklane_ctrl_en = enable;
+
+	writel(phy_clk_lane_lp_ctrl.val, &reg->PHY_CLK_LANE_LP_CTRL);
+}
+/**
+ * Write transmission escape timeout
+ * a safe guard so that the state machine would reset if transmission
+ * takes too long
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param div
+ */
+void dsi_tx_escape_division(struct dsi_context *ctx, u8 div)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(div, &reg->TX_ESC_CLK_CONFIG);
+}
+/* PRESP Time outs */
+/**
+ * configure timeout divisions (so they would have more clock ticks)
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param div no of hs cycles before transiting back to LP in
+ *  (lane_clk / div)
+ */
+void dsi_timeout_clock_division(struct dsi_context *ctx, u8 div)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(div, &reg->TIMEOUT_CNT_CLK_CONFIG);
+}
+/**
+ * Configure the Low power receive time out
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param byte_cycle (of byte cycles)
+ */
+void dsi_lp_rx_timeout(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(byte_cycle, &reg->LRX_H_TO_CONFIG);
+}
+/**
+ * Configure a high speed transmission time out
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param byte_cycle (byte cycles)
+ */
+void dsi_hs_tx_timeout(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(byte_cycle, &reg->HTX_TO_CONFIG);
+}
+/**
+ * Get the error 0 interrupt register status
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param mask the mask to be read from the register
+ * @return error status 0 value
+ */
+u32 dsi_int0_status(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x08 protocol_int_sts;
+
+	protocol_int_sts.val = readl(&reg->PROTOCOL_INT_STS);
+	writel(protocol_int_sts.val, &reg->PROTOCOL_INT_CLR);
+
+	if (protocol_int_sts.bits.dphy_errors_0)
+		DRM_ERROR("dphy_err: escape entry error\n");
+
+	if (protocol_int_sts.bits.dphy_errors_1)
+		DRM_ERROR("dphy_err: lp data transmission sync error\n");
+
+	if (protocol_int_sts.bits.dphy_errors_2)
+		DRM_ERROR("dphy_err: control error\n");
+
+	if (protocol_int_sts.bits.dphy_errors_3)
+		DRM_ERROR("dphy_err: LP0 contention error\n");
+
+	if (protocol_int_sts.bits.dphy_errors_4)
+		DRM_ERROR("dphy_err: LP1 contention error\n");
+
+	if (protocol_int_sts.bits.ack_with_err_0)
+		DRM_ERROR("ack_err: SoT error\n");
+
+	if (protocol_int_sts.bits.ack_with_err_1)
+		DRM_ERROR("ack_err: SoT Sync error\n");
+
+	if (protocol_int_sts.bits.ack_with_err_2)
+		DRM_ERROR("ack_err: EoT Sync error\n");
+
+	if (protocol_int_sts.bits.ack_with_err_3)
+		DRM_ERROR("ack_err: Escape Mode Entry Command error\n");
+
+	if (protocol_int_sts.bits.ack_with_err_4)
+		DRM_ERROR("ack_err: LP Transmit Sync error\n");
+
+	if (protocol_int_sts.bits.ack_with_err_5)
+		DRM_ERROR("ack_err: Peripheral Timeout error\n");
+
+	if (protocol_int_sts.bits.ack_with_err_6)
+		DRM_ERROR("ack_err: False Control error\n");
+
+	if (protocol_int_sts.bits.ack_with_err_7)
+		DRM_ERROR("ack_err: reserved (specific to device)\n");
+
+	if (protocol_int_sts.bits.ack_with_err_8)
+		DRM_ERROR("ack_err: ECC error, single-bit (corrected)\n");
+
+	if (protocol_int_sts.bits.ack_with_err_9)
+		DRM_ERROR("ack_err: ECC error, multi-bit (not corrected)\n");
+
+	if (protocol_int_sts.bits.ack_with_err_10)
+		DRM_ERROR("ack_err: checksum error (long packet only)\n");
+
+	if (protocol_int_sts.bits.ack_with_err_11)
+		DRM_ERROR("ack_err: not recognized DSI data type\n");
+
+	if (protocol_int_sts.bits.ack_with_err_12)
+		DRM_ERROR("ack_err: DSI VC ID Invalid\n");
+
+	if (protocol_int_sts.bits.ack_with_err_13)
+		DRM_ERROR("ack_err: invalid transmission length\n");
+
+	if (protocol_int_sts.bits.ack_with_err_14)
+		DRM_ERROR("ack_err: reserved (specific to device)\n");
+
+	if (protocol_int_sts.bits.ack_with_err_15)
+		DRM_ERROR("ack_err: DSI protocol violation\n");
+
+	return 0;
+}
+/**
+ * Get the error 1 interrupt register status
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param mask the mask to be read from the register
+ * @return error status 1 value
+ */
+u32 dsi_int1_status(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x10 internal_int_sts;
+	u32 status = 0;
+
+	internal_int_sts.val = readl(&reg->INTERNAL_INT_STS);
+	writel(internal_int_sts.val, &reg->INTERNAL_INT_CLR);
+
+	if (internal_int_sts.bits.receive_pkt_size_err)
+		DRM_ERROR("receive packet size error\n");
+
+	if (internal_int_sts.bits.eotp_not_receive_err)
+		DRM_ERROR("EoTp packet is not received\n");
+
+	if (internal_int_sts.bits.gen_cmd_cmd_fifo_wr_err)
+		DRM_ERROR("cmd header-fifo is full\n");
+
+	if (internal_int_sts.bits.gen_cmd_rdata_fifo_rd_err)
+		DRM_ERROR("cmd read-payload-fifo is empty\n");
+
+	if (internal_int_sts.bits.gen_cmd_rdata_fifo_wr_err)
+		DRM_ERROR("cmd read-payload-fifo is full\n");
+
+	if (internal_int_sts.bits.gen_cmd_wdata_fifo_wr_err)
+		DRM_ERROR("cmd write-payload-fifo is full\n");
+
+	if (internal_int_sts.bits.gen_cmd_wdata_fifo_rd_err)
+		DRM_ERROR("cmd write-payload-fifo is empty\n");
+
+	if (internal_int_sts.bits.dpi_pix_fifo_wr_err) {
+		DRM_ERROR("DPI pixel-fifo is full\n");
+		status |= DSI_INT_STS_NEED_SOFT_RESET;
+	}
+
+	if (internal_int_sts.bits.ecc_single_err)
+		DRM_ERROR("ECC single error in a received packet\n");
+
+	if (internal_int_sts.bits.ecc_multi_err)
+		DRM_ERROR("ECC multiple error in a received packet\n");
+
+	if (internal_int_sts.bits.crc_err)
+		DRM_ERROR("CRC error in the received packet payload\n");
+
+	if (internal_int_sts.bits.hs_tx_timeout)
+		DRM_ERROR("high-speed transmission timeout\n");
+
+	if (internal_int_sts.bits.lp_rx_timeout)
+		DRM_ERROR("low-power reception timeout\n");
+
+	return status;
+}
+/**
+ * Configure MASK (hiding) of interrupts coming from error 0 source
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param mask to be written to the register
+ */
+void dsi_int0_mask(struct dsi_context *ctx, u32 mask)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(mask, &reg->MASK_PROTOCOL_INT);
+}
+/**
+ * Configure MASK (hiding) of interrupts coming from error 1 source
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param mask the mask to be written to the register
+ */
+void dsi_int1_mask(struct dsi_context *ctx, u32 mask)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(mask, &reg->MASK_INTERNAL_INT);
+}
diff --git a/drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.h b/drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.h
new file mode 100644
index 0000000..08b9958
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.h
@@ -0,0 +1,1477 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 Unisoc Inc.
+ */
+
+#ifndef _DSI_CTRL_R1P0_H_
+#define _DSI_CTRL_R1P0_H_
+
+#include <asm/types.h>
+
+#include "sprd_dsi.h"
+
+struct dsi_reg {
+	union _0x00 {
+		u32 val;
+		struct _DSI_VERSION {
+		u32 dsi_version: 16;
+		u32 reserved: 16;
+		} bits;
+	} DSI_VERSION;
+
+	union _0x04 {
+		u32 val;
+		struct _SOFT_RESET {
+		/*
+		 * This bit configures the core either to work normal or to
+		 * reset. It's default value is 0. After the core configur-
+		 * ation, to enable the mipi_dsi_host, set this register to 1.
+		 * 1: power up     0: reset core
+		 */
+		u32 dsi_soft_reset: 1;
+
+		u32 reserved: 31;
+		} bits;
+	} SOFT_RESET;
+
+	union _0x08 {
+		u32 val;
+		struct _PROTOCOL_INT_STS {
+		/* ErrEsc escape entry error from Lane 0 */
+		u32 dphy_errors_0: 1;
+
+		/* ErrSyncEsc low-power data transmission synchronization
+		 * error from Lane 0
+		 */
+		u32 dphy_errors_1: 1;
+
+		/* ErrControl error from Lane 0 */
+		u32 dphy_errors_2: 1;
+
+		/* ErrContentionLP0 LP0 contention error from Lane 0 */
+		u32 dphy_errors_3: 1;
+
+		/* ErrContentionLP1 LP1 contention error from Lane 0 */
+		u32 dphy_errors_4: 1;
+
+		/* debug mode protocol errors */
+		u32 protocol_debug_err: 11;
+
+		/* SoT error from the Acknowledge error report */
+		u32 ack_with_err_0: 1;
+
+		/* SoT Sync error from the Acknowledge error report */
+		u32 ack_with_err_1: 1;
+
+		/* EoT Sync error from the Acknowledge error report */
+		u32 ack_with_err_2: 1;
+
+		/* Escape Mode Entry Command error from the Acknowledge
+		 * error report
+		 */
+		u32 ack_with_err_3: 1;
+
+		/* LP Transmit Sync error from the Acknowledge error report */
+		u32 ack_with_err_4: 1;
+
+		/* Peripheral Timeout error from the Acknowledge error report */
+		u32 ack_with_err_5: 1;
+
+		/* False Control error from the Acknowledge error report */
+		u32 ack_with_err_6: 1;
+
+		/* reserved (specific to device) from the Acknowledge error
+		 * report
+		 */
+		u32 ack_with_err_7: 1;
+
+		/* ECC error, single-bit (detected and corrected) from the
+		 * Acknowledge error report
+		 */
+		u32 ack_with_err_8: 1;
+
+		/* ECC error, multi-bit (detected, not corrected) from the
+		 * Acknowledge error report
+		 */
+		u32 ack_with_err_9: 1;
+
+		/* checksum error (long packet only) from the Acknowledge
+		 * error report
+		 */
+		u32 ack_with_err_10: 1;
+
+		/* not recognized DSI data type from the Acknowledge error
+		 * report
+		 */
+		u32 ack_with_err_11: 1;
+
+		/* DSI VC ID Invalid from the Acknowledge error report */
+		u32 ack_with_err_12: 1;
+
+		/* invalid transmission length from the Acknowledge error
+		 * report
+		 */
+		u32 ack_with_err_13: 1;
+
+		/* reserved (specific to device) from the Acknowledge error
+		 * report
+		 */
+		u32 ack_with_err_14: 1;
+
+		/* DSI protocol violation from the Acknowledge error report */
+		u32 ack_with_err_15: 1;
+
+		} bits;
+	} PROTOCOL_INT_STS;
+
+	union _0x0C {
+		u32 val;
+		struct _MASK_PROTOCOL_INT {
+		u32 mask_dphy_errors_0: 1;
+		u32 mask_dphy_errors_1: 1;
+		u32 mask_dphy_errors_2: 1;
+		u32 mask_dphy_errors_3: 1;
+		u32 mask_dphy_errors_4: 1;
+		u32 mask_protocol_debug_err: 11;
+		u32 mask_ack_with_err_0: 1;
+		u32 mask_ack_with_err_1: 1;
+		u32 mask_ack_with_err_2: 1;
+		u32 mask_ack_with_err_3: 1;
+		u32 mask_ack_with_err_4: 1;
+		u32 mask_ack_with_err_5: 1;
+		u32 mask_ack_with_err_6: 1;
+		u32 mask_ack_with_err_7: 1;
+		u32 mask_ack_with_err_8: 1;
+		u32 mask_ack_with_err_9: 1;
+		u32 mask_ack_with_err_10: 1;
+		u32 mask_ack_with_err_11: 1;
+		u32 mask_ack_with_err_12: 1;
+		u32 mask_ack_with_err_13: 1;
+		u32 mask_ack_with_err_14: 1;
+		u32 mask_ack_with_err_15: 1;
+		} bits;
+	} MASK_PROTOCOL_INT;
+
+	union _0x10 {
+		u32 val;
+		struct _INTERNAL_INT_STS {
+		/* This bit indicates that the packet size error is detected
+		 * during the packet reception.
+		 */
+		u32 receive_pkt_size_err: 1;
+
+		/* This bit indicates that the EoTp packet is not received at
+		 * the end of the incoming peripheral transmission
+		 */
+		u32 eotp_not_receive_err: 1;
+
+		/* This bit indicates that the system tried to write a command
+		 * through the Generic interface and the FIFO is full. There-
+		 * fore, the command is not written.
+		 */
+		u32 gen_cmd_cmd_fifo_wr_err: 1;
+
+		/* This bit indicates that during a DCS read data, the payload
+		 * FIFO becomes	empty and the data sent to the interface is
+		 * corrupted.
+		 */
+		u32 gen_cmd_rdata_fifo_rd_err: 1;
+
+		/* This bit indicates that during a generic interface packet
+		 * read back, the payload FIFO becomes full and the received
+		 * data is corrupted.
+		 */
+		u32 gen_cmd_rdata_fifo_wr_err: 1;
+
+		/* This bit indicates that the system tried to write a payload
+		 * data through the Generic interface and the FIFO is full.
+		 * Therefore, the payload is not written.
+		 */
+		u32 gen_cmd_wdata_fifo_wr_err: 1;
+
+		/* This bit indicates that during a Generic interface packet
+		 * build, the payload FIFO becomes empty and corrupt data is
+		 * sent.
+		 */
+		u32 gen_cmd_wdata_fifo_rd_err: 1;
+
+		/* This bit indicates that during a DPI pixel line storage,
+		 * the payload FIFO becomes full and the data stored is
+		 * corrupted.
+		 */
+		u32 dpi_pix_fifo_wr_err: 1;
+
+		/* internal debug error	*/
+		u32 internal_debug_err: 19;
+
+		/* This bit indicates that the ECC single error is detected
+		 * and corrected in a received packet.
+		 */
+		u32 ecc_single_err: 1;
+
+		/* This bit indicates that the ECC multiple error is detected
+		 * in a received packet.
+		 */
+		u32 ecc_multi_err: 1;
+
+		/* This bit indicates that the CRC error is detected in the
+		 * received packet payload.
+		 */
+		u32 crc_err: 1;
+
+		/* This bit indicates that the high-speed transmission timeout
+		 * counter reached the end and contention is detected.
+		 */
+		u32 hs_tx_timeout: 1;
+
+		/* This bit indicates that the low-power reception timeout
+		 * counter reached the end and contention is detected.
+		 */
+		u32 lp_rx_timeout: 1;
+
+		} bits;
+	} INTERNAL_INT_STS;
+
+	union _0x14 {
+		u32 val;
+		struct _MASK_INTERNAL_INT {
+		u32 mask_receive_pkt_size_err: 1;
+		u32 mask_eopt_not_receive_err: 1;
+		u32 mask_gen_cmd_cmd_fifo_wr_err: 1;
+		u32 mask_gen_cmd_rdata_fifo_rd_err: 1;
+		u32 mask_gen_cmd_rdata_fifo_wr_err: 1;
+		u32 mask_gen_cmd_wdata_fifo_wr_err: 1;
+		u32 mask_gen_cmd_wdata_fifo_rd_err: 1;
+		u32 mask_dpi_pix_fifo_wr_err: 1;
+		u32 mask_internal_debug_err: 19;
+		u32 mask_ecc_single_err: 1;
+		u32 mask_ecc_multi_err: 1;
+		u32 mask_crc_err: 1;
+		u32 mask_hs_tx_timeout: 1;
+		u32 mask_lp_rx_timeout: 1;
+		} bits;
+	} MASK_INTERNAL_INT;
+
+	union _0x18 {
+		u32 val;
+		struct _DSI_MODE_CFG {
+		/* This bit configures the operation mode
+		 * 0: Video mode ;   1: Command mode
+		 */
+		u32 cmd_video_mode: 1;
+
+		u32 reserved: 31;
+
+		} bits;
+	} DSI_MODE_CFG;
+
+	union _0x1C {
+		u32 val;
+		struct _VIRTUAL_CHANNEL_ID {
+		/* This field indicates the Generic interface read-back
+		 * virtual channel identification
+		 */
+		u32 gen_rx_vcid: 2;
+
+		/* This field configures the DPI virtual channel id that
+		 * is indexed to the VIDEO mode packets
+		 */
+		u32 video_pkt_vcid: 2;
+
+		u32 reserved: 28;
+
+		} bits;
+	} VIRTUAL_CHANNEL_ID;
+
+	union _0x20 {
+		u32 val;
+		struct _DPI_VIDEO_FORMAT {
+		/*
+		 * This field configures the DPI color coding as follows:
+		 * 0000: 16-bit configuration 1
+		 * 0001: 16-bit configuration 2
+		 * 0010: 16-bit configuration 3
+		 * 0011: 18-bit configuration 1
+		 * 0100: 18-bit configuration 2
+		 * 0101: 24-bit
+		 * 0110: 20-bit YCbCr 4:2:2 loosely packed
+		 * 0111: 24-bit YCbCr 4:2:2
+		 * 1000: 16-bit YCbCr 4:2:2
+		 * 1001: 30-bit
+		 * 1010: 36-bit
+		 * 1011: 12-bit YCbCr 4:2:0
+		 * 1100: Compression Display Stream
+		 * 1101-1111: 12-bit YCbCr 4:2:0
+		 */
+		u32 dpi_video_mode_format: 6;
+
+		/* When set to 1, this bit activates loosely packed
+		 * variant to 18-bit configurations
+		 */
+		u32 loosely18_en: 1;
+
+		u32 reserved: 25;
+
+		} bits;
+	} DPI_VIDEO_FORMAT;
+
+	union _0x24 {
+		u32 val;
+		struct _VIDEO_PKT_CONFIG {
+		/*
+		 * This field configures the number of pixels in a single
+		 * video packet. For 18-bit not loosely packed data types,
+		 * this number must be a multiple of 4. For YCbCr data
+		 * types, it must be a multiple of 2, as described in the
+		 * DSI specification.
+		 */
+		u32 video_pkt_size: 16;
+
+		/*
+		 * This register configures the number of chunks to be
+		 * transmitted during a Line period (a chunk consists of
+		 * a video packet and a null packet). If set to 0 or 1,
+		 * the video line is transmitted in a single packet. If
+		 * set to 1, the packet is part of a chunk, so a null packet
+		 * follows it if vid_null_size > 0. Otherwise, multiple chunks
+		 * are used to transmit each video line.
+		 */
+		u32 video_line_chunk_num: 16;
+
+		} bits;
+	} VIDEO_PKT_CONFIG;
+
+	union _0x28 {
+		u32 val;
+		struct _VIDEO_LINE_HBLK_TIME {
+		/* This field configures the Horizontal Back Porch period
+		 * in lane byte clock cycles
+		 */
+		u32 video_line_hbp_time: 16;
+
+		/* This field configures the Horizontal Synchronism Active
+		 * period in lane byte clock cycles
+		 */
+		u32 video_line_hsa_time: 16;
+
+		} bits;
+	} VIDEO_LINE_HBLK_TIME;
+
+	union _0x2C {
+		u32 val;
+		struct _VIDEO_LINE_TIME {
+		/* This field configures the size of the total line time
+		 * (HSA+HBP+HACT+HFP) counted in lane byte clock cycles
+		 */
+		u32 video_line_time: 16;
+
+		u32 reserved: 16;
+
+		} bits;
+	} VIDEO_LINE_TIME;
+
+	union _0x30 {
+		u32 val;
+		struct _VIDEO_VBLK_LINES {
+		/* This field configures the Vertical Front Porch period
+		 * measured in number of horizontal lines
+		 */
+		u32 vfp_lines: 10;
+
+		/* This field configures the Vertical Back Porch period
+		 * measured in number of horizontal lines
+		 */
+		u32 vbp_lines: 10;
+
+		/* This field configures the Vertical Synchronism Active
+		 * period measured in number of horizontal lines
+		 */
+		u32 vsa_lines: 10;
+
+		u32 reserved: 2;
+
+		} bits;
+	} VIDEO_VBLK_LINES;
+
+	union _0x34 {
+		u32 val;
+		struct _VIDEO_VACTIVE_LINES {
+		/* This field configures the Vertical Active period measured
+		 * in number of horizontal lines
+		 */
+		u32 vactive_lines: 14;
+
+		u32 reserved: 18;
+
+		} bits;
+	} VIDEO_VACTIVE_LINES;
+
+	union _0x38 {
+		u32 val;
+		struct _VID_MODE_CFG {
+		/*
+		 * This field indicates the video mode transmission type as
+		 * follows:
+		 * 00: Non-burst with sync pulses
+		 * 01: Non-burst with sync events
+		 * 10 and 11: Burst mode
+		 */
+		u32 vid_mode_type: 2;
+
+		u32 reserved_0: 6;
+
+		/* When set to 1, this bit enables the return to low-power
+		 * inside the VSA period when timing allows.
+		 */
+		u32 lp_vsa_en: 1;
+
+		/* When set to 1, this bit enables the return to low-power
+		 * inside the VBP period when timing allows.
+		 */
+		u32 lp_vbp_en: 1;
+
+		/* When set to 1, this bit enables the return to low-power
+		 * inside the VFP period when timing allows.
+		 */
+		u32 lp_vfp_en: 1;
+
+		/* When set to 1, this bit enables the return to low-power
+		 * inside the VACT period when timing allows.
+		 */
+		u32 lp_vact_en: 1;
+
+		/* When set to 1, this bit enables the return to low-power
+		 * inside the HBP period when timing allows.
+		 */
+		u32 lp_hbp_en: 1;
+
+		/* When set to 1, this bit enables the return to low-power
+		 * inside the HFP period when timing allows.
+		 */
+		u32 lp_hfp_en: 1;
+
+		/* When set to 1, this bit enables the request for an ack-
+		 * nowledge response at the end of a frame.
+		 */
+		u32 frame_bta_ack_en: 1;
+
+		/* When set to 1, this bit enables the command transmission
+		 * only in low-power mode.
+		 */
+		u32 lp_cmd_en: 1;
+
+		u32 reserved_1: 16;
+
+		} bits;
+	} VID_MODE_CFG;
+
+	union _0x3C {
+		u32 val;
+		struct _SDF_MODE_CONFIG {
+		/*
+		 * This field defines the 3D mode on/off & display orientation:
+		 * 00: 3D mode off (2D mode on)
+		 * 01: 3D mode on, portrait orientation
+		 * 10: 3D mode on, landscape orientation
+		 * 11: Reserved
+		 */
+		u32 rf_3d_mode: 2;
+
+		/*
+		 * This field defines the 3D image format:
+		 * 00: Line (alternating lines of left and right data)
+		 * 01: Frame (alternating frames of left and right data)
+		 * 10: Pixel (alternating pixels of left and right data)
+		 * 11: Reserved
+		 */
+		u32 rf_3d_format: 2;
+
+		/*
+		 * This field defines whether there is a second VSYNC pulse
+		 * between Left and Right Images, when 3D Image Format is
+		 * Frame-based:
+		 * 0: No sync pulses between left and right data
+		 * 1: Sync pulse (HSYNC, VSYNC, blanking) between left and
+		 *    right data
+		 */
+		u32 second_vsync_en: 1;
+
+		/*
+		 * This bit defines the left or right order:
+		 * 0: Left eye data is sent first, and then the right eye data
+		 *    is sent.
+		 * 1: Right eye data is sent first, and then the left eye data
+		 *    is sent.
+		 */
+		u32 left_right_order: 1;
+
+		u32 reserved_0: 2;
+
+		/*
+		 * When set, causes the next VSS packet to include 3D control
+		 * payload in every VSS packet.
+		 */
+		u32 rf_3d_payload_en: 1;
+
+		u32 reserved_1: 23;
+
+		} bits;
+	} SDF_MODE_CONFIG;
+
+	union _0x40 {
+		u32 val;
+		struct _TIMEOUT_CNT_CLK_CONFIG {
+		/*
+		 * This field indicates the division factor for the Time Out
+		 * clock used as the timing unit in the configuration of HS to
+		 * LP and LP to HS transition error.
+		 */
+		u32 timeout_cnt_clk_config: 16;
+
+		u32 reserved: 16;
+
+		} bits;
+	} TIMEOUT_CNT_CLK_CONFIG;
+
+	union _0x44 {
+		u32 val;
+		struct _HTX_TO_CONFIG {
+		/*
+		 * This field configures the timeout counter that triggers
+		 * a high speed transmission timeout contention detection
+		 * (measured in TO_CLK_DIVISION cycles).
+		 *
+		 * If using the non-burst mode and there is no sufficient
+		 * time to switch from HS to LP and back in the period which
+		 * is from one line data finishing to the next line sync
+		 * start, the DSI link returns the LP state once per frame,
+		 * then you should configure the TO_CLK_DIVISION and
+		 * hstx_to_cnt to be in accordance with:
+		 * hstx_to_cnt * lanebyteclkperiod * TO_CLK_DIVISION >= the
+		 * time of one FRAME data transmission * (1 + 10%)
+		 *
+		 * In burst mode, RGB pixel packets are time-compressed,
+		 * leaving more time during a scan line. Therefore, if in
+		 * burst mode and there is sufficient time to switch from HS
+		 * to LP and back in the period of time from one line data
+		 * finishing to the next line sync start, the DSI link can
+		 * return LP mode and back in this time interval to save power.
+		 * For this, configure the TO_CLK_DIVISION and hstx_to_cnt
+		 * to be in accordance with:
+		 * hstx_to_cnt * lanebyteclkperiod * TO_CLK_DIVISION >= the
+		 * time of one LINE data transmission * (1 + 10%)
+		 */
+		u32 htx_to_cnt_limit: 32;
+		} bits;
+	} HTX_TO_CONFIG;
+
+	union _0x48 {
+		u32 val;
+		struct _LRX_H_TO_CONFIG {
+		/*
+		 * This field configures the timeout counter that triggers
+		 * a low-power reception timeout contention detection (measured
+		 * in TO_CLK_DIVISION cycles).
+		 */
+		u32 lrx_h_to_cnt_limit: 32;
+		} bits;
+	} LRX_H_TO_CONFIG;
+
+	union _0x4C {
+		u32 val;
+		struct _RD_PRESP_TO_CONFIG {
+		/*
+		 * This field sets a period for which the DWC_mipi_dsi_host
+		 * keeps the link still, after sending a low-power read oper-
+		 * ation. This period is measured in cycles of lanebyteclk.
+		 * The counting starts when the D-PHY enters the Stop state
+		 * and causes no interrupts.
+		 */
+		u32 lprd_presp_to_cnt_limit: 16;
+
+		/*
+		 * This field sets a period for which the DWC_mipi_dsi_host
+		 * keeps the link still, after sending a high-speed read oper-
+		 * ation. This period is measured in cycles of lanebyteclk.
+		 * The counting starts when the D-PHY enters the Stop state
+		 * and causes no interrupts.
+		 */
+		u32 hsrd_presp_to_cnt_limit: 16;
+
+		} bits;
+	} RD_PRESP_TO_CONFIG;
+
+	union _0x50 {
+		u32 val;
+		struct _HSWR_PRESP_TO_CONFIG {
+		/*
+		 * This field sets a period for which the DWC_mipi_dsi_host
+		 * keeps the link inactive after sending a high-speed write
+		 * operation. This period is measured in cycles of lanebyteclk.
+		 * The counting starts when the D-PHY enters the Stop state
+		 * and causes no interrupts.
+		 */
+		u32 hswr_presp_to_cnt_limit: 16;
+
+		u32 reserved_0: 8;
+
+		/*
+		 * When set to 1, this bit ensures that the peripheral response
+		 * timeout caused by hs_wr_to_cnt is used only once per eDPI
+		 * frame, when both the following conditions are met:
+		 * dpivsync_edpiwms has risen and fallen.
+		 * Packets originated from eDPI have been transmitted and its
+		 * FIFO is empty again In this scenario no non-eDPI requests
+		 * are sent to the D-PHY, even if there is traffic from generic
+		 * or DBI ready to be sent, making it return to stop state.
+		 * When it does so, PRESP_TO counter is activated and only when
+		 * it finishes does the controller send any other traffic that
+		 * is ready.
+		 */
+		u32 hswr_presp_to_mode: 1;
+
+		u32 reserved_1: 7;
+
+		} bits;
+	} HSWR_PRESP_TO_CONFIG;
+
+	union _0x54 {
+		u32 val;
+		struct _LPWR_PRESP_TO_CONFIG {
+		/*
+		 * This field sets a period for which the DWC_mipi_dsi_host
+		 * keeps the link still, after sending a low-power write oper-
+		 * ation. This period is measured in cycles of lanebyteclk.
+		 * The counting starts when the D-PHY enters the Stop state
+		 * and causes no interrupts.
+		 */
+		u32 lpwr_presp_to_cnt_limit: 16;
+
+		u32 reserved: 16;
+
+		} bits;
+	} LPWR_PRESP_TO_CONFIG;
+
+	union _0x58 {
+		u32 val;
+		struct _BTA_PRESP_TO_CONFIG {
+		/*
+		 * This field sets a period for which the DWC_mipi_dsi_host
+		 * keeps the link still, after completing a Bus Turn-Around.
+		 * This period is measured in cycles of lanebyteclk. The
+		 * counting starts when the D-PHY enters the Stop state and
+		 * causes no interrupts.
+		 */
+		u32 bta_presp_to_cnt_limit: 16;
+
+		u32 reserved: 16;
+
+		} bits;
+	} BTA_PRESP_TO_CONFIG;
+
+	union _0x5C {
+		u32 val;
+		struct _TX_ESC_CLK_CONFIG {
+		/*
+		 * This field indicates the division factor for the TX Escape
+		 * clock source (lanebyteclk). The values 0 and 1 stop the
+		 * TX_ESC clock generation.
+		 */
+		u32 tx_esc_clk_config: 16;
+
+		u32 reserved: 16;
+
+		} bits;
+	} TX_ESC_CLK_CONFIG;
+
+	union _0x60 {
+		u32 val;
+		struct _VACT_CMD_TRANS_LIMIT {
+		/*
+		 * This field is used for the transmission of commands in
+		 * low-power mode. It defines the size, in bytes, of the
+		 * largest packet that can fit in a line during the VACT
+		 * region.
+		 */
+		u32 vact_cmd_trans_limit: 8;
+
+		u32 reserved: 24;
+
+		} bits;
+	} VACT_CMD_TRANS_LIMIT;
+
+	union _0x64 {
+		u32 val;
+		struct _VBLK_CMD_TRANS_LIMIT {
+		/*
+		 * This field is used for the transmission of commands in
+		 * low-power mode. It defines the size, in bytes, of the
+		 * largest packet that can fit in a line during the VSA, VBP,
+		 * and VFP regions.
+		 */
+		u32 vblk_cmd_trans_limit: 8;
+
+		u32 reserved: 24;
+
+		} bits;
+	} VBLK_CMD_TRANS_LIMIT;
+
+	union _0x68 {
+		u32 val;
+		struct _CMD_MODE_CFG {
+		/*
+		 * When set to 1, this bit enables the tearing effect
+		 * acknowledge request.
+		 */
+		u32 tear_fx_en: 1;
+
+		/*
+		 * When set to 1, this bit enables the acknowledge request
+		 * after each packet transmission.
+		 */
+		u32 ack_rqst_en: 1;
+
+		u32 reserved_0: 3;
+
+		u32 pps_tx: 1;
+		u32 exq_tx: 1;
+		u32 cmc_tx: 1;
+
+		/*
+		 * This bit configures the Generic short write packet with
+		 * zero parameter command transmission type:
+		 * 0: High-speed 1: Low-power
+		 */
+		u32 gen_sw_0p_tx: 1;
+
+		/*
+		 * This bit configures the Generic short write packet with
+		 * one parameter command transmission type:
+		 * 0: High-speed 1: Low-power
+		 */
+		u32 gen_sw_1p_tx: 1;
+
+		/*
+		 * This bit configures the Generic short write packet with
+		 * two parameters command transmission type:
+		 * 0: High-speed 1: Low-power
+		 */
+		u32 gen_sw_2p_tx: 1;
+
+		/*
+		 * This bit configures the Generic short read packet with
+		 * zero parameter command transmission type:
+		 * 0: High-speed 1: Low-power
+		 */
+		u32 gen_sr_0p_tx: 1;
+
+		/*
+		 * This bit configures the Generic short read packet with
+		 * one parameter command transmission type:
+		 * 0: High-speed 1: Low-power
+		 */
+		u32 gen_sr_1p_tx: 1;
+
+		/*
+		 * This bit configures the Generic short read packet with
+		 * two parameters command transmission type:
+		 * 0: High-speed 1: Low-power
+		 */
+		u32 gen_sr_2p_tx: 1;
+
+		/*
+		 * This bit configures the Generic long write packet command
+		 * transmission type:
+		 * 0: High-speed 1: Low-power
+		 */
+		u32 gen_lw_tx: 1;
+
+		u32 reserved_1: 1;
+
+		/*
+		 * This bit configures the DCS short write packet with zero
+		 * parameter command transmission type:
+		 * 0: High-speed 1: Low-power
+		 */
+		u32 dcs_sw_0p_tx: 1;
+
+		/*
+		 * This bit configures the DCS short write packet with one
+		 * parameter command transmission type:
+		 * 0: High-speed 1: Low-power
+		 */
+		u32 dcs_sw_1p_tx: 1;
+
+		/*
+		 * This bit configures the DCS short read packet with zero
+		 * parameter command transmission type:
+		 * 0: High-speed 1: Low-power
+		 */
+		u32 dcs_sr_0p_tx: 1;
+
+		/*
+		 * This bit configures the DCS long write packet command
+		 * transmission type:
+		 * 0: High-speed 1: Low-power
+		 */
+		u32 dcs_lw_tx: 1;
+
+		u32 reserved_2: 4;
+
+		/*
+		 * This bit configures the maximum read packet size command
+		 * transmission type:
+		 * 0: High-speed 1: Low-power
+		 */
+		u32 max_rd_pkt_size: 1;
+
+		u32 reserved_3: 7;
+
+		} bits;
+	} CMD_MODE_CFG;
+
+	union _0x6C {
+		u32 val;
+		struct _GEN_HDR {
+		/*
+		 * This field configures the packet data type of the header
+		 * packet.
+		 */
+		u32 gen_dt: 6;
+
+		/*
+		 * This field configures the virtual channel id of the header
+		 * packet.
+		 */
+		u32 gen_vc: 2;
+
+		/*
+		 * This field configures the least significant byte of the
+		 * header packet's Word count for long packets or data 0 for
+		 * short packets.
+		 */
+		u32 gen_wc_lsbyte: 8;
+
+		/*
+		 * This field configures the most significant byte of the
+		 * header packet's word count for long packets or data 1 for
+		 * short packets.
+		 */
+		u32 gen_wc_msbyte: 8;
+
+		u32 reserved: 8;
+
+		} bits;
+	} GEN_HDR;
+
+	union _0x70 {
+		u32 val;
+		struct _GEN_PLD_DATA {
+		/* This field indicates byte 1 of the packet payload. */
+		u32 gen_pld_b1: 8;
+
+		/* This field indicates byte 2 of the packet payload. */
+		u32 gen_pld_b2: 8;
+
+		/* This field indicates byte 3 of the packet payload. */
+		u32 gen_pld_b3: 8;
+
+		/* This field indicates byte 4 of the packet payload. */
+		u32 gen_pld_b4: 8;
+
+		} bits;
+	} GEN_PLD_DATA;
+
+	union _0x74 {
+		u32 val;
+		struct _PHY_CLK_LANE_LP_CTRL {
+		/* This bit controls the D-PHY PPI txrequestclkhs signal */
+		u32 phy_clklane_tx_req_hs: 1;
+
+		/* This bit enables the automatic mechanism to stop providing
+		 * clock in the clock lane when time allows.
+		 */
+		u32 auto_clklane_ctrl_en: 1;
+
+		u32 reserved: 30;
+		} bits;
+	} PHY_CLK_LANE_LP_CTRL;
+
+	union _0x78 {
+		u32 val;
+		struct _PHY_INTERFACE_CTRL {
+		/* When set to 0, this bit places the D-PHY macro in power-
+		 * down state.
+		 */
+		u32 rf_phy_shutdown: 1;
+
+		/* When set to 0, this bit places the digital section of the
+		 * D-PHY in the reset state.
+		 */
+		u32 rf_phy_reset_n: 1;
+
+		/* When set to 1, this bit enables the D-PHY Clock Lane
+		 * module.
+		 */
+		u32 rf_phy_clk_en: 1;
+
+		/* When the D-PHY is in ULPS, this bit enables the D-PHY PLL. */
+		u32 rf_phy_force_pll: 1;
+
+		/* ULPS mode Request on clock lane */
+		u32 rf_phy_clk_txrequlps: 1;
+
+		/* ULPS mode Exit on clock lane */
+		u32 rf_phy_clk_txexitulps: 1;
+
+		/* ULPS mode Request on all active data lanes */
+		u32 rf_phy_data_txrequlps: 1;
+
+		/* ULPS mode Exit on all active data lanes */
+		u32 rf_phy_data_txexitulps: 1;
+
+		u32 reserved: 24;
+		} bits;
+	} PHY_INTERFACE_CTRL;
+
+	union _0x7C {
+		u32 val;
+		struct _PHY_TX_TRIGGERS {
+		/* This field controls the trigger transmissions. */
+		u32 phy_tx_triggers: 4;
+
+		u32 reserved: 28;
+		} bits;
+	} PHY_TX_TRIGGERS;
+
+	union _0x80 {
+		u32 val;
+		struct _DESKEW_START {
+		u32 deskew_start: 1;
+		u32 reserved: 31;
+		} bits;
+	} DESKEW_START;
+
+	union _0x84 {
+		u32 val;
+		struct _DESKEW_MODE {
+		u32 deskew_mode: 2;
+		u32 reserved: 30;
+		} bits;
+	} DESKEW_MODE;
+
+	union _0x88 {
+		u32 val;
+		struct _DESKEW_TIME {
+		u32 deskew_time: 32;
+		} bits;
+	} DESKEW_TIME;
+
+	union _0x8C {
+		u32 val;
+		struct _DESKEW_PERIOD {
+		u32 deskew_period: 32;
+		} bits;
+	} DESKEW_PERIOD;
+
+	union _0x90 {
+		u32 val;
+		struct _DESKEW_BUSY {
+		u32 deskew_busy: 1;
+		u32 reserved: 31;
+		} bits;
+	} DESKEW_BUSY;
+
+	union _0x94 {
+		u32 val;
+		struct _DESKEW_LANE_MASK {
+		u32 deskew_lane0_mask: 1;
+		u32 deskew_lane1_mask: 1;
+		u32 deskew_lane2_mask: 1;
+		u32 deskew_lane3_mask: 1;
+		u32 reserved: 28;
+		} bits;
+	} DESKEW_LANE_MASK;
+
+	union _0x98 {
+		u32 val;
+		struct _CMD_MODE_STATUS {
+		/*
+		 * This bit is set when a read command is issued and cleared
+		 * when the entire response is stored in the FIFO.
+		 * Value after reset: 0x0
+		 *
+		 * NOTE:
+		 * For mipi-dsi-r1p0 IP, this bit is set immediately when
+		 *     the read cmd is set to the GEN_HDR register.
+		 *
+		 * For dsi-ctrl-r1p0 IP, this bit is set only after the read
+		 *     cmd was actually sent out from the controller.
+		 */
+		u32 gen_cmd_rdcmd_ongoing: 1;
+
+		/*
+		 * This bit indicates the empty status of the generic read
+		 * payload FIFO.
+		 * Value after reset: 0x1
+		 */
+		u32 gen_cmd_rdata_fifo_empty: 1;
+
+		/*
+		 * This bit indicates the full status of the generic read
+		 * payload FIFO.
+		 * Value after reset: 0x0
+		 */
+		u32 gen_cmd_rdata_fifo_full: 1;
+
+		/*
+		 * This bit indicates the empty status of the generic write
+		 * payload FIFO.
+		 * Value after reset: 0x1
+		 */
+		u32 gen_cmd_wdata_fifo_empty: 1;
+
+		/*
+		 * This bit indicates the full status of the generic write
+		 * payload FIFO.
+		 * Value after reset: 0x0
+		 */
+		u32 gen_cmd_wdata_fifo_full: 1;
+
+		/*
+		 * This bit indicates the empty status of the generic
+		 * command FIFO.
+		 * Value after reset: 0x1
+		 */
+		u32 gen_cmd_cmd_fifo_empty: 1;
+
+		/*
+		 * This bit indicates the full status of the generic
+		 * command FIFO.
+		 * Value after reset: 0x0
+		 */
+		u32 gen_cmd_cmd_fifo_full: 1;
+
+		/*
+		 * This bit is set when the entire response of read is
+		 * stored in the rx payload FIFO. And it will be cleared
+		 * automaticlly after read this bit each time.
+		 * Value after reset: 0x0
+		 *
+		 * NOTE: this bit is just supported for dsi-ctrl-r1p0 IP
+		 */
+		u32 gen_cmd_rdcmd_done: 1;
+
+		u32 reserved : 24;
+
+		} bits;
+	} CMD_MODE_STATUS;
+
+	union _0x9C {
+		u32 val;
+		struct _PHY_STATUS {
+		/* the status of phydirection D-PHY signal */
+		u32 phy_direction: 1;
+
+		/* the status of phylock D-PHY signal */
+		u32 phy_lock: 1;
+
+		/* the status of rxulpsesc0lane D-PHY signal */
+		u32 phy_rxulpsesc0lane: 1;
+
+		/* the status of phystopstateclklane D-PHY signal */
+		u32 phy_stopstateclklane: 1;
+
+		/* the status of phystopstate0lane D-PHY signal */
+		u32 phy_stopstate0lane: 1;
+
+		/* the status of phystopstate1lane D-PHY signal */
+		u32 phy_stopstate1lane: 1;
+
+		/* the status of phystopstate2lane D-PHY signal */
+		u32 phy_stopstate2lane: 1;
+
+		/* the status of phystopstate3lane D-PHY signal */
+		u32 phy_stopstate3lane: 1;
+
+		/* the status of phyulpsactivenotclk D-PHY signal */
+		u32 phy_ulpsactivenotclk: 1;
+
+		/* the status of ulpsactivenot0lane D-PHY signal */
+		u32 phy_ulpsactivenot0lane: 1;
+
+		/* the status of ulpsactivenot1lane D-PHY signal */
+		u32 phy_ulpsactivenot1lane: 1;
+
+		/* the status of ulpsactivenot2lane D-PHY signal */
+		u32 phy_ulpsactivenot2lane: 1;
+
+		/* the status of ulpsactivenot3lane D-PHY signal */
+		u32 phy_ulpsactivenot3lane: 1;
+
+		u32 reserved: 19;
+
+		} bits;
+	} PHY_STATUS;
+
+	union _0xA0 {
+		u32 val;
+		struct _PHY_MIN_STOP_TIME {
+		/* This field configures the minimum wait period to request
+		 * a high-speed transmission after the Stop state.
+		 */
+		u32 phy_min_stop_time: 8;
+
+		u32 reserved: 24;
+		} bits;
+	} PHY_MIN_STOP_TIME;
+
+	union _0xA4 {
+		u32 val;
+		struct _PHY_LANE_NUM_CONFIG {
+		/*
+		 * This field configures the number of active data lanes:
+		 * 00: One data lane (lane 0)
+		 * 01: Two data lanes (lanes 0 and 1)
+		 * 10: Three data lanes (lanes 0, 1, and 2)
+		 * 11: Four data lanes (lanes 0, 1, 2, and 3)
+		 */
+		u32 phy_lane_num: 2;
+
+		u32 reserved: 30;
+
+		} bits;
+	} PHY_LANE_NUM_CONFIG;
+
+	union _0xA8 {
+		u32 val;
+		struct _PHY_CLKLANE_TIME_CONFIG {
+		/*
+		 * This field configures the maximum time that the D-PHY
+		 * clock lane takes to go from low-power to high-speed
+		 * transmission measured in lane byte clock cycles.
+		 */
+		u32 phy_clklane_lp_to_hs_time: 16;
+
+		/*
+		 * This field configures the maximum time that the D-PHY
+		 * clock lane takes to go from high-speed to low-power
+		 * transmission measured in lane byte clock cycles.
+		 */
+		u32 phy_clklane_hs_to_lp_time: 16;
+
+		} bits;
+	} PHY_CLKLANE_TIME_CONFIG;
+
+	union _0xAC {
+		u32 val;
+		struct _PHY_DATALANE_TIME_CONFIG {
+		/*
+		 * This field configures the maximum time that the D-PHY data
+		 * lanes take to go from low-power to high-speed transmission
+		 * measured in lane byte clock cycles.
+		 */
+		u32 phy_datalane_lp_to_hs_time: 16;
+
+		/*
+		 * This field configures the maximum time that the D-PHY data
+		 * lanes take to go from high-speed to low-power transmission
+		 * measured in lane byte clock cycles.
+		 */
+		u32 phy_datalane_hs_to_lp_time: 16;
+
+		} bits;
+	} PHY_DATALANE_TIME_CONFIG;
+
+	union _0xB0 {
+		u32 val;
+		struct _MAX_READ_TIME {
+		/*
+		 * This field configures the maximum time required to perform
+		 * a read command in lane byte clock cycles. This register can
+		 * only be modified when no read command is in progress.
+		 */
+		u32 max_rd_time: 16;
+
+		u32 reserved: 16;
+
+		} bits;
+	} MAX_READ_TIME;
+
+	union _0xB4 {
+		u32 val;
+		struct _RX_PKT_CHECK_CONFIG {
+		/* When set to 1, this bit enables the ECC reception, error
+		 * correction, and reporting.
+		 */
+		u32 rx_pkt_ecc_en: 1;
+
+		/* When set to 1, this bit enables the CRC reception and error
+		 * reporting.
+		 */
+		u32 rx_pkt_crc_en: 1;
+
+		u32 reserved: 30;
+
+		} bits;
+	} RX_PKT_CHECK_CONFIG;
+
+	union _0xB8 {
+		u32 val;
+		struct _TA_EN {
+		/* When set to 1, this bit enables the Bus Turn-Around (BTA)
+		 * request.
+		 */
+		u32 ta_en: 1;
+
+		u32 reserved: 31;
+
+		} bits;
+	} TA_EN;
+
+	union _0xBC {
+		u32 val;
+		struct _EOTP_EN {
+		/* When set to 1, this bit enables the EoTp transmission */
+		u32 tx_eotp_en: 1;
+
+		/* When set to 1, this bit enables the EoTp reception. */
+		u32 rx_eotp_en: 1;
+
+		u32 reserved: 30;
+
+		} bits;
+	} EOTP_EN;
+
+	union _0xC0 {
+		u32 val;
+		struct _VIDEO_NULLPKT_SIZE {
+		/*
+		 * This register configures the number of bytes inside a null
+		 * packet. Setting it to 0 disables the null packets.
+		 */
+		u32 video_nullpkt_size: 13;
+
+		u32 reserved: 19;
+
+		} bits;
+	} VIDEO_NULLPKT_SIZE;
+
+	union _0xC4 {
+		u32 val;
+		struct _DCS_WM_PKT_SIZE {
+		/*
+		 * This field configures the maximum allowed size for an eDPI
+		 * write memory command, measured in pixels. Automatic parti-
+		 * tioning of data obtained from eDPI is permanently enabled.
+		 */
+		u32 dcs_wm_pkt_size: 16;
+
+		u32 reserved: 16;
+		} bits;
+	} DCS_WM_PKT_SIZE;
+
+	union _0xC8 {
+		u32 val;
+		struct _PROTOCOL_INT_CLR {
+		u32 clr_dphy_errors_0: 1;
+		u32 clr_dphy_errors_1: 1;
+		u32 clr_dphy_errors_2: 1;
+		u32 clr_dphy_errors_3: 1;
+		u32 clr_dphy_errors_4: 1;
+		u32 clr_protocol_debug_err: 11;
+		u32 clr_ack_with_err_0: 1;
+		u32 clr_ack_with_err_1: 1;
+		u32 clr_ack_with_err_2: 1;
+		u32 clr_ack_with_err_3: 1;
+		u32 clr_ack_with_err_4: 1;
+		u32 clr_ack_with_err_5: 1;
+		u32 clr_ack_with_err_6: 1;
+		u32 clr_ack_with_err_7: 1;
+		u32 clr_ack_with_err_8: 1;
+		u32 clr_ack_with_err_9: 1;
+		u32 clr_ack_with_err_10: 1;
+		u32 clr_ack_with_err_11: 1;
+		u32 clr_ack_with_err_12: 1;
+		u32 clr_ack_with_err_13: 1;
+		u32 clr_ack_with_err_14: 1;
+		u32 clr_ack_with_err_15: 1;
+		} bits;
+	} PROTOCOL_INT_CLR;
+
+	union _0xCC {
+		u32 val;
+		struct _INTERNAL_INT_CLR {
+		u32 clr_receive_pkt_size_err: 1;
+		u32 clr_eopt_not_receive_err: 1;
+		u32 clr_gen_cmd_cmd_fifo_wr_err: 1;
+		u32 clr_gen_cmd_rdata_fifo_rd_err: 1;
+		u32 clr_gen_cmd_rdata_fifo_wr_err: 1;
+		u32 clr_gen_cmd_wdata_fifo_wr_err: 1;
+		u32 clr_gen_cmd_wdata_fifo_rd_err: 1;
+		u32 clr_dpi_pix_fifo_wr_err: 1;
+		u32 clr_internal_debug_err: 19;
+		u32 clr_ecc_single_err: 1;
+		u32 clr_ecc_multi_err: 1;
+		u32 clr_crc_err: 1;
+		u32 clr_hs_tx_timeout: 1;
+		u32 clr_lp_rx_timeout: 1;
+		} bits;
+	} INTERNAL_INT_CLR;
+
+	union _0xD0 {
+		u32 val;
+		struct _VIDEO_SIG_DELAY_CONFIG {
+
+		/*
+		 * DPI interface signal delay to be used in clk lanebyte
+		 * domain for control logic to read video data from pixel
+		 * memory in mannal mode, measured in clk_lanebyte cycles
+		 */
+		u32 video_sig_delay: 24;
+
+		/*
+		 * 1'b1: mannal mode
+		 *       dsi controller will use video_sig_delay value as
+		 *       the delay for the packet handle logic to read video
+		 *       data from pixel memory.
+		 *
+		 * 1'b0: auto mode
+		 *       dsi controller will auto calculate the delay for
+		 *       the packet handle logic to read video data from
+		 *       pixel memory.
+		 */
+		u32 video_sig_delay_mode: 1;
+
+		u32 reserved: 7;
+		} bits;
+	} VIDEO_SIG_DELAY_CONFIG;
+
+	u32 reservedD4_EC[7];
+
+	union _0xF0 {
+		u32 val;
+		struct _PHY_TST_CTRL0 {
+		/* PHY test interface clear (active high) */
+		u32 phy_testclr: 1;
+
+		/* This bit is used to clock the TESTDIN bus into the D-PHY */
+		u32 phy_testclk: 1;
+
+		u32 reserved: 30;
+		} bits;
+	} PHY_TST_CTRL0;
+
+	union _0xF4 {
+		u32 val;
+		struct _PHY_TST_CTRL1 {
+		/* PHY test interface input 8-bit data bus for internal
+		 * register programming and test functionalities access.
+		 */
+		u32 phy_testdin: 8;
+
+		/* PHY output 8-bit data bus for read-back and internal
+		 * probing functionalities.
+		 */
+		u32 phy_testdout: 8;
+
+		/*
+		 * PHY test interface operation selector:
+		 * 1: The address write operation is set on the falling edge
+		 *    of the testclk signal.
+		 * 0: The data write operation is set on the rising edge of
+		 *    the testclk signal.
+		 */
+		u32 phy_testen: 1;
+
+		u32 reserved: 15;
+		} bits;
+	} PHY_TST_CTRL1;
+
+	u32 reservedF8_1FC[66];
+
+	union _0x200 {
+		u32 val;
+		struct _INT_PLL_STS {
+		u32 int_pll_sts: 1;
+		u32 reserved: 31;
+		} bits;
+	} INT_PLL_STS;
+
+	union _0x204 {
+		u32 val;
+		struct _INT_PLL_MSK {
+		u32 int_pll_msk: 1;
+		u32 reserved: 31;
+		} bits;
+	} INT_PLL_MSK;
+
+	union _0x208 {
+		u32 val;
+		struct _INT_PLL_CLR {
+		u32 int_pll_clr: 1;
+		u32 reserved: 31;
+		} bits;
+	} INT_PLL_CLR;
+
+};
+
+bool dsi_check_version(struct dsi_context *ctx);
+void dsi_power_enable(struct dsi_context *ctx, int enable);
+void dsi_video_mode(struct dsi_context *ctx);
+void dsi_cmd_mode(struct dsi_context *ctx);
+bool dsi_is_cmd_mode(struct dsi_context *ctx);
+void dsi_rx_vcid(struct dsi_context *ctx, u8 vc);
+void dsi_video_vcid(struct dsi_context *ctx, u8 vc);
+void dsi_dpi_video_burst_mode(struct dsi_context *ctx, int mode);
+void dsi_dpi_color_coding(struct dsi_context *ctx, int coding);
+void dsi_dpi_sig_delay(struct dsi_context *ctx, u16 byte_cycle);
+void dsi_dpi_hline_time(struct dsi_context *ctx, u16 byte_cycle);
+void dsi_dpi_hsync_time(struct dsi_context *ctx, u16 byte_cycle);
+void dsi_dpi_hbp_time(struct dsi_context *ctx, u16 byte_cycle);
+void dsi_dpi_vact(struct dsi_context *ctx, u16 lines);
+void dsi_dpi_vfp(struct dsi_context *ctx, u16 lines);
+void dsi_dpi_vbp(struct dsi_context *ctx, u16 lines);
+void dsi_dpi_vsync(struct dsi_context *ctx, u16 lines);
+void dsi_dpi_hporch_lp_en(struct dsi_context *ctx, int enable);
+void dsi_dpi_vporch_lp_en(struct dsi_context *ctx, int enable);
+void dsi_dpi_frame_ack_en(struct dsi_context *ctx, int enable);
+void dsi_dpi_chunk_num(struct dsi_context *ctx, u16 no);
+void dsi_dpi_null_packet_size(struct dsi_context *ctx, u16 size);
+void dsi_dpi_video_packet_size(struct dsi_context *ctx, u16 size);
+void dsi_edpi_max_pkt_size(struct dsi_context *ctx, u16 size);
+void dsi_tear_effect_ack_en(struct dsi_context *ctx, int enable);
+void dsi_cmd_mode_lp_cmd_en(struct dsi_context *ctx, int enable);
+void dsi_video_mode_lp_cmd_en(struct dsi_context *ctx, int enable);
+void dsi_set_packet_header(struct dsi_context *ctx, u8 vc, u8 type,
+						u8 wc_lsb, u8 wc_msb);
+void dsi_set_packet_payload(struct dsi_context *ctx, u32 payload);
+u32 dsi_get_rx_payload(struct dsi_context *ctx);
+void dsi_bta_en(struct dsi_context *ctx, int enable);
+void dsi_eotp_rx_en(struct dsi_context *ctx, int enable);
+void dsi_eotp_tx_en(struct dsi_context *ctx, int enable);
+void dsi_ecc_rx_en(struct dsi_context *ctx, int enable);
+void dsi_crc_rx_en(struct dsi_context *ctx, int enable);
+bool dsi_is_bta_returned(struct dsi_context *ctx);
+bool dsi_is_rx_payload_fifo_full(struct dsi_context *ctx);
+bool dsi_is_rx_payload_fifo_empty(struct dsi_context *ctx);
+bool dsi_is_tx_payload_fifo_full(struct dsi_context *ctx);
+bool dsi_is_tx_payload_fifo_empty(struct dsi_context *ctx);
+bool dsi_is_tx_cmd_fifo_full(struct dsi_context *ctx);
+bool dsi_is_tx_cmd_fifo_empty(struct dsi_context *ctx);
+void dsi_datalane_hs2lp_config(struct dsi_context *ctx, u16 byte_cycle);
+void dsi_datalane_lp2hs_config(struct dsi_context *ctx, u16 byte_cycle);
+void dsi_clklane_hs2lp_config(struct dsi_context *ctx, u16 byte_cycle);
+void dsi_clklane_lp2hs_config(struct dsi_context *ctx, u16 byte_cycle);
+void dsi_max_read_time(struct dsi_context *ctx, u16 byte_cycle);
+void dsi_nc_clk_en(struct dsi_context *ctx, int enable);
+void dsi_tx_escape_division(struct dsi_context *ctx, u8 div);
+void dsi_timeout_clock_division(struct dsi_context *ctx, u8 div);
+void dsi_lp_rx_timeout(struct dsi_context *ctx, u16 count);
+void dsi_hs_tx_timeout(struct dsi_context *ctx, u16 count);
+u32 dsi_int0_status(struct dsi_context *ctx);
+u32 dsi_int1_status(struct dsi_context *ctx);
+void dsi_int0_mask(struct dsi_context *ctx, u32 mask);
+void dsi_int1_mask(struct dsi_context *ctx, u32 mask);
+
+#endif /* _DSI_CTRL_R1P0_H_ */
diff --git a/drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c b/drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c
new file mode 100644
index 0000000..2102d7c
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c
@@ -0,0 +1,328 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Unisoc Inc.
+ */
+
+#include <linux/io.h>
+#include <linux/init.h>
+#include <linux/module.h>
+
+#include "dsi_ctrl_r1p0.h"
+#include "dsi_ctrl_r1p0_ppi.h"
+#include "sprd_dphy.h"
+
+/**
+ * Reset D-PHY module
+ * @param phy: pointer to structure
+ *  which holds information about the d-phy module
+ * @param reset
+ */
+void dsi_phy_rstz(struct dphy_context *ctx, int level)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x78 phy_interface_ctrl;
+
+	phy_interface_ctrl.val = readl(&reg->PHY_INTERFACE_CTRL);
+	phy_interface_ctrl.bits.rf_phy_reset_n = level;
+
+	writel(phy_interface_ctrl.val, &reg->PHY_INTERFACE_CTRL);
+}
+
+/**
+ * Power up/down D-PHY module
+ * @param phy: pointer to structure
+ *  which holds information about the d-phy module
+ * @param enable (1: shutdown)
+ */
+void dsi_phy_shutdownz(struct dphy_context *ctx, int level)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x78 phy_interface_ctrl;
+
+	phy_interface_ctrl.val = readl(&reg->PHY_INTERFACE_CTRL);
+	phy_interface_ctrl.bits.rf_phy_shutdown = level;
+
+	writel(phy_interface_ctrl.val, &reg->PHY_INTERFACE_CTRL);
+}
+
+/**
+ * Force D-PHY PLL to stay on while in ULPS
+ * @param phy: pointer to structure
+ *  which holds information about the d-phy module
+ * @param force (1) disable (0)
+ * @note To follow the programming model, use wakeup_pll function
+ */
+void dsi_phy_force_pll(struct dphy_context *ctx, int force)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x78 phy_interface_ctrl;
+
+	phy_interface_ctrl.val = readl(&reg->PHY_INTERFACE_CTRL);
+	phy_interface_ctrl.bits.rf_phy_force_pll = force;
+
+	writel(phy_interface_ctrl.val, &reg->PHY_INTERFACE_CTRL);
+}
+
+void dsi_phy_clklane_ulps_rqst(struct dphy_context *ctx, int en)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x78 phy_interface_ctrl;
+
+	phy_interface_ctrl.val = readl(&reg->PHY_INTERFACE_CTRL);
+	phy_interface_ctrl.bits.rf_phy_clk_txrequlps = en;
+
+	writel(phy_interface_ctrl.val, &reg->PHY_INTERFACE_CTRL);
+}
+
+void dsi_phy_clklane_ulps_exit(struct dphy_context *ctx, int en)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x78 phy_interface_ctrl;
+
+	phy_interface_ctrl.val = readl(&reg->PHY_INTERFACE_CTRL);
+	phy_interface_ctrl.bits.rf_phy_clk_txexitulps = en;
+
+	writel(phy_interface_ctrl.val, &reg->PHY_INTERFACE_CTRL);
+}
+
+void dsi_phy_datalane_ulps_rqst(struct dphy_context *ctx, int en)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x78 phy_interface_ctrl;
+
+	phy_interface_ctrl.val = readl(&reg->PHY_INTERFACE_CTRL);
+	phy_interface_ctrl.bits.rf_phy_data_txrequlps = en;
+
+	writel(phy_interface_ctrl.val, &reg->PHY_INTERFACE_CTRL);
+}
+
+void dsi_phy_datalane_ulps_exit(struct dphy_context *ctx, int en)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x78 phy_interface_ctrl;
+
+	phy_interface_ctrl.val = readl(&reg->PHY_INTERFACE_CTRL);
+	phy_interface_ctrl.bits.rf_phy_data_txexitulps = en;
+
+	writel(phy_interface_ctrl.val, &reg->PHY_INTERFACE_CTRL);
+}
+
+/**
+ * Configure minimum wait period for HS transmission request after a stop state
+ * @param phy pointer to structure which holds information about the d-phy
+ * module
+ * @param no_of_byte_cycles [in byte (lane) clock cycles]
+ */
+void dsi_phy_stop_wait_time(struct dphy_context *ctx, u8 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+
+	writel(byte_cycle, &reg->PHY_MIN_STOP_TIME);
+}
+
+/**
+ * Set number of active lanes
+ * @param phy: pointer to structure
+ *  which holds information about the d-phy module
+ * @param no_of_lanes
+ */
+void dsi_phy_datalane_en(struct dphy_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+
+	writel(ctx->lanes - 1, &reg->PHY_LANE_NUM_CONFIG);
+}
+
+/**
+ * Enable clock lane module
+ * @param phy pointer to structure
+ *  which holds information about the d-phy module
+ * @param en
+ */
+void dsi_phy_clklane_en(struct dphy_context *ctx, int en)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x78 phy_interface_ctrl;
+
+	phy_interface_ctrl.val = readl(&reg->PHY_INTERFACE_CTRL);
+	phy_interface_ctrl.bits.rf_phy_clk_en = en;
+
+	writel(phy_interface_ctrl.val, &reg->PHY_INTERFACE_CTRL);
+}
+
+/**
+ * Request the PHY module to start transmission of high speed clock.
+ * This causes the clock lane to start transmitting DDR clock on the
+ * lane interconnect.
+ * @param phy pointer to structure which holds information about the d-phy
+ * module
+ * @param enable
+ * @note this function should be called explicitly by user always except for
+ * transmitting
+ */
+void dsi_phy_clk_hs_rqst(struct dphy_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x74 phy_clk_lane_lp_ctrl;
+
+	phy_clk_lane_lp_ctrl.val = readl(&reg->PHY_CLK_LANE_LP_CTRL);
+	phy_clk_lane_lp_ctrl.bits.auto_clklane_ctrl_en = 0;
+	phy_clk_lane_lp_ctrl.bits.phy_clklane_tx_req_hs = enable;
+
+	writel(phy_clk_lane_lp_ctrl.val, &reg->PHY_CLK_LANE_LP_CTRL);
+}
+
+/**
+ * Get D-PHY PPI status
+ * @param phy pointer to structure which holds information about the d-phy
+ * module
+ * @param mask
+ * @return status
+ */
+u8 dsi_phy_is_pll_locked(struct dphy_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x9C phy_status;
+
+	phy_status.val = readl(&reg->PHY_STATUS);
+
+	return phy_status.bits.phy_lock;
+}
+
+u8 dsi_phy_is_stop_state_datalane(struct dphy_context *ctx)
+{
+	u8 state = 0;
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x9C phy_status;
+
+	phy_status.val = readl(&reg->PHY_STATUS);
+
+	if (phy_status.bits.phy_stopstate0lane)
+		state |= BIT(0);
+	if (phy_status.bits.phy_stopstate1lane)
+		state |= BIT(1);
+	if (phy_status.bits.phy_stopstate2lane)
+		state |= BIT(2);
+	if (phy_status.bits.phy_stopstate3lane)
+		state |= BIT(3);
+
+	return state;
+}
+
+u8 dsi_phy_is_stop_state_clklane(struct dphy_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x9C phy_status;
+
+	phy_status.val = readl(&reg->PHY_STATUS);
+
+	return phy_status.bits.phy_stopstateclklane;
+}
+
+u8 dsi_phy_is_ulps_active_datalane(struct dphy_context *ctx)
+{
+	u8 state = 0;
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x9C phy_status;
+
+	phy_status.val = readl(&reg->PHY_STATUS);
+
+	if (!phy_status.bits.phy_ulpsactivenot0lane)
+		state |= BIT(0);
+	if (!phy_status.bits.phy_ulpsactivenot1lane)
+		state |= BIT(1);
+	if (!phy_status.bits.phy_ulpsactivenot2lane)
+		state |= BIT(2);
+	if (!phy_status.bits.phy_ulpsactivenot3lane)
+		state |= BIT(3);
+
+	return state;
+}
+
+u8 dsi_phy_is_ulps_active_clklane(struct dphy_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x9C phy_status;
+
+	phy_status.val = readl(&reg->PHY_STATUS);
+
+	return !phy_status.bits.phy_ulpsactivenotclk;
+}
+
+/**
+ * @param phy pointer to structure which holds information about the d-phy
+ * module
+ * @param value
+ */
+void dsi_phy_test_clk(struct dphy_context *ctx, u8 value)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0xF0 phy_tst_ctrl0;
+
+	phy_tst_ctrl0.val = readl(&reg->PHY_TST_CTRL0);
+	phy_tst_ctrl0.bits.phy_testclk = value;
+
+	writel(phy_tst_ctrl0.val, &reg->PHY_TST_CTRL0);
+}
+
+/**
+ * @param phy pointer to structure which holds information about the d-phy
+ * module
+ * @param value
+ */
+void dsi_phy_test_clr(struct dphy_context *ctx, u8 value)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0xF0 phy_tst_ctrl0;
+
+	phy_tst_ctrl0.val = readl(&reg->PHY_TST_CTRL0);
+	phy_tst_ctrl0.bits.phy_testclr = value;
+
+	writel(phy_tst_ctrl0.val, &reg->PHY_TST_CTRL0);
+}
+
+/**
+ * @param phy pointer to structure which holds information about the d-phy
+ * module
+ * @param on_falling_edge
+ */
+void dsi_phy_test_en(struct dphy_context *ctx, u8 value)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0xF4 phy_tst_ctrl1;
+
+	phy_tst_ctrl1.val = readl(&reg->PHY_TST_CTRL1);
+	phy_tst_ctrl1.bits.phy_testen = value;
+
+	writel(phy_tst_ctrl1.val, &reg->PHY_TST_CTRL1);
+}
+
+/**
+ * @param phy pointer to structure which holds information about the d-phy
+ * module
+ */
+u8 dsi_phy_test_dout(struct dphy_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0xF4 phy_tst_ctrl1;
+
+	phy_tst_ctrl1.val = readl(&reg->PHY_TST_CTRL1);
+
+	return phy_tst_ctrl1.bits.phy_testdout;
+}
+
+/**
+ * @param phy pointer to structure which holds information about the d-phy
+ * module
+ * @param test_data
+ */
+void dsi_phy_test_din(struct dphy_context *ctx, u8 data)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0xF4 phy_tst_ctrl1;
+
+	phy_tst_ctrl1.val = readl(&reg->PHY_TST_CTRL1);
+	phy_tst_ctrl1.bits.phy_testdin = data;
+
+	writel(phy_tst_ctrl1.val, &reg->PHY_TST_CTRL1);
+}
diff --git a/drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.h b/drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.h
new file mode 100644
index 0000000..7477604
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 Unisoc Inc.
+ */
+
+#ifndef _DSI_CTRL_R1P0_PPI_H_
+#define _DSI_CTRL_R1P0_PPI_H_
+
+void dsi_phy_rstz(struct dphy_context *ctx, int level);
+void dsi_phy_shutdownz(struct dphy_context *ctx, int level);
+void dsi_phy_force_pll(struct dphy_context *ctx, int force);
+void dsi_phy_clklane_ulps_rqst(struct dphy_context *ctx, int en);
+void dsi_phy_clklane_ulps_exit(struct dphy_context *ctx, int en);
+void dsi_phy_datalane_ulps_rqst(struct dphy_context *ctx, int en);
+void dsi_phy_datalane_ulps_exit(struct dphy_context *ctx, int en);
+void dsi_phy_stop_wait_time(struct dphy_context *ctx, u8 byte_clk);
+void dsi_phy_datalane_en(struct dphy_context *ctx);
+void dsi_phy_clklane_en(struct dphy_context *ctx, int en);
+void dsi_phy_clk_hs_rqst(struct dphy_context *ctx, int en);
+u8 dsi_phy_is_pll_locked(struct dphy_context *ctx);
+u8 dsi_phy_is_stop_state_clklane(struct dphy_context *ctx);
+u8 dsi_phy_is_stop_state_datalane(struct dphy_context *ctx);
+u8 dsi_phy_is_ulps_active_datalane(struct dphy_context *ctx);
+u8 dsi_phy_is_ulps_active_clklane(struct dphy_context *ctx);
+void dsi_phy_test_clk(struct dphy_context *ctx, u8 level);
+void dsi_phy_test_clr(struct dphy_context *ctx, u8 level);
+void dsi_phy_test_en(struct dphy_context *ctx, u8 level);
+u8 dsi_phy_test_dout(struct dphy_context *ctx);
+void dsi_phy_test_din(struct dphy_context *ctx, u8 data);
+void dsi_phy_bist_en(struct dphy_context *ctx, int en);
+
+#endif /* _DSI_CTRL_R1P0_PPI_H_ */
\ No newline at end of file
diff --git a/drivers/gpu/drm/sprd/dsi/sprd_dsi_api.c b/drivers/gpu/drm/sprd/dsi/sprd_dsi_api.c
new file mode 100644
index 0000000..98487ba
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dsi/sprd_dsi_api.c
@@ -0,0 +1,590 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Unisoc Inc.
+ */
+
+#include <linux/delay.h>
+
+#include "core/dsi_ctrl_r1p0.h"
+#include "sprd_dsi.h"
+
+static int dsi_wait_tx_payload_fifo_empty(struct dsi_context *ctx)
+{
+	int i;
+
+	for (i = 0; i < 5000; i++) {
+		if (dsi_is_tx_payload_fifo_empty(ctx))
+			return 0;
+		udelay(1);
+	}
+
+	return -ETIMEDOUT;
+}
+
+static int dsi_wait_tx_cmd_fifo_empty(struct dsi_context *ctx)
+{
+	int i;
+
+	for (i = 0; i < 5000; i++) {
+		if (dsi_is_tx_cmd_fifo_empty(ctx))
+			return 0;
+		udelay(1);
+	}
+
+	return -ETIMEDOUT;
+}
+
+static int dsi_wait_rd_resp_completed(struct dsi_context *ctx)
+{
+	int i;
+
+	for (i = 0; i < 10000; i++) {
+		if (dsi_is_bta_returned(ctx))
+			return 0;
+		udelay(10);
+	}
+
+	return -ETIMEDOUT;
+}
+
+static u16 calc_bytes_per_pixel_x100(int coding)
+{
+	u16 Bpp_x100;
+
+	switch (coding) {
+	case COLOR_CODE_16BIT_CONFIG1:
+	case COLOR_CODE_16BIT_CONFIG2:
+	case COLOR_CODE_16BIT_CONFIG3:
+		Bpp_x100 = 200;
+		break;
+	case COLOR_CODE_18BIT_CONFIG1:
+	case COLOR_CODE_18BIT_CONFIG2:
+		Bpp_x100 = 225;
+		break;
+	case COLOR_CODE_24BIT:
+		Bpp_x100 = 300;
+		break;
+	case COLOR_CODE_COMPRESSTION:
+		Bpp_x100 = 100;
+		break;
+	case COLOR_CODE_20BIT_YCC422_LOOSELY:
+		Bpp_x100 = 250;
+		break;
+	case COLOR_CODE_24BIT_YCC422:
+		Bpp_x100 = 300;
+		break;
+	case COLOR_CODE_16BIT_YCC422:
+		Bpp_x100 = 200;
+		break;
+	case COLOR_CODE_30BIT:
+		Bpp_x100 = 375;
+		break;
+	case COLOR_CODE_36BIT:
+		Bpp_x100 = 450;
+		break;
+	case COLOR_CODE_12BIT_YCC420:
+		Bpp_x100 = 150;
+		break;
+	default:
+		DRM_ERROR("invalid color coding");
+		Bpp_x100 = -EINVAL;
+		break;
+	}
+
+	return Bpp_x100;
+}
+
+static u8 calc_video_size_step(int coding)
+{
+	u8 video_size_step;
+
+	switch (coding) {
+	case COLOR_CODE_16BIT_CONFIG1:
+	case COLOR_CODE_16BIT_CONFIG2:
+	case COLOR_CODE_16BIT_CONFIG3:
+	case COLOR_CODE_18BIT_CONFIG1:
+	case COLOR_CODE_18BIT_CONFIG2:
+	case COLOR_CODE_24BIT:
+	case COLOR_CODE_COMPRESSTION:
+		return video_size_step = 1;
+	case COLOR_CODE_20BIT_YCC422_LOOSELY:
+	case COLOR_CODE_24BIT_YCC422:
+	case COLOR_CODE_16BIT_YCC422:
+	case COLOR_CODE_30BIT:
+	case COLOR_CODE_36BIT:
+	case COLOR_CODE_12BIT_YCC420:
+		return video_size_step = 2;
+	default:
+		DRM_ERROR("invalid color coding");
+		return -EINVAL;
+	}
+}
+
+static u16 round_video_size(int coding, u16 video_size)
+{
+	switch (coding) {
+	case COLOR_CODE_16BIT_YCC422:
+	case COLOR_CODE_24BIT_YCC422:
+	case COLOR_CODE_20BIT_YCC422_LOOSELY:
+	case COLOR_CODE_12BIT_YCC420:
+		/* round up active H pixels to a multiple of 2 */
+		if ((video_size % 2) != 0)
+			video_size += 1;
+		break;
+	default:
+		break;
+	}
+
+	return video_size;
+}
+
+#define SPRD_MIPI_DSI_FMT_DSC 0xff
+static u32 fmt_to_coding(u32 fmt)
+{
+	switch (fmt) {
+	case MIPI_DSI_FMT_RGB565:
+		return COLOR_CODE_16BIT_CONFIG1;
+	case MIPI_DSI_FMT_RGB666_PACKED:
+		return COLOR_CODE_18BIT_CONFIG1;
+	case MIPI_DSI_FMT_RGB666:
+	case MIPI_DSI_FMT_RGB888:
+		return COLOR_CODE_24BIT;
+	case SPRD_MIPI_DSI_FMT_DSC:
+		return COLOR_CODE_COMPRESSTION;
+	default:
+		DRM_ERROR("Unsupported format (%d)\n", fmt);
+		return COLOR_CODE_24BIT;
+	}
+}
+
+#define ns_to_cycle(ns, byte_clk) \
+	DIV_ROUND_UP((ns) * (byte_clk), 1000000)
+
+void sprd_dsi_power_on(struct sprd_dsi *dsi)
+{
+	int div;
+	struct dsi_context *ctx = &dsi->ctx;
+	u16 max_rd_time;
+	u16 data_hs2lp, data_lp2hs, clk_hs2lp, clk_lp2hs;
+
+	dsi_power_enable(ctx, 0);
+	dsi_int0_mask(ctx, 0xffffffff);
+	dsi_int1_mask(ctx, 0xffffffff);
+	dsi_cmd_mode(ctx);
+	dsi_eotp_rx_en(ctx, 0);
+	dsi_eotp_tx_en(ctx, 0);
+	dsi_ecc_rx_en(ctx, 1);
+	dsi_crc_rx_en(ctx, 1);
+	dsi_bta_en(ctx, 1);
+	dsi_video_vcid(ctx, 0);
+	dsi_rx_vcid(ctx, 0);
+
+	div = DIV_ROUND_UP(ctx->byte_clk, ctx->esc_clk);
+	dsi_tx_escape_division(ctx, div);
+
+	max_rd_time = ns_to_cycle(ctx->max_rd_time, ctx->byte_clk);
+	dsi_max_read_time(ctx, max_rd_time);
+
+	data_hs2lp = ns_to_cycle(ctx->data_hs2lp, ctx->byte_clk);
+	data_lp2hs = ns_to_cycle(ctx->data_lp2hs, ctx->byte_clk);
+	clk_hs2lp = ns_to_cycle(ctx->clk_hs2lp, ctx->byte_clk);
+	clk_lp2hs = ns_to_cycle(ctx->clk_lp2hs, ctx->byte_clk);
+	dsi_datalane_hs2lp_config(ctx, data_hs2lp);
+	dsi_datalane_lp2hs_config(ctx, data_lp2hs);
+	dsi_clklane_hs2lp_config(ctx, clk_hs2lp);
+	dsi_clklane_lp2hs_config(ctx, clk_lp2hs);
+
+	dsi_power_enable(ctx, 1);
+}
+
+/**
+ * Close DSI Host driver
+ * - Free up resources and shutdown host controller and PHY
+ * @param dsi pointer to structure holding the DSI Host core information
+ * @return
+ */
+void sprd_dsi_power_off(struct sprd_dsi *dsi)
+{
+	struct dsi_context *ctx = &dsi->ctx;
+
+	dsi_int0_mask(ctx, 0xffffffff);
+	dsi_int1_mask(ctx, 0xffffffff);
+	dsi_power_enable(ctx, 0);
+}
+
+/**
+ * Configure DPI video interface
+ * - If not in burst mode, it will compute the video and null packet sizes
+ * according to necessity
+ * - Configure timers for data lanes and/or clock lane to return to LP when
+ * bandwidth is not filled by data
+ * @param dsi pointer to structure holding the DSI Host core information
+ * @param param pointer to video stream-to-send information
+ * @return error code
+ */
+int sprd_dsi_dpi_video(struct sprd_dsi *dsi)
+{
+	struct dsi_context *ctx = &dsi->ctx;
+	struct videomode *vm = &dsi->ctx.vm;
+	u16 Bpp_x100;
+	u16 video_size;
+	u32 ratio_x1000;
+	u16 null_pkt_size = 0;
+	u8 video_size_step;
+	u32 hs_to;
+	u32 total_bytes;
+	u32 bytes_per_chunk;
+	u32 chunks = 0;
+	u32 bytes_left = 0;
+	u32 chunk_overhead;
+	const u8 pkt_header = 6;
+	u8 coding;
+	int div;
+	u16 hline;
+
+	coding = fmt_to_coding(ctx->format);
+	video_size = round_video_size(coding, vm->hactive);
+	Bpp_x100 = calc_bytes_per_pixel_x100(coding);
+	video_size_step = calc_video_size_step(coding);
+	ratio_x1000 = ctx->byte_clk * 1000 / (vm->pixelclock / 1000);
+	hline = vm->hactive + vm->hsync_len + vm->hfront_porch +
+		vm->hback_porch;
+
+	dsi_power_enable(ctx, 0);
+	dsi_dpi_frame_ack_en(ctx, ctx->frame_ack_en);
+	dsi_dpi_color_coding(ctx, coding);
+	dsi_dpi_video_burst_mode(ctx, ctx->burst_mode);
+	dsi_dpi_sig_delay(ctx, 95 * hline * ratio_x1000 / 100000);
+	dsi_dpi_hline_time(ctx, hline * ratio_x1000 / 1000);
+	dsi_dpi_hsync_time(ctx, vm->hsync_len * ratio_x1000 / 1000);
+	dsi_dpi_hbp_time(ctx, vm->hback_porch * ratio_x1000 / 1000);
+	dsi_dpi_vact(ctx, vm->vactive);
+	dsi_dpi_vfp(ctx, vm->vfront_porch);
+	dsi_dpi_vbp(ctx, vm->vback_porch);
+	dsi_dpi_vsync(ctx, vm->vsync_len);
+	dsi_dpi_hporch_lp_en(ctx, 1);
+	dsi_dpi_vporch_lp_en(ctx, 1);
+
+	hs_to = (hline * vm->vactive) + (2 * Bpp_x100) / 100;
+	for (div = 0x80; (div < hs_to) && (div > 2); div--) {
+		if ((hs_to % div) == 0) {
+			dsi_timeout_clock_division(ctx, div);
+			dsi_lp_rx_timeout(ctx, hs_to / div);
+			dsi_hs_tx_timeout(ctx, hs_to / div);
+			break;
+		}
+	}
+
+	if (ctx->burst_mode == VIDEO_BURST_WITH_SYNC_PULSES) {
+		dsi_dpi_video_packet_size(ctx, video_size);
+		dsi_dpi_null_packet_size(ctx, 0);
+		dsi_dpi_chunk_num(ctx, 0);
+	} else {
+		/* non burst transmission */
+		null_pkt_size = 0;
+
+		/* bytes to be sent - first as one chunk */
+		bytes_per_chunk = vm->hactive * Bpp_x100 / 100 + pkt_header;
+
+		/* hline total bytes from the DPI interface */
+		total_bytes = (vm->hactive + vm->hfront_porch) *
+				ratio_x1000 / ctx->lanes / 1000;
+
+		/* check if the pixels actually fit on the DSI link */
+		if (total_bytes < bytes_per_chunk) {
+			DRM_ERROR("current resolution can not be set\n");
+			return -EINVAL;
+		}
+
+		chunk_overhead = total_bytes - bytes_per_chunk;
+
+		/* overhead higher than 1 -> enable multi packets */
+		if (chunk_overhead > 1) {
+
+			/* multi packets */
+			for (video_size = video_size_step;
+			     video_size < vm->hactive;
+			     video_size += video_size_step) {
+
+				if (vm->hactive * 1000 / video_size % 1000)
+					continue;
+
+				chunks = vm->hactive / video_size;
+				bytes_per_chunk = Bpp_x100 * video_size / 100
+						  + pkt_header;
+				if (total_bytes >= (bytes_per_chunk * chunks)) {
+					bytes_left = total_bytes -
+						     bytes_per_chunk * chunks;
+					break;
+				}
+			}
+
+			/* prevent overflow (unsigned - unsigned) */
+			if (bytes_left > (pkt_header * chunks)) {
+				null_pkt_size = (bytes_left -
+						pkt_header * chunks) / chunks;
+				/* avoid register overflow */
+				if (null_pkt_size > 1023)
+					null_pkt_size = 1023;
+			}
+
+		} else {
+
+			/* single packet */
+			chunks = 1;
+
+			/* must be a multiple of 4 except 18 loosely */
+			for (video_size = vm->hactive;
+			    (video_size % video_size_step) != 0;
+			     video_size++)
+				;
+		}
+
+		dsi_dpi_video_packet_size(ctx, video_size);
+		dsi_dpi_null_packet_size(ctx, null_pkt_size);
+		dsi_dpi_chunk_num(ctx, chunks);
+	}
+
+	dsi_int0_mask(ctx, ctx->int0_mask);
+	dsi_int1_mask(ctx, ctx->int1_mask);
+	dsi_power_enable(ctx, 1);
+
+	return 0;
+}
+
+int sprd_dsi_edpi_video(struct sprd_dsi *dsi)
+{
+	struct dsi_context *ctx = &dsi->ctx;
+	const u32 fifo_depth = 1096;
+	const u32 word_length = 4;
+	u32 hactive = ctx->vm.hactive;
+	u32 Bpp_x100;
+	u32 max_fifo_len;
+	u8 coding;
+
+	coding = fmt_to_coding(ctx->format);
+	Bpp_x100 = calc_bytes_per_pixel_x100(coding);
+	max_fifo_len = word_length * fifo_depth * 100 / Bpp_x100;
+
+	dsi_power_enable(ctx, 0);
+	dsi_dpi_color_coding(ctx, coding);
+	dsi_tear_effect_ack_en(ctx, ctx->te_ack_en);
+
+	if (max_fifo_len > hactive)
+		dsi_edpi_max_pkt_size(ctx, hactive);
+	else
+		dsi_edpi_max_pkt_size(ctx, max_fifo_len);
+
+	dsi_int0_mask(ctx, ctx->int0_mask);
+	dsi_int1_mask(ctx, ctx->int1_mask);
+	dsi_power_enable(ctx, 1);
+
+	return 0;
+}
+
+/**
+ * Send a packet on the generic interface
+ * @param dsi pointer to structure holding the DSI Host core information
+ * @param vc destination virtual channel
+ * @param data_type type of command, inserted in first byte of header
+ * @param params byte array of command parameters
+ * @param param_length length of the above array
+ * @return error code
+ * @note this function has an active delay to wait for the buffer to clear.
+ * The delay is limited to:
+ * (param_length / 4) x DSIH_FIFO_ACTIVE_WAIT x register access time
+ * @note the controller restricts the sending of .
+ * This function will not be able to send Null and Blanking packets due to
+ *  controller restriction
+ */
+int sprd_dsi_wr_pkt(struct sprd_dsi *dsi, u8 vc, u8 type,
+			const u8 *param, u16 len)
+{
+	struct dsi_context *ctx = &dsi->ctx;
+	u8 wc_lsbyte, wc_msbyte;
+	u32 payload;
+	int i, j, ret;
+
+	if (vc > 3)
+		return -EINVAL;
+
+
+	/* 1st: for long packet, must config payload first */
+	ret = dsi_wait_tx_payload_fifo_empty(ctx);
+	if (ret) {
+		DRM_ERROR("tx payload fifo is not empty\n");
+		return ret;
+	}
+
+	if (len > 2) {
+		for (i = 0, j = 0; i < len; i += j) {
+			payload = 0;
+			for (j = 0; (j < 4) && ((j + i) < (len)); j++)
+				payload |= param[i + j] << (j * 8);
+
+			dsi_set_packet_payload(ctx, payload);
+		}
+		wc_lsbyte = len & 0xff;
+		wc_msbyte = len >> 8;
+	} else {
+		wc_lsbyte = (len > 0) ? param[0] : 0;
+		wc_msbyte = (len > 1) ? param[1] : 0;
+	}
+
+	/* 2nd: then set packet header */
+	ret = dsi_wait_tx_cmd_fifo_empty(ctx);
+	if (ret) {
+		DRM_ERROR("tx cmd fifo is not empty\n");
+		return ret;
+	}
+
+	dsi_set_packet_header(ctx, vc, type, wc_lsbyte, wc_msbyte);
+
+	return 0;
+}
+
+
+/**
+ * Send READ packet to peripheral using the generic interface
+ * This will force command mode and stop video mode (because of BTA)
+ * @param dsi pointer to structure holding the DSI Host core information
+ * @param vc destination virtual channel
+ * @param data_type generic command type
+ * @param lsb_byte first command parameter
+ * @param msb_byte second command parameter
+ * @param bytes_to_read no of bytes to read (expected to arrive at buffer)
+ * @param read_buffer pointer to 8-bit array to hold the read buffer words
+ * return read_buffer_length
+ * @note this function has an active delay to wait for the buffer to clear.
+ * The delay is limited to 2 x DSIH_FIFO_ACTIVE_WAIT
+ * (waiting for command buffer, and waiting for receiving)
+ * @note this function will enable BTA
+ */
+int sprd_dsi_rd_pkt(struct sprd_dsi *dsi, u8 vc, u8 type,
+			u8 msb_byte, u8 lsb_byte,
+			u8 *buffer, u8 bytes_to_read)
+{
+	struct dsi_context *ctx = &dsi->ctx;
+	int i, ret;
+	int count = 0;
+	u32 temp;
+
+	if (vc > 3)
+		return -EINVAL;
+
+	/* 1st: send read command to peripheral */
+	if (!dsi_is_tx_cmd_fifo_empty(ctx))
+		return -EIO;
+
+	dsi_set_packet_header(ctx, vc, type, lsb_byte, msb_byte);
+
+	/* 2nd: wait peripheral response completed */
+	ret = dsi_wait_rd_resp_completed(ctx);
+	if (ret) {
+		DRM_ERROR("wait read response time out\n");
+		return ret;
+	}
+
+	/* 3rd: get data from rx payload fifo */
+	if (dsi_is_rx_payload_fifo_empty(ctx)) {
+		DRM_ERROR("rx payload fifo empty\n");
+		return -EIO;
+	}
+
+	for (i = 0; i < 100; i++) {
+		temp = dsi_get_rx_payload(ctx);
+
+		if (count < bytes_to_read)
+			buffer[count++] = temp & 0xff;
+		if (count < bytes_to_read)
+			buffer[count++] = (temp >> 8) & 0xff;
+		if (count < bytes_to_read)
+			buffer[count++] = (temp >> 16) & 0xff;
+		if (count < bytes_to_read)
+			buffer[count++] = (temp >> 24) & 0xff;
+
+		if (dsi_is_rx_payload_fifo_empty(ctx))
+			return count;
+		else {
+			DRM_ERROR("read too many buffers\n");
+			return -EIO;
+		}
+	}
+
+	return 0;
+}
+
+void sprd_dsi_set_work_mode(struct sprd_dsi *dsi, u8 mode)
+{
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (mode == DSI_MODE_CMD)
+		dsi_cmd_mode(ctx);
+	else
+		dsi_video_mode(ctx);
+}
+
+int sprd_dsi_get_work_mode(struct sprd_dsi *dsi)
+{
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (dsi_is_cmd_mode(ctx))
+		return DSI_MODE_CMD;
+	else
+		return DSI_MODE_VIDEO;
+}
+
+void sprd_dsi_lp_cmd_enable(struct sprd_dsi *dsi, bool enable)
+{
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (dsi_is_cmd_mode(ctx))
+		dsi_cmd_mode_lp_cmd_en(ctx, enable);
+	else
+		dsi_video_mode_lp_cmd_en(ctx, enable);
+}
+
+void sprd_dsi_nc_clk_en(struct sprd_dsi *dsi, bool enable)
+{
+	struct dsi_context *ctx = &dsi->ctx;
+
+	dsi_nc_clk_en(ctx, enable);
+}
+
+void sprd_dsi_state_reset(struct sprd_dsi *dsi)
+{
+	struct dsi_context *ctx = &dsi->ctx;
+
+	dsi_power_enable(ctx, 0);
+	udelay(100);
+	dsi_power_enable(ctx, 1);
+}
+
+u32 sprd_dsi_int_status(struct sprd_dsi *dsi, int index)
+{
+	struct dsi_context *ctx = &dsi->ctx;
+	u32 status;
+
+	if (0 == index)
+		status = dsi_int0_status(ctx);
+	else if (1 == index)
+		status = dsi_int1_status(ctx);
+	else {
+		DRM_ERROR("invalid dsi IRQ index %d\n", index);
+		status = -EINVAL;
+	}
+
+	return status;
+}
+
+void sprd_dsi_int_mask(struct sprd_dsi *dsi, int index)
+{
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (0 == index)
+		dsi_int0_mask(ctx, dsi->ctx.int0_mask);
+	else if (1 == index)
+		dsi_int1_mask(ctx, dsi->ctx.int1_mask);
+	else
+		DRM_ERROR("invalid dsi IRQ index %d\n", index);
+}
diff --git a/drivers/gpu/drm/sprd/dsi/sprd_dsi_api.h b/drivers/gpu/drm/sprd/dsi/sprd_dsi_api.h
new file mode 100644
index 0000000..91eef86
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dsi/sprd_dsi_api.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 Unisoc Inc.
+ */
+
+#ifndef _SPRD_DSI_API_H_
+#define _SPRD_DSI_API_H_
+
+void sprd_dsi_power_on(struct sprd_dsi *dsi);
+void sprd_dsi_power_off(struct sprd_dsi *dsi);
+int sprd_dsi_dpi_video(struct sprd_dsi *dsi);
+int sprd_dsi_edpi_video(struct sprd_dsi *dsi);
+int sprd_dsi_wr_pkt(struct sprd_dsi *dsi, u8 vc, u8 type,
+			const u8 *param, u16 len);
+int sprd_dsi_rd_pkt(struct sprd_dsi *dsi, u8 vc, u8 type,
+			u8 msb_byte, u8 lsb_byte,
+			u8 *buffer, u8 bytes_to_read);
+void sprd_dsi_set_work_mode(struct sprd_dsi *dsi, u8 mode);
+int sprd_dsi_get_work_mode(struct sprd_dsi *dsi);
+void sprd_dsi_lp_cmd_enable(struct sprd_dsi *dsi, bool enable);
+void sprd_dsi_nc_clk_en(struct sprd_dsi *dsi, bool enable);
+void sprd_dsi_state_reset(struct sprd_dsi *dsi);
+u32 sprd_dsi_int_status(struct sprd_dsi *dsi, int index);
+void sprd_dsi_int_mask(struct sprd_dsi *dsi, int index);
+
+#endif /* _SPRD_DSI_API_H_ */
diff --git a/drivers/gpu/drm/sprd/sprd_dphy.c b/drivers/gpu/drm/sprd/sprd_dphy.c
new file mode 100644
index 0000000..3dcd270
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_dphy.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Unisoc Inc.
+ */
+
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include "dphy/sprd_dphy_api.h"
+#include "sprd_dphy.h"
+
+static int regmap_tst_io_write(void *context, u32 reg, u32 val)
+{
+	struct sprd_dphy *dphy = context;
+
+	if (val > 0xff || reg > 0xff)
+		return -EINVAL;
+
+	DRM_DEBUG("reg = 0x%02x, val = 0x%02x\n", reg, val);
+
+	sprd_dphy_test_write(dphy, reg, val);
+
+	return 0;
+}
+
+static int regmap_tst_io_read(void *context, u32 reg, u32 *val)
+{
+	struct sprd_dphy *dphy = context;
+	int ret;
+
+	if (reg > 0xff)
+		return -EINVAL;
+
+	ret = sprd_dphy_test_read(dphy, reg);
+	if (ret < 0)
+		return ret;
+
+	*val = ret;
+
+	DRM_DEBUG("reg = 0x%02x, val = 0x%02x\n", reg, *val);
+	return 0;
+}
+
+static struct regmap_bus regmap_tst_io = {
+	.reg_write = regmap_tst_io_write,
+	.reg_read = regmap_tst_io_read,
+};
+
+static const struct regmap_config byte_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static const struct regmap_config word_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static int sprd_dphy_regmap_init(struct sprd_dphy *dphy)
+{
+	struct dphy_context *ctx = &dphy->ctx;
+	struct regmap *regmap;
+
+	if (ctx->apbbase)
+		regmap = devm_regmap_init_mmio(&dphy->dev,
+			(void __iomem *)ctx->apbbase, &word_config);
+	else
+		regmap = devm_regmap_init(&dphy->dev, &regmap_tst_io,
+					  dphy, &byte_config);
+
+	if (IS_ERR(regmap)) {
+		DRM_ERROR("dphy regmap init failed\n");
+		return PTR_ERR(regmap);
+	}
+
+	ctx->regmap = regmap;
+
+	return 0;
+}
+
+void sprd_dphy_ulps_enter(struct sprd_dphy *dphy)
+{
+	sprd_dphy_hs_clk_en(dphy, false);
+	sprd_dphy_data_ulps_enter(dphy);
+	sprd_dphy_clk_ulps_enter(dphy);
+}
+
+void sprd_dphy_ulps_exit(struct sprd_dphy *dphy)
+{
+	sprd_dphy_force_pll(dphy, true);
+	sprd_dphy_clk_ulps_exit(dphy);
+	sprd_dphy_data_ulps_exit(dphy);
+	sprd_dphy_force_pll(dphy, false);
+}
+
+int sprd_dphy_init(struct sprd_dphy *dphy)
+{
+	int ret;
+
+	ret = sprd_dphy_power_on(dphy);
+	if (ret) {
+		DRM_ERROR("sprd dphy initial failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+void sprd_dphy_fini(struct sprd_dphy *dphy)
+{
+	sprd_dphy_power_off(dphy);
+}
+
+static int sprd_dphy_context_init(struct sprd_dphy *dphy,
+				  struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dphy_context *ctx = &dphy->ctx;
+	struct resource *res;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	ctx->ctrlbase = (unsigned long)devm_ioremap(dev, res->start,
+					resource_size(res));
+	if (ctx->ctrlbase == 0) {
+		DRM_ERROR("failed to map dphy ctrl registers\n");
+		return -ENXIO;
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (res) {
+		ctx->ctrlbase = (unsigned long)devm_ioremap(dev, res->start,
+					resource_size(res));
+		if (ctx->apbbase == 0) {
+			DRM_INFO("failed to map dphy apb registers\n");
+			return -ENXIO;
+		}
+	}
+
+	return 0;
+}
+
+static const struct sprd_dphy_ops sharkl3_dphy = {
+	.pll = &sharkle_dphy_pll_ops,
+};
+
+static const struct of_device_id dphy_match_table[] = {
+	{ .compatible = "sprd,sharkl3-dsi-phy",
+	  .data = &sharkl3_dphy },
+	{ /* sentinel */ },
+};
+
+static int sprd_dphy_probe(struct platform_device *pdev)
+{
+	const struct sprd_dphy_ops *pdata;
+	struct sprd_dphy *dphy;
+	struct device *dsi_dev;
+	int ret;
+
+	dphy = devm_kzalloc(&pdev->dev, sizeof(*dphy), GFP_KERNEL);
+	if (!dphy)
+		return -ENOMEM;
+
+	dsi_dev = sprd_disp_pipe_get_input(&pdev->dev);
+	if (!dsi_dev)
+		return -ENODEV;
+
+	pdata = of_device_get_match_data(&pdev->dev);
+	if (pdata) {
+		dphy->pll = pdata->pll;
+	} else {
+		DRM_ERROR("No matching driver data found\n");
+		return -EINVAL;
+	}
+
+	ret = sprd_dphy_context_init(dphy, &pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = sprd_dphy_regmap_init(dphy);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, dphy);
+
+	return 0;
+}
+
+struct platform_driver sprd_dphy_driver = {
+	.probe	= sprd_dphy_probe,
+	.driver = {
+		.name  = "sprd-dphy-drv",
+		.of_match_table	= dphy_match_table,
+	}
+};
+
+MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
+MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
+MODULE_DESCRIPTION("Unisoc SoC MIPI DSI PHY driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/sprd/sprd_dphy.h b/drivers/gpu/drm/sprd/sprd_dphy.h
new file mode 100644
index 0000000..ecf2d36
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_dphy.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 Unisoc Inc.
+ */
+
+#ifndef _SPRD_DPHY_H_
+#define _SPRD_DPHY_H_
+
+#include <asm/types.h>
+#include <linux/device.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_print.h>
+
+#include "disp_lib.h"
+
+struct dphy_context {
+	struct regmap *regmap;
+	unsigned long ctrlbase;
+	unsigned long apbbase;
+	u32 freq;
+	u8 lanes;
+};
+
+struct dphy_pll_ops {
+	int (*pll_config)(struct dphy_context *ctx);
+	void (*timing_config)(struct dphy_context *ctx);
+	void (*force_pll)(struct dphy_context *ctx, int force);
+};
+
+struct sprd_dphy_ops {
+	const struct dphy_pll_ops *pll;
+};
+
+struct sprd_dphy {
+	struct device dev;
+	struct dphy_context ctx;
+	const struct dphy_pll_ops *pll;
+};
+
+int sprd_dphy_init(struct sprd_dphy *dphy);
+void sprd_dphy_fini(struct sprd_dphy *dphy);
+void sprd_dphy_ulps_enter(struct sprd_dphy *dphy);
+void sprd_dphy_ulps_exit(struct sprd_dphy *dphy);
+
+extern const struct dphy_pll_ops sharkle_dphy_pll_ops;
+
+#endif /* _SPRD_DPHY_H_ */
diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
index 5ec8e7c..ebea25f 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -489,6 +489,28 @@ static int sprd_crtc_init(struct drm_device *drm, struct drm_crtc *crtc,
 	return 0;
 }
 
+void sprd_dpu_run(struct sprd_dpu *dpu)
+{
+	struct dpu_context *ctx = &dpu->ctx;
+
+	if (dpu->core->run)
+		dpu->core->run(ctx);
+
+	drm_crtc_vblank_on(&dpu->crtc);
+}
+
+void sprd_dpu_stop(struct sprd_dpu *dpu)
+{
+	struct dpu_context *ctx = &dpu->ctx;
+
+	if (dpu->core->stop)
+		dpu->core->stop(ctx);
+
+	drm_crtc_handle_vblank(&dpu->crtc);
+	drm_crtc_vblank_off(&dpu->crtc);
+}
+
+
 static void sprd_dpu_init(struct sprd_dpu *dpu)
 {
 	struct dpu_context *ctx = &dpu->ctx;
diff --git a/drivers/gpu/drm/sprd/sprd_dpu.h b/drivers/gpu/drm/sprd/sprd_dpu.h
index 7d3c5e4..83a2a86 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.h
+++ b/drivers/gpu/drm/sprd/sprd_dpu.h
@@ -182,6 +182,9 @@ static inline struct sprd_dpu *crtc_to_dpu(struct drm_crtc *crtc)
 	return crtc ? container_of(crtc, struct sprd_dpu, crtc) : NULL;
 }
 
+void sprd_dpu_run(struct sprd_dpu *dpu);
+void sprd_dpu_stop(struct sprd_dpu *dpu);
+
 extern const struct dpu_core_ops dpu_r2p0_core_ops;
 
 #endif
diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
new file mode 100644
index 0000000..452c43a
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_dsi.c
@@ -0,0 +1,571 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Unisoc Inc.
+ */
+
+#include <linux/component.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+#include <linux/of_graph.h>
+#include <video/mipi_display.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_of.h>
+#include <drm/drm_probe_helper.h>
+
+#include "disp_lib.h"
+#include "sprd_dpu.h"
+#include "sprd_dsi.h"
+#include "dsi/sprd_dsi_api.h"
+#include "dphy/sprd_dphy_api.h"
+
+#define encoder_to_dsi(encoder) \
+	container_of(encoder, struct sprd_dsi, encoder)
+#define host_to_dsi(host) \
+	container_of(host, struct sprd_dsi, host)
+#define connector_to_dsi(connector) \
+	container_of(connector, struct sprd_dsi, connector)
+
+static int sprd_dsi_init(struct sprd_dsi *dsi)
+{
+	sprd_dsi_power_on(dsi);
+
+	if (dsi->ctx.work_mode == DSI_MODE_VIDEO)
+		sprd_dsi_dpi_video(dsi);
+	else
+		sprd_dsi_edpi_video(dsi);
+
+	return 0;
+}
+
+static void sprd_dsi_fini(struct sprd_dsi *dsi)
+{
+	sprd_dsi_power_off(dsi);
+}
+
+static void sprd_dsi_encoder_enable(struct drm_encoder *encoder)
+{
+	struct sprd_dsi *dsi = encoder_to_dsi(encoder);
+	struct sprd_dpu *dpu = crtc_to_dpu(encoder->crtc);
+
+	if (dsi->ctx.enabled) {
+		DRM_ERROR("dsi is initialized\n");
+		return;
+	}
+
+	sprd_dsi_init(dsi);
+	sprd_dphy_init(dsi->phy);
+
+	sprd_dsi_lp_cmd_enable(dsi, true);
+
+	if (dsi->panel) {
+		drm_panel_prepare(dsi->panel);
+		drm_panel_enable(dsi->panel);
+	}
+
+	sprd_dsi_set_work_mode(dsi, dsi->ctx.work_mode);
+	sprd_dsi_state_reset(dsi);
+
+	if (dsi->ctx.nc_clk_en)
+		sprd_dsi_nc_clk_en(dsi, true);
+	else
+		sprd_dphy_hs_clk_en(dsi->phy, true);
+
+	sprd_dpu_run(dpu);
+
+	dsi->ctx.enabled = true;
+}
+
+static void sprd_dsi_encoder_disable(struct drm_encoder *encoder)
+{
+	struct sprd_dsi *dsi = encoder_to_dsi(encoder);
+	struct sprd_dpu *dpu = crtc_to_dpu(encoder->crtc);
+
+	if (!dsi->ctx.enabled) {
+		DRM_ERROR("dsi isn't initialized\n");
+		return;
+	}
+
+	sprd_dpu_stop(dpu);
+	sprd_dsi_set_work_mode(dsi, DSI_MODE_CMD);
+	sprd_dsi_lp_cmd_enable(dsi, true);
+
+	if (dsi->panel) {
+		drm_panel_disable(dsi->panel);
+		sprd_dphy_ulps_enter(dsi->phy);
+		drm_panel_unprepare(dsi->panel);
+	}
+
+	sprd_dphy_fini(dsi->phy);
+	sprd_dsi_fini(dsi);
+
+	dsi->ctx.enabled = false;
+}
+
+static void sprd_dsi_encoder_mode_set(struct drm_encoder *encoder,
+				 struct drm_display_mode *mode,
+				 struct drm_display_mode *adj_mode)
+{
+	struct sprd_dsi *dsi = encoder_to_dsi(encoder);
+
+	DRM_DEBUG("%s() set mode: %s\n", __func__, dsi->mode->name);
+}
+
+static int sprd_dsi_encoder_atomic_check(struct drm_encoder *encoder,
+				    struct drm_crtc_state *crtc_state,
+				    struct drm_connector_state *conn_state)
+{
+	return 0;
+}
+
+static const struct drm_encoder_helper_funcs sprd_encoder_helper_funcs = {
+	.atomic_check	= sprd_dsi_encoder_atomic_check,
+	.mode_set	= sprd_dsi_encoder_mode_set,
+	.enable		= sprd_dsi_encoder_enable,
+	.disable	= sprd_dsi_encoder_disable
+};
+
+static const struct drm_encoder_funcs sprd_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+static int sprd_dsi_encoder_init(struct drm_device *drm,
+			       struct sprd_dsi *dsi)
+{
+	struct drm_encoder *encoder = &dsi->encoder;
+	struct device *dev = dsi->host.dev;
+	u32 crtc_mask;
+	int ret;
+
+	crtc_mask = drm_of_find_possible_crtcs(drm, dev->of_node);
+	if (!crtc_mask) {
+		DRM_ERROR("failed to find crtc mask\n");
+		return -EINVAL;
+	}
+
+	DRM_DEBUG("find possible crtcs: 0x%08x\n", crtc_mask);
+
+	encoder->possible_crtcs = crtc_mask;
+	ret = drm_encoder_init(drm, encoder, &sprd_encoder_funcs,
+			       DRM_MODE_ENCODER_DSI, NULL);
+	if (ret) {
+		DRM_ERROR("failed to init dsi encoder\n");
+		return ret;
+	}
+
+	drm_encoder_helper_add(encoder, &sprd_encoder_helper_funcs);
+
+	return 0;
+}
+
+static int sprd_dsi_find_panel(struct sprd_dsi *dsi)
+{
+	struct device *dev = dsi->host.dev;
+	struct device_node *child, *lcds_node;
+	struct drm_panel *panel;
+
+	/* search /lcds child node first */
+	lcds_node = of_find_node_by_path("/lcds");
+	for_each_child_of_node(lcds_node, child) {
+		panel = of_drm_find_panel(child);
+		if (panel) {
+			dsi->panel = panel;
+			return 0;
+		}
+	}
+
+	/*
+	 * If /lcds child node search failed, we search
+	 * the child of dsi host node.
+	 */
+	for_each_child_of_node(dev->of_node, child) {
+		panel = of_drm_find_panel(child);
+		if (panel) {
+			dsi->panel = panel;
+			return 0;
+		}
+	}
+
+	DRM_ERROR("of_drm_find_panel() failed\n");
+	return -ENODEV;
+}
+
+static int sprd_dsi_phy_attach(struct sprd_dsi *dsi)
+{
+	struct device *dev;
+
+	dev = sprd_disp_pipe_get_output(&dsi->dev);
+	if (!dev)
+		return -ENODEV;
+
+	dsi->phy = dev_get_drvdata(dev);
+	if (!dsi->phy) {
+		DRM_ERROR("dsi attach phy failed\n");
+		return -EINVAL;
+	}
+
+	dsi->phy->ctx.lanes = dsi->ctx.lanes;
+	dsi->phy->ctx.freq = dsi->ctx.byte_clk * 8;
+
+	return 0;
+}
+
+static int sprd_dsi_host_attach(struct mipi_dsi_host *host,
+			   struct mipi_dsi_device *slave)
+{
+	struct sprd_dsi *dsi = host_to_dsi(host);
+	struct dsi_context *ctx = &dsi->ctx;
+	int ret;
+
+	dsi->slave = slave;
+	ctx->lanes = slave->lanes;
+	ctx->format = slave->format;
+	ctx->byte_clk = slave->hs_rate / 8;
+	ctx->esc_clk = slave->lp_rate;
+
+	if (slave->mode_flags & MIPI_DSI_MODE_VIDEO)
+		ctx->work_mode = DSI_MODE_VIDEO;
+	else
+		ctx->work_mode = DSI_MODE_CMD;
+
+	if (slave->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
+		ctx->burst_mode = VIDEO_BURST_WITH_SYNC_PULSES;
+	else if (slave->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
+		ctx->burst_mode = VIDEO_NON_BURST_WITH_SYNC_PULSES;
+	else
+		ctx->burst_mode = VIDEO_NON_BURST_WITH_SYNC_EVENTS;
+
+	if (slave->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
+		ctx->nc_clk_en = true;
+
+	ret = sprd_dsi_phy_attach(dsi);
+	if (ret)
+		return ret;
+
+	ret = sprd_dsi_find_panel(dsi);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int sprd_dsi_host_detach(struct mipi_dsi_host *host,
+			   struct mipi_dsi_device *slave)
+{
+	/* do nothing */
+	return 0;
+}
+
+static ssize_t sprd_dsi_host_transfer(struct mipi_dsi_host *host,
+				const struct mipi_dsi_msg *msg)
+{
+	struct sprd_dsi *dsi = host_to_dsi(host);
+	const u8 *tx_buf = msg->tx_buf;
+
+	if (msg->rx_buf && msg->rx_len) {
+		u8 lsb = (msg->tx_len > 0) ? tx_buf[0] : 0;
+		u8 msb = (msg->tx_len > 1) ? tx_buf[1] : 0;
+
+		return sprd_dsi_rd_pkt(dsi, msg->channel, msg->type,
+				msb, lsb, msg->rx_buf, msg->rx_len);
+	}
+
+	if (msg->tx_buf && msg->tx_len)
+		return sprd_dsi_wr_pkt(dsi, msg->channel, msg->type,
+					tx_buf, msg->tx_len);
+
+	return 0;
+}
+
+static const struct mipi_dsi_host_ops sprd_dsi_host_ops = {
+	.attach = sprd_dsi_host_attach,
+	.detach = sprd_dsi_host_detach,
+	.transfer = sprd_dsi_host_transfer,
+};
+
+static int sprd_dsi_host_init(struct sprd_dsi *dsi, struct device *dev)
+{
+	int ret;
+
+	dsi->host.dev = dev;
+	dsi->host.ops = &sprd_dsi_host_ops;
+
+	ret = mipi_dsi_host_register(&dsi->host);
+	if (ret)
+		DRM_ERROR("failed to register dsi host\n");
+
+	return ret;
+}
+
+static int sprd_dsi_connector_get_modes(struct drm_connector *connector)
+{
+	struct sprd_dsi *dsi = connector_to_dsi(connector);
+
+	return drm_panel_get_modes(dsi->panel, connector);
+}
+
+static enum drm_mode_status
+sprd_dsi_connector_mode_valid(struct drm_connector *connector,
+			 struct drm_display_mode *mode)
+{
+	struct sprd_dsi *dsi = connector_to_dsi(connector);
+
+	DRM_DEBUG("%s() mode: "DRM_MODE_FMT"\n", __func__, DRM_MODE_ARG(mode));
+
+	if (mode->type & DRM_MODE_TYPE_PREFERRED) {
+		dsi->mode = mode;
+		drm_display_mode_to_videomode(dsi->mode, &dsi->ctx.vm);
+	}
+
+	return MODE_OK;
+}
+
+static struct drm_encoder *
+sprd_dsi_connector_best_encoder(struct drm_connector *connector)
+{
+	struct sprd_dsi *dsi = connector_to_dsi(connector);
+
+	return &dsi->encoder;
+}
+
+static struct drm_connector_helper_funcs sprd_dsi_connector_helper_funcs = {
+	.get_modes = sprd_dsi_connector_get_modes,
+	.mode_valid = sprd_dsi_connector_mode_valid,
+	.best_encoder = sprd_dsi_connector_best_encoder,
+};
+
+static enum drm_connector_status
+sprd_dsi_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct sprd_dsi *dsi = connector_to_dsi(connector);
+
+	if (dsi->panel) {
+		drm_panel_attach(dsi->panel, connector);
+		return connector_status_connected;
+	}
+
+	return connector_status_disconnected;
+}
+
+static void sprd_dsi_connector_destroy(struct drm_connector *connector)
+{
+	drm_connector_unregister(connector);
+	drm_connector_cleanup(connector);
+}
+
+static const struct drm_connector_funcs sprd_dsi_atomic_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.detect = sprd_dsi_connector_detect,
+	.destroy = sprd_dsi_connector_destroy,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int sprd_dsi_connector_init(struct drm_device *drm, struct sprd_dsi *dsi)
+{
+	struct drm_encoder *encoder = &dsi->encoder;
+	struct drm_connector *connector = &dsi->connector;
+	int ret;
+
+	connector->polled = DRM_CONNECTOR_POLL_HPD;
+
+	ret = drm_connector_init(drm, connector,
+				 &sprd_dsi_atomic_connector_funcs,
+				 DRM_MODE_CONNECTOR_DSI);
+	if (ret) {
+		DRM_ERROR("drm_connector_init() failed\n");
+		return ret;
+	}
+
+	drm_connector_helper_add(connector,
+				 &sprd_dsi_connector_helper_funcs);
+
+	drm_connector_attach_encoder(connector, encoder);
+
+	return 0;
+}
+
+static int sprd_dsi_bridge_attach(struct sprd_dsi *dsi)
+{
+	struct drm_encoder *encoder = &dsi->encoder;
+	struct drm_bridge *bridge = dsi->bridge;
+	struct device *dev = dsi->host.dev;
+	struct device_node *bridge_node;
+	int ret;
+
+	bridge_node = of_graph_get_remote_node(dev->of_node, 2, 0);
+	if (!bridge_node)
+		return 0;
+
+	bridge = of_drm_find_bridge(bridge_node);
+	if (!bridge) {
+		DRM_ERROR("of_drm_find_bridge() failed\n");
+		return -ENODEV;
+	}
+	dsi->bridge = bridge;
+
+	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
+	if (ret) {
+		DRM_ERROR("failed to attach external bridge\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static irqreturn_t sprd_dsi_isr(int irq, void *data)
+{
+	u32 status = 0;
+	struct sprd_dsi *dsi = data;
+
+	if (dsi->ctx.irq0 == irq)
+		status = sprd_dsi_int_status(dsi, 0);
+	else if (dsi->ctx.irq1 == irq)
+		status = sprd_dsi_int_status(dsi, 1);
+
+	if (status & DSI_INT_STS_NEED_SOFT_RESET)
+		sprd_dsi_state_reset(dsi);
+
+	return IRQ_HANDLED;
+}
+
+static int sprd_dsi_bind(struct device *dev, struct device *master, void *data)
+{
+	struct drm_device *drm = data;
+	struct sprd_dsi *dsi = dev_get_drvdata(dev);
+	int ret;
+
+	ret = sprd_dsi_encoder_init(drm, dsi);
+	if (ret)
+		goto cleanup_host;
+
+	ret = sprd_dsi_connector_init(drm, dsi);
+	if (ret)
+		goto cleanup_encoder;
+
+	ret = sprd_dsi_bridge_attach(dsi);
+	if (ret)
+		goto cleanup_connector;
+
+	return 0;
+
+cleanup_connector:
+	drm_connector_cleanup(&dsi->connector);
+cleanup_encoder:
+	drm_encoder_cleanup(&dsi->encoder);
+cleanup_host:
+	mipi_dsi_host_unregister(&dsi->host);
+	return ret;
+}
+
+static void sprd_dsi_unbind(struct device *dev,
+			struct device *master, void *data)
+{
+	/* do nothing */
+	DRM_DEBUG("%s()\n", __func__);
+
+}
+
+static const struct component_ops dsi_component_ops = {
+	.bind	= sprd_dsi_bind,
+	.unbind	= sprd_dsi_unbind,
+};
+
+static int sprd_dsi_context_init(struct sprd_dsi *dsi,
+			struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dsi_context *ctx = &dsi->ctx;
+	struct resource *res;
+	int ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	ctx->base = (unsigned long)devm_ioremap(dev, res->start,
+					resource_size(res));
+	if (ctx->base == 0) {
+		DRM_ERROR("failed to map dsi host registers\n");
+		return -ENXIO;
+	}
+
+	ctx->irq0 = platform_get_irq(pdev, 0);
+	if (ctx->irq0 > 0) {
+		ret = request_irq(ctx->irq0, sprd_dsi_isr, 0, "DSI_INT0", dsi);
+		if (ret) {
+			DRM_ERROR("failed to request dsi irq int0!\n");
+			return -EINVAL;
+		}
+	}
+
+	ctx->irq1 = platform_get_irq(pdev, 1);
+	if (ctx->irq1 > 0) {
+		ret = request_irq(ctx->irq1, sprd_dsi_isr, 0, "DSI_INT1", dsi);
+		if (ret) {
+			DRM_ERROR("failed to request dsi irq int1!\n");
+			return -EINVAL;
+		}
+	}
+
+	ctx->data_hs2lp = 120;
+	ctx->data_lp2hs = 500;
+	ctx->clk_hs2lp = 4;
+	ctx->clk_lp2hs = 15;
+	ctx->max_rd_time = 6000;
+	ctx->int0_mask = 0xffffffff;
+	ctx->int1_mask = 0xffffffff;
+
+	return 0;
+}
+
+static const struct of_device_id dsi_match_table[] = {
+	{ .compatible = "sprd,sharkl3-dsi-host" },
+	{ /* sentinel */ },
+};
+
+static int sprd_dsi_probe(struct platform_device *pdev)
+{
+	struct sprd_dsi *dsi;
+	int ret;
+
+	dsi = devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
+	if (!dsi) {
+		DRM_ERROR("failed to allocate dsi data.\n");
+		return -ENOMEM;
+	}
+
+	ret = sprd_dsi_context_init(dsi, &pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = sprd_dsi_host_init(dsi, &pdev->dev);
+	if (ret)
+		return ret;
+	
+	platform_set_drvdata(pdev, dsi);
+
+	return component_add(&pdev->dev, &dsi_component_ops);
+}
+
+static int sprd_dsi_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dsi_component_ops);
+
+	return 0;
+}
+
+struct platform_driver sprd_dsi_driver = {
+	.probe = sprd_dsi_probe,
+	.remove = sprd_dsi_remove,
+	.driver = {
+		.name = "sprd-dsi-drv",
+		.of_match_table = dsi_match_table,
+	},
+};
+
+MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
+MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
+MODULE_DESCRIPTION("Unisoc MIPI DSI HOST Controller Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/sprd/sprd_dsi.h b/drivers/gpu/drm/sprd/sprd_dsi.h
new file mode 100644
index 0000000..7f57f46
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_dsi.h
@@ -0,0 +1,108 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 Unisoc Inc.
+ */
+
+#ifndef __SPRD_DSI_H__
+#define __SPRD_DSI_H__
+
+#include <linux/of.h>
+#include <linux/device.h>
+#include <video/videomode.h>
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_print.h>
+#include <drm/drm_panel.h>
+
+#include "disp_lib.h"
+#include "sprd_dphy.h"
+
+#define DSI_INT_STS_NEED_SOFT_RESET	BIT(0)
+#define DSI_INT_STS_NEED_HARD_RESET	BIT(1)
+
+enum dsi_work_mode {
+	DSI_MODE_CMD = 0,
+	DSI_MODE_VIDEO
+};
+
+enum video_burst_mode {
+	VIDEO_NON_BURST_WITH_SYNC_PULSES = 0,
+	VIDEO_NON_BURST_WITH_SYNC_EVENTS,
+	VIDEO_BURST_WITH_SYNC_PULSES
+};
+
+enum dsi_color_coding {
+	COLOR_CODE_16BIT_CONFIG1 = 0,
+	COLOR_CODE_16BIT_CONFIG2,
+	COLOR_CODE_16BIT_CONFIG3,
+	COLOR_CODE_18BIT_CONFIG1,
+	COLOR_CODE_18BIT_CONFIG2,
+	COLOR_CODE_24BIT,
+	COLOR_CODE_20BIT_YCC422_LOOSELY,
+	COLOR_CODE_24BIT_YCC422,
+	COLOR_CODE_16BIT_YCC422,
+	COLOR_CODE_30BIT,
+	COLOR_CODE_36BIT,
+	COLOR_CODE_12BIT_YCC420,
+	COLOR_CODE_COMPRESSTION,
+	COLOR_CODE_MAX
+};
+
+struct dsi_context {
+	unsigned long base;
+	struct videomode vm;
+	bool enabled;
+
+	u8 lanes;
+	u32 format;
+	u8 work_mode;
+	u8 burst_mode;
+
+	int irq0;
+	int irq1;
+	u32 int0_mask;
+	u32 int1_mask;
+
+	/* byte clock [KHz] */
+	u32 byte_clk;
+	/* escape clock [KHz] */
+	u32 esc_clk;
+
+	/* maximum time (ns) for data lanes from HS to LP */
+	u16 data_hs2lp;
+	/* maximum time (ns) for data lanes from LP to HS */
+	u16 data_lp2hs;
+	/* maximum time (ns) for clk lanes from HS to LP */
+	u16 clk_hs2lp;
+	/* maximum time (ns) for clk lanes from LP to HS */
+	u16 clk_lp2hs;
+	/* maximum time (ns) for BTA operation - REQUIRED */
+	u16 max_rd_time;
+
+	/* is 18-bit loosely packets (valid only when BPP == 18) */
+	bool is_18_loosely;
+	/* enable receiving frame ack packets - for video mode */
+	bool frame_ack_en;
+	/* enable receiving tear effect ack packets - for cmd mode */
+	bool te_ack_en;
+	/* enable non coninuous clock for energy saving */
+	bool nc_clk_en;
+};
+
+struct sprd_dsi {
+	struct device dev;
+	struct mipi_dsi_host host;
+	struct mipi_dsi_device *slave;
+	struct drm_encoder encoder;
+	struct drm_connector connector;
+	struct drm_bridge *bridge;
+	struct drm_panel *panel;
+	struct drm_display_mode *mode;
+	struct sprd_dphy *phy;
+	struct dsi_context ctx;
+};
+
+#endif /* __SPRD_DSI_H__ */
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
