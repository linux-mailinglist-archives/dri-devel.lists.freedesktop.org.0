Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A15E595579A
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 13:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2362010E090;
	Sat, 17 Aug 2024 11:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="XjkbhSN8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2048.outbound.protection.outlook.com [40.92.102.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC1310E090
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 11:48:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9zKwqQ69HvNRmKqXfxekdU2O8GKUHL3FJ+K8zHZ2h7Mpk0/lq0HgnuyUK8GnfJZQZ3s0ROlKIU3bduG2WkGZU8mbP7KuX/vfh+SKRCtxVPb/u1XTfwrw/Gxi8/Urt9LDUGCGJ370Ntv+Dq3NXcC7P0ZuZiVRAPifxoT6AU/2YCjLyU4OehPbB5bKJim80Hq4ybYUriXdwR+u904bEhoogrfYGGM5BiN8KmX1eLrn2duK6Nb4HevQB6nYVzkOAtf++lcppfGyIsAgB0sl1JAk9iIlGxPxv2FtUP4zmHTo39mempN0orWbz3QPI/S9TOtJoElawNM7p4Q2zjqtJLHCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzJQNbir3aksonInPunSVUKKA+KLTVCBzdPlbfwum3A=;
 b=ezBa5SuXo62e7ASomopRq1CcIGTMHUo5DpzvmMIRuGc34jswjuj3xvqiivTn9PYB6wVBoePXDisbI3VqMdee94TkAXkAQFo9j1LwoFB8hOGeiBOBMH5GMQbDBdaAf3j2GRmYUAso7fHnG/4DSdODAYetyOSChimAeK/xccUsX/SHh8qtJ6n9EqFMUIe4UWIojhviK2ZBfUSPbSXQRc4ZWWBHAY6ruxnKbuFp8dwNr1i7guPBoarL5fVw1Xj36uhwrI54s2jzy2Ls9yr+lslSue3idpGtsRKBMUSGuLUs2+ujiYekJ0ojae+WsrsFoh0HiDrWWBVZXJbSOR/d4bZgeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzJQNbir3aksonInPunSVUKKA+KLTVCBzdPlbfwum3A=;
 b=XjkbhSN8k8Jt/ioJ2XsNbKN/d748SJNbvUxZ6JrRdzxZNUF+NHCYh1BdUDeStopefXwSzCljKBTCNGk5Rf9tf+DfhapiwoY3w1MHiSORSW0jKlNs/4K4aZ8eMW9h7aFAdZZM6JKilHdh9PBV/gUiuO8v23GKvMD2+yrw6AfB3nVehEEKNpnTib1gUMledVAvvB4FWgD7IPEinEg/uzXFgf+2HJEiW0aRxCI+w1l4FbYkBtrO+Z3PgsFy4SBdsJIAKrrU7fCsHi/YWDXG0YXKIN0F/TP82GpWESV4Ych2lHQxevZfq63Ze716tgRCRTTWQbKsNHcrItm91oKmtWhlWw==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN3P287MB0241.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d2::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.20; Sat, 17 Aug 2024 11:48:08 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%6]) with mapi id 15.20.7875.016; Sat, 17 Aug 2024
 11:48:08 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>,
 =?iso-8859-1?Q?Thomas_Wei=DFschuh?= <thomas@t-8ch.de>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
 <kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 4/10] HID: multitouch: support getting the contact ID from
 HID_DG_TRANSDUCER_INDEX fields
Thread-Topic: [PATCH v5 4/10] HID: multitouch: support getting the contact ID
 from HID_DG_TRANSDUCER_INDEX fields
