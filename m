Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4B83914D3
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 12:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729A96EC60;
	Wed, 26 May 2021 10:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310132.outbound.protection.outlook.com [40.107.131.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778486EC60
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 10:24:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gl4/bXeGwNTm6DW/FmXAB5BnlLRfEcOqEoagEbP8Ljov1qI9gSy7WSTVzwpudBKiZZ9bmgdfkKBSEwY4dVM/MiOoRyZ52giK48IMaw77W/VCqeMcJz7zum5i6fLoqbyzhFP+xqZ0t8JuGZ2AFYOY2QsA8IqMkSPMsL/FLLG2lrMKX1U92QyTtEj/41EQBA6UFPFWQhNaEIz4XrNoEaXmEpqgWxdVKhzIrCefCxvlPUdjV6U0dPVu04AxY/9mJazXKmgfXc4buJLM4RYP1RwcNLfoBo8HtYe5sVKF8X0qUIW1zhrQFzWaf9wkYeKV0duB2khMkkPyfAWJ7mPWCey0Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UevbKLPN9+KzXIH9lc06lXpO4eg9faSajXTtiW5jJPQ=;
 b=T2VkHbB+fAxG05Qg+XCMd5taBlM3slPx8qjvsGJjYIxvx2r1POYoxJiaf3hN9bXuq+4Jg5uux16yf+i+BLTTPE9g53LyhwDlGcCX7Lu/Arv01csVGZh1ceIh9Y7oqPPySd5l8mS0cMLzy2iudyFMi2hC/WgOrYzzArDmNzHm6muwaMuNk3SV9DOKfQpKhiu1eY4BIcHjhks02ODXcmx4QS7XjiLzQd/CnoGjz27ghUtU71x18RqhIZJME6FsJRqGiDhfc5zRYTaHv+umkoFPmkd3WFvgbGKpfVlC2YN63xZvhkwyg/DdLxYKB31za3Ih9BFOqv7X0M1/EPtFAEpb5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UevbKLPN9+KzXIH9lc06lXpO4eg9faSajXTtiW5jJPQ=;
 b=2HQAj94BI2C3JVbmI2Ro6t1by5ees5MZ9TtQOXP6fMdCPr8K8PTAxCk0RKnffxE15aGQLHqtC9pIHXdNb6HG/L2ctx6l+7SuM275Rmds46YMA3N6cnvpnsWszjn9d6evxJ+THdAJ77WiXWB0H1lbnjvRhd7Ke17AfcGtIkK6q+x8QdlygBJVDSeatJPYfDgVMrzdJnGc03c0lg5Q1DSiaP4NcF+PZDyxUuMf87pqUFF9g2N3Ir6Tkm2qv2x1nTw1IyAyO7HjhOUrmFKqUlobKx773f/nt1grb1VuA96cwT08FNFQsXCH+RzWa9SayKjM6zb53U1eCVzPB+2k4AWqCw==
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com (2603:1096:202:34::18)
 by HK0PR06MB2979.apcprd06.prod.outlook.com (2603:1096:203:8a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Wed, 26 May
 2021 10:24:07 +0000
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::e862:43c6:7ea0:679]) by HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::e862:43c6:7ea0:679%5]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 10:24:06 +0000
From: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4] drm/ast: Disable fast reset after DRAM initial
Thread-Topic: [PATCH v4] drm/ast: Disable fast reset after DRAM initial
Thread-Index: AQHXQyMsjwUdIFIvXU2rGyYFr6xp2ar1jDMg
Date: Wed, 26 May 2021 10:24:06 +0000
Message-ID: <HK2PR06MB33004A57DA1F99AC77E8F2CD8C249@HK2PR06MB3300.apcprd06.prod.outlook.com>
References: <bbe8ccfd-7e73-e1e6-32a5-f08f71c4ed3f@suse.de>
 <20210507092708.39552-1-kuohsiang_chou@aspeedtech.com>
