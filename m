Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B5794BCC4
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 14:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D6610E6EC;
	Thu,  8 Aug 2024 12:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="RrXgzK1B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2045.outbound.protection.outlook.com [40.92.103.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C13010E6EC
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 12:00:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WG+GiLMtg6fnA/tN/YzkUHcrsqsEW6P0aPMPGRKsQNsDexG5BpJHyy6Ld2CRY0WXazUJEbgSSpJagxjHNqP9uuHWmfNwm93iCICvRKYJamvX2RkQg0MhcFWPD1D63qgqxhE30jzWWdSehDZaPFXgB0ZGW3WHaStKvTKDMA82tvjMzVRbCooGOauj0itQg0lLT2DzFJuojNJiNq481qA0JrvWa3cxuw+HZEuSeIOBGavnfonMMrVc+rEijNF3G4Q/Jzq6Y5GbHK1iCGEeF+hyWmoui42XUt371eDEmaVBTreh9SAU1VzwQgWqK4R6HHQOAwugrl5T7KoPIzWt34k+7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXj5HFioyjIOLcAdy/oXSpQUwhLoR7Iglk2c3NpVYu8=;
 b=d1pFSzP/z/yhQmaIZQSUKp1aNNugsW90VDsjOgQW5i7wcWj6LIWvcfex6ciCKkvMAr5NxDnIja/+OLjbLUmnTbIHJ+ocSoPAkV5rA0dbVQnT1ffiJYeqV8l9CWBsAnRHZGPUYteVsaltnFsyscPlkUF53kQIePQ95TQxwz34qa67ZdzXVUsVEZIyiy8RJzxGr6WFNv6C8sJ5VWvF8Ef8CZyJQAVFVV1hcvRQ4GuVFtkL3LT8CXXERMVB5koQ5heoEfziZyNmne/PWD+bI+Rzg14B4xUfjk0anzQW6Izpe+CafDdfM5AfzYdHkFTjUBrNmKQh1F8S27Fc8ZQZJgWqqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXj5HFioyjIOLcAdy/oXSpQUwhLoR7Iglk2c3NpVYu8=;
 b=RrXgzK1BeGFK4uXEfPkH9JLE4Ba9qaRkwFYmzC3X7SgHo9NvegiJpmZjlk9D596jYKwHg0AXeX2XRCLmYXZMejKDIogWZIMLTyPp5+UuVBUsGzkzalEQ1ld1/VSXAf3BZZVFLtyYGmg6cw0XAjsprEh4Q6TUrpjBOQD5iJrUYY8V0NKuRYoixWERA/ci93FcgTwC+EQmjqG681jxPrSUh9hfQWBAEOC+17Z3ksjVZHJnLgLK1TCp+4UipkW1+LhM6Cv+7Fa4V0A+RM+prdGdrBuo2NsBkEx9a12G3hbp8jGR0yUgviej+ln1J8QgpDWDexOpeehK6VQ3uvSj9fk1QQ==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN3P287MB0339.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d0::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.14; Thu, 8 Aug 2024 12:00:26 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 12:00:26 +0000
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
Subject: [PATCH v2 6/9] HID: multitouch: allow specifying if a device is
 direct in a class 
Thread-Topic: [PATCH v2 6/9] HID: multitouch: allow specifying if a device is
 direct in a class 
