Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62708A43CC2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 12:06:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D154710E4BE;
	Tue, 25 Feb 2025 11:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="pUJOAZwH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010004.outbound.protection.outlook.com [52.103.67.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB3010E4BE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 11:06:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dPWSteS7HPJrIqDknVo+w6rZxJXGyy2pFjk8g1SR71DMxNqKapLHqsMwLuFBqGaDTlXrhAFLCfK3IU2QwlGh03+XLTNrSkq2EXJQDfuPuwkajDHWDnKC44IS7QsgYtxnykbhbVTMjf01E/vXQt4oscOa+8KN+jzHV3USJ2O8lAXoFroU3mLM/V0CMXlHCAlS563TVlexfWefyyu0XlJqp3esmiZbALn+6gfwXWMPH0J8oXR93tNXxdedNDpkfn2auP1hj5RFF4PdzkVjpF6xuH+d2K8eUHYxxY+f+ygxBM7fv1Xz3HjlnV1K89ZjOzR83Nm2MzvYONmIFXZQrUb+/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2WpljUFxJZ2L3FPg7QSmSgChmgPvuVFc3eUr9Alo5k=;
 b=qaWcmOHo5OzkGQr6/h49UupWGwZv48jGnQKDm5hXYSDlaI+I+ff9/cYf4NJ2S9TdxhiVjmoxvga91IbJc5+GACvOIgvOIEoHDhfdycaTDwrX0LHhFjXpHZf1SrJMtayz+7w9NwmIrFHz66rR96Yny6ce7UZqZZw7eBiU9Rt7KJ6einxvQaUnZWnw+dq2m3M+Zpy0EOdPJc1VJle6aJkQovBNTXw8Jl/nEqlT5HfdeTkbDPwRN9OLFQBKbcAxJ1Xo1hpEUfPH+w1klwt7ShmqN6PB69qiCzToE/O0TCaHJUq9ObydzpPqsC1ipVYK/x1WGow3ygQg4KJ5G9FYu9Ts4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2WpljUFxJZ2L3FPg7QSmSgChmgPvuVFc3eUr9Alo5k=;
 b=pUJOAZwHyvQfHn7QuRwLQeH/6h+WU5vUwbKV68pvFpY3e2iEjgYAwuxjKqPK3+H+MCA+lOybKr9EYSxmgdDfh+jzno8ua9CMU2SnvmN1SA0AM8HWSlzGjBf4UxPG+GOmR3I0+b+T/52itlehtubIU2hS56Bb5gWk2FUi6ow1XlzQH2/Tp6mTPuMAr1Aj+ylJxaggfD3McrGLlrgT2Q2jq9ZIhyWGCu1gjgiAKmqsI1A22DaCcW7Pxb34dVkW7Sxsp1bjdVBruz3Wrsec31t6DJk3j8YTizONH50XR3SG9k1HdBAGmLGnbl4VZhN+AZvSZnDQCkQ1FMkeMBdPLp/nnA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB8050.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:83::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.23; Tue, 25 Feb
 2025 11:06:39 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 11:06:39 +0000
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
Subject: [PATCH 2/6] drm/cirrus-qemu: Remove redundant else in atomic_check
Thread-Topic: [PATCH 2/6] drm/cirrus-qemu: Remove redundant else in
 atomic_check
