Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D227DA82
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 13:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571E76E52A;
	Thu,  1 Aug 2019 11:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80050.outbound.protection.outlook.com [40.107.8.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CA06E52A
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 11:42:02 +0000 (UTC)
Received: from VI1PR0802CA0041.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::27) by VI1PR0801MB1854.eurprd08.prod.outlook.com
 (2603:10a6:800:5c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.14; Thu, 1 Aug
 2019 11:41:59 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::201) by VI1PR0802CA0041.outlook.office365.com
 (2603:10a6:800:a9::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.13 via Frontend
 Transport; Thu, 1 Aug 2019 11:41:59 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 1 Aug 2019 11:41:57 +0000
Received: ("Tessian outbound a1fd2c3cfdb0:v26");
 Thu, 01 Aug 2019 11:41:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2087885553f9ea2a
X-CR-MTA-TID: 64aa7808
Received: from a1e287e72254.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.12.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AC517810-F38E-4E09-904F-4EE015B1EF56.1; 
 Thu, 01 Aug 2019 11:41:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a1e287e72254.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Aug 2019 11:41:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXxuAYYFooO+JgLRMBAsvKM0+D6Q7goe1PvNmtsC1SEWGTcmZ1v1dIq2nRrspV/u2aLxJvP7klMWetGUXvX8JoiZq9CRiej9JS8OWNXFSD6sRj6W2VuR8wf8ckSU0iUIx36gBqRPzIaDGGtMgG0Y9UtUI7y61S6K5D1yv+hZmeJDIMkmIsgudJdvYTpPAA+RbkjOv7zS8v+Ueis7wLBJ0OxiWGUf6fzomBs8LOq3vKamZY2B0zCHL5/piMwq+PIT5o5+y/iN66lzxQGTOdDbkU1V+ZvA5AdRejHNAMyQfnd1r34X0VxvcG34kieLaNLpNPSa5luFVKgyCJvolRph5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0b+S9qYQTbP1s2mYHBU6SJAuDJ2QkOty6DqIaFJLGE=;
 b=Psntw/WOxhtq6NyI3sVKQ6CYtg5mxB/tnVWkU0DSz76nEuJgk5B3sEEowKIFW7Lovib7NJm7aZB7+N4adaeIB7t5dV8jaCu4IDt0Ih3izJj9PRbQnc1Z6Vuc4B9t0naWpHQmKaWz7piJoMUJRxoJQ+J5TnKmV/pQqMmTLm+CJPIhHPNDPYToSUurneodfA7scjwJ0fwThWD1O8wy3/ZLqVDl6xyEzp+ZytmKm9vPD7qEXEvsHH2eE9atdXyW9V3PEQT4GjcqfjfVC6nzYoNNgUV6ndMTc9ltVvur5WtoOI8s+bxniyOVnRKj5aZ8jL234B63/GWsBoacPEgKvG4ZYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from AM7PR08MB5477.eurprd08.prod.outlook.com (10.141.174.204) by
 AM7PR08MB5511.eurprd08.prod.outlook.com (10.141.175.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.15; Thu, 1 Aug 2019 11:41:45 +0000
Received: from AM7PR08MB5477.eurprd08.prod.outlook.com
 ([fe80::a8b8:cc18:ded9:6fdb]) by AM7PR08MB5477.eurprd08.prod.outlook.com
 ([fe80::a8b8:cc18:ded9:6fdb%3]) with mapi id 15.20.2136.010; Thu, 1 Aug 2019
 11:41:45 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH] drm/komeda: Initialize and enable output polling on Komeda
Thread-Topic: [PATCH] drm/komeda: Initialize and enable output polling on
 Komeda
Thread-Index: AQHVQ4gxcUI2LA7y70qnz7F7goWSO6bc4ViAgAlTsoA=
Date: Thu, 1 Aug 2019 11:41:45 +0000
Message-ID: <20190801114127.GA14596@lowry.li@arm.com>
References: <1564128018-22921-1-git-send-email-lowry.li@arm.com>
 <20190726131532.GP15612@e110455-lin.cambridge.arm.com>
In-Reply-To: <20190726131532.GP15612@e110455-lin.cambridge.arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.5.21 (2010-09-15)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0P153CA0041.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::29) To AM7PR08MB5477.eurprd08.prod.outlook.com
 (2603:10a6:20b:10f::12)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b1d20a43-6cc8-4f19-84f6-08d716754259
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM7PR08MB5511; 
X-MS-TrafficTypeDiagnostic: AM7PR08MB5511:|VI1PR0801MB1854:
X-Microsoft-Antispam-PRVS: <VI1PR0801MB185485787736DFE9BA7FFED19FDE0@VI1PR0801MB1854.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4714;OLM:4714;
x-forefront-prvs: 01165471DB
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(366004)(346002)(39860400002)(136003)(189003)(199004)(305945005)(7736002)(66946007)(66476007)(66556008)(66446008)(64756008)(8676002)(4326008)(229853002)(68736007)(6486002)(6636002)(6436002)(26005)(186003)(33656002)(81156014)(81166006)(8936002)(1076003)(58126008)(316002)(54906003)(6246003)(36756003)(76176011)(14454004)(386003)(256004)(5024004)(71200400001)(5660300002)(478600001)(55236004)(52116002)(99286004)(66066001)(102836004)(476003)(2906002)(3846002)(6116002)(6506007)(11346002)(61793004)(9686003)(6512007)(53936002)(446003)(486006)(6862004)(86362001)(25786009)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM7PR08MB5511;
 H:AM7PR08MB5477.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 9tMglYq5F5zs8bm03/6YRzOOPM2yjVci5wijeQqSY++J+l0E+BJiy5or6DZuebG7OY56x10ve4GbHqAfovcz/weoTJTK/NijYJ5z0i//JzYaK9UwPWyGsNzW+ExDjDPh26rR7hUWEKIAAns+tw4jkOCni/PV17aTQ8HYDLyYTQqvjtHxSXwHZUsJ+rYiRmm8yzgJVhESauxZ7k+s2vQ2f2tMdfil8akBJAZ5sVmV88Cr59mM+tFQg/HIftT0O+4LM0jBbkq82PK0k9XVrfFzxo3OqX65ONNd5GvkaRQq5uNGWrU3x4QSIGKS8/BkOP2j0jEEuLhUiFGXpDzXmmmR43ItZmj6Mu98UiWFwbHqbVkH9U1ppT4sf62XzC6pdZsspuPqIotNC9MTKkFhHQAq9rsdBmDNo6d9D76za8LzlGQ=
