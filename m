Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C498B486089
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 07:19:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236FF11251C;
	Thu,  6 Jan 2022 06:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2120.outbound.protection.outlook.com [40.107.237.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC06A11251C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 06:19:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DtjrJBjs30Wa9g7rOWpr9dDP4GooO/QV0dGDci16bF4Pr9/Hbsqko6RKfsQoqFwTfnKQPAm5XJgmYACJ/IZMhBwSWeFZ50RNTgIei6EgPTva23Ina0qXFrBuuwvSfic6H/QUxxGSX0Xe+10XIdW3nmIxnddrYict5QxyQEeUjuR8aV5HMgKU7D5mrGt0043Kc4MIw5qJht8RgCFqN8XbuKhOirwhDUrIhDAeah3cEz8D6+sqJeNivxdYej48SFj8vj2McNbWgJW/u7IOjeMmq1HwjJULnL4J3+qPkNLeiAhkFLwujj3VfE9ydLC8aSavThh3mzuOEW72GJKCFmReIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5fWg/4sGMRgnXRGe85jKd98OMqlABiY/b4q2vgbbZg=;
 b=YKV5iqo+Tmd76GLEYXzkU9sPnFmrF3zaKfzEyNonCTfbJdid238MbwbQ60uF5VJyKEVieN9afjN3yX1G8tqL1x0GKA1Uhofpxu1heA+BEtA6LieI5Ra8tb+HnbB0OlGYrX4y7/dE3sYitJsACOS8LkYV+LcUDM2crtcXFBoJCL6NQ0TgJ20r2EeIEJqf48FmZFM+EWXRC59XbcnszzYoFvs/7718XevUhv5qc1e/be/FnPBi+2vVf1O7cDiZPQkGK93IcQ/bAVLgb++jM+jmeHOMQoXh6cdBJmzRWpDEy40fAEv1gCUFWGueXcAzaXuX9SuDpbyobkJXvHcSYQrUmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5fWg/4sGMRgnXRGe85jKd98OMqlABiY/b4q2vgbbZg=;
 b=ZztlI10F6PrS5NQ0b6jvjqagfiRPepE2jfPahBreDkOjw14UeLe2i8Pf5Hz4CuQU1f6hZMIytd/nCuUw8aH1VwyYWxVnGSoiaU8gPNt5ozY3zowOwYllB8sgiL/meRBvf9RlF1EQRY6lPGapGFyFzWtnnXPIp1JrlZM2VMioj9o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB5272.namprd04.prod.outlook.com (2603:10b6:a03:cc::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Thu, 6 Jan
 2022 06:19:12 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::c25:c736:478a:b108]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::c25:c736:478a:b108%3]) with mapi id 15.20.4867.009; Thu, 6 Jan 2022
 06:19:12 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/3] drm/bridge: anx7625: add HDCP support
Date: Thu,  6 Jan 2022 14:16:29 +0800
Message-Id: <20220106061630.1752762-2-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220106061630.1752762-1-xji@analogixsemi.com>
References: <20220106061630.1752762-1-xji@analogixsemi.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0199.apcprd02.prod.outlook.com
 (2603:1096:201:20::11) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb9d6da2-f7eb-4556-c635-08d9d0dc74fe
