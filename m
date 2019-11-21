Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B5D104B20
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 08:13:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 300DC6EAFB;
	Thu, 21 Nov 2019 07:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00067.outbound.protection.outlook.com [40.107.0.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECA26EAEE
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 07:12:57 +0000 (UTC)
Received: from VI1PR08CA0148.eurprd08.prod.outlook.com (2603:10a6:800:d5::26)
 by AM4PR08MB2916.eurprd08.prod.outlook.com (2603:10a6:205:e::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.29; Thu, 21 Nov
 2019 07:12:54 +0000
Received: from VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::202) by VI1PR08CA0148.outlook.office365.com
 (2603:10a6:800:d5::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Thu, 21 Nov 2019 07:12:54 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT015.mail.protection.outlook.com (10.152.18.176) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Thu, 21 Nov 2019 07:12:54 +0000
Received: ("Tessian outbound f7868d7ede10:v33");
 Thu, 21 Nov 2019 07:12:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 448b6a653e5d64b2
X-CR-MTA-TID: 64aa7808
Received: from e29630e7d491.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.57]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 569D2F7C-CD4D-4EF3-9A12-592DF533411E.1; 
 Thu, 21 Nov 2019 07:12:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e29630e7d491.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Nov 2019 07:12:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/HwmQFeuZ4m9mfZGyfsvXFcn8bpPOqFLbYRs6/p6SKquh1DZ+ETIC11eKtVAWNC3cdX33W8L2inAU7gqAyCgCVDWJy7z5TomuOiNIXYJicO/qgYBKJ/pyCnEBf4pSKBRjNgfvPhdqBb3Ozu9MB2s/R9+1ELRj5ocMrrR2BUuQ9U4c1vX2kwRAz59Ihbbbv9WWhmFSn5s0AoaQut+CkATIMXB9W3xSblJNOyA7VV6DpVKdP0Mkh4O8r4JV4NBrSp+6dUtcfm7NXyIewmg+zDX5KwQx3tKMHZzsfCDSCQJyAFNDgPMju5VeEwExWGZMu3MpyUXoTTr/vIPq2lCQ30aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYH3lh3p96aYyG0U7lY8+jPIWzUDqW/V2y01c6fakes=;
 b=gDQNE5pCServBUoxjVVWB+HmycIp09U2R+S1sOFda+cntsjxxFbdlrUs117wop/7LV008Wy1ARQYYNJqpkBturqSxAPYEI8JktkOzEHuWiEPfLgJ+kth2YJLlCuLUMM+Td63rsIGpfeUb0jlI96ChOFaoCToAZ38XblcxVsnKtqi1I80KxB5VHhPbsYXF+AL0heK9udja+ZeyWRJ2QlilpXUr4uOoL59Vaiv64aCDKpam/02Gp74nrSuKAH1ghP092ImVqqA8Hfq0tl7BivoyN/tfh2LDX7sx8IA+iP6KoTJ4ACRTR2CELf0cHicG279YeOzcT+YDm/giD4HkBI5kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5069.eurprd08.prod.outlook.com (20.179.29.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Thu, 21 Nov 2019 07:12:45 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2474.019; Thu, 21 Nov 2019
 07:12:45 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, Mihail Atanassov
 <Mihail.Atanassov@arm.com>
Subject: [PATCH v4 4/6] drm/komeda: Add side by side support for writeback
Thread-Topic: [PATCH v4 4/6] drm/komeda: Add side by side support for writeback
Thread-Index: AQHVoDsStpijpsQiP0y4YgTpq6Fi4A==
Date: Thu, 21 Nov 2019 07:12:45 +0000
Message-ID: <20191121071205.27511-5-james.qian.wang@arm.com>
References: <20191121071205.27511-1-james.qian.wang@arm.com>
In-Reply-To: <20191121071205.27511-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR03CA0064.apcprd03.prod.outlook.com
 (2603:1096:202:17::34) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 898c416a-2886-4caf-d21e-08d76e523a98
X-MS-TrafficTypeDiagnostic: VE1PR08MB5069:|VE1PR08MB5069:|AM4PR08MB2916:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM4PR08MB291666191A33232543184C27B34E0@AM4PR08MB2916.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:785;OLM:785;
x-forefront-prvs: 0228DDDDD7
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39850400004)(366004)(376002)(346002)(136003)(189003)(199004)(386003)(6636002)(55236004)(102836004)(6506007)(76176011)(256004)(52116002)(2906002)(14444005)(50226002)(7736002)(305945005)(66446008)(186003)(81166006)(81156014)(8676002)(8936002)(66946007)(6512007)(26005)(2616005)(71200400001)(6486002)(446003)(478600001)(11346002)(71190400001)(6436002)(64756008)(66476007)(66556008)(86362001)(66066001)(4326008)(36756003)(2501003)(6116002)(316002)(3846002)(14454004)(103116003)(99286004)(54906003)(110136005)(25786009)(1076003)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5069;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: lBzoTroHGeo157bRzbhmiwpump8UiAdoGDTDdu1LHKSxoaWYvRaAMywkB3fSKP9ofQHCOm65PU4H4ffrfD3GiWK17Gnlrj47vITJndnwumUznJvRM+JMENQ6hCu1jCF5JKS+Ng5/kBh2lf8EmLpb2wmjyV6CCCDEh/j3SHDYT5vI6lY/zQQ30su8TLhZuKviDv6dq4U2bR7B8LrdADnJMBdJ2gVjcO4DTQmeaxi5FmslnXh8CafGeoupMq6Re3fgKALnUL2H5yPnIoLszOTXUNFL9Sh8SmSepyMDO2YCF/Rm3kvaOneHxA+o2JxlHHz9waGIvqWg8pG446RS/tRReYNyUpm7VNxQkJz+7cHDtSa12I7+sl9mph4nRPk99hzY0WTISLXlUWQ4s2fezuZpji+6xnd/KqOYB4ZcEmhkLmj+PC7k6GuStqArFODzfoVe
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5069
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39850400004)(136003)(346002)(376002)(1110001)(339900001)(189003)(199004)(36906005)(478600001)(99286004)(14454004)(70206006)(26826003)(4326008)(103116003)(76130400001)(7736002)(186003)(6486002)(70586007)(305945005)(54906003)(110136005)(81166006)(2501003)(8676002)(50226002)(81156014)(6116002)(3846002)(23756003)(2906002)(102836004)(6512007)(2616005)(25786009)(6636002)(446003)(26005)(11346002)(86362001)(6506007)(386003)(105606002)(14444005)(36756003)(336012)(1076003)(76176011)(22756006)(8746002)(47776003)(316002)(5660300002)(50466002)(356004)(8936002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR08MB2916;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c64a12e7-a0bc-40ca-3913-08d76e523503
NoDisclaimer: True
X-Forefront-PRVS: 0228DDDDD7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z1FDptA7gz9FN9xfi89r4l6AekAWtjDpSJbkCBIYigPEpcF1QYs8DMnfrFBNH7ruM0VRju7v1HiFXHV7NtLdtuY69pU67VVnDJyvkur13Lg0UlKzUinqTGxdTc671etMCR7ePQSExH8u54SyPswk2hYDC/W8JGmkXar4FoI0D4NR95pCtUNj/ej8NcssTxsxrQwxjf+FcNEIKAgoSU3xNQnd27Q9nd7t+pUPrJnOM5UJX0z6XAv+O2thGi/QTwdS2d8c3IthhVnOk6228TCRNeolsJmVkjATyoZhrufeYkZWzt3oGawV/1Zi7L3gU7VsHZ9pm14YoPvdWhiXZMpU+kysk3+x3xxMR8KUCgInyD8IkWhqSPc96IIxGBEwOmZ9V01RokMeO3xIDqC8xydeNrGMoFk3DXesrPUn73J2+mVyYYDwr5w6MZWziia3HlZC
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2019 07:12:54.4621 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 898c416a-2886-4caf-d21e-08d76e523a98
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2916
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYH3lh3p96aYyG0U7lY8+jPIWzUDqW/V2y01c6fakes=;
 b=Uo6sRxoVF1XaErz2VSDdZJ7e8QXzIZJctWe4xrdixnfwwfH9XteVdcuplVq4J3sInElbsaABWiiDVmxONA6rfocC5ktwtxKERyhmtlcYzB/OUbzNCy3SfthwOqJo7JlIRzXYCjP7LoRYepwt3ojBF8beYr7G3Ns4Sn8kagSAvxs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYH3lh3p96aYyG0U7lY8+jPIWzUDqW/V2y01c6fakes=;
 b=Uo6sRxoVF1XaErz2VSDdZJ7e8QXzIZJctWe4xrdixnfwwfH9XteVdcuplVq4J3sInElbsaABWiiDVmxONA6rfocC5ktwtxKERyhmtlcYzB/OUbzNCy3SfthwOqJo7JlIRzXYCjP7LoRYepwt3ojBF8beYr7G3Ns4Sn8kagSAvxs=
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
