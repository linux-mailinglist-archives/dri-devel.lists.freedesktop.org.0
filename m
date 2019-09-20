Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7312B988A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 22:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3A16E086;
	Fri, 20 Sep 2019 20:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810092.outbound.protection.outlook.com [40.107.81.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AF86FD76
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 17:26:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BlkolfShCnEQzKoxQfF8GKSaeAX13I69OhudIeKg8grvopULB7zCNyszh4sMs2dwVHaKRFQssjqApY/1mF1ajjbW0IuNaReOYWTrtBjDOmyofmFdptQNcaaEMYeG4rMwnDlc8tfD+tmDpUMXI9tGaBzultRCLhRriw6ZDCk+B5WjIKQdf5zS06Ui9FJCZg2u/9/BU4u5Jx+W6aPuLzA0a2Ndr1/bqeV/AO8rCUUlmwZd5KWtJl/oa7j0iLwRWkYhfvWfuSffNwftEoSTY3T65ThI7QNeiAk4PCDT1V+WGGABbwf2btaZCFqbJms1/9g1kRK/N0mryb+f9wMvK3Wx7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EFcmQ8IUBybKR5hnXw4zUD4HdvGEBJTLEnWdGcE3P+8=;
 b=alJotAfZMxJUyGu5oYwwQuv7Q9uWzld7i+x4KESQYWdjpIW/v5oiGasKqzj2ThpCehey4BkyJ5UfbGOTPv9NYOvZ7Islkef0+oZLWoobGGPfFjaPvkO11RUJYrCwfVC8XYUqQP2sMVj3zaKUlXWBMtUsWJCKqBiW28C4DyWezkX1U9sbJtdDFJ+o0YGQDlxkWdXQsMPZexyX3Cp1B9W4Lu+8/aERx7+P3TF1y/+uMJw+pBDEfVwCbqJYILizY+ty4JAv1kpCcZPJJbx/1W6juVCrJcHSCRe0Z9w+0of/oXFX2OgvCqT3+NGZn+AXKlPweJ+QLhGe2xLMyr/UJRik5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
Received: from DM5PR21MB0137.namprd21.prod.outlook.com (10.173.173.12) by
 DM5PR21MB0858.namprd21.prod.outlook.com (10.173.172.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.3; Fri, 20 Sep 2019 17:26:34 +0000
Received: from DM5PR21MB0137.namprd21.prod.outlook.com
 ([fe80::7d6d:e809:21df:d028]) by DM5PR21MB0137.namprd21.prod.outlook.com
 ([fe80::7d6d:e809:21df:d028%9]) with mapi id 15.20.2284.023; Fri, 20 Sep 2019
 17:26:34 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: Michael Kelley <mikelley@microsoft.com>, Wei Hu <weh@microsoft.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>, "shc_work@mail.ru"
 <shc_work@mail.ru>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "baijiaju1990@gmail.com" <baijiaju1990@gmail.com>, "info@metux.net"
 <info@metux.net>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "sashal@kernel.org" <sashal@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Haiyang Zhang
 <haiyangz@microsoft.com>, KY Srinivasan <kys@microsoft.com>, Dexuan Cui
 <decui@microsoft.com>
Subject: RE: [PATHC v6] video: hyperv: hyperv_fb: Support deferred IO for
 Hyper-V frame buffer driver
Thread-Topic: [PATHC v6] video: hyperv: hyperv_fb: Support deferred IO for
 Hyper-V frame buffer driver
Thread-Index: AQHVbebF21J2EyXx3k2x6FCXKaeI5qcx+W9wgALZkLA=
Date: Fri, 20 Sep 2019 17:26:34 +0000
Message-ID: <DM5PR21MB01375E8543451D4550D622CDD7880@DM5PR21MB0137.namprd21.prod.outlook.com>
References: <20190918060227.6834-1-weh@microsoft.com>
 <DM5PR21MB0137DA408FE59E8C1171CFFCD78E0@DM5PR21MB0137.namprd21.prod.outlook.com>
In-Reply-To: <DM5PR21MB0137DA408FE59E8C1171CFFCD78E0@DM5PR21MB0137.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=mikelley@ntdev.microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-09-18T21:48:02.5575555Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=30212914-bdb7-4059-a1ca-460e579deda0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
x-originating-ip: [24.22.167.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e5ece68-03e5-4a04-ea33-08d73defaf91
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR21MB0858:|DM5PR21MB0858:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR21MB08582D5883C8DE1609469383D7880@DM5PR21MB0858.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0166B75B74
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(136003)(396003)(39860400002)(346002)(366004)(199004)(189003)(256004)(81156014)(8990500004)(10090500001)(476003)(5660300002)(11346002)(76176011)(102836004)(86362001)(229853002)(446003)(76116006)(486006)(1250700005)(9686003)(2201001)(14444005)(7696005)(55016002)(6116002)(8936002)(3846002)(26005)(316002)(6506007)(7736002)(2501003)(1511001)(22452003)(81166006)(110136005)(66476007)(71200400001)(186003)(66946007)(6436002)(10290500003)(33656002)(66066001)(305945005)(99286004)(66556008)(64756008)(66446008)(6246003)(52536014)(74316002)(8676002)(6636002)(14454004)(2906002)(478600001)(7416002)(71190400001)(25786009)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR21MB0858;
 H:DM5PR21MB0137.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JcdFOBpnXBl93NcNr7qhAjfDrgDbNq/i6Fs9LGr+twOrJPzWW++YMSjjdty6Rwpd4zaHx41HIu8DktNMFyu2o+y2/kLA7g92OJxuEYl1KdiQIUVk7FgOs2B7Z4T4yKBQOjHkV0L1RgDhb0vvQX8xHXkXiB5wSZDSQj+kgP5aJKVA8OR2I1B7MCpmElENsAg5/LXFuart30SE0JWSEGqL7zzHu0ZSQLxUraXnuXTDYW9Px3Rrxwt0LL6aYGoj5hpJtcaxtYX3cY4QkN0Qy2z2veTiHzZ7DA4D/PFN2yhEvUlOk2EZXIHwMTQ0W2ryg6ednsJrckS9e/WPwns3y/Bp5MOsaGSPayfwgKkNhAS1uSsCRCVwhPxyelAYgJTdmYV/eIboEELXVi/G3JXtEC3ph7FqOF06o8ACDxGVk6wjmWQ=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e5ece68-03e5-4a04-ea33-08d73defaf91
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2019 17:26:34.7308 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uwzcxjS8E4opD86Gkr7v5C5Yc18zXPffXsXwdZuv8E5gLJcYKljJG268Q7i5aAXByViKkGxPn8XQSYwWoNob4FVoJmkhNQoKtbAv/wCfMsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR21MB0858
X-Mailman-Approved-At: Fri, 20 Sep 2019 20:39:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EFcmQ8IUBybKR5hnXw4zUD4HdvGEBJTLEnWdGcE3P+8=;
 b=Kzs9Ikh9tElb6lXc5ttvUP4j78tn/CivZcOZ/GfSIXT1Y0qP8W5aQWx+kklgH23YG5SEuoIGvkTyt6wiGOPT7GqhCPINwW1B2J+chOWD+OiSio3sj/R95bbZVMjpOSvR7G3UxrQNd4W8rr7XS+lC0tE3pPBTtRWyYIwtK8NhNOM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mikelley@microsoft.com; 
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

RnJvbTogTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+ICBTZW50OiBXZWRu
ZXNkYXksIFNlcHRlbWJlciAxOCwgMjAxOSAyOjQ4IFBNCj4gPgo+ID4gV2l0aG91dCBkZWZlcnJl
ZCBJTyBzdXBwb3J0LCBoeXBlcnZfZmIgZHJpdmVyIGluZm9ybXMgdGhlIGhvc3QgdG8gcmVmcmVz
aAo+ID4gdGhlIGVudGlyZSBndWVzdCBmcmFtZSBidWZmZXIgYXQgZml4ZWQgcmF0ZSwgZS5nLiBh
dCAyMEh6LCBubyBtYXR0ZXIgdGhlcmUKPiA+IGlzIHNjcmVlbiB1cGRhdGUgb3Igbm90LiBUaGlz
IHBhdGNoIHN1cHBvcnRzIGRlZmVycmVkIElPIGZvciBzY3JlZW5zIGluCj4gPiBncmFwaGljcyBt
b2RlIGFuZCBhbHNvIGVuYWJsZXMgdGhlIGZyYW1lIGJ1ZmZlciBvbi1kZW1hbmQgcmVmcmVzaC4g
VGhlCj4gPiBoaWdoZXN0IHJlZnJlc2ggcmF0ZSBpcyBzdGlsbCBzZXQgYXQgMjBIei4KPiA+Cj4g
PiBDdXJyZW50bHkgSHlwZXItViBvbmx5IHRha2VzIGEgcGh5c2ljYWwgYWRkcmVzcyBmcm9tIGd1
ZXN0IGFzIHRoZSBzdGFydGluZwo+ID4gYWRkcmVzcyBvZiBmcmFtZSBidWZmZXIuIFRoaXMgaW1w
bGllcyB0aGUgZ3Vlc3QgbXVzdCBhbGxvY2F0ZSBjb250aWd1b3VzCj4gPiBwaHlzaWNhbCBtZW1v
cnkgZm9yIGZyYW1lIGJ1ZmZlci4gSW4gYWRkaXRpb24sIEh5cGVyLVYgR2VuIDIgVk1zIG9ubHkK
PiA+IGFjY2VwdCBhZGRyZXNzIGZyb20gTU1JTyByZWdpb24gYXMgZnJhbWUgYnVmZmVyIGFkZHJl
c3MuIER1ZSB0byB0aGVzZQo+ID4gbGltaXRhdGlvbnMgb24gSHlwZXItViBob3N0LCB3ZSBrZWVw
IGEgc2hhZG93IGNvcHkgb2YgZnJhbWUgYnVmZmVyCj4gPiBpbiB0aGUgZ3Vlc3QuIFRoaXMgbWVh
bnMgb25lIG1vcmUgY29weSBvZiB0aGUgZGlydHkgcmVjdGFuZ2xlIGluc2lkZQo+ID4gZ3Vlc3Qg
d2hlbiBkb2luZyB0aGUgb24tZGVtYW5kIHJlZnJlc2guIFRoaXMgY2FuIGJlIG9wdGltaXplZCBp
biB0aGUKPiA+IGZ1dHVyZSB3aXRoIGhlbHAgZnJvbSBob3N0LiBGb3Igbm93IHRoZSBob3N0IHBl
cmZvcm1hbmNlIGdhaW4gZnJvbSBkZWZlcnJlZAo+ID4gSU8gb3V0d2VpZ2hzIHRoZSBzaGFkb3cg
Y29weSBpbXBhY3QgaW4gdGhlIGd1ZXN0Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBIdSA8
d2VoQG1pY3Jvc29mdC5jb20+CgpTYXNoYSAtLSB0aGlzIHBhdGNoIGFuZCBvbmUgb3RoZXIgZnJv
bSBXZWkgSHUgZm9yIHRoZSBIeXBlci1WIGZyYW1lIGJ1ZmZlcgpkcml2ZXIgc2hvdWxkIGJlIHJl
YWR5LiAgQm90aCBwYXRjaGVzIGFmZmVjdCBvbmx5IHRoZSBIeXBlci1WIGZyYW1lIGJ1ZmZlcgpk
cml2ZXIgc28gY2FuIGdvIHRocm91Z2ggdGhlIEh5cGVyLVYgdHJlZS4gIENhbiB5b3UgcGljayB0
aGVzZSB1cD8gIFRoeC4KCk1pY2hhZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
