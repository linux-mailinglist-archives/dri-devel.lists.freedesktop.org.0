Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80EE12A73D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:20:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277C589C1C;
	Wed, 25 Dec 2019 10:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50055.outbound.protection.outlook.com [40.107.5.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2573889F08
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 17:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8y3GMi06ZfA7o6GfitjMMzqG4xMPXJbq3e1jAMkuKU=;
 b=7l3fOIov1xafgnpggNQ2EZqPcKptPygSsLGDvPUBw/i1N/NRXlNYkRCCyf0K7plvIk8WY1S5N0emnp6hJSIpNl1F1gYbtk9VY5cIDfriVqMz4UbhBNcXMXWznH4dSbobA86M22tlN5gbpbmuVr/37HXvQPTD622WTDEcIGyzhEk=
Received: from AM6PR08CA0046.eurprd08.prod.outlook.com (2603:10a6:20b:c0::34)
 by VI1PR08MB2878.eurprd08.prod.outlook.com (2603:10a6:802:19::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.20; Tue, 24 Dec
 2019 17:34:31 +0000
Received: from DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::208) by AM6PR08CA0046.outlook.office365.com
 (2603:10a6:20b:c0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.16 via Frontend
 Transport; Tue, 24 Dec 2019 17:34:31 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT014.mail.protection.outlook.com (10.152.20.102) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:34:31 +0000
Received: ("Tessian outbound 28955e0c1ca8:v40");
 Tue, 24 Dec 2019 17:34:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f1b881154abfd2ca
X-CR-MTA-TID: 64aa7808
Received: from c7aa28829b3e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1DF3A40A-A190-4531-9CFE-B0D49AEA1C08.1; 
 Tue, 24 Dec 2019 17:34:25 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c7aa28829b3e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:34:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f346dqzGGcASRKRIM3AEpMlKvS9YN5WHCVGqlRGsFpr25P0g44VDgI3vPMRlgUADDO+kJe+lQcevQk0hw06Yg/ylyC3TzERUNkQ4OzcPZ1cXlAOgtJCW0mpXcqeVvXo8dwb+cXIp6hdHQPoGFzkKzjicyQA0dAesc2mcyqaffx1Z6mvwvQq/chBIqde96fPPrfUsJ4nJDzlMkXoDmDftDEWgf8iDui52yLOKB7WYsI5xczXlDcd32nGuh/EqdmSgiB1MvfgKU+neRQ38+pILXyF4GWj2Yd6D7gxHeJuUOje0+lFNEN+0YS6MiecfpaSpkBIyBiMGo5SXmaDAMxmC4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8y3GMi06ZfA7o6GfitjMMzqG4xMPXJbq3e1jAMkuKU=;
 b=HXjkohl4H8m/Wyf8swCRB3RXp3dljdp4WcX9PgJTMQj5ZWs3obvbiuVf5iUf30JQRVFSzbLG52cmAk5VsVU/8jjR48qPqrGPtupBV1lMj/T4KAOxgrAcOWzFFqqktIeVv0ZZFRCVVz+UQ39I13eiEIVbFIa4gOqErQnHZrfUIGkHeYhLPPCWiqEAaS+xKBKKk00WJVK+7vqUaRJinCeQjHApdLwjg1aMUkkHtRibPYj2BFypzftTDmkBPoNvybvVw6b80OkHPyM1TCgfmIWTsgJEZuORnTF4Jq4CQiQTmT+oNc89FvYb2V/vdRKeGp7g5sn14HaUS6IW80OI9gd3mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8y3GMi06ZfA7o6GfitjMMzqG4xMPXJbq3e1jAMkuKU=;
 b=7l3fOIov1xafgnpggNQ2EZqPcKptPygSsLGDvPUBw/i1N/NRXlNYkRCCyf0K7plvIk8WY1S5N0emnp6hJSIpNl1F1gYbtk9VY5cIDfriVqMz4UbhBNcXMXWznH4dSbobA86M22tlN5gbpbmuVr/37HXvQPTD622WTDEcIGyzhEk=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2702.eurprd08.prod.outlook.com (10.170.239.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Tue, 24 Dec 2019 17:34:24 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:34:24 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 03/35] drm/bridge/synopsys: Stop using
 drm_bridge->driver_private
Thread-Topic: [PATCH v3 03/35] drm/bridge/synopsys: Stop using
 drm_bridge->driver_private
Thread-Index: AQHVuoBgDD48T29lSEihrvDPdP2k7g==
Date: Tue, 24 Dec 2019 17:34:22 +0000
Message-ID: <20191224173408.25624-4-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5cd8aebf-5752-4f05-bcdc-08d788978902
X-MS-TrafficTypeDiagnostic: VI1PR08MB2702:|VI1PR08MB2702:|VI1PR08MB2878:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB2878B66A99C5BCB5CFC317798F290@VI1PR08MB2878.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:418;OLM:418;
x-forefront-prvs: 0261CCEEDF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(189003)(199004)(81156014)(8676002)(478600001)(36756003)(4326008)(8936002)(66446008)(64756008)(66946007)(66476007)(66556008)(26005)(186003)(44832011)(6506007)(2616005)(81166006)(71200400001)(316002)(2906002)(1076003)(6512007)(54906003)(6916009)(6486002)(86362001)(5660300002)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2702;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 5O3rSr2i+a+tA0amttawEsipuBxuQ9aYk9nUBG3FXI8lsJwTQgFjeN36i9z1Baeg8K33aVK5psq9kZcnhjhWZPeOGX2q4fKb5hKPLHY2OV58+jTNCWvuuz5xGEh/pwglQ8RUV7L54Ncjlv+g2IMvU+VCRf+hm+EW+PGn1mMigzQ/GoLrQffMrkgVhTnuBNIQ5EkmtjNGrlH/dhqEtjnOQoJD88x1dUVS8SaIIS5Qqa5KQ2b+CjOzZ03gBo/JohsUXk4t09Da806A+hR2XcA3tHFMH157+tX2Kw7y7MUJ1rMkafq7hiX4NF95kZn2/lvNZ8BSgOxuUy2ZSMAeNHuWTIGjypviavzMkx4TZQJ68Yz0RTikdXcbCTZmOuNI5sMWUm8nSqk0FCqDb0+frqY3fFL2bJ+PtvemHQtJ+D6VViqbNp53A1ov6n7g3wtwh2bX
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2702
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(376002)(199004)(189003)(6486002)(4326008)(6916009)(36756003)(5660300002)(107886003)(8936002)(6512007)(6506007)(26826003)(81166006)(70586007)(478600001)(356004)(81156014)(316002)(2906002)(54906003)(8676002)(2616005)(336012)(76130400001)(86362001)(1076003)(70206006)(186003)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2878;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0ab56e01-81a4-44e6-971b-08d788978356
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UioaiIvi96Zn8qzc8ZwZIT+gNmxOOYJKdWhO8SKf6JlFW/9QlUqi5p7+L1mxsCriSKbXP9J3c8Bc/JmBz3yklpFGypf5Sao3D8RFKDJwleZuvNCE/+wXz+SERZ8YGc23TFwGP7ajgRLk9NOKdyW8Q81b0plqBU46RnCBPaNueXarywUR7GsVExwMFIsUi2V4v2Ax5I/Od0r62E2H9o4XRp9hHAGVibe35U4786RJin+jC8wEb8hyU3vyejn3hUdGXmAWB6Hvd846YA4ij891UcVRF8pF1LNToIxDO9n2rb9ChMLIp5W5rQ92eMhPX0bEV0u+W3Y/VmNtsRi14fjhWd24UQ1kpZS5/L3nAmEBlXjZSBPG+yICtyPZprHSNojSe4ycv9Bohu5JkEETaB3dRFNiZ1L4mT2LYY7Z0kXAHdz+l1qFgxrJunykah/ouCfV
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:34:31.5771 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd8aebf-5752-4f05-bcdc-08d788978902
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2878
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
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dw_hdmi: The drm_bridge struct is already embedded, so use
a container_of wrapper to access it.

dw-mipi-dsi: The field is unused, remove it.

Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 15 ++++++++-------
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c |  1 -
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 99274ca0fdf6..946aa1af8841 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -196,6 +196,8 @@ struct dw_hdmi {
 	struct cec_notifier *cec_notifier;
 };
 
+#define bridge_to_dw_hdmi(b) container_of((b), struct dw_hdmi, bridge)
+
 #define HDMI_IH_PHY_STAT0_RX_SENSE \
 	(HDMI_IH_PHY_STAT0_RX_SENSE0 | HDMI_IH_PHY_STAT0_RX_SENSE1 | \
 	 HDMI_IH_PHY_STAT0_RX_SENSE2 | HDMI_IH_PHY_STAT0_RX_SENSE3)
@@ -2335,7 +2337,7 @@ static const struct drm_connector_helper_funcs dw_hdmi_connector_helper_funcs =
 
 static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
 {
-	struct dw_hdmi *hdmi = bridge->driver_private;
+	struct dw_hdmi *hdmi = bridge_to_dw_hdmi(bridge);
 	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_connector *connector = &hdmi->connector;
 	struct cec_connector_info conn_info;
@@ -2372,7 +2374,7 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
 
 static void dw_hdmi_bridge_detach(struct drm_bridge *bridge)
 {
-	struct dw_hdmi *hdmi = bridge->driver_private;
+	struct dw_hdmi *hdmi = bridge_to_dw_hdmi(bridge);
 
 	mutex_lock(&hdmi->cec_notifier_mutex);
 	cec_notifier_conn_unregister(hdmi->cec_notifier);
@@ -2384,7 +2386,7 @@ static enum drm_mode_status
 dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 			  const struct drm_display_mode *mode)
 {
-	struct dw_hdmi *hdmi = bridge->driver_private;
+	struct dw_hdmi *hdmi = bridge_to_dw_hdmi(bridge);
 	struct drm_connector *connector = &hdmi->connector;
 	enum drm_mode_status mode_status = MODE_OK;
 
@@ -2402,7 +2404,7 @@ static void dw_hdmi_bridge_mode_set(struct drm_bridge *bridge,
 				    const struct drm_display_mode *orig_mode,
 				    const struct drm_display_mode *mode)
 {
-	struct dw_hdmi *hdmi = bridge->driver_private;
+	struct dw_hdmi *hdmi = bridge_to_dw_hdmi(bridge);
 
 	mutex_lock(&hdmi->mutex);
 
@@ -2414,7 +2416,7 @@ static void dw_hdmi_bridge_mode_set(struct drm_bridge *bridge,
 
 static void dw_hdmi_bridge_disable(struct drm_bridge *bridge)
 {
-	struct dw_hdmi *hdmi = bridge->driver_private;
+	struct dw_hdmi *hdmi = bridge_to_dw_hdmi(bridge);
 
 	mutex_lock(&hdmi->mutex);
 	hdmi->disabled = true;
@@ -2425,7 +2427,7 @@ static void dw_hdmi_bridge_disable(struct drm_bridge *bridge)
 
 static void dw_hdmi_bridge_enable(struct drm_bridge *bridge)
 {
-	struct dw_hdmi *hdmi = bridge->driver_private;
+	struct dw_hdmi *hdmi = bridge_to_dw_hdmi(bridge);
 
 	mutex_lock(&hdmi->mutex);
 	hdmi->disabled = false;
@@ -2898,7 +2900,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
 			hdmi->ddc = NULL;
 	}
 
-	hdmi->bridge.driver_private = hdmi;
 	hdmi->bridge.funcs = &dw_hdmi_bridge_funcs;
 #ifdef CONFIG_OF
 	hdmi->bridge.of_node = pdev->dev.of_node;
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index b18351b6760a..3aa4f9289416 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -1064,7 +1064,6 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 		return ERR_PTR(ret);
 	}
 
-	dsi->bridge.driver_private = dsi;
 	dsi->bridge.funcs = &dw_mipi_dsi_bridge_funcs;
 #ifdef CONFIG_OF
 	dsi->bridge.of_node = pdev->dev.of_node;
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
