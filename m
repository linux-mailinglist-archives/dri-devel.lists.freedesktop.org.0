Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C79ACE4B4E
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 12:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CD410F40B;
	Sun, 28 Dec 2025 11:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="htWF5g+q";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="adiVAK5n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516D610F4C9
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 11:41:36 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BSBJIAO3081167
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 11:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 z0rsyMfnSMVjG7eYM5sSuBfEla5IEk3vdg7bZNHRL4Y=; b=htWF5g+q2lsfVpbs
 m9xJtGN0TgPhBY5TuVkg3/nNTSJy0vGvudfBqvHpfrK+CIflD3xZWFhFkaUKxT1O
 Sj6m110/6Xzur4hjivpxchFls1M32ILwQk5uakzzeYOMw5qWeMZYMCK5izWJnmZb
 HeT9M7HTI0xwKiQTLwiDqxGv9v0FtI9GLoDEsZNc1Y4YClf4LkB6kCyHO1GvEq6v
 NObjFhP6yCe7zSEkhyqmvwiS/b5Ptn80blbZBUfr/Fhaf6wLVDl4W72fLwSZNxfE
 nz79p1qf1LDUm5JGZTPFwkwF3KfIR6xFfrQ7md9OzvsOGH+jge4Y1xsiA0h/DZDw
 Ebl/Bw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6f625yh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 11:41:35 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-ba43116e8abso542178a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 03:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766922094; x=1767526894;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=z0rsyMfnSMVjG7eYM5sSuBfEla5IEk3vdg7bZNHRL4Y=;
 b=adiVAK5nsTAVhJPHIv+qrBSwfPFAAD7zNVVdsKpE6KiHB9WkPAZHBY8ghoUS6PUfos
 Jsef58Gowv/mdcFoDd6202EWN7iekjrLZRcvqQDzbq1aO8PjJ1bxZ1ttrQfUBhixTduy
 y7uDbLBe5eb7JoBZVbtBGpxxcdmrJvsg6BFLc9C2Bi3DGaBrK3i6iXDP7QqZSSqSjshB
 FyqWzzpfQH3kbLbsKpxrvQSxcvnhFmpxTDRQTaQyGJTvIj24/a40GNPyHPeZRPNlZH6p
 got5k/7X9iJ+7jylP7cJW8BKV5Zv31CZ5+nrgCGtXQItw5a+a4v2/xLSw8ndpsdrHy6q
 /odQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766922094; x=1767526894;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=z0rsyMfnSMVjG7eYM5sSuBfEla5IEk3vdg7bZNHRL4Y=;
 b=HTh8ploqnIYQfaewEYT8RiiEmxDcMiV8C+wPn+/+b78S2HjZ0z9C+cO8LupIdQlHsO
 bFwuMuTZ4Gy8h3741XkJ00uKnT87eQx6datUM30LSV29EoMMbqm00MCs/3Y7sYAQ2a0q
 1Ibo6UpmMqntO5cHqJ/bwDLo7aJqwsMeZBBUYJIkYYrRm9Q0wLLJo0WsNb2rIfzr9als
 ArB/F0XtVUiWAeAni32u7ByDqricisb1gAa8fy053f072Jpd1wcMNinF9zam5L6zdQtl
 ECxjVXkcsvW9BcBJDwK1ln7uahJQLSfNS9H0Vqe0BOYXGyGO8sWR7x6olgrNMkoND1Vz
 yVpA==
X-Gm-Message-State: AOJu0YzHQeImaOnnkViBUjsoySJIldyMosLkpzknca54a2bwDBZ2Pjws
 tez+0a6vk58CB7bSmyBDE+UNLiht2o9qUpcppKPCQPJcrm8DrVk0ZO23OXRpcBRBxf6edRHWiZP
 6iyKfsaaZbDNak6tKXXx1D+exB3twHKlfp2tC6KEpDzoJplwMquTi+0wpR1bJD/5M8Ur69DO496
 u8HsQ=
X-Gm-Gg: AY/fxX5+SDhzOjGhZfqmIQ2C31R7X2cWcJm1Iyp+4qtaA+KQbopi6Psjz65+vKAERdL
 pAIhXS0gxzAmmJYUsszip8yqu6vOYftfAqj8CmZmjLAuhJX4PE1r6MhFaupP55tyKvYaW9LbzjD
 W/AaN5X+5GDwDOEUmPnGIL4pE3wHbQV8jvPifBiqKgqiQg1VvP+H874Mn/efwUyRx409ugEYYsF
 TgTRQ6kxYid1AqfLRrDxG+sZrHYTDClmTRFLPnjeIGBnqwNJfSiAr4SbKuOJVwxH0CpU1Y1grqo
 ORsmW0UtxnIlIe9WoR+P5VhJpuqSU6O7E9dLUqVhHJCHWrFJ/pXAHN0NvZHFn2FNv9nDhl9ypRJ
 GNKL32gCUsxfvi/5RfgIewBjsNxBXxG8v7W82Hc6GgVob+GSTzkHzSib1guGmo9Fg7shnTMiN0H
 bu0HMyZ5p6w39pAloetJGSEiwBctYuow==
