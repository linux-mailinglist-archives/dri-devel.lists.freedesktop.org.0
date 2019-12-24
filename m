Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5953C12A750
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:20:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135626E212;
	Wed, 25 Dec 2019 10:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10076.outbound.protection.outlook.com [40.107.1.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDE36E359
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 17:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74Er7HGJjw1Cwr3bFeUYspIQ5XLO7ZkancZfqNVar4k=;
 b=ycDhivftC93rR0pUMxG/HoLSv+0QxEXBdqMe9UPYQm9AFHFunOuREpJMIQvqsj6kTlk3rGmfmTCT3DChLCc+b70XVPaLbEFVND7w1qPi7Op/oI6Rrba99b2S0MN89LPnYhaen83P2YbGV5AO+wD5Xh7A+vzxWtChni+er8Mb/DU=
Received: from VI1PR0801CA0071.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::15) by DB8PR08MB5211.eurprd08.prod.outlook.com
 (2603:10a6:10:ed::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14; Tue, 24 Dec
 2019 17:34:47 +0000
Received: from AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::208) by VI1PR0801CA0071.outlook.office365.com
 (2603:10a6:800:7d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.15 via Frontend
 Transport; Tue, 24 Dec 2019 17:34:47 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT003.mail.protection.outlook.com (10.152.16.149) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:34:47 +0000
Received: ("Tessian outbound 0eaff1016ea4:v40");
 Tue, 24 Dec 2019 17:34:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 647041dd202bc325
X-CR-MTA-TID: 64aa7808
Received: from bdd2edd0996c.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9028DC3C-AB21-4F1A-B25C-9CF4DAA2E21F.1; 
 Tue, 24 Dec 2019 17:34:41 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bdd2edd0996c.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:34:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KI4mP7Zw9NfJlvIFdK/6Hw1lgCUogkxFtWp9y0c8Yw57lstS1MAHl3gW03QBqxRWSXrLw0MvIZgu2JJ9ajaww3UGKZdWDgLeRMwUbrTo+e6oBObaJOwqtPMA0IiL4jwnaENFMmqfNqlnNdDM9J9HvPrzy/vZjHPxGw7a7uhzL9fVQEwHW4PYjpKJoVX27SkGYWvj+RxGg99yf5DC6yqrGaCQT5TL7AilCLZQM6a6dqwpclcR5xIjfcWYQL83ZcomyVYcDu4gxxI2gJehts7AyZbJcgDquJBt0rPvMtWwLZhIoAn8jmI2Vk9BhOWsvvDSDduZoTkDEz7NFPT0X85Dwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74Er7HGJjw1Cwr3bFeUYspIQ5XLO7ZkancZfqNVar4k=;
 b=Dzn2y/ri5z5XeRXQhsq7x3yNJjMVgE8gmd1Di8DpY2v3JhaZxwhNPPMn2VFhrmLtSOLci2ykpI2hk35mCvMd4gddlIH7c4/NLGQ2wng4O8As+zbLow+Ljr22BEFiQaRMGq5tqxzqrvcxEN68ej4njNBdmFE5lH6pDm8QbfA2ttdf0EyVL1yV5IsOKqjyToQ+kITK8rb//1T80hIQgytD5l0NE8Thlp0P+MQIQc+bIP7J4Cr3IM2nG+eeMgOD6CJ9CROJUwP98hv7jGIKvIiPBtrfmuNsXY6SU7vAVwvgb0dKV1FXVQKdAG+u3rJBgXSPv2GEyM9wshUan0U6GQ5bRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74Er7HGJjw1Cwr3bFeUYspIQ5XLO7ZkancZfqNVar4k=;
 b=ycDhivftC93rR0pUMxG/HoLSv+0QxEXBdqMe9UPYQm9AFHFunOuREpJMIQvqsj6kTlk3rGmfmTCT3DChLCc+b70XVPaLbEFVND7w1qPi7Op/oI6Rrba99b2S0MN89LPnYhaen83P2YbGV5AO+wD5Xh7A+vzxWtChni+er8Mb/DU=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2672.eurprd08.prod.outlook.com (10.170.238.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.16; Tue, 24 Dec 2019 17:34:37 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:34:37 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 17/35] drm/bridge: panel: Use drm_bridge_init()
Thread-Topic: [PATCH v3 17/35] drm/bridge: panel: Use drm_bridge_init()
Thread-Index: AQHVuoBpmY1c5Klab0qW7+hkdLtpeg==
Date: Tue, 24 Dec 2019 17:34:36 +0000
Message-ID: <20191224173408.25624-18-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8ec7e224-1a92-4a21-81fc-08d788979242
X-MS-TrafficTypeDiagnostic: VI1PR08MB2672:|VI1PR08MB2672:|DB8PR08MB5211:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB5211D3159655813BB1B29C1A8F290@DB8PR08MB5211.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:176;OLM:176;
x-forefront-prvs: 0261CCEEDF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(199004)(189003)(186003)(26005)(52116002)(6506007)(6486002)(81166006)(6512007)(81156014)(8676002)(8936002)(44832011)(54906003)(478600001)(316002)(6916009)(2906002)(4326008)(2616005)(36756003)(1076003)(66446008)(64756008)(66556008)(66476007)(66946007)(4744005)(5660300002)(71200400001)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2672;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: wcWghvz8NiLzq2Z4JNRdzJSi6cUehBlsWaz11eEnoc9pwHtxzRyYd1CtlSX++gL/dTS99opXownq0zeImIzScv5pw/1IWIv8FtmWv5c36QHr0DmL2qOIyvJCwkTXtWY+sTqFurGJuAyLsgVsJ1M3ZU9Yo2qMgdtuzANtaRG05021GckZGDbMTjf8kHAkIUfRFT1xFsEC/6jzgGb0iuzqbH70nxwHTjlxbVNo7z5nj4e1CjdX34DQkl+yZnXR7ED6L3MGB9NhYs1vMkG9buIVN8b0bMvjFSba3hnTw0rlS4DhUYEo84SfkWqTqRLPLcrvTHETjG87eYAszlkI2ZqWZw8/L4omxWWPqZCpnNa38yk7Fddjyt+t+acBwCm98Qg0gkLzUPX+QzM3sC5nmpp9l2SkL/p13QuLIsliCYYv63cGTof4D/xay++qm/gxcNlV
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2672
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(396003)(39860400002)(189003)(199004)(81156014)(107886003)(8676002)(356004)(70206006)(186003)(26005)(2616005)(478600001)(336012)(8936002)(36756003)(4326008)(6506007)(81166006)(26826003)(2906002)(1076003)(6512007)(54906003)(5660300002)(316002)(70586007)(6916009)(36906005)(6486002)(86362001)(4744005)(76130400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB5211;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: bb5b6ea5-0a63-4a85-fe16-08d788978c0d
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mvWDUzeDirQZOhtmtUrvx9CnexMYez/2mWytGHSW10XxZvLR+E5hG5JkVzulxJa96mg+oYnHcJBFeInegasJt0UUsr4AEnG4LoTj42P+pPDXkOuRQhviNdo8n1G9UuyLycBrmBeLE/id3z/N03ncVyiybkb8Ok/BwNVkJBUKH8N+vI6sbtk3AMVykbxoqmIDxUxTO5hfLGYmjmGmaGgtxj3VJx2PW0VHIYSWGJXC28Z3UI1FWt9m+7lwEy9gevoBLs1d5Rz0UIEVGtrABYdAzjOIQzftSaSIbLResQLnVRC18YfBLfBy3v6wxA701r6UAigMiGaT5MhNfE6Gcz4N4F19CpbwI40il4o/BiN0w0WHuNZmSLQq1v0zXicbI/8dfNXuf50/AV5eywVRGq4+Q2FNzMkXxfsqTmxwOVPLVKDDJyigAIR517wEVUx4KeUA
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:34:47.0915 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec7e224-1a92-4a21-81fc-08d788979242
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5211
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional change.

v3:
 - drop driver_private argument (Laurent)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/bridge/panel.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 4ba4e9d9537a..b8a87a4956b6 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -192,11 +192,8 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
 	panel_bridge->connector_type = connector_type;
 	panel_bridge->panel = panel;
 
-	panel_bridge->bridge.funcs = &panel_bridge_bridge_funcs;
-#ifdef CONFIG_OF
-	panel_bridge->bridge.of_node = panel->dev->of_node;
-#endif
-
+	drm_bridge_init(&panel_bridge->bridge, panel->dev,
+			&panel_bridge_bridge_funcs, NULL);
 	drm_bridge_add(&panel_bridge->bridge);
 
 	return &panel_bridge->bridge;
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
