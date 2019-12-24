Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F08E12A73A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDFB789FC5;
	Wed, 25 Dec 2019 10:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50077.outbound.protection.outlook.com [40.107.5.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0286E353
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 17:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0jWwWLLMB0S5WuYpGadsNiUw9pXePSigM7IcaavYBY=;
 b=kytft3WLg3kRS8zKHOE09V65fFXdHkaVIfgBAsW49ZubyKHIP4JgRef5ydwPuPq28HBl5i03kwCBNM51z3XnUip5MvsKxhb3/A5IKwpnBcnu74x9pixcYNkcUjeyVdbflEz+0ikRDXUaLINgLY+uup03avQ6ePc+hC6JVRMuMqI=
Received: from VI1PR08CA0159.eurprd08.prod.outlook.com (2603:10a6:800:d1::13)
 by VI1PR08MB4061.eurprd08.prod.outlook.com (2603:10a6:803:e7::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.17; Tue, 24 Dec
 2019 17:34:38 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::200) by VI1PR08CA0159.outlook.office365.com
 (2603:10a6:800:d1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via Frontend
 Transport; Tue, 24 Dec 2019 17:34:38 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:34:37 +0000
Received: ("Tessian outbound e09e55c05044:v40");
 Tue, 24 Dec 2019 17:34:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 98e897c25d104c9a
X-CR-MTA-TID: 64aa7808
Received: from bce15b33d58b.4
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 24AABA8E-B277-4B85-8C75-AA0E9CE6173D.1; 
 Tue, 24 Dec 2019 17:34:32 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bce15b33d58b.4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:34:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=We+cmYLhfn/nQh8VlXETG+ip0ZRcYprQg+3HR+zXeTDbjibY7uW0VeBSpkUy0tVVda+igrWLpsrROyjFQO2BCWZUtLSBZTJDEY9c+SbHBSc5GflEoEYo+YBzndWa4l6fnJi8vsjvYO93lTZD/4hp3ddjPRtPFcNgegUKWsy0sW4xuN7YFd3InbSfTPOVJbXKi95j8qaFMyYAnXY/TISQ6EzlureNl/AWtVeluO40INhsKWDKAuPVXFqyTPvAHwiaJ9DzsitO31tfI481bpecwOSOd9O5Z0Gj8Rko7HzcEwD7ZWJcxRUHE9oixKe1mqNYq9nR6eD8MYLGqkxcfGq0+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0jWwWLLMB0S5WuYpGadsNiUw9pXePSigM7IcaavYBY=;
 b=oEwK1agh7r401T9oR0i6SLdtYa5Dv38Tf9n9OeXIBbnig/65msw40yN8RK0jPXvD4e0XC3fQ7uY1UrXGpN1/ex0qYkORLi7Daxhm2TaQjPamfNV+yMepRr3YPwGBXu2iy+o979dstcQjyzMLA6mCrRDP2mdIL+IFakc/4qJpmrU+zYV2AWIRRzRSu1O+AxHdD1gGibK443f64WyKsaWtvR4P84bTObph9WimrFuItZNcpCZi9GujXCgdQrMDTMeQrvvJkwrUqabpTKyvB/pVEt6njLExjJ0wJOEFjnIS6y08vt08g8WPBboKbJ3oWf5Y/YdAjgilsqjzcOclhTPzng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0jWwWLLMB0S5WuYpGadsNiUw9pXePSigM7IcaavYBY=;
 b=kytft3WLg3kRS8zKHOE09V65fFXdHkaVIfgBAsW49ZubyKHIP4JgRef5ydwPuPq28HBl5i03kwCBNM51z3XnUip5MvsKxhb3/A5IKwpnBcnu74x9pixcYNkcUjeyVdbflEz+0ikRDXUaLINgLY+uup03avQ6ePc+hC6JVRMuMqI=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2702.eurprd08.prod.outlook.com (10.170.239.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Tue, 24 Dec 2019 17:34:30 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:34:30 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 11/35] drm/bridge/analogix: Use drm_bridge_init()
Thread-Topic: [PATCH v3 11/35] drm/bridge/analogix: Use drm_bridge_init()
Thread-Index: AQHVuoBlpOm1s13reUyMoPETVyW9PQ==
Date: Tue, 24 Dec 2019 17:34:30 +0000
Message-ID: <20191224173408.25624-12-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9622674e-c155-450c-ed29-08d788978cd8
X-MS-TrafficTypeDiagnostic: VI1PR08MB2702:|VI1PR08MB2702:|VI1PR08MB4061:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB4061A2FAC2DD79A538DFD1B78F290@VI1PR08MB4061.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3826;OLM:3826;
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
X-Microsoft-Antispam-Message-Info-Original: 670oSzKSuyj3Jef60y6ZI1pM2O7QWQaoVSDHAbqei9FeP7p6z5rsiaxy6Qtcl/lR/gDzY7XaO2F7DFsNjMd48f9VlN0tEYHTPyEvMkLW6NiUsD/h1OK4295C5uBXoPbjcC+yMlZ1HH8240aurjr6KPb5/enWPX024GY1PIhI97xmK0HWPzzJh7sNtxU/j1jDHYRkpZQSN+yk2wVAp7OjOKPSK3fXOa+JUEphBz715+mZ8taZgqQsT9bPlBQfwJC9VCvmAjBcuBy3wDM1Ep7NNDsF6BCFl4SNDqsXFTUsUs5r6MK9j0XjUsJZ7Nh6zFBfr8msLSuRUZ3R5lMwYEjnomB5LXas+jEO/1abJ3Au98vpI4qIpmq8p+ONJtTSZuSs8UMkttG+lyo3uZ8sChpyRN2RlIH9hZKHeEd9yUh3/UTT8iUD1LMHgxlw7+H0ulD0
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2702
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(136003)(396003)(189003)(199004)(2616005)(6916009)(4326008)(70586007)(70206006)(6486002)(6512007)(26826003)(478600001)(36756003)(2906002)(36906005)(76130400001)(8936002)(336012)(107886003)(54906003)(86362001)(316002)(1076003)(356004)(81166006)(6506007)(81156014)(8676002)(5660300002)(186003)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4061;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3d4fb853-b5df-46d2-63eb-08d78897883b
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QP4lS8HejEiVZSeKJw/b904JisStp1aEbyJe3M1/VKUBaRq77OpwD4+R/RdCeddeGuQC3HzMh/xIzNm2zo/cFZVxIjFyV/pWDb74E+Bbnti2ooFlu4tN7/c3MC0IT496SPF/NYyjI8Uzbf8ojTJA+7e0WE7VIRa4iv8jMKhVVkgKv1qWhbkv91ucvXceQG8YNwbIGw825tdvjqxt3AO/K5oBbK+TLE53I1SLatlZQ8rWWwnxDECnQEhIvXA+vehBBzmvakqXg3Ryb1jx72Ci4LqHX2pVdPvT5nMRht7RDfElcd6go0y7FTyhw9ct5YYhFzGrmPchKcFUWX9MBBSipKTLBBaVViQp55FKMpctrxos1v8uiSeA1hgkrdTzaqmEEj/PmL/yvigPHVv+WbkFMLVJGcjqfOhjaCf9vLpzPczrgfxJkqVMCuJI+kUmPxmD
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:34:37.9559 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9622674e-c155-450c-ed29-08d788978cd8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4061
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

No functional change.

The setting of bridge->of_node by drm_bridge_init() in
analogix_dp_core.c is safe, since ->of_node isn't used directly and the
bridge isn't published with drm_bridge_add().

v3:
 - drop driver_private argument (Laurent)
 - pass correct struct device pointer to drm_bridge_init (Laurent)

Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 5 ++---
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 8 ++------
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 8 ++++----
 3 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index 5b806d23fcb3..62404b0f2fc1 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -696,8 +696,6 @@ static int anx6345_i2c_probe(struct i2c_client *client,
 
 	mutex_init(&anx6345->lock);
 
-	anx6345->bridge.of_node = client->dev.of_node;
-
 	anx6345->client = client;
 	i2c_set_clientdata(client, anx6345);
 
@@ -760,7 +758,8 @@ static int anx6345_i2c_probe(struct i2c_client *client,
 	/* Look for supported chip ID */
 	anx6345_poweron(anx6345);
 	if (anx6345_get_chip_id(anx6345)) {
-		anx6345->bridge.funcs = &anx6345_bridge_funcs;
+		drm_bridge_init(&anx6345->bridge, &client->dev,
+				&anx6345_bridge_funcs, NULL);
 		drm_bridge_add(&anx6345->bridge);
 
 		return 0;
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index 7463537950cb..e30df40ec512 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -1214,10 +1214,6 @@ static int anx78xx_i2c_probe(struct i2c_client *client,
 
 	mutex_init(&anx78xx->lock);
 
-#if IS_ENABLED(CONFIG_OF)
-	anx78xx->bridge.of_node = client->dev.of_node;
-#endif
-
 	anx78xx->client = client;
 	i2c_set_clientdata(client, anx78xx);
 
@@ -1321,8 +1317,8 @@ static int anx78xx_i2c_probe(struct i2c_client *client,
 		goto err_poweroff;
 	}
 
-	anx78xx->bridge.funcs = &anx78xx_bridge_funcs;
-
+	drm_bridge_init(&anx78xx->bridge, &client->dev, &anx78xx_bridge_funcs,
+			NULL);
 	drm_bridge_add(&anx78xx->bridge);
 
 	/* If cable is pulled out, just poweroff and wait for HPD event */
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 56ea3be27f2b..29693d48682e 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1571,13 +1571,13 @@ static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
 	.attach = analogix_dp_bridge_attach,
 };
 
-static int analogix_dp_attach_bridge(struct drm_device *drm_dev,
+static int analogix_dp_attach_bridge(struct device *dev,
+				     struct drm_device *drm_dev,
 				     struct analogix_dp_device *dp)
 {
 	int ret;
 
-	dp->bridge.funcs = &analogix_dp_bridge_funcs;
-
+	drm_bridge_init(&dp->bridge, dev, &analogix_dp_bridge_funcs, NULL);
 	ret = drm_bridge_attach(dp->encoder, &dp->bridge, NULL);
 	if (ret)
 		return -EINVAL;
@@ -1745,7 +1745,7 @@ analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
 
 	pm_runtime_enable(dev);
 
-	ret = analogix_dp_attach_bridge(drm_dev, dp);
+	ret = analogix_dp_attach_bridge(dev, drm_dev, dp);
 	if (ret) {
 		DRM_ERROR("failed to attach bridge (%d)\n", ret);
 		goto err_disable_pm_runtime;
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
