Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1874494BED8
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 15:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8006010E740;
	Thu,  8 Aug 2024 13:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="PLl24Ph/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2028.outbound.protection.outlook.com [40.92.102.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E035110E740
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 13:54:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmAFzKTRsy8HI9OqVMwMkjT7VBoBj88aavQBCbTam0za7FB1e1nGFtXEu2VWdRgs212runwJ7RksfaoWPdvqNL8fu/ntOT0q2GVdNm4sJtTtiEBdyZBsqG1zB0AKWw0sLgfDwyZyQkLKfCKRnBIEkzJnkv9GAO4CiWlh4qDHIAkVl0vIfubFGXKud2Q6eldd4GwPryfX8+xz+5TQ5AYxaTACv9VOnTrAkmeXw6QoazLyuZZo8orA4OrJ1EneAlo5os0IWriApw/RBH7E88EJ8/i7/HwXdkbI1K8v27xbiTQ+FGNvlWp3kzwgIzuEC06tC9kRhTKG7in+2FtnXV//NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myY17nFmSwRYTFKqjQNWGfiM/kNxDYUsRpGSdEJLqhY=;
 b=BxS+myg+Qs1GLNMV47tojJKJV1LM/ET1FuS59bD6j6Tf1E9dTwMv2Pi/5kMgRqdNh6i7LHvBaqS9QS/R16DsaUqV/ucTjtgWf+qOb7TqlWCS/sy7FDhfVuNovLLYoWoLaXFMxoNr47kMzp5o96bIn7d0NXPN7w2vDleUCy6pcRJnKKqbpV6+JoH37p0gopUdEgkkgkcy1C+SLga6MEWjHBwigyyMyRErFKvGFhvesShr6GQB2AvA5nV4FRH1Li/mxsUcNUlfdCXOj9/9mg0HeNPHWmauERFe1LGgcg7IV57ittogfp0vnn+b8E6uBnWiBDaBVKlzFjNy5brQ1U1IjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=myY17nFmSwRYTFKqjQNWGfiM/kNxDYUsRpGSdEJLqhY=;
 b=PLl24Ph/w19a1lPybksVkQ0z4CGUNieeOJgXORz89P5E3BqxWajQRV+FilfxRz5pusc3XQ+Sl0N7BnVMSwo3gu4XA52wH46DRTt4JNcztk1FC6jPPyQwD1scildqg6oqlmeyJ+TwE8yHCrx4wOEy2e4VlYoUFEKFN8gQq/NibvPHbNaXi9BNS0Hj1HXPIfPBJ2epXYYhFYN89sNtxC2MpTuqHdnoCssNyoe59mQHxooMffiHtN4cwmtylsxxtFmbCenyhz5OAvw4cEeJ+te7p1A6SqSmXhFp2g5Bs+ScIpy6NFnNUJNv+clI9GixnwIsczwTKjuQIfThp66G+2OMWA==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN2P287MB2013.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c6::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.14; Thu, 8 Aug 2024 13:53:59 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 13:53:59 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
 <kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 5/9] HID: multitouch: take cls->maxcontacts into account
 for devices without a HID_DG_CONTACTMAX field too
Thread-Topic: [PATCH v3 5/9] HID: multitouch: take cls->maxcontacts into
 account for devices without a HID_DG_CONTACTMAX field too
