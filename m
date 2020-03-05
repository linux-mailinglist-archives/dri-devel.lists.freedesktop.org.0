Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAC117B80A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:04:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613626EC9D;
	Fri,  6 Mar 2020 08:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2070c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::70c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335BC6E33E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 13:07:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M1wuS9Ldma7vkpEI7uTUjeae1D7IC82OVU2ydpz6/uKpiNjG2G0dT2rSiTnLhJpHcjNLmEUG/kwRLmC58leu4eHCh5cITeMOqyBdnOmOAFLE+JEjOGpIhdP90rbv7kNwWFA8cS3oOU70anGA9NhLU1SeIuqDAQsLtqNME3i4l5RavdhlSGns9XpxVIAykTjef4UQyqeu3Tqv75K+RUOKIUXn1TtBxTHtoFHwH5n0zYfNEQ1MTxpXBKKs70JrLa5I6GQK2AqF1WxtUY9TqMyO8LaUKsvRbuuQ2GRkMbBw2J7Ow7bhuQzFMeuFf2iNKMDySQfteb3khnhAPhUrYvQ6DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kCByAzTqjqCTTp3qu3V2qrs/jRTd4UCcideiBGWOMw=;
 b=IfnYANVDHjothQbw040e+kqp57ZpvkYUz9Zo5Nvw5htsHg76tDHawhUcdDb67/U66NOAnZ5fbL1PRLfq17bED+MzCvqN8D+DRWt79tEyZu9rj83s9w8YZG5zoDAmdHJParVKqKVGmp3UjUJP6EwPvyhIoLNmVtHJMzuHbBBgsO/N01hXgeTjSdeQR4qlVDTbdxrVbqbRb0G3nwBQ/pW4y8QaoEfxOXZx89btzLPUX1b5MHd09YOtyFdwhnvvqB9QwpbbwdaWAFtxNUmDoCWXmWTwyuJAhgf85EWzatFFD9XGyjnCCMJrojlHBs1WVMp63/RCRw7d+UggCy6U6Wg1+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kCByAzTqjqCTTp3qu3V2qrs/jRTd4UCcideiBGWOMw=;
 b=YwLAHpA9kf55EhjuXlmg9ho1ba5Z0OtkMQYZCAYb/Ej0tCOT1RZqg8BA+WU+JuCNhyfa3qcOHulSosj32MxC3SzlM5tDCBx0MldF4PgsDMrqBOIR2U69eU38MSYUw7fXn1GO833/VbBVEEIfpR+2+wZkbdt9CPKtHD0CnjiUGYs=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3404.eurprd02.prod.outlook.com (52.134.68.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14; Thu, 5 Mar 2020 13:07:07 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::d7c:583:b9cb:7592]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::d7c:583:b9cb:7592%7]) with mapi id 15.20.2772.019; Thu, 5 Mar 2020
 13:07:07 +0000
Received: from orc.pedanet (213.112.137.122) by
 HE1P190CA0007.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.16 via Frontend Transport; Thu, 5 Mar 2020 13:07:06 +0000
From: Peter Rosin <peda@axentia.se>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH] Revert "drm/panel: simple: Add support for Sharp LQ150X1LG11
 panels"
Thread-Topic: [PATCH] Revert "drm/panel: simple: Add support for Sharp
 LQ150X1LG11 panels"
Thread-Index: AQHV8u75j4+c7VIOikO5EdfqizyeKg==
Date: Thu, 5 Mar 2020 13:07:07 +0000
Message-ID: <20200305130536.26011-1-peda@axentia.se>
References: <20200304172552.GA4587@ravnborg.org>
In-Reply-To: <20200304172552.GA4587@ravnborg.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-originating-ip: [213.112.137.122]
x-clientproxiedby: HE1P190CA0007.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::17)
 To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06f4d83c-f8ec-4add-a914-08d7c1061b87