X-Received: by 2002:a05:6a00:17a1:b0:7b2:b20:e8d9 with SMTP id
 d2e1a72fcca58-7ff682460c9mr16272784b3a.6.1766922093827; 
 Sun, 28 Dec 2025 03:41:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbzuZjej7dofVQz+LVzaPa4pI3i4/MrbeAYBDogcsludpnEXNFnzNmKk+D5ibY8b1M1Ob4Lg==
X-Received: by 2002:a05:6a00:17a1:b0:7b2:b20:e8d9 with SMTP id
 d2e1a72fcca58-7ff682460c9mr16272764b3a.6.1766922093223; 
 Sun, 28 Dec 2025 03:41:33 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e197f9asm26214067b3a.43.2025.12.28.03.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 03:41:32 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 17:10:40 +0530
Subject: [PATCH v3 2/2] drm/bridge: add support for lontium lt8713sx bridge
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-lt8713sx-bridge-driver-v3-2-9169fbef0e5b@oss.qualcomm.com>
References: <20251228-lt8713sx-bridge-driver-v3-0-9169fbef0e5b@oss.qualcomm.com>
In-Reply-To: <20251228-lt8713sx-bridge-driver-v3-0-9169fbef0e5b@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tony <syyang@lontium.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
 prahlad.valluru@oss.qualcomm.com,
 Prahlad Valluru <vvalluru@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766922077; l=21368;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=YGUOA/mG99rfEU/eoERsbhNRUe7s7u1n+QTtZ/X6mlM=;
 b=slwxm0toGxl3ud50AGJhdfYa3RzVhhhy24wRu4D2OsP7EIqtUL/DPe9EBhDh2Er2bN0FkVP2L
 llbjeURvLyjA+iCCggY6JYKI7qq2rlfSU6YNfa8VPQ04vqKX7fuPpNS
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: tgXkGXyGkpjNtiTP6AFDsZidfwmjhpqh
X-Proofpoint-ORIG-GUID: tgXkGXyGkpjNtiTP6AFDsZidfwmjhpqh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDEwOCBTYWx0ZWRfX7tlp2NIZP38c
 sl3AQo2m5TzCo8/L6E2LBZV9L5dSjS48CppkRf64LG8asYegbPoDGUEjNzSLwp3wbS6slmZIdCR
 kqg1F0PBUYF/Fk1jaNazUGV+6R+x3+0YDIYGFZZiYF0bhhRSjAo6HWsS8RVmXhrJA7TIq9xnRHp
 RqoFkiA0+aRWDweECJLsFufc4u5aU4R4a78r/s9eUYt/6KAw6BsdtOrxx9lJzHakibgfSOkvLFP
 VFyh5EVafV3TIeVPF0zxVX8vj0XNsC1PZTKuKJsL6atX3SMGIMmtzuJPuWfHkyMYEFMaa+tU1W8
 /ow+WAiQ8KvbT99cyZZiIBenEtaAjWH5ipSyYYzpnoOs2TSUG5kJt0sDOIltcM0ofH0sa1/v9CT
 YCWApxCLGn+NovBxamuMAyGdbyaerwOXHfyRiT+SZo+ytcGdpYY9b/3EY35KdkIW2PD6V3FcrFL
 er1D1UifnD8p3yOOXjA==
X-Authority-Analysis: v=2.4 cv=YuEChoYX c=1 sm=1 tr=0 ts=6951176f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8
 a=Los8Fsgh6qdBVcIiYUAA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_04,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280108
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

The lt8713sx is a Type-C/DP1.4 to Type-C/DP1.4/HDMI2.0 converter,
with three configurable DP1.4/HDMI2.0/DP++ output interfaces and
audio output interface.

