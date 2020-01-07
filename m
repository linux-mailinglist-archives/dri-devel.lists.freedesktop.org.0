Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC7B133CDD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBA56E866;
	Wed,  8 Jan 2020 08:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76986E07D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 13:38:51 +0000 (UTC)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 007DU1Yk007209; Tue, 7 Jan 2020 08:38:35 -0500
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2051.outbound.protection.outlook.com [104.47.36.51])
 by mx0a-00128a01.pphosted.com with ESMTP id 2xaneaf5ys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jan 2020 08:38:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ca1FR1SlpNU3HxuLsSBtOG1RIf9iHF4JYFus+i6Iz6Z78KNXOdWswWLOIZYpZKiqcCnjH6BvJACUp0TknOaHUpQNyE9kNL5fbquyq2gicP/Oze9/K67yk8DnKgMbRrYV16soz82VVmRmnVPiKsqKmBZShXx9RsHD9JatZuVMovHtvaFEZVarm+ONJGFLAsO8cOHURpNszV3Wm72e4uuVyg2l6t4bTO5qETfyg72PyI3PKEk+WqEC0P8gUetR9WLHo4b1QbRaRi9//0HumRD3Ro8SLZlqZMBrZqTWe99+sa6hmjdybKOwAIjYnxI+0lXJu7OYQB7Ss0xs4jVNyRcJZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7qH5Q3FPpfJvyBZLBo5+lIS71LXTYC0j91i9astl8c=;
 b=hz737KlevpEWKjCk4AclHcChz+v8dHXysBUFEvQQn1UMSXM0QrfMLste2KFqTwyCkj7C69kKEM5rmgn/hdp7v1XhIcGlPjQ137kBPJd/yCOBEhU4WwRxTyU/UUYHGTN9EIgHWA1fwU6HAcbFW1ikltfw2H3QD5TaxCzoQg9TLvNfonnGYeqWnTlBqiNhBrLza4S2S150MqegZ8MP6harkEmE3SS7y+3ruP61TyJUOamRXppeBc7UC+0QLPLkt5OfJ1MZP0hUH32Q+Z3r9LuaQ2owTB+nTC48sJp+ZybMaOOPDsoWMDQKn3o0/LClER23/i2ud+nkYTUl9WY/6IUEyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.57) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=analog.com; dmarc=bestguesspass action=none
 header.from=analog.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7qH5Q3FPpfJvyBZLBo5+lIS71LXTYC0j91i9astl8c=;
 b=dGA9tHVG368AmHbiN9VPDHzn5paZvHCecoSmI17WluTtCUoCWY0NEN9axPxwmnLrM90JNA9qw4je7/TVpMCX/fW3Kj8gXBYpG10VvrfpbXAsj7C0/jb1jyW9R5x2z6iuhUxPFGgHoEEm5G8ijGJbV4z3rOvHaCpN44kZpOPLLx8=
