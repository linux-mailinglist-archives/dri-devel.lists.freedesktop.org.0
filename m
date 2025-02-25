Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9567CA43CDA
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 12:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF9B10E615;
	Tue, 25 Feb 2025 11:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="Neuh5Vkb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010007.outbound.protection.outlook.com [52.103.67.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896EF10E615
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 11:08:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bc11LIKiYNjha8bfCaTV/ekbKI4WkSynCvoJBcSnvYKv8swcItQyut8t5na+Ye1S+lVfvZV1B5tRrxR/FrOEtw9CY/pHl4kuVQF79qAKW4k5eJDsTlHhCi3/u69KNO61UTQpli+KlCFy2NdDTbWOfXGEwDIXsCD141FFefk31crwDE+GLiwep3mhFuElbCFUSG9EF2qzAqaVTTDGLdk03Davo8vftxLW4/JlQSKy6b61zvc1Zu/0BadLlwc+krXTcga+hlLfJi3QPjFcBnoNn5FnR6nCcfN8T74haEp+r1rXlRWf7191CCKclX3xH8dRcwBR7Eeh/TWqifvhuwH2zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAEaydk1bQrGgxI39LEo2OfttHhoe/JO7FU0F5yHrj8=;
 b=iBqGs4ntfdoKHn+Ph/+4hWJAnZU9Wc23jN7JqiGOO5vp+rJ1qu1In6J8g1iik5N4ET5zg6ALwOShcffa/s2Zm2LbibabyhMm9tUdU7LJn6yvrEb9DmrQjAjO2ZFcLefej2GOBfEQt66SV/qecoDYypVSn8tQ8ZVOakhsAosqAokhokUQlimH1iZDi0S0dfF4TzCHx+yfkHf5QquiBclQTNfv+ufGZL2ajgBoK0KE46iyzw29ytTeTcNrX+4Ud72afJJts2dACNF5jxiningRc6350PSWOwq+doJGUxk8P/MFlfMF91xBlbzsdErjK1nhpEMUK3rXIM0QJMvYOpJC4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAEaydk1bQrGgxI39LEo2OfttHhoe/JO7FU0F5yHrj8=;
 b=Neuh5Vkb/neJU0PkKmQf1dHtti5mA93suSY0ool+LnhFFdVXad0F3Odv7dYiapJ+34PlqZspdAjHAfBvQAfz7ACXOWuamuw6cZupwCRbM4w1+jvQ23Y7j38kwm5TWGKqrQLZlmaHrHWNFjppLXP6IuFy/Nt7vCpZR8Q8AoKE0xkQ7bcwfeipt3NQdPbthiLBQIubEuQPDsRbWnB4fxORi7tFrOIuU2Rg11s3TKErgxG1IRkoRKUzWAxfuhLhEJFejdHMybJKzY/5YQP2b+uXJ0tAy9JvaOQLs5KB5+oh0boVMMPqv1w8+uQ0WXstGubcX6vRJcm5XPKckkUeCDFB1w==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB9351.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:108::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 11:08:50 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 11:08:50 +0000
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
Subject: [PATCH 6/6] drm/mgag200: Remove redundant else in atomic_check
Thread-Topic: [PATCH 6/6] drm/mgag200: Remove redundant else in atomic_check
Thread-Index: AQHbh3WmZ5+JflMfmkqJI8IWSsKY7g==
Date: Tue, 25 Feb 2025 11:08:50 +0000
Message-ID: <2E60927A-15DD-477E-9533-3256D384D984@live.com>
References: <C8A4C8F8-1568-423E-A656-05D914D9933F@live.com>
In-Reply-To: <C8A4C8F8-1568-423E-A656-05D914D9933F@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN0PR01MB9351:EE_
x-ms-office365-filtering-correlation-id: 10358f6c-948f-443c-1c06-08dd558cc881
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|15080799006|7092599003|12121999004|8060799006|8062599003|19110799003|3412199025|440099028|102099032|41001999003;
x-microsoft-antispam-message-info: =?us-ascii?Q?kBKbCkOgK5f7L062xDhPfH314+3t9S/AQxXnu9wg4EVZs5ik8612VNvubqgF?=
 =?us-ascii?Q?29NHvZ5RhIlOqstAZgk1Mwp9i9zUy5punQJ1wzhlB1NzBqu0AG6wl9Y8U9lL?=
 =?us-ascii?Q?N8OK+19Io/B+bSIhJgwMIyKgUereIqsJOPcF04ZMzG3iMSXYUaJCsrfDXhf5?=
 =?us-ascii?Q?lLP5xjYIZfGZWwfjS6P8hb9CQ1XHnMBG1yVaVyQZUiJ2SaFkpMVSa7hYwV/V?=
 =?us-ascii?Q?wn6SgIRV9AGr9kDKlAavnqDSWAvnO7c6S/4yWDrCSkBwiWskm037/TCa/6wu?=
 =?us-ascii?Q?4BABLBuBT+xiYqS39maVRW6RwPc0TLc2q3bvVAHkGld89+BH6io1bzAg4NQf?=
 =?us-ascii?Q?SGPDQnz1AQ8FiW8VFnnx/DVGhRrclpGD9pS/0E4qiW5cbDIlUNjzimm+4555?=
 =?us-ascii?Q?ZayeDRPsjEKbRgUnkdlNn1x1u+XifDGaqGZ373rVlRF5oMzBIM5N5sI6sLwg?=
 =?us-ascii?Q?O7NYyPhaV2vrxB4tqJwYk+eLPoRCRoZH1X6l0SWY15fPZBDMG6VxyTV4kFQ9?=
 =?us-ascii?Q?k1u9PITA+N9amsDKYPNzdIwqtHSppbFQy0A98z5ApU+16tDLYpLKjJUqKmCs?=
 =?us-ascii?Q?QmpKcwW2qGrJ7PbeEWECi5Qc8IqpSdaQ/xCQJQe7c35zdESfLcYVfIlwpaf5?=
 =?us-ascii?Q?nLD/4dI6wcwbnphrw2AnOvRw489ykf6XSFcUCw+oxP6dGyjBTTrZGooc0QBF?=
 =?us-ascii?Q?rrOFsBnC7VrkVYEvx6Og4Si9zCoEdE4y4ELLn8ybzlz5H1kcU3lCGvi68Fmh?=
 =?us-ascii?Q?AiBiY+P5sncrnB6gkqcbHlfEaYpi1PhXSR+3bibyGPnLz83NB/wG0btXJxhL?=
 =?us-ascii?Q?8U1g7BGI4wwaLMpviDRT9ssKHnpCfZXuw/JN0LbEOvs/F0y4UYxpQ6NuqQ+o?=
 =?us-ascii?Q?puBTpejVQUczVCzMYikBSKxT8Lw2ufXp7vh9ff78KjjAsqyo+B2r2x4CBpb2?=
 =?us-ascii?Q?RZQmW/KCWZ+r77vzrR/QjxwSiWNhBp5lCPhLKzNTRfTyxeC4VWujrebcShBF?=
 =?us-ascii?Q?tqbX5RQtLuuVfk/mMO18NcUQnHYsiK6RC6rrUGFvzkqyRLHeuNNchkH2PAPj?=
 =?us-ascii?Q?SypxhmyE/QCAc/fOqC3/yOrIyhprxSF8boIw6xpluAjFPLKZ6y3ERUi86J5c?=
 =?us-ascii?Q?UGq4WdIJ1Dcw1t9W/lokwsxkpbwRuBI1OQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uI5jVrJWkGCl7fYYf9TVDsAzsiG5ZTjzPYshBdg0Rj1exXgoSQ0ip5Txj+ut?=
 =?us-ascii?Q?I2YHmt/9mkSXKxzlURwt7K5bz/OiOUujZDt/gEzjZkAGuEd72yNbEvd/VtXE?=
 =?us-ascii?Q?15XezUCbFnRVcKztD3o92XHSJ49G5+vFotLnuV1W2zDUtkyk0dL7p1P2GQF1?=
 =?us-ascii?Q?u9i3Ygtb2TU5VKbsySq4hczIi2I0EzkZ8na5b4wdYEmZb/0WOOC/g8Eie1tC?=
 =?us-ascii?Q?E0+yvfgc+IHkLPnWIz0p40ARDOuBcGOcYcDXZbrBOg/KL16OzpwHn634jluZ?=
 =?us-ascii?Q?h/OsJVK5bi2+qJAvmizoMyV9FZiihd/NF+3c51FnvSY37mPjZy8Vdvj5/i+G?=
 =?us-ascii?Q?E6AXr9PwpbSR3PO1KGKdb/B3yrNjlE6NBCqKPk2karfAF4P4QQGJpHQC5NhU?=
 =?us-ascii?Q?l/HYRFOjYYyv0fwsTAhHy6Y1PDIYPC8qyjEVZzuCK7Gi+fYYquwEl7qd8q1i?=
 =?us-ascii?Q?n8UyR3l0PpFo8qFZbtTDr0ZKDNcpBPVPv37+/VN1Y31bnPSmT/hG0Nf+7090?=
 =?us-ascii?Q?lUXpodgBVcuk4x3rjqPRFebubtJFQExdxoyvpmiAOKAY7eO9ZMcufVWpg0KB?=
 =?us-ascii?Q?1A8mkAbTMbNlLAca+8T4zdJtM56YEwzpFvdG5yOn3TbD7ybplMGvratIMuvi?=
 =?us-ascii?Q?JA+en7zROghutqgMBVki9CB6P2P20n3XC+htbmWwObta6AGFPSZ3tth3kcZW?=
 =?us-ascii?Q?Nl+5Om4JT5zs1OhY8syVLSVKAC5a9ktWrxKWxlKC1ASptcUNHTBZ83NswWF+?=
 =?us-ascii?Q?aDOBPrwgjCuDtgg9+UxZafJlGCqG8S0HWc5UXUn0tNEW6PD98f+pZuiNfF+J?=
 =?us-ascii?Q?NzK9sd33BSNuTLyTeWA/6ExTuEbbS4oqb56VsAZWkuoIqzB5emCfZ2rAg8pF?=
 =?us-ascii?Q?P6dM57c1i1n1LgqpuLV/aVSmnR/UAoSF1uG55JVyGBPwK9giu+temjwoAO/T?=
 =?us-ascii?Q?0841+pxXBBeTuRzIqomZ1ggJnACfxqbg0Ux1EdjyLJHcWpZ5U6gSkPFMPE4Y?=
 =?us-ascii?Q?9fENIGFJ1uXhbnHAxLimfoOrsNc1N75UhX5p0DjwARngYGqjTa/a5IZ8AMDt?=
 =?us-ascii?Q?iIbwYIWTdtlFd+c3ShAUpC/p7VyLIUIwKUQ9WQugLRPRvzqvH1u7XrDTm16M?=
 =?us-ascii?Q?GbqN2V0Hnr7AhUWNwgdhZB4NB4EyQisd+HsUwU3ixNptDLw+I3Ts7EtP0+VS?=
 =?us-ascii?Q?CZ++sHoKt7tlNppmw4GdSPPy6hGaJsewP4+ew7Aifa3Cv6Zjscw0knfpX/TU?=
 =?us-ascii?Q?K/rH9O9gUZ/iD1tZY5HVFSpU5FLObR5jd6obG4Xrp7s9IGhQ4O6i4s1qkkly?=
 =?us-ascii?Q?WUPhMDzKrnwdKnUlrL44f0Of?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <428AB63721E8D1439BD7FAE9402CB210@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 10358f6c-948f-443c-1c06-08dd558cc881
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 11:08:50.3965 (UTC)
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
 drivers/gpu/drm/mgag200/mgag200_mode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag2=
00/mgag200_mode.c
index fb71658c3..e3e102374 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -483,7 +483,8 @@ int mgag200_primary_plane_helper_atomic_check(struct dr=
m_plane *plane,
 						  false, true);
 	if (ret)
 		return ret;
-	else if (!new_plane_state->visible)
+
+	if (!new_plane_state->visible)
 		return 0;
=20
 	if (plane->state)
--=20
2.43.0

