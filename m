Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0948B7BED2
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 13:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E18189AC6;
	Wed, 31 Jul 2019 11:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::61c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABB789AC6
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 11:05:01 +0000 (UTC)
Received: from VI1PR08CA0185.eurprd08.prod.outlook.com (2603:10a6:800:d2::15)
 by AM0PR08MB4948.eurprd08.prod.outlook.com (2603:10a6:208:163::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.14; Wed, 31 Jul
 2019 11:04:57 +0000
Received: from DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::202) by VI1PR08CA0185.outlook.office365.com
 (2603:10a6:800:d2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.12 via Frontend
 Transport; Wed, 31 Jul 2019 11:04:57 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT005.mail.protection.outlook.com (10.152.20.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Wed, 31 Jul 2019 11:04:55 +0000
Received: ("Tessian outbound 71602e13cd49:v26");
 Wed, 31 Jul 2019 11:04:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bde33b5ab3e1aaf6
X-CR-MTA-TID: 64aa7808
Received: from bb723fe09053.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 605E3197-38F3-4DFA-9B7F-B076A514BC2D.1; 
 Wed, 31 Jul 2019 11:04:42 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bb723fe09053.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Wed, 31 Jul 2019 11:04:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIWkv8KxOPf/yJ12N1e+YoRx0wAVkEwXLBptYvPNcJds9gZ3caQVb7+PC4dRD0w0IAwFuB2VGmjfvuKwz5ZLXJ4ABOTTP2Vfh/ADg8ip3qATe39PSKLM+Fkimrj5lKsGE/aGOzB3vJhgwphOYr7jMjqSwt5vjmrZiOxn6wy0zEHEjqSYQs4vmkUtSwXrMqJ9MHFJLVnnGwfr++kWk5vKdhrq+nJpvfWMFOIQb9ZUIY9N2/j+8z5bNPZw7SEwBen/Fxt9W8HhdWaRct5ZTyLz0IfDcxqYej1PQqJc7mklul5w/r8dSo926xwlA/MXCrEtwn4p3ovqGkPc7XKVS1AGlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04/pGjJWhVQqP9E2zDDWKifzlhklY7KxiJnZhr7cGTA=;
 b=AWQaQDdmP4LqACa8LCJa9kjk4PEqcHT9AbRtl4pc3ff6wwhMbZe1NUy6w7WU9NyAhfEkr0DoAg9/PTB16RXN3lufrVQDxxnRgFRcWJaCPrQ8xhUTrF1bdUkn3FSYSid/DVtgTXJzUria2VIwHtRqJ7JJ06SirJw9rOk7NE38GtN/TQsoPqVUfN7AFDNdgCrydLvjKptEFNHYYMeSvM3rdFVqt7AYHAf07wwXMIbKDgqTXQDVQo4DwJhdzxwSbkAzm+4XYw9P7cljgClyUQSvawbruTfs1z7WE8ZZuMzW/3dL6JBh6N2UlZBRaThKt/y5b0Mt5s4hS2nFM4JpYnNgrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3277.eurprd08.prod.outlook.com (52.134.30.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.15; Wed, 31 Jul 2019 11:04:39 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236%2]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 11:04:39 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, Brian Starkey <Brian.Starkey@arm.com>
Subject: [PATCH v1 1/2] drm: Free the writeback_job when it with an empty fb
Thread-Topic: [PATCH v1 1/2] drm: Free the writeback_job when it with an empty
 fb
Thread-Index: AQHVR4++ZQXRcCwwSUeRbKZ2hesp5g==
Date: Wed, 31 Jul 2019 11:04:38 +0000
Message-ID: <1564571048-15029-2-git-send-email-lowry.li@arm.com>
References: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
In-Reply-To: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: SG2PR03CA0127.apcprd03.prod.outlook.com
 (2603:1096:4:91::31) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: bf7c62e6-c832-4a2d-0b08-08d715a6eba6
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3277; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB3277:|AM0PR08MB4948:
X-Microsoft-Antispam-PRVS: <AM0PR08MB4948DD74FE92942C184D3C909FDF0@AM0PR08MB4948.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:51;OLM:51;
x-forefront-prvs: 011579F31F
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(376002)(366004)(396003)(199004)(189003)(66066001)(6506007)(386003)(102836004)(256004)(99286004)(7416002)(55236004)(5660300002)(71200400001)(71190400001)(52116002)(478600001)(446003)(25786009)(53936002)(6512007)(2501003)(486006)(86362001)(3846002)(2906002)(476003)(4326008)(11346002)(2616005)(6116002)(81156014)(81166006)(68736007)(8676002)(6486002)(50226002)(7736002)(305945005)(64756008)(66446008)(66556008)(66476007)(66946007)(76176011)(14454004)(2201001)(36756003)(316002)(54906003)(110136005)(26005)(6436002)(6636002)(8936002)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3277;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 9GAulN+Mfv3Bpdr9b2MuGoz5KCMe6el24Mp1s+W8k8hr7TyjLJZtd/MDbq2tKxQB33px8GgoHBIE6dOUO/Vr6LmCgMY2ILB+TuC79wnMEd4MGZW5Wl93ibUTl6lcubQ9osUm2ckkwo2eLq1xAHzG+54bUz6+xKkVDvrgyreqyDZZvpN8zKYnEZKhVIUCqT67S/HQN1XiMdE/Pm9A0EAwgpkDKUsR0Crbq2UNiq+jTbp9jM9RO6HHhUFPXJHqAB3RT6SWBAJy+XAx1vQm6lMR3DWgBf3ECZnxTTbfyb12hP8F+p4g7ZqStgdrHH4f+dAomL34kgxCuIW/tiklSf2oFMlf484hu7K38uArAfk9iQh9V5PTrX9dorhbubn7sfueyZtgBqNUibTfxEqrrMOvTM08XHAWpTVjNDKiU4pIjLI=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3277
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(346002)(39860400002)(2980300002)(189003)(199004)(476003)(70206006)(6512007)(8676002)(26826003)(86362001)(478600001)(36756003)(6636002)(356004)(5660300002)(126002)(50466002)(70586007)(6486002)(76130400001)(486006)(2201001)(23756003)(446003)(2501003)(316002)(99286004)(2616005)(336012)(14454004)(11346002)(26005)(63350400001)(63370400001)(305945005)(102836004)(7736002)(6116002)(3846002)(25786009)(76176011)(2906002)(81156014)(81166006)(110136005)(386003)(6506007)(186003)(8936002)(8746002)(4326008)(54906003)(22756006)(66066001)(50226002)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4948;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: cffc6c92-4413-4819-1729-08d715a6e10c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR08MB4948; 
NoDisclaimer: True
X-Forefront-PRVS: 011579F31F
X-Microsoft-Antispam-Message-Info: CZooz7TFLlRzy4/eSTpvfaX3Nn60wB5J6hErsBk5JpcsfqI87Ks2v8qTNJ5JYgcDGMRbQWVvVx2ObST0k1mWgn7zfYMi1LdrgBi96VBY/YDXyfsm21JwIUofY2KpieH2+irWNZI5NLcdMWc7ofxUR+IHcQ7AdmLHmnIRIeGHBvOZCUZNGhEtOqNN23f884cZIyrWlVDmtXH+gB1V2LygbetCKceEIeP23PRJY10Y+ZFxtOBudKXSttImg/5R3s00sXula3KtQ+0yGEcELLdoA9RSC5CB5OoYfeEOBjDTJ/Vv7N0Vk1WNM4IJPgMPjwa5oAQX5y+Lmq18quHn1DNROuq0hWB78hk8dX3gfbtNV6/UreNPl0+C35M5XRkzGC4ooIoIwkO+e9xv0EDMrX8aEv3kRwyNH8KMwLHPF+aYbt0=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2019 11:04:55.7956 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7c62e6-c832-4a2d-0b08-08d715a6eba6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4948
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04/pGjJWhVQqP9E2zDDWKifzlhklY7KxiJnZhr7cGTA=;
 b=E7ebuFvkbTjAUaKPJgPRhwxtibO/xalGiFHtFCaDAoc8lhXQ8VGQgmb5a7QTnAU2bE31mMXDyzS7/Ft0iMUnMf2V2CdQPWuJqijoWsSy+uW6zs4Ef0lMuo/riQqbmQfXKcysecQDgLjpURjMWmt/9K9/EtCE/hMPd27VHd4ohq8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04/pGjJWhVQqP9E2zDDWKifzlhklY7KxiJnZhr7cGTA=;
 b=E7ebuFvkbTjAUaKPJgPRhwxtibO/xalGiFHtFCaDAoc8lhXQ8VGQgmb5a7QTnAU2bE31mMXDyzS7/Ft0iMUnMf2V2CdQPWuJqijoWsSy+uW6zs4Ef0lMuo/riQqbmQfXKcysecQDgLjpURjMWmt/9K9/EtCE/hMPd27VHd4ohq8=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=temperror action=none header.from=arm.com;
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
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 nd <nd@arm.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 Ayan Halder <Ayan.Halder@arm.com>, "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogIkxvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkiIDxMb3dyeS5MaUBhcm0uY29t
PgoKQWRkcyB0aGUgY2hlY2sgaWYgdGhlIHdyaXRlYmFja19qb2Igd2l0aCBhbiBlbXB0eSBmYiwg
dGhlbiBpdCBzaG91bGQKYmUgZnJlZWQgaW4gYXRvbWljX2NoZWNrIHBoYXNlLgoKV2l0aCB0aGlz
IGNoYW5nZSwgdGhlIGRyaXZlciB1c2VycyB3aWxsIG5vdCBjaGVjayBlbXB0eSBmYiBjYXNlIGFu
eSBtb3JlLgpTbyByZWZpbmVkIGFjY29yZGluZ2x5LgoKU2lnbmVkLW9mZi1ieTogTG93cnkgTGkg
KEFybSBUZWNobm9sb2d5IENoaW5hKSA8bG93cnkubGlAYXJtLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYyB8ICAzICstLQog
ZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfbXcuYyAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pYy5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDEzICsrKysrKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3Jj
YXJfZHVfd3JpdGViYWNrLmMgICAgICAgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9ncHUvZHJt
L3ZjNC92YzRfdHhwLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArKy0tLQogNSBm
aWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0
b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5l
Y3Rvci5jCmluZGV4IDYxN2UxZjcuLmQ2MTAzZGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jCkBAIC00Myw5
ICs0Myw4IEBACiAJc3RydWN0IGtvbWVkYV9kYXRhX2Zsb3dfY2ZnIGRmbG93OwogCWludCBlcnI7
CiAKLQlpZiAoIXdyaXRlYmFja19qb2IgfHwgIXdyaXRlYmFja19qb2ItPmZiKSB7CisJaWYgKCF3
cml0ZWJhY2tfam9iKQogCQlyZXR1cm4gMDsKLQl9CiAKIAlpZiAoIWNydGNfc3QtPmFjdGl2ZSkg
ewogCQlEUk1fREVCVUdfQVRPTUlDKCJDYW5ub3Qgd3JpdGUgdGhlIGNvbXBvc2l0aW9uIHJlc3Vs
dCBvdXQgb24gYSBpbmFjdGl2ZSBDUlRDLlxuIik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYXJtL21hbGlkcF9tdy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfbXcuYwppbmRl
eCAyZTgxMjUyLi5hNTkyMjdiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlk
cF9tdy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX213LmMKQEAgLTEzMCw3ICsx
MzAsNyBAQCBzdGF0aWMgdm9pZCBtYWxpZHBfbXdfY29ubmVjdG9yX2Rlc3Ryb3koc3RydWN0IGRy
bV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIAlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYjsKIAlp
bnQgaSwgbl9wbGFuZXM7CiAKLQlpZiAoIWNvbm5fc3RhdGUtPndyaXRlYmFja19qb2IgfHwgIWNv
bm5fc3RhdGUtPndyaXRlYmFja19qb2ItPmZiKQorCWlmICghY29ubl9zdGF0ZS0+d3JpdGViYWNr
X2pvYikKIAkJcmV0dXJuIDA7CiAKIAlmYiA9IGNvbm5fc3RhdGUtPndyaXRlYmFja19qb2ItPmZi
OwpAQCAtMjQ3LDcgKzI0Nyw3IEBAIHZvaWQgbWFsaWRwX213X2F0b21pY19jb21taXQoc3RydWN0
IGRybV9kZXZpY2UgKmRybSwKIAogCW13X3N0YXRlID0gdG9fbXdfc3RhdGUoY29ubl9zdGF0ZSk7
CiAKLQlpZiAoY29ubl9zdGF0ZS0+d3JpdGViYWNrX2pvYiAmJiBjb25uX3N0YXRlLT53cml0ZWJh
Y2tfam9iLT5mYikgeworCWlmIChjb25uX3N0YXRlLT53cml0ZWJhY2tfam9iKSB7CiAJCXN0cnVj
dCBkcm1fZnJhbWVidWZmZXIgKmZiID0gY29ubl9zdGF0ZS0+d3JpdGViYWNrX2pvYi0+ZmI7CiAK
IAkJRFJNX0RFVl9ERUJVR19EUklWRVIoZHJtLT5kZXYsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2F0b21pYy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWMuYwppbmRleCA0
MTkzODFhLi4xNGFlYWY3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pYy5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljLmMKQEAgLTQzMCwxMCArNDMwLDE1IEBA
IHN0YXRpYyBpbnQgZHJtX2F0b21pY19jb25uZWN0b3JfY2hlY2soc3RydWN0IGRybV9jb25uZWN0
b3IgKmNvbm5lY3RvciwKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCi0JaWYgKHdyaXRlYmFja19q
b2ItPm91dF9mZW5jZSAmJiAhd3JpdGViYWNrX2pvYi0+ZmIpIHsKLQkJRFJNX0RFQlVHX0FUT01J
QygiW0NPTk5FQ1RPUjolZDolc10gcmVxdWVzdGluZyBvdXQtZmVuY2Ugd2l0aG91dCBmcmFtZWJ1
ZmZlclxuIiwKLQkJCQkgY29ubmVjdG9yLT5iYXNlLmlkLCBjb25uZWN0b3ItPm5hbWUpOwotCQly
ZXR1cm4gLUVJTlZBTDsKKwlpZiAoIXdyaXRlYmFja19qb2ItPmZiKSB7CisJCWlmICh3cml0ZWJh
Y2tfam9iLT5vdXRfZmVuY2UpIHsKKwkJCURSTV9ERUJVR19BVE9NSUMoIltDT05ORUNUT1I6JWQ6
JXNdIHJlcXVlc3Rpbmcgb3V0LWZlbmNlIHdpdGhvdXQgZnJhbWVidWZmZXJcbiIsCisJCQkJCSBj
b25uZWN0b3ItPmJhc2UuaWQsIGNvbm5lY3Rvci0+bmFtZSk7CisJCQlyZXR1cm4gLUVJTlZBTDsK
KwkJfQorCisJCWRybV93cml0ZWJhY2tfY2xlYW51cF9qb2Iod3JpdGViYWNrX2pvYik7CisJCXN0
YXRlLT53cml0ZWJhY2tfam9iID0gTlVMTDsKIAl9CiAKIAlyZXR1cm4gMDsKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfd3JpdGViYWNrLmMgYi9kcml2ZXJzL2dw
dS9kcm0vcmNhci1kdS9yY2FyX2R1X3dyaXRlYmFjay5jCmluZGV4IGFlMDcyOTAuLjA0ZWZhNzhk
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X3dyaXRlYmFjay5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfd3JpdGViYWNrLmMKQEAgLTE0
Nyw3ICsxNDcsNyBAQCBzdGF0aWMgaW50IHJjYXJfZHVfd2JfZW5jX2F0b21pY19jaGVjayhzdHJ1
Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCiAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGVuY29k
ZXItPmRldjsKIAlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYjsKIAotCWlmICghY29ubl9zdGF0
ZS0+d3JpdGViYWNrX2pvYiB8fCAhY29ubl9zdGF0ZS0+d3JpdGViYWNrX2pvYi0+ZmIpCisJaWYg
KCFjb25uX3N0YXRlLT53cml0ZWJhY2tfam9iKQogCQlyZXR1cm4gMDsKIAogCWZiID0gY29ubl9z
dGF0ZS0+d3JpdGViYWNrX2pvYi0+ZmI7CkBAIC0yMjEsNyArMjIxLDcgQEAgdm9pZCByY2FyX2R1
X3dyaXRlYmFja19zZXR1cChzdHJ1Y3QgcmNhcl9kdV9jcnRjICpyY3J0YywKIAl1bnNpZ25lZCBp
bnQgaTsKIAogCXN0YXRlID0gcmNydGMtPndyaXRlYmFjay5iYXNlLnN0YXRlOwotCWlmICghc3Rh
dGUgfHwgIXN0YXRlLT53cml0ZWJhY2tfam9iIHx8ICFzdGF0ZS0+d3JpdGViYWNrX2pvYi0+ZmIp
CisJaWYgKCFzdGF0ZSB8fCAhc3RhdGUtPndyaXRlYmFja19qb2IpCiAJCXJldHVybjsKIAogCWZi
ID0gc3RhdGUtPndyaXRlYmFja19qb2ItPmZiOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3ZjNC92YzRfdHhwLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF90eHAuYwppbmRleCA5NmY5
MWMxLi5lOTJmYTEyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF90eHAuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF90eHAuYwpAQCAtMjI5LDcgKzIyOSw3IEBAIHN0
YXRpYyBpbnQgdmM0X3R4cF9jb25uZWN0b3JfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fY29ubmVj
dG9yICpjb25uLAogCWludCBpOwogCiAJY29ubl9zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X25ld19j
b25uZWN0b3Jfc3RhdGUoc3RhdGUsIGNvbm4pOwotCWlmICghY29ubl9zdGF0ZS0+d3JpdGViYWNr
X2pvYiB8fCAhY29ubl9zdGF0ZS0+d3JpdGViYWNrX2pvYi0+ZmIpCisJaWYgKCFjb25uX3N0YXRl
LT53cml0ZWJhY2tfam9iKQogCQlyZXR1cm4gMDsKIAogCWNydGNfc3RhdGUgPSBkcm1fYXRvbWlj
X2dldF9uZXdfY3J0Y19zdGF0ZShzdGF0ZSwgY29ubl9zdGF0ZS0+Y3J0Yyk7CkBAIC0yNjksOCAr
MjY5LDcgQEAgc3RhdGljIHZvaWQgdmM0X3R4cF9jb25uZWN0b3JfYXRvbWljX2NvbW1pdChzdHJ1
Y3QgZHJtX2Nvbm5lY3RvciAqY29ubiwKIAl1MzIgY3RybDsKIAlpbnQgaTsKIAotCWlmIChXQVJO
X09OKCFjb25uX3N0YXRlLT53cml0ZWJhY2tfam9iIHx8Ci0JCSAgICAhY29ubl9zdGF0ZS0+d3Jp
dGViYWNrX2pvYi0+ZmIpKQorCWlmIChXQVJOX09OKCFjb25uX3N0YXRlLT53cml0ZWJhY2tfam9i
KSkKIAkJcmV0dXJuOwogCiAJbW9kZSA9ICZjb25uX3N0YXRlLT5jcnRjLT5zdGF0ZS0+YWRqdXN0
ZWRfbW9kZTsKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
