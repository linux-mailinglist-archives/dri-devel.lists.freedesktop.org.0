Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 295217D10F7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 15:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B354810E5A9;
	Fri, 20 Oct 2023 13:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2050.outbound.protection.outlook.com [40.107.13.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5928710E5B5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 13:55:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOpf8L3Vtp25++MOeqOofA4iJaxTXuOx7zbn5DwPmuIud8VlVc7I0b5JdskR1+nnkgSw0z58W6Zqqhc9O8vkZBLNszEaij08n+datOIV13MmxNyIQJodhzKCe0w3pwu4sE19M8bOG7chFP4LfITLSc0QqOIH+aky4hG8hB4fDFOE52Nt8q6V6HgtXhkN7q9WTCd1GyoEOzUB5pxJSV9LUPEG5KvcYgt+m4zHUoU4hykclAuGDEmMXi+zmDdyBIT3ZEmezXXDBQ2+0kEhyUuh/QA5k/+G2QoeFoV8HXX2iIQs8LpFLCvlGIJWoHH4kHgNo8jBL1cE7/OMQNu6dgNr2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFXl+hbTrARvbVJiKhYP8TvK7ygcDX0KwXZ3KkhJrgg=;
 b=fMrquEw0C4BINqIaPPMyY84wClkm/QZaj2LnA8GPvwoOCZyY3fmiNrPQAyk2nMYM057eJjdZwabfmzp3j5ECNOMHAbwEmn2wz2VeFkL3P+miKEkIyKaZjmX/mQAARtKwo17cPlUo+NcszJVQ2cK5QG7x0O0ZhkO/NxV+3ZOp5RV6qIv8yR5Vl6UfRbd1y4oJA+ejBLxx0RsACaxRhmyNRjuXvy9KR/V0euVGg7GNESMUgOqBUw+FdBwKC1QWtyLSXk0nhUC1Pg27+Tzxc/DjSypJFyMOKCsZ+SrwW6tX+4aVOvV4JepNRvzLyQc80+p7xYZL7KBWEeHOMPqf3NzGUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 151.1.184.193) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=asem.it; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=asem.it; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFXl+hbTrARvbVJiKhYP8TvK7ygcDX0KwXZ3KkhJrgg=;
 b=VVbcIlDrkbQAbjvgMzRc6tL/5mDs4Ao9giUAw6BOC7VmJClDxW1FbBrCW3oPz3Uj27ycPKPCLwrmMZ1SbUC82tBlpS9hUz12fPErA7Jx3rxLoSSoFw8pbHz//w0caTshk1zGmL4Am5qmsdtqkk/GEUcChYKOPx9t/V+Ju5AtEJc=
Received: from DB9PR06CA0014.eurprd06.prod.outlook.com (2603:10a6:10:1db::19)
 by AM0PR01MB6484.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:163::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 13:55:05 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::14) by DB9PR06CA0014.outlook.office365.com
 (2603:10a6:10:1db::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26 via Frontend
 Transport; Fri, 20 Oct 2023 13:55:05 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 151.1.184.193) smtp.mailfrom=asem.it; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=asem.it;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 asem.it discourages use of 151.1.184.193 as permitted sender)
Received: from asas054.asem.intra (151.1.184.193) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.24 via Frontend Transport; Fri, 20 Oct 2023 13:55:04 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with
 Microsoft SMTPSVC(10.0.14393.4169); Fri, 20 Oct 2023 15:55:02 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v5] backlight: mp3309c: Add support for MPS MP3309C