Thread-Index: AQHa8JtUUasJfYprSU+JVVYDuJLkBA==
Date: Sat, 17 Aug 2024 11:48:08 +0000
Message-ID: <BD919A98-0D44-42F9-867F-B936BBB8267A@live.com>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
In-Reply-To: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [S0VX+XTgBOMGSEKDCck97VXZiPl2R8k3CzAVo/zUOKApfuJWmfZaTHUwVFGXRmQMJcCJnz6NfYE=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN3P287MB0241:EE_
x-ms-office365-filtering-correlation-id: b00e6bd8-42f2-409a-75b2-08dcbeb276ae
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|15080799003|8060799006|19110799003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: 4dT2Xq1nb8DHcy9EMaVy32OuJi+t6fkpKoUxq3DJ44GsOriLapC+Nc4k7ITdBd12/PIvywluFs/bo3vK8P32RO3sJQ/7qp9QRrCdZ0Hs/HeWnNFNMOLeEu0hEm1YWNSz68PHSLVJq/f2sHnpQmqVcLWEG3wpeQQeCwiNs/of4I4/poxmQOIgWYUwFxF9ySpXuDw6Z63DS8NGlEeE5sQrhpP72AcOuqVIGCw2gSQUErptQELrYFB137fwl3ZKiIcKmxnj630Zq9G/05wuNM9nqK7z3uqB7c7GSTFYtX61aNLpavct3GtAFDZmH8l4oBwbMK7g23KPq6mi/lGMdH1Z2wTtDexHII8xu0avC7OOeMYUwpdYl/stwh3UJCH/7uMG8eiPQaF4PNPXR34xUqAXxygLrbt9g2OJ8M2zLsqBWVAEu86/PRs3BGOSFNfSksgRttWzsjcwSAEscsHksTMDAoHDF9RkkvjU21LN+vnGBQauM0bhNwC7yLcnmeWsbHmYUeNbKDaXs3V4H4WatL2s72aEHXnVQ8udcnClinn0aaTEidY+NSNoGidqo1b5fGZqSdeoJ9jZVVFc9K+d1x3r0JFKQe1EKIpXUx9ey6wXPdI43jCi+/Mel9ffmlBeg4wE8kMNyhOL4l1GEmpjRs317yWuyPoFGSLTJz4HNfDNGSEN+cBMg2g66RxpHOOtGLeZ
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?uZdfrnmvXEb58+TYL10OPUytiqOA8oNru0kPS/GJr73DTF/YlzasbM5TAS?=
 =?iso-8859-1?Q?hdosCOpiMlaKKF1qiRq84boN2xp6Vwa+w/JGxAkjrVJEizGuGkwzjJcmUR?=
 =?iso-8859-1?Q?hVbdVDWGZhbMbDnBpiIEfrH1KXctel2febq4xU7fHA9eeMJNuoD29hHvjV?=
 =?iso-8859-1?Q?3pv6t0KC8zOLIwkSbM2KJCBV09V4RjFcghiI83RZIFe0hiZuwZxbE83Bh+?=
 =?iso-8859-1?Q?MiYudIrWtgZbQ+MIA+VBngEWc9BNK/lbK7dK873Oc7bp6lCXOM8ePYeDGZ?=
 =?iso-8859-1?Q?ydrw1PoUgq6QUrJYQZMg+LMhJPaU8zC9PGl893nFEvW6c8smbpjUJleef1?=
 =?iso-8859-1?Q?+hwDeAg9+DSVWPCe8dOltzjtO9TdpvAlX3nN6I7j2rL6qI55Scb51HCTWk?=
 =?iso-8859-1?Q?STD4HLev8XGfZswcpIqCPwR5WwT7kMbKgzUExecvZisSNVhRMZ8MOq2Cn4?=
 =?iso-8859-1?Q?EObV2rNfac7mlgXSHPCF39gO+UD0GJnJzIBVIfx3tv1EY2PBt1hlZadiFz?=
 =?iso-8859-1?Q?lPX/5vwgkGxmRE0rFcyCbYb+20AYBR71a0LeniyEXG4R+AkeVSPM81cZQ8?=
 =?iso-8859-1?Q?qDUENQin+fT82i+Ov5wSue3uH5RTmVh4foPFIoMTfFmTPr2WahfK57zX5E?=
 =?iso-8859-1?Q?tY8KKebPUo8w/HRbPpF0Z7UFT4WSv4VMqnj/MackuqCMfmwqpVBaepqasg?=
 =?iso-8859-1?Q?2qCoyBuVWiOalAeIvAKRTOA+K029Ii+xL8l7oFfOpjw4oQLPz3cc5YOcaS?=
 =?iso-8859-1?Q?MawKTabQBWqw3dsNmotgmy3k20jW7hwe//wH6zWvpnFJfhv7k5+3GUWakL?=
 =?iso-8859-1?Q?8HMSJE2v1/KDfABwi6oGEv6j4yOHKL18UdVo6AZ7EN7oVukcegIJXUVFk5?=
 =?iso-8859-1?Q?rgjU9l+4p+bF3TjkMyhcel4IlCvIJoohNqdhqGQtZCb7L7IzGWZ6dzOqra?=
 =?iso-8859-1?Q?GMD+qe6PQMAUmrRMMmzBAwzQxpdT1D03IOB/NXWde9x8Tm8wUPQHUKv7vR?=
 =?iso-8859-1?Q?OFDaF0MYKEs6tVCCReQC/Rur6Ximc/q3LtGN2OHHoxbOVEiEWYtyZt705h?=
 =?iso-8859-1?Q?en46PzTGef9d6en5BXXK/Jam3TT2mG9IwIKSw3Tpg1sOSRBSGNtt2L7OQi?=
 =?iso-8859-1?Q?2F6fUeoU1ESR02sK1OX5Nv/y6qC0oPGg9veVZ+Q2alHYqPJVTcCOSuMq78?=
 =?iso-8859-1?Q?L//l6bTB66n92dilyPD9vHO89cqdkis0/4XBDQ8j8JzIq1EgHQz32jGJXt?=
 =?iso-8859-1?Q?BRk3jslKLKTuqoRlxkwGk7mpCE6+Hzr4IIluJq35NhseV76gGPfep7HYLd?=
 =?iso-8859-1?Q?F46VAV4g+XZvMC37vojxumQxnkrst4J3tq/vieUhincor0WJWdaOZl5T8Z?=
 =?iso-8859-1?Q?deN/0bR/1I?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <359F22DEC835AB498FF3F448CAAC57CE@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b00e6bd8-42f2-409a-75b2-08dcbeb276ae
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2024 11:48:08.3902 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0241
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