Driver is required for firmware upgrade in the bridge chip.

Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/Kconfig            |  10 +
 drivers/gpu/drm/bridge/Makefile           |   1 +
 drivers/gpu/drm/bridge/lontium-lt8713sx.c | 682 ++++++++++++++++++++++++++++++
 3 files changed, 693 insertions(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index a250afd8d662..7fef383ed7cb 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -184,6 +184,16 @@ config DRM_LONTIUM_LT9611UXC
 	  HDMI signals
 	  Please say Y if you have such hardware.
 
+config DRM_LONTIUM_LT8713SX
+	tristate "Lontium LT8713SX DP MST bridge"
+	depends on OF
+	select REGMAP_I2C
+	help
+	  Driver for Lontium LT8713SX DP MST bridge
+	  chip firmware upgrade, which converts Type-C/DP1.4
+	  to 3 configurable Type-C/DP1.4/HDMI2.0 outputs
+	  Please say Y if you have such hardware.
+
 config DRM_ITE_IT66121
 	tristate "ITE IT66121 HDMI bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index c7dc03182e59..07eeb13fa497 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -16,6 +16,7 @@ obj-$(CONFIG_DRM_LONTIUM_LT8912B) += lontium-lt8912b.o
 obj-$(CONFIG_DRM_LONTIUM_LT9211) += lontium-lt9211.o
 obj-$(CONFIG_DRM_LONTIUM_LT9611) += lontium-lt9611.o
 obj-$(CONFIG_DRM_LONTIUM_LT9611UXC) += lontium-lt9611uxc.o
+obj-$(CONFIG_DRM_LONTIUM_LT8713SX) += lontium-lt8713sx.o
 obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
 obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
 obj-$(CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER) += microchip-lvds.o
diff --git a/drivers/gpu/drm/bridge/lontium-lt8713sx.c b/drivers/gpu/drm/bridge/lontium-lt8713sx.c
new file mode 100644
index 000000000000..6ea54ff3733d
--- /dev/null
+++ b/drivers/gpu/drm/bridge/lontium-lt8713sx.c
@@ -0,0 +1,682 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/crc8.h>
+#include <linux/firmware.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/sizes.h>
+#include <linux/wait.h>
+#include <linux/workqueue.h>
+
+#include <drm/drm_bridge.h>
+
+#define FW_FILE "lt8713sx_fw.bin"
+
+#define REG_PAGE_CONTROL	0xff
+
+#define MAX_OUTPUT_PORTS	3
+#define LT8713SX_PAGE_SIZE	256
+
+DECLARE_CRC8_TABLE(lt8713sx_crc_table);
+
+struct lt8713sx {
+	struct device *dev;
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge[MAX_OUTPUT_PORTS];
+	int num_outputs;
+
+	struct regmap *regmap;
+	/* Protects all accesses to registers by stopping the on-chip MCU */
+	struct mutex ocm_lock;
+
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *enable_gpio;
+
+	struct i2c_client *client;
+	const struct firmware *fw;
+
+	u8 *fw_buffer;
+
+	u32 main_crc_value;
+	u32 bank_crc_value[17];
+
+	int bank_num;
+};
+
+static void lt8713sx_reset(struct lt8713sx *lt8713sx);
+
+static const struct regmap_range lt8713sx_ranges[] = {
+	{
+		.range_min = 0x0000,
+		.range_max = 0xffff
+	},
+};
+
+static const struct regmap_access_table lt8713sx_table = {
+	.yes_ranges = lt8713sx_ranges,
+	.n_yes_ranges = ARRAY_SIZE(lt8713sx_ranges),
+};
+
+static const struct regmap_range_cfg lt8713sx_range_cfg = {
+	.name = "lt8713sx",
+	.range_min = 0x0000,
+	.range_max = 0xffff,
+	.selector_reg = REG_PAGE_CONTROL,
+	.selector_mask = 0xff,
+	.selector_shift = 0,
+	.window_start = 0,
+	.window_len = 0x100,
+};
+
+static const struct regmap_config lt8713sx_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.volatile_table = &lt8713sx_table,
+	.ranges = &lt8713sx_range_cfg,
+	.num_ranges = 1,
+	.cache_type = REGCACHE_NONE,
+	.max_register = 0xffff,
+};
+
+static void lt8713sx_i2c_enable(struct lt8713sx *lt8713sx)
+{
+	regmap_write(lt8713sx->regmap, 0xe0ee, 0x01);
+}
+
+static void lt8713sx_i2c_disable(struct lt8713sx *lt8713sx)
+{
+	regmap_write(lt8713sx->regmap, 0xe0ee, 0x00);
+}
+
+static u32 calculate_crc(const u8 *upgrade_data, u64 len, u64 crc_size)
+{
+	u8 crc = 0x00;
+	u8 pad = 0xff;
+
+	crc = crc8(lt8713sx_crc_table, upgrade_data, len, crc);
+
+	/* pad remaining bytes */
+	crc_size -= len;
+	while (crc_size--)
+		crc = crc8(lt8713sx_crc_table, &pad, 1, crc);
+
+	return crc;
+}
+
+static int lt8713sx_prepare_firmware_data(struct lt8713sx *lt8713sx)
+{
+	int ret = 0;
+	u64 sz_12k = 12 * SZ_1K;
+
+	ret = request_firmware(&lt8713sx->fw, FW_FILE, lt8713sx->dev);
+	if (ret < 0) {
+		dev_err(lt8713sx->dev, "request firmware failed\n");
+		return ret;
+	}
+
+	dev_dbg(lt8713sx->dev, "Firmware size: %zu bytes\n", lt8713sx->fw->size);
+
+	if (lt8713sx->fw->size > SZ_256K - 1) {
+		dev_err(lt8713sx->dev, "Firmware size exceeds 256KB limit\n");
+		release_firmware(lt8713sx->fw);
+		return -EINVAL;
+	}
+
+	lt8713sx->fw_buffer = kvmalloc(SZ_256K, GFP_KERNEL);
+	if (!lt8713sx->fw_buffer) {
+		release_firmware(lt8713sx->fw);
+		return -ENOMEM;
+	}
+
+	memset(lt8713sx->fw_buffer, 0xff, SZ_256K);
+
+	if (lt8713sx->fw->size < SZ_64K) {
+		memcpy(lt8713sx->fw_buffer, lt8713sx->fw->data, lt8713sx->fw->size);
+		lt8713sx->fw_buffer[SZ_64K - 1] =
+				calculate_crc(lt8713sx->fw->data, lt8713sx->fw->size, SZ_64K - 1);
+		lt8713sx->main_crc_value = lt8713sx->fw_buffer[SZ_64K - 1];
+		dev_dbg(lt8713sx->dev,
+			"Main Firmware Data  Crc=0x%02X\n", lt8713sx->main_crc_value);
+
+	} else {
+		/* main firmware */
+		memcpy(lt8713sx->fw_buffer, lt8713sx->fw->data, SZ_64K - 1);
+		lt8713sx->fw_buffer[SZ_64K - 1] =
+				calculate_crc(lt8713sx->fw_buffer, SZ_64K - 1, SZ_64K - 1);
+		lt8713sx->main_crc_value = lt8713sx->fw_buffer[SZ_64K - 1];
+		dev_dbg(lt8713sx->dev,
+			"Main Firmware Data  Crc=0x%02X\n", lt8713sx->main_crc_value);
+
+		/* bank firmware */
+		memcpy(lt8713sx->fw_buffer + SZ_64K,
+		       lt8713sx->fw->data + SZ_64K,
+		       lt8713sx->fw->size - SZ_64K);
+
+		lt8713sx->bank_num = (lt8713sx->fw->size - SZ_64K + sz_12k - 1) / sz_12k;
+		dev_dbg(lt8713sx->dev, "Bank Number Total is %d.\n", lt8713sx->bank_num);
+
+		for (int i = 0; i < lt8713sx->bank_num; i++) {
+			lt8713sx->bank_crc_value[i] =
+				calculate_crc(lt8713sx->fw_buffer + SZ_64K + i * sz_12k,
+					      sz_12k, sz_12k);
+			dev_dbg(lt8713sx->dev, "Bank number:%d; Firmware Data  Crc:0x%02X\n",
+				i, lt8713sx->bank_crc_value[i]);
+		}
+	}
+	return 0;
+}
+
+static void lt8713sx_config_parameters(struct lt8713sx *lt8713sx)
+{
+	regmap_write(lt8713sx->regmap, 0xe0ee, 0x01);
+	regmap_write(lt8713sx->regmap, 0xe05e, 0xc1);
+	regmap_write(lt8713sx->regmap, 0xe058, 0x00);
+	regmap_write(lt8713sx->regmap, 0xe059, 0x50);
+	regmap_write(lt8713sx->regmap, 0xe05a, 0x10);
+	regmap_write(lt8713sx->regmap, 0xe05a, 0x00);
+	regmap_write(lt8713sx->regmap, 0xe058, 0x21);
+}
+
+static void lt8713sx_wren(struct lt8713sx *lt8713sx)
+{
+	regmap_write(lt8713sx->regmap, 0xe103, 0xbf);
+	regmap_write(lt8713sx->regmap, 0xe103, 0xff);
+	regmap_write(lt8713sx->regmap, 0xe05a, 0x04);
+	regmap_write(lt8713sx->regmap, 0xe05a, 0x00);
+}
+
+static void lt8713sx_wrdi(struct lt8713sx *lt8713sx)
+{
+	regmap_write(lt8713sx->regmap, 0xe05a, 0x08);
+	regmap_write(lt8713sx->regmap, 0xe05a, 0x00);
+}
+
+static void lt8713sx_fifo_reset(struct lt8713sx *lt8713sx)
+{
+	regmap_write(lt8713sx->regmap, 0xe103, 0xbf);
+	regmap_write(lt8713sx->regmap, 0xe103, 0xff);
+}
+
+static void lt8713sx_disable_sram_write(struct lt8713sx *lt8713sx)
+{
+	regmap_write(lt8713sx->regmap, 0xe055, 0x00);
+}
+
+static void lt8713sx_sram_to_flash(struct lt8713sx *lt8713sx)
+{
+	regmap_write(lt8713sx->regmap, 0xe05a, 0x30);
+	regmap_write(lt8713sx->regmap, 0xe05a, 0x00);
+}
+
+static void lt8713sx_i2c_to_sram(struct lt8713sx *lt8713sx)
+{
+	regmap_write(lt8713sx->regmap, 0xe055, 0x80);
+	regmap_write(lt8713sx->regmap, 0xe05e, 0xc0);
+	regmap_write(lt8713sx->regmap, 0xe058, 0x21);
+}
+
+static u8 lt8713sx_read_flash_status(struct lt8713sx *lt8713sx)
+{
+	u32 flash_status = 0;
+
+	regmap_write(lt8713sx->regmap,  0xe103, 0x3f);
+	regmap_write(lt8713sx->regmap,  0xe103, 0xff);
+
+	regmap_write(lt8713sx->regmap,  0xe05e, 0x40);
+	regmap_write(lt8713sx->regmap,  0xe056, 0x05); /* opcode=read status register */
+	regmap_write(lt8713sx->regmap,  0xe055, 0x25);
+	regmap_write(lt8713sx->regmap,  0xe055, 0x01);
+	regmap_write(lt8713sx->regmap,  0xe058, 0x21);
+
+	regmap_read(lt8713sx->regmap, 0xe05f, &flash_status);
+	dev_dbg(lt8713sx->dev, "flash_status:%x\n", flash_status);
+
+	return flash_status;
+}
+
+static void lt8713sx_block_erase(struct lt8713sx *lt8713sx)
+{
+	u32 i = 0;
+	u8 flash_status = 0;
+	u8 blocknum = 0x00;
+	u32 flashaddr = 0x00;
+
+	for (blocknum = 0; blocknum < 8; blocknum++) {
+		flashaddr = blocknum * SZ_32K;
+		regmap_write(lt8713sx->regmap,  0xe0ee, 0x01);
+		regmap_write(lt8713sx->regmap,  0xe05a, 0x04);
+		regmap_write(lt8713sx->regmap,  0xe05a, 0x00);
+		regmap_write(lt8713sx->regmap,  0xe05b, flashaddr >> 16);
+		regmap_write(lt8713sx->regmap,  0xe05c, flashaddr >> 8);
+		regmap_write(lt8713sx->regmap,  0xe05d, flashaddr);
+		regmap_write(lt8713sx->regmap,  0xe05a, 0x01);
+		regmap_write(lt8713sx->regmap,  0xe05a, 0x00);
+		msleep(100);
+		i = 0;
+		while (1) {
+			flash_status = lt8713sx_read_flash_status(lt8713sx);
+			if ((flash_status & 0x01) == 0)
+				break;
+
+			if (i > 50)
+				break;
+
+			i++;
+			msleep(50);
+		}
+	}
+	dev_dbg(lt8713sx->dev, "erase flash done.\n");
+}
+
+static void lt8713sx_load_main_fw_to_sram(struct lt8713sx *lt8713sx)
+{
+	regmap_write(lt8713sx->regmap, 0xe0ee, 0x01);
+	regmap_write(lt8713sx->regmap, 0xe068, 0x00);
+	regmap_write(lt8713sx->regmap, 0xe069, 0x00);
+	regmap_write(lt8713sx->regmap, 0xe06a, 0x00);
+	regmap_write(lt8713sx->regmap, 0xe065, 0x00);
+	regmap_write(lt8713sx->regmap, 0xe066, 0xff);
+	regmap_write(lt8713sx->regmap, 0xe067, 0xff);
+	regmap_write(lt8713sx->regmap, 0xe06b, 0x00);
+	regmap_write(lt8713sx->regmap, 0xe06c, 0x00);
+	regmap_write(lt8713sx->regmap, 0xe060, 0x01);
+	msleep(200);
+	regmap_write(lt8713sx->regmap, 0xe060, 0x00);
+}
+
+static void lt8713sx_load_bank_fw_to_sram(struct lt8713sx *lt8713sx, u64 addr)
+{
+	regmap_write(lt8713sx->regmap, 0xe0ee, 0x01);
+	regmap_write(lt8713sx->regmap, 0xe068, ((addr & 0xff0000) >> 16));
+	regmap_write(lt8713sx->regmap, 0xe069, ((addr & 0x00ff00) >> 8));
+	regmap_write(lt8713sx->regmap, 0xe06a, (addr & 0x0000ff));
+	regmap_write(lt8713sx->regmap, 0xe065, 0x00);
+	regmap_write(lt8713sx->regmap, 0xe066, 0x30);
+	regmap_write(lt8713sx->regmap, 0xe067, 0x00);
+	regmap_write(lt8713sx->regmap, 0xe06b, 0x00);
+	regmap_write(lt8713sx->regmap, 0xe06c, 0x00);
+	regmap_write(lt8713sx->regmap, 0xe060, 0x01);
+	msleep(50);
+	regmap_write(lt8713sx->regmap, 0xe060, 0x00);
+}
+
+static int lt8713sx_write_data(struct lt8713sx *lt8713sx, const u8 *data, u64 filesize)
+{
+	int page = 0, num = 0, i = 0, val;
+
+	page = (filesize % LT8713SX_PAGE_SIZE) ?
+			((filesize / LT8713SX_PAGE_SIZE) + 1) : (filesize / LT8713SX_PAGE_SIZE);
+
+	dev_dbg(lt8713sx->dev,
+		"Writing to Sram=%u pages, total size = %llu bytes\n", page, filesize);
+
+	for (num = 0; num < page; num++) {
+		dev_dbg(lt8713sx->dev, "page[%d]\n", num);
+		lt8713sx_i2c_to_sram(lt8713sx);
+
+		for (i = 0; i < LT8713SX_PAGE_SIZE; i++) {
+			if ((num * LT8713SX_PAGE_SIZE + i) < filesize)
+				val = *(data + (num * LT8713SX_PAGE_SIZE + i));
+			else
+				val = 0xff;
+			regmap_write(lt8713sx->regmap, 0xe059, val);
+		}
+
+		lt8713sx_wren(lt8713sx);
+		lt8713sx_sram_to_flash(lt8713sx);
+	}
+
+	lt8713sx_wrdi(lt8713sx);
+	lt8713sx_disable_sram_write(lt8713sx);
+
+	return 0;
+}
+
+static void lt8713sx_main_upgrade_result(struct lt8713sx *lt8713sx)
+{
+	u32 main_crc_result;
+
+	regmap_read(lt8713sx->regmap, 0xe023, &main_crc_result);
+
+	dev_dbg(lt8713sx->dev, "Main CRC HW: 0x%02X\n", main_crc_result);
+	dev_dbg(lt8713sx->dev, "Main CRC FW: 0x%02X\n", lt8713sx->main_crc_value);
+
+	if (main_crc_result == lt8713sx->main_crc_value)
+		dev_dbg(lt8713sx->dev, "Main Firmware Upgrade Success.\n");
+	else
+		dev_err(lt8713sx->dev, "Main Firmware Upgrade Failed.\n");
+}
+
+static void lt8713sx_bank_upgrade_result(struct lt8713sx *lt8713sx, u8 banknum)
+{
+	u32 bank_crc_result;
+
+	regmap_read(lt8713sx->regmap, 0xe023, &bank_crc_result);
+
+	dev_dbg(lt8713sx->dev, "Bank %d CRC Result: 0x%02X\n", banknum, bank_crc_result);
+
+	if (bank_crc_result == lt8713sx->bank_crc_value[banknum])
+		dev_dbg(lt8713sx->dev, "Bank %d Firmware Upgrade Success.\n", banknum);
+	else
+		dev_err(lt8713sx->dev, "Bank %d Firmware Upgrade Failed.\n", banknum);
+}
+
+static void lt8713sx_bank_result_check(struct lt8713sx *lt8713sx)
+{
+	int i;
+	u64 addr = 0x010000;
+
+	for (i = 0; i < lt8713sx->bank_num; i++) {
+		lt8713sx_load_bank_fw_to_sram(lt8713sx, addr);
+		lt8713sx_bank_upgrade_result(lt8713sx, i);
+		addr += 0x3000;
+	}
+}
+
+static int lt8713sx_firmware_upgrade(struct lt8713sx *lt8713sx)
+{
+	int ret;
+
+	lt8713sx_config_parameters(lt8713sx);
+
+	lt8713sx_block_erase(lt8713sx);
+
+	if (lt8713sx->fw->size < SZ_64K) {
+		ret = lt8713sx_write_data(lt8713sx, lt8713sx->fw_buffer, SZ_64K);
+		if (ret < 0) {
+			dev_err(lt8713sx->dev, "Failed to write firmware data: %d\n", ret);
+			return ret;
+		}
+	} else {
+		ret = lt8713sx_write_data(lt8713sx, lt8713sx->fw_buffer, lt8713sx->fw->size);
+		if (ret < 0) {
+			dev_err(lt8713sx->dev, "Failed to write firmware data: %d\n", ret);
+			return ret;
+		}
+	}
+	dev_dbg(lt8713sx->dev, "Write Data done.\n");
+
+	return 0;
+}
+
+static int lt8713sx_firmware_update(struct lt8713sx *lt8713sx)
+{
+	int ret = 0;
+
+	mutex_lock(&lt8713sx->ocm_lock);
+	lt8713sx_i2c_enable(lt8713sx);
+
+	ret = lt8713sx_prepare_firmware_data(lt8713sx);
+	if (ret < 0) {
+		dev_err(lt8713sx->dev, "Failed to prepare firmware data: %d\n", ret);
+		goto error;
+	}
+
+	ret = lt8713sx_firmware_upgrade(lt8713sx);
+	if (ret < 0) {
+		dev_err(lt8713sx->dev, "Upgrade failure.\n");
+		goto error;
+	} else {
+		/* Validate CRC */
+		lt8713sx_load_main_fw_to_sram(lt8713sx);
+		lt8713sx_main_upgrade_result(lt8713sx);
+		lt8713sx_wrdi(lt8713sx);
+		lt8713sx_fifo_reset(lt8713sx);
+		lt8713sx_bank_result_check(lt8713sx);
+		lt8713sx_wrdi(lt8713sx);
+	}
+
+error:
+	lt8713sx_i2c_disable(lt8713sx);
+	if (!ret)
+		lt8713sx_reset(lt8713sx);
+
+	kvfree(lt8713sx->fw_buffer);
+	lt8713sx->fw_buffer = NULL;
+
+	if (lt8713sx->fw) {
+		release_firmware(lt8713sx->fw);
+		lt8713sx->fw = NULL;
+	}
+	mutex_unlock(&lt8713sx->ocm_lock);
+
+	return ret;
+}
+
+static void lt8713sx_reset(struct lt8713sx *lt8713sx)
+{
+	dev_dbg(lt8713sx->dev, "reset bridge.\n");
+	gpiod_set_value_cansleep(lt8713sx->reset_gpio, 1);
+	msleep(20);
+
+	gpiod_set_value_cansleep(lt8713sx->reset_gpio, 0);
+	msleep(20);
+
+	dev_dbg(lt8713sx->dev, "reset done.\n");
+}
+
+static int lt8713sx_regulator_enable(struct lt8713sx *lt8713sx)
+{
+	int ret;
+
+	ret = devm_regulator_get_enable(lt8713sx->dev, "vdd");
+	if (ret < 0)
+		return dev_err_probe(lt8713sx->dev, ret, "failed to enable vdd regulator\n");
+
+	usleep_range(1000, 10000);
+
+	ret = devm_regulator_get_enable(lt8713sx->dev, "vcc");
+	if (ret < 0)
+		return dev_err_probe(lt8713sx->dev, ret, "failed to enable vcc regulator\n");
+	return 0;
+}
+
+static int lt8713sx_bridge_attach(struct drm_bridge *bridge,
+				  struct drm_encoder *encoder,
+				  enum drm_bridge_attach_flags flags)
+{
+	struct lt8713sx *lt8713sx = container_of(bridge, struct lt8713sx, bridge);
+	int i, ret;
+
+	for (i = 0; i < lt8713sx->num_outputs; i++) {
+		if (!lt8713sx->next_bridge[i])
+			continue;
+
+		ret = drm_bridge_attach(encoder,
+					lt8713sx->next_bridge[i],
+					bridge, flags);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int lt8713sx_get_ports(struct lt8713sx *lt8713sx)
+{
+	struct device *dev = lt8713sx->dev;
+	struct device_node *port, *ports, *ep, *remote;
+	int i = 0;
+	u32 reg;
+
+	ports = of_get_child_by_name(dev->of_node, "ports");
+	if (!ports)
+		return -ENODEV;
+
+	for_each_child_of_node(ports, port) {
+		if (of_property_read_u32(port, "reg", &reg))
+			continue;
+
+		if (reg == 0)
+			continue;
+
+		if (i >= ARRAY_SIZE(lt8713sx->next_bridge)) {
+			of_node_put(port);
+			break;
+		}
+
+		ep = of_graph_get_next_endpoint(port, NULL);
+		if (!ep)
+			continue;
+
+		remote = of_graph_get_remote_port_parent(ep);
+		of_node_put(ep);
+
+		if (!remote)
+			continue;
+
+		lt8713sx->next_bridge[i] = of_drm_find_bridge(remote);
+		of_node_put(remote);
+		if (lt8713sx->next_bridge[i])
+			i++;
+	}
+	lt8713sx->num_outputs = i;
+	dev_dbg(dev, "Enabled %d output ports", i);
+
+	of_node_put(ports);
+	return 0;
+};
+
+static int lt8713sx_gpio_init(struct lt8713sx *lt8713sx)
+{
+	struct device *dev = lt8713sx->dev;
+
+	lt8713sx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(lt8713sx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(lt8713sx->reset_gpio),
+				     "failed to acquire reset gpio\n");
+
+	/* power enable gpio */
+	lt8713sx->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
+	if (IS_ERR(lt8713sx->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(lt8713sx->enable_gpio),
+				     "failed to acquire enable gpio\n");
+	return 0;
+}
+
+static ssize_t lt8713sx_firmware_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t len)
+{
+	struct lt8713sx *lt8713sx = dev_get_drvdata(dev);
+	int ret;
+
+	ret = lt8713sx_firmware_update(lt8713sx);
+	if (ret < 0)
+		return ret;
+	return len;
+}
+
+static DEVICE_ATTR_WO(lt8713sx_firmware);
+
+static struct attribute *lt8713sx_attrs[] = {
+	&dev_attr_lt8713sx_firmware.attr,
+	NULL,
+};
+
+static const struct attribute_group lt8713sx_attr_group = {
+	.attrs = lt8713sx_attrs,
+};
+
+static const struct attribute_group *lt8713sx_attr_groups[] = {
+	&lt8713sx_attr_group,
+	NULL,
+};
+
+static const struct drm_bridge_funcs lt8713sx_bridge_funcs = {
+	.attach = lt8713sx_bridge_attach,
+};
+
+static int lt8713sx_probe(struct i2c_client *client)
+{
+	struct lt8713sx *lt8713sx;
+	struct device *dev = &client->dev;
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+		return dev_err_probe(dev, -ENODEV, "device doesn't support I2C\n");
+
+	lt8713sx = devm_drm_bridge_alloc(dev, struct lt8713sx, bridge, &lt8713sx_bridge_funcs);
+	if (IS_ERR(lt8713sx))
+		return PTR_ERR(lt8713sx);
+
+	lt8713sx->dev = dev;
+	lt8713sx->client = client;
+	i2c_set_clientdata(client, lt8713sx);
+
+	ret = devm_mutex_init(lt8713sx->dev, &lt8713sx->ocm_lock);
+	if (ret)
+		return ret;
+
+	lt8713sx->regmap = devm_regmap_init_i2c(client, &lt8713sx_regmap_config);
+	if (IS_ERR(lt8713sx->regmap))
+		return dev_err_probe(dev, PTR_ERR(lt8713sx->regmap), "regmap i2c init failed\n");
+
+	ret = lt8713sx_get_ports(lt8713sx);
+	if (ret < 0)
+		return ret;
+
+	ret = lt8713sx_gpio_init(lt8713sx);
+	if (ret < 0)
+		return ret;
+
+	ret = lt8713sx_regulator_enable(lt8713sx);
+	if (ret)
+		return ret;
+
+	lt8713sx_reset(lt8713sx);
+
+	lt8713sx->bridge.funcs = &lt8713sx_bridge_funcs;
+	lt8713sx->bridge.of_node = dev->of_node;
+	lt8713sx->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
+	drm_bridge_add(&lt8713sx->bridge);
+
+	crc8_populate_msb(lt8713sx_crc_table, 0x31);
+
+	return 0;
+}
+
+static void lt8713sx_remove(struct i2c_client *client)
+{
+	struct lt8713sx *lt8713sx = i2c_get_clientdata(client);
+
+	drm_bridge_remove(&lt8713sx->bridge);
+}
+
+static struct i2c_device_id lt8713sx_id[] = {
+	{ "lontium,lt8713sx", 0 },
+	{ /* sentinel */ }
+};
+
+static const struct of_device_id lt8713sx_match_table[] = {
+	{ .compatible = "lontium,lt8713sx" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, lt8713sx_match_table);
+
+static struct i2c_driver lt8713sx_driver = {
+	.driver = {
+		.name = "lt8713sx",
+		.of_match_table = lt8713sx_match_table,
+		.dev_groups = lt8713sx_attr_groups,
+	},
+	.probe = lt8713sx_probe,
+	.remove = lt8713sx_remove,
+	.id_table = lt8713sx_id,
+};
+
+module_i2c_driver(lt8713sx_driver);
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("lt8713sx drm bridge driver");
+MODULE_AUTHOR("Tony <syyang@lontium.com>");
+MODULE_FIRMWARE(FW_FILE);

-- 
2.34.1

