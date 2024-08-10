Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C6494DB9B
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 10:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFA710E0E4;
	Sat, 10 Aug 2024 08:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="uVwe67SW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2016.outbound.protection.outlook.com [40.92.102.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F145210E0E4
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 08:49:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gzVuqmbddPP6Y1SFmOErUwsh4ypy6wNhnVj1cmOeEBS8v/mNvobv/318JJKvkgD5PgOdYquwpniLWD6NG/W94xEzHZ2ak1eDtdSy5vbhrCdANCT/gDmybb68oqgWgYUjqNAPz7Ec+WfvDtgEAUT0xyOwEI/9raONo2EbYYIyiKD2sm+DLgoyHALbRpt54BjW8aFJ1bNUSSM+fbzBPXHeSSo61Bk8/BXBxR4+H1+Kwz/Ui0tSjoqXKuEVcQYX6UwdkGrhK7qGpirrqNAFhbhKoCo5swsvdfnYLwuW8bod79xjAmIFc/S22PpBEaeTXIc/71SNXUrx2L9QQnZEDMaigw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzJQNbir3aksonInPunSVUKKA+KLTVCBzdPlbfwum3A=;
 b=edxUEInPpbgbvMpyFmjbSt233DSy6MhMq6Bd1CwTKB90yf0Q9++pl6kAXj3ogCCQrC0uDt1/BDcpX8Iba0e87CcUJTFWfSshce85M3QXQ/DBVK+GVTGVk0KwEEZaE6Nj35wyeBvE5hK/AfcUznpW4P9/FSyP16/tvsUfXbjp984DCtpHbFB0hoyKfVoVCWI5UcPAW7Fn0SCjao4b8QAQLPVxgvJCdYe5qi0HGKHJF43Myl0tkKu0Ne63t7dMzpKqo9l2qwyIDOwTtxnR/Qel0KyeEt3PtnR8K65lHDUwjWCIyuJUuk3rwQy30NSNqw9AP4kfyyahGYghm1WTCdK0Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzJQNbir3aksonInPunSVUKKA+KLTVCBzdPlbfwum3A=;
 b=uVwe67SWKTCL3tE7bq0JFp98x3i0Y/5MHYunlVuw9nF9qY3elBt/Q5b6p7CIGqbxTPm4OdUhrOjnTsjpDY0KIXrpoPErnNXE9FgSc9smRV4oDhYOs4lD4L3oKN2lZ/V2I7CMHyT7W0OevVF7mByrUe/9Ay2WSoaWD3J16N1pN8AUOKpDpI7L8sZH3k7+Xt3ExmvnVp+ZIVIGSLdKNiwk5ajpl5DEaWqcjQMbkhfbvPjZD6HLqyYI1iUfW64XSU1sZIOcNxVjOW+YTCyFWAyQSNDzvijVVBGXSvpnvyzEZDlsRos3RUjHyV8kwD7LsomE9s04lloz0kDQ6wVpogesEQ==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 MA0P287MB1259.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:fc::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.18; Sat, 10 Aug 2024 08:49:31 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.015; Sat, 10 Aug 2024
 08:49:31 +0000
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
Subject: [PATCH v4 4/10] HID: multitouch: support getting the contact ID from
 HID_DG_TRANSDUCER_INDEX fields
Thread-Topic: [PATCH v4 4/10] HID: multitouch: support getting the contact ID
 from HID_DG_TRANSDUCER_INDEX fields
