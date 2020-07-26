Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DA622DFF1
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 17:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58C389DD2;
	Sun, 26 Jul 2020 15:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8F589E9B;
 Sun, 26 Jul 2020 11:14:59 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id n2so10080505edr.5;
 Sun, 26 Jul 2020 04:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0/blpyNSuv07lZmgs8/Iyt5+VEFCbEO78JNyFfBlW8w=;
 b=Mnmuxu2Iiwb5FsJ7J9OmvZN9N6DAz99zdTu6xthxCmICS6+Ir87pMvhgwaYTaLG4cc
 7/k7Ie3b2KImW8JCzLL3uSkqJjAUysDrjB2uGQkqzMgiolXQq+DyVGMsePpHJSydeGT8
 7E6pXXoXWCPOX3U2gYH5eQwH+6zG8ZtlzDO5aKSp1DGUTw28PCN7G6DshD5Ce/STiE2C
 tRYLx1amqITcM3WWv/6ptGgjwx1gJ3PW/bEaaqF46ENcu1m0DAncpkbdxejF2l5VU6bW
 sPBet1UQixppTid22F3SK/i4H8908t3hQQbONYaEFixmgv5bqf88Jls6tdS968WDq5op
 DEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0/blpyNSuv07lZmgs8/Iyt5+VEFCbEO78JNyFfBlW8w=;
 b=BCPWlGnzc291fhUJs5marvM+Zz2zWdNv2v9jVcVTMCvggO8oP9W1lU/vv/1O/Op2sm
 6m1tb1lR3bsZnE3dsYNWS0AQndywvyG9mbNdLobYM33AY3+7qQlt/qDKeAAb8wPmGuv/
 0+y4po2wZol/nvnL9i/0wfWBDv73eqnomRfcsoyJHBSGTTHkAAGmMAoNt6syIzBWEPny
 i7VETgeDhjDZz0XKQwhaSw9c43TWEh9rUMkfq7kl0JwRkq+3NImXdYHWBpxHQ98yS3Uj
 OXIKmoaBvtJA1XVBdaDpg9VsfnmDcNzbZRrurUY64Me4mGrfqY7xbgyPHdruQ+VQJ3Xp
 RjnQ==
X-Gm-Message-State: AOAM531ejy/KhVNVDUR7Wa+rT/T5cwN+adZ4miXvII0i8KeI7OyPyssQ
 TwI1+Nst74R+SWmnhcWCq5E=
X-Google-Smtp-Source: ABdhPJzvxf1SAxcJs+bD1sPN31ueYCV8C3RTZW3eRlPBYkXBoOFcsJ4kEs+wfr4V5cWQvCUWcJfQVw==
X-Received: by 2002:aa7:c90a:: with SMTP id b10mr17065815edt.71.1595762097876; 
 Sun, 26 Jul 2020 04:14:57 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl.
 [83.6.167.207])
 by smtp.googlemail.com with ESMTPSA id d23sm4696253ejj.74.2020.07.26.04.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 04:14:57 -0700 (PDT)
From: Konrad Dybcio <konradybcio@gmail.com>
To: konradybcio@gmail.com
Subject: [PATCH 9/9] soc/qcom: Add REVID driver
Date: Sun, 26 Jul 2020 13:12:06 +0200
Message-Id: <20200726111215.22361-10-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200726111215.22361-1-konradybcio@gmail.com>
References: <20200726111215.22361-1-konradybcio@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 26 Jul 2020 15:02:45 +0000
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
Cc: Krzysztof Wilczynski <kw@linux.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-clk@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, martin.botka1@gmail.com,
 Andy Gross <agross@kernel.org>, Brian Masney <masneyb@onstation.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Xiaozhe Shi <xiaozhes@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Felipe Balbi <balbi@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Harigovindan P <harigovi@codeaurora.org>, linux-kernel@vger.kernel.org,
 zhengbin <zhengbin13@huawei.com>, Manu Gautam <mgautam@codeaurora.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xiaozhe Shi <xiaozhes@codeaurora.org>

Add the REVID device driver. The REVID driver will print out the PMIC
revision at probe time.

