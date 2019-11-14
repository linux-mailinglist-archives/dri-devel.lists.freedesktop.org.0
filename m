Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5D0FC1A6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:37:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF246E3C6;
	Thu, 14 Nov 2019 08:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50084.outbound.protection.outlook.com [40.107.5.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D196E3C6
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 08:37:37 +0000 (UTC)
Received: from AM4PR08CA0047.eurprd08.prod.outlook.com (2603:10a6:205:2::18)
 by AM6PR08MB3654.eurprd08.prod.outlook.com (2603:10a6:20b:4d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.25; Thu, 14 Nov
 2019 08:37:35 +0000
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::201) by AM4PR08CA0047.outlook.office365.com
 (2603:10a6:205:2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.22 via Frontend
 Transport; Thu, 14 Nov 2019 08:37:35 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23 via Frontend Transport; Thu, 14 Nov 2019 08:37:34 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Thu, 14 Nov 2019 08:37:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ef44006d2a0e0b86
X-CR-MTA-TID: 64aa7808
Received: from 3ea362dbe0f1.2 (cr-mta-lb-1.cr-mta-net [104.47.6.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AB8C96AF-C819-4356-BFFE-22504439D382.1; 
 Thu, 14 Nov 2019 08:37:28 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3ea362dbe0f1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Nov 2019 08:37:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGY1Tr+IoapMO6nFGGZk1Di1nQeg/noQYNX8hDS71trYaUOmtWTLBykewlvxtJgCI5ip4DfbHc+EUBXgPhRJGLCfkH545pH2XaZPIkinqSNFr6J9OxBVjMs0KT9IxSASt7++A0m5XpG243etVprtkzSYlMvuM6tRh6t8MlM42vMuCwvzoDGrjaeJAOlj9KtpS3xtMaPCb67zI2ZpqDRQ/ylFjTwwXeOGKT1SQ0G8x2WWvRLCnkJmxatbh/uVsHN0aY3/uaQ57vNay0fAfA3KE8Zfp2g/G6XyDNuKsLDWbcaw75wnEzO0GeI1gvKvUXFh6OjjX4aPqc9vQaQ4KUNFmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsOUzp77nJl9O3WojFtY2JRXsyfXhsor1OJ5olyuFR0=;
 b=VfRrN9zG0R9vsCdDN0qllC9m5lLXfe/glA5/Tke77uQBeetIjucJDlaWQiEejLsje2lQshXSKGhQr9pj3c87xlLYaNCk04BGH9t4q4YkpOj9kDXuenkK6aOhkXLpX2KoBxOQt+MqOQGNj9X9xUpIUZhVLvYwWQLwIwWtJYRPT9NsXA4wL8RKNO+sXdvMcFOVnMBTV03GaUAbZVWAY9+H/Od3oRFycMSZym75zhyY09O7NJcfRtWRZ6cLOAtV9GTWbcpIhk+EnMB5PvQe41zRKdUk11aHwSLOOLq0vWHM+77OV6C85kvpSRkDDj4xDfGKMJm+Ss2Yo41HPOLFM2psLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4782.eurprd08.prod.outlook.com (10.255.115.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Thu, 14 Nov 2019 08:37:25 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2451.023; Thu, 14 Nov 2019
 08:37:25 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH v3 1/6] drm/komeda: Add side by side assembling
Thread-Topic: [PATCH v3 1/6] drm/komeda: Add side by side assembling
Thread-Index: AQHVmsa9UkYGk9o7O0O+920wharNZA==
Date: Thu, 14 Nov 2019 08:37:24 +0000
Message-ID: <20191114083658.27237-2-james.qian.wang@arm.com>
References: <20191114083658.27237-1-james.qian.wang@arm.com>
In-Reply-To: <20191114083658.27237-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0038.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3e::26) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 081fc7a1-46b4-4117-be52-08d768dde5d7
X-MS-TrafficTypeDiagnostic: VE1PR08MB4782:|VE1PR08MB4782:|AM6PR08MB3654:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3654712367910FA3D2605A9CB3710@AM6PR08MB3654.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3044;OLM:3044;
x-forefront-prvs: 02213C82F8
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(39850400004)(366004)(396003)(189003)(199004)(25786009)(486006)(66476007)(66446008)(66946007)(66556008)(64756008)(66066001)(11346002)(4326008)(386003)(6636002)(8936002)(446003)(2616005)(476003)(305945005)(14454004)(2501003)(478600001)(36756003)(7736002)(1076003)(5660300002)(54906003)(256004)(14444005)(316002)(6436002)(6512007)(71190400001)(52116002)(71200400001)(110136005)(76176011)(8676002)(102836004)(6506007)(6486002)(2201001)(55236004)(50226002)(103116003)(26005)(86362001)(186003)(3846002)(2906002)(81166006)(81156014)(6116002)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4782;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: KVe4BfeS7WEdRZ90f2As8N+RcKkFWSeROha2cSQNjLMU4uWrplslVjct+5o2KYyZ8gc/dPbbrdlj06FqN8edISH6z4Lk0tWW1SsnxgmDM6qpov/oxBI+se70xmLTTF9aE4iVRoVF7TgXMRLbSBMSjblfw5qNrq2H/1PWLefZCIg2NEUH6rNMQ6gaaLodKiPZjQGWu+/c+OeO70dcJKnmmVFCt0OtZdEcGdS4ueD2Qp1FjQ+8N6qIKastw6CnqNCaa6rQuJCu7RAg4XyEfh+E4B5JCharKsMiRA9RgNpJPhkR5yjgGHgI8LHxEZD6tG2cgHqYx3cHpueQOjO+WTxB2iOf4hSkDItiU9NQjzDH135nR/qfH/fgfkoUE+FGB2SyJTdtiiapLGlIZQoSbb8Jo6xN5nFVXheFbqdpKJ5CIBNP+uIJV3za30dnN7jELX7a
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4782
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39850400004)(346002)(376002)(1110001)(339900001)(189003)(199004)(8676002)(81166006)(8936002)(54906003)(1076003)(22756006)(81156014)(6486002)(70586007)(105606002)(6512007)(305945005)(76130400001)(8746002)(5660300002)(110136005)(99286004)(7736002)(70206006)(316002)(50226002)(86362001)(50466002)(26826003)(478600001)(2906002)(23756003)(356004)(6506007)(2201001)(26005)(36756003)(2501003)(6116002)(6636002)(66066001)(14454004)(47776003)(386003)(186003)(25786009)(336012)(2616005)(476003)(103116003)(486006)(76176011)(4326008)(126002)(14444005)(11346002)(102836004)(446003)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3654;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: db6ed058-2e0e-4029-4a3a-08d768dddfbc
NoDisclaimer: True
X-Forefront-PRVS: 02213C82F8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ITyu6yqYBKzt/4ZUeV8T/UR+GEVGv3U6nRLv5hK4t5Ifj3DFVWceSyPSX9oMVszyXkgxthDHRlwOSsgdGgDLepCZKes5bslziVQUPAv5EIMQgRtU1cxr+C6P5uV/FrcnyzMBjYHeevVUvpo4xMlgFIQn8HcynqQPC0OO0PaAq9ByF23rjhcv23uXEsZ9aa+bydPCxwqJ1fCZ5il9pPNbcGBFktjCzflaYR+NQ4tKjxuSiq6B1gSP5HWYrQY/UhNDKaQNz85EkRiQNUkezOE2inUm6AiauQ2M2jDFZv2IoGYxxdpiT0wkfAjm8XS+er9qojU/tjm2J+T4KCQIOvhFMJP5x0DyD88kkqtHPb8OKpWaKE7w4T4DyScGVjclKqUjA6P1A6brnYo6RJtqEtqk7TZ8utUQHheatBjTnTTKPsylIbo2udv94bf2gN4ux0W/
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2019 08:37:34.8826 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 081fc7a1-46b4-4117-be52-08d768dde5d7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3654
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsOUzp77nJl9O3WojFtY2JRXsyfXhsor1OJ5olyuFR0=;
 b=rS0OBR4p14/DJju/VzEVcfPJYYl0h6oAFyTlcYVGc0XjKwIx/+d+OWRZXtOjUb8pp7YP17XXbYaqVgasyhxfG5QTX1vhZoJv8aFGAkQavkB17NawyP2rxRl1l1leW4mhsqYy3X8aBEnyN4ywX8GG2sXZ72PS20r9x/GxX0e/e5I=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsOUzp77nJl9O3WojFtY2JRXsyfXhsor1OJ5olyuFR0=;
 b=rS0OBR4p14/DJju/VzEVcfPJYYl0h6oAFyTlcYVGc0XjKwIx/+d+OWRZXtOjUb8pp7YP17XXbYaqVgasyhxfG5QTX1vhZoJv8aFGAkQavkB17NawyP2rxRl1l1leW4mhsqYy3X8aBEnyN4ywX8GG2sXZ72PS20r9x/GxX0e/e5I=
X-Mailman-Original-Authentication-Results: spf=fail (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=none
 action=none header.from=arm.com;
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

S29tZWRhIEhXIGNhbiBzdXBwb3J0IHNpZGUgYnkgc2lkZSwgd2hpY2ggc3BsaXRzIHRoZSBpbnRl
cm5hbCBkaXNwbGF5CnByb2Nlc3NpbmcgdG8gdHdvIHNpbmdsZSBoYWx2ZXMgKExFRlQvUklHSFQp
IGFuZCBoYW5kbGUgdGhlbSBieSB0d28KcGlwZWxpbmVzIHNlcGFyYXRlbHkuCmtvbWVkYSAic2lk
ZSBieSBzaWRlIiBpcyBlbmFibGVkIGJ5IERUIHByb3BlcnR5OiAic2lkZV9ieV9zaWRlX21hc3Rl
ciIsCm9uY2UgRFQgY29uZmlndXJlZCBzaWRlIGJ5IHNpZGUsIGtvbWVkYSBuZWVkIHRvIHZlcmlm
eSBpdCB3aXRoIEhXJ3MKY29uZmlndXJhdGlvbiwgYW5kIGFzc2VtYmxlIGl0IGZvciB0aGUgZnVy
dGhlciB1c2FnZS4KCnYzOiBDb3JyZWN0IGEgdHlwby4KClNpZ25lZC1vZmYtYnk6IEphbWVzIFFp
YW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4K
LS0tCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyAgfCAxMyAr
KysrLQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyAgIHwgIDMg
KysKIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmggICB8ICA5ICsr
KysKIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmggICB8ICAzICsr
CiAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuYyAgfCA1MCArKysr
KysrKysrKysrKysrKy0tCiAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxp
bmUuaCAgfCAgMSArCiA2IGZpbGVzIGNoYW5nZWQsIDczIGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
Y3J0Yy5jCmluZGV4IDFjNDUyZWE3NTk5OS4uY2VlOWExNjkyZTcxIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCkBAIC01NjEsMjEgKzU2
MSwzMCBAQCBpbnQga29tZWRhX2ttc19zZXR1cF9jcnRjcyhzdHJ1Y3Qga29tZWRhX2ttc19kZXYg
KmttcywKIAlrbXMtPm5fY3J0Y3MgPSAwOwogCiAJZm9yIChpID0gMDsgaSA8IG1kZXYtPm5fcGlw
ZWxpbmVzOyBpKyspIHsKKwkJLyogaWYgc2JzLCBvbmUga29tZWRhX2RldiBvbmx5IGNhbiByZXBy
ZXNlbnQgb25lIENSVEMgKi8KKwkJaWYgKG1kZXYtPnNpZGVfYnlfc2lkZSAmJiBpICE9IG1kZXYt
PnNpZGVfYnlfc2lkZV9tYXN0ZXIpCisJCQljb250aW51ZTsKKwogCQljcnRjID0gJmttcy0+Y3J0
Y3Nba21zLT5uX2NydGNzXTsKIAkJbWFzdGVyID0gbWRldi0+cGlwZWxpbmVzW2ldOwogCiAJCWNy
dGMtPm1hc3RlciA9IG1hc3RlcjsKIAkJY3J0Yy0+c2xhdmUgID0ga29tZWRhX3BpcGVsaW5lX2dl
dF9zbGF2ZShtYXN0ZXIpOworCQljcnRjLT5zaWRlX2J5X3NpZGUgPSBtZGV2LT5zaWRlX2J5X3Np
ZGU7CiAKIAkJaWYgKGNydGMtPnNsYXZlKQogCQkJc3ByaW50ZihzdHIsICJwaXBlLSVkIiwgY3J0
Yy0+c2xhdmUtPmlkKTsKIAkJZWxzZQogCQkJc3ByaW50ZihzdHIsICJOb25lIik7CiAKLQkJRFJN
X0lORk8oIkNSVEMtJWQ6IG1hc3RlcihwaXBlLSVkKSBzbGF2ZSglcykuXG4iLAotCQkJIGttcy0+
bl9jcnRjcywgbWFzdGVyLT5pZCwgc3RyKTsKKwkJRFJNX0lORk8oIkNSVEMtJWQ6IG1hc3Rlcihw
aXBlLSVkKSBzbGF2ZSglcykgc2JzKCVzKS5cbiIsCisJCQkga21zLT5uX2NydGNzLCBtYXN0ZXIt
PmlkLCBzdHIsCisJCQkgY3J0Yy0+c2lkZV9ieV9zaWRlID8gIk9uIiA6ICJPZmYiKTsKIAogCQlr
bXMtPm5fY3J0Y3MrKzsKKworCQlpZiAobWRldi0+c2lkZV9ieV9zaWRlKQorCQkJYnJlYWs7CiAJ
fQogCiAJcmV0dXJuIDA7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9kZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2Rldi5jCmluZGV4IDRlNDZmNjUwZmRkZi4uYzNmYTQ4MzVjYjhkIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwpAQCAtMTc4LDYg
KzE3OCw5IEBAIHN0YXRpYyBpbnQga29tZWRhX3BhcnNlX2R0KHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCiAJCX0KIAl9CiAKKwltZGV2LT5zaWRlX2J5X3NpZGUg
PSAhb2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICJzaWRlX2J5X3NpZGVfbWFzdGVyIiwKKwkJCQkJ
CSAgICZtZGV2LT5zaWRlX2J5X3NpZGVfbWFzdGVyKTsKKwogCXJldHVybiByZXQ7CiB9CiAKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5o
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmgKaW5kZXgg
ZDQwNmE0ZDgzMzUyLi40NzE2MDRiNDI0MzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oCkBAIC0xODMsNiArMTgzLDE1IEBAIHN0cnVjdCBr
b21lZGFfZGV2IHsKIAogCS8qKiBAaXJxOiBpcnEgbnVtYmVyICovCiAJaW50IGlycTsKKwkvKioK
KwkgKiBAc2lkZV9ieV9zaWRlOgorCSAqCisJICogb24gc2JzIHRoZSB3aG9sZSBkaXNwbGF5IGZy
YW1lIHdpbGwgYmUgc3BsaXQgdG8gdHdvIGhhbHZlcyAoMToyKSwKKwkgKiBtYXN0ZXIgcGlwZWxp
bmUgaGFuZGxlcyB0aGUgbGVmdCBwYXJ0LCBzbGF2ZSBmb3IgdGhlIHJpZ2h0IHBhcnQKKwkgKi8K
Kwlib29sIHNpZGVfYnlfc2lkZTsKKwkvKiogQHNpZGVfYnlfc2lkZV9tYXN0ZXI6IG1hc3RlciBw
aXBlIGlkIGZvciBzaWRlIGJ5IHNpZGUgKi8KKwlpbnQgc2lkZV9ieV9zaWRlX21hc3RlcjsKIAog
CS8qKiBAbG9jazogdXNlZCB0byBwcm90ZWN0IGRwbW9kZSAqLwogCXN0cnVjdCBtdXRleCBsb2Nr
OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
a21zLmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaApp
bmRleCA0NTZmM2M0MzU3MTkuLmFlNjY1NGZlOTVlMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgKQEAgLTc2LDYgKzc2LDkgQEAgc3RydWN0
IGtvbWVkYV9jcnRjIHsKIAkgKi8KIAlzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICpzbGF2ZTsKIAor
CS8qKiBAc2lkZV9ieV9zaWRlOiBpZiB0aGUgbWFzdGVyIGFuZCBzbGF2ZSB3b3JrcyBvbiBzaWRl
IGJ5IHNpZGUgbW9kZSAqLworCWJvb2wgc2lkZV9ieV9zaWRlOworCiAJLyoqIEBzbGF2ZV9wbGFu
ZXM6IGtvbWVkYSBzbGF2ZSBwbGFuZXMgbWFzayAqLwogCXUzMiBzbGF2ZV9wbGFuZXM7CiAKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVs
aW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGlu
ZS5jCmluZGV4IDQ1MmU1MDVhMWZkMy4uMTA0ZTI3Y2MxZGMzIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmMKQEAgLTMyNiwx
NCArMzI2LDU2IEBAIHN0YXRpYyB2b2lkIGtvbWVkYV9waXBlbGluZV9hc3NlbWJsZShzdHJ1Y3Qg
a29tZWRhX3BpcGVsaW5lICpwaXBlKQogc3RydWN0IGtvbWVkYV9waXBlbGluZSAqCiBrb21lZGFf
cGlwZWxpbmVfZ2V0X3NsYXZlKHN0cnVjdCBrb21lZGFfcGlwZWxpbmUgKm1hc3RlcikKIHsKLQlz
dHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqc2xhdmU7CisJc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYg
PSBtYXN0ZXItPm1kZXY7CisJc3RydWN0IGtvbWVkYV9jb21wb25lbnQgKmNvbXAsICpzbGF2ZTsK
Kwl1MzIgYXZhaWxfaW5wdXRzOworCisJLyogb24gU0JTLCBzbGF2ZSBwaXBlbGluZSBtZXJnZSB0
byBtYXN0ZXIgdmlhIGltYWdlIHByb2Nlc3NvciAqLworCWlmIChtZGV2LT5zaWRlX2J5X3NpZGUp
IHsKKwkJY29tcCA9ICZtYXN0ZXItPmltcHJvYy0+YmFzZTsKKwkJYXZhaWxfaW5wdXRzID0gS09N
RURBX1BJUEVMSU5FX0lNUFJPQ1M7CisJfSBlbHNlIHsKKwkJY29tcCA9ICZtYXN0ZXItPmNvbXBp
ei0+YmFzZTsKKwkJYXZhaWxfaW5wdXRzID0gS09NRURBX1BJUEVMSU5FX0NPTVBJWlM7CisJfQog
Ci0Jc2xhdmUgPSBrb21lZGFfY29tcG9uZW50X3BpY2t1cF9pbnB1dCgmbWFzdGVyLT5jb21waXot
PmJhc2UsCi0JCQkJCSAgICAgIEtPTUVEQV9QSVBFTElORV9DT01QSVpTKTsKKwlzbGF2ZSA9IGtv
bWVkYV9jb21wb25lbnRfcGlja3VwX2lucHV0KGNvbXAsIGF2YWlsX2lucHV0cyk7CiAKIAlyZXR1
cm4gc2xhdmUgPyBzbGF2ZS0+cGlwZWxpbmUgOiBOVUxMOwogfQogCitzdGF0aWMgaW50IGtvbWVk
YV9hc3NlbWJsZV9zaWRlX2J5X3NpZGUoc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCit7CisJc3Ry
dWN0IGtvbWVkYV9waXBlbGluZSAqbWFzdGVyLCAqc2xhdmU7CisJaW50IGk7CisKKwlpZiAoIW1k
ZXYtPnNpZGVfYnlfc2lkZSkKKwkJcmV0dXJuIDA7CisKKwlpZiAobWRldi0+c2lkZV9ieV9zaWRl
X21hc3RlciA+PSBtZGV2LT5uX3BpcGVsaW5lcykgeworCQlEUk1fRVJST1IoIkRUIGNvbmZpZ3Vy
ZWQgc2lkZSBieSBzaWRlIG1hc3Rlci0lZCBpcyBpbnZhbGlkLlxuIiwKKwkJCSAgbWRldi0+c2lk
ZV9ieV9zaWRlX21hc3Rlcik7CisJCXJldHVybiAtRUlOVkFMOworCX0KKworCW1hc3RlciA9IG1k
ZXYtPnBpcGVsaW5lc1ttZGV2LT5zaWRlX2J5X3NpZGVfbWFzdGVyXTsKKwlzbGF2ZSA9IGtvbWVk
YV9waXBlbGluZV9nZXRfc2xhdmUobWFzdGVyKTsKKwlpZiAoIXNsYXZlIHx8IHNsYXZlLT5uX2xh
eWVycyAhPSBtYXN0ZXItPm5fbGF5ZXJzKSB7CisJCURSTV9FUlJPUigiQ3VycmVudCBIVyBkb2Vz
bid0IHN1cHBvcnQgc2lkZSBieSBzaWRlLlxuIik7CisJCXJldHVybiAtRUlOVkFMOworCX0KKwor
CWlmICghbWFzdGVyLT5kdWFsX2xpbmspIHsKKwkJRFJNX0RFQlVHX0FUT01JQygiU0JTIGNhbiBu
b3Qgd29yayB3aXRob3V0IGR1YWwgbGluay5cbiIpOworCQlyZXR1cm4gLUVJTlZBTDsKKwl9CisK
Kwlmb3IgKGkgPSAwOyBpIDwgbWFzdGVyLT5uX2xheWVyczsgaSsrKQorCQltYXN0ZXItPmxheWVy
c1tpXS0+c2JzX3NsYXZlID0gc2xhdmUtPmxheWVyc1tpXTsKKworCXJldHVybiAwOworfQorCiBp
bnQga29tZWRhX2Fzc2VtYmxlX3BpcGVsaW5lcyhzdHJ1Y3Qga29tZWRhX2RldiAqbWRldikKIHsK
IAlzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICpwaXBlOwpAQCAtMzQ2LDcgKzM4OCw3IEBAIGludCBr
b21lZGFfYXNzZW1ibGVfcGlwZWxpbmVzKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQogCQlrb21l
ZGFfcGlwZWxpbmVfZHVtcChwaXBlKTsKIAl9CiAKLQlyZXR1cm4gMDsKKwlyZXR1cm4ga29tZWRh
X2Fzc2VtYmxlX3NpZGVfYnlfc2lkZShtZGV2KTsKIH0KIAogdm9pZCBrb21lZGFfcGlwZWxpbmVf
ZHVtcF9yZWdpc3RlcihzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICpwaXBlLApkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgKaW5kZXgg
YWM4NzI1ZTI0ODUzLi4yMGEwNzZjY2U2MzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaApAQCAtMjM3LDYgKzIzNyw3IEBA
IHN0cnVjdCBrb21lZGFfbGF5ZXIgewogCSAqIG5vdCB0aGUgc291cmNlIGJ1ZmZlci4KIAkgKi8K
IAlzdHJ1Y3Qga29tZWRhX2xheWVyICpyaWdodDsKKwlzdHJ1Y3Qga29tZWRhX2xheWVyICpzYnNf
c2xhdmU7CiB9OwogCiBzdHJ1Y3Qga29tZWRhX2xheWVyX3N0YXRlIHsKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
