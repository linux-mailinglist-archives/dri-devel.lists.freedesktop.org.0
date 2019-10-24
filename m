Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57978E356F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 16:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2F5895D7;
	Thu, 24 Oct 2019 14:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD39895D7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 14:22:30 +0000 (UTC)
Received: from VI1PR0802CA0041.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::27) by AM6PR08MB3541.eurprd08.prod.outlook.com
 (2603:10a6:20b:51::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.20; Thu, 24 Oct
 2019 14:22:27 +0000
Received: from DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::203) by VI1PR0802CA0041.outlook.office365.com
 (2603:10a6:800:a9::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.20 via Frontend
 Transport; Thu, 24 Oct 2019 14:22:27 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT041.mail.protection.outlook.com (10.152.21.4) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.23 via Frontend Transport; Thu, 24 Oct 2019 14:22:27 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Thu, 24 Oct 2019 14:22:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a46a090b7d5ff0b1
X-CR-MTA-TID: 64aa7808
Received: from d3b659b80781.1 (cr-mta-lb-1.cr-mta-net [104.47.10.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0C5D601C-A2E2-4716-BF28-C4B6F1CAE254.1; 
 Thu, 24 Oct 2019 14:22:20 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2052.outbound.protection.outlook.com [104.47.10.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d3b659b80781.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 24 Oct 2019 14:22:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SoiLPZn7/VUCbLBigVvSxvgs4SYYPzjsJD9wbQZg9iy7yHqv1P88aWdFqA/tGGqiCbqiiFDzOpg6N0cTpLgBtjA/xz/1LkyEOhX0PX7y2w1jIkkn0kypXl4bS1PdVqubcHjvmk1Mq8lJoyE5m0ixhFwJaEqLHgVZHqQq8NwlfBSjzq9MUP8gveBWSyOlhHv4Iq2Whg7zhDuwGve/GCaHep1jU1qa/1JUGNk4nNbUmnwtQrwALUnnpU3Crhf3D/4Qg6OKYrK4D2MIGX45/JeIFvUmN6VuaSvRYVz5rLOMQGHbQGIY3FXYMQhrhTjCKCZ6HYo8PJe199EQfVGc/ePq9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bWSXpHVt5DZLtbWFpEQs17bQXwyKpBC3A5Qfyd13DA=;
 b=llrnglQZ/yWsf6UCJoSotDA1yslRbABgiwHV/AxYscNxPWMToNzt8nrUA23fmcA9SV6zmTgGFFELH8kmO/rrk3ore0cfpnI7Iqja8uj+Gzy+8gZTJ+VId9dSJDh6QarSPEmlzEgF/QyYs28kbIHVOisoYKVdkvCH9U0lpXe/klcTh264LLdcZJjqcyl8QEhjl9UPcn0n9wZhBWLL92qW2APCJCk4Hg9GNbSjLYjYnf6dBkG3gYO0MUXd9iwIyjhxXgOwcRxyDfEWRnBHY9i0BjjT5jC1LMbu+3xxQRPYsjfdyF729o0WFCjSGSVfhOLpuSwlT0GgTuhQYoaeNORccg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com (52.132.215.213) by
 AM0PR08MB2963.eurprd08.prod.outlook.com (52.134.90.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Thu, 24 Oct 2019 14:22:17 +0000
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::109c:e558:5074:13e4]) by AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::109c:e558:5074:13e4%6]) with mapi id 15.20.2387.023; Thu, 24 Oct 2019
 14:22:17 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, Mark Rutland
 <Mark.Rutland@arm.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "m.szyprowski@samsung.com"
 <m.szyprowski@samsung.com>
Subject: Question regarding "reserved-memory"
Thread-Topic: Question regarding "reserved-memory"
Thread-Index: AQHVinZwwZsw70agmEe040OUqUpTNg==
Date: Thu, 24 Oct 2019 14:22:17 +0000
Message-ID: <20191024142211.GA29467@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN4PR0401CA0021.namprd04.prod.outlook.com
 (2603:10b6:803:21::31) To AM0PR08MB5345.eurprd08.prod.outlook.com
 (2603:10a6:208:18c::21)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.53]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9263c28b-da4b-4bc2-c8af-08d7588d9905
