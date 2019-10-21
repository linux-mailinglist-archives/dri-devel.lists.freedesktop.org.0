Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A1BDEEA8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 16:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA726E0EB;
	Mon, 21 Oct 2019 14:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40052.outbound.protection.outlook.com [40.107.4.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9653C6E0EB
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 14:03:09 +0000 (UTC)
Received: from VI1PR08CA0124.eurprd08.prod.outlook.com (2603:10a6:800:d4::26)
 by AM7PR08MB5304.eurprd08.prod.outlook.com (2603:10a6:20b:102::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Mon, 21 Oct
 2019 14:03:05 +0000
Received: from VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::207) by VI1PR08CA0124.outlook.office365.com
 (2603:10a6:800:d4::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.21 via Frontend
 Transport; Mon, 21 Oct 2019 14:03:05 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT051.mail.protection.outlook.com (10.152.19.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.23 via Frontend Transport; Mon, 21 Oct 2019 14:03:04 +0000
Received: ("Tessian outbound e4042aced47b:v33");
 Mon, 21 Oct 2019 14:03:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7c6971fbf46c02f8
X-CR-MTA-TID: 64aa7808
Received: from 92992491f1c0.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7D6622F6-4759-4C40-8592-B400F17CA374.1; 
 Mon, 21 Oct 2019 14:02:58 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2059.outbound.protection.outlook.com [104.47.9.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 92992491f1c0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Mon, 21 Oct 2019 14:02:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JuFDmzbqMaGTbuydZmFbyueIhujbKVtdO7wHY6c7sXvv2NxRIDdmy4Pm7jyoG0vN4HphG60jyoNftcVQN/lQg1P/mlo9RGjUB/TVnhMEczgR8/szcOhoy4J2qbv2gcq14RDttWQkYQapFzc5e1xL7565fv4EAihiB3XnPXmL5DIl1gjK4Z8yXUgPaYca0WJA3dm546hoyRXe5Rx2gE9GR63erDnnNnVDS/xZo5TKJmK4vDLDNpYqz2GSGb/tLp7Oe8a8U5Tv+9D26Jvhr0GSycY3K/eGGSFLitqw1AM+ZASRxg5jd6V4lFYZgEKgxDVj2gmCJ2u7+K3SJz7JBDnyrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XlYmLm08HoM71Dq2zLhftn6+THIaEXH85ueIuTPgfo=;
 b=WwpwVlAcSot4ye35fNg5Ir5iYJ3RJ+LWlU/vnUYpIoioXyXnwhv/sQtKpC5R6/0oPL8UaZkXN4/EpNX7qiI8wKhmF9WXDth2BfAdjdU5dSZbZPAcwZMx4zy0ICvsK7uLCLd13g7TB7nUViLKQDmRzilVraDf7vs2Rzcegf+7I4c4mYc4HtiyazCTh1Rt/VpOl6KNMnz2SRA0vqah9D6iHZ7aQxWlMf+vy1jFDyFoq0V595fVy1iTG1FG3k1tIfZS4f/kWHqO1zmBGUk6dzDlgulkF7+nGg9Gnwi68tbTiFGGdazSa/TP+Saem1J1YqazjCxhHvF1wxzbbmVVneuUfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3248.eurprd08.prod.outlook.com (10.171.183.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Mon, 21 Oct 2019 14:02:56 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2367.022; Mon, 21 Oct 2019
 14:02:56 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [v2] drm/komeda: Fix typos in komeda_splitter_validate
Thread-Topic: [v2] drm/komeda: Fix typos in komeda_splitter_validate
Thread-Index: AQHVg/rzQgJg1rsyuUiz1kR3zevdn6dlKIKA
Date: Mon, 21 Oct 2019 14:02:56 +0000
Message-ID: <5882846.nLqbd4GdRz@e123338-lin>
References: <20190930122231.33029-1-mihail.atanassov@arm.com>
 <20191016082255.GA18768@jamwan02-TSP300>
In-Reply-To: <20191016082255.GA18768@jamwan02-TSP300>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.51]
x-clientproxiedby: LO2P123CA0031.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::19)
 To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2d6033a2-f584-44d8-1571-08d7562f6448
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB3248:|VI1PR08MB3248:|AM7PR08MB5304:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5304E564737B9A338C6F50458F690@AM7PR08MB5304.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 0197AFBD92
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(366004)(39860400002)(396003)(346002)(136003)(199004)(189003)(51914003)(305945005)(7736002)(6116002)(3846002)(6862004)(6246003)(4326008)(6486002)(99286004)(52116002)(71200400001)(76176011)(71190400001)(54906003)(316002)(6436002)(6512007)(9686003)(229853002)(2906002)(33716001)(25786009)(478600001)(81156014)(6636002)(81166006)(8676002)(8936002)(86362001)(446003)(14454004)(5660300002)(386003)(6506007)(102836004)(26005)(14444005)(256004)(486006)(66066001)(64756008)(66556008)(66476007)(66946007)(66446008)(11346002)(476003)(186003)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3248;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 5ygR+oVsRYUsPprnwRGdiui7iwDKYLUJikaHLpuErYHt9jH71UKRMiODd8QuzNA08qikMouFINWZeBNqhIcnzgmjQOQFGsHeYqt3ToSaVffMwtY3smsdTUecKKJ4wIj59FZKI4AddtUDewV8uX1rXn3PXWDRacs7zCZDoZLaCn+zCXh8VkkIXPJTe018FoxvRErvqNSUj41ms/F9ZVrzNmD1/+5mCBkIY9HxaRxYcSt+BsY5gMTgjMNXZnx0CSddphN4xj6HLGMGAqIDlAza5ANEqrS9Rx6PrBP9RwuNJMUIguR/BS8p1EBlBN2XxVHjDZUFlp+AeJKpbIZckqEq/yxWCKIKHxuExM7OR4bP6Bgzz49uhbfDHfpogvo4DuHVRQYdHKy6D0lXPhqIRf460/msl09AC1AK3NNfPBnbxxLJ4hC+5/WT9tRaQysFi8vA
Content-ID: <7DD74D089B872E4C8ABD08A6F5A8F12E@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3248
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(346002)(136003)(396003)(39860400002)(376002)(51914003)(199004)(189003)(6636002)(26826003)(316002)(70586007)(6486002)(50466002)(66066001)(47776003)(23726003)(86362001)(8936002)(70206006)(8746002)(3846002)(6116002)(478600001)(2906002)(11346002)(229853002)(25786009)(99286004)(14444005)(76130400001)(26005)(46406003)(6506007)(63350400001)(126002)(36906005)(33716001)(305945005)(6862004)(7736002)(54906003)(9686003)(476003)(8676002)(486006)(102836004)(14454004)(4326008)(186003)(81166006)(356004)(97756001)(81156014)(5660300002)(6246003)(6512007)(76176011)(386003)(336012)(446003)(22756006)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM7PR08MB5304;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 83be254d-2d2b-4039-0fd7-08d7562f5f71
NoDisclaimer: True
X-Forefront-PRVS: 0197AFBD92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NixB3f9lsyEik+tbqdD/ZkHPLee+EzmoWPCsPH7f6G/p5wWJNZptKiQP88f6B1MFNxYjJCtkkx5GhUhh1lSich55ms3TV8ekmkNdr/IZi4hMQ5gqMqCqPNkx4I7yTOX9kMyXRgH7mKUkaKMsCWa4OHIS3DdRfijcaVuR2a6Z1btDdR99+bbY5A/GszOIfvT+3clV4nJGHSGzOqkkQ/3CEnjgEuJ6TZDc8z1iS4PGqVGA9v9bgWoutWzXL7Wuy2CsajCjQqAXYoHRAiblJK/Y9EoNqZLpJoa3MSfXAi046DKpl/ISeeKfIW82ou0bBx3UthWWSVo7Nm+MfdA50o4LXQGj9qRq7AT+Rc16vlY3aDi3iFAE1QlyuIBEi0gFWzVxnMc6ThU5TDHATjwOD6o6PdvUFiA1z1zZTAWB2jIJ6n8=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2019 14:03:04.0920 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d6033a2-f584-44d8-1571-08d7562f6448
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5304
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XlYmLm08HoM71Dq2zLhftn6+THIaEXH85ueIuTPgfo=;
 b=U+xeAb/JzKVwF10rnEdQYVIezu6jE1WljMMi8kMZgqXhBZdUdIGOq0wGuWVxGvwWQ8jb+iG7Z68SJx0Nw7KtD0ek92EXDuBVyAlqisvUFfKJ4SQxcr1HwBpYhOsLG5MAHdt7cqD+iWTv0ZN8rKS+40gbS/u6Z7C+fSEGHKY1h7g=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XlYmLm08HoM71Dq2zLhftn6+THIaEXH85ueIuTPgfo=;
 b=U+xeAb/JzKVwF10rnEdQYVIezu6jE1WljMMi8kMZgqXhBZdUdIGOq0wGuWVxGvwWQ8jb+iG7Z68SJx0Nw7KtD0ek92EXDuBVyAlqisvUFfKJ4SQxcr1HwBpYhOsLG5MAHdt7cqD+iWTv0ZN8rKS+40gbS/u6Z7C+fSEGHKY1h7g=
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
Cc: David Airlie <airlied@linux.ie>, nd <nd@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkbmVzZGF5LCAxNiBPY3RvYmVyIDIwMTkgMDk6MjM6MDMgQlNUIGphbWVzIHFpYW4gd2Fu
ZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+IE9uIE1vbiwgU2VwIDMwLCAyMDE5IGF0
IDEyOjIzOjA3UE0gKzAwMDAsIE1paGFpbCBBdGFuYXNzb3Ygd3JvdGU6Cj4gPiBGaXggYm90aCB0
aGUgc3RyaW5nIGFuZCB0aGUgc3RydWN0IG1lbWJlciBiZWluZyBwcmludGVkLgo+ID4gCj4gPiBD
aGFuZ2VzIHNpbmNlIHYxOgo+ID4gIC0gTm93IHdpdGggYSBib251cyBncmFtbWFyIGZpeCwgdG9v
Lgo+ID4gCj4gPiBGaXhlczogMjY0Yjk0MzZkMjNiICgiZHJtL2tvbWVkYTogRW5hYmxlIHdyaXRl
YmFjayBzcGxpdCBzdXBwb3J0IikKPiA+IFNpZ25lZC1vZmYtYnk6IE1paGFpbCBBdGFuYXNzb3Yg
PG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMgfCA0ICsrLS0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlw
ZWxpbmVfc3RhdGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X3BpcGVsaW5lX3N0YXRlLmMKPiA+IGluZGV4IDk1MDIzNWFmMWU3OS4uMmI2MjRiZmUxNzUxIDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
cGlwZWxpbmVfc3RhdGUuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYwo+ID4gQEAgLTU2NCw4ICs1NjQsOCBAQCBrb21l
ZGFfc3BsaXR0ZXJfdmFsaWRhdGUoc3RydWN0IGtvbWVkYV9zcGxpdHRlciAqc3BsaXR0ZXIsCj4g
PiAgCX0KPiA+ICAKPiA+ICAJaWYgKCFpbl9yYW5nZSgmc3BsaXR0ZXItPnZzaXplLCBkZmxvdy0+
aW5faCkpIHsKPiA+IC0JCURSTV9ERUJVR19BVE9NSUMoInNwbGl0IGluX2luOiAlZCBleGNlZWQg
dGhlIGFjY2VwdGFibGUgcmFuZ2UuXG4iLAo+ID4gLQkJCQkgZGZsb3ctPmluX3cpOwo+ID4gKwkJ
RFJNX0RFQlVHX0FUT01JQygic3BsaXQgaW5faDogJWQgZXhjZWVkcyB0aGUgYWNjZXB0YWJsZSBy
YW5nZS5cbiIsCj4gPiArCQkJCSBkZmxvdy0+aW5faCk7Cj4gCj4gUmV2aWV3ZWQtYnk6IEphbWVz
IFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNv
bT4KClRoYW5rcyBmb3IgdGhlIHJldmlldywgYXBwbGllZCB0byBkcm0tbWlzYy1maXhlcyAtCjhh
ZTUwMWUyOTVjY2U5YmM2ZTBkZDgyZDUyMDRhMWQ1ZmFlZjQ0ZjguCgo+ID4gIAkJcmV0dXJuIC1F
SU5WQUw7Cj4gPiAgCX0KPiA+ICAKPiAKCgotLSAKTWloYWlsCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
