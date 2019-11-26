Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AC6109EEC
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C5F6E388;
	Tue, 26 Nov 2019 13:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140077.outbound.protection.outlook.com [40.107.14.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABF66E354
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:29 +0000 (UTC)
Received: from VI1PR08CA0190.eurprd08.prod.outlook.com (2603:10a6:800:d2::20)
 by AM5PR0801MB1748.eurprd08.prod.outlook.com (2603:10a6:203:3c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.21; Tue, 26 Nov
 2019 13:16:26 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by VI1PR08CA0190.outlook.office365.com
 (2603:10a6:800:d2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:26 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:25 +0000
Received: ("Tessian outbound a8f166c1f585:v33");
 Tue, 26 Nov 2019 13:16:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 09f6c8284b7389b6
X-CR-MTA-TID: 64aa7808
Received: from ec33c90fb7d1.3 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 54F74583-3922-40B4-8F12-49906CFECFC1.1; 
 Tue, 26 Nov 2019 13:16:20 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2059.outbound.protection.outlook.com [104.47.4.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ec33c90fb7d1.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0wuxNqpVlKCPA8sd2NmSu3RQxDlolp+dItjuAwYOfgvBAq5MxWO5FiWplCmpZwWvA1jF7/SgetMec6XgwzBeVvEYWDA6eDijdDzq4rGLKcDM8y/9DG/IGN5S8lUhxI6TgCHaNE3qF/03BGNRyygQdIqokeAnsvD3s5N7dE6Qu3SLbqZz+aGITJ3OkUkLOndABqzUfy28Y1JMMk3ZKowv8/nVfIvErFZl02JmS9LObqPMNfSZ1Uh8+Sl82LM3aw45S5GlHJIqjqre9++YUHLR5v8u0fExYkFByN1z+DTSQe2I43aGFEZfN9J9+tAOXGJSaq61iJYwMPAA9CqvRf5Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opfrCUQhstTmEWhDCMZ446EAzDQXpi+cbl+vvgZtrP0=;
 b=goRF+BtwqgHdqLFEx+wbQN2joBK7S0yUb3O9GSTyLmfp5EEQ5sTUflWqLeWKMv3Cniy/i1mihVhD8dsoA9Avwpu0k/4/m+WvmsAiCe+kDhKcE8IQiVmAoox2py3sbHjThHY5O0QlUYezZ5HKPM9wLGNvrxDbmazPRTSLp63iBCWxKDg3MILZMrj/bElkB9Q5peOwg7r06445cvbfZvYbV0hR5hQXIx39RPw3QldkzKDGpQ9H8QJgleDmR8jKR63ilj3aVtiMb9ysTNvWSK2hEwCHlSPMe7+5gZtAFr8ZqG5lFBnEZZOO8qXLqNBEiCua7DdTbNi3UQgLhLgEeSUnqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4560.eurprd08.prod.outlook.com (20.179.24.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Tue, 26 Nov 2019 13:16:18 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:18 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 20/30] drm/bridge: ti-sn65dsi86: Use drm_bridge_init()
Thread-Topic: [PATCH 20/30] drm/bridge: ti-sn65dsi86: Use drm_bridge_init()
Thread-Index: AQHVpFuwhBOC0MAP/0eKQkaJ/SChuA==
Date: Tue, 26 Nov 2019 13:16:18 +0000
Message-ID: <20191126131541.47393-21-mihail.atanassov@arm.com>
References: <20191126131541.47393-1-mihail.atanassov@arm.com>
In-Reply-To: <20191126131541.47393-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0453.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::33) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 41852630-59be-45da-ccae-08d77272d741
X-MS-TrafficTypeDiagnostic: VI1PR08MB4560:|VI1PR08MB4560:|AM5PR0801MB1748:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB17488870FB6B092D9D2FC8E98F450@AM5PR0801MB1748.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:324;OLM:324;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(189003)(199004)(71190400001)(478600001)(1076003)(66476007)(186003)(26005)(5640700003)(52116002)(64756008)(256004)(8676002)(2351001)(66946007)(54906003)(81156014)(44832011)(3846002)(4744005)(6116002)(6436002)(2616005)(66556008)(71200400001)(2906002)(11346002)(66446008)(99286004)(14454004)(81166006)(6916009)(5660300002)(25786009)(2501003)(8936002)(102836004)(66066001)(36756003)(6486002)(6512007)(386003)(4326008)(50226002)(76176011)(316002)(86362001)(7736002)(446003)(6506007)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4560;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Tx2pvzJtc9BABuIhv7DeCv5wFwyraG+bXovA5x6NNvBd18zwSPL4q+eM0/wFnzBfkoKc1FfyZ81LKfrfEgi2OKkR2WbOvDY7M7Uz5chcgUYPIbBuv9uge1PKH2DdGLGhuZEz2DBANNzYFDlC6tv9lC8bTacUvqFHUq1sHeajE+yuUhX1T96akTm9+cNyt912NW9wnYsNN96IjsLGLkoL5S4Z9VjX4okpenOJc1/wLYL4PGzqa3/AZmh8H21TsbYAIuM65r0vQGeERK4KJgPurvE6zs+jbF4X/elCnz0zhYim62p91sQbcnzc4z7+q50X+f+r7gRUkrpMgjXDiFKKRQiFYkiioBlE2PS6561lP5HABGK7A4rkpCGmfDAOnpTPtHk3JIXJ/w4lAhfPVcybPTkX0Ttdblw0wF2tO+eFWX4scYpZSrtjMnuCLm6ih+37
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4560
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(189003)(199004)(47776003)(14454004)(2501003)(76130400001)(305945005)(22756006)(66066001)(356004)(70206006)(70586007)(107886003)(81156014)(81166006)(6512007)(8676002)(7736002)(26005)(336012)(186003)(1076003)(446003)(2616005)(8936002)(6486002)(11346002)(25786009)(5640700003)(4744005)(5660300002)(8746002)(6916009)(86362001)(50226002)(76176011)(102836004)(2351001)(106002)(4326008)(3846002)(6116002)(478600001)(26826003)(50466002)(23756003)(36906005)(54906003)(2906002)(6506007)(316002)(386003)(36756003)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0801MB1748;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9863b37d-7eb5-4087-8610-08d77272d2d2
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6TnaY+Bvlm54ICypSY5+uxDF41r8WSYb0cywBuZOm+3Jx490zf/yx+ZOIM0CA2rkgOboBKTiM15EddrOP8/upCGlheUXkLPVRLQWvFR/XxqrlrWKql6rTrWvshM7IOMIoQtAbL4nI+piZT9EyWKR92nCBMKQ3Ex/MZwvKeVflwnGVvazTV14D4bc4AHNUS/1Au0Mb2TufnPBYmtI0ZOsChESGRVuLZVj1fUg+tmai19RutEVaDjvem2zMj8L7mLqMB3E4dBBx8mBU+nUVj4ZRntDSQA7vObCJ3qByIXpIzF963abXPtOk0jPS8m/k+AmBRLxiy8HXn3cNkTnZ/pjWm3VQH4oy0k7jJ3GuWoA1+Ik2RmKUb2ikZb75gvEeu+QyUDnPlUCsnxmMAZjrolWbNphw8XzP9J2WSq5dt+Ik7iis7wA63Pqwh/UkjojpMmE
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:25.8875 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41852630-59be-45da-ccae-08d77272d741
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1748
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opfrCUQhstTmEWhDCMZ446EAzDQXpi+cbl+vvgZtrP0=;
 b=CgQBF/V96Kbi+jvdMvPI4lD75fV7KpZJERLH+y0QpNMxzbExmYmBXiqKvWIaHQaV5wEB3JKDJXf/igfAG4kiTJJ0fRLi75+qDJ+WNqib8jnLVgNNOcCCMSSsa2ti1vL7LlE852PPo01P5ijyzpXA8V2sbaVljdHNvyVlp298Now=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opfrCUQhstTmEWhDCMZ446EAzDQXpi+cbl+vvgZtrP0=;
 b=CgQBF/V96Kbi+jvdMvPI4lD75fV7KpZJERLH+y0QpNMxzbExmYmBXiqKvWIaHQaV5wEB3JKDJXf/igfAG4kiTJJ0fRLi75+qDJ+WNqib8jnLVgNNOcCCMSSsa2ti1vL7LlE852PPo01P5ijyzpXA8V2sbaVljdHNvyVlp298Now=
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
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1z
bjY1ZHNpODYuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1
ZHNpODYuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMKaW5kZXggNDNh
YmYwMWViZDRjLi40ZTIzNmI0NmY5MTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvdGktc242NWRzaTg2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNp
ODYuYwpAQCAtNzY1LDkgKzc2NSw4IEBAIHN0YXRpYyBpbnQgdGlfc25fYnJpZGdlX3Byb2JlKHN0
cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsCiAJcGRhdGEtPmF1eC50cmFuc2ZlciA9IHRpX3NuX2F1
eF90cmFuc2ZlcjsKIAlkcm1fZHBfYXV4X3JlZ2lzdGVyKCZwZGF0YS0+YXV4KTsKIAotCXBkYXRh
LT5icmlkZ2UuZnVuY3MgPSAmdGlfc25fYnJpZGdlX2Z1bmNzOwotCXBkYXRhLT5icmlkZ2Uub2Zf
bm9kZSA9IGNsaWVudC0+ZGV2Lm9mX25vZGU7Ci0KKwlkcm1fYnJpZGdlX2luaXQoJnBkYXRhLT5i
cmlkZ2UsICZjbGllbnQtPmRldiwgJnRpX3NuX2JyaWRnZV9mdW5jcywKKwkJCU5VTEwsIE5VTEwp
OwogCWRybV9icmlkZ2VfYWRkKCZwZGF0YS0+YnJpZGdlKTsKIAogCXRpX3NuX2RlYnVnZnNfaW5p
dChwZGF0YSk7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
