Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCA2949610
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 19:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BCB810E02A;
	Tue,  6 Aug 2024 17:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="aAwZHa9r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2083.outbound.protection.outlook.com [40.92.102.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8209310E36C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 13:50:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pq+DobrnypoU1Vm3TtAq5RxG4gzboeGyJNTcdxXZXB5KahsmWNLsEOsmJrS203ZG15xooSOxXmHlOZSD+gmonpNV4TLg+70OXy7JrV/CSYohrP85cRjRYL29be2YrGtUYJGLp5nml66LTk9RMqFWDEMcKirAncflnqlWSg+283scM3w9OIQhvKelO9AojsDJb3iUyMtXuIpVk+l1IiHYNPAHaulcByaJ459E1SQhIiBuZjlLtKm62skyb/kEQbc0Yd0M+Gue5b5ROd3vQ2ZEboCCQBRVhe/dFZNX/PiM9zlpYxzxCpFpZhJ54BFB+jOYd2M1zH1U47GA/xQg4PdA+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RoSZyiqImFZSicR28oGP/RkEpGdNrnqOstKFEqFyhjY=;
 b=HcOxzZNMjDTq850ysVToAjfbnz4Q+AWhznO8SXtQaO0DfmTKOFntkALJX/ch4qNsHWKnYsQAdqPcfJSrnL+kG2HZurWAfhniY1gx/Tm5V6caweSwY/+PPAFbkYq1n06H23x14RgLc197WcM6bVYoNk2Yp+SXu4EFMmz4kvNO0/dZV+zoyVsXokDj9EjZewS7yFD7M7gxUZQ3xDsrHzG+A9OOCVrCBOn4KzdPuTnk/pR7kN6n1TquJmtEn04t02iYtzqkj5XMwzCDGD+Erit3s4o2Z6CixnfdWjKadpJuvpidpAKdTf+IT2qjecDqDSHTImEgSynWbhZcF8KWdSZ7rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoSZyiqImFZSicR28oGP/RkEpGdNrnqOstKFEqFyhjY=;
 b=aAwZHa9ri5yjwbIN0QN57nJX6tGycmOqlXvXcxR3RtODt931l1NtiJo6v79TtVlYOnFSmnwKvKBGz+8sWFNhqWXVCcedItnJKsGAJntnmGMGbmhkbNQGbkl44A4ztzn9qOzeeaxztvS2DZ2I34Ys35xyTazV0NZUcHgVCE1fH/streCWbxW0v/CTuGuxS2qiG4PA0/79Kfxj1Pu60DdCQRUF9PX2Att/20S254fLOI+dCSQ71fRJbYLbCRYadfOjSGHu5LK1sh1FaEFTHG9m34fpDkSAMJc1OEApPBqM2QeLyGXVFHbsZ9nY/jraTSMrU7xy3f1XiOqJd11lPT8q5w==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 MA0P287MB1708.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:fe::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.26; Tue, 6 Aug 2024 13:50:39 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%4]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 13:50:38 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Aditya Garg <gargaditya08@live.com>
CC: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>, Kerem Karabay
 <kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Orlando
 Chamberlain <orlandoch.dev@gmail.com>
Subject: [PATCH 4/9] HID: multitouch: support getting the tip state from
 HID_DG_TOUCH fields
Thread-Topic: [PATCH 4/9] HID: multitouch: support getting the tip state from
 HID_DG_TOUCH fields
Thread-Index: AQHa6AeeXBJahpnuhEq1a4HCAw3vOQ==
Date: Tue, 6 Aug 2024 13:50:38 +0000
Message-ID: <C2CAAA64-500A-4D76-905B-DC3E2A884941@live.com>
References: <021EE0BF-93CA-4A37-863F-851078A0EFB7@live.com>
 <C0F2E161-BBAD-4AF7-B39F-015A5A609CD4@live.com>
 <C687A5C0-9922-4CDB-85C1-096CE9D82847@live.com>
 <9223E804-286F-4692-9726-2306361F1909@live.com>