Received: from CH2PR03CA0027.namprd03.prod.outlook.com (2603:10b6:610:59::37)
 by BYAPR03MB3653.namprd03.prod.outlook.com (2603:10b6:a02:aa::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.13; Tue, 7 Jan
 2020 13:38:32 +0000
Received: from CY1NAM02FT025.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::205) by CH2PR03CA0027.outlook.office365.com
 (2603:10b6:610:59::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12 via Frontend
 Transport; Tue, 7 Jan 2020 13:38:32 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 CY1NAM02FT025.mail.protection.outlook.com (10.152.75.148) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2602.11
 via Frontend Transport; Tue, 7 Jan 2020 13:38:31 +0000
Received: from SCSQMBX11.ad.analog.com (scsqmbx11.ad.analog.com [10.77.17.10])
 by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id 007DcTmU017740
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Tue, 7 Jan 2020 05:38:30 -0800
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by SCSQMBX11.ad.analog.com
 (10.77.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Tue, 7 Jan 2020
 05:38:29 -0800
Received: from zeus.spd.analog.com (10.64.82.11) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Tue, 7 Jan 2020 08:38:28 -0500
Received: from btogorean-pc.ad.analog.com ([10.48.65.146])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 007DbflR002280;
 Tue, 7 Jan 2020 08:38:25 -0500
From: Bogdan Togorean <bogdan.togorean@analog.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RESEND v3 2/2] drm: bridge: adv7511: Add support for ADV7535
Date: Tue, 7 Jan 2020 15:34:34 +0200
Message-ID: <20200107133431.5201-3-bogdan.togorean@analog.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200107133431.5201-1-bogdan.togorean@analog.com>
References: <20200107133431.5201-1-bogdan.togorean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57; IPV:; CTRY:US; EFV:NLI; SFV:NSPM;
 SFS:(10009020)(136003)(396003)(376002)(346002)(39860400002)(189003)(199004)(5660300002)(7416002)(1076003)(6666004)(7696005)(356004)(426003)(336012)(478600001)(26005)(186003)(70586007)(70206006)(6916009)(54906003)(316002)(8676002)(4326008)(44832011)(8936002)(36756003)(107886003)(2906002)(246002)(86362001)(7636002)(2616005)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR03MB3653; H:nwd2mta2.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail11.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b2cd019-a717-4a01-a30f-08d79376e2d0
X-MS-TrafficTypeDiagnostic: BYAPR03MB3653:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3653CBA21FB5BAB4B1C46A2A9B3F0@BYAPR03MB3653.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 027578BB13
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dKYvsbrtj3ChTi4nJFR7sW6PO8VzqE4vwCqYFS4LmriFaEJyui/eM78iI8Py+eZ5zKi4PHaEv8/BHUgfVExKel2JGYT9Ol5qDK/hWsLrpA3rTij41YH8FwX3p4aMGB2RvQ2MmB1C/UNR4sQdTVU6yZOEd2xVlEA6sWjM9GL/65fnCM1Et7MTut0Wk1CsD48M0wpc/9fslgyqvOE+d8iKnk2Sex1H7TNrXH3ImeTv1FKxQcnNJT7eLPBNU10PiyCW8++H+t9nprit3kX+36CkzvT7PBegPoUxKJUSVtNW+v7yaOYqJ8o8vrcAC7V7lCx13KOslynD2VVCXr8U1R+Dq1w1YID5WBvXGWq8CtG+Mex32kgfR17UpYqBso+hky+N4O9w9yU35gCKSnuajyYrpgTd24hHkV9JWHnEFMQggPPxWIu7NL9/RlB4ncRwcnzpMkvmCxzBs5d89wl/ZIaFYBtzE49VGet2LwiAK+ns1NAT1Icr34JrHVvzdAFO76N+
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2020 13:38:31.5391 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b2cd019-a717-4a01-a30f-08d79376e2d0
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.57];
 Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3653
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-07_03:2020-01-06,2020-01-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=1 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001070112
X-Mailman-Approved-At: Wed, 08 Jan 2020 08:12:31 +0000
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
Cc: mark.rutland@arm.com, robdclark@chromium.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, gregkh@linuxfoundation.org,
 jonas@kwiboo.se, wsa+renesas@sang-engineering.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, alexander.deucher@amd.com,
 tglx@linutronix.de, sam@ravnborg.org, matt.redfearn@thinci.com,
 Bogdan Togorean <bogdan.togorean@analog.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ADV7535 is a DSI to HDMI bridge chip like ADV7533 but it allows
1080p@60Hz. v1p2 is fixed to 1.8V on ADV7535 but on ADV7533 can be 1.2V
or 1.8V and is configurable in a register.

Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
---
 drivers/gpu/drm/bridge/adv7511/Kconfig       | 13 ++----
 drivers/gpu/drm/bridge/adv7511/Makefile      |  3 +-
 drivers/gpu/drm/bridge/adv7511/adv7511.h     | 44 +++-----------------
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 35 ++++++++++------
 4 files changed, 32 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/Kconfig b/drivers/gpu/drm/bridge/adv7511/Kconfig
index 8a56ff81f4fb..47d4eb9e845d 100644
--- a/drivers/gpu/drm/bridge/adv7511/Kconfig
+++ b/drivers/gpu/drm/bridge/adv7511/Kconfig
@@ -4,8 +4,9 @@ config DRM_I2C_ADV7511
 	depends on OF
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
+	select DRM_MIPI_DSI
 	help
-	  Support for the Analog Device ADV7511(W) and ADV7513 HDMI encoders.
+	  Support for the Analog Device ADV7511(W)/13/33/35 HDMI encoders.
 
 config DRM_I2C_ADV7511_AUDIO
 	bool "ADV7511 HDMI Audio driver"
@@ -15,16 +16,8 @@ config DRM_I2C_ADV7511_AUDIO
 	  Support the ADV7511 HDMI Audio interface. This is used in
 	  conjunction with the AV7511  HDMI driver.
 
