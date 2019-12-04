Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A273112A80
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742906E8C9;
	Wed,  4 Dec 2019 11:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4C96E8C9
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:48:19 +0000 (UTC)
Received: from VI1PR08CA0157.eurprd08.prod.outlook.com (2603:10a6:800:d1::11)
 by VI1PR0801MB1823.eurprd08.prod.outlook.com (2603:10a6:800:5a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12; Wed, 4 Dec
 2019 11:48:16 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::204) by VI1PR08CA0157.outlook.office365.com
 (2603:10a6:800:d1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:16 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:16 +0000
Received: ("Tessian outbound a8ced1463995:v37");
 Wed, 04 Dec 2019 11:48:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7d2b493a6b18cf10
X-CR-MTA-TID: 64aa7808
Received: from a83b0422c187.7
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3A9492E8-5F22-4BB0-8745-A2FB1B13939A.1; 
 Wed, 04 Dec 2019 11:48:11 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a83b0422c187.7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRPP6zms+jidUZU5mLeXrQTG6Sy1+Wpg+GMn9kFSjzriRhFgcganqwW3Quo60KxA30oZVcEdvc8PvCNmHAA+4y5l16vYXXd3Zqjj7RVgyiQ2jW4xCnStqaLDxXMvgLgG0wOAatw9F/PEnv88g5QTDARH7kc1MrtOXVJuWq7Zd/yihAohbgMBvC0aKus60/iNknaYUxxPegfEiAvlcrhsdVb5iik9wqMlBP7NzUiBjJkOdcOifICJMgY6yYLOHNAwkXo/bcJKYTQ/bYOdBQE4J+X60+Rnn7VJOBL2u09HY7JdZIRIoRHICZAlD9DbZGT6kw9ziasH30SfBRMdIw5wUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4D/5bCj6TvVVRDvDiedXMOypvZfwR1Fa0QcscRNJGw=;
 b=VU8oQ4DR11oQwM0rv0sDNgsWGKLPw9ImtaR8fE1ZrhW0vAuEra1KFKkl3r0f94pKmS5IONAK7/f3OEriH7NxKh25CPwf+Vw3Dib7BkPBE+o0RFidFbarzzk4MqB8tNhtwxJm1ipd4jfZivSY6jadD/XBJMSdKlnW4RED/ifg7acw4wo+NRX3s9nyVW4v5ZMkX4vMnDas8CKGRehalYM/vbDdRIqGU1//nSQAa4lyLoJYy/aytR+CZx9oiMxHMSaGrzsRcCD9SJUVS27kthwPIisWztlck5Dzxc+0CkRHvrVgfQfk5iAfpu3XnLwf2Jg2T7IYXugzBPvHugCP4Jzwkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3085.eurprd08.prod.outlook.com (52.133.15.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Wed, 4 Dec 2019 11:48:09 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:09 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 08/28] drm/bridge: nxp-ptn3460: Use drm_bridge_init()
Thread-Topic: [PATCH v2 08/28] drm/bridge: nxp-ptn3460: Use drm_bridge_init()
Thread-Index: AQHVqpiy6ytrz+vg8UKnMUPo552Mew==
Date: Wed, 4 Dec 2019 11:48:09 +0000
Message-ID: <20191204114732.28514-9-mihail.atanassov@arm.com>
References: <20191204114732.28514-1-mihail.atanassov@arm.com>
In-Reply-To: <20191204114732.28514-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LNXP265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::19) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e5cd02ab-09d7-4f49-df27-08d778afd9f9
X-MS-TrafficTypeDiagnostic: VI1PR08MB3085:|VI1PR08MB3085:|VI1PR0801MB1823:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB1823E90508E2ACF9B5482C858F5D0@VI1PR0801MB1823.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:324;OLM:324;
x-forefront-prvs: 0241D5F98C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(199004)(189003)(2501003)(1076003)(478600001)(4744005)(6436002)(6512007)(8936002)(6486002)(54906003)(44832011)(4326008)(316002)(50226002)(8676002)(5660300002)(2906002)(81156014)(81166006)(6116002)(3846002)(66946007)(66476007)(66556008)(66446008)(64756008)(11346002)(186003)(2616005)(14454004)(52116002)(76176011)(99286004)(2351001)(25786009)(86362001)(26005)(5640700003)(6916009)(102836004)(71200400001)(305945005)(7736002)(71190400001)(6506007)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3085;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: u+z2xKS1NpF3jRkmPj+e6cu+Bk/7M6ZzZs1O0VaLdCv++pjg5iyKhr2pFJIH81IzRBH++/rA+IKqeTIaQQYVEoKiBP+fU52Hc2pedLz74TqVJWMBo9kXls2bgNR1xkNGidxfYaS/Tjc9EOpvG7Le1ka2nrpKTgQVjlCzl8IeAZ15jlzajRX1hi280FiP3cXFQT7CBvsUR+FSEGLEkBWwP6riY8vziK9AayHbtEVKr6sesBDP0AMZmNMIBgy774WyDBBEAAQ2N5hsmydUE6rnlLSkhnhnKt/qdwUnPWK11+7dbXYmB8BBCVInStQPD4zbwcp6XlDjBj28UViJ7xGx6UIpLzv33wiZYtMjDdAs7kSovLl4YECDdZksyxKA1EP1G2UIsn3G8zVtmoAEm5rprPo4vlQCS/K5MGOyIXNvymCEaKYXYTT5f6rIz4T/+xuO
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3085
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(376002)(346002)(189003)(199004)(2501003)(26826003)(107886003)(2616005)(336012)(5660300002)(99286004)(1076003)(86362001)(4326008)(76130400001)(478600001)(6506007)(4744005)(54906003)(6486002)(6116002)(14454004)(316002)(3846002)(7736002)(22756006)(26005)(11346002)(186003)(36906005)(102836004)(2906002)(81166006)(8676002)(8936002)(81156014)(23756003)(8746002)(6916009)(356004)(76176011)(5640700003)(70586007)(6512007)(25786009)(50226002)(305945005)(50466002)(36756003)(70206006)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0801MB1823;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 68fad433-7271-4028-ae80-08d778afd545
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: igZMy2e6Nc4bO6o2c0wrMEi8ejVr7teGReVOiuc3lZysiTMIli79oPorJEcc8kBI5L8iH1GGkyrynqXTHlcU3rJFIV4CRpDJTFg0aaAV0JYrT5KTZMLGc+qR7wWIEgfDGa7hI5R/8pFdGoPhhTsznsKSBaIuajE0e/qDYT0y2g09dfyqWBe+hYBHJxDu9DmzaGBq5D7UFk+CUHFIsLM3k4FW7RtLh1asS1sX3imDMQW51n7IfmFK4pncXU2jCiz+D7yC/RtFPvzDFeMmMrSAWCISpQmg3fmRCyuqDKHp5DvhlbM6g7qi/la6SAdpRatdoPdzwzvqMzP/1G+Y9f/l0M2SbjSl+hPZ7qszyA1wXMJGshnJkWIDs7wYIZa9bocdF7bXSV3sy1630RNYkkR4aF1d5nZzh19eRjbeazy2MX3slPBQCW32866B4nJEJpFB
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:16.7315 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5cd02ab-09d7-4f49-df27-08d778afd9f9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1823
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4D/5bCj6TvVVRDvDiedXMOypvZfwR1Fa0QcscRNJGw=;
 b=qHKchLZmToYpbLDyF/t5oLprL48HF4p2FapqhvxRirMF6eE8yqtY7Dfz8ucnyfojBb8W11YBJr7SO38PFFI6D7jsykB8bjjlVKUNttKx4ysYNWzwXebSLQ6C4jm6qcWu3VIeUZCpER/QY8yHGt7BmXaiHwMBK8SgfHN/8HQupo4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4D/5bCj6TvVVRDvDiedXMOypvZfwR1Fa0QcscRNJGw=;
 b=qHKchLZmToYpbLDyF/t5oLprL48HF4p2FapqhvxRirMF6eE8yqtY7Dfz8ucnyfojBb8W11YBJr7SO38PFFI6D7jsykB8bjjlVKUNttKx4ysYNWzwXebSLQ6C4jm6qcWu3VIeUZCpER/QY8yHGt7BmXaiHwMBK8SgfHN/8HQupo4=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9ueHAt