X-MS-TrafficTypeDiagnostic: AM0PR08MB2963:|AM0PR08MB2963:|AM6PR08MB3541:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB35411734431E4D7875DC49CDE46A0@AM6PR08MB3541.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
x-forefront-prvs: 0200DDA8BE
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(199004)(189003)(478600001)(64756008)(66556008)(66066001)(66476007)(66946007)(66446008)(6512007)(6116002)(3846002)(52116002)(256004)(36756003)(386003)(25786009)(71190400001)(2906002)(26005)(71200400001)(99286004)(2501003)(110136005)(14454004)(6436002)(102836004)(6486002)(8936002)(86362001)(2201001)(1076003)(316002)(6506007)(8676002)(81166006)(81156014)(5660300002)(476003)(2616005)(4326008)(33656002)(54906003)(44832011)(486006)(305945005)(7736002)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB2963;
 H:AM0PR08MB5345.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 8dhQVxRaBb/sp5o2cVcz5KlnDwpjzPWTSde+J6miwkedTvku9JuIST5RgEch6ATBYTShICNSdrxI8dJANSnttYF5MzaOiMi3+BhxImApAfc2/kUSoV/1O3XfESoEmlgPZ+oeHiaG0qJ4GI2yeTBdsGMKPBbLWbdTkWMTv/VB7WrLuEi3HUqXwKoRsoDBwei1JQpXAn0mqIxGAEWG+DdPaW7OMnIcuXQrEHwZcnFTWimmP9BJfXPUvZPcc2tgyzCU4WSA/d/28C3IX8WxI1JYsfwdY3NE7jKCzWirElBm653LZNRgFljQzCX9tDzIl7d5CawLI8iJ5mocsKLbiQpA+RFNvAbwz83++aSZzfA5dKksqa/RxCoB0QtZiykCg4ImDXLnxlcbNe06xgUoqBzPl0k23PnZ+7FE6FJCXxhJ+WyiYVnifkrHCgl69o6SlBZu
