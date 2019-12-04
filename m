Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D66E112A96
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32F26F496;
	Wed,  4 Dec 2019 11:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::620])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA776E8DC
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:48:29 +0000 (UTC)
Received: from VI1PR08CA0174.eurprd08.prod.outlook.com (2603:10a6:800:d1::28)
 by DB6PR0802MB2551.eurprd08.prod.outlook.com (2603:10a6:4:9f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.21; Wed, 4 Dec
 2019 11:48:27 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::201) by VI1PR08CA0174.outlook.office365.com
 (2603:10a6:800:d1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:27 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:27 +0000
Received: ("Tessian outbound a8ced1463995:v37");
 Wed, 04 Dec 2019 11:48:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d4be94568fcd5ed9
X-CR-MTA-TID: 64aa7808
Received: from b7ecf5d06a39.8
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3882E90F-F739-4CA1-98E0-AA1FF754248B.1; 
 Wed, 04 Dec 2019 11:48:21 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b7ecf5d06a39.8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kY6pP4AUljXBmcjMDmRzJ3fCEQXFp9KBx7gwG/agwUlVlSbjwPnGGWdGMEvIQgk+hm31i97h9PVjqa6IulWPBWvxHMSJU607lCiuVAL520NWHRVtMb2oWld27xnKySggKhvUbnRKVGZ5oIeWesLjG8ryjrvZDNuIzSghaKOS7xhPVYh/lYDO0GFlA5GE9pTkQJF8Ibh7wuMb35QvvOt0Yh90t10mnQwVteAWJcUVtjWnNwbzj8EgXZkC4axS3aVxHworsSO7szwdGfZ0co3IN8BJBphSO4HZ2Zcp1g/n8pZdtnsFBtocVGI+zL8LPhHGEr3Qh6qGCmta8uBZMPzCpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Av9EoDIvHqCagseLb7iy4+qbCZH7UsR3146DKkdXRfQ=;
 b=lw4Gr+mfKUk0ra4MhtNoAftoaNB9M5KK5QJ3CuAWst/OJsC0yJcDSG8M0u3I6Jtfl/n63GRj3oRYaPts8Ro8sNjn8r9NlKs/y/jdVaT9bexyrqFgXEXCQHXqRQEUfH3/LhFuyTeEPDJawReaoOBfpjwkgY7swq1SrWV0A+jcNfPuEYAsPaYawix57RCgd7ZQjnzVkHsCpDO7zCUvtPt2vOEL8cHsxE/wlUP6gt/mHGEMKjOG3J324wApjDox1pO6NQQJL2ZrU6qvUwaOgtOMphywbwlss2QHnc9xjigRrWF7K+Le9DtBcyr8RGB7/DNX0R09kn88/GS1xnB8Klqs9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3085.eurprd08.prod.outlook.com (52.133.15.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Wed, 4 Dec 2019 11:48:19 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:19 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 20/28] drm/bridge: ti-tfp410: Use drm_bridge_init()
Thread-Topic: [PATCH v2 20/28] drm/bridge: ti-tfp410: Use drm_bridge_init()
Thread-Index: AQHVqpi5QCRUUSgUu02K2aKh0X5GZw==
Date: Wed, 4 Dec 2019 11:48:19 +0000
Message-ID: <20191204114732.28514-21-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: e42a6200-be8b-4729-b08d-08d778afe02e
X-MS-TrafficTypeDiagnostic: VI1PR08MB3085:|VI1PR08MB3085:|DB6PR0802MB2551:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0802MB2551D810103B26BD6F267D4E8F5D0@DB6PR0802MB2551.eurprd08.prod.outlook.com>
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
X-Microsoft-Antispam-Message-Info-Original: v1BHkepoKwFa6M8j4fxBcq6zRWYTSo2QrnjcodgrAiy0BPSZpd3oaD/OhOiHnyLFDVdInHVzb8WIu1OQ03dPCwBsLomKVVoit+KZHOM/I1h3GJONTK1DUWZ9R8U5wZ5zZE3m1n+YOwC5XC6opfbYBpHMeecvEB44zr+CIpFfg/WecokW2t7DKU7Im0qJc01UpMkFwIBDus0lRuHSCwKQ7KU18rhgR9jaXNN2aTG1wZ0KlY7oEUOTDQR3ChlJdGbDJJUNtPyYdAniC6dP8EQYkzRjSGZtEPGzxhNIUW6rwxpGvp8Nnkk6Nu/jDFITOVW37jF67ljVhNFXrph3H0IAILHEXhzI4K7btdjsa1GqxesqEb7+/IRXE6otD+0CvzUl+7i2mxnQLgSY7/Y07UQ51S40+HIPLCHH2FYCWTFc2JFgkW5iILSKx+u3JpgI3Zdp
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3085
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(39860400002)(396003)(199004)(189003)(25786009)(23756003)(8936002)(8746002)(6512007)(81166006)(26826003)(14454004)(8676002)(6486002)(81156014)(186003)(50466002)(6116002)(102836004)(5660300002)(2906002)(4744005)(3846002)(2351001)(6506007)(36756003)(2501003)(356004)(22756006)(1076003)(107886003)(76176011)(2616005)(7736002)(26005)(6916009)(11346002)(316002)(99286004)(50226002)(5640700003)(336012)(4326008)(36906005)(70586007)(54906003)(76130400001)(86362001)(478600001)(305945005)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0802MB2551;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7cbc9697-e47d-4b37-d00e-08d778afdb94
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sfzv2KJmCXJyXSQpDcC6q0h7kk5lBePX8um8I9XHaiglp4NsCWIBEYVImJjA5wTJz6KSBAaiKhnBNBQ9/mAIzPVoEUX6oAYhlPXWhHUIHnX/Tghn08oLdBQKs1OZmPJvZnNwZb/23o9FY2O2C4p11IoegTXHh14hoBRaTBtD5uIaINZT6TJzesq5glZDDXoMJ2kZzh0m11VIgJ4KlMSmJ0F7ivYQLkQZHFLUEvCxiQ02yBeB6+I5lX8pvZMnTtSXwlB0Ux5iQYeuRdFwVqAMgSTBH27dvZFjM9SCMGot09BKPr0wW7u9vXfbwAjlKiDfEUK/mzIn3hd//tSjYubQw7cC4l1otoIQqCg9ncingXGTNFjeBq/nmAhUYhzcJlUeSN7Zq5aEwq0nM96Ey4o185OTn6tGcs3o/ZNNDLZdtb8OM8oKjlPSqX1+Q4hPuFvJ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:27.1430 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e42a6200-be8b-4729-b08d-08d778afe02e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2551
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Av9EoDIvHqCagseLb7iy4+qbCZH7UsR3146DKkdXRfQ=;
 b=cBkuJABfDC6y3k7unQB2WmrePPwJaSQnaXk9QOfXtAhTC3bpM2iY2SQlXSejigVs4Bmj8hTjxVbSbO83ZuF1jvJ9KaUiKFfvmpmAVhYg8tEeF0ib7aD2glaGnu2IXWvM6dPzlBfDWe+nHUkBHnM/AaIU1dzttwrrckbK1kYu+3A=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Av9EoDIvHqCagseLb7iy4+qbCZH7UsR3146DKkdXRfQ=;
 b=cBkuJABfDC6y3k7unQB2WmrePPwJaSQnaXk9QOfXtAhTC3bpM2iY2SQlXSejigVs4Bmj8hTjxVbSbO83ZuF1jvJ9KaUiKFfvmpmAVhYg8tEeF0ib7aD2glaGnu2IXWvM6dPzlBfDWe+nHUkBHnM/AaIU1dzttwrrckbK1kYu+3A=
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
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10
ZnA0MTAuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAu
YyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMKaW5kZXggYWEzMTk4ZGM5OTAz
Li4zNzdlY2E5ODlmZjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZw
NDEwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYwpAQCAtMzI4LDkg
KzMyOCw4IEBAIHN0YXRpYyBpbnQgdGZwNDEwX2luaXQoc3RydWN0IGRldmljZSAqZGV2LCBib29s
IGkyYykKIAkJcmV0dXJuIC1FTk9NRU07CiAJZGV2X3NldF9kcnZkYXRhKGRldiwgZHZpKTsKIAot
CWR2aS0+YnJpZGdlLmZ1bmNzID0gJnRmcDQxMF9icmlkZ2VfZnVuY3M7Ci0JZHZpLT5icmlkZ2Uu
b2Zfbm9kZSA9IGRldi0+b2Zfbm9kZTsKLQlkdmktPmJyaWRnZS50aW1pbmdzID0gJmR2aS0+dGlt
aW5nczsKKwlkcm1fYnJpZGdlX2luaXQoJmR2aS0+YnJpZGdlLCBkZXYsICZ0ZnA0MTBfYnJpZGdl
X2Z1bmNzLCAmZHZpLT50aW1pbmdzLAorCQkJTlVMTCk7CiAJZHZpLT5kZXYgPSBkZXY7CiAKIAly
ZXQgPSB0ZnA0MTBfcGFyc2VfdGltaW5ncyhkdmksIGkyYyk7Ci0tIAoyLjIzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