X-MS-TrafficTypeDiagnostic: BYAPR04MB5272:EE_
X-Microsoft-Antispam-PRVS: <BYAPR04MB5272B52729A22723FB2E3186C74C9@BYAPR04MB5272.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XRrJFN6a/tdSyjnj+o2O1b6eJAP3xk22MHOzS96AaG1gsRotgluK5fpdCdHzVPxYiFID7617TckxwUwZqpZHRKb07qP71l4HStmgQLWOUy1tUz0V/fnoXg96RrL1QhSX0tYLDbYXQJbxJl3Ru2Kdk+EK6DL1vGgD/0//iavDTMhiKYY5JD+vYYBI1/Sa3+Cvnof5q2jHVWEoNMZyoD0nFaPHwYnwZqg/fGnWkwlnvcS+CSjQv5IMhDJUHSTj8co844hppT6qdj7It7tBJbEC219z2XnYOY7g780K0l9BWi8o7SO1LrJ/roLeF7WmwOy+HNFzeuVMhfmubBOTXX3/QXFZS7k/p6K241xftr/PtXFp+R5/AOvIQY0YM5/+d6ojJbHg+ZJeMLQcQJW9tM3mym9nv2NHeT7436ldduGix2fxbgwebx0w6SYs6wq5/uQLYlAsUl2Xg1UC9LsplOXXESWtcuLywcVeEjN1NGFeVC2vvcfi3f8MSyRTpQ2x121tQOHU7cpW5QgkpSZy1WtDKSp953MMSVz9c4RoJopWKa8/A1xam8lhlmlBcr/i4e8Qdzyg/AAYzKqGIax2Lr9EdCij2jfLf6FiSCGQ41s/O0vETl6h9RSaXR3puE0QZke0P9jgM05Lr+Wgq1kR9nnH8io2pTnaQ9q9AwsxtPkRh2dI+MItbZxU4z4HkUcWesiMDbqcjPsD2UquQ0uAuMjfjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(52116002)(7416002)(110136005)(66556008)(66946007)(38350700002)(2906002)(38100700002)(6506007)(66476007)(6486002)(83380400001)(86362001)(8936002)(4326008)(5660300002)(8676002)(36756003)(30864003)(55236004)(6666004)(1076003)(186003)(26005)(508600001)(2616005)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Tgz/dakoawdeF9EA9mmhL2+etMP5dunWbtieP5/ENRqMtGKWy0g4pZgT0io?=
 =?us-ascii?Q?kbowYyXrhRXpibG326J4H9vygeDrFbRtOExYQOBKWzb6qJ6ogsQLpXxc2JS4?=
 =?us-ascii?Q?L1FFMxLi0bSLaZ/afPUlG6oBZQeXX0wYvP0IwmlMlAoy7OuEJhEOwFtm9gut?=
 =?us-ascii?Q?ATSuc096Y8lhRsZonjoMBvpCTYgSHv9VqZePWQyGuHQ891tYQF5etRglA49X?=
 =?us-ascii?Q?3UDBAv4AUjNNkYCJLhIKsQh4w/hehuZ+QK4TxbzDH2zCykwjppsU9imQNOKr?=
 =?us-ascii?Q?KjMhiEMBCRBxyB7Yrkv4IiWG5q5Ax1X27ua7nTZ4+OGl9Bsi6sZedw+/klxB?=
 =?us-ascii?Q?epwWqr+k533drQW5RZ+XIdYEHlj5F2/gKBDV/x4egQbKR+ijJz4j/SeQlh2o?=
 =?us-ascii?Q?A5Q8zeMobgxAFdhuLI8BManjqQvAH6yh90SKFUtL0kGSap+8nRArY3ejnzOe?=
 =?us-ascii?Q?qXMHS0kJjflPXsdIhxQFyC2FZ4ufQHV5NPkFrYASbKHb9qGb54HgSS8OxPng?=
 =?us-ascii?Q?QFik35w8gljpJihW3UZgjbAqku3Sw+bsIYwX3XuQfwPTt+Hns23ydRbegook?=
 =?us-ascii?Q?nEoRTdS1IsDpJzDgt2701G1SBR61p4SykmlSSkqxVdka7VcC/WZNBOT1727g?=
 =?us-ascii?Q?D9ixZhc5mFyPxOekkOn/udLv9Avs8hgkAVAvm3WvgDF8hziehe/GudEH7q4q?=
 =?us-ascii?Q?pccYbE6QwWGavO7cgViK6g9jx84AhH0JanSVPDyUjRgsiadj0MisBdbLCK9g?=
 =?us-ascii?Q?yU8Fs4v9NrcGdH5pc831jffjOGbt3XKt/vFqAz/vEtdRfO5HpnIbgZquVvQa?=
 =?us-ascii?Q?N2QKmVMdDzCthfhLYG1UgBnMHicpkXVRtg5RVLQQ5bQtnf+LmXhpgoGGvZ4i?=
 =?us-ascii?Q?FpA5odU4AjVYFeDUcqNvfIHJJIYtWRpsTLAcCUqzZM/UQqHspaihy5wQl/iR?=
 =?us-ascii?Q?bv4BRg392UNJ5bidntN/frwJUMTO+k2FJRSj5jhjS08xg5e65Pheoomv9hqA?=
 =?us-ascii?Q?0PbX5MygHVrTOV5NIzH4R2uPfWSP8joEGNodQbTLqStoDh6mIakk/hdhaY15?=
 =?us-ascii?Q?RB0DZeTLB+LrGKKQ9zddZtjDViPF0gVtJ9LghuDfpy7sFDsqWMAskV6IwdTw?=
 =?us-ascii?Q?gbAfvpF/dPh6DuhiUh7JChr8TUz+ODIX67LBajMX5AlstHQclWfcNAkwsWQM?=
 =?us-ascii?Q?qKCiMwMuQHa7CuMan+Ni5MxLM86vDIvfFZP4iuvtKFxjsgEEqYDABLLNYv0U?=
 =?us-ascii?Q?uBwFlDR4ZklBITWtVOoGjnIMKKUDInxW/CnOW6DhrZQkTb+yoHU8T42ZVWOy?=
 =?us-ascii?Q?EJMwV+aMdQC8sJlYGmihV9RC6W1q8Yh0J+OGi6I1n6u09y5fqSqh6jWognnd?=
 =?us-ascii?Q?3lu9waVXImW2zTqdmom7cN9NacodboBBJczrxhsUM3P293ztbEIgklR8YKxR?=
 =?us-ascii?Q?7CminKE8vvDVBRx1GKhspfOAFsQdT9DnpakXwlGgxPGKGz1zICB4OMSUGhR/?=
 =?us-ascii?Q?mGQtOoNCPfb5y8G7wYZqC5rv5fvw7hmp8V+lCiUQJCigIlPVBJox+50kgp7w?=
 =?us-ascii?Q?ZD6EcoB60gYz6+wFX+nSdtvddrfwYqCMOTCKmFjmW39fXp/huEG0y90hDyQI?=
 =?us-ascii?Q?IZJYW9wUU9rUhXhHHDYflXA=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9d6da2-f7eb-4556-c635-08d9d0dc74fe
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 06:19:12.5434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fI5Xulo4U5ujw5KHQfLfs3PNC4qaY8au9LP8NLIXoL+FKrg/AHbWgjTo79gSTcUEJoRFJ9RJCFphHNkJ5sINEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5272
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
Cc: qwen@analogixsemi.com, bliang@analogixsemi.com,
 Xin Ji <xji@analogixsemi.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch provides HDCP setting interface for userspace to dynamic
