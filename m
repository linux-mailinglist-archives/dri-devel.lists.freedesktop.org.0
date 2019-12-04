Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C27E0112A8E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C14A6E8DC;
	Wed,  4 Dec 2019 11:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5FE6E8DD
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:48:29 +0000 (UTC)
Received: from VI1PR0801CA0075.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::19) by VI1PR08MB3439.eurprd08.prod.outlook.com
 (2603:10a6:803:7d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.21; Wed, 4 Dec
 2019 11:48:27 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::202) by VI1PR0801CA0075.outlook.office365.com
 (2603:10a6:800:7d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:27 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:27 +0000
Received: ("Tessian outbound 15590139dbb5:v37");
 Wed, 04 Dec 2019 11:48:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 27331de2f3e13bad
X-CR-MTA-TID: 64aa7808
Received: from b7ecf5d06a39.4
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 71ECDB19-0260-489E-A2B5-B7D66CE871D0.1; 
 Wed, 04 Dec 2019 11:48:20 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b7ecf5d06a39.4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SaVAcPHdmFj5xxUKd//I9lqIkojJBedBjn6Cv59p4Btb+YDPZshaqNCnHF8VTxxyUJ6HI7uox/NkjxV0ZyciSZthD8EVPjnwX9OxwaArg9An+845bBRbfThPf74jFfJsIrFFc/gA0e9Z4WuM+PTIW7t+qn24yJIlZI5kCtDsM0Y3zsx8eUDqyqESlxZNHW4ZS/+qkbJHSIKGJwRhGpJEEDWd0pEfnpoxcQMUp+ePi3pbWrg5nekqAcT29AoYAvTTaR8gARI6/OBXAibTwha6dU6JZtcNaXSHO0oN0io03ERltL8syhpnrAhYBfRNn61ODSopI0fd7Nj5bj9iaYNpYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwWUgh4a/99W8HIctunJRzMXApJ6JnBQ7MIy/xuhdE8=;
 b=nxSEzO/HhSJPBhcnqMY9hP+bzdy76+qQFZGqClJt/QHEWHT6P7hmsRIwxjbFG/Z4zda6rJHZdK59GgkPJ4ulof2mpm9LEwQiCJa84WhE+OAajryytKS8we7L7XP88edK+S5fp+T4WUlJ3COJrcEWIhUo59tFK/jihb4zicFPIRgo481S90HFBQjS5RocmN47cOpz529jPdetEqaE8jV/fQn2FlBRJWKNCuJPGHDMrg1YdLWBZwhDkD9m5iK4b5pBAqB7uUzCiJ/QTPB9TPqL3dvwDuZoQ5Mhe7MyDxDegw4WRGzWbie1RcA6P7mR8vrhG/dQkLe4iGkW4LaC6b4rVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3085.eurprd08.prod.outlook.com (52.133.15.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Wed, 4 Dec 2019 11:48:18 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:18 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 18/28] drm/bridge: thc63: Use drm_bridge_init()
Thread-Topic: [PATCH v2 18/28] drm/bridge: thc63: Use drm_bridge_init()
Thread-Index: AQHVqpi4C2DlW8sHgkeTmalYje2zzw==
Date: Wed, 4 Dec 2019 11:48:18 +0000
Message-ID: <20191204114732.28514-19-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 93dbeb46-f524-45f0-354a-08d778afe031
X-MS-TrafficTypeDiagnostic: VI1PR08MB3085:|VI1PR08MB3085:|VI1PR08MB3439:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB343957D499D3ED612D2674D08F5D0@VI1PR08MB3439.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:376;OLM:376;
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
X-Microsoft-Antispam-Message-Info-Original: +q5LvAbCGZNpkVIGpm0CMbyOO69cj4/PxagVTIhBMnhQK4O5f2T9WJoqzFBx/5gQOro+nUOri72/1Mm4grjRQj6KpxYKQ34hrcAKRucNhAtN5DFrUMbKHBPSQvBlVrCZZJ1zq2pLdIXtlO9ydzYKCiW4wAceDpSmxAeeIgIGYnlpt+BQSluWrH7UJUM1i2nKwiSEGgcZCLLvo1EfYOdpg3ihQA9xdtS/Zk8UUzbyTAALYtRG9VzII1sAa5AdOqjTt4h1ij+UmGpogwDRVcpPn0qLCcZgmkDLKPwtjMynftIlT7B/Zzce4RluA4B5Rqh1zVMQCT9frAMdz8Iyf7w12dTR2oI5/m8YuwrhhvAV+17P7K9gs+yfCOBdtjNdMKv2dQLFTWAWbwZWtfkoMkDnV0U7WJelolkUWGT9FIM5t7xGJ7uzwEPDudWho1A3MDab
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3085
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(376002)(346002)(199004)(189003)(50226002)(6116002)(2906002)(99286004)(186003)(8936002)(8676002)(54906003)(7736002)(6916009)(26005)(25786009)(81156014)(14454004)(316002)(305945005)(6486002)(81166006)(356004)(102836004)(76176011)(336012)(4744005)(11346002)(26826003)(76130400001)(36906005)(478600001)(86362001)(23756003)(6506007)(3846002)(5660300002)(36756003)(50466002)(4326008)(70206006)(2501003)(107886003)(70586007)(22756006)(5640700003)(2616005)(6512007)(1076003)(2351001)(8746002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3439;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 93a0caf9-3893-42b6-1dff-08d778afdaa1
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ruOOVKwE3mRkCfw2//NYg2WjqCOdPE49IL34Sq33G/zRo70HfzkeERefI07pjO2Jo9d7rTF4S+9olYR66mcWlkOd4J8mZSHg/JCJfgLMIW3NvlyIZy8gr20XVkpzV8/RmcNxJ+yfKDs9NnrrNUigwbCheiafYaWC+zkfAdDRMs2q3X3DCKLZYZNLhHFbgFZZ8lqhagZjemlili8S+xVmhZNrHLZq0i/vpR9Xwel5M7C+DKkoBS3afBJPx+YttFSLluoy9WYCBiFveJaJoqkUCUILBT8cj7WkS1QCJg50omCSNcJYZWGqj0AQVMJvKuYYBtKnPvDmGmQHRL1VMMBNYsx8An8zDf3lXZW/1GWMGlcBgo6Qp8YVcKTSFwAV/f0bWnWemM9EVPnyPARTAFoM+N9mqTsaWY6M2JtzFf0J3sUFMl5057nHRZ+/UvbrYwMo
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:27.1555 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93dbeb46-f524-45f0-354a-08d778afe031
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3439
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwWUgh4a/99W8HIctunJRzMXApJ6JnBQ7MIy/xuhdE8=;
 b=4XlCn6ULN3JnLv+UCmzSEhfXjX6ZqFEA9uTNha+DT0UNEa/jgOND4FYoOXZ1wx6Bfk/kNZg2zGfsGxjHb8E/Kq2ZEKjfA7ZZePJzkOyk/ZSOigWFwu7uadbGvDidkhl/AzBL/NXbGAqO/WKJvLtx9ZWQAZlYraxl1VjecVJgjhQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwWUgh4a/99W8HIctunJRzMXApJ6JnBQ7MIy/xuhdE8=;
 b=4XlCn6ULN3JnLv+UCmzSEhfXjX6ZqFEA9uTNha+DT0UNEa/jgOND4FYoOXZ1wx6Bfk/kNZg2zGfsGxjHb8E/Kq2ZEKjfA7ZZePJzkOyk/ZSOigWFwu7uadbGvDidkhl/AzBL/NXbGAqO/WKJvLtx9ZWQAZlYraxl1VjecVJgjhQ=
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
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aGM2
M2x2ZDEwMjQuYyB8IDcgKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RoYzYz
bHZkMTAyNC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aGM2M2x2ZDEwMjQuYwppbmRleCAz
ZDc0MTI5YjI5OTUuLmFiZTgwNmRiNWY0ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS90aGM2M2x2ZDEwMjQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RoYzYzbHZk
MTAyNC5jCkBAIC0yMTgsMTEgKzIxOCw4IEBAIHN0YXRpYyBpbnQgdGhjNjNfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0JdGhj
NjMtPmJyaWRnZS5kcml2ZXJfcHJpdmF0ZSA9IHRoYzYzOwotCXRoYzYzLT5icmlkZ2Uub2Zfbm9k
ZSA9IHBkZXYtPmRldi5vZl9ub2RlOwotCXRoYzYzLT5icmlkZ2UuZnVuY3MgPSAmdGhjNjNfYnJp
ZGdlX2Z1bmM7Ci0JdGhjNjMtPmJyaWRnZS50aW1pbmdzID0gJnRoYzYzLT50aW1pbmdzOwotCisJ
ZHJtX2JyaWRnZV9pbml0KCZ0aGM2My0+YnJpZGdlLCAmcGRldi0+ZGV2LCAmdGhjNjNfYnJpZGdl
X2Z1bmMsCisJCQkmdGhjNjMtPnRpbWluZ3MsIHRoYzYzKTsKIAlkcm1fYnJpZGdlX2FkZCgmdGhj
NjMtPmJyaWRnZSk7CiAKIAlyZXR1cm4gMDsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
