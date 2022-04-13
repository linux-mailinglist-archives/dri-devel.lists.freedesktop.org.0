Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 825155001A1
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 00:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F021B10F134;
	Wed, 13 Apr 2022 22:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2770A10F12E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 22:19:25 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 773CB5C01F8;
 Wed, 13 Apr 2022 18:19:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 13 Apr 2022 18:19:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649888364; x=1649974764; bh=t3
 R9K4RmpPHgFV2MCz+ahY35ugv1/r5JX9ttGYH/p/s=; b=N+/kv28XEg7cqCbiqW
 +pxb2lwnBU9wmAVqImOnBSGM6WsUogv+MVcj58IxCD0hv22fukH8eyBCi0+tkGAy
 zL5gGcPeF8rkgjdpTJlVjvNKfPu29vfnuj0o86hhvi1tHfCzx4mgtcSGRCUmG/Zz
 b7LhKiXdEJMT+gGqOnC4YDiPWMJR+MFgVkwDLeCdqF5qz2cAoXIyzzCp7ByF9DaE
 JkmoslCswHsptydVxVyqpDn+JiJBlDRtcSBrefLO5iMViqA/shxPf0x8+h2kY6X/
 vkiRO/YJBWVZt5V+72gAvHlcmgoi5bjc5TC0dNuTZhoVOcKFd9bdpl6WB+6lwUWJ
 KAzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1649888364; x=1649974764; bh=t3R9K4RmpPHgFV2MCz+ahY35ugv1/r5JX9t
 tGYH/p/s=; b=hEfVZV3vugr1D11KTaj8Wdd4Be/EOWwCeBqZW5PuCcqls8jxMWL
 X96i3gmapN05hcJ1xKnz6ce8RPbitCbIiCY4VaKFQ4A0uRJG7xuWxYFM90WAzXbG
 E5GbOn1djKtTI26X3Q5NdwzKcTzXm4ZNGsDbBJm10iJ3WQ5DXkurqG69CvwyQdup
 0sSajJIDZrr6wDeszGG2SgCeBygrW04M3MEQdk9Ji3dRhvy9rahZR4cAepDiBrps
 3Rw0OrUFbqxUSXNhaoOD1f1jgBWlfyDi9MByhETjQ1ii2SNQUVEyGP8PpVILeP9I
 GiTXcIklWmXxhDBRLrlTM9GBiC2lvSHR4Dw==
X-ME-Sender: <xms:a0xXYp3qAkBdV8T0ckkml-6adAqBjjsXrm43OHqAXyXzxtze35_VIQ>
 <xme:a0xXYgEPuZa9SzXlwkJT7mLTbrsaAr76GxYps8c_J2vKuwVl-DVRdbes70lhOgMuQ
 ZiN9Des0rUP7l-liA>
X-ME-Received: <xmr:a0xXYp6hkhohSO40gKU9DNPvL98i7GSJGcYpfYv9bO0072yaMjX-81cYOb2E_26imtmqVyd6euDIukxdUR3Uxb3PLRiUEAyZjPAaM71CoR3-pi5gt8LC6f_RyWmqhLw8FOTSZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelvddgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:a0xXYm0wLlRystZJxa_5gqHJYiVGRpkJgHMFXhm6MllGqFuE5g08zA>
 <xmx:a0xXYsFQ7L2V8A9a773xBg2WdCURSGHYzXfo3eTsnMIRHXenAqDHSQ>
 <xmx:a0xXYn9k_n7EQ7O7hIhXovn9oPLzcEX8NeErxfMy-0H6xZiAHc1CAQ>
 <xmx:bExXYnmTHhsPEK5AfNsSpfEcwWPdYP_szi2NE7mrITg0qjGdlz39fQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Apr 2022 18:19:22 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 01/16] drm: Add a helper library for EPD drivers
Date: Wed, 13 Apr 2022 17:19:01 -0500
Message-Id: <20220413221916.50995-2-samuel@sholland.org>
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

Currently, this library is focused on LUTs and LUT files, specifically
the PVI wbf-format files shipped with E-Ink displays. It provides
helpers to load and validate LUT files, and extract LUTs from them.

