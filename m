Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9414671E6
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 07:31:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9328732CD;
	Fri,  3 Dec 2021 06:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2135.outbound.protection.outlook.com [40.107.255.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36FB732CD
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 06:31:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRPYnKXsjyldFuxRMwBT17oH9tNwt/5hp3sJT2htAYCbai9DoNdp/2UAZ/DNI7MRFIL77FET/xEsyK2bUcOcPbqgi0Ck3zy9S5D95ngN3OJTL4KbKskBYKKU0HnrRJs3ro1Hz9WVzYLDo/7SbnOfjqYbin1qns2R33Gp81t4MyutIWTl+21iPuKrObRJFyYFl5YFcQpljPqqVrpXCg88d6bHbAkuzJJ3QEPeVsiahRXS9A+6cejdefDnJgLvPjyvUpApNZkaJ6LmclsNrgnXfNCo4CcgDcHenFCKY2ZHg2Rds3hF4FeLDfV3LKpki5+jMyLzLB1BnAts+1hieJn/IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHt+s3ZQkxdzGs4CQeOLRC/9MOo5Dyv4ltCWWRu2aUQ=;
 b=GnnCvNzsWAtiJB+MQT/mUQrKIlEZODbUhd4BZhNcKxqVFmTOYrxg6lT9QAOMpYaqVNp+UCPI++qWsOLlk7DZ0bbjUS2eocqBHpk8gYosFiM5eA6tL4DtUjzm5C1ICUfnKgxImn7WiyyOg2Er/VK8UFwcH8iEVmW50vFIrURkABfPyLy+r6TD7GBTo1/ezMddVZUIiZLadQ29kLATt4Z5KRMvqJHfSQOZY3TsyjMA8E4AJlHEJyC2gSgFaQ68rt1g4g9DNMVl8qrb0bOlSiPK2rwesBc+Z8Sh/IDh9EiUR8oo3M1vXjjGAeUi+/6QVnMMoiOaL9z18U9joaknUbH5cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHt+s3ZQkxdzGs4CQeOLRC/9MOo5Dyv4ltCWWRu2aUQ=;
 b=Ph2lzXXH/KXnq8SQNWlLEMw0KXOkJCt/l0lGVUn4odAZydskm0cz+gwp2/QasNZm7weqmVeElSgDa+ezpdoX4vc5Z1Ew01Ip8fW3xcAytfNrMtQUFND+YCsqMXf+cmFEg01EEY+O92EvhDg96xvJOYZ11ccYQXqRdOWWSG7E5pg1aPeHvyMKN/WKDttOjDMeLUrmExL760/2+BswDHDpBADmq4/W+fMTCz/pz/d/x40ft/ezkqQVcEM+LDBYNga3QNtiIMxv1xFPeD54+Wvlo1GR3OfNdoYjA7X8wKI3uGH9bNjlHwyHAko3g8EvIpWXUBau76YSxkkKSgQtbAtpvw==
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com (2603:1096:202:34::18)
 by HK2PR0601MB1873.apcprd06.prod.outlook.com (2603:1096:202:b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 06:31:29 +0000
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::21d4:1030:2fd9:2788]) by HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::21d4:1030:2fd9:2788%5]) with mapi id 15.20.4734.027; Fri, 3 Dec 2021
 06:31:29 +0000
From: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/ast: Create the driver for ASPEED proprietory
 Display-Port
Thread-Topic: [PATCH] drm/ast: Create the driver for ASPEED proprietory
 Display-Port
