Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF3D76EB0
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 18:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4541F6EDC6;
	Fri, 26 Jul 2019 16:14:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760053.outbound.protection.outlook.com [40.107.76.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E912E6EDC6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 16:14:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTE4KskQuqmj0Cp4mw545O1rRDsJ9FP72/q3xZ1VBii2k6d/MMj6GvviyoAOWedhQ/v/4Lc6Ow83gxrRQ/aS87KKBNZ2SucgVBE+sB9kOyBmMV6+rcunfMdBNdpGfPLTEPIUKTTbhQYU5602Mp5M9pJ2ZbVMPognpfFUPj5PGO27lBXuUt2iWMkHaiVQC6LNzxUfq1yH5QzeC19R7yW6+dUXlSxb3zJ25cbPFGkeosIZJAqvorgGfclBAfy7vxI56ZCmC3PHiartbHL3WGuQ9oj6SzUKHlBZb/gHmRUs/swOmgxaK1urgTpeZLD3qtAunyeGSKjcQ/lv4bt9vz62Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjAF7WFI9NGq7rS4SmkTOMdyLhaMRr31sdIHTGBPFsA=;
 b=RTTjoRdnm1sy09Bi2CEkna8aVXFmG+/lWZ+fTo1KQoft5YbCh532AgiqI4iLX5NuRljbPNY2sjRM77Gkvm/zhw7YROJrvfMU16/bieJHvlA/puLNG+Qsh8NyhyB2lq6FU0+LY+NJHD4lpy5pkAkPou+16E+UUYPa0Qj88Xdgi6glkpWZNxgAkXCQxGNOjbgTQILlp/vJtuWJj6iKpRemyT66PobmD7tAj/9F1oM7YiG8Jaka84rmu6tPt56/+bq6fNRZ9QAeLvirN5AzeJTxT55Sh/GuFuy1/3opRb1Rqyn19MxJH381G1G/aj3vXw1E5IwC0KH3a+wOXV9/1HTFLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3189.namprd12.prod.outlook.com (20.179.92.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Fri, 26 Jul 2019 16:14:41 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::8581:1f0c:2002:db97]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::8581:1f0c:2002:db97%7]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 16:14:41 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Zhang, Dingchen (David)" <Dingchen.Zhang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm: Set crc->opened to false before setting crc
 source to NULL.
Thread-Topic: [PATCH v2] drm: Set crc->opened to false before setting crc
 source to NULL.
Thread-Index: AQHVQ8wDLGjdjDLmv0WrqEddW6H0vabdEtkA
Date: Fri, 26 Jul 2019 16:14:41 +0000
Message-ID: <ac7e9ac8-5c76-6580-d919-d4def8b2a90b@amd.com>
References: <20190726160219.8021-1-dingchen.zhang@amd.com>
In-Reply-To: <20190726160219.8021-1-dingchen.zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::33)
 To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8352aee9-29fc-47e1-3b52-08d711e45d4a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3189; 
x-ms-traffictypediagnostic: BYAPR12MB3189:
x-microsoft-antispam-prvs: <BYAPR12MB3189D6B2D1B7A89EC3844709ECC00@BYAPR12MB3189.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(396003)(136003)(346002)(39860400002)(199004)(189003)(6436002)(36756003)(478600001)(6246003)(25786009)(186003)(4326008)(2906002)(76176011)(316002)(53936002)(8936002)(26005)(2501003)(386003)(5660300002)(66476007)(53546011)(66556008)(6506007)(64756008)(102836004)(81166006)(68736007)(81156014)(99286004)(8676002)(14454004)(71190400001)(66946007)(486006)(476003)(31686004)(54906003)(110136005)(229853002)(256004)(11346002)(7736002)(66066001)(446003)(2616005)(305945005)(6512007)(86362001)(3846002)(6486002)(14444005)(52116002)(6116002)(71200400001)(31696002)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3189;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lSgSwKg9dkRpL9KegHCwbTcpbkDyb6svsDJ8ZDLRinTO0iNeFXUrJFVwXighJ3/Hz2ZqnkzO7HPipuukL01MwKSz2oufce2AcSYCHQbuFsnPGM8imO4/+NV8zC/rS3Na7pzOGlf0p4ghFJ33zRoi/ibu29kJYcCo0Gd38mw795OSXhbWbTT+wKj1K2yk6IbK5n/mL7WaQYUIwAXzw8KnIcaCt9Lxohe1jyfZlUTsPexKXSU05fuhWOJme0Dv1hU8K6RiTCH3Mm29N5GmfE1Nt+4dphqiOM4vdgILW0ajCQb9QfqOa/3c8Mc1qz54bJ0G7Xd5iazmnSWjq0rErXQJK6dpx7KpkIxG3GJpT5LRiUhRHe7PWsYqlvu4nXHhawKICUvLJs35Z/PF/fU8bMKWGRgSBIE1UAwQOtAGevpjLBQ=
Content-ID: <1FF34422A1DD81418324EC1D8FBDA0D9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8352aee9-29fc-47e1-3b52-08d711e45d4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 16:14:41.4224 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3189
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjAF7WFI9NGq7rS4SmkTOMdyLhaMRr31sdIHTGBPFsA=;
 b=DhwcD1DeUB2NvuWmyvmx4692mPFGpbBbEeRaaAHv3PWbfVTfoWHVGfWHHjhz068lxkIVEQ8lbIkrKoTI7vSO7Df4P/7GqgI75Albjk3ZUtkz0D9t7DqETiRN8WsjPyQt4aMoGwk0m0sQnHx4lqT6ZiM7tvCM5TIO7NCvc1Zk4GA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8yNi8xOSAxMjowMiBQTSwgRGF2aWQgKERpbmdjaGVuKSBaaGFuZyB3cm90ZToNCj4gRnJv
