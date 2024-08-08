Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D122694BCCC
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 14:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A64D10E701;
	Thu,  8 Aug 2024 12:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="prBxQf+E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2061.outbound.protection.outlook.com [40.92.102.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0304910E713
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 12:01:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXYvwCX86pkoFz4bY1LvYkwclunn84+yLwMWtvIG74pYKuL9CDRA52evxAeFEvlEDj+V3vSE6ojShcOEDIKNQ3awUhmS6cAMsklQTIfujWdl1L0zwexS44YDBl5Z0KQkkPqT/OjpiWsPbXlPGg7DwCfMvyCOumR4xCdrQ4yq90Lwal5zuKWzwRQR0FtDTdNEeLmZYS6KNcnZFBee2i74KLtcXUdHxSbS979vcFb5QcLgdQkBk2GRWWvFnOeDM9nHw2opzZE0uDp2xlCqMEGYWF7eRgkO/zr2ljbA/vTVrh9g4uLO4SmBBKrzerWGx7YTkpscUIrwKstZmWCUr0PkFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRg9eJxDc4ARlekO+g7uV6lPG0TkCEJFMy6dAol1E7M=;
 b=ehR6lkiQ4oykOwGz6gGKZKr8f3exF3faceqQnMfCSHQ7PmB8z5dYkHZGFY/BZGosSqFvVB5VwcdU37tJnkR8qEpp+u27VFL0NTHMUq1lQtFN+bDhG8vIuuv7ypOQmtejvzpyJxwmGF7JymXepEUJ5Gz/oBZfd2TZRDdlidATue99eAF7Ltx4VuC//UU5EvUQ8zB7VF7S60ilsC/3krglZBY0WKgi7Qp6Yn1/x4d9iREgFSAhXf6hSZRLoFuXi7smh+7byupDN158BWPEgjS00RI7hdFxz2bAv/5usyBTwrQZJ5v6XSFM/yzYIg9F0PizEBGSGGwKzwYoZxozTmEfkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRg9eJxDc4ARlekO+g7uV6lPG0TkCEJFMy6dAol1E7M=;
 b=prBxQf+Ee/7Cg8EORrhO9E108okFu8dOhJNLuwCj1zFvZecZgKACTTl6lXaBmxpmB1IrtQIc0YPQr94kj8Pugb4hwgyl2sGsZt7NP1oI6S94OiqAXUrQNKjJ9sZ2gRYJK9HVYXwZKzpBDUP1Fk9b+QQzA4+34qQjDSXZdymr4kpnKdleUf/XQRpuyUwPxt+GQm7dpATKynQzffqbs6vGycgOM90jEuROxL3lu7xwkpnXBmbwVLP7SCD4T3CxwsrCv1M9u8v40yUjHpqBpgywkyfLfTTbU7JJWVjhwuXJiAd8hNOEZ9beG3IePpo8zhklZ1w7LXLpKIahhj203TVHMw==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN3P287MB0339.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d0::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.14; Thu, 8 Aug 2024 12:01:22 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 12:01:22 +0000
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
Subject: [PATCH v2 7/9] HID: multitouch: add device ID for Apple Touch Bars
Thread-Topic: [PATCH v2 7/9] HID: multitouch: add device ID for Apple Touch
 Bars
