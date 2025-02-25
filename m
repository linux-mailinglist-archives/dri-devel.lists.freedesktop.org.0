Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 719F7A43CD0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 12:07:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58DDC10E4C0;
	Tue, 25 Feb 2025 11:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="aQZIEsKB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011026.outbound.protection.outlook.com
 [52.103.67.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C27910E4C0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 11:07:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lruh/g7SPeh2ecItq4SuzXhTYv3DbJkJnpgCfcYCBoUugcLe4F8BSILL6D3ixvYB8uhguU1N+nKSKxdKKV6EjVX6HqY14IvSFV+ZNUsOLHQn89yTE8h9iRV024I5/IdJQ6AQkFl2Acn/eZD82a6N3rC/ZICVhsQDn6txNPM6J+6htWkxsSgZxrb1Xagl9Nq7R6ZC6RKmVjjO97AtUkEiTEm8vfGe5BOBDJ9R7zO2Ml47ynr56UMNTAX0/7wKvRgrMfFpH047pgN82MDI/7y59iiJOKunmGRb+AyqEVC6vL2rnno68DZjrZ+XSVp+G5LsyemU06VXTi7v6opqdd5AIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiikcYG1IfarQ9EB8ne4nz9S7rmAlbtGs4PajaNo6p4=;
 b=rQqW8jLmHzu1KszDzF7ifAvpRG/KallVqucJN/NzwG2qjFiwzVSwagpWevEmajs+n81hYwS6rVOmKlphcsHULDxpacsCrLexyE0kf8O4Ffum/V1syXwCTXt0KT/OCNIDnkMWxsEFlyxsZlMKoPHK5EOgpi0zetK6vtYliSSVmWinbqU1MpIpotjcKjrgnzb3E8DMRK3wz/gEweEntL4Uee4opZiCqeiN+rQ6lzb0CYkAf3pqxCec2F7g797rkSst+mL2T8d/48ewMDOp/UZrVNm4khWoRph6KFFEa1F26oBAILaLJI0JQOAzfqauOj4w9z+heJ/Sj6LHiKCQsgre1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiikcYG1IfarQ9EB8ne4nz9S7rmAlbtGs4PajaNo6p4=;
 b=aQZIEsKBAklCeFmLC4zb9zCCtOXaKheda4aPF6hU2kof0FexQO5KaGSgaDDld48tT/tNKuL9FGnJqhGHoQkZG3E+mPIJp7ID8dKUbYfwS9L5IBW0HW0T+YOPu/l804f6jNCiW+I2Fb76x0+5t7/eU7gFm0j59X+UcWHJiRtWKCApp87wzC8Z/05obnp1iaCC6R2kvyb5GjtcvgCug/WWZCWzJG+J1tP19laxERAMnmUy0Z/OyaNjhlboD46oxaHvP3eC7ekiTmcf/ilqEXTXnqJqSmgQU4azlr6q8yhFYujH/Xq9hoQcoYItdIk3XrYM9Mlh9GcBVz377z/9V2G95g==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB9351.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:108::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 11:07:41 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 11:07:41 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "airlied@redhat.com" <airlied@redhat.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "jfalempe@redhat.com" <jfalempe@redhat.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, "kraxel@redhat.com"
 <kraxel@redhat.com>, "javierm@redhat.com" <javierm@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 4/6] drm/bochs: Remove redundant else in atomic_check