Content-ID: <3E985F4C5AB3F24080778754F54A2885@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2963
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(1110001)(339900001)(189003)(199004)(54906003)(46406003)(336012)(25786009)(186003)(2616005)(81156014)(8676002)(6116002)(81166006)(8936002)(1076003)(7736002)(102836004)(99286004)(316002)(105606002)(23726003)(50466002)(97756001)(8746002)(476003)(26005)(6506007)(126002)(486006)(386003)(3846002)(70206006)(33656002)(356004)(86362001)(305945005)(14454004)(22756006)(110136005)(76130400001)(2201001)(2501003)(2906002)(36756003)(478600001)(6512007)(4326008)(26826003)(70586007)(6486002)(66066001)(47776003)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3541;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e555e31c-9c5f-48ff-2af3-08d7588d92f0
NoDisclaimer: True
X-Forefront-PRVS: 0200DDA8BE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AK7gUa1gzl9rSxriifgjIScJI3qTs+gh6cX3mHqGiJmM2CDSWMMVof3ZoE+iVbyhWjJfLIASkmaJi6DXRxVXwV/zcpsPX14gwIIzkgMrYCe8DnUd9L9BZPUtTa1RMF+H5Vh1KLsInDEQPO2bOkcw5qlV5McneTIs67O5Px/i7uGpI36LPo69tX4pIW7Y1sZimCLUsGgqpLs6q7q3FWbrs0/rwnmrGJd8+3hIOJkMQvsh+TXKQapBtN5MThJOGXUZrkBz2w0zZpiHlm81ywESdmU91oeLvQiA+d+I5MQQYUI+ENTp37wx8WcEHvJzGwcxOg76kKXJzNB4Nnq0jZ4ofkgjII1akjLh6yEimYMjaSzjzGlGc8MYRXbby8tEv9NHR6MPlgDLfkOtt6gVu985xVEJ2qMBkJ59ed/GwMCBoT264Rg/myKtpc6Utn/ZHlrM
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2019 14:22:27.6600 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9263c28b-da4b-4bc2-c8af-08d7588d9905
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3541
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bWSXpHVt5DZLtbWFpEQs17bQXwyKpBC3A5Qfyd13DA=;
 b=kRQHeISSWSIBgQ9c/0CfMucWfph2LATP5fDruNRSEeOFAqvC2xlFOuJyvdpw9tqAr1S3xZuuuIymDdQBX6bLm9zYYuQ+OVWF+S1QSWDFOYIpSPW7BeNaYIdSs5WDNiYsn+7cSPGECam8sO5WOEJy7z10ALxkBWIhThRwXOClZ+Y=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bWSXpHVt5DZLtbWFpEQs17bQXwyKpBC3A5Qfyd13DA=;
 b=kRQHeISSWSIBgQ9c/0CfMucWfph2LATP5fDruNRSEeOFAqvC2xlFOuJyvdpw9tqAr1S3xZuuuIymDdQBX6bLm9zYYuQ+OVWF+S1QSWDFOYIpSPW7BeNaYIdSs5WDNiYsn+7cSPGECam8sO5WOEJy7z10ALxkBWIhThRwXOClZ+Y=
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
Cc: nd <nd@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "james
 qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIEZvbGtzLAoKSSBoYXZlIGEgcXVlc3Rpb24gcmVnYXJkaW5nICJyZXNlcnZlZC1tZW1vcnki