Signed-off-by: Xiaozhe Shi <xiaozhes@codeaurora.org>
[konradybcio@gmail.com: Fast-forward the driver from kernel 4.14 to 5.8,
convert binding to yaml]
Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 .../bindings/soc/qcom/qcom,qpnp-revid.yaml    |  38 ++
 drivers/soc/qcom/Kconfig                      |   9 +
 drivers/soc/qcom/Makefile                     |   1 +
 drivers/soc/qcom/qpnp-revid.c                 | 288 ++++++++++++++
 include/linux/qpnp/qpnp-revid.h               | 369 ++++++++++++++++++
 5 files changed, 705 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,qpnp-revid.yaml
 create mode 100644 drivers/soc/qcom/qpnp-revid.c
 create mode 100644 include/linux/qpnp/qpnp-revid.h

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,qpnp-revid.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,qpnp-revid.yaml
new file mode 100644
index 000000000000..fa4a15d7cc15
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,qpnp-revid.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/qcom/qcom,qpnp-revid.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: QPNP-REVID
+
+description: |
+ QPNP-REVID provides a way to read the PMIC part number and revision.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qpnp-revid
+
+  reg:
+    description: Offset and length of the PMIC peripheral register map.
+    maxItems: 1
+
+  qcom,fab-id-valid:
+    description: |
+     Use this property when support to read Fab
+	   identification from REV ID peripheral is available.
+
+  qcom,tp-rev-valid:
+    description: |
+     Use this property when support to read TP
+	   revision identification from REV ID peripheral.
+
+examples:
+  - |
+    qcom,revid@100 {
+        compatible = "qcom,qpnp-revid";
+        reg = <0x100 0x100>;
+    };
+
+...
diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 07bb261a63d2..03a024acdb37 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -75,6 +75,15 @@ config QCOM_QMI_HELPERS
 	tristate
 	depends on NET
 
+config QCOM_QPNP_REVID
+	tristate "QPNP Revision ID Peripheral"
+	depends on SPMI
+	help
+	  Say 'y' here to include support for the Qualcomm Technologies, Inc.
+	  QPNP REVID peripheral. REVID prints out the PMIC type and revision
+	  numbers in the kernel log along with the PMIC option status. The PMIC
+	  type is mapped to a QTI chip part number and logged as well.
+
 config QCOM_RMTFS_MEM
 	tristate "Qualcomm Remote Filesystem memory driver"
 	depends on ARCH_QCOM
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 7d7e2ecbdce6..d7a4c6b85ede 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_QCOM_OCMEM)	+= ocmem.o
 obj-$(CONFIG_QCOM_PDR_HELPERS)	+= pdr_interface.o
 obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
 qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
+obj-$(CONFIG_QCOM_QPNP_REVID)	+= qpnp-revid.o
 obj-$(CONFIG_QCOM_RMTFS_MEM)	+= rmtfs_mem.o
 obj-$(CONFIG_QCOM_RPMH)		+= qcom_rpmh.o
 qcom_rpmh-y			+= rpmh-rsc.o
