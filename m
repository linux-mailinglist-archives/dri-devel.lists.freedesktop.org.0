Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B3994BD11
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 14:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A19010E6F7;
	Thu,  8 Aug 2024 12:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="UQvV6TfI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2021.outbound.protection.outlook.com [40.92.102.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB3E10E6F7
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 12:11:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pc0zRDuy0jkOHT5+dfJ6FsApGnvup/p6WVhoEtzueUPRk1WLDBmpf83XmuslLTDXMIDRIUSeHO84mrjKy8h37+bmovm/TjU5uJBgNhNmKj93enYRTWq+TWZyRm8edaRTxOHaktGHjHDOfJR6WT+1rCQXPVQvb5ul66ppvOdKyDvuRzun6u8ZUuovudTl7W3YOh4GNHjMEXquXJCjpNJD3+ssrBcekSZrPBxQ0Yk3PsTFuhqLlUq+y6E3wSyvCK3Sy8ldhRPPIVyFs4j5sIRWY572UkAcYLzxGUAexmJNxN7dm1lXMcPRAaCTXt6HFlJnWhe4M30uyYHEbYxJMAHnpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXj5HFioyjIOLcAdy/oXSpQUwhLoR7Iglk2c3NpVYu8=;
 b=lW20K36umvydOG3eRNZVbPUpTmjhxuVMJe0IqLS077SlZtJ1Ff9zsTX2xi/UDTAXLMAYaigYTYRw5RyFjmxivIckLVJjYq/DJTTBiinXGkY03oYalt/9+LWmWov24wMeX9moTRjO6hDwJ5/DH8RexPDwyo3Y2fReh1NjtVxoDJOGb/8HNTB9+7ACX+3R7bcvUz2nBuAId3zQpg8bLUep96x6X8JP3wFlTOci3o0wOK2Wvjc9BeLh34+HqbEHkDfIBnJVp56ZBahma1YPTVIJJ4f+017QeW7eOIg+5e2YlBHyAisV9+hiaeXHQFCRmfvVhGNCOomM3IscWCCA9BltaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXj5HFioyjIOLcAdy/oXSpQUwhLoR7Iglk2c3NpVYu8=;
 b=UQvV6TfI3tTC4Gc6OW7a3RzR8twOikLnCPlM15axNT4xP9elECOiarK1GQd9JVP9CmD1xp/A6QVZbU8uRUMMltoo5qoUDa7o6MhAZGFabjThiyyDCO9g8edefl3JPE/J+Be0xioPqnM8uAmBk5sGmBCK9YGvlgw2IaOe3mT3Ws0ViZFd8lunJoppGqLV48436ciPb9C6HNlLVCPPqXFbLrP6s1RMXbx5VN0H8uYuISDfDSUH7gXX0sIWVigSGd3NdcdPoY8yWpZ1jVQf9BEEY6LNVD/gEWeowyjylGRcBYKbAl073He2KU1wyrJSw9ifh/SvFGf881Ai1E8aMaa0wg==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN2P287MB0723.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:fe::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.13; Thu, 8 Aug 2024 12:11:41 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 12:11:41 +0000
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
Subject: [PATCH RESEND v2 6/9] HID: multitouch: allow specifying if a device
 is direct in a class
Thread-Topic: [PATCH RESEND v2 6/9] HID: multitouch: allow specifying if a
 device is direct in a class