bTogRGluZ2NoZW4gWmhhbmcgPGRpbmdjaGVuLnpoYW5nQGFtZC5jb20+DQo+IA0KPiB0byB0ZXJt
aW5hdGUgdGhlIHdoaWxlLWxvb3AgaW4gZHJtX2RwX2F1eF9jcmNfd29yayB3aGVuDQo+IGRybV9k
cF9zdGFydC9zdG9wX2NyYyBhcmUgY2FsbGVkIGluIHRoZSBob29rIHRvIHNldCBjcmMgc291cmNl
Lg0KPiANCj4gdjI6IE1vdmUgc3Bpbl9sb2NrIGFyb3VuZCBlbnRpcmUgY3JjLT5vcGVuZWQgdXNl
IChEYW5pZWwpDQo+IA0KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPg0KPiBD
YzogSGFycnkgV2VudGxhbmQgPEhhcnJ5LldlbnRsYW5kQGFtZC5jb20+DQo+IENjOiBOaWNrIEth
emxhdXNrYXMgPE5pY2hvbGFzLkthemxhdXNrYXNAYW1kLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTog
RGluZ2NoZW4gWmhhbmcgPGRpbmdjaGVuLnpoYW5nQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYyB8IDYgKysrKysrDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZGVidWdmc19jcmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYw0KPiBp
bmRleCBkYWMyNjdlODQwYWYuLmY4NzE0ODIwMzU5OSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVi
dWdmc19jcmMuYw0KPiBAQCAtMjQ5LDYgKzI0OSwxMiBAQCBzdGF0aWMgaW50IGNydGNfY3JjX3Jl
bGVhc2Uoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpbGUgKmZpbGVwKQ0KPiAgIAlzdHJ1
Y3QgZHJtX2NydGMgKmNydGMgPSBmaWxlcC0+Zl9pbm9kZS0+aV9wcml2YXRlOw0KPiAgIAlzdHJ1
Y3QgZHJtX2NydGNfY3JjICpjcmMgPSAmY3J0Yy0+Y3JjOw0KPiAgIA0KPiArCS8qIHRlcm1pbmF0
ZSB0aGUgaW5maW5pdGUgd2hpbGUgbG9vcCBpZiAnZHJtX2RwX2F1eF9jcmNfd29yaycgcnVubmlu
ZyAqLw0KPiArCXNwaW5fbG9ja19pcnEoJmNyYy0+bG9jayk7DQo+ICsJaWYgKGNyYy0+b3BlbmVk
KQ0KPiArCQljcmMtPm9wZW5lZCA9IGZhbHNlOw0KDQpZb3UgY2FuIGp1c3Qgc2V0IHRoaXMgdG8g
ZmFsc2UsIG5vIG5lZWQgdG8gY2hlY2sgdGhlIHZhbHVlIHJlYWxseS4NCg0KTmljaG9sYXMgS2F6
bGF1c2thcw0KDQo+ICsJc3Bpbl91bmxvY2tfaXJxKCZjcmMtPmxvY2spOw0KPiArDQo+ICAgCWNy
dGMtPmZ1bmNzLT5zZXRfY3JjX3NvdXJjZShjcnRjLCBOVUxMKTsNCj4gICANCj4gICAJc3Bpbl9s
b2NrX2lycSgmY3JjLT5sb2NrKTsNCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