Thread-Index: AQHa6wI352kR7409NkqJvNOXq8lPag==
Date: Sat, 10 Aug 2024 08:49:31 +0000
Message-ID: <B21BBDDA-04A2-4D0E-9EAE-F1D57BA5A8A1@live.com>
References: <20190CD7-46CE-400D-9C58-29798479660E@live.com>
In-Reply-To: <20190CD7-46CE-400D-9C58-29798479660E@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [PJ6uxLDLzZdjCcn7t7xNqVqQga61AD9r4sLvqnn3luKx4zX2OiR9DUeB1kmFeXBiujFuQiVMXQE=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|MA0P287MB1259:EE_
x-ms-office365-filtering-correlation-id: 721ebbe1-cbc1-4bdd-05e5-08dcb9195a37
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|19110799003|15080799003|461199028|102099032|3412199025|440099028;
x-microsoft-antispam-message-info: eI99vmsTlVYrD/tXvjAd6ucpO+foQ+d3fwSxSUJxonQ1QVZw5sQzXxv/zrF48l0RvodmpMBb9nSq4gmDNszXx8MO4qKsF0ElrTWcxN+YbDNC+15QdSZbq5KEwO/LbhjEJuZGGc6irYKle5X/YcMUPYY+pzXjZ8cm02gLsOvJOwOFsa5vRrz0HstIkRtQ6h3Rnube9hEuC3+y+hZSx6/u0NDdW9RABDmwc9oubsKwUNgjGe4pdXo3uwGUSn00eJKnOXEmmEHaudwW0hFSc8iL0dwHbABio9iOu6gq8WKMi1+HMCHHi+9sg5+9EaaAPj2u2LvbGHqXx0np/ytHenlOh+bcw7296Hs+dhWwPcVdiPtV6viZYu9x503QbHH2Kazr6EcMN3yJmTZ7rChyGDIQFtGjAZ9tUWs+jljMdp2o/cc9Loh3Rxo7xwJlo+s/hfE3c/BnVAbU5TU80f47AYly7Vn4uJ8q7yjhNRcx7/NYvqGhVnO6kp9mXjdA2oEKYCj3bbVbeYBWLWc6KH4da5ifd0b8fHiUe4jXAmJ11VPpuEMHmkKD55jPJM7M06GSYOoGJ60AHR0aUmJCNGSvk6DULgGBlTyPNt30uJlFAkdNzH5bqIGm6j41fYK7Rg0NQAKw8CgQRYRtPmx/zpjOfUjO5dus824nE0Zgd+IxOCdHVliIGVglvv+wU1BKCFLYfJxw
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?O098fviTvdmvYopKwVeweXXxznXB5J+Xrzma5Of/7Us73Y0/wKmmq/CRsEKK?=
 =?us-ascii?Q?ZfGiFX1N0BjQt0+FO4twge40Mp8YolhEn6EEQiuNno7A2E5/hUlRaVcpBGmx?=
 =?us-ascii?Q?LKu044mSvk6niuxPOnQja2PMILZNGrWrIcFLLGDukNV90fvukrClaJJ9tR9M?=
 =?us-ascii?Q?buHUiRpO2v3/rEOpHpZcamdaSLge47AbzdyfIlMLd7Rr/j8qD5oANUprzAg/?=
 =?us-ascii?Q?9u/vmUhCNPn+KLr0ciVbvLHETYqMcda3n0W2zRFZWuwXDxMyCdH9JTMVQYyI?=
 =?us-ascii?Q?y7XiHOATL5NMwBigkHigeN2o8Zus8mr1z+8ThE4yyLxrPZlUkXKXNp1N5Zqf?=
 =?us-ascii?Q?Xi1HV/R2nlQH99CwuhIle89NGn4vD87MmZ14EzlQjKfy7pJd8/bmI9H/unJJ?=
 =?us-ascii?Q?vHDLsnEjDWyIqZqf0d5nXljr7LagHcpMHvKiO9UV2vw/o/BbZ6U2u5azYyi3?=
 =?us-ascii?Q?FBFUykyI6pg1sRhqMsvedZbIEtwOTBcP5k2M+eixAmXdzSiv0jalH46wwdDV?=
 =?us-ascii?Q?THY5D0MkgqhlrfC95hSHRUby56y58y8KWNm+K5XBSFulZyfilYhMjZJfO88K?=
 =?us-ascii?Q?jluGSjNYWgZYmgxI7weGQEFCGtE6r+khX4Xy8D6Cmrd07xkunhNe1l1XklDx?=
 =?us-ascii?Q?Oqj7BWq5lTzCMr+xwqc0G1gGly85CS49y8vA6CM8flRKML2TX5A2lc7DUc5T?=
 =?us-ascii?Q?kvJLO8/2wya/xSsJ5k/sM4MMFm+v/vPmabX0rtFEOkZwGUYWlc30N65boXF+?=
 =?us-ascii?Q?F6Krgy4P4Vr5SJ2sM9G9XliFc9QfxHnk6Zq+V/u92MXH/x7u062/LfPdS/UD?=
 =?us-ascii?Q?Axj3+0ZN3lh4Xz5J6W+YpfSda/RwVxOX0wwNwTHAxY2agW0fsG5vKEqb8n6a?=
 =?us-ascii?Q?IcXvw3WW8ck5XO0iUn0ciA/v+O1zus/VrzP/zFmDwcK8nbHS9QoszD2HZr06?=
 =?us-ascii?Q?8DO9tfZgNimmUyI5EZ6D5TDI6qkY5Gl7QjhM9Pcm+Y5gP0Kvl/Uuchk7ZeOW?=
 =?us-ascii?Q?dSkHX64suvG/O9kjiRBOIG4jkoRnsF5xaUdlRQ9qOoHtyBp4Iw9u/qV10P3p?=
 =?us-ascii?Q?S4Hj3/IF698m0Y+MRvGh1BL5gVyB1/TKqliHxOTf4O3/OhkO8/1FfWqPHIDw?=
 =?us-ascii?Q?WAd8CoLdPqrnK7K/H96HrKTYQurSZNBBtNvO87tSYr8zNX2U2wUTXn5ruqMU?=
 =?us-ascii?Q?B09URcO5cD28LyyrHm6R1u4UgafR0FVqQUrE+zpuAabpLXvJmB3PAe1/tvcf?=
 =?us-ascii?Q?fi92EIL4hleqzPH0regI8+o9kYpfPwFN4N9Zx7Gk20IVAZVicXMmPnCyVf0x?=
 =?us-ascii?Q?JLeYzIviksB9R9URd6gz2f+l?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A9D6033FB771D44294D6ADDE23FFB01B@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 721ebbe1-cbc1-4bdd-05e5-08dcb9195a37
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2024 08:49:31.8288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1259
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