Thread-Index: AQHa6YwgQh8KY2FzhEu4GvVwCf7kzQ==
Date: Thu, 8 Aug 2024 12:11:40 +0000
Message-ID: <69728A02-3A4B-430B-9DAA-CCD6EAE82F45@live.com>
References: <752D8EEA-EE3B-4854-9B5E-F412AFA20048@live.com>
In-Reply-To: <752D8EEA-EE3B-4854-9B5E-F412AFA20048@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [Vt8IURprjHQ1NpaHMEtMQlccoR6TICAPrFFQv3MyQtGJ4rg50sFdgv2NAyaZzEUSlpKNKoloreM=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN2P287MB0723:EE_
x-ms-office365-filtering-correlation-id: ef3b2292-7db3-452e-a2e6-08dcb7a342ef
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|15080799003|8060799006|19110799003|102099032|3412199025|440099028;
x-microsoft-antispam-message-info: Ai7EcZHaUlQrta1587kK3oHevRemUronuDch+K/1NVswWJp5prRbQkKSzU0Q5qLulqJWVreaEzKqmBzDICtEUQYNShIbEry+574+vwTvkuSRjAVCeUoN7IhOyhy8AV/uHOrHTNfDVq60birfIc9k64iNa1hHQbzNfMEZCbTbMg8TtaWZhs1Uj9DlCAGx2KDFy1Mf+0f92zbVad7U778c/9WImeEF2atE2u8dlCgqbnsrA8C1zNOU6tfAZvmMWlb3YSgCGYBpwrawOoxLNqQHjKImIgK/CLpj5uUULY0iizoXsgn9W6NVSEG7JWQFrit7qYxz/n3qTIoyMbTJmvHNXsCIsVuhMaHL7DFf3u2aOQ21kILt6LjGjch6UFXRMBDWlSvXHyUUlvGshY/9CvNL+IKTaMNrB+OAjmYsYgOVJUz0zAGxQq32E9UNCcL+X5Wv+nA3MgHMpCvhwk/fxjYbt/dWx0VDhFBOLZ3RHppAwktKkPMmSOLFRpDbwWAZFzWvfYhXPOxqEqJ9XQw6U1RzR8r3uKSQCJihT/4C4gL8zYn+xNcSuiBaOrGQ+TPs1OZg97EczUnolNFYDI2lJ4sCzHqbZxAEpu27GGaBASBGuqWuVOp/00OyS7mMWyhusciH4N2iz3m/1mTyaWJAjvf3xmNi0YsPKwCuYa5IPdM3iSBGf79IhVq1mpaFNJMXjFLa
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9GadjDa9OnE1xE0KsHLpaIHEGcivbOIYjcKY4ODun7MlPPKu2VgqKwgu2sJd?=
 =?us-ascii?Q?DgrFoOyN8g1ernJNkOQs2uDT3ZSXRjGUK3k1K3yzXLx2qZEyNvAY3fWftpyJ?=
 =?us-ascii?Q?9kBZMde02D8hQAH4rgRFGy0hpCfp+bGVV51amDtyWNT7yxXuKgcOp2FOJGH3?=
 =?us-ascii?Q?HRYbw7pLCWepQWTiukbfkpu+b5K7ZlAd2YmcZHqRL/o1vmcduJaDqBMQy2vf?=
 =?us-ascii?Q?3Z+ikBj3+GGQREenrL8jiHA3+QPVT+nMmLFQjj/FDuSa3mIz7uN7Qo9onjuA?=
 =?us-ascii?Q?FPFXZ0D+k4QMu3oCxWmCg5YjfzirgrCttlt3Kl8O9AsoFAcx+cGSGF1Z2/ML?=
 =?us-ascii?Q?HICelJ+FOT7icPG1RIHEsSqJM/Uw35BnMM6QI+aIlvAWqp3zfQVX5F/qzhfO?=
 =?us-ascii?Q?sXcUjSbEoW7GgIxYwLGERTNBz6iN/WxKmgTXIdwDvxFiZfeUCTE7MNM7solp?=
 =?us-ascii?Q?G2Jzd2dxXMwfSSSsrhPpkmWz2yqYgL78F0bnjbvNPigOT2E4MPrFv+IPeKq5?=
 =?us-ascii?Q?CqMf4CxiyWLXuiS63Ext0qtEjFY+dXvxafldVYq5Br53ZvkzGHlbzAkukYM5?=
 =?us-ascii?Q?eDfv330zeaTDLuJLA9Jp3pofQmK5MPhDMgDIoN6PUG7lJC/6hQ1Bj2rUxWLO?=
 =?us-ascii?Q?L6XEJ+QNPtuOc4nPKe+ukLecqyKlQdzTmB/fn+getZJCIJzTZoooDZvDoWmr?=
 =?us-ascii?Q?a8zGq9Ycbyv2R2ZM8cEYsvRWb2Q6NasBLbIII1eA7zO9iVIsyDAShHxZ6oB1?=
 =?us-ascii?Q?R8eS3C46Gg7wFoj+PXzBpFaeY1mqIyK3S8g4nCyyPN3XG6WB3C/3dEDe7SLH?=
 =?us-ascii?Q?NxLvmFSl98Pz11L/XBDoheaOQbiK2fy8Blz9rhJU5bILrY+e9sn9txwSpXyt?=
 =?us-ascii?Q?WblrxXsj4VMLgVWCQlQsZQcj8pkWPy2ZYbRu7FF0pGQi8Ju7v+CnDzNOyXnl?=
 =?us-ascii?Q?i4MlsYxb7ZrGq30H9aeBdujx8b+FGoZ27BC0bbgJV2Fc0Yg9ZzMsGX4vMmNh?=
 =?us-ascii?Q?3Taisa/3AdqxRydbp78ixQKHpbkmQIx8gPmumW3nTfrlFTS0qPl0wpZGv77Z?=
 =?us-ascii?Q?pzmbxjaywZFR7mrfg50Ng3hzuaTw4nzF/JgqidnLRkHaO1Y/gHdj5y/SV/wW?=
 =?us-ascii?Q?1YNwJdlIEcjcuxIXbypP7tsyszqDVgel7nnsXVXKcgT+6R4+6oZw6ZIWJrXj?=
 =?us-ascii?Q?r+HDnKbbpcAb7WRw+/If6nvSvQOfwDK0FIwNInleInUUW4EBWb79XyThByLv?=
 =?us-ascii?Q?pUnBFOx3otfImMWqNg+y6g8jJkbLjYPYkTlGg8vhQm2FeIl5NoM8968sDbG0?=
 =?us-ascii?Q?pU+OZIleGryL/hoqLG1ZgeQR?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <416F035C40A49447B895812C86A7AD5D@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ef3b2292-7db3-452e-a2e6-08dcb7a342ef
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 12:11:40.9761 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0723
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

Currently the driver determines the device type based on the
application, but this value is not reliable on Apple Touch Bars, where
the application is HID_DG_TOUCHPAD even though the devices are direct,
so allow setting it in classes.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 60b675cd1..2948fbcbc 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -146,6 +146,7 @@ struct mt_class {
 	__s32 sn_height;	/* Signal/noise ratio for height events */
 	__s32 sn_pressure;	/* Signal/noise ratio for pressure events */
 	__u8 maxcontacts;
+	bool is_direct;	/* true for touchscreens */
 	bool is_indirect;	/* true for touchpads */
 	bool export_all_inputs;	/* do not ignore mouse, keyboards, etc... */
 };
@@ -563,13 +564,13 @@ static struct mt_application *mt_allocate_application=
(struct mt_device *td,
 	mt_application->application =3D application;
 	INIT_LIST_HEAD(&mt_application->mt_usages);
=20
-	if (application =3D=3D HID_DG_TOUCHSCREEN)
+	if (application =3D=3D HID_DG_TOUCHSCREEN && !td->mtclass.is_indirect)
 		mt_application->mt_flags |=3D INPUT_MT_DIRECT;
=20
 	/*
 	 * Model touchscreens providing buttons as touchpads.
 	 */
-	if (application =3D=3D HID_DG_TOUCHPAD) {
+	if (application =3D=3D HID_DG_TOUCHPAD && !td->mtclass.is_direct) {
 		mt_application->mt_flags |=3D INPUT_MT_POINTER;
 		td->inputmode_value =3D MT_INPUTMODE_TOUCHPAD;
 	}
@@ -1317,6 +1318,9 @@ static int mt_touch_input_configured(struct hid_devic=
e *hdev,
 	if (td->serial_maybe)
 		mt_post_parse_default_settings(td, app);
=20
+	if (cls->is_direct)
+		app->mt_flags |=3D INPUT_MT_DIRECT;
+
 	if (cls->is_indirect)
 		app->mt_flags |=3D INPUT_MT_POINTER;
=20
--=20
2.39.3 (Apple Git-146)