Thread-Index: AQHX34zOb7hL7SsUWEGImgVrxVJrzawgXi6g
Date: Fri, 3 Dec 2021 06:31:28 +0000
Message-ID: <HK2PR06MB330096310C9AD2C827193E258C6A9@HK2PR06MB3300.apcprd06.prod.outlook.com>
References: <20211122103617.3496-1-kuohsiang_chou@aspeedtech.com>
In-Reply-To: <20211122103617.3496-1-kuohsiang_chou@aspeedtech.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d982f705-5187-4ad0-b327-08d9b6268a20
x-ms-traffictypediagnostic: HK2PR0601MB1873:
x-microsoft-antispam-prvs: <HK2PR0601MB1873397DF1B137EAA844B11A8C6A9@HK2PR0601MB1873.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 90YbZiyyVDAYj2cfEyPUgFXdWbkk5U5qecEZkzyAOHfkb8rk6M2QSqc8jwDsF74oZQ0b7nWF/w20o++1ZJXOGEKMHIVYAcpf251bYMXPIWUqs0JyRqSR/ABRPptpi0B4or0txUqV1Y/LK3ilNMjCgoQ6+ETfDu3JpUBTOrAfNR4FWjilr0U+uKyXLITCiLRWYzSryIVeMYG9CZqCM1Zm8EYj0pZp8/2KlxRVhFC4psd5pCU+dBfA1wcek+MayQYo/4EvXuZxwzfB+G476TkuWuRraGiLIdeGcH13ek7tWqDJNO+PyCggFoistpVrEWik8L2EwTKYMwB5Y3Z4Li7uZgwyRLKmII6K1IGmxC1vs8M86jmwZjSLj2RIp+3QS8uzUHEu3kh/xQGZkJX/aUgdoUl5/oPS3QcAl7gBepJ5wfRP2yiQDTPagqDFgrx0x2Rpq1PfPnc7bVwk9utAPXld+Vd5jsASan/8TLYsd8/qQ/PrgTUHsiKd711zSMyXaRVSl/EeNOCbkhd4iygxYiEZKfTt4/lkETDMozV/434uUh/UdHfVUjPLiZfbUyyc7iGdvl6WLU2V+GTk7WzQg87HdZamOGoBkP7NxukoL/8odCKL8pyNiojZ/0AmbNClOOVZcLEUsGyPhI64XM5ikDvfKFxKirrvek8nay5hm2d/veFv7/KO8mRMimysztEsvy8C+sQ46My9Ozo4Oe4ODznzuw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3300.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(366004)(346002)(376002)(136003)(396003)(107886003)(52536014)(54906003)(66946007)(8676002)(86362001)(6506007)(66476007)(5660300002)(33656002)(30864003)(110136005)(76116006)(186003)(2906002)(508600001)(66446008)(38070700005)(8936002)(55016003)(64756008)(316002)(7696005)(38100700002)(26005)(4326008)(71200400001)(83380400001)(122000001)(53546011)(9686003)(66556008)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7RvA9wlYowNuZpHFM5eUh6Woy3yVcRfbxr+JuX2d7xBKCybH63iED6hUu+hc?=
 =?us-ascii?Q?WaLKW+OTG7lC6cNCXrGR2VQpphGhhOAml+IbPVQnq3OacL5ulFozy9vstpjw?=
 =?us-ascii?Q?+YUv41AH9KrBaknfZ8r9HBfruuoBIIdXxNaQ52gOMAiCTnjR/x9YK+8mk2vL?=
 =?us-ascii?Q?c3pkDqBt02F9e7WqI0e+9abg+hxCwqegrV4fcTTfjNiIyNHjaaQjLpr6DXTU?=
 =?us-ascii?Q?apmqa5r1xhCyGLjXK7irQcD74mo2EsuFg6WmvLq1YzvYZL2N3MHfQxaAS9BF?=
 =?us-ascii?Q?lR5DngiItAmS8u2hhhS0CBUhzYWasBk03P71G7P/aD8lgYtKc4Dc7PIC3u3z?=
 =?us-ascii?Q?fIkFq4NEOoMP2QksvxuMD2i4x7896jpHZhEgNOL0loLTMZac2QR4xHsIHARX?=
 =?us-ascii?Q?OLvfCT0wFgv86v+rIDMWaCEb5JFpOVojwFSHq/CFCGnBqu1UcxoeJLB1daeD?=
 =?us-ascii?Q?S4PsIuZfdEpYl3IkyGyAdMMTyf2HKEpSz9zclsVeWd0zV4erXrb7+bKezPN4?=
 =?us-ascii?Q?w8sOkqmANPJaDKFF+XQW2yjjVAh3DWOLNXOH9BGwl2i8NknzB2s/0lizBFs/?=
 =?us-ascii?Q?DUGgM4ZOsVpePLgD4RfShmlDVf16JT5NFQ8PA8WBsiTyG7YxDyHjWm74EEDG?=
 =?us-ascii?Q?8paYU7nb8AbQQeelra0oHNbUhLH1EGNI2xOg6VJ6gDX6VpDllz4JFBGZ1Ndl?=
 =?us-ascii?Q?Iw5DTtzCQO5e+08m/gAJjuXf737UGbgbUV9/XwhPD8rV33+Fs30jdAigk8jH?=
 =?us-ascii?Q?Ey0xobpf27c7Q44RxIy3ut60RBX0Vrw8RQidHRqeVi/RoqGwQupthkBItlhO?=
 =?us-ascii?Q?aSzg/YswhzU9bhAgynlOfdumNbbpRNEjZXwL7YN1w5L7OOayOl4SJF11rznd?=
 =?us-ascii?Q?OhzbJjjSUxDChH1+lT6c85z+KIupfDm1+50ZgfLdxEFN0bTaoXU/O52Y3149?=
 =?us-ascii?Q?zaR/6M4UdLctNQpY13g2+utgebo4/dwXpyd7kjPP2NpEWHXrffnQHwtUaUm+?=
 =?us-ascii?Q?YAJv+88ilyqYd2Nr/v221EiS+H/HkZriG27zHH9pVgDc3yiBxumYB4Ei8HGI?=
 =?us-ascii?Q?Br7PnM+w54AwF8rG2IsDKaImFpTYGS9IAQRWXM/4MowOQOP0hB7LqpdfOidd?=
 =?us-ascii?Q?D1Wgh1ABcdPz9mTYnofF0PphlEW1X35hasHbo62lUnBc7ld07kYWjTihoSa4?=
 =?us-ascii?Q?bhRK15dpcY7v2osgeZXNwzuVNnotE8VourC/OBc44jK1fG8//+my3GObvVr5?=
 =?us-ascii?Q?qRZ/Jt0n4wRNxoPOlkJmQwbGYeLUbE57CcrNLGn7ckMigi1JPdEi8pTjVUjm?=
 =?us-ascii?Q?zX4C8r4EW+uMg09clTW7CLI8BXqfpxAgLB+XT87yfOLKXfLoFcP55qSWQ2U1?=
 =?us-ascii?Q?x8JRtfTusOYt/3guAAw0uFguOxCQEBQ8epSdV+xRt0oN2j00AraKZH7lAOeD?=
 =?us-ascii?Q?RO64Zp5QA94Ya+QisuxUiEeH5TYuySs1kYN0kBkwmj7iYGoLx7MYNhYjihpd?=
 =?us-ascii?Q?JxynQ5fAsmFkdkcGreamwn/WH78iYMIHI/p1zCF/YAVsmqsbFpXdewgA9aqQ?=
 =?us-ascii?Q?aH4z9oByu8IqIko7FKU9APo730FvWTPNMkiLilt42ykfwxx16e8ZxbB0GxUy?=
 =?us-ascii?Q?7ze0BnpN2T7F2GkKmLIC/uvI+Jjspwdt+vo2gbXC/4kcot5xoIImueci4fqz?=
 =?us-ascii?Q?ABCpVg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3300.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d982f705-5187-4ad0-b327-08d9b6268a20
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2021 06:31:28.9218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3WNyrAC8fs/hu/uaLnI87GoWaagw7MzYtxWV2263XwLthPZsjMaKor63emIOvi1DO7/mvAxaftgRsRWJDRjZgq5SiaZydD3qEd9krigSoTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0601MB1873
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
Cc: Hungju Huang <hungju_huang@aspeedtech.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 Brandon Chen <brandon_chen@aspeedtech.com>,
 Tommy Huang <tommy_huang@aspeedtech.com>,
 Jenmin Yuan <jenmin_yuan@aspeedtech.com>,
 "airlied@redhat.com" <airlied@redhat.com>, Arc Sung <arc_sung@aspeedtech.com>,
 Luke Chen <luke_chen@aspeedtech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Hi Tomas,
