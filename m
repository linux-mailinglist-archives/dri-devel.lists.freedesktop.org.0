Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E32112A79
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:48:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD82F6E8C8;
	Wed,  4 Dec 2019 11:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130087.outbound.protection.outlook.com [40.107.13.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D63A6E175
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:48:15 +0000 (UTC)
Received: from VI1PR0801CA0069.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::13) by AM6PR08MB4753.eurprd08.prod.outlook.com
 (2603:10a6:20b:cb::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12; Wed, 4 Dec
 2019 11:48:12 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::205) by VI1PR0801CA0069.outlook.office365.com
 (2603:10a6:800:7d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:12 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:12 +0000
Received: ("Tessian outbound 691822eda51f:v37");
 Wed, 04 Dec 2019 11:48:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 717e2d4d0e7512b2
X-CR-MTA-TID: 64aa7808
Received: from b2b246179d1c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F9F0B099-DFB4-4AE9-A4A0-2337A0979941.1; 
 Wed, 04 Dec 2019 11:48:06 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b2b246179d1c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=em103aLbp1u9HQhHMFpAwSoGvesKDRirkEW5nG3Be1TydbEKoCWdd4zIu6oQqo/BnrEifXtKuGiNxUJw/jiKoSSqN4XWSKsumyuS3p8gGQ8KsZZwtZUWrQP/6zJX5onVtQBsyYYkAP50xLYApU4DtkQUCuo0JAZF4XlHQcJQhj3PyZSIJnr/pPneNPz6N8oMWGYIBiUKnJ+z6e2ngLKfRYPsUYZY1D2mQHjqJK2wWOghfmDxSY8crgg/jTTQVUmtW26g/Cw2qVWnM4dV2ZilFSguINcQhRnfTZcXESN9jVkdhuzgPWBRs91PKjxMjoAuWMAhb9iDmDYYrH+WHj6J1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2w9IwS9h8Xe+mRvYuwjPJLzvhx/Jnmzx3UokA4i7RFI=;
 b=AquXxAbKrykiwCBPKNCkVErB5IursPKASVkIRqtHO4npnZSCjQF7q285UD0tf1HjlORzUgAkHX2SwTpcSuGN8/x8H526U3ZaphB2NXml+MfoWs4/Erf9iarw6dODLdwBqg0cfLpvSWR9SgguZ+BeoDBfYJ2c2odrDcbnWkHIxRlbejOgK2CQzjdboxZYN4Dh69WxY7CMCeC1n7jzQL2UpGIBH9BniCp6Naj2fyDblbqMFpcEmR+yvkOzPGxPtdDmU6uuFi0siIcoeZdbEhX+7ueIvftjnm1LurMqyuBQkyeRImFKN8rIVC4ZVS/MvriZb12y1KAOMD6giVnW+/v+sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3085.eurprd08.prod.outlook.com (52.133.15.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Wed, 4 Dec 2019 11:48:04 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:04 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 02/28] drm/bridge: adv7511: Use drm_bridge_init()
Thread-Topic: [PATCH v2 02/28] drm/bridge: adv7511: Use drm_bridge_init()
Thread-Index: AQHVqpivL9XMRFOhwE2O6FoRhLb0GA==
Date: Wed, 4 Dec 2019 11:48:03 +0000
Message-ID: <20191204114732.28514-3-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: e8fb8960-8082-4a5b-c96d-08d778afd73f
X-MS-TrafficTypeDiagnostic: VI1PR08MB3085:|VI1PR08MB3085:|AM6PR08MB4753:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB475314C1CC6A251A7C8A703C8F5D0@AM6PR08MB4753.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:376;OLM:376;
x-forefront-prvs: 0241D5F98C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(199004)(189003)(2501003)(1076003)(478600001)(4744005)(6436002)(6512007)(8936002)(6486002)(54906003)(44832011)(4326008)(316002)(50226002)(8676002)(5660300002)(2906002)(81156014)(81166006)(7416002)(6116002)(3846002)(66946007)(66476007)(66556008)(66446008)(64756008)(11346002)(186003)(2616005)(14454004)(52116002)(76176011)(99286004)(2351001)(25786009)(86362001)(26005)(5640700003)(6916009)(102836004)(71200400001)(305945005)(7736002)(71190400001)(6506007)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3085;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: RgCd+RHzocEtpskmBLtyY7/wW8DEc9zhm0qPOzrB3PQA5V4j54pkkq7Rwah9uS7uJVS8DKZl6YfR0FqeZaQFwBvzHf/PDaQsC2Bp4+8wzE7cMzv4JV1UMc5CaXkdEpv8FwjSUuRnm4inC8R2Puqu+0Sfkt8h9MBt4K5lytwUKdFeUF7SJpvJkge8tzxVI9s3pZ633bDYxkdQck8LD06dd4akSZiYISPTypTn64B7Cs7X26kmpXdAqQ5IMyGAe5loZxaOc/GsM9klYb6qJFFmHu1xIqGlY7R6TZMzioefaCQ5wzm4NStfwZgnM4ud9x0cBRbyX1/66VFkTDHVdUcm3+mvR60df9vbbvAwXRua380tM1p3KXuSnSlZ5n2TlOdR321zULR2MMsFYroOr9jQNqpU5YBspgcAkGUNVEwpFfmmSjPHP5RuAGFHw1zE2EB5
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3085
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(39860400002)(189003)(199004)(2501003)(50466002)(7736002)(99286004)(70206006)(316002)(356004)(36906005)(86362001)(23756003)(336012)(6506007)(186003)(8746002)(11346002)(50226002)(81166006)(4744005)(81156014)(76130400001)(26005)(76176011)(8676002)(2616005)(1076003)(70586007)(8936002)(102836004)(3846002)(478600001)(25786009)(6916009)(22756006)(5640700003)(4326008)(2351001)(107886003)(6512007)(5660300002)(54906003)(14454004)(305945005)(6116002)(6486002)(36756003)(2906002)(26826003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4753;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a8e4b175-9ff7-4e92-0eb5-08d778afd1df
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FU4UDsJ2lRQhyJUx62cZJpvUQvAgu9rVDA0pLMekhCsX/533UOefV/9ZXO9rRauPtI/EnMpWnrXlqXs9Wvux5VXkaf0HyjiZ97EPu36RPMgKJ+BcJbl0sMua5BKM4V160MlHe7lwyrDHiRz96o2fTEXKgzFkcI+DMegQMwCSegLvzOy5fVsVdNDHX3Wb5oyP5JSmP/rQ0mYQ/yst16yhJk6q7U02Ppj9a8e7LNBlTSWHYgBKqRWaz0AHc78Tq3o3H3bz5KIpQWA9izFVFFGi84Qz7txGMDWLi/3Tw/Ak62IWxsRTCiKz57KNnvILezQvWTNKgxLCgJRU0SGi/OZw2sCoZsfxQZdft/nklT8eCpjSLCm7ubb2LoBQE5fwfLqRgDic6cOwEw0GPC0FaVxKDvWBQZK4lA4LA4/Gp0Isqs3qpZoJZDcuyWdNPpEqkMXW
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:12.1065 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8fb8960-8082-4a5b-c96d-08d778afd73f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4753
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2w9IwS9h8Xe+mRvYuwjPJLzvhx/Jnmzx3UokA4i7RFI=;
 b=KqEffK2SJj3rTIjudwFyYTMxvDX/UiNB/sbU8YtNfAS9++1qEzHD6L/dMYLR4NupzvyM9hzQknfXD31CSOk4Ubl0RH9AfrHJXYhepp9EnUosX5A6qw6z+w8KJ0OHHG04LnpXaViAqaT5X4wCGdVL6IzEmg0iSPtmvt/fzkZFbn4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2w9IwS9h8Xe+mRvYuwjPJLzvhx/Jnmzx3UokA4i7RFI=;
 b=KqEffK2SJj3rTIjudwFyYTMxvDX/UiNB/sbU8YtNfAS9++1qEzHD6L/dMYLR4NupzvyM9hzQknfXD31CSOk4Ubl0RH9AfrHJXYhepp9EnUosX5A6qw6z+w8KJ0OHHG04LnpXaViAqaT5X4wCGdVL6IzEmg0iSPtmvt/fzkZFbn4=
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
