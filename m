Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E81085001A5
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 00:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D6110F135;
	Wed, 13 Apr 2022 22:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D22B10F133
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 22:19:29 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 88BA75C02A2;
 Wed, 13 Apr 2022 18:19:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 13 Apr 2022 18:19:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649888368; x=1649974768; bh=6N
 qnJ9jKDQ/Xs7NgHGQxK5zygVx2tcQm+rl1IErNHA0=; b=a851i311nxtGUGtaje
 ScJ+eeFgcEb/7Y/AlDmMtI8g44vKG38oWKO9UdyIbWivhJyAxDZo/ArZ8cDE3VsU
 IYBRXtmjQ6NPJ/kG7OHG/XHRg+GnxBxMWrjdqjgE5Cd2yAlObp5VQxdGIdEj9AiU
 vXvEY5WWrclwPkUJLJfHaXIs0rxZNlqDhzslG+HtoXY7Il0/MdOl0mSpYT3VwezX
 BH3eHiw78BzpvJA1FsiPkhnLEeR81Hy1QnV2yckUnsOVO7kqdBtLxjlLn28x2wc7
 2cJAiKUJLgtBYUjfAtKUvQJsLORbgSWftlBfxPViXjhZVGp3yZo7fi6OllYgJOAI
 7T1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1649888368; x=1649974768; bh=6NqnJ9jKDQ/Xs7NgHGQxK5zygVx2tcQm+rl
 1IErNHA0=; b=Padv7h6gqp/NJaBPdkO9MFAkBteb8Oo24lDb3Jmq1ZJGPEUCzqh
 FP5K21hLr1gYtpJQ5IFX7pjbZ5pfVxG864TP2cXuNwgrS8OvVBRp9j6bkbfp4kbp
 dAV71Tm+3ikA4hU46Ve51f7//0CMhhJeI5LjnNqNflKVxsOL9om/3WalAV7TX1HF
 RdI8NDSqWoDEbwczA6eO0iXb7IpMZLcYT7u2dAwWo8/AmtaY/WJJnxJ0cfxYoRx7
 X/GQp9/X+qlpTwXtrX+4ghXhZkMUHn2ryfOZnbvBbUs6o0l6fapVUso3YQB/szxm
 OiCPF/XE+9ViV6vDdGgwDdfLc9EDcrDa6Ow==
X-ME-Sender: <xms:cExXYhIrgPpA-QN8Sq_IM7E9U04fFyLukakyhdt7GBCkTRFSLedHzA>
 <xme:cExXYtKe0mcMQLuX7Xf-5sYHxGZt-_vDdcGDE1RToAU7kscJHFsbra6W4vRIf8xK3
 ypxDKE_vgSxKGB9Hg>
X-ME-Received: <xmr:cExXYpujVuwhAjD2eXdZawDM88Jde2YdbjlVROaEeKuNI5cawuh72weczwq6KcRQiyUSQkEqxCrTPS0u7Rgs13JyvbTNIih4qZLV1sqB_2NAUiMHIKDBOkJrmQJFXbA0QaVEFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelvddgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:cExXYiZXqPmEq91QrU7j71cI93iZaBXnv2GlM-TaRgjLjWnnN_RQ9Q>
 <xmx:cExXYoYDRRJ3xU2EfIoRDVt-UwAol2Z7mnm045l0sF7Jl-ZhBvsGjw>
 <xmx:cExXYmCA-7x9XETQI7mfq5K7D2kaXD6dgEIPX5sD2RH7Q-iHedMOGQ>
 <xmx:cExXYspfuYZ4Jlxe1Uv-Z2WuTBDWdnPomNEyJSsdwOvkEAL2Zz5Hpw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Apr 2022 18:19:27 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 03/16] drm/rockchip: Add EBC platform driver skeleton
Date: Wed, 13 Apr 2022 17:19:03 -0500
Message-Id: <20220413221916.50995-4-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220413221916.50995-1-samuel@sholland.org>
References: <20220413221916.50995-1-samuel@sholland.org>
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ond=C5=99ej=20Jirman?= <x@xff.cz>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Samuel Holland <samuel@sholland.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Andreas Kemnade <andreas@kemnade.info>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Liang Chen <cl@rock-chips.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peter Geis <pgwipeout@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Rockchip E-Book Controller (EBC) is a timing controller (TCON)
responsible for sending timing signals and pixel update waveforms to an
electrophoretic display (EPD). The EBC has several modes of operation.
In direct mode, it reads precomputed source driver polarity data from a
series of buffers in RAM. In the other modes, it reads pixel luminance
data from RAM, and uses a lookup table (LUT) to compute the source
driver polarity for each phase within the waveform.