Good day!=20
May I get the review status, or is there anything I can do to improve it? T=
hanks!

Best Regards,
	Kuo-Hsiang Chou

-----Original Message-----
From: Kuo-Hsiang Chou=20
Sent: Monday, November 22, 2021 6:36 PM
To: tzimmermann@suse.de; dri-devel@lists.freedesktop.org; linux-kernel@vger=
.kernel.org
Subject: [PATCH] drm/ast: Create the driver for ASPEED proprietory Display-=
Port

1. The MCU FW controling ASPEED DP is loaded by BMC boot loader.
2. Driver starts after CR[3:1] =3D=3D 111b that indicates Tx is ASTDP,
   and CRD1[5] has been asserted by BMVC boot loader.
3. EDID is prioritized by DP monitor.
4. DP's EDID has high priority to decide resolution supporting.

Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
---
 drivers/gpu/drm/ast/Makefile   |   2 +-
 drivers/gpu/drm/ast/ast_dp.c   | 286 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_drv.h  |  13 ++
 drivers/gpu/drm/ast/ast_main.c |   7 +-
 drivers/gpu/drm/ast/ast_mode.c |  50 +++++-
 drivers/gpu/drm/ast/ast_post.c |   4 +-
 6 files changed, 353 insertions(+), 9 deletions(-)  create mode 100644 dri=
