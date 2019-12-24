Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2218D12A741
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:20:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3A589CE2;
	Wed, 25 Dec 2019 10:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::603])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4E689F08
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 17:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSddLAR0jflJWpR96m9UopNDehVW1WTXbYCakstnGSw=;
 b=ZNt0E1DdbOdir9Wr539J/nq9wkWrhKT13KJQbM71cMh9LmbNPcj1WIGMDAoURqxT48+2ix6OZNvo1rlJ4CSGLmKPI+Lgk5wder21nOKqfH2u0U6a6OuQYuKIEQaqOZzMNpaiCxMtyNx2WFmHEVuvD60qAgpqLgm048ziM+t1vYw=
Received: from HE1PR0802CA0023.eurprd08.prod.outlook.com (2603:10a6:3:bd::33)
 by DB6PR0801MB1749.eurprd08.prod.outlook.com (2603:10a6:4:3b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.15; Tue, 24 Dec
 2019 17:35:30 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::203) by HE1PR0802CA0023.outlook.office365.com
 (2603:10a6:3:bd::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.15 via Frontend
 Transport; Tue, 24 Dec 2019 17:35:30 +0000
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
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:35:29 +0000
Received: ("Tessian outbound 1da651c29646:v40");
 Tue, 24 Dec 2019 17:35:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c5c057ceb54fda99
X-CR-MTA-TID: 64aa7808
Received: from 2398bdd0a748.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4C63363E-CD39-4084-AE0F-DC5D74A3041D.1; 
 Tue, 24 Dec 2019 17:35:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2398bdd0a748.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:35:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVm4S9XfB02kG7qv+RibhEC5JRCGJL1c36mX6xZA1gEvXNsziCjag1hF5uVDmuepoj2NF3igMR8I0q8CHRV/USbsPC/doQHPEpFz1DfwZ/g3Vq3/sQiPl+tvveimsVSCeyPLhJbubvCwdWnzHsUFd8ejduGzhpvInS7TXXAeN4NOVaFRUBVw/soBMMUax5XgAcRRTcQ0Tj433en007CDpuvwwRrBExVls1E0rLxwgcMYQNRJgkF/9zRnIykFd6Aals7Lld5XiQ7HAzOTFuyZxwxe4KQSviIQ5iBm/ZBYFOWfniBAgwRHAh6sEebMfRNuDPPi6I/8c21QrDDd5nxrsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSddLAR0jflJWpR96m9UopNDehVW1WTXbYCakstnGSw=;
 b=Q9VE7aZ+5bV4HCVRPzV7+Da4b6DyEgpbaRae1++AVkhiyHJw65cRPmlXaJdMigi/16PCM8e4lklYoOqaIDBfyLU9Ho+X3ZX1d7AVW8acbDTzviIuTLapjXZ9O/i4LWlcEUKhs71W4l7Q/OpQLT1eGdF5fYOY0PrVRrauaDw2izl+zfUgv2M5mfIsPO52S5vW+4dWw5ahvtTjHFXElioVRy46enPusQH6yKpEPr/pEioyeS4SCRc/ufoAvEP9vgPPNwuTdbX9jR6JdwD4OCrBJRES8jEbb6DKcnpe0cUAkNu1XODCfQQuUg4KnxUhD8JP7f0BRFwADXKlvuMuhQsOLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSddLAR0jflJWpR96m9UopNDehVW1WTXbYCakstnGSw=;
 b=ZNt0E1DdbOdir9Wr539J/nq9wkWrhKT13KJQbM71cMh9LmbNPcj1WIGMDAoURqxT48+2ix6OZNvo1rlJ4CSGLmKPI+Lgk5wder21nOKqfH2u0U6a6OuQYuKIEQaqOZzMNpaiCxMtyNx2WFmHEVuvD60qAgpqLgm048ziM+t1vYw=
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
Subject: [PATCH v3 31/35] drm/mcde: dsi: Use drm_bridge_init()
Thread-Topic: [PATCH v3 31/35] drm/mcde: dsi: Use drm_bridge_init()
Thread-Index: AQHVuoByEOZJRE0520qmoz8x9vCV0g==
Date: Tue, 24 Dec 2019 17:34:51 +0000
Message-ID: <20191224173408.25624-32-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: c549cacd-ca5b-4156-7e1a-08d78897ab96
X-MS-TrafficTypeDiagnostic: VI1PR08MB2672:|VI1PR08MB2672:|DB6PR0801MB1749:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB17495131918D77F399FFEA6F8F290@DB6PR0801MB1749.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1360;OLM:1360;
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
X-Microsoft-Antispam-Message-Info-Original: RIlK0vxYm6M7TdWnoxPff4rBU6qP312fISfo5lEZJzMzS3BrREzuvMuZbnovXVwLs1r2Pbn2jmyqHWsxkSToBiMOFWzrNDg0Ba3cFifsu4ljVnaHZF3PHPb2iKH5SCUppxorwZdt5ionMtHTAfBk4CP/db21sqUDLLNGQgMcirNI5I1GaeDx32SkXYNlIVz/A/NSTCBQ4FFiv2rCetiiIw19iCiBh3UII4Gchw9B/y4iUAB1PG/p28VNim6wiuJs1eZhYZzmfFlRQ/EGWQo+gxhwEh/y4HVdygu+oobgbtBdZSAN+KuGHSWLPet7ng6WGC7JrxwriAIMiSQ+WboxXB7LkjxHgtqN0RncNsQxhUKnkIxK/hLoI2TbRy/sl8GbVuvWA1zXjLd47ZaQ9yiQKCeXkFW7/p8hmpzKm5HTUkcV3Ift7ZsakcOLxXUG7HZ4
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2672
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(39860400002)(376002)(199004)(189003)(8936002)(36756003)(36906005)(86362001)(6512007)(81166006)(316002)(6506007)(54906003)(107886003)(26826003)(8676002)(4744005)(5660300002)(336012)(1076003)(81156014)(478600001)(6486002)(2906002)(6666004)(70206006)(70586007)(356004)(76130400001)(26005)(186003)(2616005)(6916009)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB1749;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a9116a1e-db12-43bd-443c-08d7889794a8
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cX0JW7TPbCBS/lJ8DyQStibjbb3qZjzcdVB4kk4dm9lQxKdIF4ky/zKjrKWQG2PGyaHeFtRmMFY1AFucHxFapUqtmBBWZ34jTZowgsvWkblX3b2CF0q8JySp3Ujdp2VY3XrySqHog5U/Q+tT6Wv7pKIrkkXgK45csDsKmsAO+42Nhg8Y+jLNjZ46JiitiwB/szzDPytvgMQb9Z40WH1Jp4XFpJQc5p0zgTlu25hH9VjZFWGhx145BnaCi+GRbVrnRjBC9hApn9fDhcp6T+llk/IRCU2EWGfPjLGB0rC+H/0222hsEvbht/MEROwsums62AJm4SF5jo4fDoPIESf7jbpbZSvYCWsgPcit6Ylv1TRrqyYqVUq9GU4SHcghz5gpAcVAsU8vS7UiBLnl84gD313rYxVci1HnKx0Hl2sp5J1Ytq7z+24CoAiGxgGqgCV4
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:35:29.5349 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c549cacd-ca5b-4156-7e1a-08d78897ab96
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1749
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional change.

v3:
 - drop driver_private argument (Laurent)

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/mcde/mcde_dsi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 276a77c020c7..cf7ec4aaebd2 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -1098,8 +1098,7 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 	d->bridge_out = bridge;
 
 	/* Create a bridge for this DSI channel */
-	d->bridge.funcs = &mcde_dsi_bridge_funcs;
-	d->bridge.of_node = dev->of_node;
+	drm_bridge_init(&d->bridge, dev, &mcde_dsi_bridge_funcs, NULL);
 	drm_bridge_add(&d->bridge);
 
 	/* TODO: first come first serve, use a list */
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
