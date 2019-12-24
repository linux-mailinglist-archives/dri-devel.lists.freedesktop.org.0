Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF02812A759
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:21:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E42F6E35D;
	Wed, 25 Dec 2019 10:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70084.outbound.protection.outlook.com [40.107.7.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F3589DA3;
 Tue, 24 Dec 2019 17:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x41aDXJnAlxs0KStGVeTAshmH8fX6SjrjGl+PROCJ5s=;
 b=5G2KSLeOkNh32sWY6t8nKrMvXiJFXLsVvjy8S/7uBuZnmW3l4p6skehu5cWsnSPgXyd3KFXa3fRCDGvYRx4N2pXyjKtdrThvBDH4EYGMuZ6h9lq2l7EK94Pl6u3mTqCeWY1chhfvLoyJbR+1E3RnUrH+w/RO2eKnEpXPFquxcVg=
Received: from AM4PR08CA0070.eurprd08.prod.outlook.com (2603:10a6:205:2::41)
 by AM4PR0802MB2241.eurprd08.prod.outlook.com (2603:10a6:200:5e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14; Tue, 24 Dec
 2019 17:35:34 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::209) by AM4PR08CA0070.outlook.office365.com
 (2603:10a6:205:2::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14 via Frontend
 Transport; Tue, 24 Dec 2019 17:35:34 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:35:33 +0000
Received: ("Tessian outbound ca1df68f3668:v40");
 Tue, 24 Dec 2019 17:35:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c0b3b07c51830b0a
X-CR-MTA-TID: 64aa7808
Received: from 2398bdd0a748.10
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CFAC20EB-812E-4C75-BACB-8D33AAA07E93.1; 
 Tue, 24 Dec 2019 17:35:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 2398bdd0a748.10 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:35:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAmqDfOKIwXHvLye8tTgVNFmxEUb8nVglGYaBPxAQWfUytqZTLXvsZA1t2WimeXC06Ow6HUKY3iJ59b1iK9OKxESB8gbEYCR/9Xxs4aP9gfxdvACBsvXC9e6zmp+stcCSsW2ZiCF14xdE0+uL/zg9wjXe1iSmpfuQA3B1K/H6yeThymvnHxQtWXfDnVM1quf3vDXOlaZetI27jiBYNepqWhkk5DjMwJUGD1aOfM3bQ4UETb0dZ9Snw0ADNKljo02LRoYb1s7nIICJ7JzFZ1Zsz7u95QyJXcwK6DIuXAT8X+AT2pYsgzvAx/4LNWgOhlJ7ym0oVkYzS/uSeTRH1aF6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x41aDXJnAlxs0KStGVeTAshmH8fX6SjrjGl+PROCJ5s=;
 b=OstH3Ssgg6gQjSjVHWynH082qFl+btd46KgaatGga9+cAU763Rqn1fIu+Yny/EvVU+9O+DX55pIN9CTncDXahy8x8fQ8tukajLVSYUQhfJ2JSpYS6vQfNn/cKuPm/0aA2EwXxiC41iIVs7CS8B3EHinslmKgz5jOO2o4wem8WRn2lYAHzSZl86y1YnNC5dwco3iKumAfpCy+SfreXHF0gSx0e/EsbaPbtV++7GPCclu6+i4jRz6b1PzAiZFe/nE8hYmSbt9dG6pfUCvdFJRVLYBBKppticTJUcrgeaXKZ0MtqDBdDV6s0dYEoIHveCOsXTNYvYxYvzekjKQ8TXBJ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x41aDXJnAlxs0KStGVeTAshmH8fX6SjrjGl+PROCJ5s=;
 b=5G2KSLeOkNh32sWY6t8nKrMvXiJFXLsVvjy8S/7uBuZnmW3l4p6skehu5cWsnSPgXyd3KFXa3fRCDGvYRx4N2pXyjKtdrThvBDH4EYGMuZ6h9lq2l7EK94Pl6u3mTqCeWY1chhfvLoyJbR+1E3RnUrH+w/RO2eKnEpXPFquxcVg=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2672.eurprd08.prod.outlook.com (10.170.238.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.16; Tue, 24 Dec 2019 17:35:23 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:35:23 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 35/35] drm/msm: Use drm_bridge_init()
Thread-Topic: [PATCH v3 35/35] drm/msm: Use drm_bridge_init()
Thread-Index: AQHVuoB09eGRc2nWQ02DTmctwXsGfw==
Date: Tue, 24 Dec 2019 17:34:55 +0000
Message-ID: <20191224173408.25624-36-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8eae8d7c-3c8e-4ecb-9c47-08d78897ae28
X-MS-TrafficTypeDiagnostic: VI1PR08MB2672:|VI1PR08MB2672:|AM4PR0802MB2241:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM4PR0802MB2241F9EC7A45DCAA419F6EFA8F290@AM4PR0802MB2241.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
x-forefront-prvs: 0261CCEEDF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(199004)(189003)(186003)(26005)(7416002)(52116002)(6506007)(6486002)(81166006)(6512007)(81156014)(8676002)(8936002)(44832011)(54906003)(478600001)(316002)(6916009)(2906002)(4326008)(2616005)(36756003)(1076003)(66446008)(64756008)(66556008)(66476007)(66946007)(5660300002)(6666004)(71200400001)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2672;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 2y4MietvQ/63kmWjWiPezqXbUt3tQPugR5x6U82gFaxq7kGEdUCbGNjIVzgHYKxb8grWoYjBxayU3S584Z0xGPt8cIKSI7Ye5Ye1Z19c5V88OGDDOGxwXDYi/dOccyzUXTGX7eHCDTWVrbZ5J4xWXOqw2h8q5n5ibf5j9+IqdUhnjrJ6TWWsQYiVTC2hThAIKjsM8c6R/MZj9tm0hePqiSV+dIKtnj0Q8hAjPXi/Z7JuRkMoCgPvSrCZnsVlfQ2Bqo6F2Edrv/RAVlveuAMIQnIsHtgm8/bSVNgTwjvC7AGTqx+jwbhRY3FkQ7V2kHAAas9Quiil+2j+LFVZ1GzZcyOSvpQU3IBMBgMelW5Siv4uF4y5ufTzljiWISt5sOC7tBjWGE8JWe9m+3NE44Kl5JEx1NJG80j7eHAulBk97COEmFSkoykprblyIyY8QWnO
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2672
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(346002)(189003)(199004)(54906003)(6512007)(2906002)(1076003)(316002)(76130400001)(6916009)(36906005)(6486002)(70586007)(86362001)(5660300002)(70206006)(26005)(186003)(8676002)(81156014)(107886003)(8936002)(356004)(6666004)(450100002)(478600001)(6506007)(26826003)(81166006)(336012)(4326008)(36756003)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR0802MB2241;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 90a97138-b67a-4808-a6ed-08d7889796f0
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tHXfw0iWO5qdaKY+6/gobAqTjPjJFU97qdk1uSRVWqCBpGU3jbD6uPmue2fNcUMkrqRYpMdwjSlXmFAI4FmsHE/ifLdQUvMJafGV/K08dxhCY5Dbau1j+SSsOLFC52RPsM3Bcs/cP2U7Unr911Weqk8c5EWtlV/IkW9gfnUI+mXqC50pnKi3tSa1KikeCuJlk7hFB2xv9TcjXqWuH0OvJrdW1hx8YfoseIE0cg83zCk9AzK6Qde6ZZBIJqhfThE6S4qDTYyMbhLKGitn5XwwFvKdrUIzPCFua1ukEW0K5aJ/szvNysUWUDDF+bFe1muT4PLWlSSNjyfMyINbhSEP1tA8E7c1fwQf5QEqvO3j7LYouzoTZxFGM+fn81nZwBBeShvR8UREEJ3TCiV2zimx2yDdBBKcvF74akR6PFH0p9Kumm42DJNuqpEYimxEds2c
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:35:33.8529 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eae8d7c-3c8e-4ecb-9c47-08d78897ae28
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2241
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
Cc: "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 nd <nd@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional change: drm_bridge_init() sets bridge->of_node, but that's
not used by msm anywhere, and the bridges aren't published with
drm_bridge_add() for it to matter.

v3:
 - drop driver_private argument (Laurent)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c  | 3 +--
 drivers/gpu/drm/msm/edp/edp_bridge.c   | 3 +--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 0fc29f1be8cc..058f8f9a8535 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -662,8 +662,7 @@ struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
 	encoder = msm_dsi->encoder;
 
 	bridge = &dsi_bridge->base;
-	bridge->funcs = &dsi_mgr_bridge_funcs;
-
+	drm_bridge_init(bridge, msm_dsi->dev->dev, &dsi_mgr_bridge_funcs, NULL);
 	ret = drm_bridge_attach(encoder, bridge, NULL);
 	if (ret)
 		goto fail;
diff --git a/drivers/gpu/drm/msm/edp/edp_bridge.c b/drivers/gpu/drm/msm/edp/edp_bridge.c
index 301dd7a80bde..1f1cc87d0dd2 100644
--- a/drivers/gpu/drm/msm/edp/edp_bridge.c
+++ b/drivers/gpu/drm/msm/edp/edp_bridge.c
@@ -95,8 +95,7 @@ struct drm_bridge *msm_edp_bridge_init(struct msm_edp *edp)
 	edp_bridge->edp = edp;
 
 	bridge = &edp_bridge->base;
-	bridge->funcs = &edp_bridge_funcs;
-
+	drm_bridge_init(bridge, edp->dev->dev, &edp_bridge_funcs, NULL);
 	ret = drm_bridge_attach(edp->encoder, bridge, NULL);
 	if (ret)
 		goto fail;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 07c098dce310..ed62d0822615 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -285,8 +285,7 @@ struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi)
 	hdmi_bridge->hdmi = hdmi;
 
 	bridge = &hdmi_bridge->base;
-	bridge->funcs = &msm_hdmi_bridge_funcs;
-
+	drm_bridge_init(bridge, hdmi->dev->dev, &msm_hdmi_bridge_funcs, NULL);
 	ret = drm_bridge_attach(hdmi->encoder, bridge, NULL);
 	if (ret)
 		goto fail;
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
