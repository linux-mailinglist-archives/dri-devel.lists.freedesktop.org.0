Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 054F184C3D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 15:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA026E6C6;
	Wed,  7 Aug 2019 13:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140047.outbound.protection.outlook.com [40.107.14.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EEC66E6C6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 13:02:08 +0000 (UTC)
Received: from VE1PR08CA0019.eurprd08.prod.outlook.com (2603:10a6:803:104::32)
 by DB6PR0801MB1847.eurprd08.prod.outlook.com (2603:10a6:4:3c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.17; Wed, 7 Aug
 2019 13:02:03 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::201) by VE1PR08CA0019.outlook.office365.com
 (2603:10a6:803:104::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.15 via Frontend
 Transport; Wed, 7 Aug 2019 13:02:03 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18 via Frontend Transport; Wed, 7 Aug 2019 13:02:02 +0000
Received: ("Tessian outbound 71602e13cd49:v26");
 Wed, 07 Aug 2019 13:02:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 96e378cc31b538be
X-CR-MTA-TID: 64aa7808
Received: from 19201584f193.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.1.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AB1F90DE-1876-4BD6-A3E4-24487EB2E126.1; 
 Wed, 07 Aug 2019 13:01:57 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 19201584f193.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Aug 2019 13:01:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WiQAfhIfs9pTahG2oLcctccLPL+9YychkYe6JWa0h2nikVHt+UFkwTaN2wkqu5Uz9O6BLUXCYgrVZ4jvrQJjgRza3XVDa6SVY9rS33JKGAQ13OPlGmVSkEZcu7MAe0ihZdXxjUbO54jA6SUJyBdI2RZws5mXxMfsoMS4Xh0M9SNvxkXVYaUJ3KFPATiRREM07v3A5D05XVFVmaGJ53N15kRaiUeuIRRJJaIH6kRYxBG+7qI/hdPb4/pC6L2FH8fMscHOZ4IyBxUaqod/Vn0l4Tpe2tsY8WQxQAffcE6ex0536ZxLriRKW9ms5K5ULfyBv9eYkx9mdNaKg1sYpDKDnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADut284OVWUEh6Izue7rL7Aiei8du+CnAdVhHUfHNdM=;
 b=EGwiBvIW8/4TqVL7HreD3R416PXDg+u9keHK7zHqFpf1seKPTj8nJVe18N8X8Y85cN/9vVTiGfERB1OhihWld1Q3cn0E2Qatrqv8NQO5jTGjCiX//Dtq9lN/LF7hXZofbZqW5CPdXGMLLktXOu6A+HBwiCZGhORQXuF0WsLe1xbsB3l9LNDtoX38eP090NAvUasz8Mt08bu6eTiYMH19pk7ADA8BHU9ViKJiV93xBg+Dg1cRl27KUgR3QMqph06lURSaABdPjGcsxGsgUQViesgLAPPpkgxI4aMy8vBI5uEkNUnJfaYkgq57t2GF/pXyPYXOYIhdb7zXlBzMp+qS4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com (52.132.212.135) by
 AM0PR08MB3364.eurprd08.prod.outlook.com (20.177.111.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Wed, 7 Aug 2019 13:01:54 +0000
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::7532:a9e4:63b6:6a55]) by AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::7532:a9e4:63b6:6a55%4]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 13:01:54 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: Brian Starkey <Brian.Starkey@arm.com>
Subject: Re: [PATCH v3] drm/crc-debugfs: Add notes about CRC<->commit
 interactions
Thread-Topic: [PATCH v3] drm/crc-debugfs: Add notes about CRC<->commit
 interactions
