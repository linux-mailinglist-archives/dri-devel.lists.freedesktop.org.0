Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA6D96B82
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 23:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16866E893;
	Tue, 20 Aug 2019 21:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810059.outbound.protection.outlook.com [40.107.81.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DA26E892;
 Tue, 20 Aug 2019 21:35:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTpA6AN1JAHcAl1Mu/ZIgMLzCOWK+lx7Yix2vW5L6ODb4H/tpebh1AGFNHoJxdz+Uz5rv/EXwrSvcb5Tq7Z7m0tT9hKu0SvwAuKTaTUxL6cDG/496x//vFTJrDxXEBhjMyjiYtzezp62UWf59eTS3PDn5GIPxlT4g2GciSMPkG0b6KuHCMdH81I2kvNoJ4CxNfCuD+ohymC1q5bzT3rAEnaaMX48c2gCCj6lGneJcXjwnAvmjIi+vDE4oiy94tn/mHUyqGYQLIWtH8vcsRh0pKEjsMoWeI+hqKRF62JYWj0roeoWWB7wOuUzxAEENaygZdvtKb0PZhRa1DSb5rF+Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cgLVHpjkDJ6cYzgiCErHGrmlXXv+voH5cZuv5Trjxs=;
 b=C0nGzvc6p2v4BI/FsywCDW4zBJB7LQoLjjZld77yfM6A/dOr16yL8aw2NbbO1I44OXzupi+g2CdkoX073yNVzCcCSUt0LjubBOJkIDeDRE+PPc0//y7FWHx1IgBMCBoCRDPbWJtma8C2VYE6e0jMLAnhVHLIVpDucgxXXqqgWktLGMjlD21CPprxLx7QRG/XkmNaxVm/kBh3zTAth56PEUAMjHFL697o0jGf8mdTrQXs3ZMWAWj3fmarKKa+z3raubcsI72O7mNknaaoOVyh1mQoVp/A0yU3a0v7wddGBFwo/2ezkdQ3sc1VIsGTmY1aBRRITUKhvhlnTWcGFmt4yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SN6PR12MB2608.namprd12.prod.outlook.com (52.135.102.161) by
 DM5SPR01MB03.namprd12.prod.outlook.com (10.167.106.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 20 Aug 2019 21:35:13 +0000
Received: from SN6PR12MB2608.namprd12.prod.outlook.com
 ([fe80::65fe:d07d:fdcd:9fd4]) by SN6PR12MB2608.namprd12.prod.outlook.com
 ([fe80::65fe:d07d:fdcd:9fd4%4]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 21:35:13 +0000
From: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
To: Lyude Paul <lyude@redhat.com>, "Francis, David" <David.Francis@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 09/14] drm/dp-mst: Export symbols for dpcd read/write
Thread-Topic: [PATCH v2 09/14] drm/dp-mst: Export symbols for dpcd read/write
Thread-Index: AQHVV4tAXRDeCYnqW0O8muLwr5flyqcEhfUAgAAJPoA=
Date: Tue, 20 Aug 2019 21:35:13 +0000
Message-ID: <e7bc8662-0fcd-394d-7970-aab658206238@amd.com>
References: <20190820191203.25807-1-David.Francis@amd.com>
 <20190820191203.25807-10-David.Francis@amd.com>
 <773c80494087854b72ffb85938f0ea54bd89c121.camel@redhat.com>
In-Reply-To: <773c80494087854b72ffb85938f0ea54bd89c121.camel@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::44) To SN6PR12MB2608.namprd12.prod.outlook.com
 (2603:10b6:805:6e::33)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 740d3726-39d6-4aaa-f419-08d725b648d6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5SPR01MB03; 
x-ms-traffictypediagnostic: DM5SPR01MB03:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5SPR01MB0390546C60AF9BBF47E9B282AB0@DM5SPR01MB03.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(199004)(189003)(99286004)(478600001)(25786009)(2906002)(31686004)(52116002)(14454004)(5660300002)(66446008)(66476007)(66556008)(66946007)(64756008)(36756003)(76176011)(186003)(2616005)(6246003)(26005)(486006)(476003)(53936002)(6506007)(316002)(81166006)(81156014)(11346002)(53546011)(110136005)(386003)(102836004)(305945005)(8676002)(2201001)(71200400001)(86362001)(3846002)(71190400001)(446003)(6116002)(31696002)(6486002)(6436002)(229853002)(6512007)(7736002)(66066001)(2501003)(256004)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5SPR01MB03;
 H:SN6PR12MB2608.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fgAORNiq+bcLo4nN847/Yjdxb0Sq6/6gf7W2Lh7lhf1VCkLsAxk+52mthtQ4CO5ci+a95zvKSp6gxQL8ZxSuNafEwWFRJE0QDCYBDen0jzksjEBMZpDHc72o9HGxUD5tWEHnFyXDbXBa45UCeBh1X1wf9tYKRGI+xGUtu6MghSzAfw9IpMCRx/QADG/IOQEr+33LvjLEOTYsqb//L/1jhZ+Y0Q6yRVrLOIJaKd7J+pdoE7XU+QvDIJM+x2EBOx/RbJTytE5ijfmMHhn9sA7FYazIG2X6RV2FDwyN8hZDWI6qIq7SP57LoLp0eOEpUHzRsuIHWtCYPl27clMJ132Y0jtIXXjEwEDvdX0Uwm/qRHzKv+dLX8EoKjmt8Uoa60VDXxRgssvQmu1VPw1bQQpEU1ihXyVNawv1COO2f6l62D4=
Content-ID: <5112E0335118BB4197992A8ABE6C16CE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 740d3726-39d6-4aaa-f419-08d725b648d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 21:35:13.4125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8qvXVripfFw07LvtDsjqgioewCdI+6GCI0WgTHnvsMja6rcJan5gGgE7lj5seqXX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5SPR01MB03
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cgLVHpjkDJ6cYzgiCErHGrmlXXv+voH5cZuv5Trjxs=;
 b=UW9bL1odARDDf0MPsKk/t+T29n8fqSQgaPEoHhqaQv1xTw/ZsCxMaNUKmgLrEfUNMufTALHY/viVQ7TNpC95S7Vs3ixxXVYG0yod9/qifSKTmDbQrEi2nvtxJB9f5VD/MJEuXSY05Fy6gXLDy7KTkv8G+JEJJsZiFvnVIYiAAyY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Sunpeng.Li@amd.com; 
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

DQoNCg0KT24gMjAxOS0wOC0yMCA1OjAyIHAubS4sIEx5dWRlIFBhdWwgd3JvdGU6DQo+IFtBZGRl
ZCBMZW8gTGkgaGVyZSwgc2luY2UgdGhleSBkaWQgdGhlIGF1eGRldiB3b3JrIHRoYXQgaW50cm9k
dWNlZCB0aGVzZQ0KPiBmdW5jdGlvbnNdDQo+IA0KPiBTaW5jZSBpdCBzZWVtcyB3ZSdsbCBhY3R1
YWxseSBiZSBkb2luZyByZW1vdGUgRFBDRCByZWFkL3dyaXRlcyBpbiBEUk0gZHJpdmVycw0KPiBh
bmQgbm90IGp1c3QgZnJvbSBhdXhkZXYsIG1heWJlIHdlIHNob3VsZCBjb21iaW5lIGRybV9kcF9k
cGNkX3JlYWQoKSB3aXRoDQo+IGRybV9kcF9tc3RfZHBjZF9yZWFkKCkgYW5kIGRvIHRoZSBzYW1l
IHdpdGggdGhlIF93cml0ZSgpIHZhcmlhbnRzPyBCYXNlZCBvbg0KPiBwcmV2aW91cyBkaXNjdXNz
aW9ucyB3aXRoIExlbyBMaSBJIHJlbWVtYmVyIHRoYXQgd2UgY2FuJ3QganVzdCBjb21iaW5lIHRo
ZQ0KPiBkcF9hdXhfZGV2LT50cmFuc2ZlcigpIGNhbGxiYWNrcyBpbiBzdHJ1Y3QgZHJtX2RwX2F1
eF9kZXYsIGJ1dCBJIGRvbid0IHNlZSBhDQo+IHJlYXNvbiB3ZSBjYW4ndCBqdXN0IHRlYWNoIGRy
bV9kcF9kcGNkX3JlYWQvd3JpdGUoKSB0byB3b3JrIHdpdGggTVNUIGF1eCBzbw0KPiB0aGF0IHdl
IGRvbid0IG5lZWQgdHdvIHNlcGVyYXRlIGZ1bmN0aW9ucy4gVGhpcyBzaG91bGQgYmUgcHJldHR5
IGVhc3kgdG8gZG8sDQo+IGp1c3Q6DQo+IA0KPiAvKiBBZGQgYSBjaGVjayBsaWtlIHRoaXMgYXQg
dGhlIHN0YXJ0IG9mIGRybV9kcF9kcGNkX3JlYWQoKTogKi8NCj4gc3NpemVfdCBkcm1fZHBfZHBj
ZF9yZWFkKC4uLikgew0KPiAJaWYgKGF1eC0+aXNfcmVtb3RlKQ0KPiAJCXJldHVybiBkcm1fZHBf
bXN0X2RwY2RfcmVhZCguLi4pOw0KPiANCj4gCS8qIC4uLiAqLw0KPiB9DQo+IA0KPiAvKiBBbmQg
aW4gZHJtX2RwX2RwY2Rfd3JpdGUoKTogKi8NCj4gc3NpemVfdCBkcm1fZHBfZHBjZF93cml0ZSgu
Li4pIHsNCj4gCWlmIChhdXgtPmlzX3JlbW90ZSkNCj4gCQlyZXR1cm4gZHJtX2RwX21zdF9kcGNk
X3dyaXRlKC4uLik7DQo+IA0KPiAJLyogLi4uICovDQo+IH0NCj4gDQo+IFRoZW4ganVzdCByZXBs
YWNlIHRoZSBtYW51YWwgY2FsbHMgdG8gZHJtX2RwX21zdF9kcGNkX3dyaXRlKCkgaW4NCj4gZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9hdXhfZGV2LmMgd2l0aCBub3JtYWwNCj4gZHJtX2RwX2RwY2Rf
cmVhZCgpL2RybV9kcF9kcGNkX3dyaXRlKCkgY2FsbHMuIFRob3VnaHRzPw0KDQpJIHRoaW5rIHRo
aXMgd291bGQgd29yayB3ZWxsLg0KDQpkcm1fZHBfbXN0X2RwY2RfcmVhZC93cml0ZSB3aWxsIGV2
ZW50dWFsbHkgY2FsbCBkcm1fZHBfZHBjZF93cml0ZSwgc28NCmRvaW5nIHNvIHdvdWxkIGNhdXNl
IGEgcmVjdXJzaXZlIGNhbGwuIFRoYXQgc2hvdWxkIGJlIHNhZmUgdGhvdWdoLiBUaGUNCm1zdCBt
YW5hZ2VyJ3MgYXV4IHdpbGwgYmUgdXNlZCwgYW5kIHRoYXQgc2hvdWxkIGFsd2F5cyBiZSBhIHJl
YWwNCihpc19yZW1vdGUgPT0gZmFsc2UpIGF1eCwgZndpY3QuDQoNCkVzc2VudGlhbGx5LCBpdCdz
IGp1c3QgbW92aW5nIHRoYXQgY29uZGl0aW9uYWwgZnJvbQ0KYXV4ZGV2X3JlYWQvd3JpdGVfaXRl
ciB0byBkcm1fZHBfZHBjZF9yZWFkL3dyaXRlLg0KDQpMZW8NCg0KPiANCj4gT24gVHVlLCAyMDE5
LTA4LTIwIGF0IDE1OjExIC0wNDAwLCBEYXZpZCBGcmFuY2lzIHdyb3RlOg0KPj4gVG8gdXNlIHRo
ZXNlIGZ1bmN0aW9ucyBpbiBkcm0gZHJpdmVyIGRpcmVjdG9yaWVzLCB0aGV5IG11c3QgYmUNCj4+
IGV4cG9ydGVkDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJh
bmNpc0BhbWQuY29tPg0KPj4gLS0tDQo+PiAgZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9w
b2xvZ3kuYyB8IDIgKysNCj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+Pg0K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMNCj4+
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYw0KPj4gaW5kZXggYjQwZDk3
NWFlYzc2Li41ZDViZDQyZGExN2MgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RwX21zdF90b3BvbG9neS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90
b3BvbG9neS5jDQo+PiBAQCAtMTUxMiw2ICsxNTEyLDcgQEAgc3NpemVfdCBkcm1fZHBfbXN0X2Rw
Y2RfcmVhZChzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LA0KPj4gIAlyZXR1cm4gZHJtX2RwX3NlbmRf
ZHBjZF9yZWFkKHBvcnQtPm1nciwgcG9ydCwNCj4+ICAJCQkJICAgICBvZmZzZXQsIHNpemUsIGJ1
ZmZlcik7DQo+PiAgfQ0KPj4gK0VYUE9SVF9TWU1CT0woZHJtX2RwX21zdF9kcGNkX3JlYWQpOw0K
Pj4gIA0KPj4gIC8qKg0KPj4gICAqIGRybV9kcF9tc3RfZHBjZF93cml0ZSgpIC0gd3JpdGUgYSBz
ZXJpZXMgb2YgYnl0ZXMgdG8gdGhlIERQQ0QgdmlhDQo+PiBzaWRlYmFuZA0KPj4gQEAgLTE1MzUs
NiArMTUzNiw3IEBAIHNzaXplX3QgZHJtX2RwX21zdF9kcGNkX3dyaXRlKHN0cnVjdCBkcm1fZHBf
YXV4ICphdXgsDQo+PiAgCXJldHVybiBkcm1fZHBfc2VuZF9kcGNkX3dyaXRlKHBvcnQtPm1nciwg
cG9ydCwNCj4+ICAJCQkJICAgICAgb2Zmc2V0LCBzaXplLCBidWZmZXIpOw0KPj4gIH0NCj4+ICtF
WFBPUlRfU1lNQk9MKGRybV9kcF9tc3RfZHBjZF93cml0ZSk7DQo+PiAgDQo+PiAgc3RhdGljIHZv
aWQgZHJtX2RwX2NoZWNrX21zdGJfZ3VpZChzdHJ1Y3QgZHJtX2RwX21zdF9icmFuY2ggKm1zdGIs
IHU4DQo+PiAqZ3VpZCkNCj4+ICB7DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