Thread-Index: AQHa6Zprf/sbSFQWgEWmZyYz9HpMNQ==
Date: Thu, 8 Aug 2024 13:53:59 +0000
Message-ID: <025E5723-E8D8-41CA-A431-5981D86D3753@live.com>
References: <1368FEE8-58BB-41C9-B9AD-7F2F68FF1D53@live.com>
In-Reply-To: <1368FEE8-58BB-41C9-B9AD-7F2F68FF1D53@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [IDREavt4XEwHQtTQfXnhH2MSguojEE4OdyPIHHgbj7SJ/DH1zOpg9btEVZvK1wsOvP9ogL2Nspo=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN2P287MB2013:EE_
x-ms-office365-filtering-correlation-id: c966a232-efa5-4c05-b182-08dcb7b18dec
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799003|461199028|8060799006|19110799003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info: fVuXGkS7Bw05wlUa5/VkD3c3xYSlYgzj4F1A6uIUdmrynANnnmfnAjAoq9PvkERo+o1AVoolbU3q12i8t2b/5MTqB6feXHPeGgBy3Oq2c1lahvoYOeiufC22Z4A+F83qylxdWelt3emmljMO1AEn0/c+zZ7I09tS4b+w6ThmQK9lAiHKI0LueBRY7QsCsLrmizLMd2EePpTX08QT9qf0HVINXUU9///JiJLjqI5c7aI+KW2Fg0Xc5MZJTVKzDVtbPXIqA05lcf1BVbWUI3VjE4I9P0N3SK9w1hJAJjrKLwsr5Z8zKyyB3V/oupDyweIWUeiy+q6RYUzi7oMQ9qfpug4Y8hVK/c4ZF4JpLl+ZPQ7PFE5bot3B+K/odFinSU5K6B4IY24VUOLiRhidxep532feT2nwC6rfi6Yc1Nl/RCX7tZMIc5OHX59+fpI6SZqOINu4Q764SvNWpUt1nrfegpSlNTvop2/eGb2E8P+h8bkWQlR4VWj+hZg9Z4Vj+cKmlC0swdZxM+ML78e5BPlfGgEqKvQMC2DklCw4fK0UJ/HwGrWx/T+Qn2TJVsrNCG2UcbTt4ehEMaU0PXRGul9IEhMtGQ0cM87ZaCm+PLkdhcxsnCfmwSTAIKzHS6LSKc8mcb2Iq/BB1+J5Q6ELBkkY0OrIXUPjq/p5s5K9AODROzvTmAFA4+3FgerUUk/gbGA9
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?43sZfU+vH6K1X4D5IFF1GADeCjQmuZVkkAc6zlbG3wmSuGR9qSJIcVBmipNU?=
 =?us-ascii?Q?bsU9z1hctznzvKRvJUcLaK2hMzhNEmFBIYVKzbhcg4cwSWZ0tpamhgqr6mPx?=
 =?us-ascii?Q?7pumzEf1cedTIp2FubmhK9UsHB+SeFmUplCluNxC3phvNLcfJd92g4SH6PjA?=
 =?us-ascii?Q?oqgp+P0R+zvwIFLPmUP1QJKrvJirRC8D/au3bum2Do+EBvXS9R7Oej8/qUSG?=
 =?us-ascii?Q?bEsQApXpKSv0PCWFN7FKgUnwDrC3cb9/FRAhIMCApikT9c3R+Yd4UsLmQcEI?=
 =?us-ascii?Q?ogwzzbgmtXRYjC1TQYB0PM/s8s9rmmnP1v9S1O+WrltyeQ+xPo0tSvtLyCs/?=
 =?us-ascii?Q?In+WJwB4eGPv01Oih2d8zgaHXPmy8ZpCqTDYob36bmo+xIbL20Fh44BnVmfX?=
 =?us-ascii?Q?2I5p7Wk10ruizx4OqCD2E6UObcr3QTwQVLYe3K13zdbnmdByC8iGznDqnIWT?=
 =?us-ascii?Q?QRB6tNXmUAcO0hGKaesBS2JK0Q94XFZ+qxveqJO5t+SmtABaFduVR2ie/JC2?=
 =?us-ascii?Q?AyLyJSSTkvIJoGCIMBVh0owVVIGlKuxSLXMbEQ61PcaKlc+2pe+G5p0dtOb1?=
 =?us-ascii?Q?2XvFOTl7KEsPHeKaQhm+NN0DZlXB5PrOyk2dlxPzhtYCrR/zb7GN6KHULYz4?=
 =?us-ascii?Q?tCRaaF4OYrcqnhmxGNkLRerZeiQhMrP+J5LtH+2jQfACpexRkPd7VCSEhvkU?=
 =?us-ascii?Q?XegwrP8RoUIst+5/2uyPNAV3Tq4v3TOXlwlbZS/2atxSisXhT7un2e3YDfqV?=
 =?us-ascii?Q?7OpuEjL4Y61YQla1lTrYPv8P8c1Zw7JZxth5sAsJq9GQK6TLxAEvshSm+Ak1?=
 =?us-ascii?Q?O3i1v8e4zmbdOn0RXv8odTp4pVrwr8J9P2rWIzaGZG12e0XNIwbRJMcUYSAL?=
 =?us-ascii?Q?WybzmthyTRtFSv3ZPYutmFJeEnaOOIlHDLyaixFnD6FoAKvyLzp0WA/awqOk?=
 =?us-ascii?Q?8X1fuur0d05pxazGPKxMSga9jbkRbQN83mtBnhBHRMTwwyK9yU78zUESwTCK?=
 =?us-ascii?Q?STD1wXZSJ/uKb1WpwUOJUtCsxcQ4ljKJD31dooLnGk6BQwGWVENT/0V+K1J6?=
 =?us-ascii?Q?gvlaQudXI9d5BCGxXPdD/PMFt7Rb+IbZ1ZDb89606jlQyKy7IhFxoTgTPcEz?=
 =?us-ascii?Q?/Wv7sDNV9O4FjNUhHFvwd7xxW7PU/gWAwj2OWWifPIxF5UPZll9V4DGyL8HQ?=
 =?us-ascii?Q?tR5YRHs7DN6TjHoTEvf0cd52wnKiQ98MBJi78mbJayGvd9xmNpZd4c6F+FZW?=
 =?us-ascii?Q?8mmfwL11oZ5I2joN+NdLZPwc1JFBAKgW3o7DVZYO3NxFwYrACkDVuSXGEfX0?=
 =?us-ascii?Q?TuqGaLmenzu+/Ndwew5ow0zg?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AA1B5E5F139DD34799BF9EA682302A86@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c966a232-efa5-4c05-b182-08dcb7b18dec
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 13:53:59.7770 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB2013
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