In-Reply-To: <20210507092708.39552-1-kuohsiang_chou@aspeedtech.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 680b6511-fb99-446c-b420-08d9203064b2
x-ms-traffictypediagnostic: HK0PR06MB2979:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB29790859DD3D890DD3FB1A0E8C249@HK0PR06MB2979.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jwVAIxj3JrCz5c9pZcgA7AtOs1r2fkkKcv8dKx7535Lzm90Ndsxr2BXyJyRqElE11Y3dppfcy+ACG0NxNHDZWExV+D6IaKcKZdsF9E4I3ibZNhckIeG6hhc/0Wr+o7TqqhWyqtEwkO2Frr9sGVNFo+kKtVgFHSOA9Piq0upmVVIzq8yiJXlpS2gk1nrWk+WWF2vhMNW6h7EwUHWVgOTYy74Q7eZ+LjljLkPaFf8x6ybeTMMcQc9rvIraXMAkf0TTpRdvWhN5x14BM+l85gIp4EisGGBNHEgJH3RH/D9lElGoFNNmeNh4Qaq+bd5MryYcoZX5S4TmrjUIgiAdqmPlZSXAUoGSRCt6nHZxt10GQXmt0lAHQX69Fw4/oGcbaycVcLAo5KAAF5q7CArPWP79QNVR1mq8wyoBNnK+Yk6Ny7K89aRHsIpqWkjsJKWJ5yV5Rn1qCWYCDRq3scSU2s9rL94oDC/84IU+bjcXkrgGs12xJCPksUXG5SL6no7FnLoPGPOhhK5Rtg6MrO8aWatUz5TRa/AvKryOlbOMeiUE/9VjauQFqDHiH9ZPU7Dze9omlXmbaCKMe2Zutbi/L0/XZzU5sDWli28JmhHbuuQ5TY4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3300.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(396003)(39830400003)(366004)(346002)(71200400001)(86362001)(8676002)(2906002)(8936002)(5660300002)(66476007)(66556008)(55236004)(52536014)(110136005)(64756008)(66446008)(7696005)(53546011)(33656002)(9686003)(66946007)(76116006)(4326008)(107886003)(55016002)(83380400001)(26005)(122000001)(316002)(478600001)(6506007)(54906003)(38100700002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?zq5h1vSM2bykV3TtHM5zcFCtlUW0uM1dMnNvjZEcSOZIaLn6vvGYpJjxk4qy?=
 =?us-ascii?Q?9t3Oj1o8SsKKzRvWKU6uVKBqhKTrbS44IIdsjZ0vLG18VLoluiqT/g9OSkTX?=
 =?us-ascii?Q?Gu06kxzvAE3wW0G0RuvPAN6GhdWm1tA1iZmUSqz5wRapYHOH9bEkbFbBpqZZ?=
 =?us-ascii?Q?gZTQbowxJTQ5G/CwXecY9aYovl6QzsgMexOMTl+epNRObbYWEugKDAmX3vb7?=
 =?us-ascii?Q?TX4o9ZQ9AM9FhWh917HQkHz0I8Yab3W2+B86utSMsp8dlJioBhLDTiJX6qFK?=
 =?us-ascii?Q?gn+Ct6494znPgcbDyN9u3X4zBxMlfVpzrUAgzmx89XYwMydS5Ck67ZwOdD+v?=
 =?us-ascii?Q?OgZdKQ3lS9Q3s3Z0BbrmTcLiUVYfzue+yHmE2xG6nHKN+3kFYSnX2yOQE4pp?=
 =?us-ascii?Q?k6atOSdP/plBYJoqbLV9/ag2S1gbAzLIlgaSaN7610WzcrnBuF/DRCS3PC6F?=
 =?us-ascii?Q?vGJYWJQZynacZdzTvYgoB3JCHjmJJ2+B1l5NJn9DNlBcgGQkNmMNi8/B+/eF?=
 =?us-ascii?Q?AWgKBfidVO9J7P1Q8VtdCBWv0WIlkVlEba1be11v+SBpfAgF6N7YngCr0Fsf?=
 =?us-ascii?Q?7SNKQU6jqf1Cf1bYNOPmef7cqkRYYeCqPjffIX4g8ldabB3A/0u1wwP1wDrm?=
 =?us-ascii?Q?xi/9z77psB+pnkSCpS1SB6OhowRRyVBYeYlFH0EMQa1q+VZ1Sz9P3kfZcXdN?=
 =?us-ascii?Q?ZqAVfguv4D6D4LyI7ne4gdysr671XeMgYy9lVRb8SdpFosqKHpDWtYjA4wRg?=
 =?us-ascii?Q?+NawhCyy1JUy8ceSKaq0br56Mz4hGWJh57qKS6dZE90s3v9Ko2WPTjF9OsEH?=
 =?us-ascii?Q?lFH5ou8Q3adeGGeqQQTWIT3zTDO1xcGr4YSlY7ZPeJm+jFiS1RPTFTO0B1KP?=
 =?us-ascii?Q?OvrKgm6thk2byh4wHTs6t6w/fWex0dtQD1AnoxwirAjPQP1IXyR0UPl4XZ/e?=
 =?us-ascii?Q?ZfDtOC0z9YXuq2ip7lmEMpLNM5jsLMA/fGpuWf+L0txXeqUuXKdaRFN6dESx?=
 =?us-ascii?Q?QC+5sK7LtYJRpePByX6k1sCXrpcH0iGciv2XqXiPetLpX4KoUf0cbWwXxLIz?=
 =?us-ascii?Q?xWkdsvd34QBjoBS9Dp3a2WXaMtoai7LaVBfQyknabJsU0Ro+qWvlX+BwgOtu?=
 =?us-ascii?Q?QhNJAoWPEWP1M0tVF4dhjmXmRDvcQ8oi5IDmBXAmX20wtI6ufXES/SWEL5Qo?=
 =?us-ascii?Q?qyy+YY5alX4w0YjvSKH6jakVTVugEFdb2Vc1cpK6ZHNU6vQRC9FNTHQxsFkx?=
 =?us-ascii?Q?8PbmPhoJAAPx4vduhfwBOsDU6aj0ywuB8lxr7MfB5EE7y1LKX8t7v8ccNIwj?=
 =?us-ascii?Q?qsl9WH8+/RstJb5G2eNWokEI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3300.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 680b6511-fb99-446c-b420-08d9203064b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2021 10:24:06.7089 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vbnk2mc6PdKr2BiUWfHNR1GZd9TJjrv5jJMjN/T1H7qulgIGi4ohHwkHgfwlUO+LzYpzrYY+B2jWBB4MjmVAypjyRpt8Z9lbFIRZfWHdRhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2979
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "airlied@redhat.com" <airlied@redhat.com>,
 Jenmin Yuan <jenmin_yuan@aspeedtech.com>, Arc Sung <arc_sung@aspeedtech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



-----Original Message-----
From: Kuo-Hsiang Chou=20
Sent: Friday, May 07, 2021 5:27 PM
To: tzimmermann@suse.de; dri-devel@lists.freedesktop.org; linux-kernel@vger=
.kernel.org
Cc: airlied@redhat.com; airlied@linux.ie; daniel@ffwll.ch; Jenmin Yuan <jen=
min_yuan@aspeedtech.com>; Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>; =
Arc Sung <arc_sung@aspeedtech.com>
Subject: [PATCH v4] drm/ast: Disable fast reset after DRAM initial

Hi Thomas,

May I know if this patch has sth wrong. Or something I need to improve on i=
t, I can fix it right now. Thanks!

Regards,
	Kuo-Hsiang Chou

[Bug][AST2500]

V1:
When AST2500 acts as stand-alone VGA so that DRAM and DVO initialization ha=
ve to be achieved by VGA driver with P2A (PCI to AHB) enabling.
However, HW suggests disable Fast reset mode after DRAM initializaton, beca=
use fast reset mode is mainly designed for ARM ICE debugger.
Once Fast reset is checked as enabling, WDT (Watch Dog Timer) should be fir=
st enabled to avoid system deadlock before disable fast reset mode.

V2:
Use to_pci_dev() to get revision of PCI configuration.

V3:
If SCU00 is not unlocked, just enter its password again.
It is unnecessary to clear AHB lock condition and restore WDT default setti=
ng again, before Fast-reset clearing.

V4:
repatch after "error : could not build fake ancestor" resolved.

Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
---
 drivers/gpu/drm/ast/ast_drv.h  |  1 +
 drivers/gpu/drm/ast/ast_main.c |  4 ++
 drivers/gpu/drm/ast/ast_post.c | 68 +++++++++++++++++++++-------------
 3 files changed, 47 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h =
index 911f9f414..5ebb5905d 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -346,6 +346,7 @@ bool ast_is_vga_enabled(struct drm_device *dev);  void =
ast_post_gpu(struct drm_device *dev);
 u32 ast_mindwm(struct ast_private *ast, u32 r);  void ast_moutdwm(struct a=
st_private *ast, u32 r, u32 v);
+void ast_patch_ahb_2500(struct ast_private *ast);
 /* ast dp501 */
 void ast_set_dp501_video_output(struct drm_device *dev, u8 mode);  bool as=
t_backup_fw(struct drm_device *dev, u8 *addr, u32 size); diff --git a/drive=
rs/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c index 2aff2e6cf.=
.cfb56ea3a 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -97,6 +97,10 @@ static void ast_detect_config_mode(struct drm_device *de=
v, u32 *scu_rev)
 	jregd0 =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd0, 0xff);
 	jregd1 =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd1, 0xff);
 	if (!(jregd0 & 0x80) || !(jregd1 & 0x10)) {
+		/* Patch AST2500 */
+		if (((pdev->revision & 0xF0) =3D=3D 0x40) && ((jregd0 & 0xC0) =3D=3D 0))
+			ast_patch_ahb_2500(ast);
+
 		/* Double check it's actually working */
 		data =3D ast_read32(ast, 0xf004);
 		if ((data !=3D 0xFFFFFFFF) && (data !=3D 0x00)) { diff --git a/drivers/g=
pu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c index 0607658dd..564=
28798a 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -2028,6 +2028,30 @@ static bool ast_dram_init_2500(struct ast_private *a=
st)
 	return true;
 }

+void ast_patch_ahb_2500(struct ast_private *ast) {
+	u32	data;
+
+	/* Clear bus lock condition */
+	ast_moutdwm(ast, 0x1e600000, 0xAEED1A03);
+	ast_moutdwm(ast, 0x1e600084, 0x00010000);
+	ast_moutdwm(ast, 0x1e600088, 0x00000000);
+	ast_moutdwm(ast, 0x1e6e2000, 0x1688A8A8);
+	data =3D ast_mindwm(ast, 0x1e6e2070);
+	if (data & 0x08000000) {					/* check fast reset */
+
+		ast_moutdwm(ast, 0x1E785004, 0x00000010);
+		ast_moutdwm(ast, 0x1E785008, 0x00004755);
+		ast_moutdwm(ast, 0x1E78500c, 0x00000033);
+		udelay(1000);
+	}
+	do {
+		ast_moutdwm(ast, 0x1e6e2000, 0x1688A8A8);
+		data =3D ast_mindwm(ast, 0x1e6e2000);
+	}	while (data !=3D 1);
+	ast_moutdwm(ast, 0x1e6e207c, 0x08000000);	/* clear fast reset */
+}
+
 void ast_post_chip_2500(struct drm_device *dev)  {
 	struct ast_private *ast =3D to_ast_private(dev); @@ -2035,39 +2059,31 @@ =
void ast_post_chip_2500(struct drm_device *dev)
 	u8 reg;

 	reg =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd0, 0xff);
-	if ((reg & 0x80) =3D=3D 0) {/* vga only */
+	if ((reg & 0xC0) =3D=3D 0) {/* vga only */
 		/* Clear bus lock condition */
-		ast_moutdwm(ast, 0x1e600000, 0xAEED1A03);
-		ast_moutdwm(ast, 0x1e600084, 0x00010000);
-		ast_moutdwm(ast, 0x1e600088, 0x00000000);
-		ast_moutdwm(ast, 0x1e6e2000, 0x1688A8A8);
-		ast_write32(ast, 0xf004, 0x1e6e0000);
-		ast_write32(ast, 0xf000, 0x1);
-		ast_write32(ast, 0x12000, 0x1688a8a8);
-		while (ast_read32(ast, 0x12000) !=3D 0x1)
-			;
-
-		ast_write32(ast, 0x10000, 0xfc600309);
-		while (ast_read32(ast, 0x10000) !=3D 0x1)
-			;
+		ast_patch_ahb_2500(ast);
+
+		/* Disable watchdog */
+		ast_moutdwm(ast, 0x1E78502C, 0x00000000);
+		ast_moutdwm(ast, 0x1E78504C, 0x00000000);
+		/* Reset USB port */
+		ast_moutdwm(ast, 0x1E6E2090, 0x20000000);
+		ast_moutdwm(ast, 0x1E6E2094, 0x00004000);
+		if (ast_mindwm(ast, 0x1E6E2070) & 0x00800000) {
+			ast_moutdwm(ast, 0x1E6E207C, 0x00800000);
+			mdelay(100);
+			ast_moutdwm(ast, 0x1E6E2070, 0x00800000);
+		}
+		/* Modify eSPI reset pin */
+		temp =3D ast_mindwm(ast, 0x1E6E2070);
+		if (temp & 0x02000000)
+			ast_moutdwm(ast, 0x1E6E207C, 0x00004000);

 		/* Slow down CPU/AHB CLK in VGA only mode */
 		temp =3D ast_read32(ast, 0x12008);
 		temp |=3D 0x73;
 		ast_write32(ast, 0x12008, temp);

-		/* Reset USB port to patch USB unknown device issue */
-		ast_moutdwm(ast, 0x1e6e2090, 0x20000000);
-		temp  =3D ast_mindwm(ast, 0x1e6e2094);
-		temp |=3D 0x00004000;
-		ast_moutdwm(ast, 0x1e6e2094, temp);
-		temp  =3D ast_mindwm(ast, 0x1e6e2070);
-		if (temp & 0x00800000) {
-			ast_moutdwm(ast, 0x1e6e207c, 0x00800000);
-			mdelay(100);
-			ast_moutdwm(ast, 0x1e6e2070, 0x00800000);
-		}
-
 		if (!ast_dram_init_2500(ast))
 			drm_err(dev, "DRAM init failed !\n");

--
2.18.4

