Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFE1118034
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 07:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52E96E817;
	Tue, 10 Dec 2019 06:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80084.outbound.protection.outlook.com [40.107.8.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8886E817
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 06:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AliecaTyPHMnfPKPyq6VeKdfO+bOUToeYkP0n5Wv7i0=;
 b=1NX4QaAnlzkOBHjR/MAPQr4L5l8lSOtPzcBudMhMi7KwwdUDrnabWwaxio2TUdr+WZWsx7FyyBB0JH7ZcZvbDFgNXCWVpdUXR8ejeQJUq3G02cePu1KDXiCsfVuy4mBmo5UMFxR1OJMEYz71HjH4FaB3XZ8dRuPxuPdd8rHrHwU=
Received: from VE1PR08CA0009.eurprd08.prod.outlook.com (2603:10a6:803:104::22)
 by DB8PR08MB3978.eurprd08.prod.outlook.com (2603:10a6:10:aa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.17; Tue, 10 Dec
 2019 06:10:42 +0000
Received: from DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::204) by VE1PR08CA0009.outlook.office365.com
 (2603:10a6:803:104::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12 via Frontend
 Transport; Tue, 10 Dec 2019 06:10:42 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT041.mail.protection.outlook.com (10.152.21.4) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 10 Dec 2019 06:10:41 +0000
Received: ("Tessian outbound a4662a02422d:v37");
 Tue, 10 Dec 2019 06:10:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a52adc322a0e9b6b
X-CR-MTA-TID: 64aa7808
Received: from b3c99205a01e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5297346E-96D0-42DA-81A3-5F6568535473.1; 
 Tue, 10 Dec 2019 06:10:36 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b3c99205a01e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Dec 2019 06:10:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxhuILzkjnw1rY6GNiZSJollDcyv8lLgVHOx3Z0TMTY/YlzR550RqGwDQxvhNb5QZgTqdOi2tFgs9DcNpB9QD9ZWIRUVWhTBI3QXgM0jJ//JPrr2uTVPL1nAb2yZOeH590Y0cFaPoa9cHrZCl8RSoB+wEhY8cuRLsptZ3DoTNA1qVjfiD+eC6XfLkjcPegI0CPVSHn86tnnKz9dR1bGSHidJg0Y4+8B9XG/4Sm+HDq94C/eUkJCwswfkkj+7/jmq7B9tiFZgpDu2XHgleeenxXr5cjDmqQXk3e8tc2OgSY9OBYOUZiWNqE6I2z/kAWednA475llJMLJsFNI9nv4suQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AliecaTyPHMnfPKPyq6VeKdfO+bOUToeYkP0n5Wv7i0=;
 b=mx9eW6nYDvVW2u2OmFkyFODOeGDf4YbFCqgDdpbfi9D2GKJHzQBXr11rVOGh7v9LYm1Wpx6WdcdleYKfL7GeX/s8JKILuAeDsMiufcpatJB9DfjtPxzzjTSh8JMqMVHfviUD85BTDqJK40TUIqE1iNtPw4+RQdCmDhzJB3DC1tNtCDHKT7VXZnQSxvIbfnEXyj/7W2hDd+wy3tWHULaQqmWLrTe5TE/mmxnqqnm4CRSrs9nHTaFBHkMfjXVZAnFw2dfyWEGMG6kUQRFCbgiSU2elNWroAE0RT6/Fqo++LfRsoM1SIXyBiCTCYQ4v6MsZaUHhAz0CKiOwTti08SUZgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AliecaTyPHMnfPKPyq6VeKdfO+bOUToeYkP0n5Wv7i0=;
 b=1NX4QaAnlzkOBHjR/MAPQr4L5l8lSOtPzcBudMhMi7KwwdUDrnabWwaxio2TUdr+WZWsx7FyyBB0JH7ZcZvbDFgNXCWVpdUXR8ejeQJUq3G02cePu1KDXiCsfVuy4mBmo5UMFxR1OJMEYz71HjH4FaB3XZ8dRuPxuPdd8rHrHwU=
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4990.eurprd08.prod.outlook.com (10.255.158.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Tue, 10 Dec 2019 06:10:34 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e%2]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 06:10:34 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH] drm/komeda: Correct d71 register block counting
Thread-Topic: [PATCH] drm/komeda: Correct d71 register block counting
Thread-Index: AQHVryCISCrm/Iio6km6+MdLrsMXuw==
Date: Tue, 10 Dec 2019 06:10:34 +0000
Message-ID: <20191210061015.25905-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: LO2P265CA0478.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::34) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 830d57ce-67f3-4930-7249-08d77d37afa9
X-MS-TrafficTypeDiagnostic: VE1PR08MB4990:|VE1PR08MB4990:|DB8PR08MB3978:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB3978113A3E7802C37522E254B35B0@DB8PR08MB3978.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1443;OLM:1443;
x-forefront-prvs: 02475B2A01
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(189003)(199004)(71190400001)(66556008)(66446008)(2616005)(8676002)(316002)(6862004)(71200400001)(66476007)(6512007)(64756008)(26005)(66946007)(478600001)(8936002)(81156014)(81166006)(6486002)(4326008)(103116003)(2906002)(1076003)(6506007)(86362001)(52116002)(55236004)(54906003)(305945005)(36756003)(186003)(37006003)(6636002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4990;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: U8sTCeuumVkDMxYjxxwmcZGyDgd8Ypl2+c4sKSmrq9EG7ableHbGW1AbDlcVbtuakCLWN69WtBQeT47zcMR/nONaUFOQu9XSWCZtm8kriZ5itHJpuYUHBQ4ltUAxiTmb5HElWS0lsown8p5os+u/h6VCzGAtyBNJuoLGa+FEpMEYFKrx+pTHNNwEWqCt7lOW/l4K0rg+LZ8OhB9TNrLYCWTQxekeV0UlqZLAj9GPSNJmAqkDT272T2GBXsE+Mu2k7rf9yTUF192xwrArJmbuKW6+9bw5EIDbjfCYTUXK+fbwL2TeEXR0S0sijW+guEAhx55ahuKXqh6m3muvEcy90rlyis3l1dvzlCXj0RLI2z1w04CMcwEgFz9ESYGcDK24niRsYAGrpyjz1H2pGksgQ4NpEtN7rlo1nb6eGdJwp3YbMxgWEVdrcksHw4RpvCkO
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4990
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(396003)(346002)(189003)(199004)(316002)(2906002)(86362001)(2616005)(6506007)(305945005)(1076003)(26005)(6862004)(6486002)(26826003)(76130400001)(478600001)(6512007)(37006003)(356004)(81156014)(186003)(8936002)(8676002)(6636002)(103116003)(81166006)(54906003)(70206006)(5660300002)(4326008)(70586007)(336012)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB3978;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9c748b79-7f32-4561-86b1-08d77d37aafe
NoDisclaimer: True
X-Forefront-PRVS: 02475B2A01
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: URH3YPsnrXct7I0B2/RDUrMwOup79qmtGwjOJo102LuJyqakbszcQcmWpoVDCkDl2kpr2olZSxbzTqsz+rOOBUQ0GZ4vCfZZ0MndPk0+JLxF+xNnzmMaLa8JswSzwoEbY2VdN/D+kp4nIk+HskGK/7M91ptM07YOa72avdC9KGk3mj3I4FuGiyfNaSsulbsssckmKxUGJKOiC59LxprkHbWHAGNUJD1Czvm65pLpE6D6tEwuT0KXjyo3X+p8cEbOelvdD6xbTHJZU2q7UEkGqwfesU0Jqw8m6qaR1XCfDu9lZdZ08eHik/jJ0YlS7WCvGxByrvaax4qzZ9TH2spf2mhRFKrnRSSPcDWQVXxHy+pQ7NJrTrDyeWX9uJlRlQUqRiyXcJ9l5345Ab/AGlENM5KZ4tvpAAjkL7ocC4bt8PD6RwP0EwfY/i5pvirc3gu3
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 06:10:41.8454 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 830d57ce-67f3-4930-7249-08d77d37afa9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3978
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

Per HW, d71->num_blocks includes reserved blocks but no PERIPH block,
correct the block counting accordingly.
D71 happens to only have one reserved block and periph block, which
hides this counting error.

Signed-off-by: james qian wang (Arm Technology China) <james.qian.wang@arm.com>
---
 drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
index 822b23a1ce75..d53f95dea0a1 100644
--- a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
@@ -414,8 +414,11 @@ static int d71_enum_resources(struct komeda_dev *mdev)
 		d71->pipes[i] = to_d71_pipeline(pipe);
 	}
 
-	/* loop the register blks and probe */
-	i = 2; /* exclude GCU and PERIPH */
+	/* loop the register blks and probe.
+	 * NOTE: d71->num_blocks includes reserved blocks.
+	 * d71->num_blocks = GCU + valid blocks + reserved blocks
+	 */
+	i = 1; /* exclude GCU */
 	offset = D71_BLOCK_SIZE; /* skip GCU */
 	while (i < d71->num_blocks) {
 		blk_base = mdev->reg_base + (offset >> 2);
@@ -425,9 +428,9 @@ static int d71_enum_resources(struct komeda_dev *mdev)
 			err = d71_probe_block(d71, &blk, blk_base);
 			if (err)
 				goto err_cleanup;
-			i++;
 		}
 
+		i++;
 		offset += D71_BLOCK_SIZE;
 	}
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
