Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 783C8109EDA
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A2C6E32E;
	Tue, 26 Nov 2019 13:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40078.outbound.protection.outlook.com [40.107.4.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF10B6E313
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:16 +0000 (UTC)
Received: from HE1PR08CA0049.eurprd08.prod.outlook.com (2603:10a6:7:2a::20) by
 AM0PR08MB4306.eurprd08.prod.outlook.com (2603:10a6:208:139::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.21; Tue, 26 Nov
 2019 13:16:14 +0000
Received: from VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::201) by HE1PR08CA0049.outlook.office365.com
 (2603:10a6:7:2a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:13 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT059.mail.protection.outlook.com (10.152.19.60) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:13 +0000
Received: ("Tessian outbound 712c40e503a7:v33");
 Tue, 26 Nov 2019 13:16:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 31ebd2a57fed7892
X-CR-MTA-TID: 64aa7808
Received: from 687810ec6074.6 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8D7AB900-D71B-489F-BCC2-9D29B41A4481.1; 
 Tue, 26 Nov 2019 13:16:02 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 687810ec6074.6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRl5LC4OSqCc4HYT+IQ5O44rk/AhPl8oNMvnHF5Iyd5WTEHGjtlJZfwIR1IndkBzkxwZwd5ankj3TcdN6WUtu13Y+NhSkSjaREtML7BBLrYqNE6ZoJ95QRPgEqr8jo0VWaehPHhz05s2aIxK7FKZTgMnHiqei4T6fQYC1VQM7rfQAa4rD5PI2hE9+aDskIy2PbcTKq4dqbFAdj/oPwKU4R43sjGebcKk9/gbfBJrPLD4JrwlwFdSqFE2tKOmd0jpAvnRMdASX1DFEouGzsVXdeuoGdyD+zPUW3ITvDxGq7H+DkNOX6kPB5+EviuNZuekgxjFfQEoQz1zsnMqKvrl9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2w9IwS9h8Xe+mRvYuwjPJLzvhx/Jnmzx3UokA4i7RFI=;
 b=XOePaeIU/cmAJtncV5spBHQV6aWoEPau30ZE4j9Phb8SE3Ixil7BaKto9AN0lFRTiVYkvJNL7Idxq0rqlLoZyll4fAt94Hm2jqhNS+/ECzvYys9hqEABXX0Mx48Fi06udhRIaZZcNjRzp+forwDhPqdil4I2LhaiKjJRcNbu0TIjp8FFIOXV+dL6ApteaJ0CQ4eEE1sqheMizT3jFF9ijkrtZkU+1cOzpWwfpZn+6CB/+Hf1s7uGEQMbh+omxqrDquAKFQkjSJibaE2JZ+eqAGIYbFdxFakySkxuV3tNtdvZmepW6yXecfYUU7MBZ1d005p9BQpZ4sBCx1+GWx5a3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:00 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:00 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 02/30] drm/bridge: adv7511: Use drm_bridge_init()
Thread-Topic: [PATCH 02/30] drm/bridge: adv7511: Use drm_bridge_init()
Thread-Index: AQHVpFulRTJQhgMARkmWRCm2W3cWxg==
Date: Tue, 26 Nov 2019 13:16:00 +0000
Message-ID: <20191126131541.47393-3-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: feae1f3c-4102-4eaf-8247-08d77272cfb7
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|AM0PR08MB4306:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB43062B6372AF0033E9BEBBC18F450@AM0PR08MB4306.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:376;OLM:376;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(5640700003)(86362001)(6512007)(71200400001)(2616005)(6486002)(71190400001)(2906002)(4326008)(6916009)(44832011)(446003)(11346002)(54906003)(66946007)(316002)(66446008)(64756008)(66556008)(66476007)(6436002)(7416002)(4744005)(8936002)(186003)(26005)(5660300002)(102836004)(305945005)(14454004)(25786009)(99286004)(81166006)(50226002)(478600001)(2501003)(7736002)(6116002)(2351001)(76176011)(1076003)(52116002)(66066001)(256004)(8676002)(81156014)(6506007)(3846002)(386003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4317;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: hUGY10/nULHWlcwgw/scw0/nznZBBFiHEgu1jAmQQe2wSWpQtdpIS564otz69+crfnJ5nPaL/FiXWeVW2HS/mBE1m1DfnQ6XxOSoH4661QlP54atbm7jX/BzklfIjMAFpFCA0uNNAYjF7aavQBiWTe86fG/2KwzIUww8Qn0RzguC6/1lq+Xx2I/xt8nihfGwY4Tp6ZSgHftAl1S74MMfLPLOLaGVw0vpNHmsdhdS8S0mrREv80cMQ387gBxsEHVXFZqV3V9QvOctRvua34rrW7S5HYlurD3L4a9j1+yyKKRQL76uvrWFTwG0wAWhJFjbds/0l4vTxaOmILkIlbRKpHtY0MjaZNndAIAA8vtlFt4h0zNarOp6S61w6XYcXU+qaVY6cr5IB5ijWC51uOo8h0V/F1xOIiYKdIY73Qy+G8e0EHVj7f5h2srajru9AP2u
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(396003)(136003)(199004)(189003)(2906002)(66066001)(50466002)(186003)(26005)(47776003)(478600001)(23756003)(14454004)(76130400001)(1076003)(4744005)(76176011)(106002)(70206006)(70586007)(102836004)(86362001)(5660300002)(316002)(36906005)(2501003)(7736002)(26826003)(6506007)(386003)(25786009)(336012)(54906003)(305945005)(22756006)(11346002)(81156014)(3846002)(6116002)(2351001)(6916009)(36756003)(8936002)(2616005)(50226002)(8746002)(8676002)(6486002)(4326008)(99286004)(5640700003)(107886003)(446003)(356004)(81166006)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4306;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 204063af-26b1-4d9f-3e1b-08d77272c7bd
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Y3RmPAgRy058By2QEpHqhn1r0zyvjPgvhWFLhGJN2zNFhhDI3zpJZdM7VJt8VhduD/tTRGDyPAzsfgQ3BFxzo27/1JVozFSsNoRoAh5TuJB6cSjypZWQwBdXjJH9yn6lvkkBHSqbgqm683cSDXyZY/fV9v8WiXzGx67rIOSjtvp6gnJLKbwX/GErQU5TcRcBxyw+NW/xJ6MrcY07Efl9glCcO13vfokFDIwbmC1sWOxXW0DR/hAjSl/8LLPkRJGK1MjuG8iMLPZy37SaSz8s+ZvswJ368P5Wm/Y/LccVIUpH9JCvuDL5t3ri0WDB6p7esqqFUvFcPa3s/qjPNW3cdFv5kTy2gndHLPWLnCOa2afjUe33ybGpTCnqe+kC/GTZ0bGuw/OS0K67/aBWUVvCyuZ5ZCpT4DKcgSjbgYEoF2Wg7T7fd2AioOLHWRcJl+O
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:13.1581 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: feae1f3c-4102-4eaf-8247-08d77272cfb7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4306
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2w9IwS9h8Xe+mRvYuwjPJLzvhx/Jnmzx3UokA4i7RFI=;
 b=Bll5d6fmRH0yG0paS2A2N7B6RAMf48kNB26Z4sujqxvLwG3S4VprSzPy0jq+LhlfuYNmh0CBpgClxjYSP/tesDV52yQ1uZKkZpJdsGpWCxdjL5/bxf+CuJ9E5aWux3pX6lmcnnzo09Wdb5QMjxynnjJLId0oj0hl6Uci+8V38dQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2w9IwS9h8Xe+mRvYuwjPJLzvhx/Jnmzx3UokA4i7RFI=;
 b=Bll5d6fmRH0yG0paS2A2N7B6RAMf48kNB26Z4sujqxvLwG3S4VprSzPy0jq+LhlfuYNmh0CBpgClxjYSP/tesDV52yQ1uZKkZpJdsGpWCxdjL5/bxf+CuJ9E5aWux3pX6lmcnnzo09Wdb5QMjxynnjJLId0oj0hl6Uci+8V38dQ=
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>, Matt Redfearn <matt.redfearn@thinci.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3
NTExL2Fkdjc1MTFfZHJ2LmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
YWR2NzUxMS9hZHY3NTExX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fk
djc1MTFfZHJ2LmMKaW5kZXggOWUxM2U0NjZlNzJjLi43MzYwMGQ4NzY2ZjggMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jCkBAIC0xMjE2LDkgKzEyMTYs
OCBAQCBzdGF0aWMgaW50IGFkdjc1MTFfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmkyYywgY29u
c3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlkKQogCWlmIChyZXQpCiAJCWdvdG8gZXJyX3VucmVn
aXN0ZXJfY2VjOwogCi0JYWR2NzUxMS0+YnJpZGdlLmZ1bmNzID0gJmFkdjc1MTFfYnJpZGdlX2Z1
bmNzOwotCWFkdjc1MTEtPmJyaWRnZS5vZl9ub2RlID0gZGV2LT5vZl9ub2RlOwotCisJZHJtX2Jy
aWRnZV9pbml0KCZhZHY3NTExLT5icmlkZ2UsIGRldiwgJmFkdjc1MTFfYnJpZGdlX2Z1bmNzLAor
CQkJTlVMTCwgTlVMTCk7CiAJZHJtX2JyaWRnZV9hZGQoJmFkdjc1MTEtPmJyaWRnZSk7CiAKIAlh
ZHY3NTExX2F1ZGlvX2luaXQoZGV2LCBhZHY3NTExKTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