Content-ID: <743D0859C30B8F49B9ADA79692FB5911@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5511
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(2980300002)(199004)(189003)(7736002)(126002)(66066001)(476003)(6116002)(3846002)(33656002)(25786009)(63370400001)(26826003)(63350400001)(6636002)(336012)(446003)(478600001)(6862004)(76130400001)(99286004)(8676002)(8936002)(70206006)(23676004)(2486003)(305945005)(436003)(5660300002)(6246003)(81166006)(186003)(86362001)(11346002)(81156014)(1076003)(486006)(5024004)(36906005)(54906003)(102836004)(22756006)(26005)(356004)(9686003)(386003)(61793004)(58126008)(6512007)(316002)(14454004)(70586007)(6506007)(4326008)(6486002)(229853002)(50466002)(36756003)(2906002)(47776003)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0801MB1854;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: b67b3323-9009-48d5-9d4a-08d716753ab9
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(710020)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR0801MB1854; 
NoDisclaimer: True
X-Forefront-PRVS: 01165471DB
X-Microsoft-Antispam-Message-Info: Goh/Y+f5JkVi8xvwdM1EsLzFWI30m1MP1FuYtSsG+C8cqwOrjaLBBAGOs7pXvHKG/Do5oVkwZCGyVHnY9SvwBRqaykb65Bu8zb3tKxJU12CuB6zPEA8zZXe6ZKN9TUnfBOaq6n1elX8HcVUiDzNs1+pJMamlhWFwrQv4O69NPnzkFdM+Hqzy67GncqlIIRW51yHso6GhGZGuKEwSaP9elp+lkyC3mayPo+1juDxjTP3Wiw0tbZwUsqEXukChu+r7yLyoFdHVA61keU70bXFE0m6RdUSfirdcvmc6AbAsiDTKnfet1cEE2vOI9Q//4amm/q9+8HjHDStyRncqFk3jxGCnUv9KnxfxfI34962fmCJjcRRy2Q1sFJ6rxAqjLslKNlIcStpcsd/1U2FXdlfAXeksPbQdk6sRvHGOtjj7dRg=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2019 11:41:57.5621 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d20a43-6cc8-4f19-84f6-08d716754259
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1854
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0b+S9qYQTbP1s2mYHBU6SJAuDJ2QkOty6DqIaFJLGE=;
 b=jggzSRXClZevr5HA37kAbtk/9UNvyvYSJ17Db02bN2Slv4b4/balK/p1oGqvLe3ktLNqX2MgsuamV9IbBYUKU2FkpITViMDdQ2+8y6eGV0Jm61bjDiUhqy/l1tESzP59udjRAJEL0STN/vuZm8bwa1ZMw6I6TVNc3VW5ozR4tFQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0b+S9qYQTbP1s2mYHBU6SJAuDJ2QkOty6DqIaFJLGE=;
 b=jggzSRXClZevr5HA37kAbtk/9UNvyvYSJ17Db02bN2Slv4b4/balK/p1oGqvLe3ktLNqX2MgsuamV9IbBYUKU2FkpITViMDdQ2+8y6eGV0Jm61bjDiUhqy/l1tESzP59udjRAJEL0STN/vuZm8bwa1ZMw6I6TVNc3VW5ozR4tFQ=
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
Cc: nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGl2aXUsDQoNCk9uIEZyaSwgSnVsIDI2LCAyMDE5IGF0IDAxOjE1OjMzUE0gKzAwMDAsIExp
dml1IER1ZGF1IHdyb3RlOg0KPiBPbiBGcmksIEp1bCAyNiwgMjAxOSBhdCAwODowMDoyOUFNICsw
MDAwLCBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOg0KPiA+IEluaXRpYWxp
emUgYW5kIGVuYWJsZSBvdXRwdXQgcG9sbGluZyBvbiBLb21lZGEuDQo+ID4gDQo+ID4gU2lnbmVk
LW9mZi1ieTogTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8bG93cnkubGlAYXJtLmNv
bT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfa21zLmMgfCA0ICsrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0K
PiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2ttcy5jDQo+ID4gaW5kZXggMTQ2MmJhYy4uMjZmMjkxOSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jDQo+ID4gQEAgLTE1
LDYgKzE1LDcgQEANCj4gPiAgI2luY2x1ZGUgPGRybS9kcm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBl
ci5oPg0KPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9pcnEuaD4NCj4gPiAgI2luY2x1ZGUgPGRybS9k
cm1fdmJsYW5rLmg+DQo+ID4gKyNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPg0KPiA+
ICANCj4gPiAgI2luY2x1ZGUgImtvbWVkYV9kZXYuaCINCj4gPiAgI2luY2x1ZGUgImtvbWVkYV9m
cmFtZWJ1ZmZlci5oIg0KPiA+IEBAIC0zMzEsNiArMzMyLDggQEAgc3RydWN0IGtvbWVkYV9rbXNf
ZGV2ICprb21lZGFfa21zX2F0dGFjaChzdHJ1Y3Qga29tZWRhX2RldiAqbWRldikNCj4gPiAgCWlm
IChlcnIpDQo+ID4gIAkJZ290byB1bmluc3RhbGxfaXJxOw0KPiA+ICANCj4gPiArCWRybV9rbXNf
aGVscGVyX3BvbGxfaW5pdChkcm0pOw0KPiANCj4gTW9zdCBvZiB0aGUgZHJpdmVycyBjYWxsIHRo
aXMgYmVmb3JlIHJlZ2lzdGVyaW5nIHRoZSBkcml2ZXIuIEJ1dCB0aGlzIGlzIGFsbA0KPiBtb290
IGJlY2F1c2UgSSBjYW4ndCBhcHBseSB0aGUgcGF0Y2ggb24gdG9wIG9mIGRybS1taXNjLW5leHQs
IHNvIG5vdCBoYXZpbmcNCj4gZnVsbCBjb250ZXh0IG9mIHdoYXQga29tZWRhX2ttc19hdHRhY2gg
bG9va3MgbGlrZSBpbiB5b3VyIHRyZWUuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IExpdml1DQo+
IA0KWWVzLCB3aWxsIHJlZmluZSB0aGlzIGFuZCByZWJhc2UgdGhlIGNvZGUuIFRoYW5rcyBhIGxv
dC4NCg0KQmVzdCByZWdhcmRzLA0KTG93cnkNCj4gPiArDQo+ID4gIAlyZXR1cm4ga21zOw0KPiA+
ICANCj4gPiAgdW5pbnN0YWxsX2lycToNCj4gPiBAQCAtMzQ4LDYgKzM1MSw3IEBAIHZvaWQga29t
ZWRhX2ttc19kZXRhY2goc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprbXMpDQo+ID4gIAlzdHJ1Y3Qg
ZHJtX2RldmljZSAqZHJtID0gJmttcy0+YmFzZTsNCj4gPiAgCXN0cnVjdCBrb21lZGFfZGV2ICpt
ZGV2ID0gZHJtLT5kZXZfcHJpdmF0ZTsNCj4gPiAgDQo+ID4gKwlkcm1fa21zX2hlbHBlcl9wb2xs
X2ZpbmkoZHJtKTsNCj4gPiAgCW1kZXYtPmZ1bmNzLT5kaXNhYmxlX2lycShtZGV2KTsNCj4gPiAg
CWRybV9kZXZfdW5yZWdpc3Rlcihkcm0pOw0KPiA+ICAJZHJtX2lycV91bmluc3RhbGwoZHJtKTsN
Cj4gPiAtLSANCj4gPiAxLjkuMQ0KPiA+IA0KPiANCj4gLS0gDQo+ID09PT09PT09PT09PT09PT09
PT09DQo+IHwgSSB3b3VsZCBsaWtlIHRvIHwNCj4gfCBmaXggdGhlIHdvcmxkLCAgfA0KPiB8IGJ1
dCB0aGV5J3JlIG5vdCB8DQo+IHwgZ2l2aW5nIG1lIHRoZSAgIHwNCj4gIFwgc291cmNlIGNvZGUh
ICAvDQo+ICAgLS0tLS0tLS0tLS0tLS0tDQo+ICAgICDCr1xfKOODhClfL8KvDQoNCi0tIA0KUmVn
YXJkcywNCkxvd3J5DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
