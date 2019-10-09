Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1ECD16ED
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 19:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1019989D46;
	Wed,  9 Oct 2019 17:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40075.outbound.protection.outlook.com [40.107.4.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D852589DED
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 17:38:09 +0000 (UTC)
Received: from VE1PR08CA0019.eurprd08.prod.outlook.com (2603:10a6:803:104::32)
 by VE1PR08MB5120.eurprd08.prod.outlook.com (2603:10a6:803:108::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Wed, 9 Oct
 2019 17:38:05 +0000
Received: from DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::207) by VE1PR08CA0019.outlook.office365.com
 (2603:10a6:803:104::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 9 Oct 2019 17:38:05 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT010.mail.protection.outlook.com (10.152.20.96) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Wed, 9 Oct 2019 17:38:03 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Wed, 09 Oct 2019 17:37:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f8594380f522ab24
X-CR-MTA-TID: 64aa7808
Received: from a69d3947a0c0.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.12.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F5CFC74E-DE07-4260-B966-E60303606F12.1; 
 Wed, 09 Oct 2019 17:37:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a69d3947a0c0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Oct 2019 17:37:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ac7pc515rxVghPFwwVowmDhjHxiCTXSUjB6nIRa6orG0yWALLfUrIqempLgCOt49f/Lkp0mXS8cVpyqHMC1dxFhTmRTG5IHjScDUVn4QvVBz9h0AVJ8o9KbPVWCLVUlVOt8QsmJeyqTx0fShxRuJ71wh4xFjOxKVcOxZooFT2ONTxIobuNc6sHa96UanlqITHzI8ksl9VJCfECbvFsQ5E0zc0YAtQ8nLKfXF2i2b+OI6jpnHUDnRQ1AQPOeV1iowNSpAdj42S6FdIsz2HF7Wa1G983tGUpNLySwvRgRwnIpdD3hODNMHT5+Vn7PljOKg9VXovdW9MR8sBHTEysLWlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDnq9HMgTN1zw7N0hs2bYR89lYOqhadVeEAFgPBVJPA=;
 b=lQE7QGe/h3uasmTsFLpBKafGaRITxzFsECyIT0t16FarmpwPswkqKpA0gq/Ka9NEtP+YA3ObEOeICtK+ocUnpafOccnVRfaoVhHwtoRngBczcFf3P9OaPonJDGWdI0yhIceAgu780gaWbWskF5lU0LWhiXKSLfV63XShp7jl8VcRa8HZO5aMUtmFdAg8XW1eiHhcYIOxcYQkRvv4J38aLqLk8IkWh0Z16rT47F2SS816vlYWN8MKgw/l3kbGtkAutA8L3miCJ1gBK14jH4uDfjD+X/l8MSTYF0XLWCPIHiay1/fR0Hbbx4NSUnkFMiORsBHVmPgC1/3w7sF2i6X5fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com (52.132.215.213) by
 AM0PR08MB3107.eurprd08.prod.outlook.com (52.134.95.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 9 Oct 2019 17:37:44 +0000
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::f009:c530:6569:cf6f]) by AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::f009:c530:6569:cf6f%4]) with mapi id 15.20.2347.016; Wed, 9 Oct 2019
 17:37:44 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
Thread-Topic: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
Thread-Index: AQHVZOOF+0BJBq1hEUK86gknnLECMKczS0sAgAfTZICAF6gMgA==
Date: Wed, 9 Oct 2019 17:37:44 +0000
Message-ID: <20191009173742.GA2682@arm.com>
References: <20190906184712.91980-1-john.stultz@linaro.org>
 <CAO_48GFHx4uK6cWwJ4oGdJ8HNZNZYDzdD=yR3VK0EXQ86ya9-g@mail.gmail.com>
 <20190924162217.GA12974@arm.com>
