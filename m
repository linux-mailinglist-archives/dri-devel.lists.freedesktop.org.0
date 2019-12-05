Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30A4113D25
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 09:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FAE96F5EC;
	Thu,  5 Dec 2019 08:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140073.outbound.protection.outlook.com [40.107.14.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409E86F5EF
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 08:36:08 +0000 (UTC)
Received: from VI1PR08CA0149.eurprd08.prod.outlook.com (2603:10a6:800:d5::27)
 by VE1PR08MB5261.eurprd08.prod.outlook.com (2603:10a6:803:10d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.14; Thu, 5 Dec
 2019 08:36:04 +0000
Received: from AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::205) by VI1PR08CA0149.outlook.office365.com
 (2603:10a6:800:d5::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Thu, 5 Dec 2019 08:36:04 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT004.mail.protection.outlook.com (10.152.16.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Thu, 5 Dec 2019 08:36:04 +0000
Received: ("Tessian outbound d87d9aeb44be:v37");
 Thu, 05 Dec 2019 08:36:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ee81c2a020172c2c
X-CR-MTA-TID: 64aa7808
Received: from e035e4a146e2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9916CFFB-3814-4ED9-A464-FA45E4458BD8.1; 
 Thu, 05 Dec 2019 08:35:59 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e035e4a146e2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 05 Dec 2019 08:35:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7UPgwn6nOxJ+ahKldlVvYA5y2WHTln6jQgfxv7rgw/j83LPocka6S6z/VcZvt0VDvU7gKHM/ZCpWjtmQSxsTf6H5gGuPQ9hOGBBlOSJqz2XqQsBd9/KRwvwLwNDXYQ7Awzu0W6oihD91NIXnhAa/ic/vj0hQh+WuDJtuFZ9gjJuEH9XSB/iqUEhwWbDvjKOYNCujV8/U/4K5Yc30ZK70OnNqzfD9DuOVjU4ToEZnRInaN3vd9VrhbFF8NiJA68ApmBy/XWA/r+zOs7S8FBPNLKRIEp0UNF6ZxCay67wnNM+gczCS41AFqewuO0CZiTM0/0qcFn5bHGhmZ0IIedBZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYH3lh3p96aYyG0U7lY8+jPIWzUDqW/V2y01c6fakes=;
 b=lBtPaweMuerNYJWHNbkgDe9TgO94q+aI/KTAx0tWNCuukbr1G6+o1abahY+Vrg85oJ1e/5ZSXlC2hVwfrlx9dI1De26iazhrRGG3EUuLXnvus7fj1NPINZ+lVef1UXav0wRZK64aklWQYtcuJLu6qHAZbL3JvqORElIdt4fVhuwiSFzLqdTgmSeTq8n0LAlAhoHBvpV64Q6ZuNO/NGlUbbBBImF8kth/LE+G2m/JANDCNeCT+dt5Tnk5znlOyGN7XKshZ/SXZqxRY+7IJKkluc4BcHfhd0R82lDOTp9Ajy79OLhes3/8waFO3aDxZsk1/9TFrLYC2gyE6KDXW5hrNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 AM0SPR01MB0026.eurprd08.prod.outlook.com (52.135.152.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Thu, 5 Dec 2019 08:35:55 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e%2]) with mapi id 15.20.2495.014; Thu, 5 Dec 2019
 08:35:55 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH v5 4/5] drm/komeda: Add side by side support for writeback
Thread-Topic: [PATCH v5 4/5] drm/komeda: Add side by side support for writeback
Thread-Index: AQHVq0cCwYnEST8nokauTus8cyAHmQ==
Date: Thu, 5 Dec 2019 08:35:55 +0000
Message-ID: <20191205083436.11060-5-james.qian.wang@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5df59bf3-3c62-4544-eaf8-08d7795e2ab6
X-MS-TrafficTypeDiagnostic: AM0SPR01MB0026:|AM0SPR01MB0026:|VE1PR08MB5261:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB5261685065CCBF369FB7B5CCB35C0@VE1PR08MB5261.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:785;OLM:785;
x-forefront-prvs: 02426D11FE
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(199004)(189003)(8676002)(5660300002)(71200400001)(71190400001)(7736002)(86362001)(305945005)(2906002)(316002)(36756003)(103116003)(50226002)(1076003)(81156014)(81166006)(6862004)(8936002)(55236004)(6636002)(4326008)(99286004)(186003)(478600001)(11346002)(2616005)(102836004)(26005)(25786009)(76176011)(52116002)(14454004)(6506007)(66446008)(6116002)(54906003)(66946007)(66476007)(66556008)(64756008)(3846002)(37006003)(6436002)(14444005)(6486002)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0SPR01MB0026;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 8iZeN2qZ8e1Ehz+eMP6Rd0b1cJ5DOk2IG7CJHjvEzSpMAsrJSY+5onI/AOoipevIbjHo2alyXw4N6DL8yC4aN+DBtiH1l4dG+ifLo3x463arq19D8kjQPWnrqxcWSHPjaRyuGzSYzxLzFZgb3f+WlRZsGWsvhf7e5Q47MWl7C15LCEn1BYkRWfnvD7fZG6vYlgf6h0/VhpgUoRf3r6sjiKJEDcHYupySzhz6ezx4pycUHEYAg0VlQU6EbXvDvxERT7YjN1onEW0WgqEc1Y8zgjgtBxQn+Bpc66ur+2Gp6F11o+FrcCDUS8j6Ijc6w1mhKzhfdqTLwj69i+sbFQUWOZFzFzIqnyrAH0uSLL/DrtsSU0EqP8r7nyTuqQY8Ak0njc1NMf1Dqm4KioKkFCcEwBSZUsGkxmxJFPy7w6fjAA9IuSi8kjOqh6UginqNVfjb
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0SPR01MB0026
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(136003)(396003)(189003)(199004)(2616005)(25786009)(99286004)(11346002)(76176011)(356004)(37006003)(186003)(54906003)(316002)(36906005)(4326008)(6862004)(336012)(26826003)(14444005)(478600001)(22756006)(50226002)(36756003)(14454004)(6506007)(102836004)(23756003)(81156014)(26005)(6636002)(103116003)(70206006)(70586007)(50466002)(8746002)(76130400001)(8936002)(7736002)(5660300002)(6486002)(1076003)(3846002)(6512007)(6116002)(8676002)(305945005)(86362001)(2906002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5261;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e05dc87b-06e6-4169-392e-08d7795e2500
NoDisclaimer: True
X-Forefront-PRVS: 02426D11FE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +1eo6KFbE8dItwyCiq656gaHIRnpbYhN8IIjfxm9q8rw4rFNNfqsbwsMpD8TvDPl7R51b19j8N6UjsAdLZNvPojN1STQsPQbYOOoPUaHXKlYFwg19A12DjUz5BGOy35BJp7jQuN4ebdtTwk08ZVj99erG6cs5cowoukwrIykFH2a5SxaT9GzNcT7jaqlJkX2dlgoLARoMtWMUlIdVexXAI2K90+VccQcZiuhlpB67AvuqrOiQNO6LkLnW/CMA5sQucZ+CV+e46l7hyqdBPe93W32eycju3StbzLn5BS91qol4yxO4LP91TkGR+LagEdwn9ZjnZWn+3dfzNkWLH/JUiZgE1dW/Z5ynpzZqmMYMbjJPaRiLidiTEUpx/Uyp3ydh1i7MRDFpPq+5NXVsdOF7XUyU0bBgeRwPdFkxK2ujeXLxpcvP00A395yh8/QkvJI
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2019 08:36:04.6121 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df59bf3-3c62-4544-eaf8-08d7795e2ab6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5261
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYH3lh3p96aYyG0U7lY8+jPIWzUDqW/V2y01c6fakes=;
 b=r+XbWb5cpMHMW/6aubrULSjUUtmAEKqThXyCOR/IfnbbvCuptm/WgAr+tJAVK5KMTOgnvzZqPMFePQ/AtCvGW+fJngFWNuZlQPqLO3c2FgdgABDeP+LFSkKxEUhKvGgLlQQBL1/PxfKpG4rSG+PjXipmUdA0vrO3WoJRAWhZHY0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYH3lh3p96aYyG0U7lY8+jPIWzUDqW/V2y01c6fakes=;
 b=r+XbWb5cpMHMW/6aubrULSjUUtmAEKqThXyCOR/IfnbbvCuptm/WgAr+tJAVK5KMTOgnvzZqPMFePQ/AtCvGW+fJngFWNuZlQPqLO3c2FgdgABDeP+LFSkKxEUhKvGgLlQQBL1/PxfKpG4rSG+PjXipmUdA0vrO3WoJRAWhZHY0=
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

SW4gc2lkZSBieSBzaWRlIG1vZGUsIHRoZSBtYXN0ZXIgcGlwZWxpbmUgd3JpdGViYWNrIHRoZSBs
ZWZ0IGZyYW1lIGFuZCB0aGUKc2xhdmUgd3JpdGViYWNrIHRoZSByaWdodCBwYXJ0LCB0aGUgZGF0
YSBmbG93IGFzIGJlbG93OgoKICBzbGF2ZS5jb21waXogLT4gc2xhdmUud2JfbGF5ZXIgLT4gZmIg
KHJpZ2h0LXBhcnQpCiAgbWFzdGVyLmNvbXBpeiAtPiBtYXN0ZXIud2JfbGF5ZXIgLT4gZmIgKGxl
ZnQtcGFydCkKClNpZ25lZC1vZmYtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kg
Q2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KLS0tCiAuLi4vZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCAgfCAgNCArKwogLi4uL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9waXBlbGluZV9zdGF0ZS5jICAgIHwgNDIgKysrKysrKysrKysrKysrKysrKwogLi4uL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMgIHwgIDYgKystCiAzIGZpbGVz
IGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaAppbmRleCA1
OWE4MWI0NDc2ZGYuLjc2NjIxYTk3MjgwMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oCkBAIC01NjQsNiArNTY0LDEwIEBA
IGludCBrb21lZGFfYnVpbGRfd2Jfc3BsaXRfZGF0YV9mbG93KHN0cnVjdCBrb21lZGFfbGF5ZXIg
KndiX2xheWVyLAogCQkJCSAgICBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl9zdCwK
IAkJCQkgICAgc3RydWN0IGtvbWVkYV9jcnRjX3N0YXRlICprY3J0Y19zdCwKIAkJCQkgICAgc3Ry
dWN0IGtvbWVkYV9kYXRhX2Zsb3dfY2ZnICpkZmxvdyk7CitpbnQga29tZWRhX2J1aWxkX3diX3Ni
c19kYXRhX2Zsb3coc3RydWN0IGtvbWVkYV9jcnRjICprY3J0YywKKwkJCQkgIHN0cnVjdCBkcm1f
Y29ubmVjdG9yX3N0YXRlICpjb25uX3N0LAorCQkJCSAgc3RydWN0IGtvbWVkYV9jcnRjX3N0YXRl
ICprY3J0Y19zdCwKKwkJCQkgIHN0cnVjdCBrb21lZGFfZGF0YV9mbG93X2NmZyAqd2JfZGZsb3cp
OwogCiBpbnQga29tZWRhX2J1aWxkX2Rpc3BsYXlfZGF0YV9mbG93KHN0cnVjdCBrb21lZGFfY3J0
YyAqa2NydGMsCiAJCQkJICAgc3RydWN0IGtvbWVkYV9jcnRjX3N0YXRlICprY3J0Y19zdCk7CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBl
bGluZV9zdGF0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
cGlwZWxpbmVfc3RhdGUuYwppbmRleCBiMWU5MGZlYjVjNTUuLjc5ZjdlN2I2NTI2ZiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVf
c3RhdGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9w
aXBlbGluZV9zdGF0ZS5jCkBAIC0xMzc3LDYgKzEzNzcsNDggQEAgaW50IGtvbWVkYV9idWlsZF93
Yl9zcGxpdF9kYXRhX2Zsb3coc3RydWN0IGtvbWVkYV9sYXllciAqd2JfbGF5ZXIsCiAJcmV0dXJu
IGtvbWVkYV93Yl9sYXllcl92YWxpZGF0ZSh3Yl9sYXllciwgY29ubl9zdCwgZGZsb3cpOwogfQog
CisvKiB3cml0ZWJhY2sgc2lkZSBieSBzaWRlIHNwbGl0IGRhdGEgcGF0aDoKKyAqCisgKiBzbGF2
ZS5jb21waXogLT4gc2xhdmUud2JfbGF5ZXIgLSA+IGZiIChyaWdodC1wYXJ0KQorICogbWFzdGVy
LmNvbXBpeiAtPiBtYXN0ZXIud2JfbGF5ZXIgLT4gZmIgKGxlZnQtcGFydCkKKyAqLworaW50IGtv
bWVkYV9idWlsZF93Yl9zYnNfZGF0YV9mbG93KHN0cnVjdCBrb21lZGFfY3J0YyAqa2NydGMsCisJ
CQkJICBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl9zdCwKKwkJCQkgIHN0cnVjdCBr
b21lZGFfY3J0Y19zdGF0ZSAqa2NydGNfc3QsCisJCQkJICBzdHJ1Y3Qga29tZWRhX2RhdGFfZmxv
d19jZmcgKndiX2RmbG93KQoreworCXN0cnVjdCBrb21lZGFfcGlwZWxpbmUgKm1hc3RlciA9IGtj
cnRjLT5tYXN0ZXI7CisJc3RydWN0IGtvbWVkYV9waXBlbGluZSAqc2xhdmUgPSBrY3J0Yy0+c2xh
dmU7CisJc3RydWN0IGtvbWVkYV9kYXRhX2Zsb3dfY2ZnIG1fZGZsb3csIHNfZGZsb3c7CisJaW50
IGVycjsKKworCWlmICh3Yl9kZmxvdy0+ZW5fc2NhbGluZyB8fCB3Yl9kZmxvdy0+ZW5faW1nX2Vu
aGFuY2VtZW50KSB7CisJCURSTV9ERUJVR19BVE9NSUMoInNicyBkb2Vzbid0IHN1cHBvcnQgV0Jf
c2NhbGluZ1xuIik7CisJCXJldHVybiAtRUlOVkFMOworCX0KKworCW1lbWNweSgmbV9kZmxvdywg
d2JfZGZsb3csIHNpemVvZigqd2JfZGZsb3cpKTsKKwltZW1jcHkoJnNfZGZsb3csIHdiX2RmbG93
LCBzaXplb2YoKndiX2RmbG93KSk7CisKKwkvKiBtYXN0ZXIgd3JpdGVvdXQgdGhlIGxlZnQgcGFy
dCAqLworCW1fZGZsb3cuaW5fdyA+Pj0gMTsKKwltX2RmbG93Lm91dF93ID4+PSAxOworCW1fZGZs
b3cuaW5wdXQuY29tcG9uZW50ID0gJm1hc3Rlci0+Y29tcGl6LT5iYXNlOworCisJLyogc2xhdmUg
d3JpdGVvdXQgdGhlIHJpZ2h0IHBhcnQgKi8KKwlzX2RmbG93LmluX3cgPj49IDE7CisJc19kZmxv
dy5vdXRfdyA+Pj0gMTsKKwlzX2RmbG93LmluX3ggKz0gbV9kZmxvdy5pbl93OworCXNfZGZsb3cu
b3V0X3ggKz0gbV9kZmxvdy5vdXRfdzsKKwlzX2RmbG93LmlucHV0LmNvbXBvbmVudCA9ICZzbGF2
ZS0+Y29tcGl6LT5iYXNlOworCisJZXJyID0ga29tZWRhX3diX2xheWVyX3ZhbGlkYXRlKG1hc3Rl
ci0+d2JfbGF5ZXIsIGNvbm5fc3QsICZtX2RmbG93KTsKKwlpZiAoZXJyKQorCQlyZXR1cm4gZXJy
OworCisJcmV0dXJuIGtvbWVkYV93Yl9sYXllcl92YWxpZGF0ZShzbGF2ZS0+d2JfbGF5ZXIsIGNv
bm5fc3QsICZzX2RmbG93KTsKK30KKwogLyogYnVpbGQgZGlzcGxheSBvdXRwdXQgZGF0YSBmbG93
LCB0aGUgZGF0YSBwYXRoIGlzOgogICogY29tcGl6IC0+IGltcHJvYyAtPiB0aW1pbmdfY3RybHIK
ICAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfd2JfY29ubmVjdG9yLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV93Yl9jb25uZWN0b3IuYwppbmRleCAxN2VhMDIxNDg4YWEuLjQ0ZTYyODc0NzY1NCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29u
bmVjdG9yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
d2JfY29ubmVjdG9yLmMKQEAgLTM3LDYgKzM3LDcgQEAga29tZWRhX3diX2VuY29kZXJfYXRvbWlj
X2NoZWNrKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwKIAkJCSAgICAgICBzdHJ1Y3QgZHJt
X2NydGNfc3RhdGUgKmNydGNfc3QsCiAJCQkgICAgICAgc3RydWN0IGRybV9jb25uZWN0b3Jfc3Rh
dGUgKmNvbm5fc3QpCiB7CisJc3RydWN0IGtvbWVkYV9jcnRjICprY3J0YyA9IHRvX2tjcnRjKGNy
dGNfc3QtPmNydGMpOwogCXN0cnVjdCBrb21lZGFfY3J0Y19zdGF0ZSAqa2NydGNfc3QgPSB0b19r
Y3J0Y19zdChjcnRjX3N0KTsKIAlzdHJ1Y3QgZHJtX3dyaXRlYmFja19qb2IgKndyaXRlYmFja19q
b2IgPSBjb25uX3N0LT53cml0ZWJhY2tfam9iOwogCXN0cnVjdCBrb21lZGFfbGF5ZXIgKndiX2xh
eWVyOwpAQCAtNjUsNyArNjYsMTAgQEAga29tZWRhX3diX2VuY29kZXJfYXRvbWljX2NoZWNrKHN0
cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwKIAlpZiAoZXJyKQogCQlyZXR1cm4gZXJyOwogCi0J
aWYgKGRmbG93LmVuX3NwbGl0KQorCWlmIChrY3J0Yy0+c2lkZV9ieV9zaWRlKQorCQllcnIgPSBr
b21lZGFfYnVpbGRfd2Jfc2JzX2RhdGFfZmxvdyhrY3J0YywKKwkJCQljb25uX3N0LCBrY3J0Y19z
dCwgJmRmbG93KTsKKwllbHNlIGlmIChkZmxvdy5lbl9zcGxpdCkKIAkJZXJyID0ga29tZWRhX2J1
aWxkX3diX3NwbGl0X2RhdGFfZmxvdyh3Yl9sYXllciwKIAkJCQljb25uX3N0LCBrY3J0Y19zdCwg
JmRmbG93KTsKIAllbHNlCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