vers/gpu/drm/ast/ast_dp.c

diff --git a/drivers/gpu/drm/ast/Makefile b/drivers/gpu/drm/ast/Makefile in=
dex 438a2d05b..9bd0756e0 100644
--- a/drivers/gpu/drm/ast/Makefile
+++ b/drivers/gpu/drm/ast/Makefile
@@ -3,6 +3,6 @@
 # Makefile for the drm device driver.  This driver provides support for th=
e  # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
=20
-ast-y :=3D ast_drv.o ast_main.o ast_mm.o ast_mode.o ast_post.o ast_dp501.o
+ast-y :=3D ast_drv.o ast_main.o ast_mm.o ast_mode.o ast_post.o=20
+ast_dp501.o ast_dp.o
=20
 obj-$(CONFIG_DRM_AST) :=3D ast.o
diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c ne=
w file mode 100644 index 000000000..537eaf4fa
--- /dev/null
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -0,0 +1,286 @@
+/*
+ * Copyright 2012 Red Hat Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person=20
+obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject=20
+to
+ * the following conditions:
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,=20
+EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF=20
+MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT=20
+SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR=20
+ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT=20
+OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE=20
+OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial=20
+portions
+ * of the Software.
+ *
+ */
+/*
+ * Authors: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>  */
+
+#include <linux/firmware.h>
+#include <linux/delay.h>
+#include <drm/drm_print.h>
+#include "ast_drv.h"
+
+bool ast_dp_read_edid(struct drm_device *dev, u8 *ediddata) {
+	struct ast_private *ast =3D to_ast_private(dev);
+	u8 i =3D 0, j =3D 0;
+
+#ifdef DPControlPower
+	u8 bDPState_Change =3D false;
+
+	// Check DP power off or not.
+	if (ast->ASTDP_State & 0x10) {
+		// DP power on
+		ast_dp_PowerOnOff(dev, 1);
+		bDPState_Change =3D true;
+	}
+#endif
+
+	/*
+	 * CRD1[b5]: DP MCU FW is executing
+	 * CRDC[b0]: DP link success
+	 * CRDF[b0]: DP HPD
+	 * CRE5[b0]: Host reading EDID process is done
+	 */
+	if (!(ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, 0x20) &&
+		ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDC, 0x01) &&
+		ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDF, 0x01) &&
+		ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE5, 0x01))) { #ifdef=20
+DPControlPower
+		// Set back power off
+		if (bDPState_Change)
+			ast_dp_PowerOnOff(dev, 0);
+#endif
+		return false;
+	}
+
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE5, 0x00, 0x00);
+
+	for (i =3D 0; i < 32; i++) {
+		/*
+		 * CRE4[7:0]: Read-Pointer for EDID (Unit: 4bytes); valid range: 0~64
+		 */
+		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE4, 0x00, (u8) i);
+		j =3D 0;
+
+		/*
+		 * CRD7[b0]: valid flag for EDID
+		 * CRD6[b0]: mirror read pointer for EDID
+		 */
+		while ((ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD7, 0x01) !=3D 0=
x01) ||
+			(ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD6, 0xFF) !=3D i)) {
+			mdelay(j+1);
+
+			if (!(ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, 0x20) &&
+				ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDC, 0x01) &&
+				ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDF, 0x01))) {
+				ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE5, 0x00, 0x01);
+				return false;
+			}
+
+			j++;
+			if (j > 200) {
+				ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE5, 0x00, 0x01);
+				return false;
+			}
+		}
+
+		*(ediddata) =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD8, 0xFF=
);
+		*(ediddata + 1) =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD9, =
0xFF);
+		*(ediddata + 2) =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDA, =
0xFF);
+		*(ediddata + 3) =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDB,=
=20
+0xFF);
+
+		if (i =3D=3D 31) {
+			*(ediddata + 3) =3D *(ediddata + 3) + *(ediddata + 2);
+			*(ediddata + 2) =3D 0;
+		}
+
+		ediddata +=3D 4;
+	}
+
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE5, 0x00, 0x01);
+
+#ifdef DPControlPower
+	// Set back power off
+	if (bDPState_Change)
+		ast_dp_PowerOnOff(dev, 0);
+#endif
+
+	return true;
+}
+
+/*
+ * Launch Aspeed DP
+ */
+bool ast_dp_launch(struct drm_device *dev, u8 bPower) {
+	u32 i =3D 0, j =3D 0, WaitCount =3D 1;
+	u8 bDPTX =3D 0;
+	u8 bDPExecute =3D 1;
+
+	struct ast_private *ast =3D to_ast_private(dev);
+	// S3 come back, need more time to wait BMC ready.
+	if (bPower)
+		WaitCount =3D 300;
+
+	// Fill
+	ast->tx_chip_type =3D AST_TX_NONE;
+
+	// Wait total count by different condition.
+	// This is a temp solution for DP check
+	for (j =3D 0; j < WaitCount; j++) {
+		bDPTX =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, 0x0E);
+
+		if (bDPTX)
+			break;
+
+		msleep(100);
+	}
+
+	// 0xE : ASTDP with DPMCU FW handling
+	if (bDPTX =3D=3D 0x0E) {
+		// Wait one second then timeout.
+		i =3D 0;
+
+		while (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, 0x20) !=3D 0x=
20) {
+			i++;
+			// wait 100 ms
+			msleep(100);
+
+			if (i >=3D 10) {
+				// DP would not be ready.
+				bDPExecute =3D 0;
+				break;
+			}
+		};
+
+		if (bDPExecute)
+			ast->tx_chip_type =3D AST_TX_ASTDP;
+	}
+
+	return true;
+}
+
+#ifdef DPControlPower
+
+void ast_dp_PowerOnOff(struct drm_device *dev, u8 Mode) {
+	struct ast_private *ast =3D to_ast_private(dev);
+	// Read and Turn off DP PHY sleep
+	u8 bE3 =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE3, 0x0F);
+
+	// Turn on DP PHY sleep
+	if (!Mode)
+		bE3 |=3D 0x10;
+
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE3, 0x00, bE3); // DP=20
+Power on/off
+
+	// Save ASTDP power state
+	ast->ASTDP_State =3D bE3;
+}
+
+#endif
+
+void ast_dp_SetOnOff(struct drm_device *dev, u8 Mode) {
+	struct ast_private *ast =3D to_ast_private(dev);
+
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE3, 0x00, Mode); //=20
+video on/off
+
+	// Save ASTDP power state
+	ast->ASTDP_State =3D Mode;
+
+    // If DP plug in and link successful then check video on / off status
+	if (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDC, 0x01) &&
+		ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDF, 0x01)) {
+		Mode <<=3D 4;
+		while (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDF, 0x10) !=3D Mo=
de) {
+			// wait 1 ms
+			mdelay(1);
+		}
+	}
+}
+
+void ast_dp_SetOutput(struct drm_crtc *crtc, struct ast_vbios_mode_info=20
+*vbios_mode) {
+	struct ast_private *ast =3D to_ast_private(crtc->dev);
+
+	u32 ulRefreshRateIndex;
+	u8 ModeIdx;
+
+	ulRefreshRateIndex =3D vbios_mode->enh_table->refresh_rate_index - 1;
+
+	switch (crtc->mode.crtc_hdisplay) {
+	case 320:
+		ModeIdx =3D 0x11;
+		break;
+	case 400:
+		ModeIdx =3D 0x12;
+		break;
+	case 512:
+		ModeIdx =3D 0x13;
+		break;
+	case 640:
+		ModeIdx =3D (0x00 + (u8) ulRefreshRateIndex);
+		break;
+	case 800:
+		ModeIdx =3D (0x04 + (u8) ulRefreshRateIndex);
+		break;
+	case 1024:
+		ModeIdx =3D (0x09 + (u8) ulRefreshRateIndex);
+		break;
+	case 1152:
+		ModeIdx =3D 0x1F;
+		break;
+	case 1280:
+		if (crtc->mode.crtc_vdisplay =3D=3D 800)
+			ModeIdx =3D (0x17 - (u8) ulRefreshRateIndex);	// For RB/Non-RB
+		else		// 1024
+			ModeIdx =3D (0x0D + (u8) ulRefreshRateIndex);
+		break;
+	case 1360:
+	case 1366:
+		ModeIdx =3D 0x1E;
+		break;
+	case 1440:
+		ModeIdx =3D (0x19 - (u8) ulRefreshRateIndex);	// For RB/Non-RB
+		break;
+	case 1600:
+		if (crtc->mode.crtc_vdisplay =3D=3D 900)
+			ModeIdx =3D (0x1D - (u8) ulRefreshRateIndex);	// For RB/Non-RB
+		else		//1200
+			ModeIdx =3D 0x10;
+		break;
+	case 1680:
+		ModeIdx =3D (0x1B - (u8) ulRefreshRateIndex);	// For RB/Non-RB
+		break;
+	case 1920:
+		if (crtc->mode.crtc_vdisplay =3D=3D 1080)
+			ModeIdx =3D 0x15;
+		else		//1200
+			ModeIdx =3D 0x14;
+		break;
+	default:
+		return;
+	}
+
+	/*
+	 * CRE0[7:0]: MISC0 ((0x00: 18-bpp) or (0x20: 24-bpp)
+	 * CRE1[7:0]: MISC1 (default: 0x00)
+	 * CRE2[7:0]: video format index (0x00 ~ 0x20 or 0x40 ~ 0x50)
+	 */
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE0, 0x00, 0x20);
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE1, 0x00, 0x00);
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE2, 0x00, ModeIdx); }
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h =
index 2cfce7dc9..e56d5d57b 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -71,6 +71,7 @@ enum ast_tx_chip {
 	AST_TX_SIL164,
 	AST_TX_ITE66121,
 	AST_TX_DP501,
+	AST_TX_ASTDP,
 };
