Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDFBBACB7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 04:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C976E05D;
	Mon, 23 Sep 2019 02:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70044.outbound.protection.outlook.com [40.107.7.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA936E05D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 02:41:07 +0000 (UTC)
Received: from VI1PR08CA0210.eurprd08.prod.outlook.com (2603:10a6:802:15::19)
 by AM4PR0802MB2305.eurprd08.prod.outlook.com (2603:10a6:200:5f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.25; Mon, 23 Sep
 2019 02:41:04 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::209) by VI1PR08CA0210.outlook.office365.com
 (2603:10a6:802:15::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Mon, 23 Sep 2019 02:41:04 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25 via Frontend Transport; Mon, 23 Sep 2019 02:41:02 +0000
Received: ("Tessian outbound d5a1f2820a4f:v31");
 Mon, 23 Sep 2019 02:41:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1e0002bd0f0f5a53
X-CR-MTA-TID: 64aa7808
Received: from 0cd2d15c84c9.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.58]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 39B58A52-8A4C-45B1-91DF-AB308BBC81CB.1; 
 Mon, 23 Sep 2019 02:40:57 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2058.outbound.protection.outlook.com [104.47.10.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0cd2d15c84c9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 Sep 2019 02:40:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LuLSOHEWeS3+Fev0VspGyxiwmwZIXh8aaK66l4ARanXP8mza7+5S29p8dDTVb6cIXhbgjUqutL/qpBKxgqE6ObRx7dsRAnl5LDBC0xp/lF5QmdW08B6ppOmXHrAnZONWUuk7GmjV+CdexMlaVPnReSB1pQ/2S2IAVekMfkORtGkxMgT7rZ7PVFA+x+u6kvjF7dJQNi77iX0y//mk4kcJ7BBPw0fY0VUYY4V1mKMIgMrijNQTwQbN9iGa+0+2tjfJfKlfNJ5S/d/dYuzjpn2fthnv0I/xm5ALoHnid4HR7I0E+vAfQ4UtlcV9LB6xJQ5/yi2Aol5Z7icl2EPMtCN/Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4vsWcnDaPizo30FleE7OKqfrOqCMIvTuGtDMMTtdh0=;
 b=YRt/TvCX2owXZRtexgqXS6i7qUAh0nFvEuE7TB6RSBhiAowtFCDozIF814JsoPqLpz2WDzgdqOk3SAzUH2hgUWceGymYk+RJLDo31QCLma6zvVMU9xVYED0fngMYuHEYsO9ccogLiatqLALjm6Xxc7sLUNIlxWJRJf8wpYpLmHAGaMZWhigSjiU3als+rI5anvAgHhAKDn7GAZVlTPv2UBkCIih0vYea8wh3i9p3fl6Q2tJytTpyS97fZUFNXQPNCIpsMC7WhUsofTiN7G5lE6aCToTUsK0cpHRJsuTlL41GCKAAL6cwgf7aneHIpGJQBD5Y09rYFG42ip8YWAM51g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4814.eurprd08.prod.outlook.com (10.255.115.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Mon, 23 Sep 2019 02:40:54 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879%5]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 02:40:54 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH] drm/komeda: Fix typos in komeda_splitter_validate
Thread-Topic: [PATCH] drm/komeda: Fix typos in komeda_splitter_validate
Thread-Index: AQHVb8WxZ1V2B5EmMkKFYK26VJ4Bb6c4kQ2A
Date: Mon, 23 Sep 2019 02:40:54 +0000
Message-ID: <20190923024045.GA24909@jamwan02-TSP300>
References: <20190920151117.22725-1-mihail.atanassov@arm.com>
In-Reply-To: <20190920151117.22725-1-mihail.atanassov@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0035.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3e::23) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4770fae2-6180-4294-8380-08d73fcf798e
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VE1PR08MB4814; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4814:|VE1PR08MB4814:|AM4PR0802MB2305:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM4PR0802MB2305FDF4AB90F9E964E066BBB3850@AM4PR0802MB2305.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 0169092318
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(366004)(136003)(346002)(39860400002)(376002)(396003)(189003)(199004)(2906002)(33716001)(6116002)(3846002)(66066001)(25786009)(54906003)(316002)(58126008)(1076003)(4326008)(6246003)(14444005)(256004)(33656002)(9686003)(6512007)(305945005)(6636002)(86362001)(6862004)(229853002)(6436002)(52116002)(6486002)(7736002)(476003)(14454004)(5660300002)(386003)(6506007)(71190400001)(71200400001)(76176011)(26005)(186003)(102836004)(446003)(478600001)(55236004)(64756008)(66446008)(66946007)(11346002)(99286004)(486006)(8936002)(66476007)(81156014)(66556008)(8676002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4814;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: w8tUNRcn97rkSqk2cUvb3DI+9IYAWOwIebjwCowN4/DUXXsqFrl8Eo5mOuK47p4kv2u6nDJ65xkYZl9xOhbj/i3IgJYRH5vCR6G233jZ8CgjspdUDob+pYyj/Hm7staq/kAkv/VE4tmRxRUKll6dG1gmkTH5TbUasmwJej8VT8fKCZ855TdeAMtZbkXmVdjXXdRAc8URR94CEDGoC59b8A42pW6OGTAVSHmodRO5wgjG3XUHvRX51WmFgmBlJYDKPgkLvDcdqMLzv6i2zWpXFgobsacNDdoen/Amgezzz3gm7qqZCTFRtLd+9VdBj72S5yERFu8HBJPvv0XmKVyx5Clsz22htHPSVi/b990N5HPKIJ0A/KgGB2XMEN0HG7ITtRkBjtre05NjRYI/gJcYOBSxDlxYurQ9kdNczkxm9is=
Content-ID: <893F16B3898512429056213B6D6AC0F9@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4814
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(346002)(136003)(39860400002)(396003)(199004)(189003)(446003)(99286004)(76176011)(11346002)(33656002)(386003)(97756001)(107886003)(26005)(186003)(305945005)(6636002)(7736002)(4326008)(6862004)(102836004)(66066001)(46406003)(6486002)(6246003)(22756006)(14444005)(6506007)(47776003)(8936002)(8746002)(356004)(6512007)(6116002)(3846002)(23726003)(2906002)(229853002)(9686003)(81166006)(8676002)(81156014)(476003)(33716001)(1076003)(486006)(25786009)(70586007)(478600001)(26826003)(316002)(126002)(70206006)(50466002)(5660300002)(336012)(14454004)(54906003)(63350400001)(36906005)(58126008)(76130400001)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR0802MB2305;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e80c1463-bb06-4729-7978-08d73fcf7443
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM4PR0802MB2305; 
NoDisclaimer: True
X-Forefront-PRVS: 0169092318
X-Microsoft-Antispam-Message-Info: VnKK1nByr4DLOzDGcWjNvpIAXRJftYMNS6pXTPAU8snUIrbovHKtrz8smHZA42PAI81tbkT04O1YdI+qz+ca4aFjZvstLBYICE5WEeXQGHOYLnh7eDtNGT+Lg7linbKKQfdoU9utAYHE16zzSTnrkSPOtqEY8G70N73LFvugWEuS75Tij5kECiSGf68p8VtPjcp96lqBxlC2I9dKyBKpeiujTpf/L1DjVfRAKk48ep1E/EUx8A7KL6oedMwhyFUkMfsq2oDMBerwdPkJkRTEaoLEi/T+YkhuKV1Uu8F7Hd67ZZ9hd3VtHi9yot6wONz4wH1V7XWkX6mJYfDAwfd51P1PAmU6hjcmsCJhrJDRbZLxEycdgtBQYWFX8EAYScSyTcAEwJngX1UUvG19K7cx3hveDNqlkVoYXCcTzWmHw7A=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2019 02:41:02.5817 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4770fae2-6180-4294-8380-08d73fcf798e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2305
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4vsWcnDaPizo30FleE7OKqfrOqCMIvTuGtDMMTtdh0=;
 b=aRZ/FYDRIg936nZItrWwBWHatp9dy3oaC/wnFWO03E2Ag7iJ0WiDdcsbgc6fqQqTV/1JjhGKW7WZ52DdUnippjYXesZsVAfx5EhFX0OO6QUqKbleKyYKXgtVIHhTbDtqSoSVPVnTjX5GFCHSsyUQP9kbvpXeLMxHaQhbyXvdL5E=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4vsWcnDaPizo30FleE7OKqfrOqCMIvTuGtDMMTtdh0=;
 b=aRZ/FYDRIg936nZItrWwBWHatp9dy3oaC/wnFWO03E2Ag7iJ0WiDdcsbgc6fqQqTV/1JjhGKW7WZ52DdUnippjYXesZsVAfx5EhFX0OO6QUqKbleKyYKXgtVIHhTbDtqSoSVPVnTjX5GFCHSsyUQP9kbvpXeLMxHaQhbyXvdL5E=
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWloYWlsCgpPbiBGcmksIFNlcCAyMCwgMjAxOSBhdCAwMzoxMTozNFBNICswMDAwLCBNaWhh
aWwgQXRhbmFzc292IHdyb3RlOgo+IEZpeCBib3RoIHRoZSBzdHJpbmcgYW5kIHRoZSBzdHJ1Y3Qg
bWVtYmVyIGJlaW5nIHByaW50ZWQuCj4gCj4gRml4ZXM6IDI2NGI5NDM2ZDIzYiAoImRybS9rb21l
ZGE6IEVuYWJsZSB3cml0ZWJhY2sgc3BsaXQgc3VwcG9ydCIpCj4gU2lnbmVkLW9mZi1ieTogTWlo
YWlsIEF0YW5hc3NvdiA8bWloYWlsLmF0YW5hc3NvdkBhcm0uY29tPgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jIHwgNCAr
Ky0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X3BpcGVsaW5lX3N0YXRlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9waXBlbGluZV9zdGF0ZS5jCj4gaW5kZXggOTUwMjM1YWYxZTc5Li5kZTY0YTZhOTk2NGUg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
cGlwZWxpbmVfc3RhdGUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMKPiBAQCAtNTY0LDggKzU2NCw4IEBAIGtvbWVkYV9z
cGxpdHRlcl92YWxpZGF0ZShzdHJ1Y3Qga29tZWRhX3NwbGl0dGVyICpzcGxpdHRlciwKPiAgCX0K
PiAgCj4gIAlpZiAoIWluX3JhbmdlKCZzcGxpdHRlci0+dnNpemUsIGRmbG93LT5pbl9oKSkgewo+
IC0JCURSTV9ERUJVR19BVE9NSUMoInNwbGl0IGluX2luOiAlZCBleGNlZWQgdGhlIGFjY2VwdGFi
bGUgcmFuZ2UuXG4iLAo+IC0JCQkJIGRmbG93LT5pbl93KTsKPiArCQlEUk1fREVCVUdfQVRPTUlD
KCJzcGxpdCBpbl9oOiAlZCBleGNlZWQgdGhlIGFjY2VwdGFibGUgcmFuZ2UuXG4iLAo+ICsJCQkJ
IGRmbG93LT5pbl9oKTsKCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KClJldmlld2VkLWJ5OiBK
YW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFy
bS5jb20+Cgo+ICAJCXJldHVybiAtRUlOVkFMOwo+ICAJfQo+ICAKPiAtLSAKPiAyLjIzLjAKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
