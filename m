Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C21DB94BCFA
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 14:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4187610E703;
	Thu,  8 Aug 2024 12:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="josGdWAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2106.outbound.protection.outlook.com [40.92.102.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9058510E6F7
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 12:09:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LK1Ee+mWv2GxyaB6mwFQU54L/Gv88ZP1I0Cc+fwWoxsRdQ57/yKSVXBhRWnu1Dlt2iawWnXc9vUs+TFO+uLNj5fjOQ7c561W2T3zKieBSQipbfUD3hIfDdUb78zgcyJDHzcqh2DtM5A+Qm33iSTPfjrJCsr0nJOjzpRUwXYVVarVaAzGN8ETl9xBnyIYGjtWDKqSEDFIedqc10Eo8kawG+7YMQK/65wH6Ys+XybEPIvaj7HfRjoluMRCHpG9fnjHgA17J+/1AGKIHkuIKMlAn8888usyK6juC1qThvdEvoRwBQ1z3l9zJ+kwIYqlZ/Jf9K5UeS5/nJwdtnqwpVMNXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbtXp3cnpQpbYNXYGShy2lxXGof4j5KkulzUYghWbSI=;
 b=dAuNqWXFVl7EPcdWYiFBIR1fDwa8dbil8aw7IKtC3TTcxFOUVlKDthLyo0eq3C4VjIXw22p1rDT15AzUIKHSfqade1cF7Pse5EIK8CO1wkWT+/8sBqxruXBjAt+g2RK5IskfDeVVDA0ICbKsSPjEvt+npY85v9WMNNrL7JaDX5+jtVZ2FQJWWZiiooLx0V9cTj2eaZ/6lUGhUFxcf5+whk9PYTpVb/dJF1pP6zQ8GzF1JmhPdJA2fyrnduOCzgTCRNDyeyAn/ZhAo12j/1IGUQroSFTPWTyFA/5BSnQ6LBSLIA41xBIX/7GLJRtnAKrsw4TMQ9CZVk9XTEZxcPl/Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbtXp3cnpQpbYNXYGShy2lxXGof4j5KkulzUYghWbSI=;
 b=josGdWAy9ICYh7zH8d6RhQbRrzn4wY17xC9apMT+njbVEnReqDlF3n4/qAHubEIi3taBZmC/a1KFI+b8fPX1XY6HNWDxlb2Uc5kEBaR2JcNRxyDik37ZnHv4NpXbg+jqI1VvdUyGC0clsGtPWy6+tKxPILm3ezhiUZdT/cv/B6qeFZ+bOG19gZy9mnGyUbkryo5RNyqIfQU34xdZv6CD9y2Yc+mHw3of/mmb2A+ZTkWV1HrGHIN62ewWNj5EFNkOjSArDS5HlNGzQJzgJV0IijqhXrksXI/HsM1puI8Rk8YoFol/vmbFlU+Z39UvW2c/o6Xj8T2DjfsZnydtlxip/w==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN2P287MB0723.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:fe::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.13; Thu, 8 Aug 2024 12:09:42 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 12:09:42 +0000
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
Subject: [PATCH RESEND v2 4/9] HID: multitouch: support getting the tip state
 from HID_DG_TOUCH fields 
Thread-Topic: [PATCH RESEND v2 4/9] HID: multitouch: support getting the tip
 state from HID_DG_TOUCH fields 
