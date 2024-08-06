Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70811949615
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 19:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B35510E3CD;
	Tue,  6 Aug 2024 17:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="Mi3ovq96";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2088.outbound.protection.outlook.com [40.92.102.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C53F10E36C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 13:49:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NnPSWbUV0hszmPk9CA2LxTakjKCbLJ/mYEaUem6qwY/Kuj5elLNHFMWeo3AKBQN1U3ydAb8/6npRSeaVXiwvi5zmxQcHrgg+cIxXw1NXcUREtcWLcEDQxXjWpbomw3ewbjZQlRA9OD9tW2YdpRjSKw1TwrybmW71FsCH6eRM3lb8+f8sitHVA6XiE2X9IhgBXR6Qb7G8pY7ySuWXjhLYYf0VJzzpsld7wyaUlG8c3syYPw8wvfi5S2i6w6PYv4Q5XtNBjaannebsr3LKZhaL3Af8xDMM7HwMk9w/1yGnkFsPkxyeFdGjQlqGwHv8I39qOA5oj8O8/9GwUj7efflY7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYljV6lQyR/DvSjvEVVSS69P9uNf1effmU5txH9sWMA=;
 b=g7Z22adZLB1R6S+CxSuRcFhb4k47dSGND8kn0Dj9DzKq8QNguFBsN57KtJjAZ0wmeTv7dqJPks2LIczszp25lHGyxd1pVR22OAGFPzkNGztjUqlNrWsHK6soKoj6oPouZvjuvwmJ+AuAabDCAR/LpSk1eXyUa3CyCVYvH07EPKnWOM6PyCWtufgywPGks1tmXqn13D+2ZTtprfHZceLkGKlJKGUXIYjCU75iUiC/UOBf9dcQVYUvMu3ZwRBVZZ0s81DHxEDxpnuj6B28EPvt6gP2aeHMft+ui4GLUbKNIOqj/8GfngpQPIvwiMLOmWBZhWGK0cMEKOQdd2/DuNMTdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYljV6lQyR/DvSjvEVVSS69P9uNf1effmU5txH9sWMA=;
 b=Mi3ovq96UklNGgqpKoRgL88P/WcedwkU3LDdXGEsC0+hS9QKaRvkQd8K2mX+zYkzuWX9GayEC75FN83Vn4UJuK0sRksL/CoK1tsmtk1byuYed2wUqMO/HPBuaq0LI6/7snCij0adD320fT9eR0WVkoXxClyaddytoCEzHjWZ/jmOaR4nLPKXnUo1/8HEUBrvVszbVqk2wtO2IhyHorJKvtTWTHL8GFFrJr9CBolAOUABVM9BdJrcfGKehTlnUgHoCuxTvkeTu/8XuCuhMB4+7RudfpejzpcsYzcKk5eF9CoG7azXzCoJsSR+J6t1xk+Q29X0A7A/HMjl0JarcIPp/A==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 MA0P287MB1708.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:fe::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.26; Tue, 6 Aug 2024 13:49:43 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%4]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 13:49:43 +0000
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
Subject: [PATCH 3/9] HID: multitouch: support getting the contact ID from
 HID_DG_TRANSDUCER_INDEX fields
Thread-Topic: [PATCH 3/9] HID: multitouch: support getting the contact ID from
 HID_DG_TRANSDUCER_INDEX fields
Thread-Index: AQHa6Ad9lUj4/NPxr0mlo/9wuQYrdg==
Date: Tue, 6 Aug 2024 13:49:43 +0000
Message-ID: <9223E804-286F-4692-9726-2306361F1909@live.com>
References: <021EE0BF-93CA-4A37-863F-851078A0EFB7@live.com>
 <C0F2E161-BBAD-4AF7-B39F-015A5A609CD4@live.com>
 <C687A5C0-9922-4CDB-85C1-096CE9D82847@live.com>
