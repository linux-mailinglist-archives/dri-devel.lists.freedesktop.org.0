Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEFF118C32
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 16:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5ED89C0D;
	Tue, 10 Dec 2019 15:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20053.outbound.protection.outlook.com [40.107.2.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C583A89C0D;
 Tue, 10 Dec 2019 15:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6CC14c/w0ob4l+63KE8WSQxzuzWKwo5aKqJ6PoFZp0=;
 b=qD3svz8tn6zrffxYdBTF1goTWhU8DkDRqdOfdVhp2qNnmKj4htyDLYaFrZSM7zpARhQHiIaLSbyQzuAut9Zp2oLffLJZ1wMERb7TwNBrMlVbDJ0ujGTC4vg8SMykKqRn1/rcJXo7B5xEG9P0g4Ly4GuvkRsh9DuQHH9e2UqOZXc=
Received: from VI1PR08CA0117.eurprd08.prod.outlook.com (2603:10a6:800:d4::19)
 by HE1PR0802MB2618.eurprd08.prod.outlook.com (2603:10a6:3:d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13; Tue, 10 Dec
 2019 15:12:33 +0000
Received: from AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::208) by VI1PR08CA0117.outlook.office365.com
 (2603:10a6:800:d4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Tue, 10 Dec 2019 15:12:33 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT044.mail.protection.outlook.com (10.152.17.56) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 10 Dec 2019 15:12:32 +0000
Received: ("Tessian outbound 45a30426f8e4:v37");
 Tue, 10 Dec 2019 15:12:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ab28439f09072c33
X-CR-MTA-TID: 64aa7808
Received: from 77e9a27c853d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 51FC6528-CC3B-43C5-A38B-2A9F427FFD33.1; 
 Tue, 10 Dec 2019 15:11:39 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 77e9a27c853d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Dec 2019 15:11:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c74UZsb6qCHVvOZcSPOJNwyiOSwpWEDTPZAUsRKzDpRSEejJpLR+JioFYfUP1NhKZ29nOLGzXSD2k3i9d5n3moHsO6gTBRri0AUO1huQLApBYsK9PIRy3rkSJDTWJUAlaoIaluC734ao2x+LEDXgH/eqGGmevv+zGCSK7vV1LgsKlLEJ7oabAD89NidzDV0c30LeKdb3KQQ7LiCqpZvgRqSg2dJ29n0tyPPLFcRP34NHgzAEtVBYQX4nWSlq903mEj1jrr4reraYM84MJvJhlVccXKaypwmZxgdmdvJaDOtOSqrRrenoeCT+1kf758Qx4h8JzODKzsCLjaNbe0VkHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6CC14c/w0ob4l+63KE8WSQxzuzWKwo5aKqJ6PoFZp0=;
 b=QN1k2pwSB5XTm8RRCx209f2I7zSqu0riV/utaUnvpl67WO9IZEqj0AzLILPVKknT7bfy755Sa8ZTsov4OXCbZK2zIZBSvXgw031FCFR60V6UlpjdZ0ATp9cjrQ6vqktjYmPoZkq80LpSkSAhEBezu+AD9K/JEl0RpzVhwEasjajUP0rcn8UyMOI8P2aUFJ8U7w4oRIw8xItKM072OwwJ79X9uFzbQ/U3D5myDorwufTGLAxfF8EfU8aUIyRiNTvQAZuExl0gGoGt50wj33pmCKcFb2ARGtFCHixJivuPbqo1wc2reDo9y8iWPq41dXMzEDlj/Y4DigbR6HbbkRGDOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6CC14c/w0ob4l+63KE8WSQxzuzWKwo5aKqJ6PoFZp0=;
 b=qD3svz8tn6zrffxYdBTF1goTWhU8DkDRqdOfdVhp2qNnmKj4htyDLYaFrZSM7zpARhQHiIaLSbyQzuAut9Zp2oLffLJZ1wMERb7TwNBrMlVbDJ0ujGTC4vg8SMykKqRn1/rcJXo7B5xEG9P0g4Ly4GuvkRsh9DuQHH9e2UqOZXc=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2991.eurprd08.prod.outlook.com (52.133.12.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Tue, 10 Dec 2019 15:11:36 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 15:11:36 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm: remove drm_bridge->dev
Thread-Topic: [PATCH] drm: remove drm_bridge->dev
Thread-Index: AQHVr2wdDpJ+XhW2pkOR3j38qbFIVw==
Date: Tue, 10 Dec 2019 15:11:35 +0000
Message-ID: <20191210151111.21510-1-mihail.atanassov@arm.com>
References: <20191205163028.19941-1-mihail.atanassov@arm.com>
In-Reply-To: <20191205163028.19941-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.54]
x-clientproxiedby: LNXP265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::19) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 26cd0b36-5821-4bce-7d58-08d77d8361b5
X-MS-TrafficTypeDiagnostic: VI1PR08MB2991:|VI1PR08MB2991:|HE1PR0802MB2618:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0802MB2618BC1541B64056ADFA16FB8F5B0@HE1PR0802MB2618.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:204;OLM:204;
x-forefront-prvs: 02475B2A01
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(189003)(199004)(66446008)(64756008)(66556008)(44832011)(52116002)(6512007)(186003)(66476007)(66946007)(4326008)(36756003)(6916009)(966005)(86362001)(6506007)(478600001)(7416002)(8936002)(54906003)(26005)(8676002)(30864003)(6486002)(1076003)(81166006)(81156014)(2616005)(316002)(5660300002)(2906002)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2991;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 1zAmg/uvyHb++dMS8rymVTMbfFKPFQbDAZTCbiLz6YJOf9BWtRuFKl+XJON5U6T16IbrYs3FOoMDkg5JDsB6glgiidgSjcgJ6ekAarGGLmi3l1wL3DIwJW3+SO7rhBSNOii0FXLEZ0yj5ACjRiKwOn5HQLYLS6LxBkZGz1ZWedwh1U5HWB8nwokRK6Vfb+KKhLidZIsDvvKYrpwl8YnmmwbFmkrbRTmqzZjsmzmm+C/a2rOa3iohh8KLXB7u5TaVEANxPdI2gf8pyiMxSuaI3XKPKKYFLxmSu1JWISjA04If3FM1E3rD4sV8tgxuLFZy8XdpJXv/Ribpc4UYR3zmYUGTY32lE5NJ+dyrmDCFQdxVc0YSrDhDc02I/faq0MFnksSJjBSoGo5mP7TysrCxRAjbuNYZ2P61uzU9uIb0jUDTbj7Z6pQUXvpFUW7SR3ktZcS8tJnFqdCMAL++sbO6CAJVtpSYgPCa1Fix+7ZpJ4A=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2991
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(346002)(136003)(189003)(199004)(186003)(107886003)(356004)(2616005)(966005)(6486002)(86362001)(26826003)(450100002)(8936002)(70586007)(6916009)(478600001)(30864003)(26005)(6512007)(4326008)(336012)(6506007)(54906003)(5660300002)(81166006)(36756003)(36906005)(76130400001)(70206006)(81156014)(316002)(8676002)(2906002)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0802MB2618;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: b894a2f0-ec02-416e-63bd-08d77d833f8c
NoDisclaimer: True
X-Forefront-PRVS: 02475B2A01
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mGLnD7WtjYa0TDqfv2Js1AJkRb5/QM6t41Z/3y3OmHbcPzP1bj+1La47l3FgXrxq5C7/8AWh+d2HkyBToa85fqWAYJIy+Zlt0yNA2aZ8pgOYjMA8HaRVnI7YUKzHo526XZ9gL2g82VG+Fb+RVP9ODpHIpdBgstIJh+jkDi31ox2P4IcRYGEuV9nEyzupS/2lnpysTQijRQSLpgVCyR1LOhaDq4WVcshV2SUe/ORKgVpw/bwe0M2SOZDuguZ4t7vMXNZFAdyK5jYBGSb9FYFyKFMz82B55u3YY7ZlIRgoy6UCyL5/BnbuDG28oKrGDERcVeb2wvID49RCefDWHw5FDeCb7z1ySMH9IjCvvgcj0nxicHaXDZxUCGXgfb2ZvMV3DJiqn4hpFaUxI2TAm1VFVHwFkINQcL01+R+QDCZb2JMovv45KxWm/YN/8bYpJzqOya778tkOckQ2UczyxrVDYbaSiS+OuMVKwSPT77GGiCg=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 15:12:32.8695 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26cd0b36-5821-4bce-7d58-08d77d8361b5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2618
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
Cc: "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, nd <nd@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As suggested in [1], the 'dev' field is a bit repetitive, since it 1:1
follows the setting and NULLing of the 'encoder' field. Therefore, use
drm_bridge->encoder->dev in place of drm_bridge->dev.

[1] https://patchwork.freedesktop.org/patch/343824/

Cc: Daniel Vetter <daniel@ffwll.ch>
Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c           |  2 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c     |  2 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c     |  2 +-
 drivers/gpu/drm/bridge/cdns-dsi.c                      |  2 +-
 drivers/gpu/drm/bridge/dumb-vga-dac.c                  |  2 +-
 .../gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |  2 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c                   |  2 +-
 drivers/gpu/drm/bridge/panel.c                         |  2 +-
 drivers/gpu/drm/bridge/parade-ps8622.c                 |  2 +-
 drivers/gpu/drm/bridge/sii902x.c                       |  6 +++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c              |  6 +++---
 drivers/gpu/drm/bridge/tc358764.c                      |  4 ++--
 drivers/gpu/drm/bridge/tc358767.c                      |  6 +++---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c                  |  2 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                     |  6 +++---
 drivers/gpu/drm/drm_bridge.c                           | 10 ++++------
 drivers/gpu/drm/i2c/tda998x_drv.c                      |  2 +-
 drivers/gpu/drm/mcde/mcde_dsi.c                        |  2 +-
 drivers/gpu/drm/msm/edp/edp_bridge.c                   |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c                 |  4 ++--
 drivers/gpu/drm/rcar-du/rcar_lvds.c                    |  3 ++-
 include/drm/drm_bridge.h                               |  2 --
 22 files changed, 35 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 9e13e466e72c..009cf1fef8d4 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -863,7 +863,7 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge)
 		adv->connector.polled = DRM_CONNECTOR_POLL_CONNECT |
 				DRM_CONNECTOR_POLL_DISCONNECT;
 
