Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 900ECD8DFE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 12:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290AD6E930;
	Wed, 16 Oct 2019 10:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0a::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36846E930
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 10:34:44 +0000 (UTC)
Received: from VI1PR08CA0107.eurprd08.prod.outlook.com (2603:10a6:800:d3::33)
 by AM5PR0802MB2468.eurprd08.prod.outlook.com (2603:10a6:203:a1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Wed, 16 Oct
 2019 10:34:40 +0000
Received: from VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::209) by VI1PR08CA0107.outlook.office365.com
 (2603:10a6:800:d3::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.18 via Frontend
 Transport; Wed, 16 Oct 2019 10:34:40 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT038.mail.protection.outlook.com (10.152.19.112) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Wed, 16 Oct 2019 10:34:39 +0000
Received: ("Tessian outbound 851a1162fca7:v33");
 Wed, 16 Oct 2019 10:34:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7b89b7875e6a661f
X-CR-MTA-TID: 64aa7808
Received: from 552a0589a21a.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.13.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F6CEAD20-7757-4509-8BF8-6E164F6873B2.1; 
 Wed, 16 Oct 2019 10:34:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 552a0589a21a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Oct 2019 10:34:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jb5mFZlLHB1EusT3qSYG+NQyRb7kV6x5kC+ucLmy8+sY+qO7oB1kB0yxZicZAc4lmE0xQdaTX/Lz1i/9ydCAhUV3RIZF2aqpObnn8NzdWokjJx2cyHW7h7ivxTHTkXXeWtCos0QuE7XOIIM+0UFa6DtF0F3NZJNK9hS4y4UZI8bITEexTkDjsHGKFqv4it2FbvPJ97BzPv1bCLxmXNzUBy0ZiOx0G6xTnxN4QmyHZuH2GClBwjAB0E92Vx804vNwM0RU4NRq/ukPm3kuQ2orSzGdoTpeb8R8G6wDguMdhOusgVwud3yhGOb5DK/Fv4ig48FzH0/0H1MymAAWdJN2nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvaLJ9iCW/GukE6Q6/g2aWg+NqCkBH1FlUg88c+A1ko=;
 b=ZKgSHOZhRJ7Suvge3ewzIiutWAhN2qliZYJev5ZgnNUiNbo8FLQNkWEYXjcRfcVS8bKutxi82xCN07hLldYmkalrc5kp+PFeHql0k6jVUfIaJ3DJJugM7EydMyjoyglDThX8BdVGS8uRrHAxeBriNU3AL5iBi8F6d3xsNbmweqdEfQQuQJFFsVmEFxp2mUkgJn4jc8dUWgZc7qmgA6zGwXBbeDqkSBV7NKQqrioinvOfTnLa6eDjAQ5MdgjdekfD7uARZMWmLtgkkc7MSrD9ZxRk+FH1ez7G5FU7fwYuftnNkIrAjrX7Zs6mj+M3HyGB6ky47k+/c36YU6Nr8fcPww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5152.eurprd08.prod.outlook.com (20.179.30.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Wed, 16 Oct 2019 10:34:23 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 10:34:23 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: [PATCH v5 3/4] drm/komeda: Add drm_ctm_to_coeffs()
Thread-Topic: [PATCH v5 3/4] drm/komeda: Add drm_ctm_to_coeffs()
Thread-Index: AQHVhA1Gtm4BORRiPkmxAOi2mqef/g==
Date: Wed, 16 Oct 2019 10:34:22 +0000
Message-ID: <20191016103339.25858-4-james.qian.wang@arm.com>
References: <20191016103339.25858-1-james.qian.wang@arm.com>
In-Reply-To: <20191016103339.25858-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:203:36::18) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b06a949c-6e4f-4033-f651-08d7522472a6
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB5152:|VE1PR08MB5152:|AM5PR0802MB2468:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB246879ADD697E113D1B60FB8B3920@AM5PR0802MB2468.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3513;OLM:3513;
x-forefront-prvs: 0192E812EC
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(189003)(199004)(6506007)(4326008)(2171002)(25786009)(478600001)(66066001)(99286004)(103116003)(76176011)(52116002)(71190400001)(64756008)(71200400001)(256004)(66446008)(66476007)(36756003)(66946007)(14454004)(66556008)(8936002)(50226002)(8676002)(386003)(81166006)(81156014)(486006)(26005)(2501003)(186003)(55236004)(2906002)(5660300002)(110136005)(1076003)(305945005)(446003)(2201001)(6486002)(6436002)(11346002)(476003)(6512007)(316002)(6116002)(3846002)(102836004)(54906003)(86362001)(2616005)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5152;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 3RgZdF6spsqYgK4RVB7WKLLVKDKw04R1xUx+L1xTYPfTqIU5tken4iy29AWLvfqCgPDS+jPreX1QpcrYDWuv5MpYpKERUFIco1HmM4HOFPY87BYGssLT1L6mgYOlBNtvmAE9zIp8anMYuYQNF9VnOIXYAiwzYodUxQtrpYiP3zEq9EnE89vAV12i5ZLA53AODMx+Uo3nwwsinAV00G2ELk2EICseBYafN7dFxruHCk2w1N/am8KPdQlC8jjAGMNDXnqv2iTrgcgMNESz6Pvcx9h+DVSwzdsTNpBEmXToyKLD4zch12lRFtHcHv+H8R+isHSS3MC+xqxS4QGmOz25gDgHjjTlacJfVkSjWPt7kbHxzaHKf5ANaNoasDMMfweDj1lvXGKCJ7BsE+3dJEmeG6kD2+1lhW41AFAoM+MUBNg=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5152
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(136003)(376002)(189003)(199004)(6116002)(26005)(76130400001)(336012)(66066001)(2201001)(86362001)(356004)(2906002)(36906005)(63350400001)(446003)(8676002)(50466002)(316002)(81156014)(81166006)(22756006)(6512007)(11346002)(3846002)(2171002)(486006)(186003)(126002)(476003)(2616005)(5660300002)(8936002)(6486002)(2501003)(8746002)(14454004)(102836004)(478600001)(25786009)(47776003)(50226002)(4326008)(386003)(70586007)(110136005)(23756003)(54906003)(99286004)(6506007)(26826003)(1076003)(70206006)(103116003)(305945005)(76176011)(7736002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0802MB2468;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: f3ed9998-e2d7-49d9-031c-08d7522468cc
NoDisclaimer: True
X-Forefront-PRVS: 0192E812EC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c608D2XpV1M3TIUQiACgiFwW86/rebDofxn1L4SkfhWa7YnW6uO06Z8XqhmrIxffIDiSXRG1+vA+dLIyB2pn9OXYEdbzIoIDSurTheEYL4xRKrgNCVS2f1oEOLyG9XM6OwWPn3zVN6IAjhyOQeFmeG09Yv0c3erfuCiMeD8pQXvKw39o4bBK8QdVlYJxmF4nW6gdz1lE/TAjrYKQVNskf2xiWM6OGUuSU6IAAi3AWQHDckgUgoMGg2BhtX/MIyK8PVXyO9PAgHdL0K/n6R0np135KEeKmEWIZgmgzbBE+NS9NM57neuAge0Hk192iPxx8xr1IjKfDjOJeYk/MrkbsO8cPY3VakymrisDosA/JW2TEKXh1sYAE/xA29a14tnelLuCGBbFMZZTwrgNyjWEECq0uFDB7BfLyI/pQY4cKAE=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2019 10:34:39.1008 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b06a949c-6e4f-4033-f651-08d7522472a6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2468
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvaLJ9iCW/GukE6Q6/g2aWg+NqCkBH1FlUg88c+A1ko=;
 b=ji/J+1Zp78yAUtVtVhe1tn+kYdlPjci8ONd4VJjxkgMZixi6jJgroFmYElEGM3qFBVuHDJV3MPQJo57TwFGF/O3jXN3ZKH1CvrQQGI9e0a0a7uzGfd5jZ404Tydjl2q2EpZim3AB/xX1GvZeJXEvOU/rEq0hY2cIEQvrtE5UsU4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvaLJ9iCW/GukE6Q6/g2aWg+NqCkBH1FlUg88c+A1ko=;
 b=ji/J+1Zp78yAUtVtVhe1tn+kYdlPjci8ONd4VJjxkgMZixi6jJgroFmYElEGM3qFBVuHDJV3MPQJo57TwFGF/O3jXN3ZKH1CvrQQGI9e0a0a7uzGfd5jZ404Tydjl2q2EpZim3AB/xX1GvZeJXEvOU/rEq0hY2cIEQvrtE5UsU4=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
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
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBmdW5jdGlvbiBpcyBmb3IgY29udmVydGluZyBkcm1fY29sb3JfY3RtIG1hdHJpeCB0byBr
b21lZGEgaGFyZHdhcmUKcmVxdWlyZWQgcmVxdWlyZWQgUTIuMTIgMidzIGNvbXBsZW1lbnQgQ1ND
IG1hdHJpeC4KCnYyOgogIE1vdmUgdGhlIGZpeHBvaW50IGNvbnZlcnNpb24gZnVuY3Rpb24gczMx
XzMyX3RvX3EyXzEyKCkgdG8gZHJtIGNvcmUKICBhcyBhIHNoYXJlZCBoZWxwZXIuCgpTaWduZWQt
b2ZmLWJ5OiBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlh
bi53YW5nQGFybS5jb20+ClJldmlld2VkLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRh
bmFzc292QGFybS5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9jb2xvcl9tZ210LmMgfCAxNCArKysrKysrKysrKysrKwogLi4uL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmggfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDE1
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMKaW5kZXggYzE4MGNlNzBjMjZjLi5kOGU0NDllNmVi
ZGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2NvbG9yX21nbXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9jb2xvcl9tZ210LmMKQEAgLTExNywzICsxMTcsMTcgQEAgdm9pZCBkcm1fbHV0X3RvX2Zn
YW1tYV9jb2VmZnMoc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpsdXRfYmxvYiwgdTMyICpjb2Vm
ZnMpCiB7CiAJZHJtX2x1dF90b19jb2VmZnMobHV0X2Jsb2IsIGNvZWZmcywgc2VjdG9yX3RibCwg
QVJSQVlfU0laRShzZWN0b3JfdGJsKSk7CiB9CisKK3ZvaWQgZHJtX2N0bV90b19jb2VmZnMoc3Ry
dWN0IGRybV9wcm9wZXJ0eV9ibG9iICpjdG1fYmxvYiwgdTMyICpjb2VmZnMpCit7CisJc3RydWN0
IGRybV9jb2xvcl9jdG0gKmN0bTsKKwl1MzIgaTsKKworCWlmICghY3RtX2Jsb2IpCisJCXJldHVy
bjsKKworCWN0bSA9IGN0bV9ibG9iLT5kYXRhOworCisJZm9yIChpID0gMDsgaSA8IEtPTUVEQV9O
X0NUTV9DT0VGRlM7IGkrKykKKwkJY29lZmZzW2ldID0gZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9f
cW1fbihjdG0tPm1hdHJpeFtpXSwgMywgMTIpOworfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5oCmluZGV4IDA4YWI2OTI4
MTY0OC4uMmY0NjY4NDY2MTEyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5oCkBAIC0xOCw2ICsxOCw3IEBACiAjZGVm
aW5lIEtPTUVEQV9OX0NUTV9DT0VGRlMJCTkKIAogdm9pZCBkcm1fbHV0X3RvX2ZnYW1tYV9jb2Vm
ZnMoc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpsdXRfYmxvYiwgdTMyICpjb2VmZnMpOwordm9p
ZCBkcm1fY3RtX3RvX2NvZWZmcyhzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmN0bV9ibG9iLCB1
MzIgKmNvZWZmcyk7CiAKIGNvbnN0IHMzMiAqa29tZWRhX3NlbGVjdF95dXYycmdiX2NvZWZmcyh1
MzIgY29sb3JfZW5jb2RpbmcsIHUzMiBjb2xvcl9yYW5nZSk7CiAKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