=20
 #define AST_DRAM_512Mx16 0
@@ -175,6 +176,9 @@ struct ast_private {
 	u8 dp501_maxclk;
 	u8 *dp501_fw_addr;
 	const struct firmware *dp501_fw;	/* dp501 fw */
+
+    // ASTDP
+	u8 ASTDP_State;
 };
=20
 static inline struct ast_private *to_ast_private(struct drm_device *dev) @=
@ -356,5 +360,14 @@ bool ast_backup_fw(struct drm_device *dev, u8 *addr, u3=
2 size);  bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata);
 u8 ast_get_dp501_max_clk(struct drm_device *dev);  void ast_init_3rdtx(str=
uct drm_device *dev);
+/* aspeed DP */
+#define DPControlPower
+bool ast_dp_read_edid(struct drm_device *dev, u8 *ediddata); bool=20
+ast_dp_launch(struct drm_device *dev, u8 bPower); #ifdef DPControlPower=20
+void ast_dp_PowerOnOff(struct drm_device *dev, u8 Mode); #endif void=20
+ast_dp_SetOnOff(struct drm_device *dev, u8 Mode); void=20
+ast_dp_SetOutput(struct drm_crtc *crtc, struct ast_vbios_mode_info=20
+*vbios_mode);
=20
 #endif
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.=
c index 79a361867..de5d69888 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -212,7 +212,7 @@ static int ast_detect_chip(struct drm_device *dev, bool=
 *need_post)
 		}
 		break;
 	}
