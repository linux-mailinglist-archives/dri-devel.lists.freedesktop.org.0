Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 551969557B0
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 13:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE5610E09C;
	Sat, 17 Aug 2024 11:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="Wh8ozI+f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2063.outbound.protection.outlook.com [40.92.102.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C25E10E09C
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 11:52:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VspMEWQFV0ZfRtAitO4oILXS3CxKZXZAbelO/34lOdxZN8cXqUhwRDkCYU7HLsPpbRz/j657ac5nWhAsTNXubTqT8rli6SOuzJ6V+L2reg5EfHT4v5jD5f/FCETRHSE1HNHglh+XTBEUSH6TwPkVxDHmViUjNR/oqXs0w9WwAAf/lvdT8+DZ+QdP6wiv4bGb+PVOtuUTUns0gaMQGBHtUjgPUbG+biUMsMITkMHCFSSPwoEM/8mDAQVCWDTAx+jXaPEO9st45XyQFLB/s4JBkMLkhBCa/1MLhMWsMnCkYh3fx1lB/oRXmqo4PGyb2IKPT3v4+ggjhqAx17VCQqbpvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RUYCikraQFlzfLUIl+MeSYsG9C4rmRBPfP+8woqoPk=;
 b=j5kbBCn7c4dG1QBQ7SVwuTge1Y7y61Oo+/HFGWnozats7bCYIvc0pJqJN136DvcOFizU1bjOxIOpdXcrYlUIgK7FpdRRoj0rae5bQinwlZ/kkVpgKZTa6PDH32YUejyZodIfuhy/bGwq3vCT8sgZCt1+WxtuU4ZIxmWseuoXyiCrJ+Sat5qN+MValDSwCeAWcuqS91Sa1DeiDqjtBYbx597sXKRUrU5P+bB+/9cN/JJzvTsOmTxqmg9VOOwScHuRgYew5c3V3cR11a8YY4iO6sK0yd3xtCx9vJ4jMjKfYHKKjvukaQ5hEq7iM+IaUDjHV0O6qsPOM6+dKVwIwYTw3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RUYCikraQFlzfLUIl+MeSYsG9C4rmRBPfP+8woqoPk=;
 b=Wh8ozI+fhaUHDxQQB9c4fdNAswC62Gcv7HdKtJr3y6d50DGVwlfdDlLmHCYIR7yiVmtRKhg16rJVMnYkqf3o2UC8A9ni0uw6yiVbMkMl7/ur57AI6zU97V27pKhgGd7O0FplaXvJGWNbMBxjvO2gYyLC4M2cCcr+B/xVKc8m8jMFTNd4GDE/iWhg5zd3DPpl2MCDSCB+un92Fku2x3tmlp/uG8BQjyd1JWMCBvcH6dY1LqmlzNRgQhVJHcJdujsAYDYCvHTQ4wIQMI7hWDxBUUz5x6aXgd9BBm//MmiPhZI1MQKpoG+RAJInQG1eW6l8U7kxRCfbs/qeWHD1Ibu01w==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN0P287MB0120.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:e3::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.18; Sat, 17 Aug 2024 11:52:22 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%6]) with mapi id 15.20.7875.016; Sat, 17 Aug 2024
 11:52:22 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>,
 =?iso-8859-1?Q?Thomas_Wei=DFschuh?= <thomas@t-8ch.de>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
 <kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 10/10] drm/tiny: add driver for Apple Touch Bars in x86 Macs
Thread-Topic: [PATCH v5 10/10] drm/tiny: add driver for Apple Touch Bars in
 x86 Macs