Since EPD controllers need the LUTs in various formats, this library
allows drivers to declare their desired format. It will then convert
LUTs to that format before returning them.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/gpu/drm/Kconfig          |   6 +
 drivers/gpu/drm/Makefile         |   2 +
 drivers/gpu/drm/drm_epd_helper.c | 663 +++++++++++++++++++++++++++++++
 include/drm/drm_epd_helper.h     | 104 +++++
 4 files changed, 775 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_epd_helper.c
 create mode 100644 include/drm/drm_epd_helper.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f1422bee3dcc..ad96cf605444 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -198,6 +198,12 @@ config DRM_DP_CEC
 	  Note: not all adapters support this feature, and even for those
 	  that do support this they often do not hook up the CEC pin.
 
+config DRM_EPD_HELPER
+	tristate
+	depends on DRM
+	help
+	  Choose this if you need the EPD (LUT, etc.) helper functions
+
 config DRM_TTM
 	tristate
 	depends on DRM && MMU
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index c2ef5f9fce54..49380ccfe9d6 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -33,6 +33,8 @@ drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o drm_privacy_screen_x86.
 
 obj-$(CONFIG_DRM_NOMODESET) += drm_nomodeset.o
 
+obj-$(CONFIG_DRM_EPD_HELPER) += drm_epd_helper.o
+
 drm_cma_helper-y := drm_gem_cma_helper.o
 drm_cma_helper-$(CONFIG_DRM_KMS_HELPER) += drm_fb_cma_helper.o
 obj-$(CONFIG_DRM_GEM_CMA_HELPER) += drm_cma_helper.o