Date: Fri, 20 Oct 2023 15:54:34 +0200
Message-Id: <20231020135434.2598578-3-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231020135434.2598578-1-f.suligoi@asem.it>
References: <20231020135434.2598578-1-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 20 Oct 2023 13:55:02.0844 (UTC)
 FILETIME=[060147C0:01DA035D]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B620:EE_|AM0PR01MB6484:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: afd9dee7-2f3c-4162-3a50-08dbd17429cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iNd1Gje/GwrcWNz9N4ZAFHpIV2+G2WigAfdK7pSm4H1yYWG0gISpdFnq8nXPHO8kyHHLfOmuCTgodofdRHGpESBjDDtLGDp184OBiyD16OZ3nQsUI5ATkwbuGn5OsXcIoWXhx+OibHe8jf5HYuzH1nnpeN0dvFueeHCH/kXFGmhZVmwdBfwhb1ZevuqGTfNtR9CTGpOzZ3a9OBOl7sOvKoCsBr6fDCKSs2r6Tqi7uOW44p6ASiET63i57UlSoqeXrb43MXbJG5yQbxiMWw+E/B2WbULTisnOJt26UQCW6fx78QX5ElABPpqBN0SFxp+dpk3VN8kkGdPbdw7urIMQKswMNsMQn6GGGyHb9stnIdk13DvcpGsbA3MqWNI1GwtrOjz/+T7vz0nfTppTRKBCdxApmVxtyRjEOPLjrf49I96sf88EulNL2ufEqaFY0VuFnl/CXhtxKJB5DoSiIt9JJZdrzEXNiK41hecZilzV0Wott/a9OwWyyM28MSbO2eDLwB1441/30M8ZdRN4L6BOsfoYZomkRg4OLE/POWYc8dHiK07OBoVD3ncUy6QcsPSK+D6YHsgOK3M7aVsY1IJPdaXqcQMEdqMJ+U+mZpmCXVcFcVgFQhr3ZnKXh2BTbcfdppxb8NBLEwvy4y5z33oFq1FGBEzSoT4Hg3AlL6isB4UfUrKWQIx60GupM1W4J7hIFYY2NV1b9T5e9e0/ufFVqdV0byZk1Y4g5Uzty7UmXEg=