-
+	ast->support_wide_screen =3D true;
 	/* Check 3rd Tx option (digital output afaik) */
 	ast->tx_chip_type =3D AST_TX_NONE;
=20
@@ -230,7 +230,7 @@ static int ast_detect_chip(struct drm_device *dev, bool=
 *need_post)
 			ast->tx_chip_type =3D AST_TX_SIL164;
 	}
=20
-	if ((ast->chip =3D=3D AST2300) || (ast->chip =3D=3D AST2400)) {
+	if ((ast->chip =3D=3D AST2300) || (ast->chip =3D=3D AST2400) || (ast->chi=
p =3D=3D=20
+AST2500)) {
 		/*
 		 * On AST2300 and 2400, look the configuration set by the SoC in
 		 * the SOC scratch register #1 bits 11:8 (interestingly marked @@ -254,7=
 +254,8 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_po=
st)
 		case 0x0c:
 			ast->tx_chip_type =3D AST_TX_DP501;
 		}
-	}
+	} else if (ast->chip =3D=3D AST2600)
+		ast_dp_launch(&ast->base, 0);
=20
 	/* Print stuff for diagnostic purposes */
 	switch(ast->tx_chip_type) {
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.=
c index 6bfaefa01..d7347d510 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -987,20 +987,44 @@ static int ast_cursor_plane_init(struct ast_private *=
ast)  static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)  {
 	struct ast_private *ast =3D to_ast_private(crtc->dev);
+	u8 ch =3D 0x03;
=20
 	/* TODO: Maybe control display signal generation with
 	 *       Sync Enable (bit CR17.7).
 	 */
 	switch (mode) {
 	case DRM_MODE_DPMS_ON:
-	case DRM_MODE_DPMS_STANDBY:
-	case DRM_MODE_DPMS_SUSPEND:
+		ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT,  0x01, 0xdf, 0);
+		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb6, 0xfc, 0);
 		if (ast->tx_chip_type =3D=3D AST_TX_DP501)
 			ast_set_dp501_video_output(crtc->dev, 1);
+
+		if (ast->tx_chip_type =3D=3D AST_TX_ASTDP) { #ifdef DPControlPower
+			ast_dp_PowerOnOff(crtc->dev, 1);
+#endif
+			ast_wait_for_vretrace(ast);
+			ast_dp_SetOnOff(crtc->dev, 1);
+		}
+
+		ast_crtc_load_lut(ast, crtc);
 		break;
+	case DRM_MODE_DPMS_STANDBY:
+	case DRM_MODE_DPMS_SUSPEND:
 	case DRM_MODE_DPMS_OFF:
+		ch =3D mode;
 		if (ast->tx_chip_type =3D=3D AST_TX_DP501)
 			ast_set_dp501_video_output(crtc->dev, 0);
+
+		if (ast->tx_chip_type =3D=3D AST_TX_ASTDP) {
+			ast_dp_SetOnOff(crtc->dev, 0);
+#ifdef DPControlPower
+			ast_dp_PowerOnOff(crtc->dev, 0);
+#endif
+		}
+
+		ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT,  0x01, 0xdf, 0x20);
+		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb6, 0xfc, ch);
 		break;
 	}
 }