LiBJIGFtIHVzaW5nIGFuIEFybSBKdW5vCnBsYXRmb3JtIHdoaWNoIGhhcyBhIGNodW5rIG9mIHJh
bSBpbiBpdHMgZnBnYS4gSSBpbnRlbmQgdG8gbWFrZSB0aGlzCm1lbW9yeSBhcyByZXNlcnZlZCBz
byB0aGF0IGl0IGNhbiBiZSBzaGFyZWQgYmV0d2VlbiB2YXJpb3VzIGRldmljZXMKZm9yIHBhc3Np
bmcgZnJhbWVidWZmZXIuCgpNeSBkdHMgbG9va3MgbGlrZSB0aGUgZm9sbG93aW5nOi0KCi8gewog
ICAgICAgIC4uLi4gLy8gc29tZSBub2RlcwoKICAgICAgICB0bHhANjAwMDAwMDAgewogICAgICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsKICAgICAgICAgICAgICAgIC4uLgoK
ICAgICAgICAgICAgICAgIGp1bm9fd3JhcHBlciB7CgogICAgICAgICAgICAgICAgICAgICAgICAu
Li4gLyogaGVyZSB3ZSBoYXZlIGFsbCB0aGUgbm9kZXMgKi8KICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC8qIGNvcnJlc3BvbmRpbmcgdG8gdGhlIGRldmljZXMgaW4gdGhlIGZwZ2EgKi8KCiAg
ICAgICAgICAgICAgICAgICAgICAgIG1lbW9yeUBkMDAwMDAwIHsKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGRldmljZV90eXBlID0gIm1lbW9yeSI7CiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZWcgPSA8MHgwMCAweDYwMDAwMDAwIDB4MDAgMHg4MDAwMDAwPjsKICAgICAg
ICAgICAgICAgICAgICAgICAgfTsKCiAgICAgICAgICAgICAgICAgICAgICAgIHJlc2VydmVkLW1l
bW9yeSB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDww
eDAxPjsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDB4MDE+
OwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmFuZ2VzOwoKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGZyYW1lYnVmZmVyQGQwMDAwMDAgewogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaGFyZWQtZG1hLXBvb2wiOwogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGludXgsY21hLWRlZmF1bHQ7CiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXVzYWJsZTsKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAwIDB4NjAwMDAwMDAgMHgw
MCAweDgwMDAwMDA+OwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGhh
bmRsZSA9IDwweDQ0PjsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9OwogICAgICAg
ICAgICAgICAgICAgICAgICB9OwogICAgICAgICAgICAgICAgICAgICAgICAuLi4KICAgICAgICAg
ICAgICAgIH0KICAgICAgICB9Ci4uLgp9CgpOb3RlIHRoYXQgdGhlIGRlcHRoIG9mIHRoZSAicmVz
ZXJ2ZWQtbWVtb3J5IiBub2RlIGlzIDMuCgpSZWZlciBfX2ZkdF9zY2FuX3Jlc2VydmVkX21lbSgp
IDotCgogICAgICAgIGlmICghZm91bmQgJiYgZGVwdGggPT0gMSAmJiBzdHJjbXAodW5hbWUsICJy
ZXNlcnZlZC1tZW1vcnkiKSA9PSAwKSB7CgogICAgICAgICAgICAgICAgaWYgKF9fcmVzZXJ2ZWRf
bWVtX2NoZWNrX3Jvb3Qobm9kZSkgIT0gMCkgewogICAgICAgICAgICAgICAgICAgICAgICBwcl9l
cnIoIlJlc2VydmVkIG1lbW9yeTogdW5zdXBwb3J0ZWQgbm9kZQpmb3JtYXQsIGlnbm9yaW5nXG4i
KTsKICAgICAgICAgICAgICAgICAgICAgICAgLyogYnJlYWsgc2NhbiAqLwogICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gMTsKICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgIGZv
dW5kID0gMTsKCiAgICAgICAgICAgICAgICAvKiBzY2FuIG5leHQgbm9kZSAqLwogICAgICAgICAg
ICAgICAgcmV0dXJuIDA7CiAgICAgICAgfQoKSXQgZXhwZWN0cyB0aGUgInJlc2VydmVkLW1lbW9y
eSIgbm9kZSB0byBiZSBhdCBkZXB0aCA9PSAxIGFuZCBzbyBpdApkb2VzIG5vdCBwcm9iZSBpdCBp
biBvdXIgY2FzZS4KCk5pZXRoZXIgZnJvbSB0aGUKRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3Jlc2VydmVkLW1lbW9yeS9yZXNlcnZlZC1tZW1vcnkudHh0CiBub3IgZnJvbSBjb21t
aXQgLSBlOGQ5ZDFmNTQ4NWI1MmVjM2M0ZDdhZjgzOWU2OTE0NDM4ZjZjMjg1LApJIGNvdWxkIHVu
ZGVyc3RhbmQgdGhlIHJlYXNvbiBmb3Igc3VjaCByZXN0cmljdGlvbi4KClNvLCBJIHNlZWsgdGhl
IGNvbW11bml0eSdzIGFkdmljZSBhcyB0byB3aGV0aGVyIEkgc2hvdWxkIGZpeCB1cApfX2ZkdF9z
Y2FuX3Jlc2VydmVkX21lbSgpIHNvIGFzIHRvIGRvIGF3YXkgd2l0aCB0aGUgcmVzdHJpY3Rpb24g
b3IKcHV0IHRoZSAicmVzZXJ2ZWQtbWVtb3J5IiBub2RlIG91dHNpZGUgb2YgJ3RseEA2MDAwMDAw
MCcgKHdoaWNoIGxvb2tzCiBsb2dpY2FsbHkgaW5jb3JyZWN0IGFzIHRoZSBtZW1vcnkgaXMgb24g
dGhlIGZwZ2EgcGxhdGZvcm0pLgoKClRoYW5rcywKQXlhbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
