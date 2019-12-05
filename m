Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7DD113D1C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 09:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B1C6F5D8;
	Thu,  5 Dec 2019 08:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60053.outbound.protection.outlook.com [40.107.6.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349286F5D8
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 08:35:52 +0000 (UTC)
Received: from AM6PR08CA0040.eurprd08.prod.outlook.com (2603:10a6:20b:c0::28)
 by DB8PR08MB5211.eurprd08.prod.outlook.com (2603:10a6:10:ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.22; Thu, 5 Dec
 2019 08:35:49 +0000
Received: from DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::206) by AM6PR08CA0040.outlook.office365.com
 (2603:10a6:20b:c0::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Thu, 5 Dec 2019 08:35:49 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT022.mail.protection.outlook.com (10.152.20.171) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Thu, 5 Dec 2019 08:35:49 +0000
Received: ("Tessian outbound 5574dd7ffaa4:v37");
 Thu, 05 Dec 2019 08:35:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1df4ec539c909e21
X-CR-MTA-TID: 64aa7808
Received: from 66ba22ffbb8a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 941BE465-8543-4D86-B077-967965B70159.1; 
 Thu, 05 Dec 2019 08:35:43 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 66ba22ffbb8a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 05 Dec 2019 08:35:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXwQMIEToXOcbXYWBRmg16oakfd2UVtHZnsLr+MeNKOykA4O9q48T6iTJJeq9ZKc4ZGqdrFDKqbjguWyuGSGYAyMxb35mDWiZf9YsFoQQ9O9rV7rwPsYHfSZN7hcUoFhZ7VUcJQakrfHURaw/rxvhRR5KBOAod7E9P6hPgQGsIqrv2XBphrrNd56ygP6GVqSWm7KjZCXDdqsZUD6wxe4Vamn5PNdHFLuexRz5xylV7hMA1moc76ML5SMtgC6gvnoRGIu+EwjJfN8Y81hGRfmDYu0O9oaU59WmYgb97D1XuVt0/FgqbWPid2okIOGKNNuADqsWzhiLtM4pBhtn622MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBBxY4dtQRlii0s47SsBLbJKYHMigVwhrTe2lW2g4UE=;
 b=k2sKAH7cL16qK9mE1u3V6d2cowBKOH5TG+CiQeQ+v/0DlqevOMQazn0zlMg9dLLaZ3ga/YBJ/J1jFcPQrmroOnljJEWyuMT5A2R1BXHnBhp1Fd7YBlPV3euO8JZq1SgjuebYi4pRux5IlZbRp45V3j8+Emwr++nZ2zKo6pHPOuhzwUguwbZEVd4/BL/YoxcxxClq2dghOS9Gz7b6o1aueYdLlZl4GWU/+zh0L/FY6QqEbCWdHj40/K6lwN+GRdSH5Nima515c4GcLVyMI99NG04ArjoRnEaKlZ6deigueXsXDfxEPiyRn9Jof5PVNCEEh/B3r8Folh7cmzgiaat+NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 AM0SPR01MB0047.eurprd08.prod.outlook.com (20.179.32.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Thu, 5 Dec 2019 08:35:42 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e%2]) with mapi id 15.20.2495.014; Thu, 5 Dec 2019
 08:35:42 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH v5 1/5] drm/komeda: Add side by side assembling
Thread-Topic: [PATCH v5 1/5] drm/komeda: Add side by side assembling
Thread-Index: AQHVq0b6iOAY1xrPm0y50+wKBy716g==
Date: Thu, 5 Dec 2019 08:35:42 +0000
Message-ID: <20191205083436.11060-2-james.qian.wang@arm.com>
References: <20191205083436.11060-1-james.qian.wang@arm.com>
In-Reply-To: <20191205083436.11060-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0105.apcprd03.prod.outlook.com
 (2603:1096:203:b0::21) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 548f5b45-c9ef-49de-edbd-08d7795e218f
