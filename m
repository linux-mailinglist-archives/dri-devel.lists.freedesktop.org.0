Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1CD94BCB6
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 13:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6E110E6EA;
	Thu,  8 Aug 2024 11:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="UDZujMnQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2015.outbound.protection.outlook.com [40.92.103.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB79110E6EA
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 11:58:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rORm3BH4A9bU4/q23DKqJKSzcKzUY1GZcH69EHPAJbJLragSeLgmX4U+he2uKGy8tCMVu5ItSIlV1nJD5fSi3yYQwe1dzTaY3x+7AOT/s3pdp/C6JRCT7kZkE4anu7FrlQgmn5cGPmeKAR+nJCDPWOTqjgAfw2dfEeccsVPlN0gyIK34RfQUbLAa5363c9ZNptGHFqhsoxz56t6VIhnRqhCVBn9XWtcdjXFbigkgSkjFeG7VyNeKUq8qpZeRTRz0zGnEo2MHqFfO2/5i1HmBs0WDoQEYbj8TDsXECtUW+Y3VxmxWZzX1v47bQar+ybYPvUSRvSFY60gxbdY4itC+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbtXp3cnpQpbYNXYGShy2lxXGof4j5KkulzUYghWbSI=;
 b=vSmiipWN7qE7eOG6n2/L3Im9VnUgqiBV4BeQEWjSCC6oe/115BVGiKwl0UZO0XSliKnq0tMV/wIZePKYYBEQ/cuXTi2t3vcTvQRxk043/9OpymBUMJGSJjQ+UENjqmNfX5NaKJzuCfguCyhL1Hzb//tWw9TctViaPS8PH08wUxKP47Yp1cqzFsrTmxd11DwKnl6ClLn+Grla9BEG/7lE4JVebmzFrpc+2F6e86nUXhnSPHSrmsAz4+vAf7r6oI6gGRExy+UI2jrRQhRyQPgAFN9T7xK+p6VqogEl6GUtMzl6uJBd8lokrbXpERdRXttPAqXzTfysjjXqGtDfNJY08g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbtXp3cnpQpbYNXYGShy2lxXGof4j5KkulzUYghWbSI=;
 b=UDZujMnQCqInZOBBIvnDFL51wEnM6tJjiBn41/OHsFdsBDyT5gdh45Hs292Y1XLc0uoeV4b+6IEZm0A0kv5oCwEeqg1Zdep/l/e+KUWgEQQGklhPweBBDj2/U+eF/+OAJpUjmcZLcL5h82ey4xDGtlkKtK5xYfrlpij50OxGNLS3aLh43D9+ms0PLdQKD9DNzqYoZO5AF3rwthLIZ6M4wbEF57mym9ZgqqNyJNClx7SoMaHRTkBM36fz9gSzbTaODyrp825mxPDcCp5x16lbhkg8dnr7FgSKy2HOD+Q41ZyghIfvjIQinUk4WiCf1MZs5vXg9uBGM1KUEADxbQ2ykg==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN2P287MB0925.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:130::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.14; Thu, 8 Aug 2024 11:58:15 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 11:58:14 +0000
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
Subject: [PATCH v2 4/9] HID: multitouch: support getting the tip state from
 HID_DG_TOUCH fields
Thread-Topic: [PATCH v2 4/9] HID: multitouch: support getting the tip state
 from HID_DG_TOUCH fields