Thread-Index: AQHa6YvZBfM0fkvEq0WSGasDv2LTRQ==
Date: Thu, 8 Aug 2024 12:09:42 +0000
Message-ID: <8495C8A9-5B99-45A8-95CB-623682BF8982@live.com>
References: <752D8EEA-EE3B-4854-9B5E-F412AFA20048@live.com>
In-Reply-To: <752D8EEA-EE3B-4854-9B5E-F412AFA20048@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [PrMlMro3hKQmDV4s6o8FXUQDPyBCKyPtFZ1HHhXgtv1hZ5zHdroVD2s07llcxw4t]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN2P287MB0723:EE_
x-ms-office365-filtering-correlation-id: 505764c8-5f3e-443f-f2cb-08dcb7a2fc67
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|15080799003|8060799006|19110799003|102099032|3412199025|440099028;
x-microsoft-antispam-message-info: noS7ZKZ/xI+7pPG/RL+UUgygnnrmF+odQqqX5boOyxcyZM0CwAVeODtAPwSXdl4tho+hM17Tj5KRaOv1pU+Pn3t0yHT7/mHug6+9YfgzNTthF0Z48Jm3l2qNnDxIFCfK/C2QFph3IbgjPhAuQLV3Z+DLEeU4NFYxxAtiXN0gnGsm6cz04fCDKE6L5ONWpk7CjyG3KmLfI0DYENROjLyWPKgwMTr/E3GTpvfJubzhSxkCJrMJrqXkqWMsHcauBGVSzAPBbjTbZFtz1k/ovLpfUmxt9+quZK76xPtSX7D6TfdtfDD/UQxkbL6HDGAogGU9Fr27Q6jqK12X2mNDlccael00ODjBoTzLl6ulXv7MIHcTI4MZbMbKtb6PVx+Wi7NnJX/N1YmBcfZyvqAQGIHGguf1Q7yqNfUiCpV9d9CsNZjwk17ls2fv+j9LzknEqXkxSe+Fhao/tXzdpcKwBqkM7lfQVu2wbcfQ1txnKfbI+7Jc+OD1TmGhPRJkJAGhV2tANuUPT3Tj6m+eLDkNnLF98hNLKw8rEzT01gLbjsLHNVMQwciXph31M0C5rIn6disHJPaOz6x9oTRQm411AjD9O51MxXbTtvHw9VqQAdI9a/jg/YZLxGLXkWtwjBL6ZyqMWOdviEJ2F++2/6gUxgfVt40qUwLfFHNsuzkzN61Djl94XJrhUri9RgxYV9Fxoqcg
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ReV8GGuSSob3x5HTe4f++FkfTzZy9HrfHNO00Lb5swHNgrXu3MiB61i+KILx?=
 =?us-ascii?Q?hQQ2qllBiLU3LgwkYF8FMw6BcbnZUjJ2mzGQZwetQNx5+w+TNgrw6Z6oUcyv?=
 =?us-ascii?Q?sS4bXBaYUU41pcIGDAy0BUgaIkk7SAuD96Q1ZafF1La1F74HlW8mDrDBu89r?=
 =?us-ascii?Q?ATi22vkP7L4gvGgOhH68vCWuuIW71yoODToIs6zkIbPgOfqt7W6f/ylqdErz?=
 =?us-ascii?Q?6Ihh50VnLs7NCy4YT07qIFvXhnn5XJUcIbO3vuqmL8Todn7TwGOk6xFtJdn3?=
 =?us-ascii?Q?4btKNCceXOL3pLW2WbtVfzZLzKKu0sZfAYYNOwnRSfgkYBr+mGS8YYqTUuK/?=
 =?us-ascii?Q?sKuI3OLym+bL5HPDahJqKS80GrebckM7FH1V1Nf52jVWG3Kqpp/o21BgbQWK?=
 =?us-ascii?Q?3LRJEnGfG/UTS4kyGCnq9MR/6a4+g6wKtuKFy2zjzY7dsr9bFYACGB2AiNNY?=
 =?us-ascii?Q?aCBgKDW+Z4JzXMHyUrUnUOp0L6ikpuXRAbU3OA9TfNAYEeOLvkHdw6wvy3IZ?=
 =?us-ascii?Q?9RdmbVUkN3ks4EZQ8h86dVERlh8Qkfl5x3uEAENP7eIPPlL+zUQqZF0uVvwN?=
 =?us-ascii?Q?KdQcHb6JkiiT1CgFQjoUBuAFfZQ6FUwhIQLo7Eb5+DJ90DvLsJLOCAW7JW7E?=
 =?us-ascii?Q?HPqUV+6uT3/y4vRYtkuFv0+QfPkwXgX5aXSiSV3dLMIInqanasxMS3c9A6xE?=
 =?us-ascii?Q?8llZRySy+Jrtk2k6+KIExfBH2O7CpHohGxt0Oo56YXg0VBNce3/4OW2Reafx?=
 =?us-ascii?Q?oAls0cnIRXbRIsjmSKNibGDJMSLUG5LKtP6iNOG3BOCXs/XS0lnbuZYED+2l?=
 =?us-ascii?Q?wQCw3zBMtd3WBzTrGlqMOGKuXPt+p6RlT6gMpSmx+J1GMY6HHQM0W/gRcLs6?=
 =?us-ascii?Q?5NhZ4ejMpxF37BH/zvbjhjt/+MiVIzJ+GWfbFZdKsCPlTDRx2zEMzJKntHwx?=
 =?us-ascii?Q?NEBtAHK6P3n7e8T4fG/MEubUXJGOuvcfdwCD7jVs/+I47Yi9FtxeuwFJPFCw?=
 =?us-ascii?Q?8tJQnk+yPlo7TORZ2YlHeEwYukeIxD8qxko0GpxZavwxavYD8ksNKxNOxjcn?=
 =?us-ascii?Q?9LX6oOJFGl8UOuXNN9upVI9nv/MY+I653SYbs/0Sn0pvKR9W0h7uVrpZbktG?=
 =?us-ascii?Q?9PIdPTj+CTYpSGW5lwM/U1kjFPkpkdqysoxYeoOwQQXGLs7RB60heAn4FY+k?=
 =?us-ascii?Q?KGtJTHgrheaLMlo+wk90pNqQLnSsJoafSZSLUkE+NMNxjbIpd/UHy2BLoO7x?=
 =?us-ascii?Q?oAuJIZFLkenQ8zA3lBSFEn9DcMfwd7vHX0/dNdG/QowlG+ajxbjRTvBGic9i?=
 =?us-ascii?Q?4yScCCMo+mlS001EsmhJaiuE?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <90666BC1D9A8D24FA162A5B3F4554219@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 505764c8-5f3e-443f-f2cb-08dcb7a2fc67
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 12:09:42.7005 (UTC)
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