diff --git a/drivers/soc/qcom/qpnp-revid.c b/drivers/soc/qcom/qpnp-revid.c
new file mode 100644
index 000000000000..edae0b299847
--- /dev/null
+++ b/drivers/soc/qcom/qpnp-revid.c
@@ -0,0 +1,288 @@
+/* Copyright (c) 2013-2019, The Linux Foundation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/spmi.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/err.h>
+#include <linux/qpnp/qpnp-revid.h>
+#include <linux/of.h>
+
+#define REVID_REVISION1	0x0
+#define REVID_REVISION2	0x1
+#define REVID_REVISION3	0x2
+#define REVID_REVISION4	0x3
+#define REVID_TYPE	0x4
+#define REVID_SUBTYPE	0x5
+#define REVID_STATUS1	0x8
+#define REVID_SPARE_0	0x60
+#define REVID_TP_REV	0xf1
+#define REVID_FAB_ID	0xf2
+
+#define QPNP_REVID_DEV_NAME "qcom,qpnp-revid"
+
+static const char *const pmic_names[] = {
+	[0] =	"Unknown PMIC",
+	[PM8941_SUBTYPE] = "PM8941",
+	[PM8841_SUBTYPE] = "PM8841",
+	[PM8019_SUBTYPE] = "PM8019",
+	[PM8226_SUBTYPE] = "PM8226",
+	[PM8110_SUBTYPE] = "PM8110",
+	[PMA8084_SUBTYPE] = "PMA8084",
+	[PMI8962_SUBTYPE] = "PMI8962",
+	[PMD9635_SUBTYPE] = "PMD9635",
+	[PM8994_SUBTYPE] = "PM8994",
+	[PMI8994_SUBTYPE] = "PMI8994",
+	[PM8916_SUBTYPE] = "PM8916",
+	[PM8004_SUBTYPE] = "PM8004",
+	[PM8909_SUBTYPE] = "PM8909",
+	[PM2433_SUBTYPE] = "PM2433",
+	[PMD9655_SUBTYPE] = "PMD9655",
+	[PM8950_SUBTYPE] = "PM8950",
+	[PMI8950_SUBTYPE] = "PMI8950",
+	[PMK8001_SUBTYPE] = "PMK8001",
+	[PMI8996_SUBTYPE] = "PMI8996",
+	[PM8998_SUBTYPE] = "PM8998",
+	[PMI8998_SUBTYPE] = "PMI8998",
+	[PM8005_SUBTYPE] = "PM8005",
+	[PM8937_SUBTYPE] = "PM8937",
+	[PM660L_SUBTYPE] = "PM660L",
+	[PM660_SUBTYPE] = "PM660",
+	[PMI632_SUBTYPE] = "PMI632",
+	[PMI8937_SUBTYPE] = "PMI8937",
+	[PM8150_SUBTYPE] = "PM8150",
+	[PM8150B_SUBTYPE] = "PM8150B",
+	[PM8150L_SUBTYPE] = "PM8150L",
+	[PM6150_SUBTYPE] = "PM6150",
+	[PM8150A_SUBTYPE] = "PM8150A",
+	[PME9205_SUBTYPE] = "PME9205",
+	[PM6125_SUBTYPE] = "PM6125",
+	[PM8008_SUBTYPE] = "PM8008",
+	[SMB1355_SUBTYPE] = "SMB1355",
+	[SMB1390_SUBTYPE] = "SMB1390",
+};
+
+struct revid_chip {
+	struct list_head	link;
+	struct device_node	*dev_node;
+	struct pmic_revid_data	data;
+};
+
+static LIST_HEAD(revid_chips);
+static DEFINE_MUTEX(revid_chips_lock);
+
+static const struct of_device_id qpnp_revid_match_table[] = {
+	{ .compatible = QPNP_REVID_DEV_NAME },
+	{}
+};
+
+static u8 qpnp_read_byte(struct regmap *regmap, u16 addr)
+{
+	int rc;
+	int val;
+
+	rc = regmap_read(regmap, addr, &val);
+	if (rc) {
+		pr_err("read failed rc=%d\n", rc);
+		return 0;
+	}
+	return (u8)val;
+}
+
+/**
+ * get_revid_data - Return the revision information of PMIC
+ * @dev_node: Pointer to the revid peripheral of the PMIC for which
+ *		revision information is seeked
+ *
+ * CONTEXT: Should be called in non atomic context
+ *
+ * RETURNS: pointer to struct pmic_revid_data filled with the information
+ *		about the PMIC revision
+ */
+struct pmic_revid_data *get_revid_data(struct device_node *dev_node)
+{
+	struct revid_chip *revid_chip;
+
+	if (!dev_node)
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&revid_chips_lock);
+	list_for_each_entry(revid_chip, &revid_chips, link) {
+		if (dev_node == revid_chip->dev_node) {
+			mutex_unlock(&revid_chips_lock);
+			return &revid_chip->data;
+		}
+	}
+	mutex_unlock(&revid_chips_lock);
+	return ERR_PTR(-EINVAL);
+}
+EXPORT_SYMBOL(get_revid_data);
+
+#define PM8941_PERIPHERAL_SUBTYPE	0x01
+#define PM8226_PERIPHERAL_SUBTYPE	0x04
+#define PMD9655_PERIPHERAL_SUBTYPE	0x0F
+#define PMI8950_PERIPHERAL_SUBTYPE	0x11
+#define PMI8937_PERIPHERAL_SUBTYPE	0x37
+static size_t build_pmic_string(char *buf, size_t n, int sid,
+		u8 subtype, u8 rev1, u8 rev2, u8 rev3, u8 rev4)
+{
+	size_t pos = 0;
+	/*
+	 * In early versions of PM8941 and PM8226, the major revision number
+	 * started incrementing from 0 (eg 0 = v1.0, 1 = v2.0).
+	 * Increment the major revision number here if the chip is an early
+	 * version of PM8941 or PM8226.
+	 */
+	if (((int)subtype == PM8941_PERIPHERAL_SUBTYPE
+			|| (int)subtype == PM8226_PERIPHERAL_SUBTYPE)
+			&& rev4 < 0x02)
+		rev4++;
+
+	pos += snprintf(buf + pos, n - pos, "PMIC@SID%d", sid);
+	if (subtype >= ARRAY_SIZE(pmic_names) || subtype == 0)
+		pos += snprintf(buf + pos, n - pos, ": %s (subtype: 0x%02X)",
+				pmic_names[0], subtype);
+	else
+		pos += snprintf(buf + pos, n - pos, ": %s",
+				pmic_names[subtype]);
+	pos += snprintf(buf + pos, n - pos, " v%d.%d", rev4, rev3);
+	if (rev2 || rev1)
+		pos += snprintf(buf + pos, n - pos, ".%d", rev2);
+	if (rev1)
+		pos += snprintf(buf + pos, n - pos, ".%d", rev1);
+	return pos;
+}
+
+#define PMIC_PERIPHERAL_TYPE		0x51
+#define PMIC_STRING_MAXLENGTH		80
+static int qpnp_revid_probe(struct platform_device *pdev)
+{
+	u8 rev1, rev2, rev3, rev4, pmic_type, pmic_subtype, pmic_status;
+	u8 option1, option2, option3, option4, spare0;
+	unsigned int base;
+	int rc, fab_id, tp_rev;
+	char pmic_string[PMIC_STRING_MAXLENGTH] = {'\0'};
+	struct revid_chip *revid_chip;
+	struct regmap *regmap;
+
+	regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!regmap) {
+		dev_err(&pdev->dev, "Couldn't get parent's regmap\n");
+		return -EINVAL;
+	}
+
+	rc = of_property_read_u32(pdev->dev.of_node, "reg", &base);
+	if (rc < 0) {
+		dev_err(&pdev->dev,
+			"Couldn't find reg in node = %s rc = %d\n",
+			pdev->dev.of_node->full_name, rc);
+		return rc;
+	}
+	pmic_type = qpnp_read_byte(regmap, base + REVID_TYPE);
+	if (pmic_type != PMIC_PERIPHERAL_TYPE) {
+		pr_err("Invalid REVID peripheral type: %02X\n", pmic_type);
+		return -EINVAL;
+	}
+
+	rev1 = qpnp_read_byte(regmap, base + REVID_REVISION1);
+	rev2 = qpnp_read_byte(regmap, base + REVID_REVISION2);
+	rev3 = qpnp_read_byte(regmap, base + REVID_REVISION3);
+	rev4 = qpnp_read_byte(regmap, base + REVID_REVISION4);
+
+	pmic_subtype = qpnp_read_byte(regmap, base + REVID_SUBTYPE);
+	if (pmic_subtype != PMD9655_PERIPHERAL_SUBTYPE)
+		pmic_status = qpnp_read_byte(regmap, base + REVID_STATUS1);
+	else
+		pmic_status = 0;
+
+	/* special case for PMI8937 */
+	if (pmic_subtype == PMI8950_PERIPHERAL_SUBTYPE) {
+		/* read spare register */
+		spare0 = qpnp_read_byte(regmap, base + REVID_SPARE_0);
+		if (spare0)
+			pmic_subtype = PMI8937_PERIPHERAL_SUBTYPE;
+	}
+
+	if (of_property_read_bool(pdev->dev.of_node, "qcom,fab-id-valid"))
+		fab_id = qpnp_read_byte(regmap, base + REVID_FAB_ID);
+	else
+		fab_id = -EINVAL;
+
+	if (of_property_read_bool(pdev->dev.of_node, "qcom,tp-rev-valid"))
+		tp_rev = qpnp_read_byte(regmap, base + REVID_TP_REV);
+	else
+		tp_rev = -EINVAL;
+
+	revid_chip = devm_kzalloc(&pdev->dev, sizeof(struct revid_chip),
+						GFP_KERNEL);
+	if (!revid_chip)
+		return -ENOMEM;
+
+	revid_chip->dev_node = pdev->dev.of_node;
+	revid_chip->data.rev1 = rev1;
+	revid_chip->data.rev2 = rev2;
+	revid_chip->data.rev3 = rev3;
+	revid_chip->data.rev4 = rev4;
+	revid_chip->data.pmic_subtype = pmic_subtype;
+	revid_chip->data.pmic_type = pmic_type;
+	revid_chip->data.fab_id = fab_id;
+	revid_chip->data.tp_rev = tp_rev;
+
+	if (pmic_subtype < ARRAY_SIZE(pmic_names))
+		revid_chip->data.pmic_name = pmic_names[pmic_subtype];
+	else
+		revid_chip->data.pmic_name = pmic_names[0];
+
+	mutex_lock(&revid_chips_lock);
+	list_add(&revid_chip->link, &revid_chips);
+	mutex_unlock(&revid_chips_lock);
+
+	option1 = pmic_status & 0x3;
+	option2 = (pmic_status >> 2) & 0x3;
+	option3 = (pmic_status >> 4) & 0x3;
+	option4 = (pmic_status >> 6) & 0x3;
+
+	build_pmic_string(pmic_string, PMIC_STRING_MAXLENGTH,
+			  to_spmi_device(pdev->dev.parent)->usid,
+			pmic_subtype, rev1, rev2, rev3, rev4);
+	pr_info("%s options: %d, %d, %d, %d\n",
+			pmic_string, option1, option2, option3, option4);
+	return 0;
+}
+
+static struct platform_driver qpnp_revid_driver = {
+	.probe	= qpnp_revid_probe,
+	.driver	= {
+		.name		= QPNP_REVID_DEV_NAME,
+		.owner		= THIS_MODULE,
+		.of_match_table	= qpnp_revid_match_table,
+	},
+};
+
+static int __init qpnp_revid_init(void)
+{
+	return platform_driver_register(&qpnp_revid_driver);
+}
+
+static void __exit qpnp_revid_exit(void)
+{
+	return platform_driver_unregister(&qpnp_revid_driver);
+}
+
+subsys_initcall(qpnp_revid_init);
+module_exit(qpnp_revid_exit);
+
+MODULE_DESCRIPTION("QPNP REVID DRIVER");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" QPNP_REVID_DEV_NAME);
diff --git a/include/linux/qpnp/qpnp-revid.h b/include/linux/qpnp/qpnp-revid.h
new file mode 100644
index 000000000000..0fbdd528d204
--- /dev/null
+++ b/include/linux/qpnp/qpnp-revid.h
@@ -0,0 +1,369 @@
+/* Copyright (c) 2013-2019, The Linux Foundation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef __QPNP_REVID
+#define __QPNP_REVID
+
+/* Common TYPE for all PMICs */
+#define PMIC_TYPE		0x51
+
+/* PM8994 */
+#define PM8941_SUBTYPE		0x01
+
+#define PM8941_V1P0_REV1	0x00
+#define PM8941_V1P0_REV2	0x00
+#define PM8941_V1P0_REV3	0x00
+#define PM8941_V1P0_REV4	0x01
+
+#define PM8941_V2P0_REV1	0x00
+#define PM8941_V2P0_REV2	0x00
+#define PM8941_V2P0_REV3	0x00
+#define PM8941_V2P0_REV4	0x01
+
+#define PM8941_V3P0_REV1	0x00
+#define PM8941_V3P0_REV2	0x00
+#define PM8941_V3P0_REV3	0x00
+#define PM8941_V3P0_REV4	0x03
+
+#define PM8941_V3P1_REV1	0x00
+#define PM8941_V3P1_REV2	0x00
+#define PM8941_V3P1_REV3	0x01
+#define PM8941_V3P1_REV4	0x03
+
+/* PM8841 */
+#define PM8841_SUBTYPE		0x02
+
+/* PM8019 */
+#define PM8019_SUBTYPE		0x03
+
+/* PM8226 */
+#define PM8226_SUBTYPE		0x04
+
+#define PM8226_V2P2_REV1	0x00
+#define PM8226_V2P2_REV2	0x00
+#define PM8226_V2P2_REV3	0x02
+#define PM8226_V2P2_REV4	0x02
+
+#define PM8226_V2P1_REV1	0x00
+#define PM8226_V2P1_REV2	0x00
+#define PM8226_V2P1_REV3	0x01
+#define PM8226_V2P1_REV4	0x02
+
+#define PM8226_V2P0_REV1	0x00
+#define PM8226_V2P0_REV2	0x00
+#define PM8226_V2P0_REV3	0x00
+#define PM8226_V2P0_REV4	0x02
+
+#define PM8226_V1P0_REV1	0x00
+#define PM8226_V1P0_REV2	0x00
+#define PM8226_V1P0_REV3	0x00
+#define PM8226_V1P0_REV4	0x00
+
+/* PM8110 */
+#define PM8110_SUBTYPE		0x05
+
+#define PM8110_V1P0_REV1	0x00
+#define PM8110_V1P0_REV2	0x00
+#define PM8110_V1P0_REV3	0x00
+#define PM8110_V1P0_REV4	0x01
+
+#define PM8110_V1P1_REV1	0x00
+#define PM8110_V1P1_REV2	0x01
+#define PM8110_V1P1_REV3	0x00
+#define PM8110_V1P1_REV4	0x01
+
+#define PM8110_V1P3_REV1	0x00
+#define PM8110_V1P3_REV2	0x03
+#define PM8110_V1P3_REV3	0x00
+#define PM8110_V1P3_REV4	0x01
+
+#define PM8110_V2P0_REV1	0x00
+#define PM8110_V2P0_REV2	0x00
+#define PM8110_V2P0_REV3	0x00
+#define PM8110_V2P0_REV4	0x02
+
+/* PMA8084 */
+#define PMA8084_SUBTYPE		0x06
+
+/* PMI8962 */
+#define PMI8962_SUBTYPE		0x07
+
+/* PMD9635 */
+#define PMD9635_SUBTYPE		0x08
+/* PM8994 */
+#define PM8994_SUBTYPE		0x09
+
+/* PMI8994 */
+#define PMI8994_TYPE		0x51
+#define PMI8994_SUBTYPE		0x0A
+
+#define PMI8994_V1P0_REV1	0x00
+#define PMI8994_V1P0_REV2	0x00
+#define PMI8994_V1P0_REV3	0x00
+#define PMI8994_V1P0_REV4	0x01
+
+#define PMI8994_V2P0_REV1	0x00
+#define PMI8994_V2P0_REV2	0x00
+#define PMI8994_V2P0_REV3	0x00
+#define PMI8994_V2P0_REV4	0x02
+
+/* PM8916 */
+#define PM8916_SUBTYPE		0x0B
+
+#define PM8916_V1P0_REV1	0x00
+#define PM8916_V1P0_REV2	0x00
+#define PM8916_V1P0_REV3	0x00
+#define PM8916_V1P0_REV4	0x01
+
+#define PM8916_V1P1_REV1	0x00
+#define PM8916_V1P1_REV2	0x00
+#define PM8916_V1P1_REV3	0x01
+#define PM8916_V1P1_REV4	0x01
+
+#define PM8916_V2P0_REV1	0x00
+#define PM8916_V2P0_REV2	0x00
+#define PM8916_V2P0_REV3	0x00
+#define PM8916_V2P0_REV4	0x02
+
+/* PM8004 */
+#define PM8004_SUBTYPE		0x0C
+
+/* PM8909 */
+#define PM8909_SUBTYPE		0x0D
+
+#define PM8909_V1P0_REV1	0x00
+#define PM8909_V1P0_REV2	0x00
+#define PM8909_V1P0_REV3	0x00
+#define PM8909_V1P0_REV4	0x01
+
+#define PM8909_V1P1_REV1	0x00
+#define PM8909_V1P1_REV2	0x00
+#define PM8909_V1P1_REV3	0x01
+#define PM8909_V1P1_REV4	0x01
+
+/* PM2433 */
+#define PM2433_SUBTYPE		0x0E
+
+/* PMD9655 */
+#define PMD9655_SUBTYPE		0x0F
+
+/* PM8950 */
+#define PM8950_SUBTYPE		0x10
+#define PM8950_V1P0_REV4	0x01
+
+#define PM8950_V2P0_REV4	0x02
+
+/* PMI8950 */
+#define PMI8950_SUBTYPE		0x11
+
+/* PMK8001 */
+#define PMK8001_SUBTYPE		0x12
+
+/* PMI8996 */
+#define PMI8996_SUBTYPE		0x13
+
+/* PM8998 */
+#define PM8998_SUBTYPE	0x14
+
+/* PMI8998 */
+#define PMI8998_SUBTYPE	0x15
+
+/* PM660 */
+#define PM660L_SUBTYPE	0x1A
+#define PM660_SUBTYPE	0x1B
+
+/* PM8150 */
+#define PM8150_SUBTYPE		0x1E
+#define PM8150L_SUBTYPE		0x1F
+#define PM8150B_SUBTYPE		0x20
+#define PM8150A_SUBTYPE		0x27
+
+/* PM6150 SUBTYPE */
+#define PM6150_SUBTYPE		0x28
+#define PM6150L_SUBTYPE		0x1F
+
+/* PME9205 SUBTYPE */
+#define PME9205_SUBTYPE		0x24
+
+/* PM6125 SUBTYPE */
+#define PM6125_SUBTYPE		0x2D
+
+/* PMI632 */
+#define PMI632_SUBTYPE	0x25
+
+/* PM8008 SUBTYPE */
+#define PM8008_SUBTYPE	0x2C
+
+/* PMI8998 REV_ID */
+#define PMI8998_V1P0_REV1	0x00
+#define PMI8998_V1P0_REV2	0x00
+#define PMI8998_V1P0_REV3	0x00
+#define PMI8998_V1P0_REV4	0x01
+
+#define PMI8998_V1P1_REV1	0x00
+#define PMI8998_V1P1_REV2	0x00
+#define PMI8998_V1P1_REV3	0x01
+#define PMI8998_V1P1_REV4	0x01
+
+#define PMI8998_V2P0_REV1	0x00
+#define PMI8998_V2P0_REV2	0x00
+#define PMI8998_V2P0_REV3	0x00
+#define PMI8998_V2P0_REV4	0x02
+
+/* PM660 REV_ID */
+#define PM660_V1P0_REV1		0x00
+#define PM660_V1P0_REV2		0x00
+#define PM660_V1P0_REV3		0x00
+#define PM660_V1P0_REV4		0x01
+
+#define PM660_V1P1_REV1		0x00
+#define PM660_V1P1_REV2		0x00
+#define PM660_V1P1_REV3		0x01
+#define PM660_V1P1_REV4		0x01
+
+/* PM660L REV_ID */
+#define PM660L_V1P1_REV1	0x00
+#define PM660L_V1P1_REV2	0x00
+#define PM660L_V1P1_REV3	0x01
+#define PM660L_V1P1_REV4	0x01
+
+#define PM660L_V2P0_REV1	0x00
+#define PM660L_V2P0_REV2	0x00
+#define PM660L_V2P0_REV3	0x00
+#define PM660L_V2P0_REV4	0x02
+
+/* PMI632 REV_ID */
+#define PMI632_V1P0_REV1	0x00
+#define PMI632_V1P0_REV2	0x00
+#define PMI632_V1P0_REV3	0x00
+#define PMI632_V1P0_REV4	0x01
+
+/* PM8150B_REV_ID */
+#define PM8150B_V1P0_REV1	0x00
+#define PM8150B_V1P0_REV2	0x00
+#define PM8150B_V1P0_REV3	0x00
+#define PM8150B_V1P0_REV4	0x01
+
+#define PM8150B_V2P0_REV1	0x00
+#define PM8150B_V2P0_REV2	0x00
+#define PM8150B_V2P0_REV3	0x00
+#define PM8150B_V2P0_REV4	0x02
+
+/* PM8150L_REV_ID */
+#define PM8150L_V1P0_REV1	0x00
+#define PM8150L_V1P0_REV2	0x00
+#define PM8150L_V1P0_REV3	0x00
+#define PM8150L_V1P0_REV4	0x01
+
+#define PM8150L_V2P0_REV1	0x00
+#define PM8150L_V2P0_REV2	0x00
+#define PM8150L_V2P0_REV3	0x00
+#define PM8150L_V2P0_REV4	0x02
+
+#define PM8150L_V3P0_REV1	0x00
+#define PM8150L_V3P0_REV2	0x00
+#define PM8150L_V3P0_REV3	0x00
+#define PM8150L_V3P0_REV4	0x03
+
+/* PM8150A_REV_ID */
+#define PM8150A_V1P0_REV1	0x00
+#define PM8150A_V1P0_REV2	0x00
+#define PM8150A_V1P0_REV3	0x00
+#define PM8150A_V1P0_REV4	0x01
+
+#define PM8150A_V2P0_REV1	0x00
+#define PM8150A_V2P0_REV2	0x00
+#define PM8150A_V2P0_REV3	0x00
+#define PM8150A_V2P0_REV4	0x02
+
+/* PME9205_REV_ID */
+#define PME9205_V1P0_REV1	0x00
+#define PME9205_V1P0_REV2	0x00
+#define PME9205_V1P0_REV3	0x00
+#define PME9205_V1P0_REV4	0x01
+
+#define PME9205_V2P0_REV1	0x00
+#define PME9205_V2P0_REV2	0x00
+#define PME9205_V2P0_REV3	0x00
+#define PME9205_V2P0_REV4	0x02
+
+/* PM6150_REV_ID */
+#define PM6150_V1P0_REV1	0x00
+#define PM6150_V1P0_REV2	0x00
+#define PM6150_V1P0_REV3	0x00
+#define PM6150_V1P0_REV4	0x01
+
+#define PM6150_V1P1_REV1	0x00
+#define PM6150_V1P1_REV2	0x00
+#define PM6150_V1P1_REV3	0x01
+#define PM6150_V1P1_REV4	0x01
+
+#define PM6150_V2P0_REV1	0x00
+#define PM6150_V2P0_REV2	0x00
+#define PM6150_V2P0_REV3	0x00
+#define PM6150_V2P0_REV4	0x02
+
+/* PM6125_REV_ID */
+#define PM6125_V1P0_REV1	0x00
+#define PM6125_V1P0_REV2	0x00
+#define PM6125_V1P0_REV3	0x00
+#define PM6125_V1P0_REV4	0x01
+
+/* PMI8998 FAB_ID */
+#define PMI8998_FAB_ID_SMIC	0x11
+#define PMI8998_FAB_ID_GF	0x30
+
+/* PM660 FAB_ID */
+#define PM660_FAB_ID_GF		0x0
+#define PM660_FAB_ID_TSMC	0x2
+#define PM660_FAB_ID_MX		0x3
+
+/* PM8005 */
+#define PM8005_SUBTYPE		0x18
+
+/* PM8937 */
+#define PM8937_SUBTYPE		0x19
+
+/* PMI8937 */
+#define PMI8937_SUBTYPE		0x37
+
+/* SMB1390 */
+#define SMB1390_SUBTYPE		0x23
+
+/* SMB1381 */
+#define SMB1381_SUBTYPE		0x17
+
+/* SMB1355 */
+#define SMB1355_SUBTYPE		0x1C
+
+struct pmic_revid_data {
+	u8		rev1;
+	u8		rev2;
+	u8		rev3;
+	u8		rev4;
+	u8		pmic_type;
+	u8		pmic_subtype;
+	const char	*pmic_name;
+	int		fab_id;
+	int		tp_rev;
+};
+
+#ifdef CONFIG_QCOM_QPNP_REVID
+struct pmic_revid_data *get_revid_data(struct device_node *dev_node);
+#else
+static inline
+struct pmic_revid_data *get_revid_data(struct device_node *dev_node)
+{
+	return NULL;
+}
+#endif
+#endif
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