Thread-Index: AQHVTFT7ihsXP7Ei2UuXxQIneDOlZKbvp+eA
Date: Wed, 7 Aug 2019 13:01:54 +0000
Message-ID: <20190807130153.GA19148@arm.com>
References: <20190806124622.28399-1-brian.starkey@arm.com>
In-Reply-To: <20190806124622.28399-1-brian.starkey@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0088.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::28) To AM0PR08MB5345.eurprd08.prod.outlook.com
 (2603:10a6:208:17f::7)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.54]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: fbed1afd-df3d-44f9-5642-08d71b3770d1
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB3364; 
X-MS-TrafficTypeDiagnostic: AM0PR08MB3364:|DB6PR0801MB1847:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <DB6PR0801MB18471A2FE515E6E95F339E68E4D40@DB6PR0801MB1847.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 01221E3973
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(366004)(346002)(39860400002)(136003)(189003)(199004)(37006003)(81156014)(14444005)(446003)(478600001)(86362001)(99286004)(66556008)(6246003)(54906003)(6306002)(66476007)(6486002)(26005)(71190400001)(71200400001)(66946007)(64756008)(8936002)(81166006)(8676002)(5660300002)(14454004)(6862004)(6636002)(256004)(186003)(25786009)(229853002)(6512007)(6436002)(305945005)(7736002)(966005)(316002)(3846002)(76176011)(2906002)(1076003)(53936002)(476003)(486006)(102836004)(386003)(66446008)(68736007)(11346002)(66066001)(44832011)(36756003)(2616005)(33656002)(4326008)(52116002)(6116002)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3364;
 H:AM0PR08MB5345.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: JJ1Pq42seOHHfYl5b7kDKgmXq7LjlJHa3BmOd3F8C+GubQ6TGkQ08aLFF6pinfqaQyYCiqHrv00WpPx7iuArsMSyPgL9+lAm3biwuNgSFY/uSezXwthh3OJ+NRT12HpEEUpZ98AZZZdmwW61ffQwzFNhWrXMC7evyfMCWngMDvk7MLao9Kqtz2zhc8n961k6D70WCNzFX62fFggfDJ93UrMk3OOBNvBpjsqK1CC++12B/lBEb+5GGs0+ND23V2jko1PCTi5nFxry0G89cfa+LEFNV/WYEffYrrwSRnPTTaMRtvu7U+UW+UoaBeKXpVSy8+A+uFunwRj4ARJwjbH1HMzT3FqAFeajfhV1FRGd8GCxfTc3f7vIi/tVoTCITzfKqCmZ701ecxkaL5vGoTePn/l5tJLJi9neKwMQbHhCPb0=