@@ -1044,6 +1068,8 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 	struct ast_private *ast =3D to_ast_private(crtc->dev);
 	struct ast_crtc_state *ast_crtc_state =3D to_ast_crtc_state(crtc_state);
 	struct ast_crtc_state *old_ast_crtc_state =3D to_ast_crtc_state(old_crtc_=
state);
+struct ast_vbios_mode_info *vbios_mode_info =3D
+		&ast_crtc_state->vbios_mode_info;
=20
 	/*
 	 * The gamma LUT has to be reloaded after changing the primary @@ -1051,6=
 +1077,10 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 	 */
 	if (old_ast_crtc_state->format !=3D ast_crtc_state->format)
 		ast_crtc_load_lut(ast, crtc);
+
+	//Set Aspeed Display-Port
+	if (ast->tx_chip_type =3D=3D AST_TX_ASTDP)
+		ast_dp_SetOutput(crtc, vbios_mode_info);
 }
=20
 static void
@@ -1225,7 +1255,16 @@ static int ast_get_modes(struct drm_connector *conne=
ctor)
 			ast->dp501_maxclk =3D ast_get_dp501_max_clk(connector->dev);
 		else
 			kfree(edid);
+	} else if (ast->tx_chip_type =3D=3D AST_TX_ASTDP) {
+		edid =3D kmalloc(128, GFP_KERNEL);
+		if (!edid)
+			return -ENOMEM;
+
+		flags =3D ast_dp_read_edid(connector->dev, (u8 *)edid);
+		if (!flags)
+			kfree(edid);
 	}