X-MS-TrafficTypeDiagnostic: AM0SPR01MB0047:|AM0SPR01MB0047:|DB8PR08MB5211:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB5211B012131B7735BA97BA67B35C0@DB8PR08MB5211.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3383;OLM:3383;
x-forefront-prvs: 02426D11FE
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(199004)(189003)(8676002)(5660300002)(71190400001)(71200400001)(7736002)(305945005)(2906002)(86362001)(316002)(36756003)(103116003)(81156014)(50226002)(1076003)(81166006)(8936002)(6862004)(6636002)(4326008)(99286004)(478600001)(11346002)(2616005)(186003)(102836004)(25786009)(52116002)(76176011)(14454004)(55236004)(26005)(6512007)(54906003)(66946007)(66476007)(6116002)(66556008)(64756008)(6506007)(66446008)(3846002)(6486002)(37006003)(6436002)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0SPR01MB0047;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: EkXjRds04ojdGTFc7eGTB6r7d3kpkcN4k6cxnP3lFSSYpwMdPx6krgHoquskNl9OPP+LqsbS7pg3WNpPPYHiLo/pA2Pfi3x4w7BZkMOuJgJW9B1wzkPzLoOax0eju8wozzN1R8K2rtqmQHnJ8jjz8wz3ULq+OxhMBQdj8xwM3b5XvbxqwilxIwz2FizEEeVFc2GPe1ehmR92810NRH9HPXbghA51e0mJYl2Tgys/SUsOXl+FYHGn+8LEFBAJKRbTVyz+Yuyh6wLK7g/s5Mi07ebVJqtCv45pPgCOGAeYhZe2yNTZvx9ggJ31JL9ItVoDnu3nMnCpLp14V/Di2MXOw6hcm5P4eg1q9Asr/8FFLgoMK9t2W0u9any1MYoyJU2WND1muEKfho0D/0JZVhMQAH+L/yTe+54P6gBKo0OS9CaVQY/HlKHajG5OY/XB/7Hv
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0SPR01MB0047
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(39860400002)(376002)(199004)(189003)(25786009)(6636002)(6116002)(3846002)(26826003)(11346002)(186003)(14444005)(103116003)(54906003)(8936002)(6512007)(99286004)(336012)(81156014)(316002)(81166006)(23756003)(76176011)(14454004)(37006003)(6506007)(70586007)(50466002)(6862004)(26005)(7736002)(8746002)(50226002)(102836004)(478600001)(8676002)(305945005)(70206006)(36756003)(22756006)(2616005)(86362001)(76130400001)(4326008)(1076003)(356004)(6486002)(2906002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB5211;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: d495e1e9-993b-461d-57c1-08d7795e1d49
NoDisclaimer: True
X-Forefront-PRVS: 02426D11FE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oQxf536vrC1wS3P4u7yNpmz3k3sOpX21mEOHfE7e9AfS1kyfWEg56vHLIHiBEm0SCNLGypgHeMvJA71uOjvkPcSFeQbxyUzGNGci7xMmgHLRAei0qH94kvQl5eT7KfsgLzMCe+cppxyTqUGbmvvqoQB2QuPtY0YHfQQhFBWiWqRqBZdiV9pSwMb4Y4pNOE4GqW1x8o1o0yXOsZc/HIhUosbji7xzNoOuzdfHQlVZplgC8xQu9Q5/MWBcUnPMM0Qxw0sQ9y08DvsJSv9VQomYnHR4jeUn8nasNwWdKZbdh6beK4C4zeesL2eaVcP8ThFaXeZndBkgEK2QCbL2bajNmfRDd2ztSdhn0/XFft98T5xcg4GdslGgbHn1L2QPHfGUHZeBhpyLBZoBaynu/UV/B1yMEKBCMFqXQDQsAEUXKuBuKD0vSqw+SuksvJ7kLC+K
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2019 08:35:49.2631 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 548f5b45-c9ef-49de-edbd-08d7795e218f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5211
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBBxY4dtQRlii0s47SsBLbJKYHMigVwhrTe2lW2g4UE=;
 b=t8NE4Sibhuv8VhDOG6AwwM7ptkRxMSU1SWU0ZyIPaT7SUpHd/5sNP/2y6LuEpm+eoXR87LuK5tg/un+OCtNI0l3CZjc38TAfIY6RXg2lutP8spbciW9VrboCmvxwPQSvD+O7rd01TzZKe9EIjTGMoHIwIQ8SF5r/7trze89auag=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBBxY4dtQRlii0s47SsBLbJKYHMigVwhrTe2lW2g4UE=;
 b=t8NE4Sibhuv8VhDOG6AwwM7ptkRxMSU1SWU0ZyIPaT7SUpHd/5sNP/2y6LuEpm+eoXR87LuK5tg/un+OCtNI0l3CZjc38TAfIY6RXg2lutP8spbciW9VrboCmvxwPQSvD+O7rd01TzZKe9EIjTGMoHIwIQ8SF5r/7trze89auag=
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
Cc: nd <nd@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>, "Thomas Sun \(Arm Technology
 China\)" <thomas.Sun@arm.com>,
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
KysrLQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyAgIHwgIDQg
KysKIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmggICB8ICA5ICsr
KysKIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmggICB8ICAzICsr
CiAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuYyAgfCA1MCArKysr
KysrKysrKysrKysrKy0tCiAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxp
bmUuaCAgfCAgMSArCiA2IGZpbGVzIGNoYW5nZWQsIDc0IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
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
a29tZWRhX2Rldi5jCmluZGV4IDRlNDZmNjUwZmRkZi4uMGQwZThlNGViYzlkIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwpAQCAtMTc4LDYg
KzE3OCwxMCBAQCBzdGF0aWMgaW50IGtvbWVkYV9wYXJzZV9kdChzdHJ1Y3QgZGV2aWNlICpkZXYs
IHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQogCQl9CiAJfQogCisJLyogdGhpcyBEVCBub2RlIGlz
IGV4cGVyaW1lbnRhbCBoZW5jZSB1bmRvY3VtZW50ZWQgKi8KKwltZGV2LT5zaWRlX2J5X3NpZGUg
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
