Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1014E94BD27
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 14:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52F810E704;
	Thu,  8 Aug 2024 12:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="lm6Nz8iV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2053.outbound.protection.outlook.com [40.92.103.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078CD10E704
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 12:14:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Imlhd97223fq3mxjejl3LAukiIqI/kGbrMxnc2BEOM4W/R/BiqG90QabN8bJFfZWS2wvIDr0uaOMc3ufQSYkhYXUcM/1xlMJIj17tnqMispG5tg8NUXNaFzekhey3ZTZI0gRTkjkeGi+wb19vaNBVU9DGyNd/SVAMWD3/p0ulF+zzvqATf/murFgEvNsXzaFLDupfXCGh7bsXPi9bCnvaQyNNdJ9dbSzJ+YXTiTla9N2qsERGXRE+PVUOg12zaPT8Pauo5K2++OhpWABtbNrDDMEoHlNgSIl8RTKZW27+lKLbgrzhsCBnqCgl1KwS8z5uXKrbtPiYVV7HjtiVqLR6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pB6NmUDLnU/Yj4gQeyhxMJ0YQpmjzKnwyNDwR3xwWOE=;
 b=VanHU8GRj1WUZ0QI0H2MCtDQYY4Yy0+4SdlO6hLzOE8yaTBRRYCp2Q35n+/6xOuszpHhn4tkssf/IQOINK0XmM89CVVNHsc4u152lI/tomQfgUs1FWRCQ+F1WiVP86aSP4e61Q83QI2WDQ+TTd0K+mohtAXdw/JN3/I6Q7O3Mxu3Yn0jTMtA3wRsHLNb58P+C2630308ykEgk6u29bSal7y/C6e1+acUu/Ht6wj67cTu+3b7XstsoKjeHfH7ePVXyuVvfpFJYmThDjhB3nZoqq6vhjRLUHckHcxrSjkcHuQnDzgkeFWLDP76LIOHGag0dpoCTNfRO3kkn/beAP1dog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pB6NmUDLnU/Yj4gQeyhxMJ0YQpmjzKnwyNDwR3xwWOE=;
 b=lm6Nz8iVN604t2eUy9evhnZSi4x+bOw+kP9d4sR09UFq07t4ZnUv2N/NAvEgtmY0USJhYBqgVd49mQEpe7ZukdFbU+7mYpO1rnGqNfYlon8Vq+P48kmh1W+2fcGU0qhPW7V+jz+lzFaQIPP36PUa9y9MaZ8jz4ajpJq9dvKIlfBoSseeDgQxXC+1l2jGUqdnj2h/Mw87v5qQiKIlw9+ldYyI8Evogwg/73AN9zp3aPe4rhAJNs/qOB09fbqcJCpKTpS9hg5kVcAC8XOa98IBLvLs4sOXqGzmWlExgJD/0HMicndACIqASfepcm/Iog6Ed6LNZ3boNB3GvAG9d+oOYw==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN2P287MB2144.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c5::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.13; Thu, 8 Aug 2024 12:13:56 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 12:13:55 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-input@vger.kernel.org"
 <linux-input@vger.kernel.org>, Orlando Chamberlain <orlandoch.dev@gmail.com>
Subject: [PATCH RESEND v2 9/9] drm/tiny: add driver for Apple Touch Bars in
 x86 Macs
Thread-Topic: [PATCH RESEND v2 9/9] drm/tiny: add driver for Apple Touch Bars
 in x86 Macs
