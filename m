Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FE1A43ADB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 11:09:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE7710E5FA;
	Tue, 25 Feb 2025 10:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="i3i0cf5p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011024.outbound.protection.outlook.com
 [52.103.67.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB2A10E5FA
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 10:09:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b10DhSHU+fDwiwieQRuQSylDLgwIJUIRYRppXuIXsCOq57PwHPaUI1oOowsTm5wePoyZdSmav5T4oDOEin+8oCv6tzp6hzG3iHvGRW3CKv12P3rdOW/R7IDhjbGlR0sGHMJlevZO9kJl2tlQqfvNOIdOypi0fLY9JeY0rxdFxW/oHH+mEp+5gEviodWDEc6glePp9aswXuZAQ4QOoIx80j30b8lsvyEMUf9L50qrk5N15Cc3Qi34tsRpc0TXA54Ptcx6m0xgFLvzGAJlbF7KBfr7JuhKz4Hi3jALoAfDcvXKPQQ6AJ6aQVutlktIeRAhi9kcz7cbrymd/DSjrZ0N7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpaTWvNq342XpBEPk0+R6igDrQ9c4fqSmmjWmMaiGfs=;
 b=w8LqAn2i6SeNbEHynBpCAZ50SkRt08MqKuj8AscU9rvM8Msgpcd3MaaWP5tH3fkr5Wytg3kCvwjetWoloOHc7dsStXtavL1St+SXRrqfiAgZldlPbiASiGYWRqWG9SNk2DOV/t1xje/GV8kWJDm9J0aPwgZQEij49ozJgwWrVDXNWfc4z4CQFDDJwkFEIIXPigx277pBUbRY4+uoaFm/O5DtsrLM8bB+IgVOjTy7IN/vEuPgEtkHHlxGLa8DFfLSyHnvXTtyvxE65yIN6YfXSPVkUHFLrQ0mbe5bPqtt65oOe9buq+nxZPUxcVJDx4S0RHHYxuYUoADROFDyr5phgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpaTWvNq342XpBEPk0+R6igDrQ9c4fqSmmjWmMaiGfs=;
 b=i3i0cf5pkL8salyzc35PiLPodM902yN45GhUfhriZgLo1x+u8u0uMrPA6FfR7hsgMDHAWfiI47QXULqcroK7i7CASB1QafFOMugsUoiv4GMNHijzr/SOY3eqSiM5t+t3U+Ap29r/T9Jh/fC8Q9dzbT5NXDcYOXFiOMe21mtDZAnR6G7/K9jegS2n2DTyHn9QI/rLEC9v7+PyijqpoHHWZFI02oORF2CnUE32U6d9WtJKjG1Hx0+LzUTbZq/jfc08p39d+LMlJGTZ49TUzWXUstRg969gM5HRvP9G80xIQNQDfFDXCkwhBkhHBQpF6/i7L5EqfG4ELrz8oWWOZu6fDA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA1PR01MB4370.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:13::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Tue, 25 Feb
 2025 10:09:43 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 10:09:43 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>
CC: Kerem Karabay <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>, 
 Aun-Ali Zaidi <admin@kodeit.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 2/2] drm/tiny: add driver for Apple Touch Bars in x86 Macs
