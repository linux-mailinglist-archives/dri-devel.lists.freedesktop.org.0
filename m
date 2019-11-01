Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CFAECA0C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 21:57:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C146E241;
	Fri,  1 Nov 2019 20:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720048.outbound.protection.outlook.com [40.107.72.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7039D6E16B;
 Fri,  1 Nov 2019 20:57:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZOP+XijlCRE+/Cq0sfI4Co5UDh8z5K5tgQQrQ2oB3UAAJASBt00DBb14Tf2imbruff4gtvSVOWmMoHgL9emYR7ZcBaOixZR/x6bx5BmAxXwcQhxGUORjQDrC6ChVZXlkBMtmY74T11qljNyqlJ0sZOxptuMdx1djBT76zH2c/TGgCrzFIYY8Zcku9dxfJa1/TNloP1G/rQvw6VW2KMjZQcDwAM2MWwjO8igzLzhfSJjl7L2ppvtXzunH3BssKN5BZyEpQU41BDqnE1qdKTt8ODKmizo0+SKBypRvuEiezW5X8WYekYu5rAhxbyHaZGhOYJqxkvsTIFpHuf8djzTTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdY1dIUR0S4wYbDR1nDoAg248kqgxYkfWY50kz9d0cI=;
 b=DJmr5GMraAbklVRlbny56E50o0s/iA9QPjYt7+gcNMsieLJEV3sM+DTyKOhPyMeteW+vSJmOYxsd2sciWkXjkHYwhdZ6MB1OaqgFMPlwBghV9PlGmIbmUT/trJIBzkN5JzBxaCUAYOEn2VyPVZrJONtszEZDgJa6o8+04FSWz0RwWqXZcpoqUAhK6We1fl/GAFOBz99ENqZ3QcqEeVCJHEEDqUw5mczvIuKTFpPQ1PCMl0qfh7bp4pfQgJj7uCTiFLd9NDtIpP97YgwawBd8+EaG0AEkBleDisj7jJxVIU32+2V7xjAMxWrfOki78jr45i+NIDaM5gANuMKHbh/QDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR1201MB0228.namprd12.prod.outlook.com (10.174.115.135) by
 BN6PR1201MB0050.namprd12.prod.outlook.com (10.174.239.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Fri, 1 Nov 2019 20:57:51 +0000
Received: from BN6PR1201MB0228.namprd12.prod.outlook.com
 ([fe80::f894:3184:4c1:10e5]) by BN6PR1201MB0228.namprd12.prod.outlook.com
 ([fe80::f894:3184:4c1:10e5%11]) with mapi id 15.20.2387.028; Fri, 1 Nov 2019
 20:57:51 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Zuo, Jerry" <Jerry.Zuo@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] drm: Add support for DP 1.4 Compliance edid
 corruption test 4.2.2.6
Thread-Topic: [PATCH v2 1/2] drm: Add support for DP 1.4 Compliance edid
 corruption test 4.2.2.6
Thread-Index: AQHVkOv7UU5S7lLw/kKRLZsxhBrVead2zC+A
Date: Fri, 1 Nov 2019 20:57:50 +0000
Message-ID: <35dac541-3fd9-fdf9-e547-a4a6bda23b41@amd.com>
References: <20191030210844.19803-2-Jerry.Zuo@amd.com>
 <20191101193839.25582-1-Jerry.Zuo@amd.com>
In-Reply-To: <20191101193839.25582-1-Jerry.Zuo@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
x-clientproxiedby: YTOPR0101CA0030.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::43) To BN6PR1201MB0228.namprd12.prod.outlook.com
 (2603:10b6:405:57::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a521efcc-f654-4e90-d342-08d75f0e2830
x-ms-traffictypediagnostic: BN6PR1201MB0050:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR1201MB0050260A23554EDD1C940F448C620@BN6PR1201MB0050.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 020877E0CB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(189003)(199004)(14454004)(446003)(4326008)(54906003)(256004)(52116002)(25786009)(14444005)(110136005)(2501003)(102836004)(8676002)(305945005)(7736002)(58126008)(99286004)(6486002)(6512007)(8936002)(316002)(2906002)(6246003)(76176011)(81156014)(81166006)(26005)(31696002)(53546011)(229853002)(65806001)(65956001)(3846002)(386003)(6116002)(2201001)(66066001)(186003)(66946007)(5660300002)(478600001)(66476007)(486006)(66556008)(11346002)(64756008)(66446008)(476003)(2616005)(31686004)(6436002)(71190400001)(71200400001)(36756003)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0050;
 H:BN6PR1201MB0228.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jvRbreNR1ZqH8ynRWiZ6D7RM4x25uAUK5jx5Sk9gj3QR4rslGaOf0aizhax7acsgaMZGqxAprqr2rB2BjRmzDlllkZmp3hMlSOWm3j0Nov5mGQRjEFRZDu1EFqiK1uEIFiQkfyBJdNfPXrqR/bi92tWVcGV39JR+dXrJPxdjhVDy+H3pRjxyOO/2nHcGmSjyT7pZJtoHtyZeM3xDCH9rgGnH5OAxQU7d0ewSiEsSw5o+R/yYBsTnyaY+x4XZU4dsHIoBIG97lhviBesrv+42SZoVIgSGai3IwB8+CrxEkceK2qaVj6eb/DNufM4/3DucNdciY0Sv+/yYdAcLC8tulgmLtB6VhbZ9DMgi81ekQAPVoA0Az+KDqTsD8QuD1d9kTYJOKng3NYY+s/2SuA/dLn81vic0uI66yHVXD42sZbfyXlChkOOTs0bNIMx/pvrP
Content-ID: <3D5BA6141B5D9141A3034244ECAD5048@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a521efcc-f654-4e90-d342-08d75f0e2830
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2019 20:57:50.8801 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fGTrh8oTLumDeCZ2AN6BTi3k4axRb+RHZCRb4FmfRwQeDnxlDTqVN0qZdiQIQUHJRd72hZNm52xlGPsjTg4BlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0050
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdY1dIUR0S4wYbDR1nDoAg248kqgxYkfWY50kz9d0cI=;
 b=tB1QjQUnzzGccGakLcJVBPHDPjg0Dpvxo79Xobm91GkuKu3O5SMp0fYlQuIKoY8MjIAPUhG2wIy3IpIVh2NknCgj4Rp5kdWwvrSuQlZRk/eu33EIrGcsTo529FmDFnLVbELLXmTInw7FraqJDrVF47jYD0ge30b5r5yWp18EaSQ=
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
Cc: "manasi.d.navare@intel.com" <manasi.d.navare@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMS0wMSAzOjM4IHAubS4sIEplcnJ5IChGYW5nemhpKSBadW8gd3JvdGU6DQo+IERQ
IDEuNCBlZGlkIGNvcnJ1cHRpb24gdGVzdCByZXF1aXJlcyBzb3VyY2UgRFVUIHRvIHdyaXRlIGNh
bGN1bGF0ZWQNCj4gQ1JDLCBub3QgdGhlIGNvcnJ1cHRlZCBDUkMgZnJvbSByZWZlcmVuY2Ugc2lu
ay4NCj4gDQo+IFJldHVybiB0aGUgY2FsY3VsYXRlZCBDUkMgYmFjaywgYW5kIGluaXRpYXRlIHRo
ZSByZXF1aXJlZCBzZXF1ZW5jZS4NCj4gDQo+IC12MjogSGF2ZSBzZXBhcmF0ZSByb3V0aW5lIGZv
ciByZXR1cm5pbmcgcmVhbCBDUkMNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEplcnJ5IChGYW5nemhp
KSBadW8gPEplcnJ5Llp1b0BhbWQuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfaGVscGVyLmMgfCAzNiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4g
IGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jICAgICAgfCAxNCArKysrKysrKysrKysrKw0KPiAg
aW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oICAgICB8ICA3ICsrKysrKysNCj4gIGluY2x1ZGUv
ZHJtL2RybV9kcF9oZWxwZXIuaCAgICAgfCAgMyArKysNCj4gIDQgZmlsZXMgY2hhbmdlZCwgNjAg
aW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
aGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jDQo+IGluZGV4IGZmYzY4
ZDMwNWFmZS4uNzVkYmQzMGM2MmE3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RwX2hlbHBlci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMNCj4g
QEAgLTMzNiw2ICszMzYsNDIgQEAgaW50IGRybV9kcF9kcGNkX3JlYWRfbGlua19zdGF0dXMoc3Ry
dWN0IGRybV9kcF9hdXggKmF1eCwNCj4gIH0NCj4gIEVYUE9SVF9TWU1CT0woZHJtX2RwX2RwY2Rf
cmVhZF9saW5rX3N0YXR1cyk7DQo+ICANCj4gKy8qKg0KPiArICAqIGRybV9kcF9zZW5kX2JhZF9l
ZGlkX2NoZWNrc3VtKCkgLSBzZW5kIGJhY2sgcmVhbCBlZGlkIGNoZWNrc3VtIHZhbHVlDQo+ICsg
ICogQGF1eDogRGlzcGxheVBvcnQgQVVYIGNoYW5uZWwNCj4gKyAgKiBAYmFkX2VkaWRfY2hlY2tz
dW06IHJlYWwgZWRpZCBjaGVja3N1bSBmb3IgdGhlIGxhc3QgYmxvY2sNCj4gKyAgKg0KPiArICAq
IFJldHVybnMgdHJ1ZSBvbiBzdWNjZXNzDQo+ICsgICovDQo+ICtib29sIGRybV9kcF9zZW5kX2Jh
ZF9lZGlkX2NoZWNrc3VtKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsDQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHU4IGJhZF9lZGlkX2NoZWNrc3VtKQ0KPiArew0KPiArICAgICAg
ICB1OCBsaW5rX2VkaWRfcmVhZCA9IDAsIGF1dG9fdGVzdF9yZXEgPSAwOw0KPiArICAgICAgICB1
OCB0ZXN0X3Jlc3AgPSAwOw0KPiArDQo+ICsgICAgICAgIGRybV9kcF9kcGNkX3JlYWQoYXV4LCBE
UF9ERVZJQ0VfU0VSVklDRV9JUlFfVkVDVE9SLCAmYXV0b190ZXN0X3JlcSwgMSk7DQo+ICsgICAg
ICAgIGF1dG9fdGVzdF9yZXEgJj0gRFBfQVVUT01BVEVEX1RFU1RfUkVRVUVTVDsNCj4gKw0KPiAr
ICAgICAgICBkcm1fZHBfZHBjZF9yZWFkKGF1eCwgRFBfVEVTVF9SRVFVRVNULCAmbGlua19lZGlk
X3JlYWQsIDEpOw0KPiArICAgICAgICBsaW5rX2VkaWRfcmVhZCAmPSBEUF9URVNUX0xJTktfRURJ
RF9SRUFEOw0KPiArDQo+ICsgICAgICAgIGlmICghYXV0b190ZXN0X3JlcSB8fCAhbGlua19lZGlk
X3JlYWQpIHsNCj4gKyAgICAgICAgICAgICAgICBEUk1fREVCVUdfS01TKCJTb3VyY2UgRFVUIGRv
ZXMgbm90IHN1cHBvcnQgVEVTVF9FRElEX1JFQURcbiIpOw0KPiArICAgICAgICAgICAgICAgIHJl
dHVybiBmYWxzZTsNCj4gKyAgICAgICAgfQ0KPiArDQo+ICsgICAgICAgIGRybV9kcF9kcGNkX3dy
aXRlKGF1eCwgRFBfREVWSUNFX1NFUlZJQ0VfSVJRX1ZFQ1RPUiwgJmF1dG9fdGVzdF9yZXEsIDEp
Ow0KPiArDQo+ICsgICAgICAgIC8qIHNlbmQgYmFjayBjaGVja3N1bSBmb3IgdGhlIGxhc3QgZWRp
ZCBleHRlbnNpb24gYmxvY2sgZGF0YSAqLw0KPiArICAgICAgICBkcm1fZHBfZHBjZF93cml0ZShh
dXgsIERQX1RFU1RfRURJRF9DSEVDS1NVTSwgJmJhZF9lZGlkX2NoZWNrc3VtLCAxKTsNCj4gKw0K
PiArICAgICAgICB0ZXN0X3Jlc3AgfD0gRFBfVEVTVF9FRElEX0NIRUNLU1VNX1dSSVRFOw0KPiAr
ICAgICAgICBkcm1fZHBfZHBjZF93cml0ZShhdXgsIERQX1RFU1RfUkVTUE9OU0UsICZ0ZXN0X3Jl
c3AsIDEpOw0KPiArDQo+ICsgICAgICAgIHJldHVybiB0cnVlOw0KPiArfQ0KPiArRVhQT1JUX1NZ
TUJPTChkcm1fZHBfc2VuZF9iYWRfZWRpZF9jaGVja3N1bSk7DQo+ICsNCj4gIC8qKg0KPiAgICog
ZHJtX2RwX2xpbmtfcHJvYmUoKSAtIHByb2JlIGEgRGlzcGxheVBvcnQgbGluayBmb3IgY2FwYWJp
bGl0aWVzDQo+ICAgKiBAYXV4OiBEaXNwbGF5UG9ydCBBVVggY2hhbm5lbA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQu
Yw0KPiBpbmRleCA4MmE0Y2VlZDNmY2YuLjA1OTgzMTRlM2Y0NiAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9lZGlkLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlk
LmMNCj4gQEAgLTEzNTQsNiArMTM1NCwxNyBAQCBzdGF0aWMgaW50IGRybV9lZGlkX2Jsb2NrX2No
ZWNrc3VtKGNvbnN0IHU4ICpyYXdfZWRpZCkNCj4gIAlyZXR1cm4gY3N1bTsNCj4gIH0NCj4gIA0K
PiArc3RhdGljIGludCBkcm1fZWRpZF9ibG9ja19yZWFsX2NoZWNrc3VtKGNvbnN0IHU4ICpyYXdf
ZWRpZCkNCj4gK3sNCj4gKwlpbnQgaTsNCj4gKwl1OCBjc3VtID0gMDsNCj4gKw0KPiArCWZvciAo
aSA9IDA7IGkgPCBFRElEX0xFTkdUSCAtIDE7IGkrKykNCj4gKwkJY3N1bSArPSByYXdfZWRpZFtp
XTsNCj4gKw0KPiArCXJldHVybiAoMHgxMDAgLSBjc3VtKTsNCj4gK30NCj4gKw0KPiAgc3RhdGlj
IGJvb2wgZHJtX2VkaWRfaXNfemVybyhjb25zdCB1OCAqaW5fZWRpZCwgaW50IGxlbmd0aCkNCj4g
IHsNCj4gIAlpZiAobWVtY2hyX2ludihpbl9lZGlkLCAwLCBsZW5ndGgpKQ0KPiBAQCAtMTU3Miw2
ICsxNTgzLDkgQEAgc3RhdGljIHZvaWQgY29ubmVjdG9yX2JhZF9lZGlkKHN0cnVjdCBkcm1fY29u
bmVjdG9yICpjb25uZWN0b3IsDQo+ICAJCQkgICAgICAgcHJlZml4LCBEVU1QX1BSRUZJWF9OT05F
LCAxNiwgMSwNCj4gIAkJCSAgICAgICBibG9jaywgRURJRF9MRU5HVEgsIGZhbHNlKTsNCj4gIAl9
DQo+ICsNCj4gKwkvKiBDYWxjdWxhdGUgcmVhbCBjaGVja3N1bSBmb3IgdGhlIGxhc3QgZWRpZCBl
eHRlbnNpb24gYmxvY2sgZGF0YSAqLw0KPiArCWNvbm5lY3Rvci0+YmFkX2VkaWRfY2hlY2tzdW0g
PSBkcm1fZWRpZF9ibG9ja19yZWFsX2NoZWNrc3VtKGVkaWQgKyBlZGlkWzB4N2VdICogRURJRF9M
RU5HVEgpOw0KPiAgfQ0KPiAgDQo+ICAvKiBHZXQgb3ZlcnJpZGUgb3IgZmlybXdhcmUgRURJRCAq
Lw0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oIGIvaW5jbHVkZS9k
cm0vZHJtX2Nvbm5lY3Rvci5oDQo+IGluZGV4IDY4MWNiNTkwZjk1Mi4uODQ0MjQ2MTU0MmI5IDEw
MDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgNCj4gKysrIGIvaW5jbHVk
ZS9kcm0vZHJtX2Nvbm5lY3Rvci5oDQo+IEBAIC0xMzQ1LDYgKzEzNDUsMTMgQEAgc3RydWN0IGRy
bV9jb25uZWN0b3Igew0KPiAgCSAqIHJldjEuMSA0LjIuMi42DQo+ICAJICovDQo+ICAJYm9vbCBl
ZGlkX2NvcnJ1cHQ7DQo+ICsJLyoqDQo+ICsgICAgICAgICAqIEBiYWRfZWRpZF9jaGVja3N1bTog
cmVhbCBlZGlkIGNoZWNrc3VtIHZhbHVlIGZvciBjb3JydXB0ZWQgZWRpZCBibG9jay4NCj4gKyAg
ICAgICAgICogUmVxdWlyZWQgaW4gRGlzcGxheXBvcnQgMS40IGNvbXBsaWFuY2UgdGVzdGluZw0K
PiArICAgICAgICAgKiByZXYxLjEgNC4yLjIuNg0KPiArICAgICAgICAgKi8NCj4gKyAgICAgICAg
dWludDhfdCBiYWRfZWRpZF9jaGVja3N1bTsNCg0KDQpUaGlzIHZhcmlhYmxlIG5hbWUgY29uZnVz
ZWQgbWUgYSBiaXQuIE1heWJlIG5hbWUgdGhpcw0KImNvbXB1dGVkX2VkaWRfY2hlY2tzdW0iIHRv
IGNsYXJpZnkgdGhhdCB0aGlzIGlzIHRoZSBFRElEIGNoZWNrc3VtIHRoYXQNCndlJ3ZlIGNvbXB1
dGVkIGZvciB0aGUgRURJRCwgaS5lLiB0aGUgY29ycmVjdCBvbmUuDQoNCj4gKw0KPiAgDQo+ICAJ
LyoqIEBkZWJ1Z2ZzX2VudHJ5OiBkZWJ1Z2ZzIGRpcmVjdG9yeSBmb3IgdGhpcyBjb25uZWN0b3Ig
Ki8NCj4gIAlzdHJ1Y3QgZGVudHJ5ICpkZWJ1Z2ZzX2VudHJ5Ow0KPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oDQo+
IGluZGV4IDVhNzk1MDc1ZDVkYS4uMmE3ZTU0YmViYjE4IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRl
L2RybS9kcm1fZHBfaGVscGVyLmgNCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5o
DQo+IEBAIC0xMzgzLDYgKzEzODMsOSBAQCBzdGF0aWMgaW5saW5lIHNzaXplX3QgZHJtX2RwX2Rw
Y2Rfd3JpdGViKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsDQo+ICBpbnQgZHJtX2RwX2RwY2RfcmVh
ZF9saW5rX3N0YXR1cyhzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LA0KPiAgCQkJCSB1OCBzdGF0dXNb
RFBfTElOS19TVEFUVVNfU0laRV0pOw0KPiAgDQo+ICtib29sIGRybV9kcF9zZW5kX2JhZF9lZGlk
X2NoZWNrc3VtKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsDQoNClNhbWUgYXMgYmVmb3JlLCBtaWdo
dCBiZSBnb29kIHRvIG5hbWUgdGhpcw0KZHJtX2RwX3NlbmRfY29tcHV0ZWRfZWRpZF9jaGVja3N1
bSBvciBzb21ldGhpbmcgc2ltaWxhci4NCg0KSGFycnkNCg0KPiArCQkJCXU4IGJhZF9lZGlkX2No
ZWNrc3VtKTsNCj4gKw0KPiAgLyoNCj4gICAqIERpc3BsYXlQb3J0IGxpbmsNCj4gICAqLw0KPiAN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