This commit adds a platform driver skeleton for the EBC, containing the
IRQ handler and runtime PM hooks. The EBC only needs to be powered up
when the display is actively being refreshed. regcache is used to allow
configuration changes (i.e. modeset) while the EBC is powered down.

While two of the regulator consumers here actually power the display
panel, not the EBC hardware, they are consumed here because again they
are only needed during display refreshes. They do not match the normal
panel prepare/enable lifecycle.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/gpu/drm/Makefile                |   2 +-
 drivers/gpu/drm/rockchip/Kconfig        |  11 +
 drivers/gpu/drm/rockchip/Makefile       |   2 +
 drivers/gpu/drm/rockchip/rockchip_ebc.c | 324 ++++++++++++++++++++++++
 4 files changed, 338 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/rockchip/rockchip_ebc.c

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 49380ccfe9d6..e940f81a2acf 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -93,7 +93,7 @@ obj-$(CONFIG_DRM_VGEM)	+= vgem/
 obj-$(CONFIG_DRM_VKMS)	+= vkms/
 obj-$(CONFIG_DRM_NOUVEAU) +=nouveau/
 obj-$(CONFIG_DRM_EXYNOS) +=exynos/
-obj-$(CONFIG_DRM_ROCKCHIP) +=rockchip/
+obj-y			+=rockchip/
 obj-$(CONFIG_DRM_GMA500) += gma500/
 obj-$(CONFIG_DRM_UDL) += udl/
 obj-$(CONFIG_DRM_AST) += ast/
diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index fa5cfda4e90e..9d3273a5fd97 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -91,3 +91,14 @@ config ROCKCHIP_RK3066_HDMI
 	  for the RK3066 HDMI driver. If you want to enable
 	  HDMI on RK3066 based SoC, you should select this option.
 endif
+
+config DRM_ROCKCHIP_EBC
+	tristate "DRM Support for Rockchip EBC"
+	depends on DRM
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_KMS_HELPER
+	help
+	  This selects DRM/KMS support for the Rockchip E-Book Controller (EBC).
+	  Choose this option if you have a Rockchip SoC and an electrophoretic
+	  display. This hardware and driver is separate from the normal Rockchip
+	  display hardware and DRM driver.
diff --git a/drivers/gpu/drm/rockchip/Makefile b/drivers/gpu/drm/rockchip/Makefile
index 1a56f696558c..e3accc526438 100644
--- a/drivers/gpu/drm/rockchip/Makefile
+++ b/drivers/gpu/drm/rockchip/Makefile
@@ -16,3 +16,5 @@ rockchipdrm-$(CONFIG_ROCKCHIP_RGB) += rockchip_rgb.o
 rockchipdrm-$(CONFIG_ROCKCHIP_RK3066_HDMI) += rk3066_hdmi.o
 
 obj-$(CONFIG_DRM_ROCKCHIP) += rockchipdrm.o