X-Forefront-Antispam-Report: CIP:151.1.184.193; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:asas054.asem.intra; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(39850400004)(136003)(346002)(396003)(376002)(230922051799003)(82310400011)(64100799003)(451199024)(186009)(1800799009)(46966006)(36840700001)(2906002)(40480700001)(30864003)(966005)(478600001)(5660300002)(41300700001)(4326008)(8936002)(8676002)(110136005)(316002)(70586007)(70206006)(36860700001)(83380400001)(47076005)(36756003)(86362001)(2616005)(356005)(81166007)(82740400003)(336012)(1076003)(26005)(6666004)(107886003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 13:55:04.9534 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afd9dee7-2f3c-4162-3a50-08dbd17429cd
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2; Ip=[151.1.184.193];
 Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR01MB6484
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Flavio Suligoi <f.suligoi@asem.it>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Monolithic Power (MPS) MP3309C is a WLED step-up converter, featuring a
programmable switching frequency to optimize efficiency.
The brightness can be controlled either by I2C commands (called "analog"
mode) or by a PWM input signal (PWM mode).
This driver supports both modes.

For DT configuration details, please refer to:
- Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml

The datasheet is available at:
- https://www.monolithicpower.com/en/mp3309c.html

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---

v5:
 - checked and resend for updated kernel 6.6.0-rc1
v4:
 - add brightness-levels property
 - force fixed 32 brightness levels (0..31) in analog-i2c dimming mode
 - remove useless irq and reset_gpio from mp3309c_chip structure
v3:
 - fix SPDX obsolete spelling
 - in mp3309c_bl_update_status, change from msleep_interruptible() to msleep()
   and improve the related comment
v2:
 - fix dependecies in Kconfig
 - fix Kconfig MP3309C entry order
 - remove switch-on-delay-ms property
 - remove optional gpio property to reset external devices
 - remove dimming-mode property (the analog-i2c dimming mode is the default; the
   presence of the pwms property, in DT, selects automatically the pwm dimming
   mode)
 - substitute three boolean properties, used for the overvoltage-protection
   values, with a single enum property
 - drop simple tracing messages
 - use dev_err_probe() in probe function
 - change device name from mp3309c_bl to the simple mp3309c
 - remove shutdown function
v1:
 - first version

 MAINTAINERS                       |   7 +
 drivers/video/backlight/Kconfig   |  11 +
 drivers/video/backlight/Makefile  |   1 +
 drivers/video/backlight/mp3309c.c | 443 ++++++++++++++++++++++++++++++
 4 files changed, 462 insertions(+)
 create mode 100644 drivers/video/backlight/mp3309c.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..3d23b869e2aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14474,6 +14474,13 @@ S:	Maintained
 F:	Documentation/driver-api/tty/moxa-smartio.rst
 F:	drivers/tty/mxser.*
 
+MP3309C BACKLIGHT DRIVER
+M:	Flavio Suligoi <f.suligoi@asem.it>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
+F:	drivers/video/backlight/mp3309c.c
+
 MR800 AVERMEDIA USB FM RADIO DRIVER
 M:	Alexey Klimov <klimov.linux@gmail.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 51387b1ef012..1144a54a35c0 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -402,6 +402,17 @@ config BACKLIGHT_LP8788
 	help
 	  This supports TI LP8788 backlight driver.
 
+config BACKLIGHT_MP3309C
+	tristate "Backlight Driver for MPS MP3309C"
+	depends on I2C && PWM
+	select REGMAP_I2C
+	help
+	  This supports MPS MP3309C backlight WLED driver in both PWM and
+	  analog/I2C dimming modes.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called mp3309c.
+
 config BACKLIGHT_PANDORA
 	tristate "Backlight driver for Pandora console"
 	depends on TWL4030_CORE
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index f72e1c3c59e9..1af583de665b 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -44,6 +44,7 @@ obj-$(CONFIG_BACKLIGHT_LP855X)		+= lp855x_bl.o
 obj-$(CONFIG_BACKLIGHT_LP8788)		+= lp8788_bl.o
 obj-$(CONFIG_BACKLIGHT_LV5207LP)	+= lv5207lp.o
 obj-$(CONFIG_BACKLIGHT_MAX8925)		+= max8925_bl.o
+obj-$(CONFIG_BACKLIGHT_MP3309C)		+= mp3309c.o
 obj-$(CONFIG_BACKLIGHT_MT6370)		+= mt6370-backlight.o
 obj-$(CONFIG_BACKLIGHT_OMAP1)		+= omap1_bl.o
 obj-$(CONFIG_BACKLIGHT_PANDORA)		+= pandora_bl.o
diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/mp3309c.c
new file mode 100644
index 000000000000..3fe4469ef43f
--- /dev/null
+++ b/drivers/video/backlight/mp3309c.c
@@ -0,0 +1,443 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for MPS MP3309C White LED driver with I2C interface
+ *
+ * This driver support both analog (by I2C commands) and PWM dimming control
+ * modes.
+ *
+ * Copyright (C) 2023 ASEM Srl
+ * Author: Flavio Suligoi <f.suligoi@asem.it>
+ *
+ * Based on pwm_bl.c
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/pwm.h>
+#include <linux/regmap.h>
+
+#define REG_I2C_0	0x00
+#define REG_I2C_1	0x01
+
+#define REG_I2C_0_EN	0x80
+#define REG_I2C_0_D0	0x40
+#define REG_I2C_0_D1	0x20
+#define REG_I2C_0_D2	0x10
+#define REG_I2C_0_D3	0x08
+#define REG_I2C_0_D4	0x04
+#define REG_I2C_0_RSRV1	0x02
+#define REG_I2C_0_RSRV2	0x01
+
+#define REG_I2C_1_RSRV1	0x80
+#define REG_I2C_1_DIMS	0x40
+#define REG_I2C_1_SYNC	0x20
+#define REG_I2C_1_OVP0	0x10
+#define REG_I2C_1_OVP1	0x08
+#define REG_I2C_1_VOS	0x04
+#define REG_I2C_1_LEDO	0x02
+#define REG_I2C_1_OTP	0x01
+
+#define ANALOG_I2C_NUM_LEVELS	32		/* 0..31 */
+#define ANALOG_I2C_REG_MASK	0x7c
+
+#define MP3309C_PWM_DEFAULT_NUM_LEVELS	256	/* 0..255 */
+
+enum mp3309c_status_value {
+	FIRST_POWER_ON,
+	BACKLIGHT_OFF,
+	BACKLIGHT_ON,
+};
+
+enum mp3309c_dimming_mode_value {
+	DIMMING_PWM,
+	DIMMING_ANALOG_I2C,
+};
+
+struct mp3309c_platform_data {
+	unsigned int max_brightness;
+	unsigned int default_brightness;
+	unsigned int *levels;
+	u8  dimming_mode;
+	u8  over_voltage_protection;
+	bool sync_mode;
+	u8 status;
+};
+
+struct mp3309c_chip {
+	struct device *dev;
+	struct mp3309c_platform_data *pdata;
+	struct backlight_device *bl;
+	struct gpio_desc *enable_gpio;
+	struct regmap *regmap;
+	struct pwm_device *pwmd;
+};
+
+static const struct regmap_config mp3309c_regmap = {
+	.name = "mp3309c_regmap",
+	.reg_bits = 8,
+	.reg_stride = 1,
+	.val_bits = 8,
+	.max_register = REG_I2C_1,
+};
+
+static int mp3309c_enable_device(struct mp3309c_chip *chip)
+{
+	u8 reg_val;
+	int ret;
+
+	/* I2C register #0 - Device enable */
+	ret = regmap_update_bits(chip->regmap, REG_I2C_0, REG_I2C_0_EN,
+				 REG_I2C_0_EN);
+	if (ret)
+		return ret;
+
+	/*
+	 * I2C register #1 - Set working mode:
+	 *  - set one of the two dimming mode:
+	 *    - PWM dimming using an external PWM dimming signal
+	 *    - analog dimming using I2C commands
+	 *  - enable/disable synchronous mode
+	 *  - set overvoltage protection (OVP)
+	 */
+	reg_val = 0x00;
+	if (chip->pdata->dimming_mode == DIMMING_PWM)
+		reg_val |= REG_I2C_1_DIMS;
+	if (chip->pdata->sync_mode)
+		reg_val |= REG_I2C_1_SYNC;
+	reg_val |= chip->pdata->over_voltage_protection;
+	ret = regmap_write(chip->regmap, REG_I2C_1, reg_val);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int mp3309c_bl_update_status(struct backlight_device *bl)
+{
+	struct mp3309c_chip *chip = bl_get_data(bl);
+	int brightness = backlight_get_brightness(bl);
+	struct pwm_state pwmstate;
+	unsigned int analog_val, bits_val;
+	int i, ret;
+
+	if (chip->pdata->dimming_mode == DIMMING_PWM) {
+		/*
+		 * PWM control mode
+		 */
+		pwm_get_state(chip->pwmd, &pwmstate);
+		pwm_set_relative_duty_cycle(&pwmstate,
+					    chip->pdata->levels[brightness],
+					    chip->pdata->levels[chip->pdata->max_brightness]);
+		pwmstate.enabled = true;
+		ret = pwm_apply_state(chip->pwmd, &pwmstate);
+		if (ret)
+			return ret;
+
+		switch (chip->pdata->status) {
+		case FIRST_POWER_ON:
+		case BACKLIGHT_OFF:
+			/*
+			 * After 20ms of low pwm signal level, the chip turns
+			 * off automatically. In this case, before enabling the
+			 * chip again, we must wait about 10ms for pwm signal to
+			 * stabilize.
+			 */
+			if (brightness > 0) {
+				msleep(10);
+				mp3309c_enable_device(chip);
+				chip->pdata->status = BACKLIGHT_ON;
+			} else {
+				chip->pdata->status = BACKLIGHT_OFF;
+			}
+			break;
+		case BACKLIGHT_ON:
+			if (brightness == 0)
+				chip->pdata->status = BACKLIGHT_OFF;
+			break;
+		}
+	} else {
+		/*
+		 * Analog (by I2C command) control mode
+		 *
+		 * The first time, before setting brightness, we must enable the
+		 * device
+		 */
+		if (chip->pdata->status == FIRST_POWER_ON)
+			mp3309c_enable_device(chip);
+
+		/*
+		 * Dimming mode I2C command (fixed dimming range 0..31)
+		 *
+		 * The 5 bits of the dimming analog value D4..D0 is allocated
+		 * in the I2C register #0, in the following way:
+		 *
+		 *     +--+--+--+--+--+--+--+--+
+		 *     |EN|D0|D1|D2|D3|D4|XX|XX|
+		 *     +--+--+--+--+--+--+--+--+
+		 */
+		analog_val = brightness;
+		bits_val = 0;
+		for (i = 0; i <= 5; i++)
+			bits_val += ((analog_val >> i) & 0x01) << (6 - i);
+		ret = regmap_update_bits(chip->regmap, REG_I2C_0,
+					 ANALOG_I2C_REG_MASK, bits_val);
+		if (ret)
+			return ret;
+
+		if (brightness > 0)
+			chip->pdata->status = BACKLIGHT_ON;
+		else
+			chip->pdata->status = BACKLIGHT_OFF;
+	}
+
+	return 0;
+}
+
+static const struct backlight_ops mp3309c_bl_ops = {
+	.update_status = mp3309c_bl_update_status,
+};
+
+static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
+				 struct mp3309c_platform_data *pdata)
+{
+	struct device_node *node = chip->dev->of_node;
+	struct property *prop_pwms, *prop_levels;
+	int length = 0;
+	int ret, i;
+	unsigned int num_levels, tmp_value;
+
+	if (!node) {
+		dev_err(chip->dev, "failed to get DT node\n");
+		return -ENODEV;
+	}
+
+	/*
+	 * Dimming mode: the MP3309C provides two dimming control mode:
+	 *
+	 * - PWM mode
+	 * - Analog by I2C control mode (default)
+	 *
+	 * I2C control mode is assumed as default but, if the pwms property is
+	 * found in the backlight node, the mode switches to PWM mode.
+	 */
+	pdata->dimming_mode = DIMMING_ANALOG_I2C;
+	prop_pwms = of_find_property(node, "pwms", &length);
+	if (prop_pwms) {
+		chip->pwmd = devm_pwm_get(chip->dev, NULL);
+		if (IS_ERR(chip->pwmd))
+			return dev_err_probe(chip->dev, PTR_ERR(chip->pwmd),
+					     "error getting pwm data\n");
+		pdata->dimming_mode = DIMMING_PWM;
+		pwm_apply_args(chip->pwmd);
+	}
+
+	/*
+	 * In I2C control mode the dimming levels (0..31) are fixed by the
+	 * hardware, while in PWM control mode they can be chosen by the user,
+	 * to allow nonlinear mappings.
+	 */
+	if  (pdata->dimming_mode == DIMMING_ANALOG_I2C) {
+		/*
+		 * Analog (by I2C commands) control mode: fixed 0..31 brightness
+		 * levels
+		 */
+		num_levels = ANALOG_I2C_NUM_LEVELS;
+
+		/* Enable GPIO used in I2C dimming mode only */
+		chip->enable_gpio = devm_gpiod_get(chip->dev, "enable",
+						   GPIOD_OUT_HIGH);
+		if (IS_ERR(chip->enable_gpio))
+			return dev_err_probe(chip->dev,
+					     PTR_ERR(chip->enable_gpio),
+					     "error getting enable gpio\n");
+	} else {
+		/*
+		 * PWM control mode: check for brightness level in DT
+		 */
+		prop_levels = of_find_property(node, "brightness-levels",
+					       &length);
+		if (prop_levels) {
+			/* Read brightness levels from DT */
+			num_levels = length / sizeof(u32);
+			if (num_levels < 2)
+				return -EINVAL;
+		} else {
+			/* Use default brightness levels */
+			num_levels = MP3309C_PWM_DEFAULT_NUM_LEVELS;
+		}
+	}
+
+	/* Fill brightness levels array */
+	pdata->levels = devm_kcalloc(chip->dev, num_levels,
+				     sizeof(*pdata->levels), GFP_KERNEL);
+	if (!pdata->levels)
+		return -ENOMEM;
+	if (prop_levels) {
+		ret = of_property_read_u32_array(node, "brightness-levels",
+						 pdata->levels,
+						 num_levels);
+		if (ret < 0)
+			return ret;
+	} else {
+		for (i = 0; i < num_levels; i++)
+			pdata->levels[i] = i;
+	}
+
+	pdata->max_brightness = num_levels - 1;
+
+	ret = of_property_read_u32(node, "default-brightness",
+				   &pdata->default_brightness);
+	if (ret)
+		pdata->default_brightness = pdata->max_brightness;
+	if (pdata->default_brightness > pdata->max_brightness) {
+		dev_err(chip->dev,
+			"default brightness exceeds max brightness\n");
+		pdata->default_brightness = pdata->max_brightness;
+	}
+
+	/*
+	 * Over-voltage protection (OVP)
+	 *
+	 * This (optional) property values are:
+	 *
+	 *  - 13.5V
+	 *  - 24V
+	 *  - 35.5V (hardware default setting)
+	 *
+	 * If missing, the default value for OVP is 35.5V
+	 */
+	pdata->over_voltage_protection = REG_I2C_1_OVP1;
+	if (!of_property_read_u32(node, "mps,overvoltage-protection-microvolt",
+				  &tmp_value)) {
+		switch (tmp_value) {
+		case 13500000:
+			pdata->over_voltage_protection = 0x00;
+			break;
+		case 24000000:
+			pdata->over_voltage_protection = REG_I2C_1_OVP0;
+			break;
+		case 35500000:
+			pdata->over_voltage_protection = REG_I2C_1_OVP1;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	/* Synchronous (default) and non-synchronous mode */
+	pdata->sync_mode = true;
+	if (of_property_read_bool(node, "mps,no-sync-mode"))
+		pdata->sync_mode = false;
+
+	return 0;
+}
+
+static int mp3309c_probe(struct i2c_client *client)
+{
+	struct mp3309c_platform_data *pdata = dev_get_platdata(&client->dev);
+	struct mp3309c_chip *chip;
+	struct backlight_properties props;
+	struct pwm_state pwmstate;
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		dev_err(&client->dev, "failed to check i2c functionality\n");
+		return -EOPNOTSUPP;
+	}
+
+	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->dev = &client->dev;
+
+	chip->regmap = devm_regmap_init_i2c(client, &mp3309c_regmap);
+	if (IS_ERR(chip->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(chip->regmap),
+				     "failed to allocate register map\n");
+
+	i2c_set_clientdata(client, chip);
+
+	if (!pdata) {
+		pdata = devm_kzalloc(chip->dev, sizeof(*pdata), GFP_KERNEL);
+		if (!pdata)
+			return -ENOMEM;
+
+		ret = pm3309c_parse_dt_node(chip, pdata);
+		if (ret)
+			return ret;
+	}
+	chip->pdata = pdata;
+
+	/* Backlight properties */
+	props.brightness = pdata->default_brightness;
+	props.max_brightness = pdata->max_brightness;
+	props.scale = BACKLIGHT_SCALE_LINEAR;
+	props.type = BACKLIGHT_RAW;
+	props.power = FB_BLANK_UNBLANK;
+	props.fb_blank = FB_BLANK_UNBLANK;
+	chip->bl = devm_backlight_device_register(chip->dev, "mp3309c",
+						  chip->dev, chip,
+						  &mp3309c_bl_ops, &props);
+	if (IS_ERR(chip->bl))
+		return dev_err_probe(chip->dev, PTR_ERR(chip->bl),
+				     "error registering backlight device\n");
+
+	/* In PWM dimming mode, enable pwm device */
+	if (chip->pdata->dimming_mode == DIMMING_PWM) {
+		pwm_init_state(chip->pwmd, &pwmstate);
+		pwm_set_relative_duty_cycle(&pwmstate,
+					    chip->pdata->default_brightness,
+					    chip->pdata->max_brightness);
+		pwmstate.enabled = true;
+		ret = pwm_apply_state(chip->pwmd, &pwmstate);
+		if (ret)
+			return dev_err_probe(chip->dev, ret,
+					     "error setting pwm device\n");
+	}
+
+	chip->pdata->status = FIRST_POWER_ON;
+	backlight_update_status(chip->bl);
+
+	return 0;
+}
+
+static void mp3309c_remove(struct i2c_client *client)
+{
+	struct mp3309c_chip *chip = i2c_get_clientdata(client);
+	struct backlight_device *bl = chip->bl;
+
+	bl->props.power = FB_BLANK_POWERDOWN;
+	bl->props.brightness = 0;
+	backlight_update_status(chip->bl);
+}
+
+static const struct of_device_id mp3309c_match_table[] = {
+	{ .compatible = "mps,mp3309c", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, mp3309c_match_table);
+
+static const struct i2c_device_id mp3309c_id[] = {
+	{ "mp3309c", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, mp3309c_id);
+
+static struct i2c_driver mp3309c_i2c_driver = {
+	.driver	= {
+			.name		= KBUILD_MODNAME,
+			.of_match_table	= mp3309c_match_table,
+	},
+	.probe		= mp3309c_probe,
+	.remove		= mp3309c_remove,
+	.id_table	= mp3309c_id,
+};
+
+module_i2c_driver(mp3309c_i2c_driver);
+
+MODULE_DESCRIPTION("Backlight Driver for MPS MP3309C");
+MODULE_AUTHOR("Flavio Suligoi <f.suligoi@asem.it>");
+MODULE_LICENSE("GPL");
-- 
2.34.1

