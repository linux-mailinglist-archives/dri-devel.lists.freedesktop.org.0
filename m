Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E2494BCA1
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 13:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7591210E6E8;
	Thu,  8 Aug 2024 11:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="r4Gd8RV2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2083.outbound.protection.outlook.com [40.92.103.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB4710E6E8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 11:56:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PbkmeLgDB8j4gvmeSjSEU25acE/3EdrMqlm46YroseRar5gF6wk9g01HeLRaVzB2d0PEpAufj8leAb756/x3M2p2uSH8QtSJ2hetNVJBWTl8XP7O5EoYbL+wHza4I+j5U/LcNghkfVBTxXIDm81Hyki4ThMTf+I3ASU6i8wao8l8fZTSF+awL/J66i2zPsa8qCg8n7LaZ9FPr9ktmbgurluxdUmhBerR+iUZLgyUoN/YaIx1yKiwd8hMgKSIFzSqthJNVhyKiXwwoNzLQA86BZ7FJ9Q/LeBBQ0sg4mhCbEY5ySd8lu95gd/YJ0ITu/PYxrJoqnEYIi6w/hpiR0G0rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4PHen4032PcthKi8HoFeGPNif8f7CRd94d/mUAn2RY=;
 b=kQhQGCryoUWptdH6ZC3AjBOMhrFv+I2gZthuuy2GB6BWeI4Sj/vdTfobJHL42mBd3GfJ36ToGwg2oYbZA7RnVZ5bX6YesmtSB47d5kc4A1fsUfR3AVB3Vbfrktu1xsflCiVrRIyGqcD3D6DhjuoTdXVCShWQCq6JYlROkw/HJbWWXKwGPUIwM6lW3KoveuViIK9ePyMc7Abixc0PpstVQoRGcwZ/+eeZtbiFjFYGmflwtscKz/YyTcaoPfXQS+X+BpHYkmvaZ4Pc892X52aKuiIOKSTUz9aJ2pcqMODTWTZwWeoIX2voTMXk70FTaTiGygFccEvW0S5tP0cjHQoDTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4PHen4032PcthKi8HoFeGPNif8f7CRd94d/mUAn2RY=;
 b=r4Gd8RV2xWWNS90SF6UtKUSaRJm5mlvvPCPqev0aVXKj/aYL5/EHBq+7js2QZCo5/+OEo+mJtElToM0wZ90Dn8kmkCtKg2KO9rnClKhgqwU23/dJ0BUYE/jqk2I44PZPqtE28T3DyedrL1AwQlLCkOPh+qjcReg4s3GVAlB5eUyD5aEarQMwCZijlXLlK4c+EDPdw9M9bxebRkZBOiqUg64q1C8epdnv7yHdlXyroefRsDfL9JH27NjWXiqSP9qhNpolrz5++S9TTDxYmJhDLLu/tAguKHr4/0jlxjoPoHUNUazhzlFeVBPj7giRCx5wnxwLnSfPRPSIGsImMhoOHA==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 MA0P287MB0066.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:32::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.14; Thu, 8 Aug 2024 11:56:23 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 11:56:23 +0000
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
Subject: [PATCH v3 3/9] HID: multitouch: support getting the contact ID from
 HID_DG_TRANSDUCER_INDEX fields
Thread-Topic: [PATCH v3 3/9] HID: multitouch: support getting the contact ID
 from HID_DG_TRANSDUCER_INDEX fields
