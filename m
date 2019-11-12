Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3CEF99D4
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 20:36:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0A16E405;
	Tue, 12 Nov 2019 19:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770059.outbound.protection.outlook.com [40.107.77.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FED6E0C1;
 Tue, 12 Nov 2019 19:35:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OsBKFD+sAy3bPvVqvkolxyVuIa/v+Eyhe6Aort0fSC2FZhjFWPeKfN1/EqOSMwRtwIIGicNT0+3HBY8/kKJwHhtCGAn3UgnheqSmfDzhG1NI9Gd1nVYkBedPZEM4RPyPOQtJQsSw2XvBa4ZaymLvdz5hXwSyw0TxMHhdTOU72gcoG0z0rGmPBgW0QJTy0wo04TC5LpzHRVWHjdstFsp5vEOSvLnz0H93VkG3Uv53//TKiBhLhyobwBdzsUGCmt5ksbpVoIrzv7bFJxJtVC+idRqOJt9j6o68HsMeuHELwLw0QaCmBbKganxAmzD69vSbJAF+045SaddTwqpKOMStbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqsVVvCVkMF0yLSlwjPK1g1jT+fROvxco5phdwiToNg=;
 b=of/ZCuA7HEdbUKkjWJ8aiImdNlJrsTP2pLtB2qxOyQD8qKPoopfOUgve3a2uL9GuqXAV2vzl1nikjhSabFyDZ4MMb9n3/cSNja4U3V6sLfsa9MjIek3x6unxzK7NDA1cl4xf1ldd5zXcac7qxN2TOBLwGDcwkZOC6memMGDgWY86Bj91wQc4xJc0PomnmuEGemN2dW0F+AuVeVpmB8BcajN6a906mAmTkZLmuVULCqeedSVu63/h1SVeTTUvw9c+st4mG29fwAI27DyckZpE4a7VmwBJeeK8aL/qWdpzoYJpFZmUM8SWKXfPDX3MpBrvZnZSXaw45PaM9xLJwSPW+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR12MB1813.namprd12.prod.outlook.com (10.175.80.21) by
 CY4PR12MB1574.namprd12.prod.outlook.com (10.172.71.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Tue, 12 Nov 2019 19:35:53 +0000
Received: from CY4PR12MB1813.namprd12.prod.outlook.com
 ([fe80::dc23:193b:9619:a4fc]) by CY4PR12MB1813.namprd12.prod.outlook.com
 ([fe80::dc23:193b:9619:a4fc%4]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 19:35:53 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Bjorn Helgaas <helgaas@kernel.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH V3 0/3] drm: replace magic numbers
Thread-Topic: [PATCH V3 0/3] drm: replace magic numbers
Thread-Index: AQHVmX+P/VesZSUYzEukXJ1kWVAn66eH7YsQ
Date: Tue, 12 Nov 2019 19:35:53 +0000
Message-ID: <CY4PR12MB1813200B2297DB19D1921A83F7770@CY4PR12MB1813.namprd12.prod.outlook.com>
References: <20191112173503.176611-1-helgaas@kernel.org>
In-Reply-To: <20191112173503.176611-1-helgaas@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.59.120]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 57f4b58d-d386-477a-6321-08d767a78825
x-ms-traffictypediagnostic: CY4PR12MB1574:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB157403C28F16D633DC229680F7770@CY4PR12MB1574.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(13464003)(189003)(199004)(8676002)(86362001)(8936002)(76176011)(2906002)(81156014)(26005)(81166006)(446003)(11346002)(33656002)(6506007)(7696005)(55016002)(14454004)(71200400001)(71190400001)(53546011)(478600001)(66946007)(52536014)(6306002)(64756008)(99286004)(6436002)(966005)(229853002)(316002)(66476007)(102836004)(74316002)(66556008)(66446008)(76116006)(7736002)(305945005)(186003)(110136005)(486006)(256004)(25786009)(66066001)(4326008)(6246003)(54906003)(476003)(3846002)(6116002)(7416002)(5660300002)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1574;
 H:CY4PR12MB1813.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VnAj99oyUDxsqzuximnex1DOwRtnhr0DnvGyVjv2GfQYwKzwFxKeHnhU99mzNMqIWiO4S518vwwqrVy/TbaA9pN++8HhIQs/uyHqI4J+T+6b3cKAgYvkuG1TwgX/slGfiwWOk0D88xQzZFGv2UV9XJh6dWmRW+5YpKMiRFxiWvxD4eVzH9ynPuNtcas45iJs5x4InobTRk1nuwxyJNUj8A0wWGqJ/iBq8Xo4ISi2bsIgGtphqS8fcD4QbL9xdyEEO0mNMoZBjOA584id1xGzRXWCye84FOCsswkt2IJSkRqmhXUqW7Firxu9H0MCNL6amGaiaJym5WPU60tPWdvyKaacFGQ9aHAoAHGrv5f65zEbH+uCepQrATZintw8u6/Abh3jW202KNU/ffL5e2MiUfKp5AkNILgWsxm6inSKfHd1AKKoLOloQy+EnNMlltHL6nQacp4uY/H/hqFBaKBeEl6VMw2MzqfYim2LfuoKdoI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f4b58d-d386-477a-6321-08d767a78825
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 19:35:53.5886 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EF79sfQIdifUxVp9sJ6Oyvq0McWDGq9wqqe9FuIfa9hZtBVWU7+gAcA3Sh1qTNZ1CFI7HKyq3JtfwOig9SEaag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1574
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqsVVvCVkMF0yLSlwjPK1g1jT+fROvxco5phdwiToNg=;
 b=G6YWJ97RYWLnwxVSygSW/H5IXcN70QKa0+15nDpqmr/W+0gS473YhHuGfIStdqWY0FXO+fT6watyvTev6vudUS9YF/1XawzNRZSN41qhqefMjvObHdCeSMEeVU1Ij7EV3vOT1sKNRU0MP4iI+DDEXtGou6px4P7gXcrTYn2irzM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
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
Cc: Frederick Lawler <fred@fredlawl.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gQmpvcm4gSGVsZ2Fh
cw0KPiBTZW50OiBUdWVzZGF5LCBOb3ZlbWJlciAxMiwgMjAxOSAxMjozNSBQTQ0KPiBUbzogRGV1
Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgS29lbmlnLCBDaHJp
c3RpYW4NCj4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IFpob3UsIERhdmlkKENodW5NaW5n
KQ0KPiA8RGF2aWQxLlpob3VAYW1kLmNvbT47IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5p
ZT47IERhbmllbCBWZXR0ZXINCj4gPGRhbmllbEBmZndsbC5jaD4NCj4gQ2M6IEZyZWRlcmljayBM
YXdsZXIgPGZyZWRAZnJlZGxhd2wuY29tPjsgbGludXgtcGNpQHZnZXIua2VybmVsLm9yZzsNCj4g
TWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD47IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsgQmpvcm4gSGVsZ2Fhcw0KPiA8YmhlbGdhYXNAZ29vZ2xlLmNv
bT47IElsaWEgTWlya2luIDxpbWlya2luQGFsdW0ubWl0LmVkdT4NCj4gU3ViamVjdDogW1BBVENI
IFYzIDAvM10gZHJtOiByZXBsYWNlIG1hZ2ljIG51bWJlcnMNCj4gDQo+IEZyb206IEJqb3JuIEhl
bGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+DQo+IA0KPiBhbWRncHUgYW5kIHJhZGVvbiBkbyBh
IGJpdCBvZiBtdWNraW5nIHdpdGggdGhlIFBDSWUgTGluayBDb250cm9sIDIgcmVnaXN0ZXIsDQo+
IHNvbWUgb2YgaXQgdXNpbmcgaGFyZC1jb2RlZCBtYWdpYyBudW1iZXJzLiAgVGhlIGlkZWEgaGVy
ZSBpcyB0byByZXBsYWNlDQo+IHRob3NlIHdpdGggI2RlZmluZXMuDQo+IA0KPiBTaW5jZSB2MjoN
Cj4gICAtIEZpeCBhIGdwdV9jZmcyIGNhc2UgaW4gYW1kZ3B1L3NpLmMgdGhhdCBJIGhhZCBtaXNz
ZWQNCj4gICAtIFNlcGFyYXRlIG91dCB0aGUgZnVuY3Rpb25hbCBjaGFuZ2VzIGZvciBiZXR0ZXIg
YmlzZWN0aW9uICh0aGFua3MsDQo+ICAgICBNaWNoZWwhKQ0KPiAgIC0gQWRkICNkZWZpbmVzIGlu
IGEgcGF0Y2ggYnkgdGhlbXNlbHZlcyAoc28gYSBHUFUgcmV2ZXJ0IHdvdWxkbid0IGJyZWFrDQo+
ICAgICBvdGhlciBwb3RlbnRpYWwgdXNlcnMpDQo+ICAgLSBTcXVhc2ggYWxsIHRoZSBtYWdpYyBu
dW1iZXIgLT4gI2RlZmluZSBjaGFuZ2VzIGludG8gb25lIHBhdGNoDQo+IA0KPiBTaW5jZSB2MToN
Cj4gICAtIEFkZCBteSBzaWduZWQtb2ZmLWJ5IGFuZCBBbGV4J3MgcmV2aWV3ZWQtYnkuDQo+IA0K
DQpTZXJpZXMgaXM6DQpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPg0KDQpJJ20gaGFwcHkgdG8gaGF2ZSBpdCBnbyB0aHJvdWdoIHdoYXRldmVyIHRy
ZWUgaXMgZWFzaWVzdCBmb3IgeW91Lg0KDQpUaGFua3MsDQoNCkFsZXgNCg0KPiBCam9ybiBIZWxn
YWFzICgzKToNCj4gICBQQ0k6IEFkZCAjZGVmaW5lcyBmb3IgRW50ZXIgQ29tcGxpYW5jZSwgVHJh
bnNtaXQgTWFyZ2luDQo+ICAgZHJtOiBjb3JyZWN0IFRyYW5zbWl0IE1hcmdpbiBtYXNrcw0KPiAg
IGRybTogcmVwbGFjZSBudW1iZXJzIHdpdGggUENJX0VYUF9MTktDVEwyIGRlZmluaXRpb25zDQo+
IA0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvY2lrLmMgfCAyMiArKysrKysrKysrKysr
Ky0tLS0tLS0tDQo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NpLmMgIHwgMjIgKysrKysr
KysrKysrKystLS0tLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuYyAgICAgfCAy
MiArKysrKysrKysrKysrKy0tLS0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmMg
ICAgICB8IDIyICsrKysrKysrKysrKysrLS0tLS0tLS0NCj4gIGluY2x1ZGUvdWFwaS9saW51eC9w
Y2lfcmVncy5oICAgIHwgIDIgKysNCj4gIDUgZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygr
KSwgMzIgZGVsZXRpb25zKC0pDQo+IA0KPiAtLQ0KPiAyLjI0LjAucmMxLjM2My5nYjFiY2NkM2Uz
ZC1nb29nDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
