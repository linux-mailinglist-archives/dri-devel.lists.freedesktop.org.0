Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA07211C65E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 08:28:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B8D6EC69;
	Thu, 12 Dec 2019 07:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60049.outbound.protection.outlook.com [40.107.6.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29B26EC69
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 07:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GShXzcxC2k/K5I6YlZvkw74prrKjN3Y5mFl7f8tKYpY=;
 b=dM+ynWl8i87x9GSO1I0+6D/r0eqylU7qDGq/sp8nh4l+nMaPqg9Q4uqvGInhBCyycT+jamP12qn1qc+qzsYf7T25oN8atygv80B6zRbxTqBPKLA/GTEaLJQ31l3ONwPrArBC8vV9ai8JLwAY6gBmMDmQfibr6r3SF77pidb1WEA=
Received: from AM4PR08CA0053.eurprd08.prod.outlook.com (2603:10a6:205:2::24)
 by HE1PR0801MB1836.eurprd08.prod.outlook.com (2603:10a6:3:89::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.14; Thu, 12 Dec
 2019 07:28:06 +0000
Received: from AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::202) by AM4PR08CA0053.outlook.office365.com
 (2603:10a6:205:2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.15 via Frontend
 Transport; Thu, 12 Dec 2019 07:28:06 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT006.mail.protection.outlook.com (10.152.16.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Thu, 12 Dec 2019 07:28:05 +0000
Received: ("Tessian outbound 5574dd7ffaa4:v37");
 Thu, 12 Dec 2019 07:28:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7b85e8732cd7b7cb
X-CR-MTA-TID: 64aa7808
Received: from 4574cc9b9828.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CF913403-6482-4999-ABDE-C833EAA97C4E.1; 
 Thu, 12 Dec 2019 07:28:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4574cc9b9828.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 12 Dec 2019 07:28:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZhcKYTFG+hCZhvWg1H5TRGHNSQZYLCT3ccPY0CY4/f4bncQGf0qRn+w3DJRi57wt48oEm+3qMHMuO7BZ3nZfHweWmVDczwdd1QgYWZn5LYWQ19P/7tgNznHcWLmbGc0XTrZ0nz7ZJpKoP1C/t4/4G5yge0LkdThMCAfb1wN0y9T5RQgH+jbcw6I5m7sharW7Volvxya8LUp/+91biRY9FxLepOxma0BrQZgl5+w/r3DWY3KaOp/76eHvWReLLUgA6Fr7OQ8H3NWZ6XKmI6+PbfP+2LAWdym8yn2P5n/VBJeqziyDHJj4xKSKzuCkCjNIooH1EOMivbU/B78/V2mfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GShXzcxC2k/K5I6YlZvkw74prrKjN3Y5mFl7f8tKYpY=;
 b=CjZ85I6mcLBxzWgf0gs/+FTQR8/Jndqr+j/Wdw1Co11zW5SoF0u3pKe21Y+Oi00eViY+UzNjrsrCZ+d1M6YcOzYtbiggVwHqh1bEoN5WI1u6TxuKEK5gjJPmR4UbOLXAbsBBwJ8WgPTX4wMMlr4DboDf20yuwoQ0ZMHCq6VwrDpAXBzsf79NcNVHrS+dV47WuNvm6Qe3+1Kbf31WLY/e5cMpdWEteRU6azvyuY0X0ukAO/ab9cgBl1qT0sUDkPs4xFkqbb8x0jq1XsXLjvdcTpoOOaY6r/rAZfCwqTjcNgTGFWEjMBZcZIU7PEREeRE8Hj9AOb7bhn8xgj9w/Jzjyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GShXzcxC2k/K5I6YlZvkw74prrKjN3Y5mFl7f8tKYpY=;
 b=dM+ynWl8i87x9GSO1I0+6D/r0eqylU7qDGq/sp8nh4l+nMaPqg9Q4uqvGInhBCyycT+jamP12qn1qc+qzsYf7T25oN8atygv80B6zRbxTqBPKLA/GTEaLJQ31l3ONwPrArBC8vV9ai8JLwAY6gBmMDmQfibr6r3SF77pidb1WEA=
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4734.eurprd08.prod.outlook.com (10.255.112.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Thu, 12 Dec 2019 07:27:56 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e%2]) with mapi id 15.20.2538.016; Thu, 12 Dec 2019
 07:27:55 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH] drm/komeda: Add event handling for EMPTY/FULL
Thread-Topic: [PATCH] drm/komeda: Add event handling for EMPTY/FULL
Thread-Index: AQHVsL2rU4ctbxXpak2vHcPGkTYTbw==
Date: Thu, 12 Dec 2019 07:27:55 +0000
Message-ID: <20191212072737.30116-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR03CA0060.apcprd03.prod.outlook.com
 (2603:1096:202:17::30) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 445d861f-10f2-42d8-1527-08d77ed4d46c
X-MS-TrafficTypeDiagnostic: VE1PR08MB4734:|VE1PR08MB4734:|HE1PR0801MB1836:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0801MB18366640B17C23AD46DC93CFB3550@HE1PR0801MB1836.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:5516;OLM:5516;
x-forefront-prvs: 0249EFCB0B
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(189003)(199004)(478600001)(52116002)(6862004)(54906003)(55236004)(4326008)(36756003)(86362001)(316002)(186003)(26005)(6506007)(6512007)(2906002)(81156014)(8676002)(6486002)(71200400001)(66946007)(37006003)(1076003)(103116003)(6636002)(2616005)(66446008)(5660300002)(64756008)(8936002)(81166006)(66556008)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4734;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: b5uB4U1+fv95fLqlr4qp/rWmOPr966dZq/s3rfwqwI3Xyogh1a1cuOKsRZ2dUnG3WsuBjTSFG9KC9d1t/ZYcaWx0Hn6jLUeyNPapZ/Zowrd7ePg5yXi/aeax7eQj4Aw6QFjCnFESc693zfZWYRk6KdgEPPkTEXrxYiniSzutjsxU51OnPn6T2p8LiIl3wWJansuVmyc4gJYVETlgaeyQFkw13n1+yKSI+iJlyeuUoRzDJUecax4g8WJjJy1wm2rKa5XCFEKRfsmmojqOGYv+TGkwF7fyuowQIoG9PZiJxIqP4BTcDe/fMRcjWmLk9Hy8oKoQPOkr6qpNIMvGHxR5KjWKT4yL1TjxkvVpx39Eb0vMtkPeilQHD77LJT9d88ak6rw/IQqVVKgCZLchs0onn/YX6QOQnNU6tjMGiZjhjKfG7mQvsBdp9kbZLkqbq+pK
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4734
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(346002)(136003)(189003)(199004)(6486002)(8936002)(1076003)(81166006)(54906003)(316002)(6506007)(26005)(36906005)(356004)(81156014)(8676002)(37006003)(336012)(26826003)(6636002)(6512007)(76130400001)(2616005)(103116003)(5660300002)(86362001)(2906002)(70586007)(70206006)(36756003)(6862004)(4326008)(186003)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0801MB1836;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 827c85cc-b7a7-48e2-ba96-08d77ed4ce40
NoDisclaimer: True
X-Forefront-PRVS: 0249EFCB0B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NENALnZFL2A7Nf/p5gt1F4KNKF7B7Tjv7KX2RciMiiG7GWNRsk42yYW5rjZ5wzf4q7tdMT9HmdrR8G2h3TrPAb6un4VzYEwooIAXr/QMl6fhEKQeJXS3LeYzPoPzvGrj1jJfB1tUr5Rl8HqpCkAjTfbJZm9NNy6+RQavDcptvkpwl0DJF4PPgcOFslFyQPRXOeLrRQM2QNdkhjftPq+BqIWVsSP4pU9ytsNQC43fsMC7kYSF7GZAQdlGQDoRh8fKbAkfQuF/RlOHC3qUCqRcD6qo9eLl+M0k5Z4rer9kC1s3Q60fm9qN2UbDUALof8Kjek2US62fNbdPfUSA4eVWqvmjnMCjeO3vTWGTZE17CYVhlykJat1kzN6u5yi2Gz1iehhGPsHDjEG47uy1XRD3BUobgSprBcHbqL39Dx5PFKD9CnRXlhijQ5HICmJyJhqv
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2019 07:28:05.7623 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 445d861f-10f2-42d8-1527-08d77ed4d46c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1836
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
Cc: "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "Oscar Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 nd <nd@arm.com>, Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

EMPTY/FULL are HW input/output FIFO condition identifer, which are
useful information for addressing the problem, so expose them.

Signed-off-by: james qian wang (Arm Technology China) <james.qian.wang@arm.com>
---
 drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c  | 13 ++++++++++++-
 drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h |  3 +++
 drivers/gpu/drm/arm/display/komeda/komeda_dev.h   |  5 ++++-
 drivers/gpu/drm/arm/display/komeda/komeda_event.c |  2 ++
 4 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
index dd1ecf4276d3..00fa56c29b3e 100644
--- a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
@@ -20,8 +20,10 @@ static u64 get_lpu_event(struct d71_pipeline *d71_pipeline)
 		evts |= KOMEDA_EVENT_IBSY;
 	if (raw_status & LPU_IRQ_EOW)
 		evts |= KOMEDA_EVENT_EOW;
+	if (raw_status & LPU_IRQ_OVR)
+		evts |= KOMEDA_EVENT_OVR;
 
-	if (raw_status & (LPU_IRQ_ERR | LPU_IRQ_IBSY)) {
+	if (raw_status & (LPU_IRQ_ERR | LPU_IRQ_IBSY | LPU_IRQ_OVR)) {
 		u32 restore = 0, tbu_status;
 		/* Check error of LPU status */
 		status = malidp_read32(reg, BLK_STATUS);
@@ -45,6 +47,15 @@ static u64 get_lpu_event(struct d71_pipeline *d71_pipeline)
 			restore |= LPU_STATUS_ACE3;
 			evts |= KOMEDA_ERR_ACE3;
 		}
+		if (status & LPU_STATUS_FEMPTY) {
+			restore |= LPU_STATUS_FEMPTY;
+			evts |= KOMEDA_EVENT_EMPTY;
+		}
+		if (status & LPU_STATUS_FFULL) {
+			restore |= LPU_STATUS_FFULL;
+			evts |= KOMEDA_EVENT_FULL;
+		}
+
 		if (restore != 0)
 			malidp_write32_mask(reg, BLK_STATUS, restore, 0);
 
diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h b/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
index 81de6a23e7f3..e80172a0b320 100644
--- a/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
+++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
@@ -175,6 +175,7 @@
 #define TBU_DOUTSTDCAPB_MASK	0x3F
 
 /* LPU_IRQ_BITS */
+#define LPU_IRQ_OVR		BIT(9)
 #define LPU_IRQ_IBSY		BIT(10)
 #define LPU_IRQ_ERR		BIT(11)
 #define LPU_IRQ_EOW		BIT(12)
@@ -185,6 +186,8 @@
 #define LPU_STATUS_AXIE		BIT(4)
 #define LPU_STATUS_AXIRP	BIT(5)
 #define LPU_STATUS_AXIWP	BIT(6)
+#define LPU_STATUS_FEMPTY	BIT(11)
+#define LPU_STATUS_FFULL	BIT(14)
 #define LPU_STATUS_ACE0		BIT(16)
 #define LPU_STATUS_ACE1		BIT(17)
 #define LPU_STATUS_ACE2		BIT(18)
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.h b/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
index 4a67a80d5fcf..ce27f2f27c24 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
@@ -20,6 +20,8 @@
 #define KOMEDA_EVENT_OVR		BIT_ULL(4)
 #define KOMEDA_EVENT_EOW		BIT_ULL(5)
 #define KOMEDA_EVENT_MODE		BIT_ULL(6)
+#define KOMEDA_EVENT_FULL		BIT_ULL(7)
+#define KOMEDA_EVENT_EMPTY		BIT_ULL(8)
 
 #define KOMEDA_ERR_TETO			BIT_ULL(14)
 #define KOMEDA_ERR_TEMR			BIT_ULL(15)
@@ -49,7 +51,8 @@
 	KOMEDA_ERR_ZME		| KOMEDA_ERR_MERR	| KOMEDA_ERR_TCF |\
 	KOMEDA_ERR_TTNG		| KOMEDA_ERR_TTF)
 
-#define KOMEDA_WARN_EVENTS	KOMEDA_ERR_CSCE
+#define KOMEDA_WARN_EVENTS	\
+	(KOMEDA_ERR_CSCE | KOMEDA_EVENT_FULL | KOMEDA_EVENT_EMPTY)
 
 #define KOMEDA_INFO_EVENTS (0 \
 			    | KOMEDA_EVENT_VSYNC \
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_event.c b/drivers/gpu/drm/arm/display/komeda/komeda_event.c
index 977c38d516da..53f944e66dfc 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_event.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_event.c
@@ -78,6 +78,8 @@ static void evt_str(struct komeda_str *str, u64 events)
 
 	/* LPU errors or events */
 	evt_sprintf(str, events & KOMEDA_EVENT_IBSY, "IBSY|");
+	evt_sprintf(str, events & KOMEDA_EVENT_EMPTY, "EMPTY|");
+	evt_sprintf(str, events & KOMEDA_EVENT_FULL, "FULL|");
 	evt_sprintf(str, events & KOMEDA_ERR_AXIE, "AXIE|");
 	evt_sprintf(str, events & KOMEDA_ERR_ACE0, "ACE0|");
 	evt_sprintf(str, events & KOMEDA_ERR_ACE1, "ACE1|");
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