diff --git a/drivers/gpu/drm/drm_epd_helper.c b/drivers/gpu/drm/drm_epd_helper.c
new file mode 100644
index 000000000000..433a6728ef3e
--- /dev/null
+++ b/drivers/gpu/drm/drm_epd_helper.c
@@ -0,0 +1,663 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Electrophoretic Display Helper Library
+ *
+ * Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include <linux/firmware.h>
+#include <linux/module.h>
+#include <linux/vmalloc.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_epd_helper.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_print.h>
+
+/**
+ * DOC: overview
+ *
+ * This library provides functions for working with the lookup tables (LUTs)
+ * used by electrophoretic displays (EPDs). It fills in a LUT buffer based on
+ * the selected waveform, the panel temperature, and the buffer format needed
+ * by the driver.
+ */
+
+struct pvi_wbf_offset {
+	u8			b[3];
+};
+
+struct pvi_wbf_pointer {
+	struct pvi_wbf_offset	offset;
+	u8			checksum;
+};
+
+struct pvi_wbf_file_header {
+	__le32			checksum;		// 0x00
+	__le32			file_size;		// 0x04
+	__le32			serial;			// 0x08
+	u8			run_type;		// 0x0c
+	u8			fpl_platform;		// 0x0d
+	__le16			fpl_lot;		// 0x0e
+	u8			mode_version;		// 0x10
+	u8			wf_version;		// 0x11
+	u8			wf_subversion;		// 0x12
+	u8			wf_type;		// 0x13
+	u8			panel_size;		// 0x14
+	u8			amepd_part_number;	// 0x15
+	u8			wf_rev;			// 0x16
+	u8			frame_rate_bcd;		// 0x17
+	u8			frame_rate_hex;		// 0x18
+	u8			vcom_offset;		// 0x19
+	u8			unknown[2];		// 0x1a
+	struct pvi_wbf_offset	xwia;			// 0x1c
+	u8			cs1;			// 0x1f
+	struct pvi_wbf_offset	wmta;			// 0x20
+	u8			fvsn;			// 0x23
+	u8			luts;			// 0x24
+	u8			mode_count;		// 0x25
+	u8			temp_range_count;	// 0x26
+	u8			advanced_wf_flags;	// 0x27
+	u8			eb;			// 0x28
+	u8			sb;			// 0x29
+	u8			reserved[5];		// 0x2a
+	u8			cs2;			// 0x2f
+	u8			temp_range_table[];	// 0x30
+};
+static_assert(sizeof(struct pvi_wbf_file_header) == 0x30);
+
+struct pvi_wbf_mode_info {
+	u8			versions[2];
+	u8			format;
+	u8			modes[DRM_EPD_WF_MAX];
+};
+
+static const struct pvi_wbf_mode_info pvi_wbf_mode_info_table[] = {
+	{
+		.versions = {
+			0x09,
+		},
+		.format = DRM_EPD_LUT_4BIT_PACKED,
+		.modes = {
+			[DRM_EPD_WF_RESET]	= 0,
+			[DRM_EPD_WF_DU]		= 1,
+			[DRM_EPD_WF_DU4]	= 1,
+			[DRM_EPD_WF_GC16]	= 2,
+			[DRM_EPD_WF_GL16]	= 3,
+			[DRM_EPD_WF_GLR16]	= 3,
+			[DRM_EPD_WF_GLD16]	= 3,
+			[DRM_EPD_WF_A2]		= 4,
+			[DRM_EPD_WF_GCC16]	= 3,
+		},
+	},
+	{
+		.versions = {
+			0x12,
+		},
+		.format = DRM_EPD_LUT_4BIT_PACKED,
+		.modes = {
+			[DRM_EPD_WF_RESET]	= 0,
+			[DRM_EPD_WF_DU]		= 1,
+			[DRM_EPD_WF_DU4]	= 7,
+			[DRM_EPD_WF_GC16]	= 3,
+			[DRM_EPD_WF_GL16]	= 3,
+			[DRM_EPD_WF_GLR16]	= 5,
+			[DRM_EPD_WF_GLD16]	= 6,
+			[DRM_EPD_WF_A2]		= 4,
+			[DRM_EPD_WF_GCC16]	= 5,
+		},
+	},
+	{
+		.versions = {
+			0x16,
+		},
+		.format = DRM_EPD_LUT_5BIT_PACKED,
+		.modes = {
+			[DRM_EPD_WF_RESET]	= 0,
+			[DRM_EPD_WF_DU]		= 1,
+			[DRM_EPD_WF_DU4]	= 1,
+			[DRM_EPD_WF_GC16]	= 2,
+			[DRM_EPD_WF_GL16]	= 3,
+			[DRM_EPD_WF_GLR16]	= 4,
+			[DRM_EPD_WF_GLD16]	= 4,
+			[DRM_EPD_WF_A2]		= 6,
+			[DRM_EPD_WF_GCC16]	= 5,
+		},
+	},
+	{
+		.versions = {
+			0x18,
+			0x20,
+		},
+		.format = DRM_EPD_LUT_5BIT_PACKED,
+		.modes = {
+			[DRM_EPD_WF_RESET]	= 0,
+			[DRM_EPD_WF_DU]		= 1,
+			[DRM_EPD_WF_DU4]	= 1,
+			[DRM_EPD_WF_GC16]	= 2,
+			[DRM_EPD_WF_GL16]	= 3,
+			[DRM_EPD_WF_GLR16]	= 4,
+			[DRM_EPD_WF_GLD16]	= 5,
+			[DRM_EPD_WF_A2]		= 6,
+			[DRM_EPD_WF_GCC16]	= 4,
+		},
+	},
+	{
+		.versions = {
+			0x19,
+			0x43,
+		},
+		.format = DRM_EPD_LUT_5BIT_PACKED,
+		.modes = {
+			[DRM_EPD_WF_RESET]	= 0,
+			[DRM_EPD_WF_DU]		= 1,
+			[DRM_EPD_WF_DU4]	= 7,
+			[DRM_EPD_WF_GC16]	= 2,
+			[DRM_EPD_WF_GL16]	= 3,
+			[DRM_EPD_WF_GLR16]	= 4,
+			[DRM_EPD_WF_GLD16]	= 5,
+			[DRM_EPD_WF_A2]		= 6,
+			[DRM_EPD_WF_GCC16]	= 4,
+		},
+	},
+	{
+		.versions = {
+			0x23,
+		},
+		.format = DRM_EPD_LUT_4BIT_PACKED,
+		.modes = {
+			[DRM_EPD_WF_RESET]	= 0,
+			[DRM_EPD_WF_DU]		= 1,
+			[DRM_EPD_WF_DU4]	= 5,
+			[DRM_EPD_WF_GC16]	= 2,
+			[DRM_EPD_WF_GL16]	= 3,
+			[DRM_EPD_WF_GLR16]	= 3,
+			[DRM_EPD_WF_GLD16]	= 3,
+			[DRM_EPD_WF_A2]		= 4,
+			[DRM_EPD_WF_GCC16]	= 3,
+		},
+	},
+	{
+		.versions = {
+			0x54,
+		},
+		.format = DRM_EPD_LUT_4BIT_PACKED,
+		.modes = {
+			[DRM_EPD_WF_RESET]	= 0,
+			[DRM_EPD_WF_DU]		= 1,
+			[DRM_EPD_WF_DU4]	= 1,
+			[DRM_EPD_WF_GC16]	= 2,
+			[DRM_EPD_WF_GL16]	= 3,
+			[DRM_EPD_WF_GLR16]	= 4,
+			[DRM_EPD_WF_GLD16]	= 4,
+			[DRM_EPD_WF_A2]		= 5,
+			[DRM_EPD_WF_GCC16]	= 4,
+		},
+	},
+};
+
+static const void *pvi_wbf_apply_offset(const struct drm_epd_lut_file *file,
+					const struct pvi_wbf_offset *offset)
+{
+	u32 bytes = offset->b[0] | offset->b[1] << 8 | offset->b[2] << 16;
+
+	if (bytes >= file->fw->size)
+		return NULL;
+
+	return (const void *)file->header + bytes;
+}
+
+static const void *pvi_wbf_dereference(const struct drm_epd_lut_file *file,
+				       const struct pvi_wbf_pointer *ptr)
+{
+	u8 sum = ptr->offset.b[0] + ptr->offset.b[1] + ptr->offset.b[2];
+
+	if (ptr->checksum != sum)
+		return NULL;
+
+	return pvi_wbf_apply_offset(file, &ptr->offset);
+}
+
+static int pvi_wbf_get_mode_index(const struct drm_epd_lut_file *file,
+				  enum drm_epd_waveform waveform)
+{
+	if (waveform >= DRM_EPD_WF_MAX)
+		return -EINVAL;
+
+	return file->mode_info->modes[waveform];
+}
+
+static int pvi_wbf_get_mode_info(struct drm_epd_lut_file *file)
+{
+	u8 mode_version = file->header->mode_version;
+	const struct pvi_wbf_mode_info *mode_info;
+	int i, v;
+
+	for (i = 0; i < ARRAY_SIZE(pvi_wbf_mode_info_table); i++) {
+		mode_info = &pvi_wbf_mode_info_table[i];
+
+		for (v = 0; v < ARRAY_SIZE(mode_info->versions); v++) {
+			if (mode_info->versions[v] == mode_version) {
+				file->mode_info = mode_info;
+				return 0;
+			}
+		}
+	}
+
+	drm_err(file->dev, "Unknown PVI waveform version 0x%02x\n",
+		mode_version);
+
+	return -EOPNOTSUPP;
+}
+
+static int pvi_wbf_get_temp_index(const struct drm_epd_lut_file *file,
+				  int temperature)
+{
+	const struct pvi_wbf_file_header *header = file->header;
+	int i;
+
+	for (i = 0; i < header->temp_range_count; i++)
+		if (temperature < header->temp_range_table[i])
+			return i - 1;
+
+	return header->temp_range_count - 1;
+}
+
+static int pvi_wbf_validate_header(struct drm_epd_lut_file *file)
+{
+	const struct pvi_wbf_file_header *header = file->header;
+	int ret;
+
+	if (le32_to_cpu(header->file_size) > file->fw->size)
+		return -EINVAL;
+
+	ret = pvi_wbf_get_mode_info(file);
+	if (ret)
+		return ret;
+
+	drm_info(file->dev, "Loaded %d-bit PVI waveform version 0x%02x\n",
+		 file->mode_info->format == DRM_EPD_LUT_5BIT_PACKED ? 5 : 4,
+		 header->mode_version);
+
+	return 0;
+}
+
+static void drm_epd_lut_file_free(struct drm_device *dev, void *res)
+{
+	struct drm_epd_lut_file *file = res;
+
+	release_firmware(file->fw);
+}
+
+/**
+ * drmm_epd_lut_file_init - Initialize a managed EPD LUT file
+ *
+ * @dev: The DRM device owning this LUT file
+ * @file: The LUT file to initialize
+ * @file_name: The filesystem name of the LUT file
+ *
+ * Return: negative errno on failure, 0 otherwise
+ */
+int drmm_epd_lut_file_init(struct drm_device *dev,
+			   struct drm_epd_lut_file *file,
+			   const char *file_name)
+{
+	int ret;
+
+	ret = request_firmware(&file->fw, file_name, dev->dev);
+	if (ret)
+		return ret;
+
+	ret = drmm_add_action_or_reset(dev, drm_epd_lut_file_free, file);
+	if (ret)
+		return ret;
+
+	file->dev = dev;
+	file->header = (const void *)file->fw->data;
+
+	ret = pvi_wbf_validate_header(file);
+	if (ret)
+		return ret;
+
+	/* Only 5-bit waveform files are supported by drm_epd_lut_convert. */
+	if (file->mode_info->format != DRM_EPD_LUT_5BIT_PACKED)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+EXPORT_SYMBOL(drmm_epd_lut_file_init);
+
+/**
+ * drm_epd_lut_size_shift - Get the size of a LUT phase in power-of-2 bytes
+ *
+ * @format: One of the LUT buffer formats
+ *
+ * Return: buffer size shift amount
+ */
+static int drm_epd_lut_size_shift(enum drm_epd_lut_format format)
+{
+	switch (format) {
+	case DRM_EPD_LUT_4BIT:
+		/* (4 bits/pixel)^2 / 1 pixel/byte */
+		return 4 + 4;
+	case DRM_EPD_LUT_4BIT_PACKED:
+		/* (4 bits/pixel)^2 / 4 pixels/byte */
+		return 4 + 4 - 2;
+	case DRM_EPD_LUT_5BIT:
+		/* (5 bits/pixel)^2 / 1 pixel/byte */
+		return 5 + 5;
+	case DRM_EPD_LUT_5BIT_PACKED:
+		/* (5 bits/pixel)^2 / 4 pixels/byte */
+		return 5 + 5 - 2;
+	}
+
+	unreachable();
+}
+
+static int pvi_wbf_decode_lut(struct drm_epd_lut *lut, const u8 *lut_data)
+{
+
+	unsigned int copies, max_bytes, size_shift, state, total_bytes;
+	struct drm_device *dev = lut->file->dev;
+	const u8 *in = lut_data;
+	u8 *out = lut->buf;
+	u8 token;
+
+	size_shift = drm_epd_lut_size_shift(lut->file->mode_info->format);
+	max_bytes = lut->max_phases << size_shift;
+	total_bytes = 0;
+	state = 1;
+
+	/* Read tokens until reaching the end-of-input marker. */
+	while ((token = *in++) != 0xff) {
+		/* Special handling for the state switch token. */
+		if (token == 0xfc) {
+			state = !state;
+			token = *in++;
+		}
+
+		/*
+		 * State 0 is a sequence of data bytes.
+		 * State 1 is a sequence of [data byte, extra copies] pairs.
+		 */
+		copies = 1 + (state ? *in++ : 0);
+
+		total_bytes += copies;
+		if (total_bytes > max_bytes) {
+			drm_err(dev, "LUT contains too many phases\n");
+			lut->num_phases = 0;
+			return -EILSEQ;
+		}
+
+		while (copies--)
+			*out++ = token;
+	}
+
+	lut->num_phases = total_bytes >> size_shift;
+	if (total_bytes != lut->num_phases << size_shift) {
+		drm_err(dev, "LUT contains a partial phase\n");
+		lut->num_phases = 0;
+		return -EILSEQ;
+	}
+
+	drm_dbg_core(dev, "LUT contains %d phases (%ld => %ld bytes)\n",
+		     lut->num_phases, in - lut_data, out - lut->buf);
+
+	return 0;
+}
+
+static int pvi_wbf_get_lut(struct drm_epd_lut *lut,
+			   int mode_index, int temp_index)
+{
+	const struct pvi_wbf_pointer *mode_table, *temp_table;
+	const struct drm_epd_lut_file *file = lut->file;
+	const u8 *lut_data;
+	int ret;
+
+	mode_table = pvi_wbf_apply_offset(file, &file->header->wmta);
+	if (!mode_table)
+		return -EFAULT;
+
+	temp_table = pvi_wbf_dereference(file, &mode_table[mode_index]);
+	if (!temp_table)
+		return -EFAULT;
+
+	lut_data = pvi_wbf_dereference(file, &temp_table[temp_index]);
+	if (!lut_data)
+		return -EFAULT;
+
+	ret = pvi_wbf_decode_lut(lut, lut_data);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void drm_epd_lut_convert(const struct drm_epd_lut *lut)
+{
+	enum drm_epd_lut_format from = lut->file->mode_info->format;
+	enum drm_epd_lut_format to = lut->format;
+	u8 *buf = lut->buf;
+	size_t x, y;
+
+	if (to == from)
+		return;
+
+	switch (to) {
+	case DRM_EPD_LUT_4BIT:
+		for (y = 0; y < 16 * lut->num_phases; ++y) {
+			for (x = 8; x--;) {
+				u8 byte = buf[16 * y + x];
+
+				buf[16 * y + 2 * x + 0] = (byte >> 0) & 0x03;
+				buf[16 * y + 2 * x + 1] = (byte >> 4) & 0x03;
+			}
+		}
+		for (; y < 16 * lut->max_phases; ++y) {
+			for (x = 8; x--;) {
+				buf[16 * y + 2 * x + 0] = 0;
+				buf[16 * y + 2 * x + 1] = 0;
+			}
+		}
+		break;
+	case DRM_EPD_LUT_4BIT_PACKED:
+		for (y = 0; y < 16 * lut->num_phases; ++y) {
+			for (x = 4; x--;) {
+				u8 lo_byte = buf[16 * y + 2 * x + 0] & 0x33;
+				u8 hi_byte = buf[16 * y + 2 * x + 1] & 0x33;
+
+				/* Copy bits 4:5 => bits 2:3. */
+				lo_byte |= lo_byte >> 2;
+				hi_byte |= hi_byte >> 2;
+
+				buf[4 * y + x] = (lo_byte & 0xf) |
+						 (hi_byte << 4);
+			}
+		}
+		for (; y < 16 * lut->max_phases; ++y) {
+			for (x = 4; x--;)
+				buf[4 * y + x] = 0;
+		}
+		break;
+	case DRM_EPD_LUT_5BIT:
+		memset(buf + 256 * lut->num_phases, 0,
+		       256 * (lut->max_phases - lut->num_phases));
+		for (x = 256 * lut->num_phases; x--;) {
+			u8 byte = buf[x];
+
+			buf[4 * x + 0] = (byte >> 0) & 0x03;
+			buf[4 * x + 1] = (byte >> 2) & 0x03;
+			buf[4 * x + 2] = (byte >> 4) & 0x03;
+			buf[4 * x + 3] = (byte >> 6) & 0x03;
+		}
+		break;
+	case DRM_EPD_LUT_5BIT_PACKED:
+		/* Nothing to do. */
+		break;
+	}
+}
+
+static int drm_epd_lut_update(struct drm_epd_lut *lut,
+			      int mode_index, int temp_index)
+{
+	int ret;
+
+	ret = pvi_wbf_get_lut(lut, mode_index, temp_index);
+	if (ret)
+		return ret;
+
+	drm_epd_lut_convert(lut);
+
+	return 0;
+}
+
+/**
+ * drm_epd_lut_set_temperature - Update the LUT due to panel temperature change
+ *
+ * @lut: The LUT structure
+ * @temperateure: The current panel temperature in degrees Celsius
+ *
+ * Return: negative errno on failure, 1 if LUT was changed, 0 otherwise
+ */
+int drm_epd_lut_set_temperature(struct drm_epd_lut *lut,
+				int temperature)
+{
+	int temp_index;
+	int ret;
+
+	temp_index = pvi_wbf_get_temp_index(lut->file, temperature);
+	if (temp_index < 0)
+		return -ENOENT;
+
+	if (temp_index == lut->temp_index)
+		return 0;
+
+	drm_dbg_core(lut->file->dev, "LUT temperature changed (%d)\n",
+		     temperature);
+
+	ret = drm_epd_lut_update(lut, lut->mode_index, temp_index);
+	if (ret)
+		return ret;
+
+	lut->temp_index = temp_index;
+
+	return 1;
+}
+EXPORT_SYMBOL(drm_epd_lut_set_temperature);
+
+/**
+ * drm_epd_lut_set_waveform - Update the LUT due to waveform selection change
+ *
+ * @lut: The LUT structure
+ * @waveform: The desired waveform
+ *
+ * Return: negative errno on failure, 1 if LUT was changed, 0 otherwise
+ */
+int drm_epd_lut_set_waveform(struct drm_epd_lut *lut,
+			     enum drm_epd_waveform waveform)
+{
+	int mode_index;
+	int ret;
+
+	mode_index = pvi_wbf_get_mode_index(lut->file, waveform);
+	if (mode_index < 0)
+		return -ENOENT;
+
+	if (mode_index == lut->mode_index)
+		return 0;
+
+	drm_dbg_core(lut->file->dev, "LUT waveform changed (%d)\n",
+		     waveform);
+
+	ret = drm_epd_lut_update(lut, mode_index, lut->temp_index);
+	if (ret)
+		return ret;
+
+	lut->mode_index = mode_index;
+
+	return 1;
+}
+EXPORT_SYMBOL(drm_epd_lut_set_waveform);
+
+static void drm_epd_lut_free(struct drm_device *dev, void *res)
+{
+	struct drm_epd_lut *lut = res;
+
+	vfree(lut->buf);
+}
+
+/**
+ * drmm_epd_lut_init - Initialize a managed EPD LUT from a LUT file
+ *
+ * @dev: The DRM device owning this LUT
+ * @lut: The LUT to initialize
+ * @file_name: The file name of the waveform firmware
+ * @format: The LUT buffer format needed by the driver
+ * @max_phases: The maximum number of waveform phases supported by the driver
+ *
+ * Return: negative errno on failure, 0 otherwise
+ */
+int drmm_epd_lut_init(struct drm_epd_lut_file *file,
+		      struct drm_epd_lut *lut,
+		      enum drm_epd_lut_format format,
+		      unsigned int max_phases)
+{
+	size_t max_order;
+	int ret;
+
+	/* Allocate a buffer large enough to convert the LUT in place. */
+	max_order = max(drm_epd_lut_size_shift(file->mode_info->format),
+			drm_epd_lut_size_shift(format));
+	lut->buf = vmalloc(max_phases << max_order);
+	if (!lut->buf)
+		return -ENOMEM;
+
+	ret = drmm_add_action_or_reset(file->dev, drm_epd_lut_free, lut);
+	if (ret)
+		return ret;
+
+	lut->file	= file;
+	lut->format	= format;
+	lut->max_phases	= max_phases;
+	lut->num_phases	= 0;
+
+	/* Set sane initial values for the waveform and temperature. */
+	lut->mode_index = pvi_wbf_get_mode_index(file, DRM_EPD_WF_RESET);
+	if (lut->mode_index < 0)
+		return -ENOENT;
+
+	lut->temp_index = pvi_wbf_get_temp_index(file, 25);
+	if (lut->temp_index < 0)
+		return -ENOENT;
+
+	ret = drm_epd_lut_update(lut, lut->mode_index, lut->temp_index);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL(drmm_epd_lut_init);
+
+MODULE_AUTHOR("Samuel Holland <samuel@sholland.org>");
+MODULE_DESCRIPTION("DRM EPD waveform LUT library");
+MODULE_LICENSE("Dual MIT/GPL");
diff --git a/include/drm/drm_epd_helper.h b/include/drm/drm_epd_helper.h
new file mode 100644
index 000000000000..290f5d48c0cb
--- /dev/null
+++ b/include/drm/drm_epd_helper.h
@@ -0,0 +1,104 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#ifndef __DRM_EPD_HELPER_H__
+#define __DRM_EPD_HELPER_H__
+
+#define DRM_EPD_DEFAULT_TEMPERATURE	25
+
+struct drm_device;
+struct firmware;
+struct pvi_wbf_file_header;
+struct pvi_wbf_mode_info;
+
+/**
+ * enum drm_epd_waveform - Identifiers for waveforms used to drive EPD pixels
+ *
+ * @DRM_EPD_WF_RESET: Used to initialize the panel, ends with white
+ * @DRM_EPD_WF_A2: Fast transitions between black and white only
+ * @DRM_EPD_WF_DU: Transitions 16-level grayscale to monochrome
+ * @DRM_EPD_WF_DU4: Transitions 16-level grayscale to 4-level grayscale
+ * @DRM_EPD_WF_GC16: High-quality but flashy 16-level grayscale
+ * @DRM_EPD_WF_GCC16: Less flashy 16-level grayscale
+ * @DRM_EPD_WF_GL16: Less flashy 16-level grayscale
+ * @DRM_EPD_WF_GLR16: Less flashy 16-level grayscale, plus anti-ghosting
+ * @DRM_EPD_WF_GLD16: Less flashy 16-level grayscale, plus anti-ghosting
+ */
+enum drm_epd_waveform {
+	DRM_EPD_WF_RESET,
+	DRM_EPD_WF_A2,
+	DRM_EPD_WF_DU,
+	DRM_EPD_WF_DU4,
+	DRM_EPD_WF_GC16,
+	DRM_EPD_WF_GCC16,
+	DRM_EPD_WF_GL16,
+	DRM_EPD_WF_GLR16,
+	DRM_EPD_WF_GLD16,
+	DRM_EPD_WF_MAX
+};
+
+/**
+ * enum drm_epd_lut_format - EPD LUT buffer format
+ *
+ * @DRM_EPD_LUT_4BIT: 4-bit grayscale indexes, 1 byte per element
+ * @DRM_EPD_LUT_4BIT_PACKED: 4-bit grayscale indexes, 2 bits per element
+ * @DRM_EPD_LUT_5BIT: 5-bit grayscale indexes, 1 byte per element
+ * @DRM_EPD_LUT_5BIT_PACKED: 5-bit grayscale indexes, 2 bits per element
+ */
+enum drm_epd_lut_format {
+	DRM_EPD_LUT_4BIT,
+	DRM_EPD_LUT_4BIT_PACKED,
+	DRM_EPD_LUT_5BIT,
+	DRM_EPD_LUT_5BIT_PACKED,
+};
+
+/**
+ * struct drm_epd_lut_file - Describes a file containing EPD LUTs
+ *
+ * @dev: The DRM device owning this LUT file
+ * @fw: The firmware object holding the raw file contents
+ * @header: Vendor-specific LUT file header
+ * @mode_info: Vendor-specific information about available waveforms
+ */
+struct drm_epd_lut_file {
+	struct drm_device			*dev;
+	const struct firmware			*fw;
+	const struct pvi_wbf_file_header	*header;
+	const struct pvi_wbf_mode_info		*mode_info;
+};
+
+/**
+ * struct drm_epd_lut - Describes a particular LUT buffer
+ *
+ * @buf: The LUT, in the format requested by the driver
+ * @file: The file where this LUT was loaded from
+ * @format: The LUT buffer format needed by the driver
+ * @max_phases: The maximum number of waveform phases supported by the driver
+ * @num_phases: The number of waveform phases in the current LUT
+ * @mode_index: Private identifier for the current waveform
+ * @temp_index: Private identifier for the current temperature
+ */
+struct drm_epd_lut {
+	u8				*buf;
+	const struct drm_epd_lut_file	*file;
+	enum drm_epd_lut_format		format;
+	unsigned int			max_phases;
+	unsigned int			num_phases;
+	int				mode_index;
+	int				temp_index;
+};
+
+int drmm_epd_lut_file_init(struct drm_device *dev,
+			   struct drm_epd_lut_file *file,
+			   const char *file_name);
+
+int drmm_epd_lut_init(struct drm_epd_lut_file *file,
+		      struct drm_epd_lut *lut,
+		      enum drm_epd_lut_format format,
+		      unsigned int max_phases);
+
+int drm_epd_lut_set_temperature(struct drm_epd_lut *lut,
+				int temperature);
+int drm_epd_lut_set_waveform(struct drm_epd_lut *lut,
+			     enum drm_epd_waveform waveform);
+
+#endif /* __DRM_EPD_HELPER_H__ */
-- 
2.35.1

