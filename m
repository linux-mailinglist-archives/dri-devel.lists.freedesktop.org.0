Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E95E94DBA5
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 10:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887B210E0FE;
	Sat, 10 Aug 2024 08:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="LCBI3tva";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2064.outbound.protection.outlook.com [40.92.103.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6956810E0FE
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 08:53:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OROdkvTnyqO06218UGKMsEglDRiqsXb7kAjXWw5JZqKtezHQo7bvewVmSkuTdiFbSYXsbWLQX45rSu6gLzcxAHnXRmh7CCwGyjaznqrxuGiBPkkmPmUi1Q2AAlRsDOFZt3jlNC6cCo2i2IZ1G7mz6EBSIH/OYTxetc8wDcDWG9yW27NvC9GnqxJdbeJdZM4wAVXaFUueB8j2FNdfUawQzXLUF9I4VjknmagJz3GTqQC4/sKXm12YjwB5Ap794USB85ECHTpXRpGVS3Hhf8l/GxoxbVvFORc6uml2N+VT7F7I2/pHS2TyIlx/84S/6bnlWHmPsLNEVZTSFa1F60xCGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myY17nFmSwRYTFKqjQNWGfiM/kNxDYUsRpGSdEJLqhY=;
 b=w7YoRBbfCXGmJXsZKZO12GCEQ2jlOvs041iXn1A9BCXm/F5cQNpzCIVGljWwR9X2hGhg7C0g8mUXgG/E+5XWjvm6WWimHxqpidzLFPz5IHnGr1kyOWU/DKfN5/OKHrU0MVuek6AIfDNHOPQyzmV0wcrmcigkR7+y/Bp1tN6MXjxMNEXnQZwFiDHcNtIi/Vcd3fwpGOfEkOyYj+xo7K1LYE1U7BPZU6oW7QcsDEnjyFVcuayxLR7Rb39aCxN1EbDGuPj8IHrkK3KxsNEidYZjHUlr+kGsTNJe9kx9jsmW/vp/RCO7NgVNNQGK7XgDhNgqeys9rAM9lF1Ehmxv5cWIZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=myY17nFmSwRYTFKqjQNWGfiM/kNxDYUsRpGSdEJLqhY=;
 b=LCBI3tvasklG5bqLbvEEAjqgUEO7+KOKlR+DswBWTbaARi9Z5ARTWWo5IwkeQOPbMJkTP8Wr4VDJN4WMkKgeQAIhIa5eQ98pgNjbyuD+RqFzcQ+jXXyvf7JW6OtfWuA8z96OX1swRCBeGfGUFiAqSwQiNSsWE2lqJoSdUSVg9OTkoYdmTGuAJUbNfiyJZOltyh8oI5hWBiBw/V4WW5VBTlGPhsIBulUyeTPsqNOGDxzk3SJ5vJStO0AMUrDGWZ3Siju1KL/Lg/Dv0qHWZy97+2JpCv1Ti41r3spcao6kPdbLrejvNGrKu8tFM0XT1qTyDL7QUCj6CkSCyPDICGqvyQ==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 MAYP287MB3581.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:149::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.17; Sat, 10 Aug 2024 08:52:56 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.015; Sat, 10 Aug 2024
 08:52:56 +0000
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
Subject: [PATCH v4 6/10] HID: multitouch: take cls->maxcontacts into account
 for devices without a HID_DG_CONTACTMAX field too
Thread-Topic: [PATCH v4 6/10] HID: multitouch: take cls->maxcontacts into
 account for devices without a HID_DG_CONTACTMAX field too
Thread-Index: AQHa6wKxDcXhOorIO02e1p1dR8530g==
Date: Sat, 10 Aug 2024 08:52:56 +0000
Message-ID: <669CAE3B-99BA-41E1-A843-95AFC31A246D@live.com>
References: <20190CD7-46CE-400D-9C58-29798479660E@live.com>
In-Reply-To: <20190CD7-46CE-400D-9C58-29798479660E@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [nJgL3xMP92b//Aq1OaSt6g1MHUZpIJ0xZoSY2/kXZD6h42r6XPXQ7RLbuM3ZopBgHhnoOFFgAYg=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|MAYP287MB3581:EE_
x-ms-office365-filtering-correlation-id: 27b8883b-03e9-413a-5279-08dcb919d450
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|15080799003|8060799006|461199028|102099032|3412199025|440099028;
x-microsoft-antispam-message-info: Epga8qWg/HGNW+Jk5KnFghSgzlhhLpwihIEZzYFEVMrMnqy9Y1KpZXzNDwUkidLnyUlWir69/e5cuqW0xOb+yJgY9lCQfIYpaohGSprIcjmWbCz3Szht9gHmke+TcusmmyABAjDSc9n+t/8ytfq7khj+2xTXdxmwOHAPpe3Dg+Xh3Xl1OeEZYToMI1tGiE7CoQVY+fZBmoph8/qCdiDWaYPw+3B55mm7Pqf/rbVCJ3pioHsdJrcxXFZf4YjSEHiWwkurZxgGeB10qpqiu83Nmkce8Mvyu/mFSedrdLQ4RsmMn3ABNyLDOx7ZSReBdWquqwLQMY7JKlmkHIurZ1rLV/0Ai+PadCQRppqC3R8EAb39A+vmYJA0FYZYmr03FF4SqunQvVCxieQWW0aAkEoxN13+m4bfMP7JQsD+LHlkTrjJAXedY4FQPgOir7HPuQDizV6ssuY6vMg1aWGvFWiViV48TViLGCys8xGpIlO+LI37R6nPuZx1afXvdqsefKhFgLgq4q3dLWpz+EgcQKPK76GPkUB5TFxAW+hocVDCYs7Dd2+RJ4BI+UaeoEFkVI57DJ6NZmfjXp25XlUGtarbguWyJTIaW+Tj1uhGq7xETktleq5pPiYLzKwmh8yALKfQwX0U069J4TVrLZ7nmLo7fp6z0To9vS0kO+NhPLTAGq00j/BqSWOzfFRn8onAzyHU
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Fh+2ySG8NJZtDMOpQ20kHVch+6Z32TQlHEswaOlOvHvzzvIO/8OHS9SKc2js?=
 =?us-ascii?Q?znRLUIJOAnzi/Oyt/dVu9kpWsYfXA1SBB5dzdhWa2DxH0eEHkOqgZthcP8Qe?=
 =?us-ascii?Q?0SadRTa6612JTdc0/+VrMSyNhqBqPfOwEN/Xiu0G4tiZDtO9hxTXOVDT9UrZ?=
 =?us-ascii?Q?ryK9kOFEp9G7wPoW3BCrJRIiVNpobTWnPHW+T+MmUxuS1YmRAF6kyToUVapw?=
 =?us-ascii?Q?pA2rvazA1J7ppn4BynP1tsV1lxr3Bt1d1D64MBP6Pmz85zSjGo062zIAj8rU?=
 =?us-ascii?Q?Dttc1cmeI64qU8YV8fAiNy9jqN0/jubBQuZLIYnqwoauZrjvIYM1oZu6zjFp?=
 =?us-ascii?Q?1d8pCCQT88kHVQ2+QyvCtIJu4KQQjolfEnlvcHq9Kziqrl/gkzjJ0L3ZkpNI?=
 =?us-ascii?Q?iKNCft+rkC2yNJ8xds07Pmf5jBQyfp3juWXPJYBcqPRXFMeLUqos8W2yKA3B?=
 =?us-ascii?Q?d1oWsWHlhujAjljIqpoR4vF7vXlOxbz/Udg7Ym5575sKjEcI/IkjOgJEn/fD?=
 =?us-ascii?Q?651G6XdhcfLKjEEKOeL5j1Fxa4MleFSGrDs7yfUAwO17zZ2iEXy8rDvLum2k?=
 =?us-ascii?Q?s6if5N67Kxjl4DLs52mebwwineZpjfRBS72prl/pxX8Wh1i551XXxNWAfvhn?=
 =?us-ascii?Q?DxLQiQg5nwj5PYNWvQKxdnhFKdFu84YogWDhLlVdt3+I/6stOL28eMnvghWO?=
 =?us-ascii?Q?QceyEnIMYW7aZeCxqSiRKGPoDS5sBBYxW+hkS2Xz47BjlagV+THG+fiVGcnn?=
 =?us-ascii?Q?eteswcNeAQ4lSa9d8Z6WudJKY+yXVuHPvgOC1BhciiDu78vCJFRpBFb4zaFS?=
 =?us-ascii?Q?0n379p4T3kHkxAs+l1txGNuaJe4k+Ob0E1s/sTqBMmKejp6+D5uW2PTN8xQX?=
 =?us-ascii?Q?LKPWtCt60wZ619GlmORwxpWibfWCPDi0rKabfE17m8dQcDcsNaHqJmaJOxT6?=
 =?us-ascii?Q?7oTIMcpoCot2H61XS20avqMUfmjcN6G+dAptritEGMwLdX+TuqTWDb1MSda/?=
 =?us-ascii?Q?cAWEBvsNiZKiqQZruR2Cf8GMHvX5Wmxd5HpYZ+umz9jNmCNjEAD+1yPJ/9x0?=
 =?us-ascii?Q?RkJrBUvheSagu7WI8E4PW+lx3vo5AW1TGsrTkz82/cJ2jiDtUqHAEQsZT8EC?=
 =?us-ascii?Q?MDDZ+N2UcNtGCEs4wuifpETg9Gro37OZoNbkIxx/+r6V+2EamMbDL34MM9M8?=
 =?us-ascii?Q?pvnIYu3JY4UTEAjztgOsda26Ky5uQxr4yx3j2257L4ke5RoS6UgpW5eSxXnO?=
 =?us-ascii?Q?rXE0U6erR8KPsGQkAn0eFj700cvo+qQRk9p+O7UvytDllz76qVP1BLe5tCGB?=
 =?us-ascii?Q?R8q3XskZyA5imyDMfG1louv8?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FEF65010F01A0544B6FF19E6ED74DF7D@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b8883b-03e9-413a-5279-08dcb919d450
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2024 08:52:56.6726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3581
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

This is needed for Apple Touch Bars, where no HID_DG_CONTACTMAX field is
present and the maximum contact count is greater than the default.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 571435da5..60b675cd1 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -490,9 +490,6 @@ static void mt_feature_mapping(struct hid_device *hdev,
 		if (!td->maxcontacts &&
 		    field->logical_maximum <=3D MT_MAX_MAXCONTACT)
 			td->maxcontacts =3D field->logical_maximum;
-		if (td->mtclass.maxcontacts)
-			/* check if the maxcontacts is given by the class */
-			td->maxcontacts =3D td->mtclass.maxcontacts;
=20
 		break;
 	case HID_DG_BUTTONTYPE:
@@ -1309,6 +1306,10 @@ static int mt_touch_input_configured(struct hid_devi=
ce *hdev,
 	struct input_dev *input =3D hi->input;
 	int ret;
=20
+	/* check if the maxcontacts is given by the class */
+	if (cls->maxcontacts)
+		td->maxcontacts =3D cls->maxcontacts;
+
 	if (!td->maxcontacts)
 		td->maxcontacts =3D MT_DEFAULT_MAXCONTACT;
=20
--=20
2.43.0