-	ret = drm_connector_init(bridge->dev, &adv->connector,
+	ret = drm_connector_init(bridge->encoder->dev, &adv->connector,
 				 &adv7511_connector_funcs,
 				 DRM_MODE_CONNECTOR_HDMIA);
 	if (ret) {
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index 9917ce0d86a0..5b806d23fcb3 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -541,7 +541,7 @@ static int anx6345_bridge_attach(struct drm_bridge *bridge)
 		return err;
 	}
 
-	err = drm_connector_init(bridge->dev, &anx6345->connector,
+	err = drm_connector_init(bridge->encoder->dev, &anx6345->connector,
 				 &anx6345_connector_funcs,
 				 DRM_MODE_CONNECTOR_eDP);
 	if (err) {
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index 41867be03751..7463537950cb 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -908,7 +908,7 @@ static int anx78xx_bridge_attach(struct drm_bridge *bridge)
 		return err;
 	}
 
-	err = drm_connector_init(bridge->dev, &anx78xx->connector,
+	err = drm_connector_init(bridge->encoder->dev, &anx78xx->connector,
 				 &anx78xx_connector_funcs,
 				 DRM_MODE_CONNECTOR_DisplayPort);
 	if (err) {
diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c
index 3a5bd4e7fd1e..32863e3ad537 100644
--- a/drivers/gpu/drm/bridge/cdns-dsi.c
+++ b/drivers/gpu/drm/bridge/cdns-dsi.c
@@ -651,7 +651,7 @@ static int cdns_dsi_bridge_attach(struct drm_bridge *bridge)
 	struct cdns_dsi *dsi = input_to_dsi(input);
 	struct cdns_dsi_output *output = &dsi->output;
 
-	if (!drm_core_check_feature(bridge->dev, DRIVER_ATOMIC)) {
+	if (!drm_core_check_feature(bridge->encoder->dev, DRIVER_ATOMIC)) {
 		dev_err(dsi->base.dev,
 			"cdns-dsi driver is only compatible with DRM devices supporting atomic updates");
 		return -ENOTSUPP;
diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c b/drivers/gpu/drm/bridge/dumb-vga-dac.c
index cc33dc411b9e..67ad6cecf68d 100644
--- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
+++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
@@ -112,7 +112,7 @@ static int dumb_vga_attach(struct drm_bridge *bridge)
 
 	drm_connector_helper_add(&vga->connector,
 				 &dumb_vga_con_helper_funcs);
-	ret = drm_connector_init_with_ddc(bridge->dev, &vga->connector,
+	ret = drm_connector_init_with_ddc(bridge->encoder->dev, &vga->connector,
 					  &dumb_vga_con_funcs,
 					  DRM_MODE_CONNECTOR_VGA,
 					  vga->ddc);
diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index e8a49f6146c6..c914f01e4707 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -223,7 +223,7 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bridge)
 	drm_connector_helper_add(connector,
 				 &ge_b850v3_lvds_connector_helper_funcs);
 
-	ret = drm_connector_init(bridge->dev, connector,
+	ret = drm_connector_init(bridge->encoder->dev, connector,
 				 &ge_b850v3_lvds_connector_funcs,
 				 DRM_MODE_CONNECTOR_DisplayPort);
 	if (ret) {
diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index 57ff01339559..3999bb864eb9 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -247,7 +247,7 @@ static int ptn3460_bridge_attach(struct drm_bridge *bridge)
 	}
 
 	ptn_bridge->connector.polled = DRM_CONNECTOR_POLL_HPD;
-	ret = drm_connector_init(bridge->dev, &ptn_bridge->connector,
+	ret = drm_connector_init(bridge->encoder->dev, &ptn_bridge->connector,
 			&ptn3460_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector with drm\n");
diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index f66777e24968..4ba4e9d9537a 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -67,7 +67,7 @@ static int panel_bridge_attach(struct drm_bridge *bridge)
 	drm_connector_helper_add(connector,
 				 &panel_bridge_connector_helper_funcs);
 
-	ret = drm_connector_init(bridge->dev, connector,
+	ret = drm_connector_init(bridge->encoder->dev, connector,
 				 &panel_bridge_connector_funcs,
 				 panel_bridge->connector_type);
 	if (ret) {
diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
index 10c47c008b40..c32af9c2bbcc 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -487,7 +487,7 @@ static int ps8622_attach(struct drm_bridge *bridge)
 	}
 
 	ps8622->connector.polled = DRM_CONNECTOR_POLL_HPD;
-	ret = drm_connector_init(bridge->dev, &ps8622->connector,
+	ret = drm_connector_init(bridge->encoder->dev, &ps8622->connector,
 			&ps8622_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector with drm\n");
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index b70e8c5cf2e1..6ca297d78a26 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -402,7 +402,7 @@ static void sii902x_bridge_mode_set(struct drm_bridge *bridge,
 static int sii902x_bridge_attach(struct drm_bridge *bridge)
 {
 	struct sii902x *sii902x = bridge_to_sii902x(bridge);
-	struct drm_device *drm = bridge->dev;
+	struct drm_device *drm = bridge->encoder->dev;
 	int ret;
 
 	drm_connector_helper_add(&sii902x->connector,
@@ -820,8 +820,8 @@ static irqreturn_t sii902x_interrupt(int irq, void *data)
 
 	mutex_unlock(&sii902x->mutex);
 
-	if ((status & SII902X_HOTPLUG_EVENT) && sii902x->bridge.dev)
-		drm_helper_hpd_irq_event(sii902x->bridge.dev);
+	if ((status & SII902X_HOTPLUG_EVENT) && sii902x->bridge.encoder)
+		drm_helper_hpd_irq_event(sii902x->bridge.encoder->dev);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index dbe38a54870b..99274ca0fdf6 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2346,7 +2346,7 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
 
 	drm_connector_helper_add(connector, &dw_hdmi_connector_helper_funcs);
 
-	drm_connector_init_with_ddc(bridge->dev, connector,
+	drm_connector_init_with_ddc(bridge->encoder->dev, connector,
 				    &dw_hdmi_connector_funcs,
 				    DRM_MODE_CONNECTOR_HDMIA,
 				    hdmi->ddc);
@@ -2554,8 +2554,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
 		dev_dbg(hdmi->dev, "EVENT=%s\n",
 			phy_int_pol & HDMI_PHY_HPD ? "plugin" : "plugout");
-		if (hdmi->bridge.dev)
-			drm_helper_hpd_irq_event(hdmi->bridge.dev);
+		if (hdmi->bridge.encoder)
+			drm_helper_hpd_irq_event(hdmi->bridge.encoder->dev);
 	}
 
 	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index 96207fcfde19..e35e17b1f396 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -352,7 +352,7 @@ static void tc358764_enable(struct drm_bridge *bridge)
 static int tc358764_attach(struct drm_bridge *bridge)
 {
 	struct tc358764 *ctx = bridge_to_tc358764(bridge);
-	struct drm_device *drm = bridge->dev;
+	struct drm_device *drm = bridge->encoder->dev;
 	int ret;
 
 	ctx->connector.polled = DRM_CONNECTOR_POLL_HPD;
@@ -378,7 +378,7 @@ static int tc358764_attach(struct drm_bridge *bridge)
 static void tc358764_detach(struct drm_bridge *bridge)
 {
 	struct tc358764 *ctx = bridge_to_tc358764(bridge);
-	struct drm_device *drm = bridge->dev;
+	struct drm_device *drm = bridge->encoder->dev;
 
 	drm_connector_unregister(&ctx->connector);
 	drm_fb_helper_remove_one_connector(drm->fb_helper, &ctx->connector);
diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 3709e5ace724..ab1524c00777 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1407,7 +1407,7 @@ static int tc_bridge_attach(struct drm_bridge *bridge)
 {
 	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 	struct tc_data *tc = bridge_to_tc(bridge);
-	struct drm_device *drm = bridge->dev;
+	struct drm_device *drm = bridge->encoder->dev;
 	int ret;
 
 	/* Create DP/eDP connector */
@@ -1514,7 +1514,7 @@ static irqreturn_t tc_irq_handler(int irq, void *arg)
 		dev_err(tc->dev, "syserr %x\n", stat);
 	}
 
-	if (tc->hpd_pin >= 0 && tc->bridge.dev) {
+	if (tc->hpd_pin >= 0 && tc->bridge.encoder) {
 		/*
 		 * H is triggered when the GPIO goes high.
 		 *
@@ -1528,7 +1528,7 @@ static irqreturn_t tc_irq_handler(int irq, void *arg)
 			h ? "H" : "", lc ? "LC" : "");
 
 		if (h || lc)
-			drm_kms_helper_hotplug_event(tc->bridge.dev);
+			drm_kms_helper_hotplug_event(tc->bridge.encoder->dev);
 	}
 
 	regmap_write(tc->regmap, INTSTS_G, val);
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 9a2dd986afa5..8a4e64cfca1e 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -275,7 +275,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge)
 						   .node = NULL,
 						 };
 
-	ret = drm_connector_init(bridge->dev, &pdata->connector,
+	ret = drm_connector_init(bridge->encoder->dev, &pdata->connector,
 				 &ti_sn_bridge_connector_funcs,
 				 DRM_MODE_CONNECTOR_eDP);
 	if (ret) {
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index aa3198dc9903..76229367e2f4 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -135,7 +135,7 @@ static int tfp410_attach(struct drm_bridge *bridge)
 
 	drm_connector_helper_add(&dvi->connector,
 				 &tfp410_con_helper_funcs);
-	ret = drm_connector_init_with_ddc(bridge->dev, &dvi->connector,
+	ret = drm_connector_init_with_ddc(bridge->encoder->dev, &dvi->connector,
 					  &tfp410_con_funcs,
 					  dvi->connector_type,
 					  dvi->ddc);
@@ -179,8 +179,8 @@ static void tfp410_hpd_work_func(struct work_struct *work)
 
 	dvi = container_of(work, struct tfp410, hpd_work.work);
 
-	if (dvi->bridge.dev)
-		drm_helper_hpd_irq_event(dvi->bridge.dev);
+	if (dvi->bridge.encoder)
+		drm_helper_hpd_irq_event(dvi->bridge.encoder->dev);
 }
 
 static irqreturn_t tfp410_hpd_irq_thread(int irq, void *arg)
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c2cf0c90fa26..eaa20804b038 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -119,13 +119,12 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	if (!encoder || !bridge)
 		return -EINVAL;
 
-	if (previous && (!previous->dev || previous->encoder != encoder))
+	if (previous && (previous->encoder != encoder))
 		return -EINVAL;
 
-	if (bridge->dev)
+	if (bridge->encoder)
 		return -EBUSY;
 
-	bridge->dev = encoder->dev;
 	bridge->encoder = encoder;
 
 	if (previous)
@@ -137,7 +136,6 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		ret = bridge->funcs->attach(bridge);
 		if (ret < 0) {
 			list_del(&bridge->chain_node);
-			bridge->dev = NULL;
 			bridge->encoder = NULL;
 			return ret;
 		}
@@ -152,14 +150,14 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 	if (WARN_ON(!bridge))
 		return;
 
-	if (WARN_ON(!bridge->dev))
+	if (WARN_ON(!bridge->encoder))
 		return;
 
 	if (bridge->funcs->detach)
 		bridge->funcs->detach(bridge);
 
 	list_del(&bridge->chain_node);
-	bridge->dev = NULL;
+	bridge->encoder = NULL;
 }
 
 /**
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index a63790d32d75..17a66ef3dfd4 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -1360,7 +1360,7 @@ static int tda998x_bridge_attach(struct drm_bridge *bridge)
 {
 	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
 
-	return tda998x_connector_init(priv, bridge->dev);
+	return tda998x_connector_init(priv, bridge->encoder->dev);
 }
 
 static void tda998x_bridge_detach(struct drm_bridge *bridge)
diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 42fff811653e..c08d7ede9fb8 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -846,7 +846,7 @@ static void mcde_dsi_bridge_disable(struct drm_bridge *bridge)
 static int mcde_dsi_bridge_attach(struct drm_bridge *bridge)
 {
 	struct mcde_dsi *d = bridge_to_mcde_dsi(bridge);
-	struct drm_device *drm = bridge->dev;
+	struct drm_device *drm = bridge->encoder->dev;
 	int ret;
 
 	if (!drm_core_check_feature(drm, DRIVER_ATOMIC)) {
diff --git a/drivers/gpu/drm/msm/edp/edp_bridge.c b/drivers/gpu/drm/msm/edp/edp_bridge.c
index b65b5cc2dba2..301dd7a80bde 100644
--- a/drivers/gpu/drm/msm/edp/edp_bridge.c
+++ b/drivers/gpu/drm/msm/edp/edp_bridge.c
@@ -47,7 +47,7 @@ static void edp_bridge_mode_set(struct drm_bridge *bridge,
 		const struct drm_display_mode *mode,
 		const struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = bridge->dev;
+	struct drm_device *dev = bridge->encoder->dev;
 	struct drm_connector *connector;
 	struct edp_bridge *edp_bridge = to_edp_bridge(bridge);
 	struct msm_edp *edp = edp_bridge->edp;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index ba81338a9bf8..07c098dce310 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -20,7 +20,7 @@ void msm_hdmi_bridge_destroy(struct drm_bridge *bridge)
 
 static void msm_hdmi_power_on(struct drm_bridge *bridge)
 {
-	struct drm_device *dev = bridge->dev;
+	struct drm_device *dev = bridge->encoder->dev;
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	const struct hdmi_platform_config *config = hdmi->config;
@@ -56,7 +56,7 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 
 static void power_off(struct drm_bridge *bridge)
 {
-	struct drm_device *dev = bridge->dev;
+	struct drm_device *dev = bridge->encoder->dev;
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	const struct hdmi_platform_config *config = hdmi->config;
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 2cf44b91853c..83538125a722 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -622,7 +622,8 @@ static int rcar_lvds_attach(struct drm_bridge *bridge)
 	if (!lvds->panel)
 		return 0;
 
-	ret = drm_connector_init(bridge->dev, connector, &rcar_lvds_conn_funcs,
+	ret = drm_connector_init(bridge->encoder->dev, connector,
+				 &rcar_lvds_conn_funcs,
 				 DRM_MODE_CONNECTOR_LVDS);
 	if (ret < 0)
 		return ret;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 694e153a7531..695d0898df38 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -380,8 +380,6 @@ struct drm_bridge_timings {
  * struct drm_bridge - central DRM bridge control structure
  */
 struct drm_bridge {
-	/** @dev: DRM device this bridge belongs to */
-	struct drm_device *dev;
 	/** @encoder: encoder to which this bridge is connected */
 	struct drm_encoder *encoder;
 	/** @chain_node: used to form a bridge chain */
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