Thread-Index: AQHa6YqvzOez1ap2/U+g7ZZ+h/G4ow==
Date: Thu, 8 Aug 2024 12:01:22 +0000
Message-ID: <6AB25F04-EA02-4737-B5FD-77BAAEFA9DC7@live.com>
References: <9550ADFD-0534-471D-94B4-EF370943CF80@live.com>
In-Reply-To: <9550ADFD-0534-471D-94B4-EF370943CF80@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [TE0ZrEGgc/1+pS77m/Wjrt74y0yWy2FUAeTYdjUY9yu5UE/ij0wPUXUaM+8Mn4LDaE798j6EIVU=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN3P287MB0339:EE_
x-ms-office365-filtering-correlation-id: 3f263054-759b-4420-894e-08dcb7a1d214
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|461199028|8060799006|15080799003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: mUfGQz7HYqFw2nSy/OVvOzWJEPoYbi9OaSo1Kf+yNcDeFitTwAeZkPMSbXqKexwNCJMzsKqJtlmzzJds5/70lPuo7Yamqbqq5ktu10i4U3F4Yp3iixn0OZ7h47m1EjxPsW2I131wYjL5V7B0T6DCKUw0KCF8w/qBX1lQkQppXttjB3FC08pPgIsgy9694wlWX0voDPgVeHOTuNnfF2qCwWzX3TyzkCi1yACcI5TzKi+FQpDPVSR6Jpk0m3qqzZSxJYAAV78s0OUnypUNA+O+liw3JsFBrTGUU0PsN1g36OZrYi2EtmNXVCZ1Q6GYF7xkHXjXhBXSnsmNKLdHXtISuGDrQ5iQtZU5bmfaDeV+8ELjvVdvschssgCohRC+N3y28C5eyZ6HpwxA5S39gNaxTU817WyvNpPK2k2WAzN6sLOcpJWugl/JJgWR0R6UsWaswT7e0oeURM4YRuKRVNcMF0/Gcz+ZDDi+HxGH8l61G3Tl2lNRZupHaKbvtGOxmyPHZtx/jS8MMfLxzTK7BH3YJwh6B1AHJeVf8KsocopAIpVsG6PN2GhRdhSwAHZC1+oue4o91sbCYyCRUF1ijqD2O2zyG+hdP980G+dQ/rtziI/SiW83yhe7gYEm06YnLFC6BFYdREPxrK9Pq6WBthpiydgaL7pRKg0xwKNsIRKty8EEqY+CEIQtCFGsMYPTdCmz
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XY4qMeanqyQDILrA3IMiqebs0wv0dJ9/wwbRMsrP+B5ofxG6afa70GAm0wqD?=
 =?us-ascii?Q?T6eNah+yiLyuwj5Hu0VUbLSoPzBeEtFcl0nstUDVkFTbNVaSUy3ftQKFHqDJ?=
 =?us-ascii?Q?RPk5pxDSpZsClRjKkbPKBXEFc4zBQy+G4IX0nTwxBHFQ59YgMb2xTR/cAxit?=
 =?us-ascii?Q?T4oc0sjLcS4mvi/MkXsUTXL/jex/azOcKPvRpPHtwnXRITcn1j2YM9NRo+PP?=
 =?us-ascii?Q?Rul6Lp2cVVmWaGY4uibNMrtBNj3BQCzenKRmy05WDx4lHc8GR7o7JHslq9Od?=
 =?us-ascii?Q?xRQXQIHs1GGIAqs0PQ9lonKJQtqjAPOh+odps0inaF37zwx7bD6owsbtabva?=
 =?us-ascii?Q?+u/3sG5Lh8nMdB6PhSW4iO9tChW7MuxLY6Wlo90ZQO3Ddh4I7Ia8SdNDAl3y?=
 =?us-ascii?Q?gnFxztowbspsLKPLAw+w7ZN5I8/6O6nEC98O41UYf4wDP7/IK06LEJ5lufA9?=
 =?us-ascii?Q?FJuWM4IidXI7DPZlHwbWhZm0Qks+OJ7D8/GHP5fkOJlLnt59yDxs65b+1p7o?=
 =?us-ascii?Q?ai3q/0sUJBFf3G33a/9geLT1wCU4YrIaQHRnGFwlQBAHGFZcyFIVErt2j31s?=
 =?us-ascii?Q?QBCkWkh1A9qiNi1sJ9Qpvwx8u1U+OrMcNgQJ4AwWyf8AaigmOAngfM1kLI41?=
 =?us-ascii?Q?fR0gkxdap1JdkOLI8viV/U9EniMpER+wEui6TD2dTI6vhYdsi+PD3Beb2/f6?=
 =?us-ascii?Q?OcsvgtOODqciCazkl7kkBD98gIVsvn/lKtrbB+xdlj8W5VgcJwwuom8bSGAd?=
 =?us-ascii?Q?KN6nnf19ek9S8Ea5kzBygmx8RM7UGO1IB7+wVFymW8zacZFDWUjbuDND2cdY?=
 =?us-ascii?Q?U+V1hTx0W9n1LzvrbpqjCcufQdZAa3JYNA/OXsDeQ88j5KLPiDVGiX+b8irv?=
 =?us-ascii?Q?KY6N9x+wjREohaohK1NtD+T4xeZj+rm96gQCBLx4V7hMM4XWI9YBUO7Yxk31?=
 =?us-ascii?Q?Au3rxTzwM9GK1aWH6pdzs/wM/PCGkmTNzKDqGwb94c9bAYbFFnJ3F8DWEvZJ?=
 =?us-ascii?Q?nv6PzFp8X5XYk/uoLU7qyPeYSNcdkqmUOypLkoIS0QCByav4QC06j4PDQdCy?=
 =?us-ascii?Q?9s5PNposrS20GzYMnhR4R3yMvpdA5v7AEtLtvrJTISa+48ODN4LitjKBqkpz?=
 =?us-ascii?Q?ZgM57CQYErCJKjD/G3MwJrmq9gmftianTOANaO5shTMpEa4DAqbHbKz9K7Xc?=
 =?us-ascii?Q?pOhoXl/qQeWaK0BR/UgvBfbyc7ZWoaaedOXIUJw81JKuB47bE6UdJVvIDHy0?=
 =?us-ascii?Q?6eM26xr7NE5/SOuWnhR92vU+1eL6tqe1NXZLZlhoMWJXdM/yHKVu4pC/Q2qD?=
 =?us-ascii?Q?rrTnrwN2Md+k3ZwLFtOdAMBp?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <83B75ECA2854B541BA20B45AF5B694BF@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f263054-759b-4420-894e-08dcb7a1d214
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 12:01:22.1641 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0339
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

Note that this is device ID is for T2 Macs. Testing on T1 Macs would be
appreciated.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/Kconfig          |  1 +
 drivers/hid/hid-multitouch.c | 26 ++++++++++++++++++++++----
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 72b665eda..35ef5d4ef 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -744,6 +744,7 @@ config HID_MULTITOUCH
 	  Say Y here if you have one of the following devices:
 	  - 3M PCT touch screens
 	  - ActionStar dual touch panels
+	  - Touch Bars on x86 MacBook Pros
 	  - Atmel panels
 	  - Cando dual touch panels
 	  - Chunghwa panels
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 2948fbcbc..0fed95536 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -214,6 +214,7 @@ static void mt_post_parse(struct mt_device *td, struct =
mt_application *app);
 #define MT_CLS_GOOGLE				0x0111
 #define MT_CLS_RAZER_BLADE_STEALTH		0x0112
 #define MT_CLS_SMART_TECH			0x0113
+#define MT_CLS_APPLE_TOUCHBAR			0x0114
=20
 #define MT_DEFAULT_MAXCONTACT	10
 #define MT_MAX_MAXCONTACT	250
@@ -398,6 +399,13 @@ static const struct mt_class mt_classes[] =3D {
 			MT_QUIRK_CONTACT_CNT_ACCURATE |
 			MT_QUIRK_SEPARATE_APP_REPORT,
 	},
+	{ .name =3D MT_CLS_APPLE_TOUCHBAR,
+		.quirks =3D MT_QUIRK_HOVERING |
+			MT_QUIRK_TOUCH_IS_TIPSTATE |
+			MT_QUIRK_SLOT_IS_CONTACTID_MINUS_ONE,
+		.is_direct =3D true,
+		.maxcontacts =3D 11,
+	},
 	{ }
 };