cHRuMzQ2MC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbnhwLXB0bjM0
NjAuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbnhwLXB0bjM0NjAuYwppbmRleCA1N2ZmMDEz
Mzk1NTkuLjI2NTZhMTg4YjQzNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9u
eHAtcHRuMzQ2MC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbnhwLXB0bjM0NjAuYwpA
QCAtMzIwLDggKzMyMCw4IEBAIHN0YXRpYyBpbnQgcHRuMzQ2MF9wcm9iZShzdHJ1Y3QgaTJjX2Ns
aWVudCAqY2xpZW50LAogCQlyZXR1cm4gcmV0OwogCX0KIAotCXB0bl9icmlkZ2UtPmJyaWRnZS5m
dW5jcyA9ICZwdG4zNDYwX2JyaWRnZV9mdW5jczsKLQlwdG5fYnJpZGdlLT5icmlkZ2Uub2Zfbm9k
ZSA9IGRldi0+b2Zfbm9kZTsKKwlkcm1fYnJpZGdlX2luaXQoJnB0bl9icmlkZ2UtPmJyaWRnZSwg
ZGV2LCAmcHRuMzQ2MF9icmlkZ2VfZnVuY3MsCisJCQlOVUxMLCBOVUxMKTsKIAlkcm1fYnJpZGdl
X2FkZCgmcHRuX2JyaWRnZS0+YnJpZGdlKTsKIAogCWkyY19zZXRfY2xpZW50ZGF0YShjbGllbnQs
IHB0bl9icmlkZ2UpOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