Thread-Index: AQHa8JvrJkw/kjXWmEuT3rJn6wIjMw==
Date: Sat, 17 Aug 2024 11:52:22 +0000
Message-ID: <3C9E8938-32EC-44AC-A783-3BFDE2F01290@live.com>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
In-Reply-To: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [1KFCbA5awKrFU4tR3ZJPHWa9xSG/S0xMcOTrkYSYRz1O7WCmTQdluWSrh94vGuOqcT4OY+Vm238=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN0P287MB0120:EE_
x-ms-office365-filtering-correlation-id: a4ad0fd6-d483-43ff-4cf8-08dcbeb30de7
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|8060799006|15080799003|461199028|102099032|3412199025|4302099013|440099028|1602099012;
x-microsoft-antispam-message-info: PU8iHMlRKONc2L9wAUGlq8N06Wx6nH2ZCtqG6tK4Ngme8GqtrDAQqId3xf8ZpOuKu5IXCSciqn3it1RTPC5q/c7OGMSsCOAugsARtiQvF6tiKPI09bWQJY2z10XukfqdJ19FKKXIQHzQ3NZokRZcxm3cic/WEhBEwWkYMCMN1HLaKD5q6bdWpibJe952wArpsi/NPbIJNpiepwGGmqcQUaL1uSul6uyr3DdPNFKtdzhiJLoxemup0BehuyJoGliQ9x4G03dry9M23/KFgPuOoelOm+M8Km/OvYU675S3ISfDuQqanIAsK08xKV2ZbicYVZQsclaaG96fd2zEORt7XuoH40q9rdZE+g/ffum0sK5O7qTAKKtpjk+0zvPHh6AMWPQi6O3lOd8F2MTs1/SlsQHCVgneWXZZWimrHQdonAVM4mZSELf9kFfdVgnGsw3atxgAxpjgbfHQ9c//hM9cfG0VyBONeaWIZFcaRxOqUCvWpPmcRob/thhE9wh5GPd5/xi7RiATKtPNb6iStc8EmmQ8E0B+47zJfrXlwjZmDVRc5W42deTVhnIDHQUq00V6usuuFYdk1nq7XZeYMzrzPwtPdWWGo2psb6EWrVthoLOW4HHOgOMnxc1Y/HD9oazQe2F3kBuJumXtd4ww055SPgLF/nvp9KdxsZeTFu8tvZjFgU4vYkzGXHnT+g4C0wXYvKhVrryCuiIoRmjODpWYcF62ZOK0ZPrsSXk+TF/jFk7zo9i3RbrPx1gTof3qK/zSOO6u8P4BThvdwez3/t4sY/DKuzyz5VptkstF1DoJ7r8=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?64LyikjrL2NRascgfnTzP8vEvD8O/Ix6Nh7vcC9nfCXeChJlXJTabYqCkM?=
 =?iso-8859-1?Q?tRp2FEZ0TJuQjPsxp7gq2QmvwJkKqqEUf0qLl742eukdz2eQPTkauk/VyM?=
 =?iso-8859-1?Q?DUj/XTrg6bU39+VzBz5BrKoxaNRtnSV8fGjLuBPbmKvfhtrkEO/Z8/X1uN?=
 =?iso-8859-1?Q?2BwIq5kKHfKNilgKkkLh8KgbFJXsZZ01S3jBhyVQb/lFTMlvxCJYbY+1rV?=
 =?iso-8859-1?Q?9x58ZrSgYRYofX5rDNpPpkOMw/pswQVNpMJQTNqHLQKqGBOL/mKP8+jM/u?=
 =?iso-8859-1?Q?aUJPMEkKHMQYaSbiCZ9D+XUl/Uk27ao20FOOHVme9gXvaem6H9e4IlRSpn?=
 =?iso-8859-1?Q?G9dUeggczftlqI1V+oNrS3gTeEJc7F21eLpLZ3Wg++2GYszxtpHha2ECCu?=
 =?iso-8859-1?Q?6q0ePx6ERYf1ZK3ogWBFWJdAbwbe2XktsaiF4drEm2d9cgx/6d6sv6S8hH?=
 =?iso-8859-1?Q?Wzfz3ZDpL8Ayn4a6pIxJejyaiCvruvJMLWiMcGEWvSv6ZvIy4YqOU0zHcR?=
 =?iso-8859-1?Q?/nAniY6o+kOUOxFJbe4ZRdcmsrP/04GNWu3Qut4Ury/Y811qtS6fy3rXvD?=
 =?iso-8859-1?Q?FRiydUNi7RKPmZfQgNm7EhufEPl2NVw1Mju4CMU28rmEFhTWzs9nOhh1Nk?=
 =?iso-8859-1?Q?NAGiMhfojh59pn4nqWwOI5+iFbK+3XUTdF/46jIFNIlafm92E/Eie2cwxp?=
 =?iso-8859-1?Q?+GFNkLj6y6uf/gmzrs61O//hwLAnaety/PS7yo/qEIubJ/2gmfpTdV52IT?=
 =?iso-8859-1?Q?poppUDg4sdS4yI2rsDmbJr9DbHwQ9Ovyp9OF6lOQjFSy2jdQDX3atr5Kwr?=
 =?iso-8859-1?Q?/W6xF8hw/rOTp4t6X7Bee9S1a5LLYWM9tnW05c3OD/kPoRRcRyyO4Rz874?=
 =?iso-8859-1?Q?4vH9lJ7nnnKMwcXPnUcVTAEEU//jRBckoJDacyxStl8co0NvN9kvWn0xAj?=
 =?iso-8859-1?Q?jV6BZfobGrVdvl8BCjZuhHoTJMwEYIKR4de38giuPrGlWvXbLdi42dyvk6?=
 =?iso-8859-1?Q?Vr8u5WTKAY5XxWexBSeDhox2o33dvFxYl5hZMurtlM/uKBm4nqoUApGfCi?=
 =?iso-8859-1?Q?4rgGuHikNTl+r0UPnv1o1RqaFJmArABXkbIDWv7bzDRebuMTsy1hlelqPH?=
 =?iso-8859-1?Q?NvBrGQpFQPkDJ/cF7J3icBUBI5VTpYzYjh7HsBXhIoQLBngawAPkaKEi8S?=
 =?iso-8859-1?Q?dGv+AhYjsj33Ss1XAT2JCZAKBq/7kw9RGI0m+PCnE2dSnxdkh7hlGRbuvF?=
 =?iso-8859-1?Q?DhlFWZ8ktvkIzIkAe2ao4d2d5ursIEukbs0R1KaCLGbGH5jR4Eh5W+PuS8?=
 =?iso-8859-1?Q?2gFBPJ6A+7/9DZKk213939GU+JY1ko3hOwQbhndFdcepaLowHjkMJsBMm4?=
 =?iso-8859-1?Q?wjD+xV4N4A?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5458A91227687840B844127069B3ED23@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ad0fd6-d483-43ff-4cf8-08dcbeb30de7
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2024 11:52:22.1344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0120
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

From: Kerem Karabay <kekrby@gmail.com>

The Touch Bars found on x86 Macs support two USB configurations: one
where the device presents itself as a HID keyboard and can display
predefined sets of keys, and one where the operating system has full
control over what is displayed. This commit adds support for the display
functionality of the second configuration.

Note that this driver has only been tested on T2 Macs, and only includes
the USB device ID for these devices. Testing on T1 Macs would be
appreciated.

Credit goes to @imbushuo on GitHub for reverse engineering most of the
protocol.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 MAINTAINERS                       |   6 +
 drivers/gpu/drm/tiny/Kconfig      |  12 +
 drivers/gpu/drm/tiny/Makefile     |   1 +
 drivers/gpu/drm/tiny/appletbdrm.c | 624 ++++++++++++++++++++++++++++++
 4 files changed, 643 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/appletbdrm.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8766f3e5e..2665e6c57 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6889,6 +6889,12 @@ S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/sun4i/sun8i*
=20
+DRM DRIVER FOR APPLE TOUCH BARS
+M:	Kerem Karabay <kekrby@gmail.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	drivers/gpu/drm/tiny/appletbdrm.c
+
 DRM DRIVER FOR ARM PL111 CLCD
 S:	Orphan
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index f6889f649..559a97bce 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -1,5 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0-only
=20
+config DRM_APPLETBDRM
+	tristate "DRM support for Apple Touch Bars"
+	depends on DRM && USB && MMU
+	select DRM_KMS_HELPER
+	select DRM_GEM_SHMEM_HELPER
+	help
+	  Say Y here if you want support for the display of Touch Bars on x86
+	  MacBook Pros.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called appletbdrm.
+
 config DRM_ARCPGU
 	tristate "ARC PGU"
 	depends on DRM && OF
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 76dde89a0..9a1b412e7 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
=20
+obj-$(CONFIG_DRM_APPLETBDRM)		+=3D appletbdrm.o
 obj-$(CONFIG_DRM_ARCPGU)		+=3D arcpgu.o
 obj-$(CONFIG_DRM_BOCHS)			+=3D bochs.o
 obj-$(CONFIG_DRM_CIRRUS_QEMU)		+=3D cirrus.o
diff --git a/drivers/gpu/drm/tiny/appletbdrm.c b/drivers/gpu/drm/tiny/apple=
tbdrm.c
new file mode 100644
index 000000000..b9440ce00
--- /dev/null
+++ b/drivers/gpu/drm/tiny/appletbdrm.c
@@ -0,0 +1,624 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Apple Touch Bar DRM Driver
+ *
+ * Copyright (c) 2023 Kerem Karabay <kekrby@gmail.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <asm/unaligned.h>
+
+#include <linux/usb.h>
+#include <linux/module.h>
+
+#include <drm/drm_drv.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_format_helper.h>
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+
+#define _APPLETBDRM_FOURCC(s)		(((s)[0] << 24) | ((s)[1] << 16) | ((s)[2] =
<< 8) | (s)[3])
+#define APPLETBDRM_FOURCC(s)		_APPLETBDRM_FOURCC(#s)
+
+#define APPLETBDRM_PIXEL_FORMAT		APPLETBDRM_FOURCC(RGBA) /* The actual for=
mat is BGR888 */
+#define APPLETBDRM_BITS_PER_PIXEL	24
+
+#define APPLETBDRM_MSG_CLEAR_DISPLAY	APPLETBDRM_FOURCC(CLRD)
+#define APPLETBDRM_MSG_GET_INFORMATION	APPLETBDRM_FOURCC(GINF)
+#define APPLETBDRM_MSG_UPDATE_COMPLETE	APPLETBDRM_FOURCC(UDCL)
+#define APPLETBDRM_MSG_SIGNAL_READINESS	APPLETBDRM_FOURCC(REDY)
+
+#define APPLETBDRM_BULK_MSG_TIMEOUT	1000
+
+#define drm_to_adev(_drm)		container_of(_drm, struct appletbdrm_device, dr=
m)
+#define adev_to_udev(adev)		interface_to_usbdev(to_usb_interface(adev->dev=
))
+
+struct appletbdrm_device {
+	struct device *dev;
+
+	u8 in_ep;
+	u8 out_ep;
+
+	u32 width;
+	u32 height;
+
+	struct drm_device drm;
+	struct drm_display_mode mode;
+	struct drm_connector connector;
+	struct drm_simple_display_pipe pipe;
+
+	bool readiness_signal_received;
+};
+
+struct appletbdrm_request_header {
+	__le16 unk_00;
+	__le16 unk_02;
+	__le32 unk_04;
+	__le32 unk_08;
+	__le32 size;
+} __packed;
+
+struct appletbdrm_response_header {
+	u8 unk_00[16];
+	u32 msg;
+} __packed;
+
+struct appletbdrm_simple_request {
+	struct appletbdrm_request_header header;
+	u32 msg;
+	u8 unk_14[8];
+	__le32 size;
+} __packed;
+
+struct appletbdrm_information {
+	struct appletbdrm_response_header header;
+	u8 unk_14[12];
+	__le32 width;
+	__le32 height;
+	u8 bits_per_pixel;
+	__le32 bytes_per_row;
+	__le32 orientation;
+	__le32 bitmap_info;
+	u32 pixel_format;
+	__le32 width_inches;	/* floating point */
+	__le32 height_inches;	/* floating point */
+} __packed;
+
+struct appletbdrm_frame {
+	__le16 begin_x;
+	__le16 begin_y;
+	__le16 width;
+	__le16 height;
+	__le32 buf_size;
+	u8 buf[];
+} __packed;
+
+struct appletbdrm_fb_request_footer {
+	u8 unk_00[12];
+	__le32 unk_0c;
+	u8 unk_10[12];
+	__le32 unk_1c;
+	__le64 timestamp;
+	u8 unk_28[12];
+	__le32 unk_34;
+	u8 unk_38[20];
+	__le32 unk_4c;
+} __packed;
+
+struct appletbdrm_fb_request {
+	struct appletbdrm_request_header header;
+	__le16 unk_10;
+	u8 msg_id;
+	u8 unk_13[29];
+	/*
+	 * Contents of `data`:
+	 * - struct appletbdrm_frame frames[];
+	 * - struct appletbdrm_fb_request_footer footer;
+	 * - padding to make the total size a multiple of 16
+	 */
+	u8 data[];
+} __packed;
+
+struct appletbdrm_fb_request_response {
+	struct appletbdrm_response_header header;
+	u8 unk_14[12];
+	__le64 timestamp;
+} __packed;
+
+static int appletbdrm_send_request(struct appletbdrm_device *adev,
+				   struct appletbdrm_request_header *request, size_t size)
+{
+	struct usb_device *udev =3D adev_to_udev(adev);
+	struct drm_device *drm =3D &adev->drm;
+	int ret, actual_size;
+
+	ret =3D usb_bulk_msg(udev, usb_sndbulkpipe(udev, adev->out_ep),
+			   request, size, &actual_size, APPLETBDRM_BULK_MSG_TIMEOUT);
+	if (ret) {
+		drm_err(drm, "Failed to send message (%pe)\n", ERR_PTR(ret));
+		return ret;
+	}
+
+	if (actual_size !=3D size) {
+		drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
+			actual_size, size);
+		return -EIO;
+	}
+
+	return ret;
+}
+
+static int appletbdrm_read_response(struct appletbdrm_device *adev,
+				    struct appletbdrm_response_header *response,
+				    size_t size, u32 expected_response)
+{
+	struct usb_device *udev =3D adev_to_udev(adev);
+	struct drm_device *drm =3D &adev->drm;
+	int ret, actual_size;
+
+retry:
+	ret =3D usb_bulk_msg(udev, usb_rcvbulkpipe(udev, adev->in_ep),
+			   response, size, &actual_size, APPLETBDRM_BULK_MSG_TIMEOUT);
+	if (ret) {
+		drm_err(drm, "Failed to read response (%pe)\n", ERR_PTR(ret));
+		return ret;
+	}
+
+	/*
+	 * The device responds to the first request sent in a particular
+	 * timeframe after the USB device configuration is set with a readiness
+	 * signal, in which case the response should be read again
+	 */
+	if (response->msg =3D=3D APPLETBDRM_MSG_SIGNAL_READINESS) {
+		if (!adev->readiness_signal_received) {
+			adev->readiness_signal_received =3D true;
+			goto retry;
+		}
+
+		drm_err(drm, "Encountered unexpected readiness signal\n");
+		return -EIO;
+	}
+
+	if (actual_size !=3D size) {
+		drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
+			actual_size, size);
+		return -EIO;
+	}
+
+	if (response->msg !=3D expected_response) {
+		drm_err(drm, "Unexpected response from device (expected %p4ch found %p4c=
h)\n",
+			&expected_response, &response->msg);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int appletbdrm_send_msg(struct appletbdrm_device *adev, u32 msg)
+{
+	struct appletbdrm_simple_request *request;
+	int ret;
+
+	request =3D kzalloc(sizeof(*request), GFP_KERNEL);
+	if (!request)
+		return -ENOMEM;
+
+	request->header.unk_00 =3D cpu_to_le16(2);
+	request->header.unk_02 =3D cpu_to_le16(0x1512);
+	request->header.size =3D cpu_to_le32(sizeof(*request) - sizeof(request->h=
eader));
+	request->msg =3D msg;
+	request->size =3D request->header.size;
+
+	ret =3D appletbdrm_send_request(adev, &request->header, sizeof(*request))=
;
+
+	kfree(request);
+
+	return ret;
+}
+
+static int appletbdrm_clear_display(struct appletbdrm_device *adev)
+{
+	return appletbdrm_send_msg(adev, APPLETBDRM_MSG_CLEAR_DISPLAY);
+}
+
+static int appletbdrm_signal_readiness(struct appletbdrm_device *adev)
+{
+	return appletbdrm_send_msg(adev, APPLETBDRM_MSG_SIGNAL_READINESS);
+}
+
+static int appletbdrm_get_information(struct appletbdrm_device *adev)
+{
+	struct appletbdrm_information *info;
+	struct drm_device *drm =3D &adev->drm;
+	u8 bits_per_pixel;
+	u32 pixel_format;
+	int ret;
+
+	info =3D kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	ret =3D appletbdrm_send_msg(adev, APPLETBDRM_MSG_GET_INFORMATION);
+	if (ret)
+		return ret;
+
+	ret =3D appletbdrm_read_response(adev, &info->header, sizeof(*info),
+				       APPLETBDRM_MSG_GET_INFORMATION);
+	if (ret)
+		goto free_info;
+
+	bits_per_pixel =3D info->bits_per_pixel;
+	pixel_format =3D get_unaligned(&info->pixel_format);
+
+	adev->width =3D get_unaligned_le32(&info->width);
+	adev->height =3D get_unaligned_le32(&info->height);
+
+	if (bits_per_pixel !=3D APPLETBDRM_BITS_PER_PIXEL) {
+		drm_err(drm, "Encountered unexpected bits per pixel value (%d)\n", bits_=
per_pixel);
+		ret =3D -EINVAL;
+		goto free_info;
+	}
+
+	if (pixel_format !=3D APPLETBDRM_PIXEL_FORMAT) {
+		drm_err(drm, "Encountered unknown pixel format (%p4ch)\n", &pixel_format=
);
+		ret =3D -EINVAL;
+		goto free_info;
+	}
+
+free_info:
+	kfree(info);
+
+	return ret;
+}
+
+static u32 rect_size(struct drm_rect *rect)
+{
+	return drm_rect_width(rect) * drm_rect_height(rect) * (APPLETBDRM_BITS_PE=
R_PIXEL / 8);
+}
+
+static int appletbdrm_flush_damage(struct appletbdrm_device *adev,
+				   struct drm_plane_state *old_state,
+				   struct drm_plane_state *state)
+{
+	struct drm_shadow_plane_state *shadow_plane_state =3D to_drm_shadow_plane=
_state(state);
+	struct appletbdrm_fb_request_response *response;
+	struct appletbdrm_fb_request_footer *footer;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_framebuffer *fb =3D state->fb;
+	struct appletbdrm_fb_request *request;
+	struct drm_device *drm =3D &adev->drm;
+	struct appletbdrm_frame *frame;
+	u64 timestamp =3D ktime_get_ns();
+	struct drm_rect damage;
+	size_t frames_size =3D 0;
+	size_t request_size;
+	int ret;
+
+	drm_atomic_helper_damage_iter_init(&iter, old_state, state);
+	drm_atomic_for_each_plane_damage(&iter, &damage) {
+		frames_size +=3D struct_size(frame, buf, rect_size(&damage));
+	}
+
+	if (!frames_size)
+		return 0;
+
+	request_size =3D ALIGN(sizeof(*request) + frames_size + sizeof(*footer), =
16);
+
+	request =3D kzalloc(request_size, GFP_KERNEL);
+	if (!request)
+		return -ENOMEM;
+
+	response =3D kzalloc(sizeof(*response), GFP_KERNEL);
+	if (!response) {
+		ret =3D -ENOMEM;
+		goto free_request;
+	}
+
+	ret =3D drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+	if (ret) {
+		drm_err(drm, "Failed to start CPU framebuffer access (%pe)\n", ERR_PTR(r=
et));
+		goto free_response;
+	}
+
+	request->header.unk_00 =3D cpu_to_le16(2);
+	request->header.unk_02 =3D cpu_to_le16(0x12);
+	request->header.unk_04 =3D cpu_to_le32(9);
+	request->header.size =3D cpu_to_le32(request_size - sizeof(request->heade=
r));
+	request->unk_10 =3D cpu_to_le16(1);
+	request->msg_id =3D timestamp & 0xff;
+
+	frame =3D (struct appletbdrm_frame *)request->data;
+
+	drm_atomic_helper_damage_iter_init(&iter, old_state, state);
+	drm_atomic_for_each_plane_damage(&iter, &damage) {
+		struct iosys_map dst =3D IOSYS_MAP_INIT_VADDR(frame->buf);
+		u32 buf_size =3D rect_size(&damage);
+
+		/*
+		 * The coordinates need to be translated to the coordinate
+		 * system the device expects, see the comment in
+		 * appletbdrm_setup_mode_config
+		 */
+		frame->begin_x =3D cpu_to_le16(damage.y1);
+		frame->begin_y =3D cpu_to_le16(adev->height - damage.x2);
+		frame->width =3D cpu_to_le16(drm_rect_height(&damage));
+		frame->height =3D cpu_to_le16(drm_rect_width(&damage));
+		frame->buf_size =3D cpu_to_le32(buf_size);
+
+		ret =3D drm_fb_blit(&dst, NULL, DRM_FORMAT_BGR888,
+				  &shadow_plane_state->data[0], fb, &damage, &shadow_plane_state->fmtc=
nv_state);
+		if (ret) {
+			drm_err(drm, "Failed to copy damage clip (%pe)\n", ERR_PTR(ret));
+			goto end_fb_cpu_access;
+		}
+
+		frame =3D (void *)frame + struct_size(frame, buf, buf_size);
+	}
+
+	footer =3D (struct appletbdrm_fb_request_footer *)&request->data[frames_s=
ize];
+
+	footer->unk_0c =3D cpu_to_le32(0xfffe);
+	footer->unk_1c =3D cpu_to_le32(0x80001);
+	footer->unk_34 =3D cpu_to_le32(0x80002);
+	footer->unk_4c =3D cpu_to_le32(0xffff);
+	footer->timestamp =3D cpu_to_le64(timestamp);
+
+	ret =3D appletbdrm_send_request(adev, &request->header, request_size);
+	if (ret)
+		goto end_fb_cpu_access;
+
+	ret =3D appletbdrm_read_response(adev, &response->header, sizeof(*respons=
e),
+				       APPLETBDRM_MSG_UPDATE_COMPLETE);
+	if (ret)
+		goto end_fb_cpu_access;
+
+	if (response->timestamp !=3D footer->timestamp) {
+		drm_err(drm, "Response timestamp (%llu) doesn't match request timestamp =
(%llu)\n",
+			le64_to_cpu(response->timestamp), timestamp);
+		goto end_fb_cpu_access;
+	}
+
+end_fb_cpu_access:
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+free_response:
+	kfree(response);
+free_request:
+	kfree(request);
+
+	return ret;
+}
+
+static int appletbdrm_connector_helper_get_modes(struct drm_connector *con=
nector)
+{
+	struct appletbdrm_device *adev =3D drm_to_adev(connector->dev);
+
+	return drm_connector_helper_get_modes_fixed(connector, &adev->mode);
+}
+
+static enum drm_mode_status appletbdrm_pipe_mode_valid(struct drm_simple_d=
isplay_pipe *pipe,
+						       const struct drm_display_mode *mode)
+{
+	struct drm_crtc *crtc =3D &pipe->crtc;
+	struct appletbdrm_device *adev =3D drm_to_adev(crtc->dev);
+
+	return drm_crtc_helper_mode_valid_fixed(crtc, mode, &adev->mode);
+}
+
+static void appletbdrm_pipe_disable(struct drm_simple_display_pipe *pipe)
+{
+	struct appletbdrm_device *adev =3D drm_to_adev(pipe->crtc.dev);
+	int idx;
+
+	if (!drm_dev_enter(&adev->drm, &idx))
+		return;
+
+	appletbdrm_clear_display(adev);
+
+	drm_dev_exit(idx);
+}
+
+static void appletbdrm_pipe_update(struct drm_simple_display_pipe *pipe,
+				   struct drm_plane_state *old_state)
+{
+	struct drm_crtc *crtc =3D &pipe->crtc;
+	struct appletbdrm_device *adev =3D drm_to_adev(crtc->dev);
+	int idx;
+
+	if (!crtc->state->active || !drm_dev_enter(&adev->drm, &idx))
+		return;
+
+	appletbdrm_flush_damage(adev, old_state, pipe->plane.state);
+
+	drm_dev_exit(idx);
+}
+
+static const u32 appletbdrm_formats[] =3D {
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_XRGB8888, /* emulated */
+};
+
+static const struct drm_mode_config_funcs appletbdrm_mode_config_funcs =3D=
 {
+	.fb_create =3D drm_gem_fb_create_with_dirty,
+	.atomic_check =3D drm_atomic_helper_check,
+	.atomic_commit =3D drm_atomic_helper_commit,
+};
+
+static const struct drm_connector_funcs appletbdrm_connector_funcs =3D {
+	.reset =3D drm_atomic_helper_connector_reset,
+	.destroy =3D drm_connector_cleanup,
+	.fill_modes =3D drm_helper_probe_single_connector_modes,
+	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
+	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_state,
+};
+
+static const struct drm_connector_helper_funcs appletbdrm_connector_helper=
_funcs =3D {
+	.get_modes =3D appletbdrm_connector_helper_get_modes,
+};
+
+static const struct drm_simple_display_pipe_funcs appletbdrm_pipe_funcs =
=3D {
+	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
+	.update =3D appletbdrm_pipe_update,
+	.disable =3D appletbdrm_pipe_disable,
+	.mode_valid =3D appletbdrm_pipe_mode_valid,
+};
+
+DEFINE_DRM_GEM_FOPS(appletbdrm_drm_fops);
+
+static const struct drm_driver appletbdrm_drm_driver =3D {
+	DRM_GEM_SHMEM_DRIVER_OPS,
+	.name			=3D "appletbdrm",
+	.desc			=3D "Apple Touch Bar DRM Driver",
+	.date			=3D "20230910",
+	.major			=3D 1,
+	.minor			=3D 0,
+	.driver_features	=3D DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
+	.fops			=3D &appletbdrm_drm_fops,
+};
+
+static int appletbdrm_setup_mode_config(struct appletbdrm_device *adev)
+{
+	struct drm_connector *connector =3D &adev->connector;
+	struct drm_device *drm =3D &adev->drm;
+	struct device *dev =3D adev->dev;
+	int ret;
+
+	ret =3D drmm_mode_config_init(drm);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to initialize mode configuration\=
n");
+
+	/*
+	 * The coordinate system used by the device is different from the
+	 * coordinate system of the framebuffer in that the x and y axes are
+	 * swapped, and that the y axis is inverted; so what the device reports
+	 * as the height is actually the width of the framebuffer and vice
+	 * versa
+	 */
+	drm->mode_config.min_width =3D 0;
+	drm->mode_config.min_height =3D 0;
+	drm->mode_config.max_width =3D max(adev->height, DRM_SHADOW_PLANE_MAX_WID=
TH);
+	drm->mode_config.max_height =3D max(adev->width, DRM_SHADOW_PLANE_MAX_HEI=
GHT);
+	drm->mode_config.preferred_depth =3D APPLETBDRM_BITS_PER_PIXEL;
+	drm->mode_config.funcs =3D &appletbdrm_mode_config_funcs;
+
+	adev->mode =3D (struct drm_display_mode) {
+		DRM_MODE_INIT(60, adev->height, adev->width,
+			      DRM_MODE_RES_MM(adev->height, 218),
+			      DRM_MODE_RES_MM(adev->width, 218))
+	};
+
+	ret =3D drm_connector_init(drm, connector,
+				 &appletbdrm_connector_funcs, DRM_MODE_CONNECTOR_USB);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to initialize connector\n");
+
+	drm_connector_helper_add(connector, &appletbdrm_connector_helper_funcs);
+
+	ret =3D drm_connector_set_panel_orientation(connector,
+						  DRM_MODE_PANEL_ORIENTATION_RIGHT_UP);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to set panel orientation\n");
+
+	connector->display_info.non_desktop =3D true;
+	ret =3D drm_object_property_set_value(&connector->base,
+					    drm->mode_config.non_desktop_property, true);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to set non-desktop property\n");
+
+	ret =3D drm_simple_display_pipe_init(drm, &adev->pipe, &appletbdrm_pipe_f=
uncs,
+					   appletbdrm_formats, ARRAY_SIZE(appletbdrm_formats),
+					   NULL, &adev->connector);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to initialize simple display pipe=
\n");
+
+	drm_plane_enable_fb_damage_clips(&adev->pipe.plane);
+
+	drm_mode_config_reset(drm);
+
+	ret =3D drm_dev_register(drm, 0);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register DRM device\n");
+
+	return 0;
+}
+
+static int appletbdrm_probe(struct usb_interface *intf,
+			    const struct usb_device_id *id)
+{
+	struct usb_endpoint_descriptor *bulk_in, *bulk_out;
+	struct device *dev =3D &intf->dev;
+	struct appletbdrm_device *adev;
+	int ret;
+
+	ret =3D usb_find_common_endpoints(intf->cur_altsetting, &bulk_in, &bulk_o=
ut, NULL, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to find bulk endpoints\n");
+
+	adev =3D devm_drm_dev_alloc(dev, &appletbdrm_drm_driver, struct appletbdr=
m_device, drm);
+	if (IS_ERR(adev))
+		return PTR_ERR(adev);
+
+	adev->dev =3D dev;
+	adev->in_ep =3D bulk_in->bEndpointAddress;
+	adev->out_ep =3D bulk_out->bEndpointAddress;
+
+	usb_set_intfdata(intf, adev);
+
+	ret =3D appletbdrm_get_information(adev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get display information\n");
+
+	ret =3D appletbdrm_signal_readiness(adev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to signal readiness\n");
+
+	ret =3D appletbdrm_clear_display(adev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to clear display\n");
+
+	return appletbdrm_setup_mode_config(adev);
+}
+
+static void appletbdrm_disconnect(struct usb_interface *intf)
+{
+	struct appletbdrm_device *adev =3D usb_get_intfdata(intf);
+	struct drm_device *drm =3D &adev->drm;
+
+	drm_dev_unplug(drm);
+	drm_atomic_helper_shutdown(drm);
+}
+
+static void appletbdrm_shutdown(struct usb_interface *intf)
+{
+	struct appletbdrm_device *adev =3D usb_get_intfdata(intf);
+
+	/*
+	 * The framebuffer needs to be cleared on shutdown since its content
+	 * persists across boots
+	 */
+	drm_atomic_helper_shutdown(&adev->drm);
+}
+
+static const struct usb_device_id appletbdrm_usb_id_table[] =3D {
+	{ USB_DEVICE_INTERFACE_CLASS(0x05ac, 0x8302, USB_CLASS_AUDIO_VIDEO) },
+	{}
+};
+MODULE_DEVICE_TABLE(usb, appletbdrm_usb_id_table);
+
+static struct usb_driver appletbdrm_usb_driver =3D {
+	.name		=3D "appletbdrm",
+	.probe		=3D appletbdrm_probe,
+	.disconnect	=3D appletbdrm_disconnect,
+	.shutdown	=3D appletbdrm_shutdown,
+	.id_table	=3D appletbdrm_usb_id_table,
+};
+module_usb_driver(appletbdrm_usb_driver);
+
+MODULE_AUTHOR("Kerem Karabay <kekrby@gmail.com>");
+MODULE_DESCRIPTION("Apple Touch Bar DRM Driver");
+MODULE_LICENSE("GPL");
--=20
2.43.0

