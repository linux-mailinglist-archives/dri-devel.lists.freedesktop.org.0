Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F10E7A43CD6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 12:08:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB3A10E614;
	Tue, 25 Feb 2025 11:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="AOiCMNek";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011034.outbound.protection.outlook.com
 [52.103.67.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE00F10E614
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 11:08:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gqrIp1EpMLQUZR8at7yob77oMVAEwLnJmCLNPRdj0J/Wbe20iCK50EpXZfOl55Amr2MUkLLUVPHcngASLt0ipt6TrqtsX7aHbLYLdGVu/Kzkamk1FvDCNNU16yg9ZRpj4Ojzm4HzxaUx+yvLwoHC46v0u6diwGCbuVnj9BTcKtceMVz8OysTlR3DqPo+mnzEzgwJVqQz3XLkmVSBM+4FSGEcrJvdV3KdsOQ/cqr5POtNAYGdi4XxwU6w5OI2zGh50SGOYFE68VbZ1dXgeQZ+P8VTDnXecEspeW8yBHR488Npa2rw0WADQ0gJ6frnt3VjK4JcTRp3awTS0KakgoIJ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIyoiauYOluEMoB+huXSWyuUgD5t54cBnS2Kl2FULT0=;
 b=P/7CKSI50rPm3MbKunIFhh5KlWnIyIit20RIsyt56yZf37BUMxYOQrMjlXsGlFSxxZhPtiPOisJgl3K4bB4IrILmRTxoTT+PIbFeM3UPIyqaF2yecbyeuxlpNvkzDT4PxaMouTOw2EDgwlAzjnRQmpu+QgJRGDpa7RJLXeTMGjWiIUFuXrzLNupOT/5evateutAiRBud5Dt8WtaL5Nl1TdfnXx2lq9GquieKiSpoNBXCRNjhikwsbKUFqCBohlTmjMB2hAKUsX0VB1bQK2gsZdCQg4wcieTSWoZ/oZcvHQJo1doRaSHWVSkMbjItedDexGXUZ5J1FiaQ9PSIM9wtdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIyoiauYOluEMoB+huXSWyuUgD5t54cBnS2Kl2FULT0=;
 b=AOiCMNek2mmhWl/RFMJmu6w3vHsDKSn+kEXlaWSiFZ0LSZE0+yIZ7YQ78Ju9KT2ZF9YUgKOSI/zTqlcsxTCeV0Bc13zWj+u626yk5TgyZgkWaLdhlSlAh+xayF7GtaveSv8mj6lprfgOhTwQqr6vC9L1LEnqr7pMhyPhMesFpodOjwht+S1652X3XTPCV6f+877zFXb9gHRFZSscf7gHUrEUCTdYy+9/9/u+CHZq5t4XWm/EbFONNGATngC+nI1PrdiwXT+lrp2amNdlbqmAHnNy8cnrkPcxGVaY1KsUZUDeix6jf0CcobiiepjPiUVBOuc2II/avJ+s368wJZzmBQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB9351.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:108::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 11:08:13 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 11:08:12 +0000
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
Subject: [PATCH 5/6] drm/simpledrm: Remove redundant else in atomic_check
Thread-Topic: [PATCH 5/6] drm/simpledrm: Remove redundant else in atomic_check
Thread-Index: AQHbh3WPKkVmM2yDfkOjykyS+gpNrQ==
Date: Tue, 25 Feb 2025 11:08:12 +0000
Message-ID: <79FBFE0E-ADCA-42A8-A92B-22FE68AB69C5@live.com>
References: <C8A4C8F8-1568-423E-A656-05D914D9933F@live.com>
In-Reply-To: <C8A4C8F8-1568-423E-A656-05D914D9933F@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN0PR01MB9351:EE_
x-ms-office365-filtering-correlation-id: b22090be-875a-4db2-822f-08dd558cb1c0
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|15080799006|7092599003|12121999004|8060799006|8062599003|19110799003|3412199025|440099028|102099032|41001999003;
x-microsoft-antispam-message-info: =?us-ascii?Q?qr3HGe6f9X980jGUdWT5o0QNXWSRzF5E64w6LRclNPzUbJsCOTWBNblJRnhh?=
 =?us-ascii?Q?qHSqXUIslaE9CO+qoLkqslUP54v+typn8oLNfdtqxMHoIzgdjXOuDCSMqfjw?=
 =?us-ascii?Q?UIQhIxKk9kT1gXjI7oZk3Y4SUx9vbxjJDYvQjjFCHZoWv8O+zldkneSWT4+H?=
 =?us-ascii?Q?vscgQptsra3IPpOv0twz6iL/M7tcqmnJiUhiarw3IFhQ5AHn1XqHVyK6RwdF?=
 =?us-ascii?Q?QJE4OBEonnCBmbfxIKvgRxYAw6NYG1KYPyeyPwwToEI3FN0MS+ynS5U51l5M?=
 =?us-ascii?Q?ej9uHaN/1ebCr8WY9wxXqsOukMQbGyAYuNr++rQQPS5HfuTKtlHUiKA/9R7a?=
 =?us-ascii?Q?zVMXtqYH1gFkeqUdQdv4B2m23D9f7iW0JfJU+dbAIRCmZBRoD6uNYtZbm2uW?=
 =?us-ascii?Q?WT+3JBLyDSUUSAh1wgKoEOuN9nXe3jqYTf9IrVY7gBhF14oeOlVoRDPh39Bz?=
 =?us-ascii?Q?vfvgkZ6C+4CDOgTtNv64fhXM2AvxDso/Hvurt3jJ58IDSIz/1OASJAsyrg5P?=
 =?us-ascii?Q?UW2XSJYGUF56ODlkFCZGzf4RIsgdHFGVpIG5QV8Hp3ZTjKw1h88EEc9kINH+?=
 =?us-ascii?Q?1pwr5jrErgY2bKsZzak9u3URO8NfCZfldrKunLRLg5cpO9tZRZPLTrkVSsDl?=
 =?us-ascii?Q?+2XD83kFeUccDhPyv5Dh5t18JZeny4jdvwzA35GSO4AkLJGL0ylgVmS8dRE8?=
 =?us-ascii?Q?iGhZMEIJKadwSz3zeL7rIaiTeM+rcC5IZeCjZCCGXhzVGdCVtrbRzAjiDNQY?=
 =?us-ascii?Q?MGYWBwJ0MTAB6zrdvUiiutQQQN94ZxUuags3Kh81V/ewsVvjoKpgO9szSC5K?=
 =?us-ascii?Q?Ga9Cu+q+u8dhEfrHRuJKD7XyCTd2r3+fvjrckNkiArVjTJE3QYnFAiL3GQU4?=
 =?us-ascii?Q?lXYtkp3mKyBJCZB+5IhnxyrSjIsJx857A/FM4OJNQmpiUipEkzo0UafU9dRq?=
 =?us-ascii?Q?+R8BcRIo6UbGkdMf+LQP+iENsBtyEDbOxDT0af2kGPGkuG1zZIlt+n8GSbJ7?=
 =?us-ascii?Q?OlpiWcU6RdL725Xcp9O+TMTLBe91jN1ipTtiJux9t5eAMaFRTQLHttajKEmf?=
 =?us-ascii?Q?jkXC3oPJ9XayYthhkXhDi8dWyGXOwBCYediaoUDGVrKNNCqft6A6Kq/PDqMw?=
 =?us-ascii?Q?IO/Nl1q3xEnyvK+CupqkG4oF3puk4nWsXw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4B1DZyg2nxrpLNfcbHbp7ZSzvzhrBqO57bIivf9UcuQoYP4LRnGaCi4NY0BM?=
 =?us-ascii?Q?svOGSF21RE5zGyQxnnRWMRuvc0UEa4qL0FeAaoV08nX4hPFADD8MSSvAuVE0?=
 =?us-ascii?Q?7mfOMs2qRsCeGYL5+2taxT7YXpYl4RTBjGo6KMDycwxQgwgZV0RctJQvngLN?=
 =?us-ascii?Q?39oQKw4e6vZHMn2+NBgCjxXokylRQwHTe/Yoz91tQPWfjoBxVHOMmwtpFioK?=
 =?us-ascii?Q?dEe8XOrawSp/mVhtQ7YQ7XfvoXEu/Rl8VxrI3ZTPPiCcMK9k+susxTFyqpj1?=
 =?us-ascii?Q?4IunqzDRJlmwkyquVJOz29l1k/M3camrZ/Nc5z55y8ENBCIJUclbmaF4+1hm?=
 =?us-ascii?Q?fR7MXVu5v64pJ6xFxW4Zk8ZWHStI01zNTgzMOpSc3tJcqN0wxy8lNGBVYDRu?=
 =?us-ascii?Q?MAf9HbsDclvQFO02dbe9mLkJDvjgwhDJfiNOub7pNjmD/V/DHVL0jPbnl4jN?=
 =?us-ascii?Q?sUxGbQdXlBPVgfo5DgGzDxtMnuGpsIftmpVOFpeFqDPnkkBoUN4vvMa8JaNA?=
 =?us-ascii?Q?6vx2FUZKqcKbVTn07q15aeM5ED75h7NzN2mnYG1SaBbb3zudxmBuqmjl3W1C?=
 =?us-ascii?Q?hPmTQkFOPyIzcMKZfW0OPEqMnAUXBPKfFmTU4CAVIH2cn2PAd1GQ0/+mX/xD?=
 =?us-ascii?Q?xDMs83gZUV9jESObLanFufUz0RYWT7/v6Fzj2491AeeGxd4lsT9g9bXWbuHe?=
 =?us-ascii?Q?P7pyS1pavf5YNuqirpsxPLP7J+uOKMW+xE7LnIh9i28c3XqKD29sJ3o8TuBC?=
 =?us-ascii?Q?kNkDrhKgpkQt2LsaS5gWkvL14SkuYNb5PmlWLX76/0cfFsDxb6ZM8j8zKVwi?=
 =?us-ascii?Q?Dh7D6WnaSGDfd00OC0zQXqe85cizOivn7aalh7zsdkhU3cKjrJCvDdO25oU+?=
 =?us-ascii?Q?M05vgAMufySowPTFdLdS8ICbiJ6K+kZdDRv43QQHJ3GQgyLiIh0vUC1PuIVP?=
 =?us-ascii?Q?rVeoE/wWw2AUgB3AJN7LfV/iltB4gSja5ywHuO+me97m/EmoK7eLNSNHQUKw?=
 =?us-ascii?Q?m+SJIcEf0JiZ+eM2iBOs3ALTsw+t1xfbtSfUD6RdV2i8w4MpKzkakO7GIVBv?=
 =?us-ascii?Q?BBF5sgZbf5Sp47R6gcOdAytluYb/dNQHpmc57XiuK1jgcCIMetdRbypQ9dlV?=
 =?us-ascii?Q?4vpRS1g6q4ZxIkUmd01qnxd0AoDT+Q42T0yuTZoZsbI89wCBvmUSsRrg+WOJ?=
 =?us-ascii?Q?N97sikW99xX1ambZYYcz9FH7bgHH4Znnu4kVkeUYAs//Y8kAhbjACj/p8VET?=
 =?us-ascii?Q?Dsbw7MBqSnFaeZdqkhpfGq0vY5JUfcULz6i8rktEXSC5Kp3JZq6HmRk6IUCq?=
 =?us-ascii?Q?1jXbIkB82ZWq9Z9pUpjXLIbi?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <49139D353ECF8C4E985297F8103D4B16@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b22090be-875a-4db2-822f-08dd558cb1c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 11:08:12.2128 (UTC)
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
 drivers/gpu/drm/tiny/simpledrm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simple=
drm.c
index 5d9ab8adf..1c20d4c49 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -602,7 +602,8 @@ static int simpledrm_primary_plane_helper_atomic_check(=
struct drm_plane *plane,
 						  false, false);
 	if (ret)
 		return ret;
-	else if (!new_plane_state->visible)
+
+	if (!new_plane_state->visible)
 		return 0;
=20
 	if (new_fb->format !=3D sdev->format) {
--=20
2.43.0