This is necessary on Apple Touch Bars, where the tip state is contained
in fields with the HID_DG_TOUCH usage. This feature is gated by a quirk
in order to prevent breaking other devices, see commit c2ef8f21ea8f
("HID: multitouch: add support for trackpads").

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 3e92789ed..571435da5 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -72,6 +72,7 @@ MODULE_LICENSE("GPL");
 #define MT_QUIRK_FORCE_MULTI_INPUT	BIT(20)
 #define MT_QUIRK_DISABLE_WAKEUP		BIT(21)
 #define MT_QUIRK_ORIENTATION_INVERT	BIT(22)
+#define MT_QUIRK_TOUCH_IS_TIPSTATE	BIT(23)
=20
 #define MT_INPUTMODE_TOUCHSCREEN	0x02
 #define MT_INPUTMODE_TOUCHPAD		0x03
@@ -809,6 +810,15 @@ static int mt_touch_input_mapping(struct hid_device *h=
dev, struct hid_input *hi,
=20
 			MT_STORE_FIELD(confidence_state);
 			return 1;
+		case HID_DG_TOUCH:
+			/*
+			 * Legacy devices use TIPSWITCH and not TOUCH.
+			 * Let's just ignore this field unless the quirk is set.
+			 */
+			if (!(cls->quirks & MT_QUIRK_TOUCH_IS_TIPSTATE))
+				return -1;
+
+			fallthrough;
 		case HID_DG_TIPSWITCH:
 			if (field->application !=3D HID_GD_SYSTEM_MULTIAXIS)
 				input_set_capability(hi->input,
@@ -872,10 +882,6 @@ static int mt_touch_input_mapping(struct hid_device *h=
dev, struct hid_input *hi,
 		case HID_DG_CONTACTMAX:
 			/* contact max are global to the report */
 			return -1;
-		case HID_DG_TOUCH:
-			/* Legacy devices use TIPSWITCH and not TOUCH.
-			 * Let's just ignore this field. */
-			return -1;
 		}
 		/* let hid-input decide for the others */
 		return 0;
--=20
2.39.3 (Apple Git-146)

