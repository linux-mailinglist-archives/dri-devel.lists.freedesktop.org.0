Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8136AD9709
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 18:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F30F6E9A2;
	Wed, 16 Oct 2019 16:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50060.outbound.protection.outlook.com [40.107.5.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485FA6E9A2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 16:22:21 +0000 (UTC)
Received: from VI1PR08CA0263.eurprd08.prod.outlook.com (2603:10a6:803:dc::36)
 by AM6PR08MB4626.eurprd08.prod.outlook.com (2603:10a6:20b:c3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Wed, 16 Oct
 2019 16:22:17 +0000
Received: from DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::204) by VI1PR08CA0263.outlook.office365.com
 (2603:10a6:803:dc::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 16 Oct 2019 16:22:16 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT057.mail.protection.outlook.com (10.152.20.235) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Wed, 16 Oct 2019 16:22:15 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Wed, 16 Oct 2019 16:22:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dea8a41f654d0657
X-CR-MTA-TID: 64aa7808
Received: from 19d2d4a07253.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 94619A02-F8EF-4356-82CD-17337E33A3C5.1; 
 Wed, 16 Oct 2019 16:22:10 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 19d2d4a07253.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Oct 2019 16:22:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUK6cBXUzubK2gKO7ycUM0MKVx/74tRDV5lagyAswI6YXo+9RPAKI/iV2CFDqTW2aqggolIoI2j0vexBhVYbGm4D9pf17we0IVUpK5X+ss3aSK6zJFDu4fy1aTRAVhRHp46NZ9fQGOBsPzoEVYAZPacg7RcSgWXSdzBphqRz+DVa+48xfHvfT+bLI4LxNJDtHhS4FzvfQbfwmGsC00GnNUBkZ8i1c5RwURzOzEg2GlMCDgvGDug5NwlUddpx/JRWfjapzGv/AECWJYWVBhethBmQxfSuC5UCX/0VrzdBBBueSEf5qX6XE1UkzXFrfvFFRB5zoRJkSHp+YJ/3/dr/8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwAVU8DMBRXoCxI4Y5ThhDt7ZZgwbBWLo+ACfp2m2GE=;
 b=ICoybZbMW8R8ia/+RweapZIdZQcEW8t5SNgiwtMMgJiRF96n6+z9TvlVqLhuEz8a32cm/SaOI/fo3zt1L2W9mDo+Ct5Ts8SoalebXwU0jInoH++YaK/SJ/Wlj+GRYMGpnzNitSvFSFc1drpeWv1cSDGPs+uVflUDJbDaLwiT/2741Xukc1ZT0WZbLFAmaw4NaPl19j968L74yc+vRnn62ZszN2BRXKclNPx8umH9rv0GAKJpJR64/oXvDVczEwRmNP/AeMAoZrMdbT9kMBssMCoIVAKJ8ed0T5EZtrH9P0fKL+0zAOUpFF4wKRF74XdyukSBYpiwEmv7dioS8XLgLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB3877.eurprd08.prod.outlook.com (20.178.89.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 16 Oct 2019 16:22:08 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a%5]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 16:22:08 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [RFC,3/3] drm/komeda: Allow non-component drm_bridge only
 endpoints
Thread-Topic: [RFC,3/3] drm/komeda: Allow non-component drm_bridge only
 endpoints
Thread-Index: AQHVhDme1+iX/Utgt0y74txJGijIlKddc0AA
Date: Wed, 16 Oct 2019 16:22:07 +0000
Message-ID: <20191016162206.u2yo37rtqwou4oep@DESKTOP-E1NTVVP.localdomain>
References: <20191004143418.53039-4-mihail.atanassov@arm.com>
 <20191009055407.GA3082@jamwan02-TSP300> <5390495.Gzyn2rW8Nj@e123338-lin>
In-Reply-To: <5390495.Gzyn2rW8Nj@e123338-lin>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.55]
x-clientproxiedby: AM4PR08CA0077.eurprd08.prod.outlook.com
 (2603:10a6:205:2::48) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: cdcce6b4-39b6-4b11-39d4-08d752550214
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM6PR08MB3877:|AM6PR08MB3877:|AM6PR08MB4626:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB462600D328E3C976980EF681F0920@AM6PR08MB4626.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0192E812EC
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(189003)(199004)(8936002)(66446008)(71190400001)(14454004)(256004)(6436002)(6116002)(71200400001)(3846002)(186003)(86362001)(102836004)(81156014)(81166006)(8676002)(66946007)(478600001)(5024004)(6246003)(66066001)(6486002)(9686003)(64756008)(66556008)(66476007)(6862004)(6512007)(229853002)(316002)(99286004)(52116002)(4326008)(7736002)(76176011)(5660300002)(386003)(305945005)(26005)(44832011)(476003)(11346002)(6636002)(2906002)(6506007)(446003)(58126008)(1076003)(54906003)(25786009)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3877;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: rbND41QvIK+LVw6GvQYKy1/yY3STh9OqbjdrXzjE3FyS5QhmNwz/o//72+Rkm8hW0V0MlWYgJ/SB8K4XLvY6qYkhNSFhA1DouXYsBWJMNC0RwD5mUPgGQe691t1jUVIV0uzmJsDHm7bxvzenF0C8dW930CDUzLbXNClk2TU2UhW8VB2YAo3LyVlR6wq9eUNWRzOI/AuHLFyRCnskegJ7d2Ukh7BsnequGgIXuQ3bePpIfK8rI+X99t6qQ/vXhRJRMKAtESxecTB0K5k5TjfmSGGKrcZj8onDPHzMJtgf4K3eWrAjT2j0ejHI+HGlbXdZ58YAGZncb6+ixCkuqsiD/sA+b8o+OvuHZJoOR+DANVrtJJ+mDI85+E4eK32ZcswDzuPB7FlR2qWlmcmdRGGe+lQJ2jt+OTlOC0OPqy5+gU0=
Content-ID: <FBEBC93168CBA34FAB6A62F3A77C54FC@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3877
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(199004)(189003)(186003)(11346002)(6506007)(26005)(7736002)(336012)(356004)(23726003)(26826003)(8676002)(3846002)(478600001)(6116002)(126002)(486006)(14454004)(5024004)(476003)(76176011)(8936002)(81156014)(97756001)(8746002)(81166006)(446003)(386003)(99286004)(6636002)(63350400001)(25786009)(102836004)(305945005)(2906002)(50466002)(4326008)(5660300002)(66066001)(70206006)(6512007)(70586007)(86362001)(47776003)(22756006)(1076003)(9686003)(107886003)(316002)(6246003)(229853002)(6862004)(58126008)(6486002)(46406003)(76130400001)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4626;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3f12aae1-6b2f-473b-569f-08d75254fd5f
NoDisclaimer: True
X-Forefront-PRVS: 0192E812EC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jF/ZDkiQvEX7gig/2YsKQ1GvJIn8TPpnjd91HjdWKLWG3/yGb8KOatnsFJEIhq9GWlBZrL3aWwVD4wOOcmSJ9gCedUoatVYznG//vu/nKV5HqQwUjl1sq5k81zOEG5PK/KUx7a9adiG45PwV3dYhSNk8BCUCkoO7xpK3/Hgbz4p2RxQREr/RYhGrTepwCHwoz0vnCU0kz2VAsjVG1FTjA3jlsYZyQuOW2OzoxFvIg9fmI78Au0qSeCVCRx4IxMKtOEYcGCZ+vRwJFmRkeDOBUORTbbWO/08G28HjuwN838WW+B4uEolCMIONVUSIcqCp98JWpxhaCvfMhINhFEksV8dw3Tx82qCs8m0yTrbNILzjGEYYoUchNMTEcBv9l5SW+YpAxsJMNcyROQGryPGCMgMim4SA1TykeCLdfcEOlYc=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2019 16:22:15.6301 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdcce6b4-39b6-4b11-39d4-08d752550214
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4626
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwAVU8DMBRXoCxI4Y5ThhDt7ZZgwbBWLo+ACfp2m2GE=;
 b=Q0YNch8zhNJveZ53+6eveRcqBvh13eVzLRZnZ3hwG81JyLLZSnDognk7AxkVJaC9rz+4XpXv7i1DNAXi5WB7zOa4HN2aouoTjMKiHboljdidZN9dutbFvs6groHRu5ifZEKscjrvtbDXFd0Az+X3djw4rqa0CBjqTbEul1oMsmQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwAVU8DMBRXoCxI4Y5ThhDt7ZZgwbBWLo+ACfp2m2GE=;
 b=Q0YNch8zhNJveZ53+6eveRcqBvh13eVzLRZnZ3hwG81JyLLZSnDognk7AxkVJaC9rz+4XpXv7i1DNAXi5WB7zOa4HN2aouoTjMKiHboljdidZN9dutbFvs6groHRu5ifZEKscjrvtbDXFd0Az+X3djw4rqa0CBjqTbEul1oMsmQ=
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
 Russell King <linux@armlinux.org.uk>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 nd <nd@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBXZWQsIE9jdCAxNiwgMjAxOSBhdCAwMzo1MTozOVBNICswMDAwLCBNaWhhaWwgQXRh
bmFzc292IHdyb3RlOgo+IEhpIEphbWVzLAo+IAo+IE9uIFdlZG5lc2RheSwgOSBPY3RvYmVyIDIw
MTkgMDY6NTQ6MTUgQlNUIGphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdy
b3RlOgo+ID4gT24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMDI6MzQ6NDJQTSArMDAwMCwgTWloYWls
IEF0YW5hc3NvdiB3cm90ZToKPiA+ID4gVG8gc3VwcG9ydCB0cmFuc21pdHRlcnMgb3RoZXIgdGhh
biB0aGUgdGRhOTk4eCwgd2UgbmVlZCB0byBhbGxvdwo+ID4gPiBub24tY29tcG9uZW50IGZyYW1l
d29yayBicmlkZ2VzIHRvIGJlIGF0dGFjaGVkIHRvIGEgZHVtbXkgZHJtX2VuY29kZXIgaW4KPiA+
ID4gb3VyIGRyaXZlci4KPiA+ID4gCj4gPiA+IEZvciB0aGUgZXhpc3Rpbmcgc3VwcG9ydGVkIGVu
Y29kZXIgKHRkYTk5OHgpLCBrZWVwIHRoZSBiZWhhdmlvdXIgYXMtaXMsCj4gPiA+IHNpbmNlIHRo
ZXJlJ3Mgbm8gd2F5IHRvIHVuYmluZCBpZiBhIGRybV9icmlkZ2UgbW9kdWxlIGdvZXMgYXdheSB1
bmRlcgo+ID4gPiBvdXIgZmVldC4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1paGFpbCBB
dGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICAuLi4v
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oICAgfCAgIDUgKwo+ID4gPiAg
Li4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kcnYuYyAgIHwgIDU4ICsrKysr
Ky0tCj4gPiA+ICAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jICAg
fCAxMzMgKysrKysrKysrKysrKysrKystCj4gPiA+ICAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2ttcy5oICAgfCAgIDUgKwo+ID4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAxODcg
aW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBbc25pcF0KPiA+ID4g
IAo+ID4gPiArc3RhdGljIHZvaWQga29tZWRhX2VuY29kZXJfZGVzdHJveShzdHJ1Y3QgZHJtX2Vu
Y29kZXIgKmVuY29kZXIpCj4gPiA+ICt7Cj4gPiA+ICsJZHJtX2VuY29kZXJfY2xlYW51cChlbmNv
ZGVyKTsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZW5j
b2Rlcl9mdW5jcyBrb21lZGFfZHVtbXlfZW5jX2Z1bmNzID0gewo+ID4gPiArCS5kZXN0cm95ID0g
a29tZWRhX2VuY29kZXJfZGVzdHJveSwKPiA+ID4gK307Cj4gPiA+ICsKPiA+ID4gK2Jvb2wga29t
ZWRhX3JlbW90ZV9kZXZpY2VfaXNfY29tcG9uZW50KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbG9jYWws
Cj4gPiA+ICsJCQkJICAgICAgIHUzMiBwb3J0LCB1MzIgZW5kcG9pbnQpCj4gPiA+ICt7Cj4gPiA+
ICsJc3RydWN0IGRldmljZV9ub2RlICpyZW1vdGU7Cj4gPiA+ICsJY2hhciBjb25zdCAqIGNvbnN0
IGNvbXBvbmVudF9kZXZpY2VzW10gPSB7Cj4gPiA+ICsJCSJueHAsdGRhOTk4eCIsCj4gPiAKPiA+
IEkgcmVhbGx5IGRvbid0IHRoaW5rIHB1dCB0aGlzIGR1bW15X2VuY29kZXIgaW50byBrb21lZGEg
aXMgYSBnb29kCj4gPiBpZGVhLgo+ID4gCj4gPiBBbmQgSSBzdWdnZXN0IHRvIHNlcGVyYXRlIHRo
aXMgZHVtbXlfZW5jb2RlciB0byBhIGluZGl2aWR1YWwgbW9kdWxlCj4gPiB3aGljaCB3aWxsIGJ1
aWxkIHRoZSBkcm1fcmlkZ2UgdG8gYSBzdGFuZGFyZCBkcm0gZW5jb2RlciBhbmQgY29tcG9uZW50
Cj4gPiBiYXNlZCBtb2R1bGUsIHdoaWNoIHdpbGwgYmUgZW5hYmxlIGJ5IERULCB0b3RhbGx5IHRy
YW5zcGFyZW50IGZvciBrb21lZGEuCj4gPiAKPiA+IEJUVzoKPiA+IEkgcmVhbGx5IGRvbid0IGxp
a2Ugc3VjaCBsb2dpYzogZGlzdGluZ3VzaCB0aGUgU1lTVEVNIGNvbmZpZ3VyYXRpb24KPiA+IGJ5
IGNoZWNrIHRoZSBjb25uZWN0ZWQgZGV2aWNlIG5hbWUsIGl0J3MgaGFyZCB0byBtYWludGFpbiBh
bmQgY29kZQo+ID4gc2hhcmluZywgYW5kIHRoYXQncyB3aHkgTk9XIHdlIGhhdmUgdGhlIGRldmlj
ZS10cmVlLgoKSXQncyBub3QgaWRlYWwgdG8gaGF2ZSBzdWNoIHNwZWNpYWwgY2FzZXMsIGZvciBz
dXJlLiBIb3dldmVyLCBJIGRvbid0CnNlZSB0aGlzIGFwcHJvYWNoIGNhdXNpbmcgdXMgYW55IGlz
c3Vlcy4gdGRhOTk4eCByZWFsbHkgaXMgInNwZWNpYWwiLAphbmQgYXMgZmFyIGFzIEkgY2FuIHNl
ZSB0aGUgY29kZSBoZXJlIHNjYWxlcyB0byBvdGhlciBkZXZpY2VzIHByZXR0eQplYXNpbHkuCgo+
IAo+ICtDYyBCcmlhbgo+IAo+IEkgZGlkbid0IHRoaW5rIERUIGlzIHRoZSByaWdodCBwbGFjZSBm
b3IgcHNldWRvLWRldmljZXMuCgpJIGFncmVlLiBEVCBzaG91bGQgcmVwcmVzZW50IHRoZSBIVywg
bm90IHRoZSBzdHJ1Y3R1cmUgb2YgdGhlCmxpbnV4IGtlcm5lbCBzdWJzeXN0ZW0uCgo+IFRoZSB0
ZGE5OTh4Cj4gbG9va3MgdG8gYmUgaW4gYSBzbWFsbCBncm91cCBvZiBkcml2ZXJzIHRoYXQgY29u
dGFpbiBlbmNvZGVyICsKPiBicmlkZ2UgKyBjb25uZWN0b3I7IG15IGltcHJlc3Npb24gb2YgdGhl
IGN1cnJlbnQgc3RhdGUgb2YgYWZmYWlycyBpcwo+IHRoYXQgdGhlIGRybV9lbmNvZGVyIHRlbmRz
IHRvIGxpdmUgd2hlcmUgdGhlIENSVEMgcHJvdmlkZXIgaXMgcmF0aGVyCj4gdGhhbiByZXByZXNl
bnRpbmcgYSBIVyBlbnRpdHkgKGhlbmNlIHdoeSBkcm1fYnJpZGdlIGJhc2VkIGRyaXZlcnMKPiBl
eGlzdCBpbiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlKS4gU2VlIHRoZSBvdmVydmlldyBET0MgY29t
bWVudCBpbgo+IGRybV9lbmNvZGVyLmMgKCJkcml2ZXJzIGFyZSBmcmVlIHRvIHVzZSBbZHJtX2Vu
Y29kZXJdIGhvd2V2ZXIgdGhleQo+IHdpc2giKS4gSSBtYXkgYmUgY29tcGxldGVseSB3cm9uZywg
c28gd291bGQgYXBwcmVjaWF0ZSBzb21lCj4gY29udGV4dCBhbmQgY29tbWVudCBmcm9tIG90aGVy
cyBvbiB0aGUgQ2MgbGlzdC4KPiAKPiBJbiBhbnkgY2FzZSwgY29udmVydGluZyBhIGRvLW5vdGhp
bmcgZHVtbXkgZW5jb2RlciBpbnRvIGl0cyBvd24KPiBjb21wb25lbnQtbW9kdWxlIHdpbGwgYWRk
IGEgbG90IG1vcmUgYmxvYXQgY29tcGFyZWQgdG8gdGhlIGN1cnJlbnQKPiB+MTAgU0xvQyBpbXBs
ZW1lbnRhdGlvbiBvZiB0aGUgZHJtX2VuY29kZXIuIHByb2JlL3JlbW92ZS9iaW5kL3VuYmluZCwK
PiBhIGZldyBleHRyYSBzdHJ1Y3RzIGhlcmUgYW5kIHRoZXJlLCB5ZXQgYW5vdGhlciBvYmplY3Qg
ZmlsZSwgRFQKPiBiaW5kaW5ncywgZG9jcyBmb3IgdGhlIHNhbWUsIGFuZCBtYWludGFpbmluZyBh
bGwgb2YgdGhhdD8gSXQncyBhIGhhcmQKPiBzZWxsIGZvciBtZS4gSSdkIHByZWZlciBpZiB3ZSB3
ZW50IGFoZWFkIHdpdGggdGhlIGNvZGUgYXMtaXMgYW5kIGZpeCBpdAo+IHVwIGxhdGVyIGlmIGl0
IHJlYWxseSBwcm92ZXMgdW53aWVsZHkgYW5kIHRvbyBoYXJkIHRvIG1haW50YWluLiBDb3VsZAo+
IHRoaXMgcGF0Y2ggYmUgaW1wcm92ZWQ/IFN1cmUhIENhbiB3ZSBpbXByb3ZlIGl0IGluIGZvbGxv
dy11cCB3b3JrCj4gdGhvdWdoLCBhcyBJIHRoaW5rIHRoaXMgaXMgdmFsdWFibGUgZW5vdWdoIG9u
IGl0cyBvd24gd2l0aG91dCBhbnkgbWFqb3IKPiBkcmF3YmFja3M/Cj4gCgpFdmVuIGlmIHdlIGlt
cGxlbWVudGVkIGEgc2VwYXJhdGUgY29tcG9uZW50IGVuY29kZXIsIGFzIGZhciBhcyBJIGNhbgp0
ZWxsIHRoZXJlJ3Mgbm8gd2F5IHRvIHVzZSBpdCB3aXRob3V0IGVpdGhlcjoKCmEpIHN0aWNraW5n
IGl0IGluIERUCmIpIGludm9raW5nIGl0IGZyb20ga29tZWRhIGJhc2VkIG9uIGEgIm9mX2Rldmlj
ZV9pc19jb21wYXRpYmxlIiBsaXN0CgpJTU8gYSkgaXNuJ3QgYWNjZXB0YWJsZSwgYW5kIGIpIGRv
ZXNuJ3QgaGF2ZSBhbnkgYWR2YW50YWdlcyBvdmVyIHRoaXMKYXBwcm9hY2guCgo+IEFzIHBlciBt
eSBjb3ZlciBsZXR0ZXIsIGluIGFuIGlkZWFsIHdvcmxkIHdlJ2QgaGF2ZSB0aGUgZW5jb2RlciBs
b2NhbGx5Cj4gYW5kIGRvIGRybV9icmlkZ2VfYXR0YWNoKCkgZXZlbiBmb3IgdGRhOTk4eCwgYnV0
IHRoZSBsaWZldGltZSBpc3N1ZXMKPiBhcm91bmQgYnJpZGdlcyBpbnNpZGUgbW9kdWxlcyBtZWFu
IHRoYXQgZG9pbmcgdGhhdCBub3cgaXMgYSBiaXQgb2YgYQo+IHN0ZXAgYmFjayBmb3IgdGhpcyBz
cGVjaWZpYyBjYXNlLgo+IAoKWWVhaCwgbXkgZmVlbGluZyBpcyB0aGF0IGJlaW5nIGFibGUgdG8g
a2VlcCB0ZGE5OTh4IGFzIGEgY29tcG9uZW50Cihmb3IgdGhlIHN1cGVyaW9yIGJpbmQvdW5iaW5k
IGJlaGF2aW91cikgaXMgd29ydGggdGhlIHNsaWdodCB1Z2xpbmVzcywKYXQgbGVhc3QgdW50aWwg
YnJpZGdlcyBnZXQgdGhlIHNhbWUgZnVuY3Rpb25hbGl0eS4KCklmIEphbWVzIGlzIHN0cm9uZ2x5
IGFnYWluc3QgbWVyZ2luZyB0aGlzLCBtYXliZSB3ZSBqdXN0IHN3YXAKd2hvbGVzYWxlIHRvIGJy
aWRnZT8gQnV0IGZvciBtZSwgdGhlIHByYWdtYXRpYyBhcHByb2FjaCB3b3VsZCBiZSB0aGlzCnN0
b3AtZ2FwLgoKQ2hlZXJzLAotQnJpYW4KCj4gPiAKPiA+IFRoYW5rcwo+ID4gSmFtZXMKPiA+IAo+
ID4gPiBbc25pcF0KPiA+IAo+IAo+IC0tIAo+IE1paGFpbAo+IAo+IAo+IApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