Content-ID: <B5DB0A77B9F2C440AEA925901CE30C52@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3364
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(376002)(39860400002)(2980300002)(189003)(199004)(26826003)(3846002)(22756006)(23726003)(478600001)(6116002)(14444005)(305945005)(47776003)(186003)(63370400001)(63350400001)(7736002)(446003)(336012)(486006)(2616005)(26005)(476003)(11346002)(126002)(76176011)(99286004)(966005)(33656002)(14454004)(66066001)(54906003)(102836004)(6512007)(6486002)(229853002)(70586007)(2906002)(86362001)(4326008)(81156014)(81166006)(316002)(25786009)(6636002)(6246003)(107886003)(8936002)(8746002)(70206006)(8676002)(37006003)(36756003)(97756001)(1076003)(356004)(386003)(46406003)(6506007)(36906005)(50466002)(6306002)(6862004)(76130400001)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB1847;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a6dbb654-4797-4148-0aea-08d71b376bc6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB6PR0801MB1847; 
NoDisclaimer: True
X-Forefront-PRVS: 01221E3973
X-Microsoft-Antispam-Message-Info: SiWlON/Zc65dMdUaqByjHSiaNBbIa6SiLrBMdlF1ZlLMjnen/xyMgCmaEJrbWnl+Yekn0+QjtCdfHmjMLUOrD5Qt7xWTYgiM3CLKTKwJ5EdcupPXxby+CuWamFUEpgbVAiDrzfYhfz3eQIYcsPYuLC4TVa+r2aFRnUsYhSHA2RnFCZbeNab6HGKxPhrf4WwguEpJAs9vFoR1JyFFRwVmDQAS2o5OPbBMbA3Cm/RedEmHaBGliOrL2kzPs2QUUeNYfCeTu5bXtduVV6NQmDr+6Un/3Hmj2+23FLSyXCyQB80iJLpD31Vsuo1g03709V+KuM80lMvb123sX01+AOtVSnWrV84etCyqGCywhnBV86PGumfH0Mu6/6EttExZyqyP+HrU1Td9uEcfCZW/x5ZhDT1q8G9vbV3C+6n9G8j3Tf0=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2019 13:02:02.4822 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbed1afd-df3d-44f9-5642-08d71b3770d1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1847
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADut284OVWUEh6Izue7rL7Aiei8du+CnAdVhHUfHNdM=;
 b=xldBu8e+n2s2/Magqa2WoeLaSEExJBlbPGHdE3KuB3MUJF7rV5k/eIkoELkCcrdbtjA0vY/TlwfK16MV5vd+9/bjjxh9jWGrYUTTy9nLkr3eUlauscdVv22NGHMgb/YH+yPzGb2YlkcaMf4I080TMjjsgrT6ds3zuIs0Z8rpBLc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADut284OVWUEh6Izue7rL7Aiei8du+CnAdVhHUfHNdM=;
 b=xldBu8e+n2s2/Magqa2WoeLaSEExJBlbPGHdE3KuB3MUJF7rV5k/eIkoELkCcrdbtjA0vY/TlwfK16MV5vd+9/bjjxh9jWGrYUTTy9nLkr3eUlauscdVv22NGHMgb/YH+yPzGb2YlkcaMf4I080TMjjsgrT6ds3zuIs0Z8rpBLc=
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
Cc: Liviu Dudau <Liviu.Dudau@arm.com>, nd <nd@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDE6NDY6MjJQTSArMDEwMCwgQnJpYW4gU3RhcmtleSB3
cm90ZToKPiBDUkMgZ2VuZXJhdGlvbiBjYW4gYmUgaW1wYWN0ZWQgYnkgY29tbWl0cyBjb21pbmcg
ZnJvbSB1c2Vyc3BhY2UsIGFuZAo+IGVuYWJsaW5nIENSQyBnZW5lcmF0aW9uIG1heSBpdHNlbGYg
dHJpZ2dlciBhIGNvbW1pdC4gQWRkIG5vdGVzIGFib3V0Cj4gdGhpcyB0byB0aGUga2VybmVsZG9j
Lgo+IAo+IENoYW5nZXMgc2luY2UgdjE6Cj4gIC0gQ2xhcmlmaWVkIHRoYXQgYW55dGhpbmcgdGhh
dCB3b3VsZCBkaXNhYmxlIENSQ3MgY291bnRzIGFzIGEgZnVsbAo+ICAgIG1vZGVzZXQsIGFuZCBz
byB1c2Vyc3BhY2UgbmVlZHMgdG8gcmVjb25maWd1cmUgYWZ0ZXIgZnVsbCBtb2Rlc2V0cwo+IAo+
IENoYW5nZXMgc2luY2UgdjI6Cj4gIC0gQWRkIHRoZXNlIG5vdGVzCj4gIC0gUmViYXNlIG9udG8g
ZHJtLW1pc2MtbmV4dCAodHJpdmlhbCBjb25mbGljdCBpbiBjb21tZW50KQo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEJyaWFuIFN0YXJrZXkgPGJyaWFuLnN0YXJrZXlAYXJtLmNvbT4KPiBSZXZpZXdlZC1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jIHwgOSArKysrKysrKysKPiAgaW5jbHVkZS9kcm0v
ZHJtX2NydGMuaCAgICAgICAgICAgIHwgNCArKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNf
Y3JjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKPiBpbmRleCA2NjA0ZWQy
MjMxNjAuLmJlMWI3YmE5MmZmZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rl
YnVnZnNfY3JjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKPiBA
QCAtNjksNiArNjksMTUgQEAKPiAgICogaW1wbGVtZW50ICZkcm1fY3J0Y19mdW5jcy5zZXRfY3Jj
X3NvdXJjZSBhbmQgJmRybV9jcnRjX2Z1bmNzLnZlcmlmeV9jcmNfc291cmNlLgo+ICAgKiBUaGUg
ZGVidWdmcyBmaWxlcyBhcmUgYXV0b21hdGljYWxseSBzZXQgdXAgaWYgdGhvc2UgdmZ1bmNzIGFy
ZSBzZXQuIENSQyBzYW1wbGVzCj4gICAqIG5lZWQgdG8gYmUgY2FwdHVyZWQgaW4gdGhlIGRyaXZl
ciBieSBjYWxsaW5nIGRybV9jcnRjX2FkZF9jcmNfZW50cnkoKS4KPiArICogRGVwZW5kaW5nIG9u
IHRoZSBkcml2ZXIgYW5kIEhXIHJlcXVpcmVtZW50cywgJmRybV9jcnRjX2Z1bmNzLnNldF9jcmNf
c291cmNlCj4gKyAqIG1heSByZXN1bHQgaW4gYSBjb21taXQgKGV2ZW4gYSBmdWxsIG1vZGVzZXQp
Lgo+ICsgKgo+ICsgKiBDUkMgcmVzdWx0cyBtdXN0IGJlIHJlbGlhYmxlIGFjcm9zcyBub24tZnVs
bC1tb2Rlc2V0IGF0b21pYyBjb21taXRzLCBzbyBpZiBhCj4gKyAqIGNvbW1pdCB2aWEgRFJNX0lP
Q1RMX01PREVfQVRPTUlDIHdvdWxkIGRpc2FibGUgb3Igb3RoZXJ3aXNlIGludGVyZmVyZSB3aXRo
Cj4gKyAqIENSQyBnZW5lcmF0aW9uLCB0aGVuIHRoZSBkcml2ZXIgbXVzdCBtYXJrIHRoYXQgY29t
bWl0IGFzIGEgZnVsbCBtb2Rlc2V0Cj4gKyAqIChkcm1fYXRvbWljX2NydGNfbmVlZHNfbW9kZXNl
dCgpIHNob3VsZCByZXR1cm4gdHJ1ZSkuIEFzIGEgcmVzdWx0LCB0byBlbnN1cmUKPiArICogY29u
c2lzdGVudCByZXN1bHRzLCBnZW5lcmljIHVzZXJzcGFjZSBtdXN0IHJlLXNldHVwIENSQyBnZW5l
cmF0aW9uIGFmdGVyIGEKPiArICogbGVnYWN5IFNFVENSVEMgb3IgYW4gYXRvbWljIGNvbW1pdCB3
aXRoIERSTV9NT0RFX0FUT01JQ19BTExPV19NT0RFU0VULgo+ICAgKi8KPiAgCj4gIHN0YXRpYyBp
bnQgY3JjX2NvbnRyb2xfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKmRhdGEpCj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jcnRjLmggYi9pbmNsdWRlL2RybS9kcm1fY3J0Yy5o
Cj4gaW5kZXggMTI4ZDhiMjEwNjIxLi43ZDE0YzExYmRjMGEgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVk
ZS9kcm0vZHJtX2NydGMuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jcnRjLmgKPiBAQCAtNzU2
LDYgKzc1Niw5IEBAIHN0cnVjdCBkcm1fY3J0Y19mdW5jcyB7Cj4gIAkgKiBwcm92aWRlZCBmcm9t
IHRoZSBjb25maWd1cmVkIHNvdXJjZS4gRHJpdmVycyBtdXN0IGFjY2VwdCBhbiAiYXV0byIKPiAg
CSAqIHNvdXJjZSBuYW1lIHRoYXQgd2lsbCBzZWxlY3QgYSBkZWZhdWx0IHNvdXJjZSBmb3IgdGhp
cyBDUlRDLgo+ICAJICoKPiArCSAqIFRoaXMgbWF5IHRyaWdnZXIgYW4gYXRvbWljIG1vZGVzZXQg
Y29tbWl0IGlmIG5lY2Vzc2FyeSwgdG8gZW5hYmxlIENSQwo+ICsJICogZ2VuZXJhdGlvbi4KPiAr
CSAqCj4gIAkgKiBOb3RlIHRoYXQgImF1dG8iIGNhbiBkZXBlbmQgdXBvbiB0aGUgY3VycmVudCBt
b2Rlc2V0IGNvbmZpZ3VyYXRpb24sCj4gIAkgKiBlLmcuIGl0IGNvdWxkIHBpY2sgYW4gZW5jb2Rl
ciBvciBvdXRwdXQgc3BlY2lmaWMgQ1JDIHNhbXBsaW5nIHBvaW50Lgo+ICAJICoKPiBAQCAtNzY3
LDYgKzc3MCw3IEBAIHN0cnVjdCBkcm1fY3J0Y19mdW5jcyB7Cj4gIAkgKiAwIG9uIHN1Y2Nlc3Mg
b3IgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGZhaWx1cmUuCj4gIAkgKi8KPiAgCWludCAoKnNl
dF9jcmNfc291cmNlKShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIGNvbnN0IGNoYXIgKnNvdXJjZSk7
Cj4gKwo+ICAJLyoqCj4gIAkgKiBAdmVyaWZ5X2NyY19zb3VyY2U6Cj4gIAkgKgo+IC0tIAo+IDIu
MTcuMQo+IAoKUHVzaGVkIHRvIGRybS1taXNjLW5leHQuCkNvbW1pdCBpZCA6LSAxNzhlNWYzYTVi
YzFkNjdkMTI0OGE3NGMwYWJhYjQxMDQwYWJlN2M0CgotQXlhbgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