In-Reply-To: <20190924162217.GA12974@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0349.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::25) To AM0PR08MB5345.eurprd08.prod.outlook.com
 (2603:10a6:208:18c::21)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.53]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4371b3cf-1433-43ec-d01b-08d74cdf6ff5
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM0PR08MB3107:|AM0PR08MB3107:|VE1PR08MB5120:
X-MS-Exchange-PUrlCount: 3
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB51201805FC617E454ACEFEA1E4950@VE1PR08MB5120.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 018577E36E
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(189003)(199004)(54906003)(5660300002)(6506007)(44832011)(11346002)(2616005)(446003)(386003)(8676002)(26005)(81166006)(81156014)(305945005)(316002)(7736002)(486006)(6436002)(66066001)(3846002)(66446008)(76176011)(229853002)(64756008)(86362001)(66476007)(66556008)(14454004)(2906002)(36756003)(6116002)(476003)(66946007)(478600001)(966005)(33656002)(1076003)(6916009)(4326008)(99286004)(25786009)(186003)(6512007)(7416002)(8936002)(71190400001)(6246003)(6486002)(71200400001)(6306002)(102836004)(52116002)(14444005)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3107;
 H:AM0PR08MB5345.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Cx0h4Sj1mVOxxQypXeuB2fm37cB+VnAfpJ1LVxO9dKLhc8bK6Oy6i5S0Pl7ZHXL4jU4kdplKCk4AufKwePV5UHc2yvUeITVPAPqwdDdM2cQNm/lYkZIk2yoIeBy3kDM6qqHBEPH7Rbovy8u44v3NST7N9A6KX5wgK6NOImWAZfufJHOghJyseHF+HfWp6qPJQioi5PRm2Wv5Zonu3vikZtYGfl4TcHIQQsaGYND8golIVcvcdHnPNW+jR4vSjpUX84FNRrcVEu15FR75cWWy0j+LWrChp9vdn6XwXH0Q9cJ48pRmHXz3GY0FpzhAA1bKjH1tokdn2GyUReBRUAoSdNN1DYRaO84hS5OzWu6MmZ50i2VtVb7Xz/NMxYrIBbAAYWdisYzja2SeNEgiS+T0RLQXk31mDv8Mn0JG5CjR4OxgnxrhqTSnUrjzz176jwQNfATAkeM+a8i3iWkbiZH70A==
