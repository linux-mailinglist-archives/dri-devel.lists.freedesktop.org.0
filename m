Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECB7E05F8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 16:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059DC6E811;
	Tue, 22 Oct 2019 14:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690057.outbound.protection.outlook.com [40.107.69.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CCC6E811;
 Tue, 22 Oct 2019 14:06:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Stn7SGswJIVrTIYbr8IM8NSSLB/M6uQDctFuZ2jnYnWnnvO65natzuwLJdEzfjbD+gZqo9pmcLrNaomCmOTJwzg227fCcXeX+sYcxtHMYkyl1rEV12AuI0Gs9hat+iXtoiJXhqaVTkji7CjkfgTHKsoE+cXs5JiUhhgOSGS1PK+wTmcStJPCLniQywwWqMnevgAA0299N9VhdrloiEjBJ1qo9w2itQ8sKJ9WH1zoFYNDrh9b+/2lh+eCq8SitlIPE5uW9L6BSX8w3ZXe1XrSLTSHVjq39jReFYKWs5vCD6ntsF85BbCn6O0qrugoRWfVFV75eP+9QkHwCl7dFmw80w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULDfa9Op211Fx1yh52rum/mgw1Z4Tt6PUA9AXH22Uxc=;
 b=nZilDJDyZdU5+3/r38bjsWM92+kwyQTIbEKDkeJ955YINfkRCkYMJNGmn9DLh1jh/vB/wmUV0PIYVNAZkQW9As3/83d50Ra7uvl2lc1SuZzp+Hr0tlfhsP5hTXMjlddmBWsoa2cLlQNtPlUYZWvj8onRjP//h2I2B1vBunjCTboFoAfJS0U1B1qJf69fTjNB8NO0TasqHBToTR7OEBTzVPaVwJ0yt+hhQ9thcinG4BKyIDjee07Ykpz1Ckze0r3uJJwDzAnWkJh8o2z93tDoEOQVZoodOHvthpkp0SHyqPZ1fE10+edktPpssN16UoAGh5Dlt4V4TZF/FjAZltIA3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0151.namprd12.prod.outlook.com (10.172.79.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Tue, 22 Oct 2019 14:06:22 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61%7]) with mapi id 15.20.2367.022; Tue, 22 Oct 2019
 14:06:22 +0000
From: Harry Wentland <hwentlan@amd.com>
To: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Shashank
 Sharma <shashank.sharma@intel.com>
Subject: Re: [PATCH 1/3] drm: Introduce scaling filter mode property
Thread-Topic: [PATCH 1/3] drm: Introduce scaling filter mode property
Thread-Index: AQHViL+vUgl4r3TY3Ue9n1jSTzJefadmlLUAgAAdjQA=
Date: Tue, 22 Oct 2019 14:06:22 +0000
Message-ID: <6cd7e246-526f-4ab1-05d7-39eb23521f55@amd.com>
References: <20191022095946.29354-1-shashank.sharma@intel.com>
 <20191022095946.29354-2-shashank.sharma@intel.com>
 <20191022122034.GJ1208@intel.com>
In-Reply-To: <20191022122034.GJ1208@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
x-clientproxiedby: YTOPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::23) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 951e894f-27eb-472d-f871-08d756f90481
x-ms-traffictypediagnostic: CY4PR1201MB0151:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CY4PR1201MB015150F41373E0A2EFC420538C680@CY4PR1201MB0151.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10001)(10009020)(4636009)(366004)(136003)(396003)(376002)(39860400002)(346002)(189003)(199004)(66946007)(66446008)(64756008)(66556008)(66476007)(25786009)(3846002)(36756003)(14454004)(7736002)(6246003)(966005)(6116002)(54906003)(305945005)(31686004)(8936002)(58126008)(316002)(81166006)(81156014)(478600001)(8676002)(6436002)(486006)(102836004)(446003)(5660300002)(476003)(2616005)(4001150100001)(71200400001)(71190400001)(6512007)(6306002)(229853002)(6506007)(53546011)(386003)(76176011)(4326008)(110136005)(52116002)(2906002)(11346002)(31696002)(14444005)(65806001)(99286004)(186003)(65956001)(66066001)(256004)(6486002)(26005)(66574012)(461764006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0151;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8F6hB6yjizCenT5GSxGDK+kf+ZAg0dgZMDGn2pGNbQtpJrWkWMF+8NAwOkbaXi9FJKaAMWfamiR52By39ssjnnyvVVx3WR1ef+dN2Dc/lHRgsZNi9ch4Q0elTMPR70Ud+leQQszOXW1QFFmlUJJqVMwWaikdcNAaxacuv24R/3G+egT1knc6CQylDfquTAS0L0Wf/S6PwwGxfo5k8b6gxHlNOAlvojVphu+cq7zt8bX7wFKBs0PFWKjdFrWkyWyzk2mi6lLrvDqgwP6P1kDxFimU5Bss+ZVsGmCZqns4GTHIqXegx1U/ZUujapS3iFkUecCYit5j5JmibDT36Jh9AvK4gZFMOOa7Q8Ebw5uD+pXiFH3MZqI8oiBLAlGshW0ANjGdn33zy7w5gOO4Tz/pAHR1cRXrmFoG9BXGqSHwDjfiYr3t65PsPNYgGS6HWAJVDIj1OXOAhW9Z4NANK/PtXGz/psMaB3QPJQzLs6l0sBw=
x-ms-exchange-transport-forked: True
Content-ID: <F90669F3900472438F371A8CB29C92B9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 951e894f-27eb-472d-f871-08d756f90481
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 14:06:22.1325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qwsRcy2iN8p3IFXwChwwb/qlmt35ElIILIX1SZoLP6u8UvznC5JPMr5TvEzkXk1338rkIu/FdexcUKthFu/1Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0151
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULDfa9Op211Fx1yh52rum/mgw1Z4Tt6PUA9AXH22Uxc=;
 b=e34oDWsK40/hmsRniiAmOuYosYc5ppikShTysfDN5FpdMwP0cCIrhqaSGosdqwC4Wy3PUzHRuPgZbtW9c8o/CTkTYaFnXkb5ztg3YmVq3yVKdUdMll7tzan8IUFS49rYtdggbvUE98KDto+5XOmusBdjuuMNAMsjmzlUx0TZaHI=
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDIwMTktMTAtMjIgODoyMCBhLm0uLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6DQo+IE9u
IFR1ZSwgT2N0IDIyLCAyMDE5IGF0IDAzOjI5OjQ0UE0gKzA1MzAsIFNoYXNoYW5rIFNoYXJtYSB3
cm90ZToNCj4+IFRoaXMgcGF0Y2ggYWRkcyBhIHNjYWxpbmcgZmlsdGVyIG1vZGUgcG9ycGVydHkN
Cj4+IHRvIGFsbG93Og0KPj4gLSBBIGRyaXZlci9IVyB0byBzaG93Y2FzZSBpdCdzIHNjYWxpbmcg
ZmlsdGVyIGNhcGFiaWxpdGllcy4NCj4+IC0gQSB1c2Vyc3BhY2UgdG8gcGljayBhIGRlc2lyZWQg
ZWZmZWN0IHdoaWxlIHNjYWxpbmcuDQo+Pg0KPj4gVGhpcyBvcHRpb24gd2lsbCBiZSBwYXJ0aWN1
bGFybHkgdXNlZnVsIGluIHRoZSBzY2VuYXJpb3Mgd2hlcmUNCj4+IEludGVnZXIgbW9kZSBzY2Fs
aW5nIGlzIHBvc3NpYmxlLCBhbmQgYSBVSSBjbGllbnQgd2FudHMgdG8gcGljaw0KPj4gZmlsdGVy
cyBsaWtlIE5lYXJlc3QtbmVpZ2hib3IgYXBwbGllZCBmb3Igbm9uLWJsdXJyeSBvdXRwdXRzLg0K
Pj4NCj4+IFRoZXJlIHdhcyBhIFJGQyBwYXRjaCBzZXJpZXMgcHVibGlzaGVkLCB0byBkaXNjdXMg
dGhlIHJlcXVlc3QgdG8gZW5hYmxlDQo+PiBJbnRlZ2VyIG1vZGUgc2NhbGluZyBieSBzb21lIG9m
IHRoZSBnYW1pbmcgY29tbXVuaXRpZXMsIHdoaWNoIGNhbiBiZQ0KPj4gZm91bmQgaGVyZToNCj4+
IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjYxNzUvDQo+Pg0KPj4g
U2lnbmVkLW9mZi1ieTogU2hhc2hhbmsgU2hhcm1hIDxzaGFzaGFuay5zaGFybWFAaW50ZWwuY29t
Pg0KPj4gLS0tDQo+PiAgZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfdWFwaS5jIHwgIDQgKysr
Kw0KPj4gIGluY2x1ZGUvZHJtL2RybV9jcnRjLmggICAgICAgICAgICB8IDI2ICsrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+PiAgaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmggICAgIHwg
IDYgKysrKysrDQo+PiAgMyBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYw0KPj4gaW5kZXggMGQ0NjZkM2IwODA5Li44ODMzMjk0
NTNhODYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMN
Cj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYw0KPj4gQEAgLTQzNSw2
ICs0MzUsOCBAQCBzdGF0aWMgaW50IGRybV9hdG9taWNfY3J0Y19zZXRfcHJvcGVydHkoc3RydWN0
IGRybV9jcnRjICpjcnRjLA0KPj4gIAkJcmV0dXJuIHJldDsNCj4+ICAJfSBlbHNlIGlmIChwcm9w
ZXJ0eSA9PSBjb25maWctPnByb3BfdnJyX2VuYWJsZWQpIHsNCj4+ICAJCXN0YXRlLT52cnJfZW5h
YmxlZCA9IHZhbDsNCj4+ICsJfSBlbHNlIGlmIChwcm9wZXJ0eSA9PSBjb25maWctPnNjYWxpbmdf
ZmlsdGVyX3Byb3BlcnR5KSB7DQo+PiArCQlzdGF0ZS0+c2NhbGluZ19maWx0ZXIgPSB2YWw7DQo+
PiAgCX0gZWxzZSBpZiAocHJvcGVydHkgPT0gY29uZmlnLT5kZWdhbW1hX2x1dF9wcm9wZXJ0eSkg
ew0KPj4gIAkJcmV0ID0gZHJtX2F0b21pY19yZXBsYWNlX3Byb3BlcnR5X2Jsb2JfZnJvbV9pZChk
ZXYsDQo+PiAgCQkJCQkmc3RhdGUtPmRlZ2FtbWFfbHV0LA0KPj4gQEAgLTUwMyw2ICs1MDUsOCBA
QCBkcm1fYXRvbWljX2NydGNfZ2V0X3Byb3BlcnR5KHN0cnVjdCBkcm1fY3J0YyAqY3J0YywNCj4+
ICAJCSp2YWwgPSAoc3RhdGUtPmdhbW1hX2x1dCkgPyBzdGF0ZS0+Z2FtbWFfbHV0LT5iYXNlLmlk
IDogMDsNCj4+ICAJZWxzZSBpZiAocHJvcGVydHkgPT0gY29uZmlnLT5wcm9wX291dF9mZW5jZV9w
dHIpDQo+PiAgCQkqdmFsID0gMDsNCj4+ICsJZWxzZSBpZiAocHJvcGVydHkgPT0gY29uZmlnLT5z
Y2FsaW5nX2ZpbHRlcl9wcm9wZXJ0eSkNCj4+ICsJCSp2YWwgPSBzdGF0ZS0+c2NhbGluZ19maWx0
ZXI7DQo+PiAgCWVsc2UgaWYgKGNydGMtPmZ1bmNzLT5hdG9taWNfZ2V0X3Byb3BlcnR5KQ0KPj4g
IAkJcmV0dXJuIGNydGMtPmZ1bmNzLT5hdG9taWNfZ2V0X3Byb3BlcnR5KGNydGMsIHN0YXRlLCBw
cm9wZXJ0eSwgdmFsKTsNCj4+ICAJZWxzZQ0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2Ry
bV9jcnRjLmggYi9pbmNsdWRlL2RybS9kcm1fY3J0Yy5oDQo+PiBpbmRleCA1ZTliMTVhMGU4YzUu
Ljk0YzU1MDk0NzRhOCAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jcnRjLmgNCj4+
ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jcnRjLmgNCj4+IEBAIC01OCw2ICs1OCwyNSBAQCBzdHJ1
Y3QgZGV2aWNlX25vZGU7DQo+PiAgc3RydWN0IGRtYV9mZW5jZTsNCj4+ICBzdHJ1Y3QgZWRpZDsN
Cj4+ICANCj4+ICtlbnVtIGRybV9zY2FsaW5nX2ZpbHRlcnMgew0KPj4gKwlEUk1fU0NBTElOR19G
SUxURVJfREVGQVVMVCwNCj4+ICsJRFJNX1NDQUxJTkdfRklMVEVSX01FRElVTSwNCj4+ICsJRFJN
X1NDQUxJTkdfRklMVEVSX0JJTElORUFSLA0KPj4gKwlEUk1fU0NBTElOR19GSUxURVJfTk4sDQo+
IA0KPiBQbGVhc2UgdXNlIHJlYWwgd29yZHMuDQo+IA0KPj4gKwlEUk1fU0NBTElOR19GSUxURVJf
Tk5fSVNfT05MWSwNCj4gDQo+IE5vdCBhIGJpZyBmYW4gb2YgdGhpcy4gSSdkIGp1c3QgYWRkIHRo
ZSBleHBsaWNpdCBuZWFyZXN0IGZpbHRlcg0KPiBhbmQgbGVhdmUgdGhlIGRlY2lzaW9uIHdoZXRo
ZXIgdG8gdXNlIGl0IHRvIHVzZXJzcGFjZS4NCj4gDQo+PiArCURSTV9TQ0FMSU5HX0ZJTFRFUl9F
REdFX0VOSEFOQ0UsDQo+PiArCURSTV9TQ0FMSU5HX0ZJTFRFUl9JTlZBTElELA0KPiANCj4gVGhh
dCBpbnZhbGlkIGVudW0gdmFsdWUgc2VlbXMgZW50aXJlbHkgcG9pbnRsZXNzLg0KPiANCj4gVGhp
cyBzZXQgb2YgZmlsdGVycyBpcyBwcmV0dHkgYXJiaXRyYXJ5LiBJdCBkb2Vzbid0IGV2ZW4gY292
ZXIgYWxsDQo+IEludGVsIGh3LiBJIHdvdWxkIHByb2JhYmx5IGp1c3QgbGVhdmUgaXQgYXQgImRl
ZmF1bHQrbGluZWFyK25lYXJlc3QiDQo+IGluaXRpYWxseS4gRXhwb3NpbmcgbW9yZSB2YWd1ZSBo
dyBzcGVjaWZpYyBjaG9pY2VzIG5lZWRzIG1vcmUgdGhvdWdoLA0KPiBhbmQgSSdkIHByZWZlciBu
b3QgdG8gc3BlbmQgdGhvc2UgYnJhaW4gY2VsbHMgdW50aWwgYSByZWFsIHVzZSBjYXNlDQo+IGVt
ZXJnZXMuDQo+IA0KDQpGV0lXLCBBTUQgSFcgYWxsb3dzIHVzIHRvIHNwZWNpZnkgYSBudW1iZXIg
b2YgaG9yaXpvbnRhbCBhbmQgdmVydGljYWwNCnRhcHMgZm9yIHNjYWxpbmcuIE51bWJlciBvZiB0
YXBzIGFyZSBsaW1pdGVkIGJ5IG91ciBsaW5lYnVmZmVyIHNpemUuIFRoZQ0KZGVmYXVsdCBpcyA0
IGluIGVhY2ggZGltZW5zaW9uIGJ1dCB5b3UgY291bGQgaGF2ZSAyIHZfdGFwcyBhbmQgNCBoX3Rh
cHMNCmlmIHlvdXIncmUgcnVubmluZyBhIGxhcmdlIGhvcml6b250YWwgcmVzb2x1dGlvbiBvbiBz
b21lIEFTSUNzLg0KDQpJJ20gbm90IHN1cmUgaXQgbWFrZXMgc2Vuc2UgdG8gZGVmaW5lIGZpbHRl
cnMgaGVyZSB0aGF0IGFyZW4ndCB1c2VkLiBJdA0Kc291bmRzIGxpa2UgZGVmYXVsdCBhbmQgbmVh
cmVzdCBuZWlnaGJvdXIgd291bGQgc3VmZmljZSBmb3Igbm93IGluIG9yZGVyDQp0byBzdXBwb3J0
IGludGVnZXIgc2NhbGluZy4NCg0KSGFycnkNCg0KPj4gK307DQo+PiArDQo+PiArc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fcHJvcF9lbnVtX2xpc3QgZHJtX3NjYWxpbmdfZmlsdGVyX2VudW1fbGlz
dFtdID0gew0KPj4gKwl7IERSTV9TQ0FMSU5HX0ZJTFRFUl9ERUZBVUxULCAiRGVmYXVsdCIgfSwN
Cj4+ICsJeyBEUk1fU0NBTElOR19GSUxURVJfTUVESVVNLCAiTWVkaXVtIiB9LA0KPj4gKwl7IERS
TV9TQ0FMSU5HX0ZJTFRFUl9CSUxJTkVBUiwgIkJpbGluZWFyIiB9LA0KPj4gKwl7IERSTV9TQ0FM
SU5HX0ZJTFRFUl9OTiwgIk5lYXJlc3QgTmVpZ2hib3IiIH0sDQo+PiArCXsgRFJNX1NDQUxJTkdf
RklMVEVSX05OX0lTX09OTFksICJJbnRlZ2VyIE1vZGUgU2NhbGluZyIgfSwNCj4+ICsJeyBEUk1f
U0NBTElOR19GSUxURVJfSU5WQUxJRCwgIkludmFsaWQiIH0sDQo+PiArfTsNCj4+ICsNCj4+ICBz
dGF0aWMgaW5saW5lIGludDY0X3QgVTY0Mkk2NCh1aW50NjRfdCB2YWwpDQo+PiAgew0KPj4gIAly
ZXR1cm4gKGludDY0X3QpKigoaW50NjRfdCAqKSZ2YWwpOw0KPj4gQEAgLTI4Myw2ICszMDIsMTMg
QEAgc3RydWN0IGRybV9jcnRjX3N0YXRlIHsNCj4+ICAJICovDQo+PiAgCXUzMiB0YXJnZXRfdmJs
YW5rOw0KPj4gIA0KPj4gKwkvKioNCj4+ICsJICogQHNjYWxpbmdfZmlsdGVyOg0KPj4gKwkgKg0K
Pj4gKwkgKiBTY2FsaW5nIGZpbHRlciBtb2RlIHRvIGJlIGFwcGxpZWQNCj4+ICsJICovDQo+PiAr
CXUzMiBzY2FsaW5nX2ZpbHRlcjsNCj4gDQo+IFdlIGhhdmUgYW4gZW51bSBzbyBzaG91bGQgdXNl
IGl0LiBUaGUgZG9jdW1lbnRhdGlvbiBzaG91bGQgcHJvYmFibHkNCj4gcG9pbnQgb3V0IHRoYXQg
dGhpcyBhcHBsaWVzIHRvIGZ1bGwgY3J0YyBzY2FsaW5nIG9ubHksIG5vdCBwbGFuZQ0KPiBzY2Fs
aW5nLg0KPiANCj4+ICsNCj4+ICAJLyoqDQo+PiAgCSAqIEBhc3luY19mbGlwOg0KPj4gIAkgKg0K
Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oIGIvaW5jbHVkZS9k
cm0vZHJtX21vZGVfY29uZmlnLmgNCj4+IGluZGV4IDNiY2JlMzAzMzlmMC4uZWZkNmZkNTU3NzBm
IDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmgNCj4+ICsrKyBi
L2luY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oDQo+PiBAQCAtOTE0LDYgKzkxNCwxMiBAQCBz
dHJ1Y3QgZHJtX21vZGVfY29uZmlnIHsNCj4+ICAJICovDQo+PiAgCXN0cnVjdCBkcm1fcHJvcGVy
dHkgKm1vZGlmaWVyc19wcm9wZXJ0eTsNCj4+ICANCj4+ICsJLyoqDQo+PiArCSAqIEBzY2FsaW5n
X2ZpbHRlcl9wcm9wZXJ0eTogQ1JUQyBwcm9wZXJ0eSB0byBhcHBseSBhIHBhcnRpY3VsYXIgZmls
dGVyDQo+PiArCSAqIHdoaWxlIHNjYWxpbmcgaW4gcGFuZWwgZml0dGVyIG1vZGUuDQo+PiArCSAq
Lw0KPj4gKwlzdHJ1Y3QgZHJtX3Byb3BlcnR5ICpzY2FsaW5nX2ZpbHRlcl9wcm9wZXJ0eTsNCj4+
ICsNCj4+ICAJLyogY3Vyc29yIHNpemUgKi8NCj4+ICAJdWludDMyX3QgY3Vyc29yX3dpZHRoLCBj
dXJzb3JfaGVpZ2h0Ow0KPj4gIA0KPj4gLS0gDQo+PiAyLjE3LjENCj4gDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