Thread-Index: AQHa6Yo/9x8LYIWKpE2EWsODzD5prQ==
Date: Thu, 8 Aug 2024 11:58:14 +0000
Message-ID: <05F523B5-7307-4022-A2B8-C3C96DA0A92D@live.com>
References: <9550ADFD-0534-471D-94B4-EF370943CF80@live.com>
In-Reply-To: <9550ADFD-0534-471D-94B4-EF370943CF80@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [s0hmGNe0aqpPFPGYqWnlUrWYGxAQuz7Un4o2+urBcMTFi6l9r9EvEyIcAmkMhtyunAeDCQiuykU=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN2P287MB0925:EE_
x-ms-office365-filtering-correlation-id: cf94d570-f6f7-4ddd-9483-08dcb7a16258
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|15080799003|461199028|8060799006|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: X1Q/SRuPV8DrbZJh3GCrjFiKLTc+fQJB/E/EGZZ2Lu/gbPIyxm2JY/GmY/qm1PLgibVMA3VOTGai6T5nYLuuKyR7uAW3OgjSkXaRSgEZvYLtwLTHo2c7bIjHxeAknCABCCXu4m8cegvLY6rcyYYwgBSu8bJG8y0jY+RNcmk+klSZw8FlCFvl+GxU3CGDSTtbH65ysmtb/a5PhivI+B9ufTl1IsNkLZhceKvzlGwroM2G1ZcyGCaPSL76SnDEBiyHtGAHOUb38U8d9MqavW2uwd97TBJgw//TM0cDNiCVuVLEDnjeYLNckMLgJkJYBYdGsRsf/yQsW/jUzbEnJpigjDRW2MP1IjruPjM8OV0+iR0+auaiOB7EjOUA+r0a/MI+tBzHUoGV/vVwhUCuBruWg5EkzDbc1dW+4zPiUvA6wYKP6v9cqpkzuq+K/DR6VZkRHymb9AxjhbxF2DzzhaZed5yiWLFxGhGyOZaPpW3USBzwZMV3/huguh2PUlY3JpftGIalnsxMAu8p6yO1EGlYTrQAmHq7DbzzzWRLie0rqNpuD4bt8IQsp1seqhbLiMkDp/IKQWqTd7JVWaDt4KjdmTDeFUNY71SgC/tkMZNzvcjxFRWxaKQ4I3wS4WdW5FuHBQ8NGqFp8Ap0OvRS5C6YfPoWYiboBIi3V1ojup0FaQS9ycPPsej2jrTTzUsRC/sv
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?E57u2z2EAPSCCaucQmg/gZGYW1lfjhOLOKm2ZuKxhTqPpz7e3svVzssay80+?=
 =?us-ascii?Q?01d9uuk4AVtA1l6nuovy8eSBXobx/ck1tj8G1ja0gpUFb0EblwOg/OW7rst/?=
 =?us-ascii?Q?pKWn2JAQLaWy6ntiFmslNSt1SgPS3T2ho6BSS5lOTy2ZP2hNDiX99htEP5qn?=
 =?us-ascii?Q?UlF7ae+v72iIG0rfSme7eSx1p2igrx9rYFSCR4pm5OKME+bPtmrEwu22OgMZ?=
 =?us-ascii?Q?QxaBRfkmzKgAjzarZjs7IFT7xIJsHe+ZRjMmTDOoz0DoxOGyjyVrwmHtRyro?=
 =?us-ascii?Q?k17q2wv/5KVknziv8vTSPW+cRQkYiRPXgkjSrl5xr9YSAF/iRf6G1vqHbDTR?=
 =?us-ascii?Q?jAvVFJp4AYu9d1vlO6lAXlK3HgGjMxGUB/60joLxdn0OiBs7TZWaYPvHaBcd?=
 =?us-ascii?Q?YgtDHA1ByHgR5MeO/9zbCK4Rt1UF3ylh4DGY+q0eALCs8LySZ7fRdWj6hLua?=
 =?us-ascii?Q?8YNrnZua90FCmCSG5/YNjIYMRUAnMhfcY5GBHgzSsd0+KtTsJjKTwTwOnN/x?=
 =?us-ascii?Q?U5s/FHY+XFZEAzqEc5UC8P6moLeoz8dv1Le9qbAyHO4LHQs580Bo48OqVUo+?=
 =?us-ascii?Q?Ug1kar7v3LhBy+Ks6WSl/Eij/sYj8o36cRMecpNfpJIYHJhOdMtgRKw+aa8I?=
 =?us-ascii?Q?uUNakK8/uWX8jbfWQ4PKO6q5vI8OR/qPxiczsYgGiUeun2JecXwQD6zlBe/I?=
 =?us-ascii?Q?n9vsyk5c85KEFRQzqRdYLkbAfl24h3qXvsWITQKzSXtOPSV9zEt1VXXRHHSA?=
 =?us-ascii?Q?fwWA1ElPv54tMrcwJnbBkZwRSX0cS3jb1ZsVc5R4eqIf6fqUx+yM4QiD7sts?=
 =?us-ascii?Q?FBgg4LOWJQyyG43eaMbJUvIWkBzLN0TbJ8e3KoigUVRq/xhlDf5dElFw6+tZ?=
 =?us-ascii?Q?7Bo46K/nMWKwzHLjXVRPA3jrAHWlemkaSKrA1HK+0nks8RasPbcJ7doPJ01B?=
 =?us-ascii?Q?tfQvy8fjE+CjEF7dAobR0WH/LHqLVV4kkmSZxU+fh93sRzhUUJod0sZxyV7k?=
 =?us-ascii?Q?znaXiNhg/5rsP47/FaH6gPwioErsSr0/8i338gPuSc+tSDmxKdlkT8HsmEgi?=
 =?us-ascii?Q?+PXeEKK8x/LCtX2Tzam9X5rucR0mxmErteyL+ZuhNRKYeUFgdkp2Yn8ZROjm?=
 =?us-ascii?Q?S9UECEiYPK6/rf/BHVCaFwInTcQIyYqVfFrUrJyUfTHa7rQuW8Jan7WPljjj?=
 =?us-ascii?Q?BjPQLymVS1dS6Q0wbdpKy/fdMZA52JITf+B4s1/EQn44HS2XZyJhr65+qf6r?=
 =?us-ascii?Q?xV1fMjeJMGnfhfi7BGJIOUYYYYlaxY0o4EipsZrJXVgfPpxqEDz9zLu6c30I?=
 =?us-ascii?Q?+6nATI5iIIg3VuZ9TS27Gz6i?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F3191398D9386240970CD45E605335FA@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: cf94d570-f6f7-4ddd-9483-08dcb7a16258
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 11:58:14.7055 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0925
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

This is necessary on Apple Touch Bars, where the tip state is contained
in fields with the HID_DG_TOUCH usage. This feature is gated by a quirk
in order to prevent breaking other devices, see commit c2ef8f21ea8f
("HID: multitouch: add support for trackpads").

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 3e92789ed..571435da5 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -72,6 +72,7 @@ MODULE_LICENSE("GPL");
 #define MT_QUIRK_FORCE_MULTI_INPUT	BIT(20)
 #define MT_QUIRK_DISABLE_WAKEUP		BIT(21)
 #define MT_QUIRK_ORIENTATION_INVERT	BIT(22)
+#define MT_QUIRK_TOUCH_IS_TIPSTATE	BIT(23)
=20
 #define MT_INPUTMODE_TOUCHSCREEN	0x02
 #define MT_INPUTMODE_TOUCHPAD		0x03
@@ -809,6 +810,15 @@ static int mt_touch_input_mapping(struct hid_device *h=
dev, struct hid_input *hi,
=20
 			MT_STORE_FIELD(confidence_state);
 			return 1;
+		case HID_DG_TOUCH:
+			/*
+			 * Legacy devices use TIPSWITCH and not TOUCH.
+			 * Let's just ignore this field unless the quirk is set.
+			 */
+			if (!(cls->quirks & MT_QUIRK_TOUCH_IS_TIPSTATE))
+				return -1;
+
+			fallthrough;
 		case HID_DG_TIPSWITCH:
 			if (field->application !=3D HID_GD_SYSTEM_MULTIAXIS)
 				input_set_capability(hi->input,
@@ -872,10 +882,6 @@ static int mt_touch_input_mapping(struct hid_device *h=
dev, struct hid_input *hi,
 		case HID_DG_CONTACTMAX:
 			/* contact max are global to the report */
 			return -1;
-		case HID_DG_TOUCH:
-			/* Legacy devices use TIPSWITCH and not TOUCH.
-			 * Let's just ignore this field. */
-			return -1;
 		}
 		/* let hid-input decide for the others */
 		return 0;
--=20
2.39.3 (Apple Git-146)

