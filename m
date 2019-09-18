Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CFBB5F0F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 10:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E97889C6C;
	Wed, 18 Sep 2019 08:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70071.outbound.protection.outlook.com [40.107.7.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E2289C6C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 08:23:45 +0000 (UTC)
Received: from VI1PR08CA0199.eurprd08.prod.outlook.com (2603:10a6:800:d2::29)
 by VE1PR08MB4670.eurprd08.prod.outlook.com (2603:10a6:802:ac::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.23; Wed, 18 Sep
 2019 08:23:42 +0000
Received: from DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::202) by VI1PR08CA0199.outlook.office365.com
 (2603:10a6:800:d2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.17 via Frontend
 Transport; Wed, 18 Sep 2019 08:23:42 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT011.mail.protection.outlook.com (10.152.20.95) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20 via Frontend Transport; Wed, 18 Sep 2019 08:23:40 +0000
Received: ("Tessian outbound 968ab6b62146:v31");
 Wed, 18 Sep 2019 08:23:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 16f3fff491149b4d
X-CR-MTA-TID: 64aa7808
Received: from eceba24666ae.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E9046880-420B-46B2-9BF4-DE19991287FC.1; 
 Wed, 18 Sep 2019 08:23:31 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2052.outbound.protection.outlook.com [104.47.10.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eceba24666ae.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 Sep 2019 08:23:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTNCJB+/f+F6gNgAuYynWkBbuLm0ISChu4FtNQYxQaLuFjiWhDtV6cOW5KZWjB/CZWeokEcr2OTWQcFy9sdqeUVaE+//8vaKpRyz/12c22ltV7hmsjWFXA8vbe6zWvhFj6zxrSFP/6lqIS6Rac7Z91hdURoi5UlaPreJpy9DDOAPgPCmTNAvnwzdmxHIx7SQHzZ+naiROzm2/AKs5GJHc6KUaerTZWzCPoV0Jue/drEJA6p9C2oWtIw/xxLVlV5jhB0HN2Yq7i9teLjjHjWNQT+yvTgIAeXJDJe8OU+Oj7yPkyRMdt3cfHd++lBKg8/du/C7tJzQDj9sG4Pkb98/pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DqFiMYBmjpxkd1u3CIiau0OWaG9keBuqDN/odWzY5c=;
 b=D2F8bLs+lVX7SqF+5P95aqlNTJv3MoxBX2qsKZFj0sprd/7egEoiHxm7AD+ICs92vrJFUExmBnU/bV4wW0aeXLVEDNgJRPnTvC7ombPOwKZYIMX6aZf5mLQsR5y3ixCQ/YufAE6GM/NA77otGH+F/61hDA+o/wvlbMdLKai91dt4e7FJ+lGXixqz86EQTuaO9txA20FB/QbRBV6ukbLNKmNq9xsPXg38D0rv/WZ257i/aK6R4nc1bGsde+9YvbsBx+hyngg4R1M61SsMee3bmInZbBPKX/vsUdSwsSfhZhtCK1H0AZy31by/kcAkLj53IS2pl6WWd9/iSyZOURhCRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5230.eurprd08.prod.outlook.com (10.255.27.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.20; Wed, 18 Sep 2019 08:23:28 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879%5]) with mapi id 15.20.2284.009; Wed, 18 Sep 2019
 08:23:28 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>, Liviu Dudau
 <Liviu.Dudau@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Jonathan Chai
 (Arm Technology China)" <Jonathan.Chai@arm.com>, "Julien Yin (Arm Technology
 China)" <Julien.Yin@arm.com>, nd <nd@arm.com>, "Lowry Li (Arm Technology
 China)" <Lowry.Li@arm.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/komeda: Remove in-code use of ifdef
Thread-Topic: [PATCH] drm/komeda: Remove in-code use of ifdef
Thread-Index: AQHVbWlTUdep0ag1GkKUK45fY3+NxacxEzeAgAAGoQA=
Date: Wed, 18 Sep 2019 08:23:28 +0000
Message-ID: <20190918082322.GA16813@jamwan02-TSP300>
References: <CAKMK7uECMr46Ag8E=eqTKdZxgt_4M42t7GEyNGv0gxpv-TL3Pg@mail.gmail.com>
 <20190917150314.20892-1-mihail.atanassov@arm.com>
 <20190918075939.GZ3958@phenom.ffwll.local>
In-Reply-To: <20190918075939.GZ3958@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0207.apcprd02.prod.outlook.com
 (2603:1096:201:20::19) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 73286b13-94b7-4b6f-2f20-08d73c1182f6
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VE1PR08MB5230; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB5230:|VE1PR08MB5230:|VE1PR08MB4670:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB46702F5FDB733DD188B130DEB38E0@VE1PR08MB4670.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3631;OLM:3631;
x-forefront-prvs: 01644DCF4A
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(396003)(346002)(366004)(376002)(136003)(39860400002)(199004)(189003)(305945005)(6246003)(8936002)(14454004)(229853002)(66556008)(81156014)(256004)(476003)(6506007)(2501003)(76176011)(446003)(81166006)(316002)(8676002)(1076003)(386003)(966005)(99286004)(33656002)(6436002)(2906002)(9686003)(33716001)(6512007)(186003)(6486002)(11346002)(3846002)(52116002)(26005)(58126008)(66946007)(64756008)(55236004)(102836004)(110136005)(86362001)(6306002)(25786009)(486006)(7736002)(71190400001)(71200400001)(5660300002)(478600001)(66066001)(2201001)(66476007)(6116002)(66446008)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5230;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: MH/ysoNtl7qmQnCcsgqlGHuoWz8pwgVyUxK+PI1qphNHJOjKBwLcMl1jjZxd6QeE5RURkSSaVrTB3qCkCJ6v/BoqeP6pJO4lwsVhbxvFasALI2hlZDKNEtETTh+uy+15rzEOhJVeDcHYgGiGbqApA46I6FoLIkHI1D1cZgcu6S52Qwk1es080BmnqNpB+wGWwCM/yYvm5i34+2OaTxyJjfQdM0/UGYIcJUazby3NYJ5RXaFCdDspMPeidv8RS9VcU1aJCWtv2FZYy/KLocOw+WlXUiOgJcP0w4EHNrLj62uLHNkRlXmlDr2+Wtf6eUMM+leT0cMJ2a+sKWC6DNE4CQqQZVEp1WWCsjDUTi3M+eiOAxSaFQw5hIdvQKXxLFWdK+n7HFaOq34ddceST2YWJu9brq6MvC2oJQvacdnI+XM=
Content-ID: <3733FE332526344DB26E4F8ABE8F68DA@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5230
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(396003)(346002)(39860400002)(136003)(376002)(40434004)(189003)(199004)(3846002)(6506007)(126002)(6512007)(186003)(966005)(6306002)(58126008)(70586007)(23726003)(9686003)(6116002)(76176011)(97756001)(2201001)(14444005)(2501003)(316002)(22756006)(33656002)(76130400001)(5024004)(7736002)(6246003)(25786009)(46406003)(99286004)(356004)(86362001)(66066001)(2906002)(33716001)(229853002)(63350400001)(47776003)(8676002)(386003)(26005)(336012)(446003)(14454004)(11346002)(70206006)(305945005)(26826003)(587094005)(8936002)(102836004)(8746002)(110136005)(486006)(81156014)(1076003)(5660300002)(50466002)(478600001)(6486002)(81166006)(476003)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4670;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 89b63ca2-aa69-4f2e-c0ea-08d73c117bcb
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VE1PR08MB4670; 
X-Forefront-PRVS: 01644DCF4A
X-Microsoft-Antispam-Message-Info: M4rI5cMOh9BAX0O7KdE0aSrnh0eCaSL0jhcSSICymh5DcSUYK8g07wT0KsL13c9Di5fGuyhUyS/Ry8tFw8xvr73TiHvGlNUPMoZ1S2tI28BxNhr+lCJYbkBriZM2BWjSc3EFf1QjVD9Yc3NJ9NVZ5Faa/REUkHoBZzw/xIYZBrSYvIWyjf0Su2H4f2nno4kdlY4+yhM8S4hAmdsYNzRSvOsHuenDPbkHwBgDqGHG7iO5qWhWGmfkxZJ+MX8qXelCg5dst/9PBOtYsUgtYSdTZ941o1UUmeg5vElqSqXLuJ3kgLeWQCefiUgt5g5wXjh55vAkptJ/J+1lsRx5Tg0mDjihtWN8QJvqgjwqhpEGyggmF2QbhxIUpDSfgNs9/8hMFLri3uKzX5pb9j9RCd5BSstT1H6tqT/DrDvYSCaoD4M=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2019 08:23:40.4936 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73286b13-94b7-4b6f-2f20-08d73c1182f6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4670
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2ZoNr+Ou/ZJOL/24jH+rFnDSrD7x8dMNOCdJ+10V6Q=;
 b=UjMlD6D3OoNonz9imPErCGI81iwVhHXc1elrTKa3MKkRcmVIoETBCKxCa2L9Mfq9A7u/vxUdcKe4aMt9yfMYFyLYoA6YKMrr+i7C/AvytRMf+tRhmkxsXBt51Z+D1dAXPZ94hUjYDTaO6dwf5/rO4rBOig0Mu46nsIbZF7A+0SM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DqFiMYBmjpxkd1u3CIiau0OWaG9keBuqDN/odWzY5c=;
 b=EEqJyMgZCdrS5HwLiwayURjBYFukqAodOPFbY7lGw9Ob1rxLkuHVOq+e6mP4BYfosFAuUJciC0zIUZzhl9jMGFhlStyf56z5egwk1S2dBIuS7AaRE9Xhr3z3asxbM0J/vL9yLwEZUonxpowrZCGa1XJeV07+TKx1UOjslkSehlU=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMDk6NTk6MzlBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIFNlcCAxNywgMjAxOSBhdCAwMzowNTowOFBNICswMDAwLCBNaWhhaWwg
QXRhbmFzc292IHdyb3RlOgo+ID4gUHJvdmlkZSBhIGR1bW15IHN0YXRpYyBpbmxpbmUgZnVuY3Rp
b24gaW4gdGhlIGhlYWRlciBpbnN0ZWFkLgo+ID4KPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+Cj4gPiBDYzogTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8TG93
cnkuTGlAYXJtLmNvbT4KPiA+IENjOiBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENo
aW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cj4gPiBGaXhlczogNGQ3NGIyNWVlMzk1ICgi
ZHJtL2tvbWVkYTogQWRkcyBlcnJvciBldmVudCBwcmludCBmdW5jdGlvbmFsaXR5IikKPiA+IFNp
Z25lZC1vZmYtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4K
Pgo+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+
CgpIaSBNaWhhaWw6CgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaCwgYW5kIEknbGwgcHVzaCBpdCB0
byBkcm0tbWlzYwoKUmV2aWV3ZWQtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kg
Q2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KClRoYW5rcwpKYW1lcwoKPiA+IC0tLQo+
ID4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oIHwgMiAr
Kwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jIHwg
MiAtLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9kZXYuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2Rldi5oCj4gPiBpbmRleCBlMjhlN2U2NTYzYWIuLjhhY2Y4YzA2MDFjYyAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaAo+ID4g
QEAgLTIyMCw2ICsyMjAsOCBAQCBzdHJ1Y3Qga29tZWRhX2RldiAqZGV2X3RvX21kZXYoc3RydWN0
IGRldmljZSAqZGV2KTsKPiA+Cj4gPiAgI2lmZGVmIENPTkZJR19EUk1fS09NRURBX0VSUk9SX1BS
SU5UCj4gPiAgdm9pZCBrb21lZGFfcHJpbnRfZXZlbnRzKHN0cnVjdCBrb21lZGFfZXZlbnRzICpl
dnRzKTsKPiA+ICsjZWxzZQo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBrb21lZGFfcHJpbnRfZXZl
bnRzKHN0cnVjdCBrb21lZGFfZXZlbnRzICpldnRzKSB7fQo+ID4gICNlbmRpZgo+ID4KPiA+ICAj
ZW5kaWYgLypfS09NRURBX0RFVl9IXyovCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYwo+ID4gaW5kZXggMThkN2UyNTIwMjI1Li5kYzg1YzA4
ZTYxNGQgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9rbXMuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfa21zLmMKPiA+IEBAIC00Nyw5ICs0Nyw3IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBr
b21lZGFfa21zX2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRhdGEpCj4gPiAgICAgbWVtc2V0
KCZldnRzLCAwLCBzaXplb2YoZXZ0cykpOwo+ID4gICAgIHN0YXR1cyA9IG1kZXYtPmZ1bmNzLT5p
cnFfaGFuZGxlcihtZGV2LCAmZXZ0cyk7Cj4gPgo+ID4gLSNpZmRlZiBDT05GSUdfRFJNX0tPTUVE
QV9FUlJPUl9QUklOVAo+ID4gICAgIGtvbWVkYV9wcmludF9ldmVudHMoJmV2dHMpOwo+ID4gLSNl
bmRpZgo+ID4KPiA+ICAgICAvKiBOb3RpZnkgdGhlIGNydGMgdG8gaGFuZGxlIHRoZSBldmVudHMg
Ki8KPiA+ICAgICBmb3IgKGkgPSAwOyBpIDwga21zLT5uX2NydGNzOyBpKyspCj4gPiAtLQo+ID4g
Mi4yMy4wCj4gPgo+Cj4gLS0KPiBEYW5pZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIElu
dGVsIENvcnBvcmF0aW9uCj4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKSU1QT1JUQU5UIE5PVElDRTog
VGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUgY29uZmlk
ZW50aWFsIGFuZCBtYXkgYWxzbyBiZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50
ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5k
IGRvIG5vdCBkaXNjbG9zZSB0aGUgY29udGVudHMgdG8gYW55IG90aGVyIHBlcnNvbiwgdXNlIGl0
IGZvciBhbnkgcHVycG9zZSwgb3Igc3RvcmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24gaW4gYW55
IG1lZGl1bS4gVGhhbmsgeW91LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