Content-ID: <12FFB97736121546A6551FF5E88CB86A@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3107
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(39860400002)(136003)(189003)(199004)(5660300002)(63350400001)(54906003)(66066001)(6506007)(11346002)(2616005)(446003)(386003)(8676002)(26005)(81166006)(81156014)(316002)(7736002)(305945005)(486006)(86362001)(336012)(6862004)(76176011)(229853002)(70586007)(436003)(47776003)(14454004)(70206006)(476003)(6116002)(2906002)(36756003)(3846002)(126002)(107886003)(966005)(33656002)(1076003)(356004)(4326008)(99286004)(50466002)(25786009)(186003)(6512007)(8936002)(6246003)(6486002)(26826003)(478600001)(6306002)(2486003)(102836004)(22756006)(23676004)(14444005)(76130400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5120;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a04e7267-f1fa-4b28-b88d-08d74cdf6491
NoDisclaimer: True
X-Forefront-PRVS: 018577E36E
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gur7nSOj/lfdSc6lL9QEKyn44Y+SnjEujL1zXE772inmwAPsjRdAkkOOuLQPJ+KsqruXNn8+9T9++coGfl+/gPqXlwvFPZ7TFKqmeK2k3wXa+zgmFcW9gi/vbIjJbxwpFbSfx/XxEnty8K3NPIfIDSU6vR+378MtwQqyfuVQ/o1xMoSl/bx05yUTk8yioLzhTGr1+FY80V14SpcVkPV2SDkXm1gtlBaw5uRRRtLM4eavh5MyjdbraN1Ml6SXMoPHH7LeQSkUVcuDSCxTWAGznypw1cBonOJ0Vo8vS/yEnlZWLb3vPQFQizRhyZ1MikxVl1nZvCUjCDiPmtpSikRv3ZN4uA6/PFJp2CeWhGaQhyboWtnud7qBWmeeVM6PZZxqYTSf5UadTZ0+Lmm98GEOEGegC0yqsacbujqtHYH1Ek/SKP3xxdlxI1oVfAiIuFhormSBQ2IedhZeOxMzVpdnSA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 17:38:03.5502 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4371b3cf-1433-43ec-d01b-08d74cdf6ff5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5120
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDnq9HMgTN1zw7N0hs2bYR89lYOqhadVeEAFgPBVJPA=;
 b=Mio0krI1zDXswyNgIMoEXbAo0iCg3BX1Hf79NitJPSWsHYVLtVwtNWWn0MdxNg7Ko0iXU20GBWLe4jIi7DiNdq8KOiahZ5YZJi7Var5743GFucohaekNw3iZKhxSR3ITiBvcMWbtWxqrCakv2RftN65WOlwOXe2izBtCn9QkwGQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDnq9HMgTN1zw7N0hs2bYR89lYOqhadVeEAFgPBVJPA=;
 b=Mio0krI1zDXswyNgIMoEXbAo0iCg3BX1Hf79NitJPSWsHYVLtVwtNWWn0MdxNg7Ko0iXU20GBWLe4jIi7DiNdq8KOiahZ5YZJi7Var5743GFucohaekNw3iZKhxSR3ITiBvcMWbtWxqrCakv2RftN65WOlwOXe2izBtCn9QkwGQ=
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
Cc: Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 Alistair Strachan <astrachan@google.com>, Liam Mark <lmark@codeaurora.org>,
 lkml <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>, "Andrew F .
 Davis" <afd@ti.com>, Hridya Valsaraju <hridya@google.com>, nd <nd@arm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgMDQ6MjI6MThQTSArMDAwMCwgQXlhbiBIYWxkZXIgd3Jv
dGU6DQo+IE9uIFRodSwgU2VwIDE5LCAyMDE5IGF0IDEwOjIxOjUyUE0gKzA1MzAsIFN1bWl0IFNl
bXdhbCB3cm90ZToNCj4gPiBIZWxsbyBDaHJpc3RvcGgsIGV2ZXJ5b25lLA0KPiA+IA0KPiA+IE9u
IFNhdCwgNyBTZXAgMjAxOSBhdCAwMDoxNywgSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFy
by5vcmc+IHdyb3RlOg0KPiA+ID4NCj4gPiA+IEhlcmUgaXMgeWV0IGFub3RoZXIgcGFzcyBhdCB0
aGUgZG1hLWJ1ZiBoZWFwcyBwYXRjaHNldCBBbmRyZXcNCj4gPiA+IGFuZCBJIGhhdmUgYmVlbiB3
b3JraW5nIG9uIHdoaWNoIHRyaWVzIHRvIGRlc3RhZ2UgYSBmYWlyIGNodW5rDQo+ID4gPiBvZiBJ
T04gZnVuY3Rpb25hbGl0eS4NCj4gPiA+DQo+ID4gPiBUaGUgcGF0Y2hzZXQgaW1wbGVtZW50cyBw
ZXItaGVhcCBkZXZpY2VzIHdoaWNoIGNhbiBiZSBvcGVuZWQNCj4gPiA+IGRpcmVjdGx5IGFuZCB0
aGVuIGFuIGlvY3RsIGlzIHVzZWQgdG8gYWxsb2NhdGUgYSBkbWFidWYgZnJvbSB0aGUNCj4gPiA+
IGhlYXAuDQo+ID4gPg0KPiA+ID4gVGhlIGludGVyZmFjZSBpcyBzaW1pbGFyLCBidXQgbXVjaCBz
aW1wbGVyIHRoZW4gSU9Ocywgb25seQ0KPiA+ID4gcHJvdmlkaW5nIGFuIEFMTE9DIGlvY3RsLg0K
PiA+ID4NCj4gPiA+IEFsc28sIEkndmUgcHJvdmlkZWQgcmVsYXRpdmVseSBzaW1wbGUgc3lzdGVt
IGFuZCBjbWEgaGVhcHMuDQo+ID4gPg0KPiA+ID4gSSd2ZSBib290ZWQgYW5kIHRlc3RlZCB0aGVz
ZSBwYXRjaGVzIHdpdGggQU9TUCBvbiB0aGUgSGlLZXk5NjANCj4gPiA+IHVzaW5nIHRoZSBrZXJu
ZWwgdHJlZSBoZXJlOg0KPiA+ID4gICBodHRwczovL2dpdC5saW5hcm8ub3JnL3Blb3BsZS9qb2hu
LnN0dWx0ei9hbmRyb2lkLWRldi5naXQvbG9nLz9oPWRldi9kbWEtYnVmLWhlYXANCj4gPiA+DQo+
ID4gPiBBbmQgdGhlIHVzZXJzcGFjZSBjaGFuZ2VzIGhlcmU6DQo+ID4gPiAgIGh0dHBzOi8vYW5k
cm9pZC1yZXZpZXcuZ29vZ2xlc291cmNlLmNvbS9jL2RldmljZS9saW5hcm8vaGlrZXkvKy85MDk0
MzYNCj4gPiA+DQo+ID4gPiBDb21wYXJlZCB0byBJT04sIHRoaXMgcGF0Y2hzZXQgaXMgbWlzc2lu
ZyB0aGUgc3lzdGVtLWNvbnRpZywNCj4gPiA+IGNhcnZlb3V0IGFuZCBjaHVuayBoZWFwcywgYXMg
SSBkb24ndCBoYXZlIGEgZGV2aWNlIHRoYXQgdXNlcw0KPiA+ID4gdGhvc2UsIHNvIEknbSB1bmFi
bGUgdG8gZG8gbXVjaCB1c2VmdWwgdmFsaWRhdGlvbiB0aGVyZS4NCj4gPiA+IEFkZGl0aW9uYWxs
eSB3ZSBoYXZlIG5vIHVwc3RyZWFtIHVzZXJzIG9mIGNodW5rIG9yIGNhcnZlb3V0LA0KPiA+ID4g
YW5kIHRoZSBzeXN0ZW0tY29udGlnIGhhcyBiZWVuIGRlcHJlY2F0ZWQgaW4gdGhlIGNvbW1vbi9h
bmRvaWQtKg0KPiA+ID4ga2VybmVscywgc28gdGhpcyBzaG91bGQgYmUgb2suDQo+ID4gPg0KPiA+
ID4gSSd2ZSBhbHNvIHJlbW92ZWQgdGhlIHN0YXRzIGFjY291bnRpbmcsIHNpbmNlIGFueSBzdWNo
IGFjY291bnRpbmcNCj4gPiA+IHNob3VsZCBiZSBpbXBsZW1lbnRlZCBieSBkbWEtYnVmIGNvcmUg
b3IgdGhlIGhlYXBzIHRoZW1zZWx2ZXMuDQo+ID4gPg0KPiA+ID4gTW9zdCBvZiB0aGUgY2hhbmdl
cyBpbiB0aGlzIHJldmlzaW9uIGFyZSBhZGRkcmVzc2luZyB0aGUgbW9yZQ0KPiA+ID4gY29uY3Jl
dGUgZmVlZGJhY2sgZnJvbSBDaHJpc3RvcGggKG1hbnkgdGhhbmtzISkuIFRob3VnaCBJJ20gbm90
DQo+ID4gPiBzdXJlIGlmIHNvbWUgb2YgdGhlIGxlc3Mgc3BlY2lmaWMgZmVlZGJhY2sgd2FzIGNv
bXBsZXRlbHkgcmVzb2x2ZWQNCj4gPiA+IGluIGRpc2N1c3Npb24gbGFzdCB0aW1lIGFyb3VuZC4g
UGxlYXNlIGxldCBtZSBrbm93IQ0KPiA+IA0KPiA+IEl0IGxvb2tzIGxpa2UgbW9zdCBvZiB0aGUg
ZmVlZGJhY2sgaGFzIGJlZW4gdGFrZW4gY2FyZSBvZi4gSWYgdGhlcmUncw0KPiA+IG5vIG1vcmUg
b2JqZWN0aW9uIHRvIHRoaXMgc2VyaWVzLCBJJ2QgbGlrZSB0byBtZXJnZSBpdCBpbiBzb29uLg0K
PiA+IA0KPiA+IElmIHRoZXJlIGFyZSBhbnkgbW9yZSByZXZpZXcgY29tbWVudHMsIG1heSBJIHJl
cXVlc3QgeW91IHRvIHBsZWFzZSBwcm92aWRlIHRoZW0/DQo+IA0KPiBJIHRlc3RlZCB0aGVzZSBw
YXRjaGVzIHVzaW5nIG91ciBpbnRlcm5hbCB0ZXN0IHN1aXRlIHdpdGggQXJtLGtvbWVkYQ0KPiBk
cml2ZXIgYW5kIHRoZSBmb2xsb3dpbmcgbm9kZSBpbiBkdHMNCj4gDQo+ICAgICAgICAgcmVzZXJ2
ZWQtbWVtb3J5IHsNCj4gICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDB4Mj47DQo+
ICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwweDI+Ow0KPiAgICAgICAgICAgICAgICAg
cmFuZ2VzOw0KPiANCj4gICAgICAgICAgICAgICAgIGZyYW1lYnVmZmVyQDYwMDAwMDAwIHsNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaGFyZWQtZG1hLXBvb2wiOw0K
PiAgICAgICAgICAgICAgICAgICAgICAgICBsaW51eCxjbWEtZGVmYXVsdDsNCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgcmVnID0gPDB4MCAweDYwMDAwMDAwIDB4MCAweDgwMDAwMDA+Ow0KPiAg
ICAgICAgICAgICAgICAgfTsNCj4gICAgICAgICB9DQpBcG9sb2dpZXMgZm9yIHRoZSBjb25mdXNp
b24sIHRoaXMgZHRzIG5vZGUgaXMgaXJyZWxldmFudCBhcyBvdXIgdGVzdHMgd2VyZSB1c2luZw0K
dGhlIGNtYSBoZWFwICh2aWEgL2Rldi9kbWFfaGVhcC9yZXNlcnZlZCkuDQoNClRoYXQgcmFpc2Vz
IGEgcXVlc3Rpb24uIEhvdyBkbyB3ZSByZXByZXNlbnQgdGhlIHJlc2VydmVkLW1lbW9yeSBub2Rl
cw0KKGFzIHNob3duIGFib3ZlKSB2aWEgdGhlIGRtYS1idWYgaGVhcHMgZnJhbWV3b3JrID8NCj4g
DQo+IFRoZSB0ZXN0cyB3ZW50IGZpbmUuIE91ciB0ZXN0cyBhbGxvY2F0ZXMgZnJhbWVidWZmZXJz
IG9mIGRpZmZlcmVudA0KPiBzaXplcywgcG9zdHMgdGhlbSBvbiBzY3JlZW4gYW5kIHRoZSBkcml2
ZXIgd3JpdGVzIGJhY2sgdG8gb25lIG9mIHRoZQ0KPiBmcmFtZWJ1ZmZlcnMuIEkgaGF2ZW5vdCB0
ZXN0ZWQgZm9yIGFueSBwZXJmb3JtYW5jZSwgbGF0ZW5jeSBvcg0KPiBjYWNoZSBtYW5hZ2VtZW50
IHJlbGF0ZWQgc3R1ZmYuIFNvLCBpdCB0aGF0IGxvb2tzIGFwcHJvcHJpYXRlLCBmZWVsDQo+IGZy
ZWUgdG8gYWRkOi0NCj4gVGVzdGVkLWJ5Oi0gQXlhbiBLdW1hciBIYWxkZXIgPGF5YW4uaGFsZGVy
QGFybS5jb20+DQo+IA0KPiBBcmUgeW91IHBsYW5uaW5nIHRvIHdyaXRlIHNvbWUgaWd0IHRlc3Rz
IGZvciBpdCA/DQo+ID4gDQo+ID4gPg0KPiA+ID4gTmV3IGluIHY4Og0KPiA+ID4gKiBNYWtlIHN0
cnVjdCBkbWFfaGVhcF9vcHMgY29uc3RzIChTdWdnZXN0ZWQgYnkgQ2hyaXN0b3BoKQ0KPiA+ID4g
KiBBZGQgZmx1c2hfa2VybmVsX3ZtYXBfcmFuZ2UvaW52YWxpZGF0ZV9rZXJuZWxfdm1hcF9yYW5n
ZSBjYWxscw0KPiA+ID4gICAoc3VnZ2VzdGVkIGJ5IENocmlzdG9waCkNCj4gPiA+ICogQ29uZGVu
c2UgZG1hX2hlYXBfYnVmZmVyIGFuZCBoZWFwX2hlbHBlcl9idWZmZXIgKHN1Z2dlc3RlZCBieQ0K
PiA+ID4gICBDaHJpc3RvcGgpDQo+ID4gPiAqIEdldCByaWQgb2YgbmVlZGxlc3Mgc3RydWN0IHN5
c3RlbV9oZWFwIChzdWdnZXN0ZWQgYnkgQ2hyaXN0b3BoKQ0KPiA+ID4gKiBGaXggaW5kZW50YXRp
b24gYnkgdXNpbmcgc2hvcnRlciBhcmd1bWVudCBuYW1lcyAoc3VnZ2VzdGVkIGJ5DQo+ID4gPiAg
IENocmlzdG9waCkNCj4gPiA+ICogUmVtb3ZlIHVudXNlZCBwcml2YXRlX2ZsYWdzIHZhbHVlDQo+
ID4gPiAqIEFkZCBmb3Jnb3R0ZW4gaW5jbHVkZSBmaWxlIHRvIGZpeCBidWlsZCBpc3N1ZSBvbiB4
ODYNCj4gPiA+ICogQ2hlY2twYXRjaCB3aGl0ZXNwYWNlIGZpeHVwcw0KPiA+ID4NCj4gPiA+IFRo
b3VnaHRzIGFuZCBmZWVkYmFjayB3b3VsZCBiZSBncmVhdGx5IGFwcHJlY2lhdGVkIQ0KPiA+ID4N
Cj4gPiA+IHRoYW5rcw0KPiA+ID4gLWpvaG4NCj4gPiBCZXN0LA0KPiA+IFN1bWl0Lg0KPiA+ID4N
Cj4gPiA+IENjOiBMYXVyYSBBYmJvdHQgPGxhYmJvdHRAcmVkaGF0LmNvbT4NCj4gPiA+IENjOiBC
ZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAbGluYXJvLm9yZz4NCj4gPiA+IENj
OiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPg0KPiA+ID4gQ2M6IExpYW0g
TWFyayA8bG1hcmtAY29kZWF1cm9yYS5vcmc+DQo+ID4gPiBDYzogUHJhdGlrIFBhdGVsIDxwcmF0
aWtwQGNvZGVhdXJvcmEub3JnPg0KPiA+ID4gQ2M6IEJyaWFuIFN0YXJrZXkgPEJyaWFuLlN0YXJr
ZXlAYXJtLmNvbT4NCj4gPiA+IENjOiBWaW5jZW50IERvbm5lZm9ydCA8VmluY2VudC5Eb25uZWZv
cnRAYXJtLmNvbT4NCj4gPiA+IENjOiBTdWRpcHRvIFBhdWwgPFN1ZGlwdG8uUGF1bEBhcm0uY29t
Pg0KPiA+ID4gQ2M6IEFuZHJldyBGLiBEYXZpcyA8YWZkQHRpLmNvbT4NCj4gPiA+IENjOiBDaHJp
c3RvcGggSGVsbHdpZyA8aGNoQGluZnJhZGVhZC5vcmc+DQo+ID4gPiBDYzogQ2hlbmJvIEZlbmcg
PGZlbmdjQGdvb2dsZS5jb20+DQo+ID4gPiBDYzogQWxpc3RhaXIgU3RyYWNoYW4gPGFzdHJhY2hh
bkBnb29nbGUuY29tPg0KPiA+ID4gQ2M6IEhyaWR5YSBWYWxzYXJhanUgPGhyaWR5YUBnb29nbGUu
Y29tPg0KPiA+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiA+DQo+
ID4gPg0KPiA+ID4gQW5kcmV3IEYuIERhdmlzICgxKToNCj4gPiA+ICAgZG1hLWJ1ZjogQWRkIGRt
YS1idWYgaGVhcHMgZnJhbWV3b3JrDQo+ID4gPg0KPiA+ID4gSm9obiBTdHVsdHogKDQpOg0KPiA+
ID4gICBkbWEtYnVmOiBoZWFwczogQWRkIGhlYXAgaGVscGVycw0KPiA+ID4gICBkbWEtYnVmOiBo
ZWFwczogQWRkIHN5c3RlbSBoZWFwIHRvIGRtYWJ1ZiBoZWFwcw0KPiA+ID4gICBkbWEtYnVmOiBo
ZWFwczogQWRkIENNQSBoZWFwIHRvIGRtYWJ1ZiBoZWFwcw0KPiA+ID4gICBrc2VsZnRlc3RzOiBB
ZGQgZG1hLWhlYXAgdGVzdA0KPiA+ID4NCj4gPiA+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMTggKysNCj4gPiA+ICBkcml2ZXJzL2RtYS1idWYvS2Nv
bmZpZyAgICAgICAgICAgICAgICAgICAgICAgfCAgMTEgKw0KPiA+ID4gIGRyaXZlcnMvZG1hLWJ1
Zi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArDQo+ID4gPiAgZHJpdmVycy9k
bWEtYnVmL2RtYS1oZWFwLmMgICAgICAgICAgICAgICAgICAgIHwgMjUwICsrKysrKysrKysrKysr
KysNCj4gPiA+ICBkcml2ZXJzL2RtYS1idWYvaGVhcHMvS2NvbmZpZyAgICAgICAgICAgICAgICAg
fCAgMTQgKw0KPiA+ID4gIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9NYWtlZmlsZSAgICAgICAgICAg
ICAgICB8ICAgNCArDQo+ID4gPiAgZHJpdmVycy9kbWEtYnVmL2hlYXBzL2NtYV9oZWFwLmMgICAg
ICAgICAgICAgIHwgMTY0ICsrKysrKysrKysrDQo+ID4gPiAgZHJpdmVycy9kbWEtYnVmL2hlYXBz
L2hlYXAtaGVscGVycy5jICAgICAgICAgIHwgMjY5ICsrKysrKysrKysrKysrKysrKw0KPiA+ID4g
IGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9oZWFwLWhlbHBlcnMuaCAgICAgICAgICB8ICA1NSArKysr
DQo+ID4gPiAgZHJpdmVycy9kbWEtYnVmL2hlYXBzL3N5c3RlbV9oZWFwLmMgICAgICAgICAgIHwg
MTIyICsrKysrKysrDQo+ID4gPiAgaW5jbHVkZS9saW51eC9kbWEtaGVhcC5oICAgICAgICAgICAg
ICAgICAgICAgIHwgIDU5ICsrKysNCj4gPiA+ICBpbmNsdWRlL3VhcGkvbGludXgvZG1hLWhlYXAu
aCAgICAgICAgICAgICAgICAgfCAgNTUgKysrKw0KPiA+ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2RtYWJ1Zi1oZWFwcy9NYWtlZmlsZSB8ICAgOSArDQo+ID4gPiAgLi4uL3NlbGZ0ZXN0cy9k
bWFidWYtaGVhcHMvZG1hYnVmLWhlYXAuYyAgICAgIHwgMjMwICsrKysrKysrKysrKysrKw0KPiA+
ID4gIDE0IGZpbGVzIGNoYW5nZWQsIDEyNjIgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2RtYS1idWYvZG1hLWhlYXAuYw0KPiA+ID4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2RtYS1idWYvaGVhcHMvS2NvbmZpZw0KPiA+ID4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2RtYS1idWYvaGVhcHMvTWFrZWZpbGUNCj4gPiA+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9kbWEtYnVmL2hlYXBzL2NtYV9oZWFwLmMNCj4gPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9kbWEtYnVmL2hlYXBzL2hlYXAtaGVscGVycy5jDQo+ID4gPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9oZWFwLWhlbHBlcnMuaA0K
PiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hl
YXAuYw0KPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L2RtYS1oZWFwLmgN
Cj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS91YXBpL2xpbnV4L2RtYS1oZWFwLmgN
Cj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZG1hYnVm
LWhlYXBzL01ha2VmaWxlDQo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2RtYWJ1Zi1oZWFwcy9kbWFidWYtaGVhcC5jDQo+ID4gPg0KPiA+ID4gLS0NCj4g
PiA+IDIuMTcuMQ0KPiA+ID4NCj4gPiANCj4gPiANCj4gPiAtLSANCj4gPiBUaGFua3MgYW5kIHJl
Z2FyZHMsDQo+ID4gDQo+ID4gU3VtaXQgU2Vtd2FsDQo+ID4gTGluYXJvIENvbnN1bWVyIEdyb3Vw
IC0gS2VybmVsIFRlYW0gTGVhZA0KPiA+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3
YXJlIGZvciBBUk0gU29Dcw0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQo+ID4gZHJpLWRldmVsIG1haWxpbmcgbGlzdA0KPiA+IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0DQo+IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