Thread-Index: AQHa6YqOtWVqaK89t0a00KZy6o/VRw==
Date: Thu, 8 Aug 2024 12:00:26 +0000
Message-ID: <592F8A13-42AA-45F8-A0FE-B0FB972CA767@live.com>
References: <9550ADFD-0534-471D-94B4-EF370943CF80@live.com>
In-Reply-To: <9550ADFD-0534-471D-94B4-EF370943CF80@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [omOktV6CXRNUGzAOb09ClJYOr3YR1j920ljlzIgAXGEEDxwXrMHCkUEQQw/Cu9jfnBh1Mxr4zr4=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN3P287MB0339:EE_
x-ms-office365-filtering-correlation-id: 99f6196e-f52d-413e-c933-08dcb7a1b112
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|461199028|8060799006|15080799003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: cgf27mlgLfXzKjHES+JTRHa/cvugmIgh4thp/x4KWnSwrSCwy9lHSavUKu+8QV5vC2S/a00/Qugz++8TIQN+KQbC2YsDxcEqbnIiLxxOgm+qHCjRCol/1YbPQtFT9rG7D98i8vjOhBTaGWZYcjg2q5n1W53RRXZtTmvIEuBLsMrZYVHu2brFH1TlQnQKgVsD2VFBWy8Hfo9Ry8H26SJLVaeu1YmcVyLJIMGLeyV4c5nrZ2oeI0HLABFADoFjKEH7GGT1JFnAXe5O1ls4QqLb6P9fJvi0Rc3mBM498+bPswVTG6A6/y5dLOzEJA2xxYp1iHKtgPnHNRr/Xw+Ow4P1xzfeB4gWOm9kL9Tnl8dxT32iWFI8L7fK/nJSBlRZ8qjPadh3VpTIyazXzTd1zwel6gb+rykhKK8GqHD5kdmj5dhKzMVtrhF29DLM0krCs9ZfuC9ZP0pVURHOTlEKQzAiLHNmmgsA117qN73qVdJ81so/CzZ3n9SmQhp1rWUpT5c+oVj15nT36b3Fy02NHJGHnpQTlBx/XJ3pj61yg8pLCHZg7k58wqnIwPK+1qe4P4MBeHT+sMcpBTNUdYpH6BOzQgHHPqpeW1qwbvHf59VFYctJ07jLPs0Cya5EwSZcQ+KNHVeaNFqstrzxxjdlHrCMrj0XuLKHDPgOOD3U9uK7ATcGF2rCMRxiAQSWrUn3YOLu
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yMjMDIzyGrYx6MmwMKgWia3Y3JMxLa8cFHLDX3EgKpPySq47/b5/fJDLDTJr?=
 =?us-ascii?Q?W69YzM/vk/WDgWd4DYNk8oL2Z9GA9H1pN46MS5MUnaUekJ6TJKDl2MYPzfXW?=
 =?us-ascii?Q?1ta0XIgtcXp2eq7n43R6503fy8I0xKRgI3d0OEUY/ORXl2GWE2EO5Tm7jrpb?=
 =?us-ascii?Q?A7Wkdkci7sE/tpDZOSTon5AGErxT9HsHlM2CeQ6j6iP+oTJKfQrAv5g5fbHi?=
 =?us-ascii?Q?Oe7TIYJRk9O3Btp8DftzEmIskhGHbHmu+bZcewEV3uGzf27/Qn2f0dNuWG0q?=
 =?us-ascii?Q?CwHjKn8ksu9rtDLrSJzkHfvpydFvAGD66gFoPcoFOsfMKuVa9upXEnjcDPog?=
 =?us-ascii?Q?iJa9e8X0DhKlcLn75jxQ0W/4cLpjTMN1pNZRn3XPtNiuhRrvDKu7bqbcj7mP?=
 =?us-ascii?Q?pj90cq1MWtZiqmCCyL3OrG57K0pnU/tkSMhHPI65Sx/MSe7EFQu5tkgsSuKD?=
 =?us-ascii?Q?vmah0vJnlMm2LZAUTYVMoH0KhHYmZPXEpWWTS5r/wb6EqZ5tjDUKVgGXFJ3R?=
 =?us-ascii?Q?d7vI9ZP/oAA3e76FERm5wler3rChigCWeWHKaNQkeImpOskQ8JczPyG0nwrv?=
 =?us-ascii?Q?Rh5aXAmzYQJNqb0qUteI6V5KjA6p10znWf8vQM/zw+uUzPCsDXS1MXyxMyDV?=
 =?us-ascii?Q?40uuJrfOLA8WQb0YTjSoCwU4voA6CVhI+krYLkHRFtJa7ksQOvQEkFpWr3uV?=
 =?us-ascii?Q?rxy8q5dfrCOciH6baRPZYlwAD+yMHE4I/0ocBE0JFVf9h4XLANoVbYYhirU0?=
 =?us-ascii?Q?dP0j3vXXRLh11icU1sP+CgGZzWd21yURE5JQ46Uc4x5a2c2ENMJkOnQJLIcQ?=
 =?us-ascii?Q?rF3daWBFI/IBGGRX8jpTosllxaV42RiVSktBzxg0T7xIv88Dvyr5dNh4fDEw?=
 =?us-ascii?Q?ox2W7juHFi/2bh9e869mpPQ2OGCaWCzTI5jR9fP95hvg1DCzf0kxEDZrupfA?=
 =?us-ascii?Q?VWsKaU8RCnxie1W4/iaYwBYZoJ8HvPiqR4J000OC40kmgnrQeLqkQ8XWukUb?=
 =?us-ascii?Q?I5spG790mzu+uQhANgCe1FqQra8r92xhN87GrE3heuoetlNCADG1njkZHPuV?=
 =?us-ascii?Q?Wpjm0xn5xo5goCX6hWwM+AwZCrk6k+wCXk0ImsmmPvr5ZxAUIYkzssSye22e?=
 =?us-ascii?Q?0ixZ90ndMyJdGW1PLRT4QYUn3G2AgRSqt5UahHCUvo/lfdZWdHIvQMyXBsCb?=
 =?us-ascii?Q?UiMxo1VWZHjh6+EAx56diEqw/AOdMNgViUaKrCjbL2tJF2UqDuc3mYKR0r84?=
 =?us-ascii?Q?i/ihs16Wc4leLiAmluNVFCDUjjziNohmjb7H16Hib+1StvgFlaXFvttfuf86?=
 =?us-ascii?Q?RJ/v2ms6inBBeubZdyACTYSA?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <664466181ABD6343B76ED75AA599CED5@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f6196e-f52d-413e-c933-08dcb7a1b112
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 12:00:26.8147 (UTC)
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