Thread-Topic: [PATCH v5 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbh21jIwmAnmsy3kGCR8ru32iH4A==
Date: Tue, 25 Feb 2025 10:09:42 +0000
Message-ID: <4D7C00B4-7B75-4715-8D37-0059B22C030D@live.com>
References: <3457BF95-0E50-4B70-86DE-EE5EE95D3ACE@live.com>
In-Reply-To: <3457BF95-0E50-4B70-86DE-EE5EE95D3ACE@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MA1PR01MB4370:EE_
x-ms-office365-filtering-correlation-id: 606aaed4-5c59-4fc3-3ef9-08dd5584861b
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799006|19110799003|7092599003|461199028|8060799006|8062599003|12121999004|102099032|1602099012|4302099013|3412199025|440099028|10035399004|12091999003|41001999003;
x-microsoft-antispam-message-info: =?us-ascii?Q?mu+ODUlLZveZoEeGBa3zt93T8p3Yp75Rjr3BcBBci86SpqMxg1fQyjhA7hOZ?=
 =?us-ascii?Q?QQIs6tJYg11hYSGiEXgTitvbMv71s5oEz/LpRLjy5I11sNxrcNtYOEB884Z0?=
 =?us-ascii?Q?RmIVrEWtkHRyPoYakwl6urO6xjRxdHRnRWUg6xWUn6UycZ8SQ9HCQdfX8+fK?=
 =?us-ascii?Q?fY+/pSeBnUgZjeq7hQgckK1COu7zs5ekSFtSNAfmycxp4JkjkZ9V27IDtrY+?=
 =?us-ascii?Q?V7hkOT77Y5rppz78jOxvpjU6hTlfDnWPF4GJlfO5hh0JGvf6pI8lI4uBNSDh?=
 =?us-ascii?Q?AyLYSH25eLOA6UOahwuGLm9VEFItQ8z/MW6oWNNskiE0OD0gVfDXYUDv/KoY?=
 =?us-ascii?Q?mL9c+2RRdSaTSR/k4dp0ybNqyaZ5d1UdpqYdQlty3KpzbQ2u4G3A+NWfia3j?=
 =?us-ascii?Q?OIaEvw5LVMLSz9We7fdozS97Bv+KZJY9BJUPBgGX/Q/N88qQ9HxeD7nhNqXY?=
 =?us-ascii?Q?/9b+3SQrAS1lTd4dk+b2GLo9BI4/GMIWqiSL6WdlHuKJh1bOrYTKn5y8S5Mq?=
 =?us-ascii?Q?ES+ItbeiQ/zUtQCn4LiCFKHXOFfSMcOH3ul8Mamu+cDdN2QDGOkrk8Nm5aBl?=
 =?us-ascii?Q?xinFW+KZ/jKfJrR9noYfXo1Uamw+WToLcYTvtWWcq8Ehq+EYDJDrtBbYMRwb?=
 =?us-ascii?Q?dCg9FAFgDVw/f4ecgKANNKlm86ZWNCRiaaGSM/LRs9oxH8y7a3PSomvPglpM?=
 =?us-ascii?Q?9dtc/DeOzUlayEcI37tI4403wcHI9itTdAY2D8pVORBEsi7ZgeuSjBMpKlxj?=
 =?us-ascii?Q?mZ5GUYl8wOg25psyCPuOzVYNQD93bc8US5aL84FShoTEzTKl/ZutffAKbuCB?=
 =?us-ascii?Q?PahfdRlZE0mt4p168uZQ8x+lr3wS5LA3fKBheOBrzcsHjT7AkC+qzkvoDrHy?=
 =?us-ascii?Q?PcrYG1eiekXX/ohMeQ/TQH9a5ukF8jyOLrf1pCxjoI9OpfoC16borhdRBkSg?=
 =?us-ascii?Q?JwLKL6kuyxQdSJXtAFUziCwFSYZCYHBYWf7qCkfKWgWiquxGqxOhaHHwoeXd?=
 =?us-ascii?Q?n77w875WHq/pv7P+TxuonNGJLMnZSvV0+MSfX1bIl8vpTbTqbRPVNnEjmvlu?=
 =?us-ascii?Q?QoknnKVRocOo9HA2vQLtQNw5vr69jQLSKT3XoAdqw/9zop+hE2uanvszcPWo?=
 =?us-ascii?Q?gH99I0jEP8crKlq5jyd8B8stFgr4uHRrmweX1B/q/KUCkuUP3rU+ew2rNijp?=
 =?us-ascii?Q?sYYa0JRc25ebKAmkuMEtvuiQBqDFXFDpn4mzBRd86pRu/WqrhnEzpHL04jH9?=
 =?us-ascii?Q?r0xYKn49itiCcFNt2PdqJl4KMGUigJ3dwi5FDaohOVh4kndaPM/f5/wZVExn?=
 =?us-ascii?Q?ADc=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yjjGX2H//QJjRUBdLDXn08ZG0ozURvuDMSPtHf9/rgQB6+pg/uLPhqZjARJC?=
 =?us-ascii?Q?acHw5Rantb/0aOvBhB9LfuvUMz6NxuP4vyCKoFfjrupdA63zaR1mjLqUnlSO?=
 =?us-ascii?Q?Y8F0AvmZGiO7zx6s/T9CT6leC4sLqKhdF4IHBHjrZlRAR/8yntRxLLSFuSGd?=
 =?us-ascii?Q?VzXHKmalLJ9tQboTtlSVk+T8Ipm5z79hc1v2rCwijFG6qjhHCraTKEw3Gkff?=
 =?us-ascii?Q?n4wJB1lo/cmCuO8GVbgpuyRdnMv4v0Yt4ZMyeho75bCaHFDUGReGQoF93kCa?=
 =?us-ascii?Q?ZbhuLNnwVUPASUCUTAtPEpzFM1yB/C3l4dWS8llqzl8ZBxwJ8Z7ieWNnI7/q?=
 =?us-ascii?Q?7/fBwjkpEFoTZ2OS+HACxkCLH/eKPxByMs5FnIm2Eb4n3bN5ctRdg7g5wTp7?=
 =?us-ascii?Q?I+2jmJhUVYRR4HDJNpsSu67NuD8WqJ8qU1CegTTmmKDn8oSPyOxzm0+N4yLR?=
 =?us-ascii?Q?dnJ0zwaADE8hZKsR0Engjb6aZUbFNMd42YHCcKlObCAb5JfaQuxum/3p1Gbw?=
 =?us-ascii?Q?Aztm+alN12phvKV75bDcIBqIlX+ERGdPVvn4Pe5HEKiCdcWmC7i9W89e5HBz?=
 =?us-ascii?Q?mTTtWqqshPKP3EK4j5SGA8gMAQlvUr2hu+HQbH7L61ZsIwxnlZ3dTfBttHcG?=
 =?us-ascii?Q?hqpB2tewHB7i01D+JgAmHvdIrRjX/ByCyfBM3ClMvIJRmzYuQhJdbzlleIOk?=
 =?us-ascii?Q?oa+ss5+mMEf+1ow0VSzEyMXFuA2hSCzZ1SlJqLDdCfrb4eYeq/DBgelWv6ll?=
 =?us-ascii?Q?xZIymvA68M1LW5Chx/CFCChh0tUIRdknN+GxzCiM7pUSsX85ySndcTFtLvGG?=
 =?us-ascii?Q?J3Om6l/J02Z3Wit0xPSANEQl2IaJ8pxgyRvYqUUBqh63NCZpamsQouQuQHWJ?=
 =?us-ascii?Q?Z5dboVCFa3bozuGsZjFIxAHBIte3MFLcWOg4ft9PcJQZRCpFZhsIbJE6hu0m?=
 =?us-ascii?Q?u0sFygGrvvyJC8gEXEbMiXrX5T441Sm8v0RcudkVJcx0zlD5iXZLYRXepiLx?=
 =?us-ascii?Q?rTPmwkZgCVgdOqx+cogVS5gU4zSFhIq9ruLkLC0HvPpyi/gHkRkqX6ZRc1gG?=
 =?us-ascii?Q?N8nQJf60qPmDwFVdJOA0qbeAVBj2zKSDbTlW17X41VQC1wNVUieeNAvwOoat?=
 =?us-ascii?Q?RtCG1hkORKl4yGPaq7rqAFa9c4gVPubPfSZKkVth1r+BbR7fsNPanrww1V8f?=
 =?us-ascii?Q?3+XktTdHu0C+CJzBbfkKW/b7JtVW2j1/W5GNfji2xTKnEfL3KPsOfwJmrdhj?=
 =?us-ascii?Q?bfB8nmN18qkE/hR0OeSI5H7DrlVxNMe+vjxNeTkBl8a/cYIqFZysUfwNSnBM?=
 =?us-ascii?Q?9Rd69h5GizTmA8r/5Ej5jW+f?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <821224289D99BB43A80EAD83C8D0F371@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 606aaed4-5c59-4fc3-3ef9-08dd5584861b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 10:09:43.0014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB4370
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
control over what is displayed.

This commit adds support for the display functionality of the second
configuration. Functionality for the first configuration has been
merged in the HID tree.

Note that this driver has only been tested on T2 Macs, and only includes
the USB device ID for these devices. Testing on T1 Macs would be
appreciated.

Credit goes to Ben (Bingxing) Wang on GitHub for reverse engineering
most of the protocol.

Also, as requested by Andy, I would like to clarify the use of __packed
structs in this driver:

- All the packed structs are aligned except for appletbdrm_msg_information.
- We have to pack appletbdrm_msg_information since it is requirement of
  the protocol.
- We compared binaries compiled by keeping the rest structs __packed and
  not __packed using bloat-o-meter, and __packed was not affecting code
  generation.
- To maintain consistency, rest structs have been kept __packed.

I would also like to point out that since the driver was reverse-engineered
the actual data types of the protocol might be different, including, but
not limited to, endianness.

Link: https://github.com/imbushuo/DFRDisplayKm
Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Atharva Tiwari <evepolonium@gmail.com>
Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aun-Ali Zaidi <admin@kodeit.net>
---
v2 ->
- Add the driver to MAINTAINERS.
- Allocate memory for request and response in plane's atomic-check helper
- Void the use of drm_fb_blit()
- Implement atomic_disable
- Make PRIME work
- Remove the date field from struct drm_driver=20
- intersect damage with dst_clip
- Register DRM device in appletbdrm_probe
- Clear the display as the final call in probe
- Select hid_multitouch as well in kconfig

v3 ->
- Change commit message to credit Ben (Bingxing) Wang

v4 ->
- Use "Link:" in commit message
- Specify why __packed has been used in commit message
- Use %p4cc instead of %p4ch for errors
- Add myself to Maintainers
- Remove #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
- Add missing header files
- Use return 0; instead of return ret; in static int appletbdrm_send_reques=
t
- Better errno types used in appletbdrm_read_response
- Use BITS_TO_BYTES() to convert APPLETBDRM_BITS_PER_PIXEL to bytes
- Remove redundant else in plane_helper_atomic_check
- Remove unnecessary use of 0xff in request->msg_id =3D timestamp & 0xff;
- Remove duplicated struct device in struct appletbdrm_device
- clear frames_size and request_size as well in primary_plane_helper_atomic=
_update
- Allocate using kzalloc instead of kmemdup
- Use drm_err() instead of dev_err_probe()
- Avoid clearing drm->mode_config.min_width and height to 0
- Use put_device() to release the DMA device in appletbdrm_disconnect

v5 ->
- Convert leftover dev_err_probe to drm_err
- Add missing period in comment
- Use struct device *dmadev instead of struct device *dev in struct appletb=
drm_device
- Instead of using __APPLETBDRM_MSG_STR4(str4) macro, the hex values have b=
een directly used
- Remove modules that were not needed from kconfig

 MAINTAINERS                       |   8 +
 drivers/gpu/drm/tiny/Kconfig      |  12 +
 drivers/gpu/drm/tiny/Makefile     |   1 +
 drivers/gpu/drm/tiny/appletbdrm.c | 844 ++++++++++++++++++++++++++++++
 4 files changed, 865 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/appletbdrm.c

diff --git a/MAINTAINERS b/MAINTAINERS
index efee40ea5..f7c97eb24 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7148,6 +7148,14 @@ S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/sun4i/sun8i*
=20
+DRM DRIVER FOR APPLE TOUCH BARS
+M:	Aun-Ali Zaidi <admin@kodeit.net>
+M:	Aditya Garg <gargaditya08@live.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/tiny/appletbdrm.c
+
 DRM DRIVER FOR ARM PL111 CLCD
 M:	Linus Walleij <linus.walleij@linaro.org>
 S:	Maintained
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 94cbdb133..54c84c980 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -1,5 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0-only
=20
+config DRM_APPLETBDRM
+	tristate "DRM support for Apple Touch Bars"
+	depends on DRM && USB && MMU
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_KMS_HELPER
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
index 60816d2eb..0a3a7837a 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
=20
+obj-$(CONFIG_DRM_APPLETBDRM)		+=3D appletbdrm.o
 obj-$(CONFIG_DRM_ARCPGU)		+=3D arcpgu.o
 obj-$(CONFIG_DRM_BOCHS)			+=3D bochs.o
 obj-$(CONFIG_DRM_CIRRUS_QEMU)		+=3D cirrus-qemu.o
diff --git a/drivers/gpu/drm/tiny/appletbdrm.c b/drivers/gpu/drm/tiny/apple=
tbdrm.c
new file mode 100644
index 000000000..e49b97ded
--- /dev/null
+++ b/drivers/gpu/drm/tiny/appletbdrm.c
@@ -0,0 +1,844 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Apple Touch Bar DRM Driver
+ *
+ * Copyright (c) 2023 Kerem Karabay <kekrby@gmail.com>
+ */
+
+#include <linux/align.h>
+#include <linux/array_size.h>
+#include <linux/bitops.h>
+#include <linux/bug.h>
+#include <linux/container_of.h>
+#include <linux/dev_printk.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/overflow.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+#include <linux/usb.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_format_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_probe_helper.h>
+
+#define APPLETBDRM_PIXEL_FORMAT		cpu_to_le32(0x52474241) /* RGBA, the actu=
al format is BGR888 */
+#define APPLETBDRM_BITS_PER_PIXEL	24
+
+#define APPLETBDRM_MSG_CLEAR_DISPLAY	cpu_to_le32(0x434c5244) /* CLRD */
+#define APPLETBDRM_MSG_GET_INFORMATION	cpu_to_le32(0x47494e46) /* GINF */
+#define APPLETBDRM_MSG_UPDATE_COMPLETE	cpu_to_le32(0x5544434c) /* UDCL */
+#define APPLETBDRM_MSG_SIGNAL_READINESS	cpu_to_le32(0x52454459) /* REDY */
+
+#define APPLETBDRM_BULK_MSG_TIMEOUT	1000
+
+#define drm_to_adev(_drm)		container_of(_drm, struct appletbdrm_device, dr=
m)
+#define adev_to_udev(adev)		interface_to_usbdev(to_usb_interface(adev->dma=
dev))
+
+struct appletbdrm_msg_request_header {
+	__le16 unk_00;
+	__le16 unk_02;
+	__le32 unk_04;
+	__le32 unk_08;
+	__le32 size;
+} __packed;
+
+struct appletbdrm_msg_response_header {
+	u8 unk_00[16];
+	__le32 msg;
+} __packed;
+
+struct appletbdrm_msg_simple_request {
+	struct appletbdrm_msg_request_header header;
+	__le32 msg;
+	u8 unk_14[8];
+	__le32 size;
+} __packed;
+
+struct appletbdrm_msg_information {
+	struct appletbdrm_msg_response_header header;
+	u8 unk_14[12];
+	__le32 width;
+	__le32 height;
+	u8 bits_per_pixel;
+	__le32 bytes_per_row;
+	__le32 orientation;
+	__le32 bitmap_info;
+	__le32 pixel_format;
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
+	struct appletbdrm_msg_request_header header;
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
+	struct appletbdrm_msg_response_header header;
+	u8 unk_14[12];
+	__le64 timestamp;
+} __packed;
+
+struct appletbdrm_device {
+	struct device *dmadev;
+
+	unsigned int in_ep;
+	unsigned int out_ep;
+
+	unsigned int width;
+	unsigned int height;
+
+	struct drm_device drm;
+	struct drm_display_mode mode;
+	struct drm_connector connector;
+	struct drm_plane primary_plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
+};
+
+struct appletbdrm_plane_state {
+	struct drm_shadow_plane_state base;
+	struct appletbdrm_fb_request *request;
+	struct appletbdrm_fb_request_response *response;
+	size_t request_size;
+	size_t frames_size;
+};
+
+static inline struct appletbdrm_plane_state *to_appletbdrm_plane_state(str=
uct drm_plane_state *state)
+{
+	return container_of(state, struct appletbdrm_plane_state, base.base);
+}
+
+static int appletbdrm_send_request(struct appletbdrm_device *adev,
+				   struct appletbdrm_msg_request_header *request, size_t size)
+{
+	struct usb_device *udev =3D adev_to_udev(adev);
+	struct drm_device *drm =3D &adev->drm;
+	int ret, actual_size;
+
+	ret =3D usb_bulk_msg(udev, usb_sndbulkpipe(udev, adev->out_ep),
+			   request, size, &actual_size, APPLETBDRM_BULK_MSG_TIMEOUT);
+	if (ret) {
+		drm_err(drm, "Failed to send message (%d)\n", ret);
+		return ret;
+	}
+
+	if (actual_size !=3D size) {
+		drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
+			actual_size, size);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int appletbdrm_read_response(struct appletbdrm_device *adev,
+				    struct appletbdrm_msg_response_header *response,
+				    size_t size, __le32 expected_response)
+{
+	struct usb_device *udev =3D adev_to_udev(adev);
+	struct drm_device *drm =3D &adev->drm;
+	int ret, actual_size;
+	bool readiness_signal_received =3D false;
+
+retry:
+	ret =3D usb_bulk_msg(udev, usb_rcvbulkpipe(udev, adev->in_ep),
+			   response, size, &actual_size, APPLETBDRM_BULK_MSG_TIMEOUT);
+	if (ret) {
+		drm_err(drm, "Failed to read response (%d)\n", ret);
+		return ret;
+	}
+
+	/*
+	 * The device responds to the first request sent in a particular
+	 * timeframe after the USB device configuration is set with a readiness
+	 * signal, in which case the response should be read again
+	 */
+	if (response->msg =3D=3D APPLETBDRM_MSG_SIGNAL_READINESS) {
+		if (!readiness_signal_received) {
+			readiness_signal_received =3D true;
+			goto retry;
+		}
+
+		drm_err(drm, "Encountered unexpected readiness signal\n");
+		return -EINTR;
+	}
+
+	if (actual_size !=3D size) {
+		drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
+			actual_size, size);
+		return -EBADMSG;
+	}
+
+	if (response->msg !=3D expected_response) {
+		drm_err(drm, "Unexpected response from device (expected %p4cc found %p4c=
c)\n",
+			&expected_response, &response->msg);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int appletbdrm_send_msg(struct appletbdrm_device *adev, __le32 msg)
+{
+	struct appletbdrm_msg_simple_request *request;
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
+	struct appletbdrm_msg_information *info;
+	struct drm_device *drm =3D &adev->drm;
+	u8 bits_per_pixel;
+	__le32 pixel_format;
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
+		drm_err(drm, "Encountered unknown pixel format (%p4cc)\n", &pixel_format=
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
+	return drm_rect_width(rect) * drm_rect_height(rect) *
+		(BITS_TO_BYTES(APPLETBDRM_BITS_PER_PIXEL));
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
+static const u32 appletbdrm_primary_plane_formats[] =3D {
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_XRGB8888, /* emulated */
+};
+
+static int appletbdrm_primary_plane_helper_atomic_check(struct drm_plane *=
plane,
+						   struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_plane_stat=
e(state, plane);
+	struct drm_plane_state *old_plane_state =3D drm_atomic_get_old_plane_stat=
e(state, plane);
+	struct drm_crtc *new_crtc =3D new_plane_state->crtc;
+	struct drm_crtc_state *new_crtc_state =3D NULL;
+	struct appletbdrm_plane_state *appletbdrm_state =3D to_appletbdrm_plane_s=
tate(new_plane_state);
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_rect damage;
+	size_t frames_size =3D 0;
+	size_t request_size;
+	int ret;
+
+	if (new_crtc)
+		new_crtc_state =3D drm_atomic_get_new_crtc_state(state, new_crtc);
+
+	ret =3D drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_sta=
te,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+	if (ret)
+		return ret;
+
+	if (!new_plane_state->visible)
+		return 0;
+
+	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, new_plane_stat=
e);
+	drm_atomic_for_each_plane_damage(&iter, &damage) {
+		frames_size +=3D struct_size((struct appletbdrm_frame *)0, buf, rect_siz=
e(&damage));
+	}
+
+	if (!frames_size)
+		return 0;
+
+	request_size =3D ALIGN(sizeof(struct appletbdrm_fb_request) +
+		       frames_size +
+		       sizeof(struct appletbdrm_fb_request_footer), 16);
+
+	appletbdrm_state->request =3D kzalloc(request_size, GFP_KERNEL);
+
+	if (!appletbdrm_state->request)
+		return -ENOMEM;
+
+	appletbdrm_state->response =3D kzalloc(sizeof(*appletbdrm_state->response=
), GFP_KERNEL);
+
+	if (!appletbdrm_state->response)
+		return -ENOMEM;
+
+	appletbdrm_state->request_size =3D request_size;
+	appletbdrm_state->frames_size =3D frames_size;
+
+	return 0;
+}
+
+static int appletbdrm_flush_damage(struct appletbdrm_device *adev,
+				   struct drm_plane_state *old_state,
+				   struct drm_plane_state *state)
+{
+	struct appletbdrm_plane_state *appletbdrm_state =3D to_appletbdrm_plane_s=
tate(state);
+	struct drm_shadow_plane_state *shadow_plane_state =3D to_drm_shadow_plane=
_state(state);
+	struct appletbdrm_fb_request_response *response =3D appletbdrm_state->res=
ponse;
+	struct appletbdrm_fb_request_footer *footer;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_framebuffer *fb =3D state->fb;
+	struct appletbdrm_fb_request *request =3D appletbdrm_state->request;
+	struct drm_device *drm =3D &adev->drm;
+	struct appletbdrm_frame *frame;
+	u64 timestamp =3D ktime_get_ns();
+	struct drm_rect damage;
+	size_t frames_size =3D appletbdrm_state->frames_size;
+	size_t request_size =3D appletbdrm_state->request_size;
+	int ret;
+
+	if (!frames_size)
+		return 0;
+
+	ret =3D drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+	if (ret) {
+		drm_err(drm, "Failed to start CPU framebuffer access (%d)\n", ret);
+		goto end_fb_cpu_access;
+	}
+
+	request->header.unk_00 =3D cpu_to_le16(2);
+	request->header.unk_02 =3D cpu_to_le16(0x12);
+	request->header.unk_04 =3D cpu_to_le32(9);
+	request->header.size =3D cpu_to_le32(request_size - sizeof(request->heade=
r));
+	request->unk_10 =3D cpu_to_le16(1);
+	request->msg_id =3D timestamp;
+
+	frame =3D (struct appletbdrm_frame *)request->data;
+
+	drm_atomic_helper_damage_iter_init(&iter, old_state, state);
+	drm_atomic_for_each_plane_damage(&iter, &damage) {
+		struct drm_rect dst_clip =3D state->dst;
+		struct iosys_map dst =3D IOSYS_MAP_INIT_VADDR(frame->buf);
+		u32 buf_size =3D rect_size(&damage);
+
+		if (!drm_rect_intersect(&dst_clip, &damage))
+			continue;
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
+		switch (fb->format->format) {
+		case DRM_FORMAT_XRGB8888:
+			drm_fb_xrgb8888_to_bgr888(&dst, NULL, &shadow_plane_state->data[0], fb,=
 &damage, &shadow_plane_state->fmtcnv_state);
+			break;
+		default:
+			drm_fb_memcpy(&dst, NULL, &shadow_plane_state->data[0], fb, &damage);
+			break;
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
+
+	return ret;
+}
+
+static void appletbdrm_primary_plane_helper_atomic_update(struct drm_plane=
 *plane,
+						     struct drm_atomic_state *old_state)
+{
+	struct appletbdrm_device *adev =3D drm_to_adev(plane->dev);
+	struct drm_device *drm =3D plane->dev;
+	struct drm_plane_state *plane_state =3D plane->state;
+	struct drm_plane_state *old_plane_state =3D drm_atomic_get_old_plane_stat=
e(old_state, plane);
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
+	appletbdrm_flush_damage(adev, old_plane_state, plane_state);
+
+	drm_dev_exit(idx);
+}
+
+static void appletbdrm_primary_plane_helper_atomic_disable(struct drm_plan=
e *plane,
+							   struct drm_atomic_state *state)
+{
+	struct drm_device *dev =3D plane->dev;
+	struct appletbdrm_device *adev =3D drm_to_adev(dev);
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return;
+
+	appletbdrm_clear_display(adev);
+
+	drm_dev_exit(idx);
+}
+
+static void appletbdrm_primary_plane_reset(struct drm_plane *plane)
+{
+	struct appletbdrm_plane_state *appletbdrm_state;
+
+	WARN_ON(plane->state);
+
+	appletbdrm_state =3D kzalloc(sizeof(*appletbdrm_state), GFP_KERNEL);
+	if (!appletbdrm_state)
+		return;
+
+	__drm_gem_reset_shadow_plane(plane, &appletbdrm_state->base);
+}
+
+static struct drm_plane_state *appletbdrm_primary_plane_duplicate_state(st=
ruct drm_plane *plane)
+{
+	struct drm_shadow_plane_state *new_shadow_plane_state;
+	struct appletbdrm_plane_state *old_appletbdrm_state;
+	struct appletbdrm_plane_state *appletbdrm_state;
+
+	if (WARN_ON(!plane->state))
+		return NULL;
+
+	old_appletbdrm_state =3D to_appletbdrm_plane_state(plane->state);
+	appletbdrm_state =3D kzalloc(sizeof(*appletbdrm_state), GFP_KERNEL);
+	if (!appletbdrm_state)
+		return NULL;
+
+	/* Request and response are not duplicated and are allocated in .atomic_c=
heck */
+	appletbdrm_state->request =3D NULL;
+	appletbdrm_state->response =3D NULL;
+
+	appletbdrm_state->request_size =3D 0;
+	appletbdrm_state->frames_size =3D 0;
+
+	new_shadow_plane_state =3D &appletbdrm_state->base;
+
+	__drm_gem_duplicate_shadow_plane_state(plane, new_shadow_plane_state);
+
+	return &new_shadow_plane_state->base;
+}
+
+static void appletbdrm_primary_plane_destroy_state(struct drm_plane *plane=
,
+						   struct drm_plane_state *state)
+{
+	struct appletbdrm_plane_state *appletbdrm_state =3D to_appletbdrm_plane_s=
tate(state);
+
+	kfree(appletbdrm_state->request);
+	kfree(appletbdrm_state->response);
+
+	__drm_gem_destroy_shadow_plane_state(&appletbdrm_state->base);
+
+	kfree(appletbdrm_state);
+}
+
+static const struct drm_plane_helper_funcs appletbdrm_primary_plane_helper=
_funcs =3D {
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check =3D appletbdrm_primary_plane_helper_atomic_check,
+	.atomic_update =3D appletbdrm_primary_plane_helper_atomic_update,
+	.atomic_disable =3D appletbdrm_primary_plane_helper_atomic_disable,
+};
+
+static const struct drm_plane_funcs appletbdrm_primary_plane_funcs =3D {
+	.update_plane =3D drm_atomic_helper_update_plane,
+	.disable_plane =3D drm_atomic_helper_disable_plane,
+	.reset =3D appletbdrm_primary_plane_reset,
+	.atomic_duplicate_state =3D appletbdrm_primary_plane_duplicate_state,
+	.atomic_destroy_state =3D appletbdrm_primary_plane_destroy_state,
+	.destroy =3D drm_plane_cleanup,
+};
+
+static enum drm_mode_status appletbdrm_crtc_helper_mode_valid(struct drm_c=
rtc *crtc,
+							  const struct drm_display_mode *mode)
+{
+	struct appletbdrm_device *adev =3D drm_to_adev(crtc->dev);
+
+	return drm_crtc_helper_mode_valid_fixed(crtc, mode, &adev->mode);
+}
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
+static const struct drm_crtc_helper_funcs appletbdrm_crtc_helper_funcs =3D=
 {
+	.mode_valid =3D appletbdrm_crtc_helper_mode_valid,
+};
+
+static const struct drm_crtc_funcs appletbdrm_crtc_funcs =3D {
+	.reset =3D drm_atomic_helper_crtc_reset,
+	.destroy =3D drm_crtc_cleanup,
+	.set_config =3D drm_atomic_helper_set_config,
+	.page_flip =3D drm_atomic_helper_page_flip,
+	.atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state =3D drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_encoder_funcs appletbdrm_encoder_funcs =3D {
+	.destroy =3D drm_encoder_cleanup,
+};
+
+static struct drm_gem_object *appletbdrm_driver_gem_prime_import(struct dr=
m_device *dev,
+								 struct dma_buf *dma_buf)
+{
+	struct appletbdrm_device *adev =3D drm_to_adev(dev);
+
+	if (!adev->dmadev)
+		return ERR_PTR(-ENODEV);
+
+	return drm_gem_prime_import_dev(dev, dma_buf, adev->dmadev);
+}
+
+DEFINE_DRM_GEM_FOPS(appletbdrm_drm_fops);
+
+static const struct drm_driver appletbdrm_drm_driver =3D {
+	DRM_GEM_SHMEM_DRIVER_OPS,
+	.gem_prime_import	=3D appletbdrm_driver_gem_prime_import,
+	.name			=3D "appletbdrm",
+	.desc			=3D "Apple Touch Bar DRM Driver",
+	.major			=3D 1,
+	.minor			=3D 0,
+	.driver_features	=3D DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
+	.fops			=3D &appletbdrm_drm_fops,
+};
+
+static int appletbdrm_setup_mode_config(struct appletbdrm_device *adev)
+{
+	struct drm_connector *connector =3D &adev->connector;
+	struct drm_plane *primary_plane;
+	struct drm_crtc *crtc;
+	struct drm_encoder *encoder;
+	struct drm_device *drm =3D &adev->drm;
+	int ret;
+
+	ret =3D drmm_mode_config_init(drm);
+	if (ret) {
+		drm_err(drm, "Failed to initialize mode configuration\n");
+		return ret;
+	}
+
+	primary_plane =3D &adev->primary_plane;
+	ret =3D drm_universal_plane_init(drm, primary_plane, 0,
+				       &appletbdrm_primary_plane_funcs,
+				       appletbdrm_primary_plane_formats,
+				       ARRAY_SIZE(appletbdrm_primary_plane_formats),
+				       NULL,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret) {
+		drm_err(drm, "Failed to initialize universal plane object\n");
+		return ret;
+	}
+
+	drm_plane_helper_add(primary_plane, &appletbdrm_primary_plane_helper_func=
s);
+	drm_plane_enable_fb_damage_clips(primary_plane);
+
+	crtc =3D &adev->crtc;
+	ret =3D drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
+					&appletbdrm_crtc_funcs, NULL);
+	if (ret) {
+		drm_err(drm, "Failed to initialize CRTC object\n");
+		return ret;
+	}
+
+	drm_crtc_helper_add(crtc, &appletbdrm_crtc_helper_funcs);
+
+	encoder =3D &adev->encoder;
+	ret =3D drm_encoder_init(drm, encoder, &appletbdrm_encoder_funcs,
+			       DRM_MODE_ENCODER_DAC, NULL);
+	if (ret) {
+		drm_err(drm, "Failed to initialize encoder\n");
+		return ret;
+	}
+
+	encoder->possible_crtcs =3D drm_crtc_mask(crtc);
+
+	/*
+	 * The coordinate system used by the device is different from the
+	 * coordinate system of the framebuffer in that the x and y axes are
+	 * swapped, and that the y axis is inverted; so what the device reports
+	 * as the height is actually the width of the framebuffer and vice
+	 * versa.
+	 */
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
+	if (ret) {
+		drm_err(drm, "Failed to initialize connector\n");
+		return ret;
+	}
+
+	drm_connector_helper_add(connector, &appletbdrm_connector_helper_funcs);
+
+	ret =3D drm_connector_set_panel_orientation(connector,
+						  DRM_MODE_PANEL_ORIENTATION_RIGHT_UP);
+	if (ret) {
+		drm_err(drm, "Failed to set panel orientation\n");
+		return ret;
+	}
+
+	connector->display_info.non_desktop =3D true;
+	ret =3D drm_object_property_set_value(&connector->base,
+					    drm->mode_config.non_desktop_property, true);
+	if (ret) {
+		drm_err(drm, "Failed to set non-desktop property\n");
+		return ret;
+	}
+
+	ret =3D drm_connector_attach_encoder(connector, encoder);
+
+	if (ret) {
+		drm_err(drm, "Failed to initialize simple display pipe\n");
+		return ret;
+	}
+
+	drm_mode_config_reset(drm);
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
+	struct drm_device *drm;
+	int ret;
+
+	ret =3D usb_find_common_endpoints(intf->cur_altsetting, &bulk_in, &bulk_o=
ut, NULL, NULL);
+	if (ret) {
+		drm_err(drm, "Failed to find bulk endpoints\n");
+		return ret;
+	}
+
+	adev =3D devm_drm_dev_alloc(dev, &appletbdrm_drm_driver, struct appletbdr=
m_device, drm);
+	if (IS_ERR(adev))
+		return PTR_ERR(adev);
+
+	adev->in_ep =3D bulk_in->bEndpointAddress;
+	adev->out_ep =3D bulk_out->bEndpointAddress;
+	adev->dmadev =3D dev;
+
+	drm =3D &adev->drm;
+
+	usb_set_intfdata(intf, adev);
+
+	ret =3D appletbdrm_get_information(adev);
+	if (ret) {
+		drm_err(drm, "Failed to get display information\n");
+		return ret;
+	}
+
+	ret =3D appletbdrm_signal_readiness(adev);
+	if (ret) {
+		drm_err(drm, "Failed to signal readiness\n");
+		return ret;
+	}
+
+	ret =3D appletbdrm_setup_mode_config(adev);
+	if (ret) {
+		drm_err(drm, "Failed to setup mode config\n");
+		return ret;
+	}
+
+	ret =3D drm_dev_register(drm, 0);
+	if (ret) {
+		drm_err(drm, "Failed to register DRM device\n");
+		return ret;
+	}
+
+	ret =3D appletbdrm_clear_display(adev);
+	if (ret) {
+		drm_err(drm, "Failed to clear display\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void appletbdrm_disconnect(struct usb_interface *intf)
+{
+	struct appletbdrm_device *adev =3D usb_get_intfdata(intf);
+	struct drm_device *drm =3D &adev->drm;
+
+	put_device(adev->dmadev);
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

