Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC8C12A73E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:20:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43CDC89B20;
	Wed, 25 Dec 2019 10:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50078.outbound.protection.outlook.com [40.107.5.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A540B89E52;
 Tue, 24 Dec 2019 17:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9JSn30pd0NF9LZaiJcXz3M/19eZMzstYf8xwo/HeZc=;
 b=X/ebVt8YHGyQUkpT5UQiXu3JOl8KXH0Bqo+JJUnlvbMGQVDTnXv9Epde3Ir7HXpAfXMZHBt0MQDo2VO9Ixm6B0N6T7AGytYg1nu62SaZVgzW0vviZKhKtudwLjIeVZz3I4W6Xa0ZLop2Q4dKYkumMXH1NWzgu/nOj3UJoOcPX38=
Received: from VE1PR08CA0027.eurprd08.prod.outlook.com (2603:10a6:803:104::40)
 by DB7PR08MB3578.eurprd08.prod.outlook.com (2603:10a6:10:50::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.17; Tue, 24 Dec
 2019 17:40:55 +0000
Received: from AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::205) by VE1PR08CA0027.outlook.office365.com
 (2603:10a6:803:104::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.15 via Frontend
 Transport; Tue, 24 Dec 2019 17:40:55 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT019.mail.protection.outlook.com (10.152.16.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:40:54 +0000
Received: ("Tessian outbound ca1df68f3668:v40");
 Tue, 24 Dec 2019 17:40:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c10677de45ca1696
X-CR-MTA-TID: 64aa7808
Received: from f9466a1bfe07.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3724AF7E-573F-4EF7-9CBF-5DCD78F8A484.1; 
 Tue, 24 Dec 2019 17:40:49 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f9466a1bfe07.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:40:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqFQUFCfTF8tkh+m8w+ayif8/g4ALYZuAjEDV5XoQr8W26zlDffaJ8bkH+wyi34netPR5ZdISCnrjKvOonyGKKzRd37Ii6AsjyEsBVxTvBnQEudr9I6urJOj/I6ecm+RNfwKrPN6wPyyBO+qwSGBBZAboSpWDxMKit7qIqoINnx+wWvk65iggrmjx6X/rREgdywqd1ofu5iddR6BV6G/ITUo6W4hyAS5G1tiyywoQ08MgLqgkz7sZSANe1uhesbw31h3ZMDrZMUlG5mRQ/GYmN9/fFh7mpNh1DIGLUYXmDyXlwWe5OcxmhQA87wYmqWU2VAWhymC0A8r9Zl0D7EN9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9JSn30pd0NF9LZaiJcXz3M/19eZMzstYf8xwo/HeZc=;
 b=nOa9BRvGz4bkmOEd+oEHqSQVAlEBrR9uz4syv/WRaDC/p31LMZQansmTAZuJXApQzJZkUrXYlnQ18MyG+XvT3viYzdShByo+Zhw2UZEZ8y4qSfC/7PLOR/039HNhpEerMFYzUB3GrwLcRLJL/aFpz5v+Jx56VZc71cIfF6h7yMMjYqjWpNPd+y6fQG/7SD9yO2fv8AmwTnkc7RpMeGD6RDxYEN6QYlnfjk2mf+4A1dw7kUEnPKRKrhJ2biYAoag2aAgYZopZvgMKS+qJz/J2Mh89VPmW3CkC8/9nJ2TuCY9FAPdBRRk2gbm50I+MGadwMkMUfJ+TUXhzm3y0DsaTaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9JSn30pd0NF9LZaiJcXz3M/19eZMzstYf8xwo/HeZc=;
 b=X/ebVt8YHGyQUkpT5UQiXu3JOl8KXH0Bqo+JJUnlvbMGQVDTnXv9Epde3Ir7HXpAfXMZHBt0MQDo2VO9Ixm6B0N6T7AGytYg1nu62SaZVgzW0vviZKhKtudwLjIeVZz3I4W6Xa0ZLop2Q4dKYkumMXH1NWzgu/nOj3UJoOcPX38=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2672.eurprd08.prod.outlook.com (10.170.238.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.16; Tue, 24 Dec 2019 17:40:46 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:40:46 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 RESEND 01/35] drm: Remove drm_bridge->dev
Thread-Topic: [PATCH v3 RESEND 01/35] drm: Remove drm_bridge->dev
Thread-Index: AQHVuoFFITDfwI/JfEaH2idcTEq34w==
Date: Tue, 24 Dec 2019 17:40:45 +0000
Message-ID: <20191224174019.29369-1-mihail.atanassov@arm.com>
References: <20191224173408.25624-1-mihail.atanassov@arm.com>
In-Reply-To: <20191224173408.25624-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.53]
x-clientproxiedby: SN1PR12CA0109.namprd12.prod.outlook.com
 (2603:10b6:802:21::44) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.24.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 499fa3f9-08b8-4642-424f-08d788986d8a
X-MS-TrafficTypeDiagnostic: VI1PR08MB2672:|VI1PR08MB2672:|DB7PR08MB3578:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB3578408F63FD979DCC7C319E8F290@DB7PR08MB3578.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:232;OLM:232;
x-forefront-prvs: 0261CCEEDF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(189003)(199004)(66946007)(1076003)(66446008)(64756008)(66556008)(66476007)(5660300002)(71200400001)(86362001)(30864003)(6486002)(81156014)(8676002)(6512007)(81166006)(26005)(186003)(7416002)(52116002)(6506007)(4326008)(2616005)(36756003)(2906002)(966005)(478600001)(54906003)(8936002)(44832011)(6916009)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2672;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: dY1BRfpRa6jMQoTq/pEQShAemM4xt4y2M2YpVXBRnLYWftYMH0lwkoTPUCcemPXZFSPtWH/R3reeM9XagUaG8Idolhgvp30GCJCxWD7gLo6/t8IT3z7oPdQ1Vz1pKn/JkpRdoMjCkjbxiXqW0uViWJ298sXBHWR998sbPUgC9PsWBPiaRgjPFA5mq69yXZqRINNlVTjHUojCo0CZuNbQ2f63PzxQXm1fuFPKKG8VsF/Wlxu13X20jG+vCBs8pudQoIP1Wa+nheRjLTbcT5gaX/NIjaWSgTDixVhAL/YVFQypgcic4FFEwodiBkyDys9ZojLBmMxceTrGH1Q5YykMOlloEKj2vwlXa+XplZ4k1q3Dp8SNB6ljRE2mwJ5tsZMBMwMBcO8HXuLoWfBqQ1P7majL01nEPhJLXGW1w4ff9j3Cnd6cRPnKN9sWBE1q7lbV0EcOk/0f8g5qsSX2dSmHfczbsOeJnII7YBJMet0Q46I=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2672
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(346002)(376002)(199004)(189003)(81166006)(8676002)(5660300002)(81156014)(1076003)(316002)(356004)(186003)(6506007)(26005)(30864003)(478600001)(26826003)(6486002)(966005)(6512007)(36756003)(6916009)(4326008)(450100002)(86362001)(70206006)(54906003)(107886003)(8936002)(336012)(36906005)(76130400001)(2906002)(2616005)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3578;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: d564c367-64a4-476b-9991-08d7889867f2
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GS/S5ZxlzobRQbROKBK+d/QqIC/L5KHjcqSeAf0zKfJz7mD859OlA2ZpVzDYTP7Gn97RhiFB8kWxJsXlt44o0ulbkVjztZKwDcGt1j0pEWxuDbX5Sv9MexmX6v7poRkAgwk59SdYe6A7tUW+UCfVLRh37JsZ9Md3QKxbLdsqf+cTB/ImGM7LASVcvV0LQzYjb2/HA3nZubWhwKsSjPnIbkVuu37kciuwRlXfwRB2gw+hN85InbeNsdiKNzXSEcbcEXd0k187zCGzCygUS/6+AJUls47ir3WLw/jS3oXGcrmFYkzn1kXn9VEQhAt09oNImLeqHfKW/u7LQ9bM8iMHzzCJZxav0u2Xv3guvwKkS+3q0Ga6/d3hiJXAlBzIeCVLPxOO4DHQIVRv+9qXlJi40NkvkFoDMnFSqO02PL6nnLkIx3B9N0Ity1za6MBZ0XtQ5SXTNcMD/yadNFOdT9BYe0G3LXAh3w4+aPe+Kmd1Ihs=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:40:54.9307 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 499fa3f9-08b8-4642-424f-08d788986d8a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3578
X-Mailman-Approved-At: Wed, 25 Dec 2019 10:19:18 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As suggested in [1], the 'dev' field is a bit repetitive, since it 1:1
follows the setting and NULLing of the 'encoder' field. Therefore, use
drm_bridge->encoder->dev in place of drm_bridge->dev.

[1] https://patchwork.freedesktop.org/patch/343824/

v3:
 - resend as part of drm_bridge_init() series
v2:
 - fix checkpatch complaint about unnecessary parentheses in
 drm_bridge.c

Cc: Daniel Vetter <daniel@ffwll.ch>
Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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
index c2cf0c90fa26..258094169706 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -119,13 +119,12 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	if (!encoder || !bridge)
 		return -EINVAL;
 
-	if (previous && (!previous->dev || previous->encoder != encoder))
+	if (previous && previous->encoder != encoder)
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
index 32e94bcb4a69..276a77c020c7 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -989,7 +989,7 @@ static void mcde_dsi_bridge_disable(struct drm_bridge *bridge)
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
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