=20
@@ -1747,6 +1755,15 @@ static int mt_probe(struct hid_device *hdev, const s=
truct hid_device_id *id)
 		}
 	}
=20
+	ret =3D hid_parse(hdev);
+	if (ret !=3D 0)
+		return ret;
+
+	if (mtclass->name =3D=3D MT_CLS_APPLE_TOUCHBAR &&
+	    !hid_find_field(hdev, HID_INPUT_REPORT,
+			    HID_DG_TOUCHPAD, HID_DG_TRANSDUCER_INDEX))
+		return -ENODEV;
+
 	td =3D devm_kzalloc(&hdev->dev, sizeof(struct mt_device), GFP_KERNEL);
 	if (!td) {
 		dev_err(&hdev->dev, "cannot allocate multitouch data\n");
@@ -1794,10 +1811,6 @@ static int mt_probe(struct hid_device *hdev, const s=
truct hid_device_id *id)
=20
 	timer_setup(&td->release_timer, mt_expired_timeout, 0);
=20
-	ret =3D hid_parse(hdev);
-	if (ret !=3D 0)
-		return ret;
-
 	if (mtclass->quirks & MT_QUIRK_FIX_CONST_CONTACT_ID)
 		mt_fix_const_fields(hdev, HID_DG_CONTACTID);
=20
@@ -2249,6 +2262,11 @@ static const struct hid_device_id mt_devices[] =3D {
 		MT_USB_DEVICE(USB_VENDOR_ID_XIROKU,
 			USB_DEVICE_ID_XIROKU_CSR2) },
=20
+	/* Apple Touch Bars */
+	{ .driver_data =3D MT_CLS_APPLE_TOUCHBAR,
+		HID_USB_DEVICE(USB_VENDOR_ID_APPLE,
+			       USB_DEVICE_ID_APPLE_TOUCHBAR_DISPLAY) },
+
 	/* Google MT devices */
 	{ .driver_data =3D MT_CLS_GOOGLE,
 		HID_DEVICE(HID_BUS_ANY, HID_GROUP_ANY, USB_VENDOR_ID_GOOGLE,
--=20
2.39.3 (Apple Git-146)