Thread-Index: AQHbh3VXTtwLM92/iUSwQbLwovn//w==
Date: Tue, 25 Feb 2025 11:06:39 +0000
Message-ID: <088E1983-D311-4B75-B198-242A32DCA3B5@live.com>
References: <C8A4C8F8-1568-423E-A656-05D914D9933F@live.com>
In-Reply-To: <C8A4C8F8-1568-423E-A656-05D914D9933F@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAZPR01MB8050:EE_
x-ms-office365-filtering-correlation-id: 89ecd4c4-3162-438a-5f23-08dd558c7a69
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|8062599003|8060799006|7092599003|15080799006|12121999004|461199028|3412199025|440099028|41001999003|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?J6plv9bwuDufpRJ2FsxKwIr0w2f1U8zEHYZoPbYrF06KmBE/KoqAWAhN8PXh?=
 =?us-ascii?Q?CP6SXqD2qiMwMjG30z8gCEFHhu8rqVYObCQFBYIHlMtxCBsA179jv7GBocmj?=
 =?us-ascii?Q?6jbNKfYAyo8zKOGDa4RUkzlhJg1tQbJFJ+G3AjOMM7xuhDTSZoo8EtYU8vDx?=
 =?us-ascii?Q?CDmaod3A72Ht0TYRpK8OKHrhqeHR69s0qIM7vSVNLc/agNC/g57cXwynC0q9?=
 =?us-ascii?Q?jTMo06QnvKwSdhmq0XIaxfwmx1vm44aClrKbX6M0h66T+3N9YdERAovpXxiC?=
 =?us-ascii?Q?2oz/O8xkKLY3+dBv9NF0TAR0IX9QTEX/O6N2gH6aebe87/VoGKzqBd8FJe5M?=
 =?us-ascii?Q?SGeH48XrWwTSIWIS4VzeevnrxKe/5uBY+1r1VMo9lCRQtYYxu0ZO4hTqg7zK?=
 =?us-ascii?Q?SisyPI/NVqxDzfWHpslK80d1Eqv3OzWeZakxPV10wyTjQu1CTmvDRWLi72XX?=
 =?us-ascii?Q?LoaFqBeUHLTCn1iCQOilgdFm9DMIEEZF69mVUz2FHp9CdgFBBCr5Ch49Hytq?=
 =?us-ascii?Q?6TPTG/WdlAPO/Iz4yV8hKowzhXo43/PKFHa3L7dxjB+X1yH2TZvyolzpRdio?=
 =?us-ascii?Q?4IprrtrRXhU8tPrJsPvkMObFAx9EpghviLSpgiLjPLgfeMgcjLs5/TZR4ugt?=
 =?us-ascii?Q?N8P1JxEdX+QgjNEvwsENQd2iIImqfy9IKj/3jnNGHDiU3ZObDQxaOM1/zL0V?=
 =?us-ascii?Q?S63qsPt9snm4qlIpDheCNiUH6HA3S9pCWiNty/JNDLHlliMMSFS/QBtUnpKD?=
 =?us-ascii?Q?lPo6NK6Bavb96ZTtZRdZe03ehsWonIRsA7lLj0JT409wrSHHWEf0RYQ1T7BF?=
 =?us-ascii?Q?iuXYvVvsNZn/BEqqtpNA/HEboeBQWgks1n50AuFQtCSLbvzUtjYXeF68G/uu?=
 =?us-ascii?Q?WCE9gBPl7LJwCPZ2wcgLMIzNjFGWncYqTkLpQB+bwprPAVgt8p6slwSo9tTV?=
 =?us-ascii?Q?rtVcmfZFg9egVnnPRmEpFKEbU6XzmdK1eVBLDcXagFwmOA3dc3cKqU0KRnMj?=
 =?us-ascii?Q?l5c4L2mFgUMXeGcCi+EESt5S07tWutdJVdlmqwPFi3uW/KofrrZJz3eiXSrr?=
 =?us-ascii?Q?xUQHdtUe4tMxr70XwbN8XZzOVzGKV9AOzrU0OyFDV3PzmVc/djSty0ZGP79J?=
 =?us-ascii?Q?AP24Acw2MxUpYrJzBNMnfAGXFkKUwjE7cQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FMth38t9MMDMAgcS/1q7a3sLjFuojEGPjKzjdBgSUilTByX+5sPMJ5XBQFT2?=
 =?us-ascii?Q?vyhv2W6uTLsBDfJICznNaZDZjca8w4sXjT9ZBPwwhozWGCaVq4IkWI6YVk2Q?=
 =?us-ascii?Q?cVh1zhcaoH5e9lUlRi8OXshvqD5QBCQ1BtYhrguLdj3fJiCwpkmIthI3N9Iz?=
 =?us-ascii?Q?Z8a0BkAxyn+JQ3Xg6fy/URXrq63frtRWIxsBIpW9WJnj36mMZOzVyXsn5egb?=
 =?us-ascii?Q?j6CZ/MRwp0Q18Cl3WEFNlMW4Pjx3liqqHGV9ExVbVtVTzFDJU8wjziM6aIsz?=
 =?us-ascii?Q?hKH0i4OyYOOFZ+eUdVT/uFRXHYE89V65ob5CHwBhHYIj5hJytvr6OBBgTYXY?=
 =?us-ascii?Q?219FqmRtfFcbepw4b/4M9yuoJXTbYxbNs1TxkhXiKfD7r3tq+46Evuz1Kx3Z?=
 =?us-ascii?Q?ts/qhJcWPc40c2imjIOMxtPxTFDGloW5ZxIqZ0rPA/iWj7BABUzQZvry6pUG?=
 =?us-ascii?Q?nKmZLv4wbZjxTrRWTNW9SA/t1Enc/7wxsqeHWK/C3xcLmDOG8CiAsWYUQLKa?=
 =?us-ascii?Q?zLjFogRjbbFyz2DKPAFVar54qaLvxxcPRyiczjv47MFP2NUY4wP/E5izcgXg?=
 =?us-ascii?Q?0E8VSQanttOF9Nv6y0QRgw4AysXfdxVZIsR3YZXWBiVewszVsMrP2bFPTIr4?=
 =?us-ascii?Q?wK9VkLQwurHuGthMkP28v7/C8FkXOD4GNFq2nyd/PNBxZakKZgRRafgawADk?=
 =?us-ascii?Q?uRU052LlI0ybR2y0Ep5wK8dFVmpdsBw+MsizJdPuNUYWkz/90UQUAWjvGcHi?=
 =?us-ascii?Q?dZFTDpHWCf/3gX92cSfLZTPIhHF/h105V54w53cBifjQI+cLe+OIvGKZgcQC?=
 =?us-ascii?Q?KCEqG9uDnUG/TqW0eguzt7XnnsdECMCd8cR7T9dA5bEMuEv4+ZCLpMmAw2na?=
 =?us-ascii?Q?NJp4b85Qo2/TumFHTwv+fegDisqNQTMGW9CO5cF/gUnOugVo9um8MsBk2UNy?=
 =?us-ascii?Q?yk2tQdq/wUtjfGxdrMetfbJ2mgnRDlu3hK//ewP5oTwFgNCHpjE39VxeCX+o?=
 =?us-ascii?Q?ak72P9ssyQZ/nYDL5w0a7/I46iFkM9temMpGXs1NwD/8y0TKDpDEDTBdKE7k?=
 =?us-ascii?Q?QPjify8oWdM98pIZVnh67c4LCAzhuXZF1Uaqlns12eFjZQzwTh5qaJJof06H?=
 =?us-ascii?Q?SVDc5jO7eGZDxHmi97Q9R60ppo5Ek6F+iF9v2gY5+XyoGnvY8hmnTVNto7Gp?=
 =?us-ascii?Q?02xvImPxhQoB3LcRQ/uCFzt7rQFVOxKR9nuvKKLR5+zmmBCKILXiqIk8Z8zH?=
 =?us-ascii?Q?grgk16V8LNicyAYhip5IACRJolHM1eN+8rjL1uLFBoNa5hqjnwKghMDdezrv?=
 =?us-ascii?Q?QeEEMOw3lBhtPY4XCuc2yXr6?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BBF05D3A8FDBBA4C89B5C65545CE6E94@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ecd4c4-3162-438a-5f23-08dd558c7a69
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 11:06:39.3406 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB8050
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
 drivers/gpu/drm/tiny/cirrus-qemu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/cirrus-qemu.c b/drivers/gpu/drm/tiny/cirr=
us-qemu.c
index 52ec1e4ea..e696531b6 100644
--- a/drivers/gpu/drm/tiny/cirrus-qemu.c
+++ b/drivers/gpu/drm/tiny/cirrus-qemu.c
@@ -359,7 +359,8 @@ static int cirrus_primary_plane_helper_atomic_check(str=
uct drm_plane *plane,
 						  false, false);
 	if (ret)
 		return ret;
-	else if (!new_plane_state->visible)
+
+	if (!new_plane_state->visible)
 		return 0;
=20
 	pitch =3D cirrus_pitch(fb);
@@ -367,7 +368,8 @@ static int cirrus_primary_plane_helper_atomic_check(str=
uct drm_plane *plane,
 	/* validate size constraints */
 	if (pitch > CIRRUS_MAX_PITCH)
 		return -EINVAL;
-	else if (pitch * fb->height > CIRRUS_VRAM_SIZE)
+
+	if (pitch * fb->height > CIRRUS_VRAM_SIZE)
 		return -EINVAL;
=20
 	new_primary_plane_state->format =3D cirrus_format(fb);
--=20
2.43.0

