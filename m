Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D19012A754
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:20:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF516E2D1;
	Wed, 25 Dec 2019 10:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DDE6E353
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 17:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EVvXSzX8SkIMS+Anlo3xRslnuu0TmdGIPM6m5znj/8=;
 b=EA++qB1tkVig23Uigp387/0FfvVVJ4h9e7p7IP+dp9Rn35FMpCnyzMJK8vyYDtXzbcCTHj5WEQNsnV94UUspQV6pk38G2ioasKzUsNFJnIiZGcVVYpplo7ahFt1Qtn3UXxkITZzPM8ZJVuVecje9RmLVh2V1KI6K5cwZ4fFYGG4=
Received: from VI1PR08CA0089.eurprd08.prod.outlook.com (2603:10a6:800:d3::15)
 by AM0PR08MB4612.eurprd08.prod.outlook.com (2603:10a6:208:105::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14; Tue, 24 Dec
 2019 17:34:51 +0000
Received: from AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::206) by VI1PR08CA0089.outlook.office365.com
 (2603:10a6:800:d3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.15 via Frontend
 Transport; Tue, 24 Dec 2019 17:34:51 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT016.mail.protection.outlook.com (10.152.16.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:34:50 +0000
Received: ("Tessian outbound ba41a0333779:v40");
 Tue, 24 Dec 2019 17:34:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 35f8ef058319cd54
X-CR-MTA-TID: 64aa7808
Received: from bdd2edd0996c.8
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C8A0404D-14E9-45DE-9173-78065C85E900.1; 
 Tue, 24 Dec 2019 17:34:45 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bdd2edd0996c.8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:34:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPXIIMWd3ItmIxkZTXJqEMKaaiV4xBlRxYq5LQS8q26Kjxk0U0YAEAexSWUQPQ6odvZU9KC2fmXW9NSUBf16p+OAyz7PkULoTRn7HvXoCfArqiD2X9aMfyKWWfsXaCxBJeu8lQT3xAzmvTmWIuN9lLqVE48HrprOyRGz7yIyH+tCLrKPLEXtTFRYFmBwiaMr571ZL1hiHlhfoPiooxNmdjXyx++T0KqEuew02EREgR4ViadykJs5GhqM116YaNPNlnOUQwB+z827d/TENI64tqeeuT5RxjejrgQRWIrkWk0yxqHrb7eCWL2ZPRazoPfBi5oqk88UOGMZuseQmE5zVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EVvXSzX8SkIMS+Anlo3xRslnuu0TmdGIPM6m5znj/8=;
 b=Vp6QTLThOaMFY/b5gCh8lYaE3hBNsVA0vSdfHnZbCky4ScpOiGk70u18mFv+85fVyyhqcZfSdlKvY1nSA4xzL2HWGx9zIQPSYbjXZeen8rcV3IXzTAeMVYk3yhYxLaG9X8yzlVwEyAk15e0VvJAfOKzKvCRkUbbLqkuEtpREXALigvoLYeRtgYlf6xhOfy4m7vZlgcoph0qlMPd6+vxvq6G5FlqwQ7mpnNB2D9DoX3jpUj86+eC30EVuLvyODqXeWJ7IXJt48TWdR2xTP3iUA+spUu0iBZtWrooBpaInLkj/XGhPQOilDTzHzUiiSIr6Y4ojy3bjqOnzBWmTsTPx5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EVvXSzX8SkIMS+Anlo3xRslnuu0TmdGIPM6m5znj/8=;
 b=EA++qB1tkVig23Uigp387/0FfvVVJ4h9e7p7IP+dp9Rn35FMpCnyzMJK8vyYDtXzbcCTHj5WEQNsnV94UUspQV6pk38G2ioasKzUsNFJnIiZGcVVYpplo7ahFt1Qtn3UXxkITZzPM8ZJVuVecje9RmLVh2V1KI6K5cwZ4fFYGG4=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2672.eurprd08.prod.outlook.com (10.170.238.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.16; Tue, 24 Dec 2019 17:34:39 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:34:39 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 20/35] drm/bridge: sii9234: Use drm_bridge_init()
Thread-Topic: [PATCH v3 20/35] drm/bridge: sii9234: Use drm_bridge_init()
Thread-Index: AQHVuoBrbjmmu9/dQUmnvg8+r41VAQ==
Date: Tue, 24 Dec 2019 17:34:39 +0000
Message-ID: <20191224173408.25624-21-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 701214f2-dd7d-4c20-69f8-08d7889794a9
X-MS-TrafficTypeDiagnostic: VI1PR08MB2672:|VI1PR08MB2672:|AM0PR08MB4612:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB46128ACF13C5EFF1AD01C21C8F290@AM0PR08MB4612.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:131;OLM:131;
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
X-Microsoft-Antispam-Message-Info-Original: 0i2JEJ/6Ev3EbLun6cxcSCZd21PL3SQZeKDGljoTdLkQAHuAozdwjDWcC6dku62tsbNSkFS4u6GkFpJb3z251bZp/DVG4g/BqC75Nm4s2XnpLbLNa4QhemIWev53h780AdmdySPm03FgdhkamAchAajFHH3xgwDVS2xvAzt9eqXvXfh1lInmL5FnUvpuluFH1GMc6HMe5/7+r25jVPn53apk+Bjv31CeInlzOTXm6UiZ0xk69+nhrc/zxnxQxRvJAMjLnIDaZLry2l6ieBbNWj9zQNo58JTrR1XqTF8PVCMCMfU1/pqhyLz98ZUwXXwcUzUs/9AOUODuhbcQ6zV4Zjjju66aphqPetYnoMw0KweacfEvSFsMmKC+LYKH6wfpJ9RJTEh51QyoMsCkhmcE+i8XVbTqvT7mz5+hmRKxCWYi+jKIxuS1KnxAag0JJb7K
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2672
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(136003)(396003)(189003)(199004)(6506007)(70206006)(1076003)(4744005)(107886003)(54906003)(26005)(86362001)(316002)(70586007)(186003)(2616005)(76130400001)(5660300002)(356004)(6916009)(36756003)(4326008)(8676002)(81156014)(478600001)(6486002)(26826003)(6512007)(336012)(8936002)(2906002)(81166006)(36906005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4612;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: aa1150a3-f9aa-433d-162d-08d788978da6
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uPAAKnaOXptDDA0ZXOuS6JnC/iNCeFbMiT/GRHUo5bw4jSbG9xysDYbPRlQ9MxRnOh96Bvdvse1i/jEuB5zSkcY7g4vLxcD/mPsgn9WbLd4bOWRdf+42feRyxroGA/AxUFPGNB5J+ZrepK/s521v74Qof7mVu5ISIyBMBvBtJcJHmLQLfrE3Z53fEwXRgx8+X5l7d5iUOe+ezOexyaiMXqStV9x2+9haTICqMhOLWlt0G5rzWi/v2HIXEB6HTK3VF+z80G0LDKBAJO8bXh5TON/XnYk9cqm9MsbwR7Faf88zn458MVv91runNeCvuB+eceoWSDovrg4Xp53WmTam0rW0Fkqa534af6TnOCY+Kob4I/6g3b8KkCknPxSeebbo9qarnrBUgN14QrpNAziJh84vssoTsGeptQ5DFIFdYx357SkPHfgF/psAN1+XkRFk
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:34:50.9642 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 701214f2-dd7d-4c20-69f8-08d7889794a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4612
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

v3:
 - drop driver_private argument (Laurent)
 - update commit title prefix (Neil)

Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/bridge/sii9234.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index f81f81b7051f..108cff6c87b7 100644
--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -925,8 +925,7 @@ static int sii9234_probe(struct i2c_client *client,
 
 	i2c_set_clientdata(client, ctx);
 
-	ctx->bridge.funcs = &sii9234_bridge_funcs;
-	ctx->bridge.of_node = dev->of_node;
+	drm_bridge_init(&ctx->bridge, dev, &sii9234_bridge_funcs, NULL);
 	drm_bridge_add(&ctx->bridge);
 
 	sii9234_cable_in(ctx);
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
