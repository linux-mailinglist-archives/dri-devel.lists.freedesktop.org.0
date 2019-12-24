Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C342F12A753
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAEAE6E0DD;
	Wed, 25 Dec 2019 10:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::621])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8777589E52;
 Tue, 24 Dec 2019 17:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9JSn30pd0NF9LZaiJcXz3M/19eZMzstYf8xwo/HeZc=;
 b=VBzlj762SUlnBKYjfYXmRlh8xTn9dnIHQ5mGihfwyfEb22xerSYdt4YVVhFp3Xm8CqpdikqS94j27XhiMmCINNZX5YzO+OGuXSvzmxsiowBeHkduCQULVKoCCizGjQWahHNEuVoWd+ryVi0B97xZ41tPCcQcXs6fthSSdYgNoC0=
Received: from VI1PR08CA0119.eurprd08.prod.outlook.com (2603:10a6:800:d4::21)
 by DB8PR08MB3962.eurprd08.prod.outlook.com (2603:10a6:10:a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.16; Tue, 24 Dec
 2019 17:34:30 +0000
Received: from DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::200) by VI1PR08CA0119.outlook.office365.com
 (2603:10a6:800:d4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via Frontend
 Transport; Tue, 24 Dec 2019 17:34:30 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT005.mail.protection.outlook.com (10.152.20.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:34:30 +0000
Received: ("Tessian outbound 0eaff1016ea4:v40");
 Tue, 24 Dec 2019 17:34:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3bf3048c4c4a1075
X-CR-MTA-TID: 64aa7808
Received: from ac55e6cc70e7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5C7F5543-B940-4F1E-A330-7173FC3EA0D9.1; 
 Tue, 24 Dec 2019 17:34:24 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ac55e6cc70e7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:34:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KsSMSt/HwEDGiX1QXXi7H0Pd6uz20PDHAeOR97iSeYjW6tMcS/LxfWP3Slr3PQx7cXjSiriRR5iKUFr44dmBWleA3leQ0OZKKusO0A5YfRFXo+j6QLakqjLDfOrw0a38p7Os2VnjjiVJbjZMTdZDE+BCJk0w0RE4sCgwj8YMAPBGwYx7TmztRGkJDuhoP/zZTGD6jktSZTZ5wf/6EPi5rQRXiKMBTOzsgti5agbhNAXz2KqgPqvxFbssHvYlQu2LhJGohr1Pdj+fCNQAHavmzaUM5hwGbb/lfRN6MU9E7EM+Vm2rrL2EmQyZXgcBQu7lejs5/IhBvvOom5df+u2F+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9JSn30pd0NF9LZaiJcXz3M/19eZMzstYf8xwo/HeZc=;
 b=OWI4zc5oRV37uHCe65P0HJIlMTgzsEhrDjsj0SsBPy+4itA0O7SQ50UcEOxeDK1jN6WcbIehShZettAOfZ2HLkRzyGeRheo8WteZ4ycZrJ3H0mpucCycdcF3K2ONa0n6kxrjj/gqvzeHLPP9MMG3KoT751VBDgAkQOPichYHBx7sNkNV4h6OPEXI4pCc9o7IUeuppQ26JpIwdwrqL+uVv8oeoK/0lGkPkYjMAKUsV1Jh/8fq/rp4Swh/D9jBQc7Bstt0yPCFR69x0mywkATIV4+5nnF9JJjDhzwF8MtCEqmHnqQr4yICS3PiHC8th8U6XV3UWu2z8SfvCpx0gLAERQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9JSn30pd0NF9LZaiJcXz3M/19eZMzstYf8xwo/HeZc=;
 b=VBzlj762SUlnBKYjfYXmRlh8xTn9dnIHQ5mGihfwyfEb22xerSYdt4YVVhFp3Xm8CqpdikqS94j27XhiMmCINNZX5YzO+OGuXSvzmxsiowBeHkduCQULVKoCCizGjQWahHNEuVoWd+ryVi0B97xZ41tPCcQcXs6fthSSdYgNoC0=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2702.eurprd08.prod.outlook.com (10.170.239.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Tue, 24 Dec 2019 17:34:21 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:34:21 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 01/35] drm: Remove drm_bridge->dev
Thread-Topic: [PATCH v3 01/35] drm: Remove drm_bridge->dev
Thread-Index: AQHVuoBfpcizub2IkkiBwuTayWU61g==
Date: Tue, 24 Dec 2019 17:34:20 +0000
Message-ID: <20191224173408.25624-2-mihail.atanassov@arm.com>
References: <20191224173408.25624-1-mihail.atanassov@arm.com>
In-Reply-To: <20191224173408.25624-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.53]
x-clientproxiedby: LNXP123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::35) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.24.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 64134acd-b172-49bc-a542-08d78897883b
X-MS-TrafficTypeDiagnostic: VI1PR08MB2702:|VI1PR08MB2702:|DB8PR08MB3962:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB39622CFB5E2D48879E667DBB8F290@DB8PR08MB3962.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:232;OLM:232;
x-forefront-prvs: 0261CCEEDF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(189003)(199004)(81156014)(8676002)(478600001)(36756003)(4326008)(8936002)(30864003)(66446008)(64756008)(66946007)(66476007)(66556008)(26005)(7416002)(186003)(44832011)(6506007)(2616005)(81166006)(966005)(71200400001)(316002)(2906002)(1076003)(6512007)(54906003)(6916009)(6486002)(86362001)(5660300002)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2702;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 8g8c7UIwi5iwc51BWI7XJfnPC1B13s2oz/hBTuw635JCb5b4UgUtUtvIIr7kIqGaVSpD9K2JVLisJSYli3L9wtHnxMZitUeciLz5HlwMjJoN1h53TGIsajrdoMdHKo3RuuCWhiBQ2GGbOKc7umttOz05W9iOFFEJmQaw7cPSiI/LSaDNQ7JIcEEJUiAJ1ETr3wwTb2CLhzT6hWuidzdgoEqUPFlCXGfI/IfWYA9aFhedQM49hxp0RsGM0ZV3KWIymqEawNK1sGj2lzIXUp9MuJVBDG+prVPeput4kS1yg5Y8Hcj5dFlUoBO3iKgfgWTmCJ2PkmtRHbjGv7dV+jS+e6Zy+UAm08XVLIpOeVOWqy1ljTspn6EtsNx7wDJRLByXADrb9waTZBeeXRZVheMq1Vfr6/Extm2PrV17OyPKWHe5VoDsS0VlvR91De30GJvMwe2Ab3JAXTeIS12Z5zXFsZJF4LAg0NftGtlcpWQjDVU=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2702
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(136003)(199004)(189003)(478600001)(1076003)(316002)(5660300002)(6486002)(966005)(70206006)(70586007)(54906003)(107886003)(4326008)(6506007)(356004)(336012)(450100002)(26826003)(30864003)(76130400001)(36756003)(86362001)(6916009)(81166006)(81156014)(8676002)(6512007)(186003)(2906002)(26005)(2616005)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB3962;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a3e74795-5584-4a7c-bade-08d78897814c
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MT3arPisntrxosCSit+eJKCE1ulQ+Y6krlXYJxw72/H8rDtS82LSAdZiZGGKnpfMUdWaPEkewz32L2IK4nIXnhgBsCCQvAbhQRvSWokf9a0vry66p+sXyhwh9sAZ7UF9rNyBp1RQMGT4BMKNWXG7HMg7jq7pCcrsAuNyjpBnG8uNBRYNiQMzK0hRSke4wGjAwOlFlIxUNLH1Rmoqe6OfaAkOpR20n6UuIV8A/CUE01zZjeZQhc6Nvjr3XJ72+xDgDNNDlLKSN9qX0rJXv82c4N7SVhhusP89Nxota3lGYIMxb8zYcWzWov/+ui9T/Z7XkecSNYRkgWsG0cShNo+dn3g0puoFw02d+jZcsPvetks0wp7+w04d9888ZO6XL8cmXbnXUjfUoGXbwbdctI/yoz9DUQF+ZGJMW+wpDvI9QokmayYIpzhmLzxzYvbo31qsaziWsBDs7/ua3qBxMxuklzHxi4Lyog8BsDYQctWK+H8=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:34:30.2373 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64134acd-b172-49bc-a542-08d78897883b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3962
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
 Maarten Lankhorst <maarten.lankhosrt@linux.intel.com>,
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