Thread-Index: AQHa6YxwQ/Ycfue6lEWHcZCiKiOHaQ==
Date: Thu, 8 Aug 2024 12:13:55 +0000
Message-ID: <D4659D1D-34C3-435E-ABE2-8F9AF584312E@live.com>
References: <752D8EEA-EE3B-4854-9B5E-F412AFA20048@live.com>
In-Reply-To: <752D8EEA-EE3B-4854-9B5E-F412AFA20048@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [zH9HuaVffgNquCA+JPMZtChnEaH8eg/gI838YTpz9DOLVj0EFSEmX5E5mfT03Hsx3G5PQxHParU=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN2P287MB2144:EE_
x-ms-office365-filtering-correlation-id: 744a02a6-7a24-42fc-156e-08dcb7a3934d
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|15080799003|19110799003|8060799006|102099032|4302099013|3412199025|440099028|1602099012;
x-microsoft-antispam-message-info: xvj1DWv/pxuikC1XmpczFon8WeuWhHiqx84XehdXc+TIsNNrwSbaWR2b52DufXDjhcNI0k5MZXOWU/dH1PJvzUgrPKb/uXMvCnth1/Ix/3931dCDCWKYN1FBb8C20IOKAlowZWVUasc8P85n5DsvVUG8EL13+Mc7RIjdnc6R+t/tcJ7lmYGA9UgsutU1Ftcrg0o4f2liO+l0TjUsYKWh4EsjJjveYfkdI+enJrVMmaplsJ4QJBnGos67TBy8EzMpwDjTqix3xF8wWv5NVv6qZT838T+STEdE/SVSHWVgHiO/Q3HhAk7XMhN/kfkKEWOaSvMTFbb5sZrLhsbmWK7UWMrNWTioVvYaZoPA+cvEaCoSNwr72KWdrBC2PKK9LIXL0FJUdRgNxYNp6JYIdbIayslSjlVRocFBFZGGtfVa7JoRyHnnWVCvRcj9rLUf3g4q7sCA4QGIotBVIJdpMY10LoG/Muoo26/MiXh57NyC+TbWVttgWqzlfGiUP5nltxk3wUI6VCd9Z1V1EUtMnYdcaBmm6w0vZLeJ030OyO8bsf8V5DTJC7OEB3wmraH+sYuG0ytbldYkwp9+aMASLANQFKCurpPjkzV5yF9K1phPzGGsi5Q2Zt3I7pFhRjEWi4KgBgdJq6YhnyI72REkoXyIsHNsuGCJYqJ1eo23G7XW3yCWfOcpCxZMMRv3mYh4r/flhNZUyHF7iQZtlpBnd9QlKc7vW2FtVOBK5jiRmZ5bSrI0eAZ74CcAFeBfLP3zDWvyH+g3et5qBte5V1zsyG18UZqfOZzXNqDVlseRPvmkaVw=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XdUdfR1Rebw8O+HudfO3IT7sonV7xiXUUHosS4Af0o1oF2M0DOgm86RQf+wF?=
 =?us-ascii?Q?yudwjQVvIYsXFjuJA/16KH7hUW9uVD9tM+E7yxgzT/cViYOGULkyweO4BtPX?=
 =?us-ascii?Q?AyrOnm9X7yEZb/aPNDDWpil33VTs+asE6hFAcJN+cR7HoziiVdKguNrJzvD5?=
 =?us-ascii?Q?Ryn1DN5PPz83yXVDGPurUcl8EdQp/edmldlvVa0vs1thN4ar7YYZSZxPNqxN?=
 =?us-ascii?Q?WNY8xu61brgWNG0eObgYsG2KeTLmza0+uCjTnL2ZdaPgBJmluts4snM6lpqL?=
 =?us-ascii?Q?xdorg1XmxP1DpxBV+CXId0detU5i88DoxioDyMhM58TVsr/ZUlOgo8L/rcLP?=
 =?us-ascii?Q?XjGfBTFONpTsAjf8Af93+3+jrkJFCh+LWH/qyjFmsnMjthCiLZcby4o5OOOY?=
 =?us-ascii?Q?/dsABfqG7FUakXLdZEcKSgV94nO0Zw4VDMiG00Q2QWRk1U+dtEvIQv3K9EhM?=
 =?us-ascii?Q?Xk8nURRLg3giyXXdcKGvAH2/VNWTdoTtUDIwG2KIzP/fI6AIn0TxvYVZGE49?=
 =?us-ascii?Q?GIGMR+wJ0LZ6y4gIwlftRWySkHB4kqnx+dKFLGj7pyyxhbsgvjR2Fg/MOl7B?=
 =?us-ascii?Q?QfQRAnDZau0kMswzKCSbOLKk0567xPoViDuQIK8jlEJMn28ZcYDs73oI4GHl?=
 =?us-ascii?Q?rYM7c9+s538avTbFJsIAIlzFUaOyDSLdpb4NHYsk63x86j72CmfPZu3BUhP5?=
 =?us-ascii?Q?A7WIeosx6LJeY4ENP1IUGQ4p2qYEmSJk/IgoxnGFmveojrK2KvI8wmm4DTJC?=
 =?us-ascii?Q?iOx5YLELgK5MbUms3QOPAI7TgtqhNVEIMco6VZN1YZ8tkZZlwPYnHRxEFP8j?=
 =?us-ascii?Q?6DYwr6d7o3rnqYew/bJUvcn9CrfBGZaGiXwcdlck0Ugjh+ggKtO7d48/wXMS?=
 =?us-ascii?Q?axYL/FZFLOHePWjhyiPfA+ctPuUPa7hNJhAcdnABATz9LiIoqlDDqVhyWyFZ?=
 =?us-ascii?Q?HiBo9ruCTq0QCpqQ+GDUvvl1FND5hMqKTNfqgtsU0MshzTZb5HJLN+9lstp7?=
 =?us-ascii?Q?FUpJsro23I4irSODGYGurgepNoBlU6jl1jXwh4jiYT/ZRRDpUicxVkdnC6TS?=
 =?us-ascii?Q?rY0U5JEq8FnIevXHuKn1E16qro8+1nwqyLsNHxvuX4IMu11XRYkBk62GOEtX?=
 =?us-ascii?Q?xlzcZjQK4aS0jG8tetPawivUYY8ndZGFzsc16aTQ2leL08OU81YfYgTOrDcG?=
 =?us-ascii?Q?cLFalmf6J+kZLwqsmoXlHgBtJ+U9hslcUhdAudrrWdtAVHFfVDMq9The7NCe?=
 =?us-ascii?Q?QI2apGNCNBAczy9SzDu8zidHCgTA1klqTqBWbRsJkxhZhj2UwSX1GoJphFux?=
 =?us-ascii?Q?Nz6LwArAaYKPs8Rdxd/Me9bR?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <03A69239287D2D4A8CAED462FB70281B@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 744a02a6-7a24-42fc-156e-08dcb7a3934d
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 12:13:55.8251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB2144
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
index ac27f41d4..f2c227150 100644
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
2.39.3 (Apple Git-146)