x-ms-traffictypediagnostic: DB3PR0202MB3404:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0202MB340427B0D84D2803D7D403C5BCE20@DB3PR0202MB3404.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:185;
x-forefront-prvs: 03333C607F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(346002)(366004)(396003)(39830400003)(199004)(189003)(1076003)(6486002)(5660300002)(2906002)(508600001)(36756003)(86362001)(316002)(71200400001)(26005)(54906003)(66446008)(8676002)(66946007)(8936002)(16526019)(4326008)(186003)(6916009)(956004)(52116002)(6506007)(81166006)(66476007)(66556008)(81156014)(64756008)(6512007)(2616005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR0202MB3404;
 H:DB3PR0202MB3434.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /QTo8k4yDbf+sZ0/TiC7GYdkb+tY36xpihPtsrxTw23dVhODQoryrp4R4FpAs5IgIEKI5Bu+ZI92Y+LXeMJHKoHjbjCrRZE+BBhuA/rrj6gNYx2pcvcsyS0ZnxVu19zxtFCMa5zGWbTxL9bALrsC/aO+rbgEudaJehf7Fhc/iCi/ii+8/yZbJ9Lkd7dM4ADzz4LEQJyFL4Sjn/ii2mCtNUOWcGHzD9Gf0lfvQ+uWBvljiw4VkFqc7CbznAW57yYPTVNG0kDXbZiL19kCiOG08MMEzyVDSSZQzrF/dP0mwzYaiZdWFQe2rwbce9kudQfSsDe/fNRzssrWo0KbfNTde1pvG44MDFmPYYXn1v7G52Eh3MauCmm+BPBsqvSQWTEfJIdRfIyWTA/8nMXB6cO4B5ijitQyV2SwymGGuraf4cgpzWS5LDvmYimni4zKgw1d
x-ms-exchange-antispam-messagedata: +HUGJjbseJtQQ1pSL2PPl5LkGdhCbWMAimqKkHnJ2BUu/7WbNwH+/WJx/LfZMB6CLHjeXRXXeCA3PvGLY4n2vbnoE/7PCmgbKBWvsag1sM4kef3bx8gyI+cM+HoHi03zB0UZSe0ZByvM9c4N31EN9Q==
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f4d83c-f8ec-4add-a914-08d7c1061b87
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2020 13:07:07.3656 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jIjrDHGkzC/D9m1mFR8Oa4YS9Lu6WYkzKnCeu074XQKEdYoYyTsXir56vSwMif7j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3404
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 0f9cdd743f7f8d470fff51b11250f02fc554cf1b.

The interface of the panel is LVDS, not parallel.
The color depth is RGB888, not RGB565.
The panel has additional features, making it not so simple.
The only user (upstream) of this panel is appropriately using panel-lvds.

Suggested-by: Thierry Reding <thierry.reding@gmail.com>
Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/gpu/drm/panel/panel-simple.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index e14c14ac62b5..fb8d61f5ae5d 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2768,30 +2768,6 @@ static const struct panel_desc sharp_lq123p1jx31 = {
 	},
 };
 
-static const struct drm_display_mode sharp_lq150x1lg11_mode = {
-	.clock = 71100,
-	.hdisplay = 1024,
-	.hsync_start = 1024 + 168,
-	.hsync_end = 1024 + 168 + 64,
-	.htotal = 1024 + 168 + 64 + 88,
-	.vdisplay = 768,
-	.vsync_start = 768 + 37,
-	.vsync_end = 768 + 37 + 2,
-	.vtotal = 768 + 37 + 2 + 8,
-	.vrefresh = 60,
-};
-
-static const struct panel_desc sharp_lq150x1lg11 = {
-	.modes = &sharp_lq150x1lg11_mode,
-	.num_modes = 1,
-	.bpc = 6,
-	.size = {
-		.width = 304,
-		.height = 228,
-	},
-	.bus_format = MEDIA_BUS_FMT_RGB565_1X16,
-};
-
 static const struct display_timing sharp_ls020b1dd01d_timing = {
 	.pixelclock = { 2000000, 4200000, 5000000 },
 	.hactive = { 240, 240, 240 },
@@ -3465,9 +3441,6 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "sharp,lq123p1jx31",
 		.data = &sharp_lq123p1jx31,
-	}, {
-		.compatible = "sharp,lq150x1lg11",
-		.data = &sharp_lq150x1lg11,
 	}, {
 		.compatible = "sharp,ls020b1dd01d",
 		.data = &sharp_ls020b1dd01d,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
