Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB174EA79
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 16:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511E26E8CD;
	Fri, 21 Jun 2019 14:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700050.outbound.protection.outlook.com [40.107.70.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376C96E8CD
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 14:21:45 +0000 (UTC)
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0134.namprd12.prod.outlook.com (10.172.77.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Fri, 21 Jun 2019 14:21:43 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::3483:c2af:d182:555b]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::3483:c2af:d182:555b%6]) with mapi id 15.20.1987.017; Fri, 21 Jun 2019
 14:21:43 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Zhang, Dingchen (David)" <Dingchen.Zhang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm: Set crc->opened = false before setting crc
 source to NULL.
Thread-Topic: [PATCH 2/2] drm: Set crc->opened = false before setting crc
 source to NULL.
Thread-Index: AQHVG8HJqLucDEDVsky8P9Qm2E8LmKamQYiA
Date: Fri, 21 Jun 2019 14:21:43 +0000
Message-ID: <dee2bc30-8af4-98f9-a7e9-936c925af840@amd.com>
References: <20190605170639.8368-1-dingchen.zhang@amd.com>
 <20190605170639.8368-2-dingchen.zhang@amd.com>
In-Reply-To: <20190605170639.8368-2-dingchen.zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-clientproxiedby: YTOPR0101CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::38) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f2627eba-7cbe-4174-e894-08d6f653c880
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0134; 
x-ms-traffictypediagnostic: CY4PR1201MB0134:
x-microsoft-antispam-prvs: <CY4PR1201MB01340AC5F4344ED1EFF732428CE70@CY4PR1201MB0134.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(136003)(39860400002)(396003)(366004)(189003)(199004)(7736002)(316002)(6116002)(81156014)(65806001)(6512007)(486006)(31686004)(66556008)(305945005)(2501003)(186003)(64756008)(446003)(6436002)(53546011)(14454004)(26005)(14444005)(25786009)(256004)(66946007)(66476007)(65956001)(73956011)(58126008)(72206003)(68736007)(66446008)(5660300002)(8936002)(386003)(31696002)(66066001)(99286004)(81166006)(6246003)(36756003)(11346002)(110136005)(71190400001)(102836004)(6506007)(476003)(6486002)(65826007)(52116002)(76176011)(53936002)(3846002)(229853002)(8676002)(478600001)(2906002)(2616005)(71200400001)(64126003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0134;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZKgz6/g7xyIO9XxlLoPigsRDQh8b1gGEPwQmdM1hMpOHkQw3pekOF1WiRVWsftafv8BKndpJtdGnS9cMFgt/fdtjAynOGDJug1cIsxlt4U0qo3DS80YRaex+2Ib8fEuweNc30Ra9KU2rKYtbx3ptQHWCXCwxx3QzabhEWpivvfCs2D8KNby4ctn0yyuIg88FE4kuyA6BmdrFGHEp6vC0UxDrEX09UsJu3o1i/N1kJ0QPnQvKhS7feOORpY6N4RpKrNUo/TY8fdp/xsy37iGQuAsEflWMF78dl7nKkxxgwmTIESQ9gcqdad9DZS59ReiXqJltnEro8L9sBSB75/SPzOCNEeRRW58+6jeKU0mH8NNbEnlpvGgxP77qLZFMXmW4ymvcEuGmNukS5mv42PlC8747iw8mI6bqOBrcHta8aKg=
Content-ID: <4A588B222D2C654590DD9DDCF91C37BB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2627eba-7cbe-4174-e894-08d6f653c880
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 14:21:43.0687 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hwentlan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0134
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bjhetVZXgwHNq+W/Huq1DC3Y+H2JKNos3yIeTj0Sc8=;
 b=meCYfF7f2Q4NbDxHorvl9SXNDAOnUTAqQCslGrvDg5j0ilvAYB36TYzwAx2pcF3rwYHzWxuxYSuluUt7RC1peXaU+9MEP7x1Ib+/x7CFaHI9SHfgBQI31oZSlP8LEe6LeCKDwHbPB7TyZAG/Z4Suj7Z8TSP97ebeW0q2Ud0MuuA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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

T24gMjAxOS0wNi0wNSAxOjA2IHAubS4sIERpbmdjaGVuIFpoYW5nIHdyb3RlOg0KPiB0byB0ZXJt
aW5hdGUgdGhlIHdoaWxlLWxvb3AgaW4gZHJtX2RwX2F1eF9jcmNfd29yayB3aGVuIGRybV9kcF9z
dGFydC9zdG9wX2NyYw0KPiBhcmUgY2FsbGVkIGluIHRoZSBob29rIHRvIHNldCBjcmMgc291cmNl
Lg0KPiANCj4gQ2M6TGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+LCBIYXJyeSA8SGFycnkuV2Vu
dGxhbmRAYW1kLmNvbT4sIE5pY2sgPE5pY2hvbGFzLkthemxhdXNrYXNAYW1kLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogRGluZ2NoZW4gWmhhbmcgPGRpbmdjaGVuLnpoYW5nQGFtZC5jb20+DQoNCkkg
d29uZGVyIGhvdyB0aGlzIGlzbid0IGNyZWF0aW5nIHByb2JsZW1zIGZvciBSb2NrY2hpcCB3aXRo
IHRoZSBBbmFsb2dpeA0KYnJpZGdlLg0KDQpSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhh
cnJ5LndlbnRsYW5kQGFtZC5jb20+DQoNCkhhcnJ5DQoNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9k
cm0vZHJtX2RlYnVnZnNfY3JjLmMgfCA3ICsrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVn
ZnNfY3JjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMNCj4gaW5kZXggZTIw
YWRlZjlkNjIzLi4wZThiY2MxMzAzODMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZGVidWdmc19jcmMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3Jj
LmMNCj4gQEAgLTI0OSw2ICsyNDksMTMgQEAgc3RhdGljIGludCBjcnRjX2NyY19yZWxlYXNlKHN0
cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxlcCkNCj4gIAlzdHJ1Y3QgZHJtX2Ny
dGMgKmNydGMgPSBmaWxlcC0+Zl9pbm9kZS0+aV9wcml2YXRlOw0KPiAgCXN0cnVjdCBkcm1fY3J0
Y19jcmMgKmNyYyA9ICZjcnRjLT5jcmM7DQo+ICANCj4gKwkvKiB0ZXJtaW5hdGUgdGhlIGluZmlu
aXRlIHdoaWxlIGxvb3AgaWYgJ2RybV9kcF9hdXhfY3JjX3dvcmsnIHJ1bm5pbmcgKi8NCj4gKwlp
ZiAoY3JjLT5vcGVuZWQpIHsNCj4gKwkJc3Bpbl9sb2NrX2lycSgmY3JjLT5sb2NrKTsNCj4gKwkJ
Y3JjLT5vcGVuZWQgPSBmYWxzZTsNCj4gKwkJc3Bpbl91bmxvY2tfaXJxKCZjcmMtPmxvY2spOw0K
PiArCX0NCj4gKw0KPiAgCWNydGMtPmZ1bmNzLT5zZXRfY3JjX3NvdXJjZShjcnRjLCBOVUxMKTsN
Cj4gIA0KPiAgCXNwaW5fbG9ja19pcnEoJmNyYy0+bG9jayk7DQo+IA0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