Thread-Topic: [PATCH 4/6] drm/bochs: Remove redundant else in atomic_check
Thread-Index: AQHbh3V82G+UfH2cmUOONF0Ah6OAhQ==
Date: Tue, 25 Feb 2025 11:07:41 +0000
Message-ID: <CE6A6B80-3EA0-42AA-B29F-5774698E1993@live.com>
References: <C8A4C8F8-1568-423E-A656-05D914D9933F@live.com>
In-Reply-To: <C8A4C8F8-1568-423E-A656-05D914D9933F@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN0PR01MB9351:EE_
x-ms-office365-filtering-correlation-id: 071cd5db-914e-4bdb-676b-08dd558c9f60
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|15080799006|7092599003|12121999004|8060799006|8062599003|19110799003|3412199025|440099028|102099032|41001999003;
x-microsoft-antispam-message-info: =?us-ascii?Q?yntTgA5UQwQF0or69AvDlcCSERyLZW2odT57d8Bwo2g5QeVGBXx9D4C592U6?=
 =?us-ascii?Q?5A7dADzUhElPhgThUAQF7b+uwUu28pwgR2GCOw/+sD1XMn6z6F3kOGGm50n2?=
 =?us-ascii?Q?UPnvJuayI02LMzMGSKNA9p0IlybQq1GNWeiNG0bn9367H50uiVp1izjkuH2M?=
 =?us-ascii?Q?ZqwRq7VH7yrlmX3R+8mfuFCfTq91LM3qICpElmLSYN88j8nnDgPv2rZlpWyr?=
 =?us-ascii?Q?wiEwgDXzREdZd0qeJx+DGCWd8SG3tQ66lIgAzeTvl3c884IHpVAFngWDsLyh?=
 =?us-ascii?Q?dUdXOJWWDbn/fIzZgLU1zkIMM6YSBqU/ME8OyXAhvGl98W3jv4M4TKCViQw9?=
 =?us-ascii?Q?f/7kfs56KWOROmT7lGo/WQ0fN/jsbpsLiUMs2glnL435fdbn/oqySD7m1zWg?=
 =?us-ascii?Q?uAF8WwaNPwPtFUQvKbKa+6AtZr7k9ndTCJ65y5+/h9+kh1+Mi77jXuMmKeYU?=
 =?us-ascii?Q?NPnin5S7Ybsxj5wsqInHRxSexX0a5Sl0aYKXofH0Jj6vNRLLZgg6r2e7nxGm?=
 =?us-ascii?Q?PKllvIcapXKvMnw149SthuN5rep6s3rgS/5suzkw60Xz+2H1ufieKd0lHRBn?=
 =?us-ascii?Q?4aZ+92Ag1IFPjQKkj16wbHCdO0l2jVqU/LqhF0iG99pH/kiIyOCONLzh4LdS?=
 =?us-ascii?Q?kZyouWeqXf54/Xwn81cnZc8V03xdiKH1IkoPJEVGCDIMwef/Uyqp4cjchLvH?=
 =?us-ascii?Q?y1Mc7OJ+o6Q2agP528Hqm2vPCoxTx83Fu0fc8Emm9Y5HyAPxd994MlzCM3oH?=
 =?us-ascii?Q?f+rjk6eKrzZTIgiL+lkkUxHh75WoSpVSKVB5D898da+v2AhVWxrBdm0xc+WK?=
 =?us-ascii?Q?bVNJ8E7cYn79VYFGcaN64uzeCIZWKoD6Mj1Jx9b/mJNSLmJ+WsIvJAyn/bfq?=
 =?us-ascii?Q?kD7we+c9C0h9ivZYpfY6Weh2hKJziTAUk6vv8kVHsKRxVspiNWpE+TxqJK7C?=
 =?us-ascii?Q?7XtB3sSJxPJ4TBo8KcZyQMZWTjUtfCw96FrR6zBT6yNA0ISEeslZNbHDo/I3?=
 =?us-ascii?Q?JU/ArTourur7PF/KEPB152zsSNL93P3Xe8Z1ecD0w5nglBiGPVH/93XtQSzE?=
 =?us-ascii?Q?Ba1VwNk8YNWNYpdWY2sCVtc9jq3MxNPBDrgXkZkRRzxFnsLLtVFd4ve+ziGo?=
 =?us-ascii?Q?maSXfHjG852ZTSZ3X+ynJmdlM2iyrlGgKA=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iUN2AtnxEO3WAHDemSyAqS8S/ZUoS/wBAKCtZeL1un2REgwo37FiLpUTXnOq?=
 =?us-ascii?Q?ToKEE4sAxLvP5rzj/bt+u3VTRjK/syYfiLDJv9o8BarCzQadidk1usECSK5g?=
 =?us-ascii?Q?s0Mr7qxFviWjvg+TobFrt2YzMUi7F9OHXjaSIyr3g2Iq27Dr9oxsSofYxtvm?=
 =?us-ascii?Q?zJKaobZDj+npPQhBRIaQ8v1WfCkEuo8Yjk1pgfpoaBPeUD7HSMR5Cu/lMBt/?=
 =?us-ascii?Q?gRu3BZp/ZvlR1XXAwoeVsAttiy+Cl+pGAJ4P19hje71QhxbX2wtlYJa728yY?=
 =?us-ascii?Q?hokzOWrwzZ+BWMdi5YwU5fcS8DIC/7cJE8t0wrCyrInOlIzk07ShmwVF4a/y?=
 =?us-ascii?Q?boah+f0RXXary6PVIwdxWawig7cmcKl66FGQf4ltfZKaGO7xpuzcRGAags6C?=
 =?us-ascii?Q?HCrUnes/jD4OK6bBDkR4jItYBwYIi/X2iyxrcwRJrZpA3l2YhRAK2PVkoPR1?=
 =?us-ascii?Q?aAvxWibqzKeL+cDk/x8UOP2Ly41fppKOdV3x3OaDqHixZfCgc1NXDNUJG5Rl?=
 =?us-ascii?Q?ErNJWH1yUmg2Zh//yIfFQgmuczRAc9cnElyn+soQ1QJUg5/O8CHlIpUzOSyH?=
 =?us-ascii?Q?se7VjrXCGMtBhzRkcpCu78eul4RkvCBFTpK9cwj2cK9a/YTmPNQcblUToG20?=
 =?us-ascii?Q?DeJxus5sUcAn7073ApTvav2SDboPkioiAvkRcmA0GhljoF6w2dGFpvY3p5Ou?=
 =?us-ascii?Q?bkW/AtDnP42Xv+PfpYL+46nkHn7qQ189WQki+Dwa5/Cb68ScPQMLEB+ifq3h?=
 =?us-ascii?Q?ok9RkTkPQTKUoQQbETZpKlY13BuBCccVvZIhoyq9GfRgIf/hMSGxfgB7qeqZ?=
 =?us-ascii?Q?Yq5ShqaxvjlbF+vv6LCVS6mHdsbebKz7JFeI1D/0jLnhGihpftZY5Z1WUx+l?=
 =?us-ascii?Q?gYatEs8WOSyS3X5w3IL6zs+bbECqos3272oWblMgFThSHSzsJyNJ2L7lD/4f?=
 =?us-ascii?Q?ooLkv8nNxoMKj7wmdp+Z+y+5gsukquyFh8r5iC0ZfRCuSvPJRIqnirkpktJg?=
 =?us-ascii?Q?cHBb4LZfYqHonXiHftXT6keGzseMlJfnYFISHls+zjaoYTUTXj0ZKav7xUod?=
 =?us-ascii?Q?9tUb3WUUw7DdNc2BEsPYYEFa1Zmi5VqQHSfw7Vh3T+PlwbyXkZQ624oL3SHs?=
 =?us-ascii?Q?KL8LH22T4Rm6xuq2hTHxUH2aD9XpOx4Up4etGUFQaMN3XpoBfhJmS066u0NT?=
 =?us-ascii?Q?owWmN4dgKvUW/YPl+wjmx11kLa6hLHQrwSQG6VSwmoa+7NbkvkAZkGIOg74m?=
 =?us-ascii?Q?3dTY4RcvdHeA2asq8ocA7bNwEZwoWEx8erNY/9dg6gWLI0tGqwHbWGmnCMgh?=
 =?us-ascii?Q?+Us26XzycCw4/yPa81BzSkrE?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A0775EC3B3AF7F45B098977A1180A0D0@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 071cd5db-914e-4bdb-676b-08dd558c9f60
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 11:07:41.3620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB9351
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

From: Aditya Garg <gargaditya08@live.com>

Remove the redundant else statement from atomic_check since the previous if
statement was returning if true.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/gpu/drm/tiny/bochs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index c67e1f906..9ed5f70a0 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -433,7 +433,8 @@ static int bochs_primary_plane_helper_atomic_check(stru=
ct drm_plane *plane,
 						  false, false);
 	if (ret)
 		return ret;
-	else if (!new_plane_state->visible)
+
+	if (!new_plane_state->visible)
 		return 0;
=20
 	return 0;
--=20
2.43.0