Thread-Index: AQHa6Yn8D3YBQb5sakG9oCUs7mNuQQ==
Date: Thu, 8 Aug 2024 11:56:22 +0000
Message-ID: <D04D80A7-B4EA-4306-BEC3-FE1F9427E325@live.com>
References: <9550ADFD-0534-471D-94B4-EF370943CF80@live.com>
In-Reply-To: <9550ADFD-0534-471D-94B4-EF370943CF80@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [0UbDxD8hIPHAY4pNGspzs9VBZwvOi+FpGEbdVrNq9mVPYIMfQkFK+QRCrOJMEHqf9C45K3x3QPk=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|MA0P287MB0066:EE_
x-ms-office365-filtering-correlation-id: c6803158-2f89-4814-a495-08dcb7a11f61
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799003|19110799003|461199028|8060799006|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: VMOp02w+IkqN4chi91PxK26h7UPtDNZ386lI2i2pQ8g7LWyBwBn5jt9a+qyfqk11/fXBfT1XOaS+7KXrTAjycHZ0pYTTHr5JlI/gz9ldCBBzMIZufkOFG1Zl5XMrLuUeQLL7+dVUAQyrlgm+FxrCdMaXoAwz/0cyIm8bTHYFmFwee4eqC2vjDwYQY0z6DA15NVUaZLEQCkFeI+I3MjDJsrIKeHfu8ypE3vNMy12TekhhFA6UOh4dg4oRzUB2SIVGjBsaFRFHgsMCmOwC/QoNby1EWNLOfRsFNvihPFXGdfMc1TP4GHniBM/OjYunb36ZEI4M3wlzwRRn23V+ajCbJ+Yax+IE3QmEZobst2OVwpL2bWsiFVfWJfLVVqIbKkGdEyJj1QTnk0IwPxD9XsRjbDo8HwfJ4vNNNW3kpOFEoBxPUPyXqalN54pMEy4QUOiFYd36kRsQL8Hg6ywqhEqDPxYQHGyXQA/icfJwwfzJVr/DuSllZoEL2LiOpKHcH24dWPeJ9+rE4NSUazJ+0mxPovWCkrUzgUveE9WO0N0HZfshWulS3VIhX9X6Gv9YruhOV9yukvospg4QEkZmqZ5MtTKgcqSpb5px/X0jXbwzQDjt1ZEEI8IDOnWcR57CW+KMTFdXL/mOsH3UAw85Wk0PcG7qNSzOkLK3HdlCWY5zVyIsfjMJ1l0qZBPoYtSP7fBP
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+1y36dnAh2URHdmp+Ej1MGXtDpVIeSoqjobcUbKQouWSTDOl4E+eIQ1IEQem?=
 =?us-ascii?Q?cFDpG6uSZdG1Tw2DLzA2ED69bKlNgxNPr4AuGzFiSIT1vyDK6omy59HxSfXk?=
 =?us-ascii?Q?Sitqb0ocbYQo/tAO8XTscPiHnvfYYR2WosYzWezJvgXZahZpI4zeqP9bWC1b?=
 =?us-ascii?Q?nVjiXeK1WKpPnXIj65PdYm1636nSKt+EtSX+/GT/vrI54fNcNAKKW/Y2zRdL?=
 =?us-ascii?Q?rc8vP4c2FW1lhuAWp2NeMUSYn0OUO2RyLKrrRzfpgf/CQEdhnyka8KaqfjBW?=
 =?us-ascii?Q?9C6ExKJnoBHtYNlQtjZI1cFcyJWP+f4i24p4/UTNnM5qjIJrPADCajPjakZc?=
 =?us-ascii?Q?1a1br1gngEE5UyAZSqlCcyBdsKKUqOwBNUgmGpNynN0JK6MG4N1+E43Bynld?=
 =?us-ascii?Q?W1P/zlTYsQfTZ2QVH+EY8pzNTbBK6WC+z5Z0VuXQkVzx6QHREIwZr3PPDzO8?=
 =?us-ascii?Q?UfICXezxtjqbRPzAxRMlPOoA5ak+lsWRd9q13W/nsNDJf+zZ/f6dHtZFRy6J?=
 =?us-ascii?Q?KODCnjUqFzNk+Cld+3Un5kbWBxAMxriGxJXG5cIKFIv6agiIAbzAyDv+Rtrb?=
 =?us-ascii?Q?b7tZQlVa3Af9UIGyUC6Nu/U6G3KBTzXtXmG6FPmAUfxJxWdo9sfx87ePn/DS?=
 =?us-ascii?Q?fWbjriBZY9yCvtq0kFMGtq/UJ8SxR/p28ofs7Hhz0J3Ed3tWwv9eElnsmZuo?=
 =?us-ascii?Q?YDtvtxrodlHE5pvkUw1TI3yjKPjv66SbVsBeA3iEZ6dkS0eq+09ZWMIBu0wl?=
 =?us-ascii?Q?ueBjTxgfoUBiOXCW84cbAdTK9LU3UcHWyKrzVxoBNZgs75PNJvLUxoaVRr/H?=
 =?us-ascii?Q?+Rd9hMUPeqcHClGOOucvgXbwrYcDByDYWTcNt8oaRSO8Yk83RPgqvWFZhKeU?=
 =?us-ascii?Q?2F/cqg9rwbFQWaLC4SF/SLElYKUZwVw4gLzpPVi5t6ow9dkN8EruOADGGFRP?=
 =?us-ascii?Q?xnNrU/5W8b75ptjCJJIbGZ3ZA6Nt6mCPRhp9hWFTwz5PtOByCsStXMQ6R6iX?=
 =?us-ascii?Q?0w058k8yRgPViDQPA+TRrcJA3yDeyiv0A39mB+HFknjyCIsu6vAomxID/vQA?=
 =?us-ascii?Q?H5NplCWGeCYuoNlSAVG2UZ18EF5pmWa2XMIVdB19khFc/1llOTdHi+c6WnHE?=
 =?us-ascii?Q?yjDB7cFKrL5+8tWejvdoQCd/RKlWTAyNmD7w0Pi+j/RME1meJLJ1MvI/Dn1o?=
 =?us-ascii?Q?LS9y+C1xWmp+Ik1ulPgS+g3YbHMFGZWuw8pUQ0WV+lke+bwYiSSr33d6dNgY?=
 =?us-ascii?Q?yjnLeejO2Z83bq+RFaY535WJVuCZ5KGEwxR+X7hq/+IQiG+oCGNdtwRZtuic?=
 =?us-ascii?Q?qaQRcJbLvF+ZZ8/QMbiVLf4q?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <51AD6AF97EE1EC45BE44B1C1DB7F0F3C@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c6803158-2f89-4814-a495-08dcb7a11f61
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 11:56:22.3273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0066
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
2.39.3 (Apple Git-146)