-config DRM_I2C_ADV7533
-	bool "ADV7533 encoder"
-	depends on DRM_I2C_ADV7511
-	select DRM_MIPI_DSI
-	default y
-	help
-	  Support for the Analog Devices ADV7533 DSI to HDMI encoder.
-
 config DRM_I2C_ADV7511_CEC
-	bool "ADV7511/33 HDMI CEC driver"
+	bool "ADV7511/33/35 HDMI CEC driver"
 	depends on DRM_I2C_ADV7511
 	select CEC_CORE
 	default y
diff --git a/drivers/gpu/drm/bridge/adv7511/Makefile b/drivers/gpu/drm/bridge/adv7511/Makefile
index b46ebeb35fd4..d8ceb534b51f 100644
--- a/drivers/gpu/drm/bridge/adv7511/Makefile
+++ b/drivers/gpu/drm/bridge/adv7511/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-adv7511-y := adv7511_drv.o
+adv7511-y := adv7511_drv.o adv7533.o
 adv7511-$(CONFIG_DRM_I2C_ADV7511_AUDIO) += adv7511_audio.o
 adv7511-$(CONFIG_DRM_I2C_ADV7511_CEC) += adv7511_cec.o
-adv7511-$(CONFIG_DRM_I2C_ADV7533) += adv7533.o
 obj-$(CONFIG_DRM_I2C_ADV7511) += adv7511.o
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 52b2adfdc877..ed9cfd944098 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -220,6 +220,10 @@
 
 #define ADV7533_REG_CEC_OFFSET		0x70
 
+#define ADV7533_REG_SUPPLY_SELECT	0xe4
+
+#define ADV7533_V1P2_ENABLE		BIT(7)
+
 enum adv7511_input_clock {
 	ADV7511_INPUT_CLOCK_1X,
 	ADV7511_INPUT_CLOCK_2X,
@@ -320,6 +324,7 @@ struct adv7511_video_config {
 enum adv7511_type {
 	ADV7511,
 	ADV7533,
+	ADV7535,
 };
 
 #define ADV7511_MAX_ADDRS 3
@@ -393,7 +398,6 @@ static inline int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
 }
 #endif
 
-#ifdef CONFIG_DRM_I2C_ADV7533
 void adv7533_dsi_power_on(struct adv7511 *adv);
 void adv7533_dsi_power_off(struct adv7511 *adv);
 void adv7533_mode_set(struct adv7511 *adv, const struct drm_display_mode *mode);
@@ -402,44 +406,6 @@ int adv7533_patch_cec_registers(struct adv7511 *adv);
 int adv7533_attach_dsi(struct adv7511 *adv);
 void adv7533_detach_dsi(struct adv7511 *adv);
 int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv);
-#else
-static inline void adv7533_dsi_power_on(struct adv7511 *adv)
-{
-}
-
-static inline void adv7533_dsi_power_off(struct adv7511 *adv)
-{
-}
-
-static inline void adv7533_mode_set(struct adv7511 *adv,
-				    const struct drm_display_mode *mode)
-{
-}
-
-static inline int adv7533_patch_registers(struct adv7511 *adv)
-{
-	return -ENODEV;
-}
-
-static inline int adv7533_patch_cec_registers(struct adv7511 *adv)
-{
-	return -ENODEV;
-}
-
-static inline int adv7533_attach_dsi(struct adv7511 *adv)
-{
-	return -ENODEV;
-}
-
-static inline void adv7533_detach_dsi(struct adv7511 *adv)
-{
-}
-
-static inline int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
-{
-	return -ENODEV;
-}
-#endif
 
 #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
 int adv7511_audio_init(struct device *dev, struct adv7511 *adv7511);
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 9e13e466e72c..35595472e771 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -367,7 +367,7 @@ static void adv7511_power_on(struct adv7511 *adv7511)
 	 */
 	regcache_sync(adv7511->regmap);
 
-	if (adv7511->type == ADV7533)
+	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
 		adv7533_dsi_power_on(adv7511);
 	adv7511->powered = true;
 }
@@ -387,7 +387,7 @@ static void __adv7511_power_off(struct adv7511 *adv7511)
 static void adv7511_power_off(struct adv7511 *adv7511)
 {
 	__adv7511_power_off(adv7511);
-	if (adv7511->type == ADV7533)
+	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
 		adv7533_dsi_power_off(adv7511);
 	adv7511->powered = false;
 }