enable/disable HDCP function.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 335 +++++++++++++++++++++-
 drivers/gpu/drm/bridge/analogix/anx7625.h |  79 ++++-
 2 files changed, 404 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 6d5ae52f4142..a225dd1abf41 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -26,6 +26,7 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_hdcp.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -213,6 +214,65 @@ static int wait_aux_op_finish(struct anx7625_data *ctx)
 	return 0;
 }
 
+static int anx7625_aux_dpcd_read(struct anx7625_data *ctx,
+				 u32 address, u8 len, u8 *buf)
+{
+	struct device *dev = &ctx->client->dev;
+	int ret;
+	u8 addrh, addrm, addrl;
+	u8 cmd;
+
+	if (len > MAX_DPCD_BUFFER_SIZE) {
+		dev_err(dev, "exceed aux buffer len.\n");
+		return -EINVAL;
+	}
+
+	addrl = address & 0xFF;
+	addrm = (address >> 8) & 0xFF;
+	addrh = (address >> 16) & 0xFF;
+
+	cmd = DPCD_CMD(len, DPCD_READ);
+	cmd = ((len - 1) << 4) | 0x09;
+
+	/* Set command and length */
+	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				AP_AUX_COMMAND, cmd);
+
+	/* Set aux access address */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 AP_AUX_ADDR_7_0, addrl);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 AP_AUX_ADDR_15_8, addrm);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 AP_AUX_ADDR_19_16, addrh);
+
+	/* Enable aux access */
+	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
+				AP_AUX_CTRL_STATUS, AP_AUX_CTRL_OP_EN);
+
+	if (ret < 0) {
+		dev_err(dev, "cannot access aux related register.\n");
+		return -EIO;
+	}
+
+	usleep_range(2000, 2100);
+
+	ret = wait_aux_op_finish(ctx);
+	if (ret) {
+		dev_err(dev, "aux IO error: wait aux op finish.\n");
+		return ret;
+	}
+
+	ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
+				     AP_AUX_BUFF_START, len, buf);
+	if (ret < 0) {
+		dev_err(dev, "read dpcd register failed\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
 static int anx7625_video_mute_control(struct anx7625_data *ctx,
 				      u8 status)
 {
@@ -669,6 +729,165 @@ static int anx7625_dpi_config(struct anx7625_data *ctx)
 	return ret;
 }
 
+static int anx7625_read_flash_status(struct anx7625_data *ctx)
+{
+	return anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, R_RAM_CTRL);
+}
+
+static int anx7625_hdcp_key_probe(struct anx7625_data *ctx)
+{
+	int ret, val;
+	struct device *dev = &ctx->client->dev;
+	u8 ident[FLASH_BUF_LEN];
+
+	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				FLASH_ADDR_HIGH, 0x91);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 FLASH_ADDR_LOW, 0xA0);
+	if (ret < 0) {
+		dev_err(dev, "IO error : set key flash address.\n");
+		return ret;
+	}
+
+	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				FLASH_LEN_HIGH, (FLASH_BUF_LEN - 1) >> 8);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 FLASH_LEN_LOW, (FLASH_BUF_LEN - 1) & 0xFF);
+	if (ret < 0) {
+		dev_err(dev, "IO error : set key flash len.\n");
+		return ret;
+	}
+
+	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				R_FLASH_RW_CTRL, FLASH_READ);
+	ret |= readx_poll_timeout(anx7625_read_flash_status,
+				  ctx, val,
+				  ((val & FLASH_DONE) || (val < 0)),
+				  2000,
+				  2000 * 150);
+	if (ret) {
+		dev_err(dev, "flash read access fail!\n");
+		return -EIO;
+	}
+
+	ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
+				     FLASH_BUF_BASE_ADDR,
+				     FLASH_BUF_LEN, ident);
+	if (ret < 0) {
+		dev_err(dev, "read flash data fail!\n");
+		return -EIO;
+	}
+
+	if (ident[29] == 0xFF && ident[30] == 0xFF && ident[31] == 0xFF)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int anx7625_hdcp_key_load(struct anx7625_data *ctx)
+{
+	int ret;
+	struct device *dev = &ctx->client->dev;
+
+	/* Select HDCP 1.4 KEY */
+	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				R_BOOT_RETRY, 0x12);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 FLASH_ADDR_HIGH, HDCP14KEY_START_ADDR >> 8);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 FLASH_ADDR_LOW, HDCP14KEY_START_ADDR & 0xFF);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 R_RAM_LEN_H, HDCP14KEY_SIZE >> 12);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 R_RAM_LEN_L, HDCP14KEY_SIZE >> 4);
+
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 R_RAM_ADDR_H, 0);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 R_RAM_ADDR_L, 0);
+	/* Enable HDCP 1.4 KEY load */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 R_RAM_CTRL, DECRYPT_EN | LOAD_START);
+	dev_dbg(dev, "load HDCP 1.4 key done\n");
+	return ret;
+}
+
+static int anx7625_hdcp_disable(struct anx7625_data *ctx)
+{
+	int ret;
+	struct device *dev = &ctx->client->dev;
+
+	dev_dbg(dev, "disable HDCP 1.4\n");
+
+	/* Disable HDCP */
+	ret = anx7625_write_and(ctx, ctx->i2c.rx_p1_client, 0xee, 0x9f);
+	/* Try auth flag */
+	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xec, 0x10);
+	/* Interrupt for DRM */
+	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xff, 0x01);
+	if (ret < 0)
+		dev_err(dev, "fail to disable HDCP\n");
+
+	return anx7625_write_and(ctx, ctx->i2c.tx_p0_client,
+				 TX_HDCP_CTRL0, ~HARD_AUTH_EN & 0xFF);
+}
+
+static int anx7625_hdcp_enable(struct anx7625_data *ctx)
+{
+	u8 bcap;
+	int ret;
+	struct device *dev = &ctx->client->dev;
+
+	ret = anx7625_hdcp_key_probe(ctx);
+	if (ret) {
+		dev_dbg(dev, "no key found, not to do hdcp\n");
+		return ret;
+	}
+
+	/* Read downstream capability */
+	anx7625_aux_dpcd_read(ctx, 0x68028, 1, &bcap);
+	if (!(bcap & 0x01)) {
+		pr_warn("downstream not support HDCP 1.4, cap(%x).\n", bcap);
+		return 0;
+	}
+
+	dev_dbg(dev, "enable HDCP 1.4\n");
+
+	/* First clear HDCP state */
+	ret = anx7625_reg_write(ctx, ctx->i2c.tx_p0_client,
+				TX_HDCP_CTRL0,
+				KSVLIST_VLD | BKSV_SRM_PASS | RE_AUTHEN);
+	usleep_range(1000, 1100);
+	/* Second clear HDCP state */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p0_client,
+				 TX_HDCP_CTRL0,
+				 KSVLIST_VLD | BKSV_SRM_PASS | RE_AUTHEN);
+
+	/* Set time for waiting KSVR */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p0_client,
+				 SP_TX_WAIT_KSVR_TIME, 0xc8);
+	/* Set time for waiting R0 */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p0_client,
+				 SP_TX_WAIT_R0_TIME, 0xb0);
+	ret |= anx7625_hdcp_key_load(ctx);
+	if (ret) {
+		pr_warn("prepare HDCP key failed.\n");
+		return ret;
+	}
+
+	ret = anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xee, 0x20);
+
+	/* Try auth flag */
+	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xec, 0x10);
+	/* Interrupt for DRM */
+	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xff, 0x01);
+	if (ret < 0)
+		dev_err(dev, "fail to enable HDCP\n");
+
+	return anx7625_write_or(ctx, ctx->i2c.tx_p0_client,
+				TX_HDCP_CTRL0, HARD_AUTH_EN);
+}
+
 static void anx7625_dp_start(struct anx7625_data *ctx)
 {
 	int ret;
@@ -679,6 +898,9 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
 		return;
 	}
 