+
+obj-$(CONFIG_DRM_ROCKCHIP_EBC) += rockchip_ebc.o
diff --git a/drivers/gpu/drm/rockchip/rockchip_ebc.c b/drivers/gpu/drm/rockchip/rockchip_ebc.c
new file mode 100644
index 000000000000..5ed66c6cd2f0
--- /dev/null
+++ b/drivers/gpu/drm/rockchip/rockchip_ebc.c
@@ -0,0 +1,324 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
+ */
+
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
+#define EBC_DSP_START			0x0000
+#define EBC_DSP_START_DSP_OUT_LOW		BIT(31)
+#define EBC_DSP_START_DSP_SDCE_WIDTH(x)		((x) << 16)
+#define EBC_DSP_START_DSP_EINK_MODE		BIT(13)
+#define EBC_DSP_START_SW_BURST_CTRL		BIT(12)
+#define EBC_DSP_START_DSP_FRM_TOTAL(x)		((x) << 2)
+#define EBC_DSP_START_DSP_RST			BIT(1)
+#define EBC_DSP_START_DSP_FRM_START		BIT(0)
+#define EBC_EPD_CTRL			0x0004
+#define EBC_EPD_CTRL_EINK_MODE_SWAP		BIT(31)
+#define EBC_EPD_CTRL_DSP_GD_END(x)		((x) << 16)
+#define EBC_EPD_CTRL_DSP_GD_ST(x)		((x) << 8)
+#define EBC_EPD_CTRL_DSP_THREE_WIN_MODE		BIT(7)
+#define EBC_EPD_CTRL_DSP_SDDW_MODE		BIT(6)
+#define EBC_EPD_CTRL_EPD_AUO			BIT(5)
+#define EBC_EPD_CTRL_EPD_PWR(x)			((x) << 2)
+#define EBC_EPD_CTRL_EPD_GDRL			BIT(1)
+#define EBC_EPD_CTRL_EPD_SDSHR			BIT(0)
+#define EBC_DSP_CTRL			0x0008
+#define EBC_DSP_CTRL_DSP_SWAP_MODE(x)		((x) << 30)
+#define EBC_DSP_CTRL_DSP_DIFF_MODE		BIT(29)
+#define EBC_DSP_CTRL_DSP_LUT_MODE		BIT(28)
+#define EBC_DSP_CTRL_DSP_VCOM_MODE		BIT(27)
+#define EBC_DSP_CTRL_DSP_GDOE_POL		BIT(26)
+#define EBC_DSP_CTRL_DSP_GDSP_POL		BIT(25)
+#define EBC_DSP_CTRL_DSP_GDCLK_POL		BIT(24)
+#define EBC_DSP_CTRL_DSP_SDCE_POL		BIT(23)
+#define EBC_DSP_CTRL_DSP_SDOE_POL		BIT(22)
+#define EBC_DSP_CTRL_DSP_SDLE_POL		BIT(21)
+#define EBC_DSP_CTRL_DSP_SDCLK_POL		BIT(20)
+#define EBC_DSP_CTRL_DSP_SDCLK_DIV(x)		((x) << 16)
+#define EBC_DSP_CTRL_DSP_BACKGROUND(x)		((x) << 0)
+#define EBC_DSP_HTIMING0		0x000c
+#define EBC_DSP_HTIMING0_DSP_HTOTAL(x)		((x) << 16)
+#define EBC_DSP_HTIMING0_DSP_HS_END(x)		((x) << 0)
+#define EBC_DSP_HTIMING1		0x0010
+#define EBC_DSP_HTIMING1_DSP_HACT_END(x)	((x) << 16)
+#define EBC_DSP_HTIMING1_DSP_HACT_ST(x)		((x) << 0)
+#define EBC_DSP_VTIMING0		0x0014
+#define EBC_DSP_VTIMING0_DSP_VTOTAL(x)		((x) << 16)
+#define EBC_DSP_VTIMING0_DSP_VS_END(x)		((x) << 0)
+#define EBC_DSP_VTIMING1		0x0018
+#define EBC_DSP_VTIMING1_DSP_VACT_END(x)	((x) << 16)
+#define EBC_DSP_VTIMING1_DSP_VACT_ST(x)		((x) << 0)
+#define EBC_DSP_ACT_INFO		0x001c
+#define EBC_DSP_ACT_INFO_DSP_HEIGHT(x)		((x) << 16)
+#define EBC_DSP_ACT_INFO_DSP_WIDTH(x)		((x) << 0)
+#define EBC_WIN_CTRL			0x0020
+#define EBC_WIN_CTRL_WIN2_FIFO_THRESHOLD(x)	((x) << 19)
+#define EBC_WIN_CTRL_WIN_EN			BIT(18)
+#define EBC_WIN_CTRL_AHB_INCR_NUM_REG(x)	((x) << 13)
+#define EBC_WIN_CTRL_AHB_BURST_REG(x)		((x) << 10)
+#define EBC_WIN_CTRL_WIN_FIFO_THRESHOLD(x)	((x) << 2)
+#define EBC_WIN_CTRL_WIN_FMT_Y4			(0x0 << 0)
+#define EBC_WIN_CTRL_WIN_FMT_Y8			(0x1 << 0)
+#define EBC_WIN_CTRL_WIN_FMT_XRGB8888		(0x2 << 0)
+#define EBC_WIN_CTRL_WIN_FMT_RGB565		(0x3 << 0)
+#define EBC_WIN_MST0			0x0024
+#define EBC_WIN_MST1			0x0028
+#define EBC_WIN_VIR			0x002c
+#define EBC_WIN_VIR_WIN_VIR_HEIGHT(x)		((x) << 16)
+#define EBC_WIN_VIR_WIN_VIR_WIDTH(x)		((x) << 0)
+#define EBC_WIN_ACT			0x0030
+#define EBC_WIN_ACT_WIN_ACT_HEIGHT(x)		((x) << 16)
+#define EBC_WIN_ACT_WIN_ACT_WIDTH(x)		((x) << 0)
+#define EBC_WIN_DSP			0x0034
+#define EBC_WIN_DSP_WIN_DSP_HEIGHT(x)		((x) << 16)
+#define EBC_WIN_DSP_WIN_DSP_WIDTH(x)		((x) << 0)
+#define EBC_WIN_DSP_ST			0x0038
+#define EBC_WIN_DSP_ST_WIN_DSP_YST(x)		((x) << 16)
+#define EBC_WIN_DSP_ST_WIN_DSP_XST(x)		((x) << 0)
+#define EBC_INT_STATUS			0x003c
+#define EBC_INT_STATUS_DSP_FRM_INT_NUM(x)	((x) << 12)
+#define EBC_INT_STATUS_LINE_FLAG_INT_CLR	BIT(11)
+#define EBC_INT_STATUS_DSP_FRM_INT_CLR		BIT(10)
+#define EBC_INT_STATUS_DSP_END_INT_CLR		BIT(9)
+#define EBC_INT_STATUS_FRM_END_INT_CLR		BIT(8)
+#define EBC_INT_STATUS_LINE_FLAG_INT_MSK	BIT(7)
+#define EBC_INT_STATUS_DSP_FRM_INT_MSK		BIT(6)
+#define EBC_INT_STATUS_DSP_END_INT_MSK		BIT(5)
+#define EBC_INT_STATUS_FRM_END_INT_MSK		BIT(4)
+#define EBC_INT_STATUS_LINE_FLAG_INT_ST		BIT(3)
+#define EBC_INT_STATUS_DSP_FRM_INT_ST		BIT(2)
+#define EBC_INT_STATUS_DSP_END_INT_ST		BIT(1)
+#define EBC_INT_STATUS_FRM_END_INT_ST		BIT(0)
+#define EBC_VCOM0			0x0040
+#define EBC_VCOM1			0x0044
+#define EBC_VCOM2			0x0048
+#define EBC_VCOM3			0x004c
+#define EBC_CONFIG_DONE			0x0050
+#define EBC_CONFIG_DONE_REG_CONFIG_DONE		BIT(0)
+#define EBC_VNUM			0x0054
+#define EBC_VNUM_DSP_VCNT(x)			((x) << 16)
+#define EBC_VNUM_LINE_FLAG_NUM(x)		((x) << 0)
+#define EBC_WIN_MST2			0x0058
+#define EBC_LUT_DATA			0x1000
+
+#define EBC_NUM_LUT_REGS		0x1000
+#define EBC_NUM_SUPPLIES		3
+
+#define EBC_SUSPEND_DELAY_MS		2000
+
+struct rockchip_ebc {
+	struct clk			*dclk;
+	struct clk			*hclk;
+	struct completion		display_end;
+	struct regmap			*regmap;
+	struct regulator_bulk_data	supplies[EBC_NUM_SUPPLIES];
+};
+
+static int rockchip_ebc_runtime_suspend(struct device *dev)
+{
+	struct rockchip_ebc *ebc = dev_get_drvdata(dev);
+
+	regcache_cache_only(ebc->regmap, true);
+
+	clk_disable_unprepare(ebc->dclk);
+	clk_disable_unprepare(ebc->hclk);
+	regulator_bulk_disable(EBC_NUM_SUPPLIES, ebc->supplies);
+
+	return 0;
+}
+
+static int rockchip_ebc_runtime_resume(struct device *dev)
+{
+	struct rockchip_ebc *ebc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regulator_bulk_enable(EBC_NUM_SUPPLIES, ebc->supplies);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(ebc->hclk);
+	if (ret)
+		goto err_disable_supplies;
+
+	ret = clk_prepare_enable(ebc->dclk);
+	if (ret)
+		goto err_disable_hclk;
+
+	regcache_cache_only(ebc->regmap, false);
+	regcache_mark_dirty(ebc->regmap);
+	regcache_sync(ebc->regmap);
+
+	regmap_write(ebc->regmap, EBC_INT_STATUS,
+		     EBC_INT_STATUS_DSP_END_INT_CLR |
+		     EBC_INT_STATUS_LINE_FLAG_INT_MSK |
+		     EBC_INT_STATUS_DSP_FRM_INT_MSK |
+		     EBC_INT_STATUS_FRM_END_INT_MSK);
+
+	return 0;
+
+err_disable_hclk:
+	clk_disable_unprepare(ebc->hclk);
+err_disable_supplies:
+	regulator_bulk_disable(EBC_NUM_SUPPLIES, ebc->supplies);
+
+	return ret;
+}
+
+static const struct dev_pm_ops rockchip_ebc_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(rockchip_ebc_runtime_suspend,
+			   rockchip_ebc_runtime_resume, NULL)
+};
+
+static bool rockchip_ebc_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case EBC_DSP_START:
+	case EBC_INT_STATUS:
+	case EBC_CONFIG_DONE:
+	case EBC_VNUM:
+		return true;
+	default:
+		/* Do not cache the LUT registers. */
+		return reg > EBC_WIN_MST2;
+	}
+}
+
+static const struct regmap_config rockchip_ebc_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.volatile_reg	= rockchip_ebc_volatile_reg,
+	.max_register	= 0x4ffc, /* end of EBC_LUT_DATA */
+	.cache_type	= REGCACHE_FLAT,
+};
+
+static const char *const rockchip_ebc_supplies[EBC_NUM_SUPPLIES] = {
+	"panel",
+	"vcom",
+	"vdrive",
+};
+
+static irqreturn_t rockchip_ebc_irq(int irq, void *dev_id)
+{
+	struct rockchip_ebc *ebc = dev_id;
+	unsigned int status;
+
+	regmap_read(ebc->regmap, EBC_INT_STATUS, &status);
+
+	if (status & EBC_INT_STATUS_DSP_END_INT_ST) {
+		status |= EBC_INT_STATUS_DSP_END_INT_CLR;
+		complete(&ebc->display_end);
+	}
+
+	regmap_write(ebc->regmap, EBC_INT_STATUS, status);
+
+	return IRQ_HANDLED;
+}
+
+static int rockchip_ebc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rockchip_ebc *ebc;
+	void __iomem *base;
+	int i, ret;
+
+	ebc = devm_kzalloc(dev, sizeof(*ebc), GFP_KERNEL);
+	if (!ebc)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, ebc);
+	init_completion(&ebc->display_end);
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	ebc->regmap = devm_regmap_init_mmio(dev, base,
+					     &rockchip_ebc_regmap_config);
+	if (IS_ERR(ebc->regmap))
+		return PTR_ERR(ebc->regmap);
+
+	regcache_cache_only(ebc->regmap, true);
+
+	ebc->dclk = devm_clk_get(dev, "dclk");
+	if (IS_ERR(ebc->dclk))
+		return dev_err_probe(dev, PTR_ERR(ebc->dclk),
+				     "Failed to get dclk\n");
+
+	ebc->hclk = devm_clk_get(dev, "hclk");
+	if (IS_ERR(ebc->hclk))
+		return dev_err_probe(dev, PTR_ERR(ebc->hclk),
+				     "Failed to get hclk\n");
+
+	for (i = 0; i < EBC_NUM_SUPPLIES; i++)
+		ebc->supplies[i].supply = rockchip_ebc_supplies[i];
+
+	ret = devm_regulator_bulk_get(dev, EBC_NUM_SUPPLIES, ebc->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get supplies\n");
+
+	ret = devm_request_irq(dev, platform_get_irq(pdev, 0),
+			       rockchip_ebc_irq, 0, dev_name(dev), ebc);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
+
+	pm_runtime_set_autosuspend_delay(dev, EBC_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_enable(dev);
+	if (!pm_runtime_enabled(dev)) {
+		ret = rockchip_ebc_runtime_resume(&pdev->dev);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int rockchip_ebc_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		rockchip_ebc_runtime_suspend(dev);
+
+	return 0;
+}
+
+static void rockchip_ebc_shutdown(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	if (!pm_runtime_status_suspended(dev))
+		rockchip_ebc_runtime_suspend(dev);
+}
+
+static const struct of_device_id rockchip_ebc_of_match[] = {
+	{ .compatible = "rockchip,rk3568-ebc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, rockchip_ebc_of_match);
+
+static struct platform_driver rockchip_ebc_driver = {
+	.probe		= rockchip_ebc_probe,
+	.remove		= rockchip_ebc_remove,
+	.shutdown	= rockchip_ebc_shutdown,
+	.driver		= {
+		.name		= "rockchip-ebc",
+		.of_match_table	= rockchip_ebc_of_match,
+		.pm		= &rockchip_ebc_dev_pm_ops,
+	},
+};
+module_platform_driver(rockchip_ebc_driver);
+
+MODULE_AUTHOR("Samuel Holland <samuel@sholland.org>");
+MODULE_DESCRIPTION("Rockchip EBC driver");
+MODULE_LICENSE("GPL");
-- 
2.35.1