@@ -761,7 +761,7 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
 	regmap_update_bits(adv7511->regmap, 0x17,
 		0x60, (vsync_polarity << 6) | (hsync_polarity << 5));
 
-	if (adv7511->type == ADV7533)
+	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
 		adv7533_mode_set(adv7511, adj_mode);
 
 	drm_mode_copy(&adv7511->curr_mode, adj_mode);
@@ -874,7 +874,7 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge)
 				 &adv7511_connector_helper_funcs);
 	drm_connector_attach_encoder(&adv->connector, bridge->encoder);
 
-	if (adv->type == ADV7533)
+	if (adv->type == ADV7533 || adv->type == ADV7535)
 		ret = adv7533_attach_dsi(adv);
 
 	if (adv->i2c_main->irq)
@@ -903,6 +903,7 @@ static const char * const adv7511_supply_names[] = {
 	"dvdd-3v",
 };
 
+/* The order of entries is important. If changed update hardcoded indices */
 static const char * const adv7533_supply_names[] = {
 	"avdd",
 	"dvdd",
@@ -952,7 +953,7 @@ static bool adv7511_cec_register_volatile(struct device *dev, unsigned int reg)
 	struct i2c_client *i2c = to_i2c_client(dev);
 	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
 
-	if (adv7511->type == ADV7533)
+	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
 		reg -= ADV7533_REG_CEC_OFFSET;
 
 	switch (reg) {
@@ -994,7 +995,7 @@ static int adv7511_init_cec_regmap(struct adv7511 *adv)
 		goto err;
 	}
 
-	if (adv->type == ADV7533) {
+	if (adv->type == ADV7533 || adv->type == ADV7535) {
 		ret = adv7533_patch_cec_registers(adv);
 		if (ret)
 			goto err;
@@ -1094,8 +1095,9 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 	struct adv7511_link_config link_config;
 	struct adv7511 *adv7511;
 	struct device *dev = &i2c->dev;
+	struct regulator *reg_v1p2;
 	unsigned int val;
-	int ret;
+	int ret, reg_v1p2_uV;
 
 	if (!dev->of_node)
 		return -EINVAL;
@@ -1163,6 +1165,17 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 	if (ret)
 		goto uninit_regulators;
 
+	if (adv7511->type == ADV7533) {
+		reg_v1p2 = adv7511->supplies[5].consumer;
+		reg_v1p2_uV = regulator_get_voltage(reg_v1p2);
+
+		if (reg_v1p2_uV == 1200000) {
+			regmap_update_bits(adv7511->regmap,
+				ADV7533_REG_SUPPLY_SELECT, ADV7533_V1P2_ENABLE,
+				ADV7533_V1P2_ENABLE);
+		}
+	}
+
 	adv7511_packet_disable(adv7511, 0xffff);
 
 	adv7511->i2c_edid = i2c_new_ancillary_device(i2c, "edid",
@@ -1242,7 +1255,7 @@ static int adv7511_remove(struct i2c_client *i2c)
 {
 	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
 
-	if (adv7511->type == ADV7533)
+	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
 		adv7533_detach_dsi(adv7511);
 	i2c_unregister_device(adv7511->i2c_cec);
 	if (adv7511->cec_clk)
@@ -1266,9 +1279,8 @@ static const struct i2c_device_id adv7511_i2c_ids[] = {
 	{ "adv7511", ADV7511 },
 	{ "adv7511w", ADV7511 },
 	{ "adv7513", ADV7511 },
-#ifdef CONFIG_DRM_I2C_ADV7533
 	{ "adv7533", ADV7533 },
-#endif
+	{ "adv7535", ADV7535 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adv7511_i2c_ids);
@@ -1277,9 +1289,8 @@ static const struct of_device_id adv7511_of_ids[] = {
 	{ .compatible = "adi,adv7511", .data = (void *)ADV7511 },
 	{ .compatible = "adi,adv7511w", .data = (void *)ADV7511 },
 	{ .compatible = "adi,adv7513", .data = (void *)ADV7511 },
-#ifdef CONFIG_DRM_I2C_ADV7533
 	{ .compatible = "adi,adv7533", .data = (void *)ADV7533 },
-#endif
+	{ .compatible = "adi,adv7535", .data = (void *)ADV7535 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, adv7511_of_ids);
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