+	/* Disable HDCP */
+	anx7625_write_and(ctx, ctx->i2c.rx_p1_client, 0xee, 0x9f);
+
 	if (ctx->pdata.is_dpi)
 		ret = anx7625_dpi_config(ctx);
 	else
@@ -686,6 +908,10 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
 
 	if (ret < 0)
 		DRM_DEV_ERROR(dev, "MIPI phy setup error.\n");
+
+	ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
+
+	ctx->dp_en = 1;
 }
 
 static void anx7625_dp_stop(struct anx7625_data *ctx)
@@ -705,6 +931,10 @@ static void anx7625_dp_stop(struct anx7625_data *ctx)
 	ret |= anx7625_video_mute_control(ctx, 1);
 	if (ret < 0)
 		DRM_DEV_ERROR(dev, "IO error : mute video fail\n");
+
+	ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
+
+	ctx->dp_en = 0;
 }
 
 static int sp_tx_rst_aux(struct anx7625_data *ctx)
@@ -1697,6 +1927,83 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
 	return 0;
 }
 
+void hdcp_check_work_func(struct work_struct *work)
+{
+	u8 status;
+	struct delayed_work *dwork;
+	struct anx7625_data *ctx;
+	struct device *dev;
+	struct drm_device *drm_dev;
+
+	dwork = to_delayed_work(work);
+	ctx = container_of(dwork, struct anx7625_data, hdcp_work);
+	dev = &ctx->client->dev;
+
+	if (!ctx->connector) {
+		dev_err(dev, "HDCP connector is null!");
+		return;
+	}
+
+	drm_dev = ctx->connector->dev;
+	drm_modeset_lock(&drm_dev->mode_config.connection_mutex, NULL);
+	mutex_lock(&ctx->hdcp_wq_lock);
+
+	status = anx7625_reg_read(ctx, ctx->i2c.tx_p0_client, 0);
+	dev_dbg(dev, "sink HDCP status check: %.02x\n", status);
+	if (status & BIT(1)) {
+		ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_ENABLED;
+		drm_hdcp_update_content_protection(ctx->connector,
+						   ctx->hdcp_cp);
+		dev_dbg(dev, "update CP to ENABLE\n");
+	}
+
+	mutex_unlock(&ctx->hdcp_wq_lock);
+	drm_modeset_unlock(&drm_dev->mode_config.connection_mutex);
+}
+
+static int anx7625_connector_atomic_check(struct anx7625_data *ctx,
+					  struct drm_connector_state *state)
+{
+	struct device *dev = &ctx->client->dev;
+	int cp;
+
+	dev_dbg(dev, "hdcp state check\n");
+	cp = state->content_protection;
+
+	if (cp == ctx->hdcp_cp)
+		return 0;
+
+	if (cp == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
+		if (ctx->dp_en) {
+			dev_dbg(dev, "enable HDCP\n");
+			anx7625_hdcp_enable(ctx);
+
+			queue_delayed_work(ctx->hdcp_workqueue,
+					   &ctx->hdcp_work,
+					   msecs_to_jiffies(2000));
+		}
+	}
+
+	if (cp == DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
+		if (ctx->hdcp_cp != DRM_MODE_CONTENT_PROTECTION_ENABLED) {
+			dev_err(dev, "current CP is not ENABLED\n");
+			return -EINVAL;
+		}
+		anx7625_hdcp_disable(ctx);
+		ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
+		drm_hdcp_update_content_protection(ctx->connector,
+						   ctx->hdcp_cp);
+		dev_dbg(dev, "update CP to UNDESIRE\n");
+	}
+
+	if (cp == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
+		dev_err(dev, "Userspace illegal set to PROTECTION ENABLE\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int anx7625_bridge_attach(struct drm_bridge *bridge,
 				 enum drm_bridge_attach_flags flags)
 {
@@ -1920,8 +2227,11 @@ static int anx7625_bridge_atomic_check(struct drm_bridge *bridge,
 	struct device *dev = &ctx->client->dev;
 
 	dev_dbg(dev, "drm bridge atomic check\n");
-	return anx7625_bridge_mode_fixup(bridge, &crtc_state->mode,
-					 &crtc_state->adjusted_mode);
+
+	anx7625_bridge_mode_fixup(bridge, &crtc_state->mode,
+				  &crtc_state->adjusted_mode);
+
+	return anx7625_connector_atomic_check(ctx, conn_state);
 }
 
 static void anx7625_bridge_atomic_enable(struct drm_bridge *bridge,
@@ -2189,6 +2499,15 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	anx7625_init_gpio(platform);
 
 	mutex_init(&platform->lock);
+	mutex_init(&platform->hdcp_wq_lock);
+
+	INIT_DELAYED_WORK(&platform->hdcp_work, hdcp_check_work_func);
+	platform->hdcp_workqueue = create_workqueue("hdcp workqueue");
+	if (!platform->hdcp_workqueue) {
+		dev_err(dev, "fail to create work queue\n");
+		ret = -ENOMEM;
+		goto free_platform;
+	}
 
 	platform->pdata.intp_irq = client->irq;
 	if (platform->pdata.intp_irq) {
@@ -2198,7 +2517,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 		if (!platform->workqueue) {
 			DRM_DEV_ERROR(dev, "fail to create work queue\n");
 			ret = -ENOMEM;
-			goto free_platform;
+			goto free_hdcp_wq;
 		}
 
 		ret = devm_request_threaded_irq(dev, platform->pdata.intp_irq,
@@ -2268,6 +2587,10 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	if (platform->workqueue)
 		destroy_workqueue(platform->workqueue);
 
+free_hdcp_wq:
+	if (platform->hdcp_workqueue)
+		destroy_workqueue(platform->hdcp_workqueue);
+
 free_platform:
 	kfree(platform);
 
@@ -2283,6 +2606,12 @@ static int anx7625_i2c_remove(struct i2c_client *client)
 	if (platform->pdata.intp_irq)
 		destroy_workqueue(platform->workqueue);
 
+	if (platform->hdcp_workqueue) {
+		cancel_delayed_work(&platform->hdcp_work);
+		flush_workqueue(platform->workqueue);
+		destroy_workqueue(platform->workqueue);
+	}
+
 	if (!platform->pdata.low_power_mode)
 		pm_runtime_put_sync_suspend(&client->dev);
 
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index 6f9d5f0e377c..56165f5b254c 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -59,10 +59,23 @@
 
 /***************************************************************/
 /* Register definition of device address 0x70 */
-#define  I2C_ADDR_70_DPTX              0x70
-
-#define SP_TX_LINK_BW_SET_REG 0xA0
-#define SP_TX_LANE_COUNT_SET_REG 0xA1
+#define TX_HDCP_CTRL0			0x01
+#define STORE_AN			BIT(7)
+#define RX_REPEATER			BIT(6)
+#define RE_AUTHEN			BIT(5)
+#define SW_AUTH_OK			BIT(4)
+#define HARD_AUTH_EN			BIT(3)
+#define ENC_EN				BIT(2)
+#define BKSV_SRM_PASS			BIT(1)
+#define KSVLIST_VLD			BIT(0)
+
+#define SP_TX_WAIT_R0_TIME		0x40
+#define SP_TX_WAIT_KSVR_TIME		0x42
+#define SP_TX_SYS_CTRL1_REG		0x80
+#define HDCP2TX_FW_EN			BIT(4)
+
+#define SP_TX_LINK_BW_SET_REG		0xA0
+#define SP_TX_LANE_COUNT_SET_REG	0xA1
 
 #define M_VID_0 0xC0
 #define M_VID_1 0xC1
@@ -71,6 +84,12 @@
 #define N_VID_1 0xC4
 #define N_VID_2 0xC5
 
+#define KEY_START_ADDR			0x9000
+#define KEY_RESERVED			416
+
+#define HDCP14KEY_START_ADDR		(KEY_START_ADDR + KEY_RESERVED)
+#define HDCP14KEY_SIZE			624
+
 /***************************************************************/
 /* Register definition of device address 0x72 */
 #define AUX_RST	0x04
@@ -155,9 +174,43 @@
 
 #define  I2C_ADDR_7E_FLASH_CONTROLLER  0x7E
 
+#define R_BOOT_RETRY		0x00
+#define R_RAM_ADDR_H		0x01
+#define R_RAM_ADDR_L		0x02
+#define R_RAM_LEN_H		0x03
+#define R_RAM_LEN_L		0x04
 #define FLASH_LOAD_STA          0x05
 #define FLASH_LOAD_STA_CHK	BIT(7)
 
+#define R_RAM_CTRL              0x05
+/* bit positions */
+#define FLASH_DONE              BIT(7)
+#define BOOT_LOAD_DONE          BIT(6)
+#define CRC_OK                  BIT(5)
+#define LOAD_DONE               BIT(4)
+#define O_RW_DONE               BIT(3)
+#define FUSE_BUSY               BIT(2)
+#define DECRYPT_EN              BIT(1)
+#define LOAD_START              BIT(0)
+
+#define FLASH_ADDR_HIGH         0x0F
+#define FLASH_ADDR_LOW          0x10
+#define FLASH_LEN_HIGH          0x31
+#define FLASH_LEN_LOW           0x32
+#define R_FLASH_RW_CTRL         0x33
+/* bit positions */
+#define READ_DELAY_SELECT       BIT(7)
+#define GENERAL_INSTRUCTION_EN  BIT(6)
+#define FLASH_ERASE_EN          BIT(5)
+#define RDID_READ_EN            BIT(4)
+#define REMS_READ_EN            BIT(3)
+#define WRITE_STATUS_EN         BIT(2)
+#define FLASH_READ              BIT(1)
+#define FLASH_WRITE             BIT(0)
+
+#define FLASH_BUF_BASE_ADDR     0x60
+#define FLASH_BUF_LEN           0x20
+
 #define  XTAL_FRQ_SEL    0x3F
 /* bit field positions */
 #define  XTAL_FRQ_SEL_POS    5
@@ -184,10 +237,15 @@
 #define AP_AUX_CTRL_ADDRONLY 0x20
 
 #define AP_AUX_BUFF_START 0x15
-#define PIXEL_CLOCK_L 0x25
-#define PIXEL_CLOCK_H 0x26
+#define PIXEL_CLOCK_L	0x25
+#define PIXEL_CLOCK_H	0x26
+
+#define AP_AUX_COMMAND	0x27  /* com+len */
+#define LENGTH_SHIFT	4
+#define DPCD_READ	0x09
+#define DPCD_WRITE	0x08
+#define DPCD_CMD(len, cmd)	((((len) - 1) << LENGTH_SHIFT) | (cmd))
 
-#define AP_AUX_COMMAND 0x27  /* com+len */
 /* Bit 0&1: 3D video structure */
 /* 0x01: frame packing,  0x02:Line alternative, 0x03:Side-by-side(full) */
 #define AP_AV_STATUS 0x28
@@ -392,16 +450,23 @@ struct anx7625_data {
 	struct platform_device *audio_pdev;
 	int hpd_status;
 	int hpd_high_cnt;
+	int dp_en;
+	int hdcp_cp;
 	/* Lock for work queue */
 	struct mutex lock;
 	struct i2c_client *client;
 	struct anx7625_i2c_client i2c;
 	struct i2c_client *last_client;
+	struct timer_list hdcp_timer;
 	struct s_edid_data slimport_edid_p;
 	struct device *codec_dev;
 	hdmi_codec_plugged_cb plugged_cb;
 	struct work_struct work;
 	struct workqueue_struct *workqueue;
+	struct delayed_work hdcp_work;
+	struct workqueue_struct *hdcp_workqueue;
+	/* Lock for hdcp work queue */
+	struct mutex hdcp_wq_lock;
 	char edid_block;
 	struct display_timing dt;
 	u8 display_timing_valid;
-- 
2.25.1