In-Reply-To: <9223E804-286F-4692-9726-2306361F1909@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [qBoi9aXREk8BqN3mMR8yQAuXg6RcGVtmUftgrMebj8ejW3s2q5732i5P+hSox22rDrvg2eywggo=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|MA0P287MB1708:EE_
x-ms-office365-filtering-correlation-id: 8523e7e6-eacc-49dd-3a87-08dcb61ec154
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|461199028|19110799003|3412199025|440099028|102099032|1710799026;
x-microsoft-antispam-message-info: IXBBw4NinoBT8kVU50EdQVQebVTHP7ircpVolXnjT0orzeTWKiKCQo1ratFDUiVNdizOnNNYnvK8X94ExooNG8tZsW/C8WJHoTf3sDbnLfSkV2hJPk/npa0i+frnitS3OOcGSYpWhVstbSLTGUeNHLJry8wwxXwQTwaBKKwuSnluG8jVwctqZoKgkFeW5ZgvEjNHbB56dY2+dxCyK6bKBnsqqRQLnC72mzZLC9/AUAKGVHtkBX9GEX4qqleo8zp0rpkFetokjBT8lYdNS8HWIrkG6JSwyskJx9ilps4K2OC4p1n6E2blQNKNG9leqmhVXjSbCtXKaiMsh+uyIMpMsSavzbIhQFzaV30+HVH55P3vCplt4vpbv+5wfGLbMGaDMSJnn6HowWrzeQk/hsdoJI9gUaIM5SrZTrXJ+Ufa0xZamxPJ+2aVeDt4z6k4ObbL05uK6iFljj21XkBgBrAP3giojVxG+M+B7Z13O9GTkuoipGHkI54PGN8ZC2YRb3q2uL1tCRwPUFLQ3cUyQygKEhU4X6Gvqu/pzf++EHKxY14NGFFD4eqFn6Xh/33qAyVuKktDAsdjYKA1T1Yt2VDRHP68CSKALIH2UtQx2WKfjzBIhSdEdckEW+EDK/aGphgmTGZlJeUNJh8xhsI70JrFPDDl/CoTBWQLLrd/LXX0VshComYZY/rCLZ/fnouu0oJ8
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?60E6KDhPygqBGbIfckeL2cmCCYBkDY7pQPvsOQ5AzjU8bp1V1ZXngklfQjjf?=
 =?us-ascii?Q?XrgsE0YdlQt2tRVnJs93hQPMPm89c4MhfUl7LRmHJmESzvM0JIjnAEg8RDy7?=
 =?us-ascii?Q?5DoXLI5xKTnON+bBwQf7VDZspILljxeg/zaeXmllD8areVVo7L5RoEef55xc?=
 =?us-ascii?Q?pijbkqihhxEQ6KW7ld06biygCddEulJp4unrFCRiNPZ18VQrioxsLEN5+sOs?=
 =?us-ascii?Q?YPwyRKXg9+1JH7/aQRTbbxEZxyV+rZOwT/+HbZDLtyFn0bswKZpNIeLtRa05?=
 =?us-ascii?Q?VMQzb279Qf1qbbz3BgJXLA+Ulhltv36w48rq6L3xyVJZraTBmqUpZa6wJBQs?=
 =?us-ascii?Q?E57cGPdBHjFepsuofGEM8cApld7/90v+4euJqWxYeaz5/NUx1VqY9RFUp2ny?=
 =?us-ascii?Q?p1nNTDL6VbWat/1eZIsIZTJY4zU4hKy/3fErnSTnMZvBuKDmjyWZd6E8LWXk?=
 =?us-ascii?Q?pW5DsSpnkioihJL7i1s3ZjeZrhtJ8IACciVbfVYQAkEe5GK9ZA/M+QWtrUly?=
 =?us-ascii?Q?H8jEGX0WuZ9xFoxDYpzVHLPzQcfYlUx7OaKcrLwq3zQr6JMyyXCBqKs3VZlI?=
 =?us-ascii?Q?R3dINddhIzgbbgNnPi7C5dNMoBfF6CJPcg79nlSPUK5hEjPhivtDBZTnQHsU?=
 =?us-ascii?Q?fbTwiHexKzwfopPWfUSh2hruCKqt3gR2xfmjwcnnVZvsnwyPFzvq/DlPfR/m?=
 =?us-ascii?Q?f4TrZgtnDpSvpYQNUJMorBzz7hAw8cynWQoecX99s1e6yUWiTYmfsShaWE5h?=
 =?us-ascii?Q?iot3g0h0GXL1VV8erl4ELIfZHx7VCVrqPnCgD/wcb0PZeClxWKeJtGaGytGD?=
 =?us-ascii?Q?KL2avlhFQ07EnVAJ7RfD6lg9co6cg6eJtHI+qOSpeB2C/5oSlFDiWoc7VgzH?=
 =?us-ascii?Q?oOmdEOE6wofyIqwIdPhWqDcRFO66H9cm59gVjaHy9OUeV1HsM7pHV+6MUK3Z?=
 =?us-ascii?Q?ZxhtXlMWAsAOixgOyIdGRAEMesOx/xACPK2N19NIhzfgthcCoGfqwEiPsHJ0?=
 =?us-ascii?Q?G1ng1PRTgSGaio9dmBGMbVCAH4qVlekBPALyCg8qU/yCLVsoWexGYzGWWZhb?=
 =?us-ascii?Q?crbTMERmb/FCArvF25Vl4AT/73PLywLEnJcprsCZOsNvQazw4hizP8Qxl2+Y?=
 =?us-ascii?Q?PgAgFnKw8oFkukF7n4wBfnAPE/mIMSGolkV5425YyoQuwY+l0iy6NRwzHiJp?=
 =?us-ascii?Q?2S79iDKVEp0IqJSXC5V2uClSMBDJK1r2DLttF8md/jHZ5y3xJNwliAmsoA4b?=
 =?us-ascii?Q?BdRxzUExL+IKxjkyTk8UkToAllma4omGIq3Qw8urgG57l/wCeA8lIKDrDbqD?=
 =?us-ascii?Q?PtFfKBto0DLdwYTOadNuNv9a?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CF1C0C976ED21643AD668B638D528B7A@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-bafef.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 8523e7e6-eacc-49dd-3a87-08dcb61ec154
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 13:50:38.8527 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1708
X-Mailman-Approved-At: Tue, 06 Aug 2024 17:01:42 +0000
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
2.43.0

