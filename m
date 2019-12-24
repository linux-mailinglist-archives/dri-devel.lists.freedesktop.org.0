Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0D512A755
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:20:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29476E1E6;
	Wed, 25 Dec 2019 10:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70075.outbound.protection.outlook.com [40.107.7.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D89989DA3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 17:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/4mLlkITaiqzafmh5tZJUGYkm/G6cc43JjBasQZ2NI=;
 b=GvnExLyE/PeZJXjQI44rThdUgYze2bYdTrIrl+Q6zSrFLqneDxFI4xBJMUOVi7jFuxOcfPXN6qCNRxaTON51pD2eqkjd6DH/XLqaYQ3leIbANjVSJDu7oLKtTdyM2eS8C894XzqQBlZv6ByLw/ms/thJFFkAIRK4ubCFwi4LiWM=
Received: from HE1PR0802CA0017.eurprd08.prod.outlook.com (2603:10a6:3:bd::27)
 by AM6PR08MB4215.eurprd08.prod.outlook.com (2603:10a6:20b:90::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.18; Tue, 24 Dec
 2019 17:35:32 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::206) by HE1PR0802CA0017.outlook.office365.com
 (2603:10a6:3:bd::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14 via Frontend
 Transport; Tue, 24 Dec 2019 17:35:33 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:35:32 +0000
Received: ("Tessian outbound 1da651c29646:v40");
 Tue, 24 Dec 2019 17:35:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6dfe8de81180e841
X-CR-MTA-TID: 64aa7808
Received: from 526b35b85630.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 949A8CC6-31A4-43E4-8C93-E3E920D62B9F.1; 
 Tue, 24 Dec 2019 17:35:27 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 526b35b85630.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:35:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JY2Yx0lXcnwZAeb6d+Se3v298iD9vK6fJgXsKlyoER2W/lR9sr7NLowUE6jXq9Y8jS023dUZmQYTsrlu2RJY53F0pUs1NTSQbvLI+3DJLYdmteXWHdjAlzgpfyCjbJjD64EcD49ot9Ho6NwAxpdStv3LmkyiYmpoxcLCVmB5cZoEBbQ0R3Zh0WNjQ+zFt+lcg9f0c2YQTzwacxUSHMwAfbHpxvBfy1SKL4BoQ+IdGP0CcbwHi4ffrQhRs98qXLcsK+PijMLHD2ajqDzkcg+rBeuQpCcNszG64pUWVxM8eod29x/d1I1ZoxL+QEhyd3IIjk1BW8ED3roKgZcm6zAQNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/4mLlkITaiqzafmh5tZJUGYkm/G6cc43JjBasQZ2NI=;
 b=bmZRbsADyAd2IXXS12fpcgU/n2pHx+b6Ii5pdCAMemxWdiVJPvhm+KgRltDm31grfWBVCYzl5ffz9laROvRw1NyzJ++zW1biS0imlwWrbgLORp920P7wT2Dvd8WBUXFZRaZoQBoP+ilGKvHNuX/JYTwAEjtgWbR9sqIuBMMDwIhwPF2zg/mq0HlwgA9hw5HTDKBr+yuD+7WSHcVV/OLYpReLsIg1MX7/ebrZCOeSM5DdffDf6++RRmlXcazYr1GbTp9Pw+9O3rnUytGyWPCFgoTyls1yNIV1xie3KCTyM3upqBm+rQmfFmEatuupA4i/Y1lli12y9IHuctyEeLhYJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/4mLlkITaiqzafmh5tZJUGYkm/G6cc43JjBasQZ2NI=;
 b=GvnExLyE/PeZJXjQI44rThdUgYze2bYdTrIrl+Q6zSrFLqneDxFI4xBJMUOVi7jFuxOcfPXN6qCNRxaTON51pD2eqkjd6DH/XLqaYQ3leIbANjVSJDu7oLKtTdyM2eS8C894XzqQBlZv6ByLw/ms/thJFFkAIRK4ubCFwi4LiWM=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2672.eurprd08.prod.outlook.com (10.170.238.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.16; Tue, 24 Dec 2019 17:35:22 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:35:22 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 33/35] drm: rcar-du: lvds: Use drm_bridge_init()
Thread-Topic: [PATCH v3 33/35] drm: rcar-du: lvds: Use drm_bridge_init()
Thread-Index: AQHVuoBzbOkhey/GIUWq8XqS7VOsBw==
Date: Tue, 24 Dec 2019 17:34:53 +0000
Message-ID: <20191224173408.25624-34-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3b143703-d2b8-4eaa-6f48-08d78897ad50
X-MS-TrafficTypeDiagnostic: VI1PR08MB2672:|VI1PR08MB2672:|AM6PR08MB4215:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB42151BBDCA00ABF90E96AC4B8F290@AM6PR08MB4215.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:376;OLM:376;
x-forefront-prvs: 0261CCEEDF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(199004)(189003)(186003)(26005)(52116002)(6506007)(6486002)(81166006)(6512007)(81156014)(8676002)(8936002)(44832011)(54906003)(478600001)(316002)(6916009)(2906002)(4326008)(2616005)(36756003)(1076003)(66446008)(64756008)(66556008)(66476007)(66946007)(4744005)(5660300002)(6666004)(71200400001)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2672;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: qxKy7U0RByUEXquqLo6cOlvqE1HhpYa1s3/n9K/Ul05wyR0pnGdOjlEF+GURLUWxrmUPSMberNMNXrwtus287r7bLSXWbfb3tlIfLqpxy064txMcge3E+dLHpbfgLgwUbQ9qkIo9t9mUA/pP+AdN3H9jiphK9+ux3nbrMWpx4OtodgQdCXLiQHGppoSzTB/WTgkVRCq3KfJodWLiquLWM/loRZ53A3/IPs8Iv9tFJwEqOQw+rt57yYsrZumSJm8FSnl8BUpKsQKKPxkMLXMlqxe2VEdoP/UMg8bGJxbTBvStNUS8Thlv0o9oLIKCsnJaLNh8/NyhwlmvMfr+AwlVcaA4oTeV/F6pn3eoKr+Dv4dR7XkudCIUzIlIiiRsmiiElJUgKdi9RpOmaJf3ZpvW55NDAFtRW/l2DjfBkO0/Gt9fzl872lPLQ5VZZt+3o1ms
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2672
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(136003)(39860400002)(189003)(199004)(81156014)(8676002)(2906002)(6666004)(8936002)(81166006)(4326008)(6512007)(6486002)(107886003)(76130400001)(70206006)(54906003)(70586007)(6916009)(356004)(316002)(36906005)(26826003)(4744005)(36756003)(186003)(5660300002)(26005)(478600001)(336012)(2616005)(86362001)(1076003)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4215;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: fd3e83bf-3578-49ff-1eb2-08d78897960d
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bKNIMXT+bWinMbQyLOcd7kLeHJqgXleJs3mp+nvKtqnKF1JhcQsWKCs2JQ5zxI6BJwaC1USSGwCAKMSdx7Rb4Tj5bBRU69vtX6QC2fIDPpCzsBNRBN/sS9asUUMzECco1j7nZW0U0Jt3HlGeYFB61wzJCEUQ6+xH6DBLi+3qCY2IuN7xEs4vFAUhq1AbFLR4wB6Z1pCfpDsOdkiXeUkMoDwM6NlfBdKqbELve6R7TnTrkydNx4IOyldUSJ0wsJ8eUOkW3IiirTSFNhJ7Wh+8W4aRWxfMKN6GRsFC3GPD39LoEXKpL0DngFv16StLOer8zIODNO0p1WZ6j1mjLpQ7ZxbjQbg4LezL5kKDOE3hiUtc8/z82KcmYzXhChtVGXjodU2FYi38SYlId/Njt8l/cPO7xHXvp9BP1W4w10jfwMBOJOqy8zdlw3EqZFRgF0Zi
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:35:32.3912 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b143703-d2b8-4eaa-6f48-08d78897ad50
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4215
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional change.

v3:
 - drop driver_private argument (Laurent)

Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 1d6dfae8a200..30e284c3d189 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -882,8 +882,7 @@ static int rcar_lvds_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	lvds->bridge.funcs = &rcar_lvds_bridge_ops;
-	lvds->bridge.of_node = pdev->dev.of_node;
+	drm_bridge_init(&lvds->bridge, &pdev->dev, &rcar_lvds_bridge_ops, NULL);
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	lvds->mmio = devm_ioremap_resource(&pdev->dev, mem);
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
