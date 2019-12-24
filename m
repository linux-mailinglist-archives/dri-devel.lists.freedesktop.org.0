Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DB512A757
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1536E2D7;
	Wed, 25 Dec 2019 10:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::61c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8FA89DA3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 17:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aawaic+7F9JxuHcXn/LveVUKjL6TBezQVbgQSBWd5jw=;
 b=X0JPwCEYU9IiEM99tpyztROfHShsL0+cdRnGcje4fu8BWimKT/ReJHp4LBq8diDGEdiONjvisjEwtgbTVUmagDZMV6eo3mzlZ73Cobz63zl9YNHPcVUFFVr/VTuBUgYBy8bA8zjH/J2ZEdYGe59Nv7UfPSj+gQ5O7HEBAVYzDwg=
Received: from AM6PR08CA0024.eurprd08.prod.outlook.com (2603:10a6:20b:b2::36)
 by DB6PR0802MB2296.eurprd08.prod.outlook.com (2603:10a6:4:87::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11; Tue, 24 Dec
 2019 17:35:30 +0000
Received: from AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::208) by AM6PR08CA0024.outlook.office365.com
 (2603:10a6:20b:b2::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14 via Frontend
 Transport; Tue, 24 Dec 2019 17:35:30 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT051.mail.protection.outlook.com (10.152.16.246) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:35:30 +0000
Received: ("Tessian outbound 28955e0c1ca8:v40");
 Tue, 24 Dec 2019 17:35:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f874434845d6cb7d
X-CR-MTA-TID: 64aa7808
Received: from 2398bdd0a748.6
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 64153F3C-3911-45CA-AEE2-3284817689BB.1; 
 Tue, 24 Dec 2019 17:35:25 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2398bdd0a748.6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:35:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQZe7+y40eK4v2MVKdPjI4R3EnPJftMsYARUjHxBKq+d20PiDGwzzCUiZAW4GZ3UjSh65gYgpR8thPN+LUk7tcS8WFiTR3KcPuSHRSsyOeo71cbG9o3eMo1xfrlwvX3cNDZhRSXCzP6/vI0rKNuYtbwXsAee47Sj4aSbU1HFqu+DEpSHZCZWKFbtW3AiElINlj8t1LUeHDjleWy44DpaMWs37CYGtmo8DJYtGYpIIwGYhj+M0HqBXOPgCdC9FTfQKCl423UJtaW31U7E5XelWlXYQH0Wjs/yT0DCl11GBejzKrJy1FL1fED8LJYd2hCJC9KfsPvK2bW4EBe0xRzd/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aawaic+7F9JxuHcXn/LveVUKjL6TBezQVbgQSBWd5jw=;
 b=ir1daXCuMT8RuIPlKBHWZnEXJPm0ZQWvPtEQ6Oj9Aroi14gwTJd8EnWBLrphoFnEyk9YLVWWOhy6kx8KncMJ7V/Sp0dHlGCgBZRLXWSJPj6itAciMkvo7GYhJa9HcyiG0njJY2GKzzYMGUx3vUYqQnixJa5I9KUUoR327Aff81oVfMctlA9k/9NciKnQnbPM3iNQalpExGvvGdD7T4T260JheWD1dd+htabRvs0QcqsbxyOIO9icwNdhh0Xo1yxtvd7yOaN3mt+lnoHvlRQ6pyKAiWLmBE/rbct+7wxwHEJOJK5fexzop4JtlWicDjWvijJ02qJgYcTfqnxIAp6u6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aawaic+7F9JxuHcXn/LveVUKjL6TBezQVbgQSBWd5jw=;
 b=X0JPwCEYU9IiEM99tpyztROfHShsL0+cdRnGcje4fu8BWimKT/ReJHp4LBq8diDGEdiONjvisjEwtgbTVUmagDZMV6eo3mzlZ73Cobz63zl9YNHPcVUFFVr/VTuBUgYBy8bA8zjH/J2ZEdYGe59Nv7UfPSj+gQ5O7HEBAVYzDwg=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2672.eurprd08.prod.outlook.com (10.170.238.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.16; Tue, 24 Dec 2019 17:35:21 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:35:21 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 32/35] drm/mediatek: hdmi: Use drm_bridge_init()
Thread-Topic: [PATCH v3 32/35] drm/mediatek: hdmi: Use drm_bridge_init()
Thread-Index: AQHVuoBzYhz6qpsZD02IuqSUEsF2WA==
Date: Tue, 24 Dec 2019 17:34:52 +0000
Message-ID: <20191224173408.25624-33-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0c0a51ad-8f80-452b-1bc8-08d78897ac54
X-MS-TrafficTypeDiagnostic: VI1PR08MB2672:|VI1PR08MB2672:|DB6PR0802MB2296:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0802MB2296A74F25F1F17ECB8FE5C18F290@DB6PR0802MB2296.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:324;OLM:324;
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
X-Microsoft-Antispam-Message-Info-Original: cV27tvp6q+UWLP46VckiQyvP5aTwvS1N1FO//Sa1bQJtMVlJg0cCX6ZqfFddtvAqYTplJUk37WTAVi8T6TfQz+2ruixxI07udErqpndpSY720uOIIC0bqnqKiaOX4WALtDvRJXJg+FnIhYxhIhqMtdwWIiLM9erAlJm8HnHNC40wen+Bt0XrYQXBoUKbzsDKMkTcdzVdWYumK03P9Ffyo8ODpshCV+LKWUlTltdJIvX4gZ9/jyZ6wXkIQ2TQb5A34OwDlHSHZ9brSumYMU372Et5d71f6nDvo2ryunf+TWarZYw/SzSIZ9s4LLqxIJv4uudzf8O1f3P2t5Nc0uzB40bJ3S9FwZEtDU32PJmvZnjeoZ5sw+JUR8bobNfPmRDpJdYD/aLhyaRgr+tcHsATB4LKY9eUmH0mAuVjo+2mNLJkJHyxj9LYtbNxnZY857bb
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2672
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(136003)(39860400002)(189003)(199004)(478600001)(6916009)(36906005)(6486002)(6512007)(336012)(54906003)(316002)(36756003)(26826003)(4326008)(4744005)(1076003)(5660300002)(81166006)(8676002)(81156014)(8936002)(86362001)(76130400001)(2906002)(107886003)(70586007)(70206006)(26005)(186003)(356004)(2616005)(6666004)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0802MB2296;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 15250682-1cb5-4aa6-b4b9-08d78897956a
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o7xsMY4K8NkaSgkU3dhgDXhDpYAAV/Qf4d0UDX9H3Meuaxc4Ik8NBYx62hkT5IzzUolxJTHq7wfs8svcW/pq5RRBGPUcl6dCpaUVEBJlzR3rpU9fUTDX3bDYp1LMso7PLsFcZ2t9pc6tE+VitkC1XqAVYEChF/4yMA9Zf+f46NPrzowx4Jcp8EeNFqq9RnelAT4gveTxF89HCgY5QoieMgAY8HRRrVOX77c0aXcAVD516cCFHTdt6Hwpx/J+MiV6s+nwV+zj0F813fZipWX0v7Tt3gOx2cYPP2F/CjS53WaqTvgV7V+oaOBngCuw/oIB/hVQSRad8vRzxZluUd73mOIDlz074QKlrbGLnKcvuF9HZzEXzu0t2ykfF/JhrMsb+eNeA+qBmUVnjzHI4StZ3evc4ZMw+zMFxcC2C58pLJPXZhROGyquSzVWn+OJ4Gzw
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:35:30.8256 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0a51ad-8f80-452b-1bc8-08d78897ac54
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2296
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
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional change.

v3:
 - drop driver_private argument (Laurent)

Acked-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 5e4a4dbda443..a5fd2b68e407 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1710,8 +1710,8 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
 
 	mtk_hdmi_register_audio_driver(dev);
 
-	hdmi->bridge.funcs = &mtk_hdmi_bridge_funcs;
-	hdmi->bridge.of_node = pdev->dev.of_node;
+	drm_bridge_init(&hdmi->bridge, &pdev->dev, &mtk_hdmi_bridge_funcs,
+			NULL);
 	drm_bridge_add(&hdmi->bridge);
 
 	ret = mtk_hdmi_clk_enable_audio(hdmi);
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