+
 	if (!flags)
 		edid =3D drm_get_edid(connector, &ast_connector->i2c->adapter);
 	if (edid) {
@@ -1256,10 +1295,12 @@ static enum drm_mode_status ast_mode_valid(struct d=
rm_connector *connector,
 			return MODE_OK;
 		if ((mode->hdisplay =3D=3D 1600) && (mode->vdisplay =3D=3D 900))
 			return MODE_OK;
+		if ((mode->hdisplay =3D=3D 1152) && (mode->vdisplay =3D=3D 864))
+			return MODE_OK;
=20
 		if ((ast->chip =3D=3D AST2100) || (ast->chip =3D=3D AST2200) ||
 		    (ast->chip =3D=3D AST2300) || (ast->chip =3D=3D AST2400) ||
-		    (ast->chip =3D=3D AST2500)) {
+		    (ast->chip =3D=3D AST2500) || (ast->chip =3D=3D AST2600)) {
 			if ((mode->hdisplay =3D=3D 1920) && (mode->vdisplay =3D=3D 1080))
 				return MODE_OK;
=20
@@ -1400,7 +1441,8 @@ int ast_mode_config_init(struct ast_private *ast)
 	    ast->chip =3D=3D AST2200 ||
 	    ast->chip =3D=3D AST2300 ||
 	    ast->chip =3D=3D AST2400 ||
-	    ast->chip =3D=3D AST2500) {
+	    ast->chip =3D=3D AST2500 ||
+	    ast->chip =3D=3D AST2600) {
 		dev->mode_config.max_width =3D 1920;
 		dev->mode_config.max_height =3D 2048;
 	} else {
diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.=
c index b5d92f652..0aa9cf0fb 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -379,7 +379,9 @@ void ast_post_gpu(struct drm_device *dev)
 	ast_enable_mmio(dev);
 	ast_set_def_ext_reg(dev);
=20
-	if (ast->config_mode =3D=3D ast_use_p2a) {
+	if (ast->chip =3D=3D AST2600) {
+		ast_dp_launch(dev, 1);
+	} else if (ast->config_mode =3D=3D ast_use_p2a) {
 		if (ast->chip =3D=3D AST2500)
 			ast_post_chip_2500(dev);
 		else if (ast->chip =3D=3D AST2300 || ast->chip =3D=3D AST2400)
--
2.27.0