In-Reply-To: <C687A5C0-9922-4CDB-85C1-096CE9D82847@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [j8b33ClWdm9egTSHGKFdho7XMt/KZVoeZDo1B9PP/inH5Nn2V+HlAHPqBHYApBkd7NTQXlYBs5M=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|MA0P287MB1708:EE_
x-ms-office365-filtering-correlation-id: 264465bc-39df-4923-5541-08dcb61ea04b
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|461199028|19110799003|3412199025|440099028|102099032|1710799026;
x-microsoft-antispam-message-info: FRAdsXC38QTpjeKtv04dEdLr4mEATh4Ij2CUm6tKJoaLJ31Mut0DVcC8xb9OR1bUPUK026gnX4Bl/IEigkyPKaShY9HB5b2P/QT2K72vAfn8XMil16qao3r1IWmUIp7+lOJzPwZAmTHlQJ9sM94UXSrdaOMwxCU/XNcSMP8kiz/NFQILB9B1EvUJ6KaoldW5vZ5vT7F9IykFN8HHisnGa9/PVff7c4AnEbJQz+ahyDia2w8Cittb/IF570xevP8s5URfYsDoBDgTAN2HF7PsoiWfNvBJiIeeAmhvOD0SRhw3GjqIu2aeWZVPwfbDmOxd6Ahu0fOHX/Nkxs60HqDqCMZfkqfQl00+Dr0y2M8ZaKPk56HkpoCVpKVJDQk9kiia/0Rgfs4hozGGZhi5e5mg2Y8grFfRGaWAX2eiZGko0cLUg+DMY6SyscZooF6NsFz5OMWvORI3z9KrO3jWdI6Hs7G4JAWlDyP3udoBQpQ4YQnjwnS+1Mi9oC15xmxduNhLDOeD06JeTB6OyDVfRqCs0uP92cOHG2+1W3FWGuxzp8n0zEPHz7UDF2QT7Y48TIQI16OkOiIKTg8GdhrJVpoQTnN2MBjLTPkri2ylCqAjWE+gkfZggh5m7B6o9AAytyIkZkrf2JwVtieV0AXtHGeMU2iCYQMLeVOVrS1gMY48vR0OuweGcQvpKLLQUNj0vIeH
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mTx35u3Qj33nVNaf2sigmKnOoGZXPmQX48rLVH3AC7KHrpMIwK+MJOcTXxfz?=
 =?us-ascii?Q?/+6UjwBrpK0w+OgCUJ8U7qpfLhylSz/SEj8BOZvpVIn2BnHRcjscjUFiUfoY?=
 =?us-ascii?Q?/qN+xHRcpfsPU5IuY2oVuiB7wiBL+zk0nk7MrHZOWrXUKtQ5ryfj6tU5GteN?=
 =?us-ascii?Q?ZLu11/gNOtHX5KiOeKhfnfXxl/gQh69tFeMSkkLnj930DKDglHLSBt8XZdH9?=
 =?us-ascii?Q?7q8Y1Gat1ilLePnSI+wG65SfuvFjZP83CvTgfDKY1NbspF183YlGl3hrzX4L?=
 =?us-ascii?Q?aQkUv8TCdFR1G2Zq1OkUEciCGsBUZZY88VRlKRFwhRRVFy52SIPPOxEp7mHC?=
 =?us-ascii?Q?9X/lYSNqcFf1h59u3afyOdcvSeJRO7JxIEjxS0qm6+eBUSISmVpxI1VmovmH?=
 =?us-ascii?Q?RDpiq2mtBh4mx7AHJ0pgFXAOlsaoUDCFhkGKQisXMkuaBPBlyhySRrOIh9hh?=
 =?us-ascii?Q?ttC/8/8mr/8ZpdsuLL7hNx7CYUJBQdb2VLWBdCtOVmtUQyjTXSNNr511qYPa?=
 =?us-ascii?Q?EhKrC5VanYVds5+RoSGtLouDcDEAsgN/HxL8Uo+YMcYJUN37cUh7A+8KnGtW?=
 =?us-ascii?Q?PCU3zx0vBKiyHIdC4QRbp7howYu3NqzgZNIeKfNV9nXxH0ZiI5ZO0KLkz4le?=
 =?us-ascii?Q?bznDENfXa1s/H7PMgM+/I3O6XdDG7LyoZqeZsrxm5w3VMasiCB1nu4ncToZm?=
 =?us-ascii?Q?G4661n4AhNNoHuYkgMDVdN/OYMk0BNUDOmrtNLO2/hwGCVboC9BS1KPryywS?=
 =?us-ascii?Q?9g6qlohVJdYhy9khuHiAqmdoJYvQJP07WTiSGVhuEus6xtk56MDs3DiZBCkZ?=
 =?us-ascii?Q?QFJ433AdBv4GCA/pDOUIALKVfcDOrgDy6humTR6EB0yIZosEjlkc7ylQ7P5P?=
 =?us-ascii?Q?Xzi41ywsjUh2+i7QWaj7qkLl4pR0Alg13/KlnUalwsQc1fBHa2mg6Vy3EHGN?=
 =?us-ascii?Q?G+8pdm1ckrZy71znmMGQK7pl2GLTAuDwCthQAYsmzX1uON+7Lbs9ALMzeu93?=
 =?us-ascii?Q?4FNoHFBM+Iu1eQDUot/qtrYyRQEqpPSRoZgs0qp7YYNBCcZMKSmnCI+KcPpk?=
 =?us-ascii?Q?YkwPZJ8/BBJAb/I3x4rT96gqshAJirUkbyApQE79swccbjeT6FHsoNvOUt0y?=
 =?us-ascii?Q?/HU4+aPtH16v8YBHLzRW11QO5DcbhkNTax3XYpgGwHp21IJVS3wd8241ou5g?=
 =?us-ascii?Q?H9vdZFRhF9vGpPG/ZRt8iSGxNYPujdLxBl8i2KUQx6K3Lt+mNg8Kqha7tPWU?=
 =?us-ascii?Q?oBDsGu3L7+5f/+tifgsPD4iiRuS/8Q4fdgk7/SxV985gcWIk5E5xpDTwNmPv?=
 =?us-ascii?Q?wcJrYGz3cAGaZyoEs4XHlre3?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1B5FF40860AF644C95C402CBE841999D@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-bafef.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 264465bc-39df-4923-5541-08dcb61ea04b
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 13:49:43.4208 (UTC)
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

This is needed to support Apple Touch Bars, where the contact ID is
contained in fields with the HID_DG_TRANSDUCER_INDEX usage.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 56fc78841..3e92789ed 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -635,7 +635,9 @@ static struct mt_report_data *mt_allocate_report_data(s=
truct mt_device *td,
=20
 		if (field->logical =3D=3D HID_DG_FINGER || td->hdev->group !=3D HID_GROU=
P_MULTITOUCH_WIN_8) {
 			for (n =3D 0; n < field->report_count; n++) {
-				if (field->usage[n].hid =3D=3D HID_DG_CONTACTID) {
+				unsigned int hid =3D field->usage[n].hid;
+
+				if (hid =3D=3D HID_DG_CONTACTID || hid =3D=3D HID_DG_TRANSDUCER_INDEX)=
 {
 					rdata->is_mt_collection =3D true;
 					break;
 				}
@@ -814,6 +816,7 @@ static int mt_touch_input_mapping(struct hid_device *hd=
ev, struct hid_input *hi,
 			MT_STORE_FIELD(tip_state);
 			return 1;
 		case HID_DG_CONTACTID:
+		case HID_DG_TRANSDUCER_INDEX:
 			MT_STORE_FIELD(contactid);
 			app->touches_by_report++;
 			return 1;
--=20
2.43.0

