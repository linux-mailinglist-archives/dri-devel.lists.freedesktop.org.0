Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E21DA12A758
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:21:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632606E365;
	Wed, 25 Dec 2019 10:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70049.outbound.protection.outlook.com [40.107.7.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9356E358
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 17:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnfS47iHXpzx6sxAqOtbtIbu7X0P1v8fJ9luy5E/qKU=;
 b=td2erWyAbEbcpwoN55M57FuHctDvJyKYN82v/JmDG16cc/7PLglaPQglxjyIsnIWf7pipBv+E8cXE+R00McQwMCM1TaAuLEzJC0GOOWnph+fhwjOe6Om9n4ASbiW56/ssRN+VitKVMsv+bbz+a2TLD5Tp/HEIyZh2UTli1P6M0s=
Received: from VI1PR08CA0090.eurprd08.prod.outlook.com (2603:10a6:800:d3::16)
 by AM6PR08MB4454.eurprd08.prod.outlook.com (2603:10a6:20b:bf::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14; Tue, 24 Dec
 2019 17:34:58 +0000
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::208) by VI1PR08CA0090.outlook.office365.com
 (2603:10a6:800:d3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.15 via Frontend
 Transport; Tue, 24 Dec 2019 17:34:58 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:34:58 +0000
Received: ("Tessian outbound e09e55c05044:v40");
 Tue, 24 Dec 2019 17:34:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9d3a1bdd31e541b2
X-CR-MTA-TID: 64aa7808
Received: from bdd2edd0996c.17
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C55D55F3-DDD8-4DE0-9C1D-C3FC67248690.1; 
 Tue, 24 Dec 2019 17:34:53 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 bdd2edd0996c.17 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:34:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcQB8XbgomU20APihe96xG8kWnRoDVzupRzJJ0kACEAOe1D4RDCxJAn96c8hcj0+c4PSINhuz2Vsoma4Jewq4sHAf8iYoIDqw7fkV7xTY23DUiQvtDCbU9ZbmECs7sUmpVrbw9DNVFivDqGjyJWeZKC1ysCN/0Q0VTncKoyrylGfHLIw9CLb1O1O04FCL6e8dl/i8kOSTGgg6TLYTfwj38FAGrOqKsaS1ID/lhgrTYHwkVzWTs+Zxu6hNEI47JXN3Ixsqf+lT40TdevIR9cgEYLp+maWUNIbAhx4z+mUarwV5RIJB2IZwD4wBRJ+OAjKa/rVdNwQU9ku4VCNMa3fCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnfS47iHXpzx6sxAqOtbtIbu7X0P1v8fJ9luy5E/qKU=;
 b=KIE+YVdntT8NAWoykz6TYB4vQEMzlkZ9ZqW0FV2EQKZfpU4I8Rxv41KxjCqaRTpvy+91+VKT8yuDi2okca2ShwbEogsuNH5XjmLVeb4cMyWeIe/9VeevZCeeVBXdTjTL3xWDS0/aOoQFTEDOgdi1vYm+Oy4cqleC+qL8UY+r3cDMmfRX/MfP3OYqQpAYq8+51MBCOVmno1Zhu3oKaBX02FJhobZRArgvzZ6voXUk3XO0Sk51eOOSIOF+wscZ3BcgaIgNioSjW/jS4pDCEj9JLt4aD5z87IpbG+gdFb1QqJoxnmM7xKUGBEDOtHY4lpsNmxtT5y6SwA+Ep5kE06MPSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnfS47iHXpzx6sxAqOtbtIbu7X0P1v8fJ9luy5E/qKU=;
 b=td2erWyAbEbcpwoN55M57FuHctDvJyKYN82v/JmDG16cc/7PLglaPQglxjyIsnIWf7pipBv+E8cXE+R00McQwMCM1TaAuLEzJC0GOOWnph+fhwjOe6Om9n4ASbiW56/ssRN+VitKVMsv+bbz+a2TLD5Tp/HEIyZh2UTli1P6M0s=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2672.eurprd08.prod.outlook.com (10.170.238.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.16; Tue, 24 Dec 2019 17:34:47 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:34:47 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 29/35] drm/exynos: mic: Use drm_bridge_init()
Thread-Topic: [PATCH v3 29/35] drm/exynos: mic: Use drm_bridge_init()
Thread-Index: AQHVuoBvC3rXHYh6JUCmNkUa0coD7A==
Date: Tue, 24 Dec 2019 17:34:47 +0000
Message-ID: <20191224173408.25624-30-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 88e7e29d-6b29-48dc-3fb9-08d788979913
X-MS-TrafficTypeDiagnostic: VI1PR08MB2672:|VI1PR08MB2672:|AM6PR08MB4454:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4454935D957DD395BE4590918F290@AM6PR08MB4454.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:324;OLM:324;
x-forefront-prvs: 0261CCEEDF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(199004)(189003)(186003)(26005)(7416002)(52116002)(6506007)(6486002)(81166006)(6512007)(81156014)(8676002)(8936002)(44832011)(54906003)(478600001)(316002)(6916009)(2906002)(4326008)(2616005)(36756003)(1076003)(66446008)(64756008)(66556008)(66476007)(66946007)(4744005)(5660300002)(71200400001)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2672;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: MJQp0lrj4tzSqzpOH/xk7MDMJ+O+NcL+p+zPzO8ffuCPeZoFftGg/u1DmkpDf/AgASUpFcU8HjZLpCMpcQDMWCnd5XCDZ7F2J1X4Upl9ULzhqocnYOiSYxqEKyW6vlkVz6w9Aq6tQD/JB4g4DU4zZdLhzfdtE2w6MtUYu/3YLKzOCcXffzReZN7TGc2MBfz+fSoCy5eNSTDz3uvKd6vcMNwGVtYeqAUsAg8Vt2WgYaE4cdmgQyGAYqaG8lWtmjb2zrcy2GaP7r/yHlpq1ZG7REYMfn0S9ug+LmJ98eNUBTUu34wtj7jGRiGpLR+atp+L1sKvE4DhfK8B61LR9Ztys2jZV8yV9x9gEgU0X7QsxejEpW6B1er2yyTjHzkVpyfq7lfwmdLLDMMMDOwsuhIZTZ9O6RPShaY4A78zr1TB6rGT9fsAv0YhMY3y/UQDXZHF
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2672
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(396003)(376002)(199004)(189003)(2616005)(54906003)(6486002)(8936002)(26826003)(81166006)(478600001)(356004)(336012)(316002)(2906002)(6512007)(186003)(36906005)(81156014)(26005)(4744005)(76130400001)(4326008)(107886003)(8676002)(5660300002)(70586007)(1076003)(86362001)(36756003)(70206006)(6506007)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4454;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1b4ac4f6-3c22-4f27-a3f6-08d78897922c
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HmXWSjh3UwtiDc54wnjpdmQAq7SujzgXm9wYDZ5CONcXlUtK7fj258ULU+t3MyMarYO7OeMoWoRVHpO4tJNq4aG2D/qpXuPJYJH+xL+zoMxVwOspsm31wy6MCct1TK01osXkrb1nE0xfIpE/anEz7TFTDuVqzMRFOrdY5qyWlIBIql8fuoO2xehQdPWEMHrmYW1QKiuieS1EnMtyG8Oojj3yGNxokb9eOFWVGTGM7zw9Yu2ohXJgbgjovamQaf5ZdLstVXoK2kv67s82bjU7ElL3loX5Iz4f3fRlU2eG7SIRS0GrhDRqZUaVPy6kXKNu9O9t2Hsg5epTQ1sWJoIAbvvGPE6InqKAiQWgR1BMwR99l4FRrHvGprX+y85UpFt4zY9vOyh5ERGIMriM1JQp/eR5jPobzlCmWDijrVGYV3hMdzWbV4EVvh1AUyxn4CF2
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:34:58.5268 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e7e29d-6b29-48dc-3fb9-08d788979913
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4454
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
 David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional change.

v3:
 - drop driver_private argument (Laurent)

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/exynos/exynos_drm_mic.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index 2b5f10c3a285..3bc9f81d0170 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -420,9 +420,7 @@ static int exynos_mic_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mic);
 
-	mic->bridge.funcs = &mic_bridge_funcs;
-	mic->bridge.of_node = dev->of_node;
-
+	drm_bridge_init(&mic->bridge, dev, &mic_bridge_funcs, NULL);
 	drm_bridge_add(&mic->bridge);
 
 	pm_runtime_enable(dev);
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
