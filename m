Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BC68DC84
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 19:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F156E7B0;
	Wed, 14 Aug 2019 17:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790040.outbound.protection.outlook.com [40.107.79.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE846E7AF;
 Wed, 14 Aug 2019 17:58:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvWv6+MSyiYDj6CpHjJRPQVTwrkwBhBAKsGu9GWtgh/CkI/e0ZkGS1LopMfc5fswuiqv+Fq2MuXjdajt7k0jDwboax19t21sjTqh+yFXOCadfQGsGnKdHy/45BwBmrzwuHPNfgD7HpmG2x+kR9fSmX8Rn+AFrhDuf1qY28ydVFhLXr773tCiR3VHHnGp/OoCKkhl7SVtHj1fcoewkjNU4B0kvYjZjEm37vJV9UzwBew2i4i4VrxrTT9QR8qWI+zObbCj4hpHqeQonO3dy4wzs5zWnKP98T2ma2N8DnqjHlmTyPz4htG/lNCBSGWL138iw+8HuOZ/7G/sDmoSbeAlBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CO18K8b+3oSb8PI7PC8o0O9tFPpIH4Ev+cttuUR6Fgw=;
 b=RhqxNAWWMHfcmUNY8vRDJydkIupMYSejfLXjihJPiQPJz+E+9RuoacNRlhV+V4exfzMMlEPRVflKjVbwXQBeg2pE15Ij9lfp/N4mfMZv8rOi79tN8q0fRNFjUJ1+Jbxpt8/8SEVcOGjUiZfUtoHfBdmSIkNkhddBmfeMG9eHuscA7xUoRhTeEi1sj7iQGdhO5Fo0tVv9r78pT2gqt7HOcV4+R9deb56J95gn3WfcFmd6gNmtRiufzsmBtei3INNb6/HP27NZyQwtKR8Y52RThyw0VC8HbCSLF2ZP+d7ZuWnOm3EydnCUsRwZhvYHnAMXi6phiyeB/X/hYgHoGouG8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1673.namprd12.prod.outlook.com (10.172.39.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.23; Wed, 14 Aug 2019 17:58:32 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 17:58:32 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 4/4] dma-buf: nuke reservation_object seq number
Thread-Topic: [PATCH 4/4] dma-buf: nuke reservation_object seq number
Thread-Index: AQHVUrZuW/jP5YG5PU2PfgzPaaM6dKb62S8AgAAGkQCAAASigIAABFEAgAAC0ACAAALGAA==
Date: Wed, 14 Aug 2019 17:58:32 +0000
Message-ID: <a15411cd-6ba6-5942-5d96-adb3edad8e0d@amd.com>
References: <20190807135312.1730-1-christian.koenig@amd.com>
 <20190807135312.1730-4-christian.koenig@amd.com>
 <156518744066.6198.17572013738158664135@skylake-alporthouse-com>
 <ccc20434-0380-c0b8-1ccb-1f7d9ae1a4a5@gmail.com>
 <20190814153908.GI7444@phenom.ffwll.local>
 <156580096818.2714.13643616122908209617@skylake-alporthouse-com>
 <156580237838.2301.9210706924490719639@skylake-alporthouse-com>
 <156580337387.2301.16070325716888990772@skylake-alporthouse-com>
 <156580430044.2301.14073232724312766697@skylake-alporthouse-com>
 <156580490488.2301.13016323606611473445@skylake-alporthouse-com>
In-Reply-To: <156580490488.2301.13016323606611473445@skylake-alporthouse-com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR2PR09CA0023.eurprd09.prod.outlook.com
 (2603:10a6:101:16::35) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80eeb38d-1223-4305-eeb2-08d720e1050a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1673; 
x-ms-traffictypediagnostic: DM5PR12MB1673:
x-microsoft-antispam-prvs: <DM5PR12MB1673C9E33C1C2185DF84CB2883AD0@DM5PR12MB1673.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(199004)(189003)(71190400001)(76176011)(46003)(81166006)(2616005)(6506007)(476003)(386003)(8676002)(71200400001)(58126008)(446003)(52116002)(81156014)(186003)(110136005)(316002)(53936002)(11346002)(54906003)(305945005)(65826007)(7736002)(6116002)(64126003)(5660300002)(102836004)(2906002)(8936002)(14444005)(31696002)(31686004)(66946007)(66476007)(256004)(65956001)(36756003)(65806001)(6512007)(25786009)(66446008)(6246003)(66556008)(229853002)(486006)(4326008)(99286004)(6486002)(86362001)(64756008)(6436002)(14454004)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1673;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: G/IZaqKlE4+9aZ8+vrlv0dJUn3WcZc3P0SJyEtVVl3aqMmjL0OW4udQ+3bHC0NKD2yyBSW1ImxicTUVBS1Opvp3LPLwZwThq0eiM0fqdZ8KXaC+BGSthiunrBoTr8DNzdGtsRMtoTHcEcy9Ou9AfD8op4+BH52ihvgpmMUUEFQEoWPcGMSY8qC0hhLYJBvRX3mn2fRUA9G9aNy6UJ4mGpJkZX5yI/2Gv+uiuAhfGiHMHlL1fu3A16434R+OBJR92qnO797t61jC5vp7kzmtZXtaN1kShRhAKEX2cCWfAzJeMAM2sX7dMsaw//JvQdTNjqu8a5jInbvIvGHHjUpzaI+oniPh19ui5zG93RZuVjb7kivTDxjfpHFn9QvBIycvWzTs3NiYjKZ9udQtaicTNnpKCT1KdTo/WyvmLOckPbQg=
x-ms-exchange-transport-forked: True
Content-ID: <86C84CD74399A04AA39FA8A95DEEC5C7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80eeb38d-1223-4305-eeb2-08d720e1050a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 17:58:32.2916 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y/C0MRdmCcY51QdVwDNyk3uNk0miNNMlbfinqF6lTg3JTCVrpJVwgdU7Mvciz93e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1673
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CO18K8b+3oSb8PI7PC8o0O9tFPpIH4Ev+cttuUR6Fgw=;
 b=YvbLNmONtL1891lgW9vH1zvN3rlyHSIAYEMvYzKOfXOIYIdOeB0+39sl004r/CpM8HTys3S4Izr5IDcbFLBO3dTb8iugn5eVpdYUY35nOY95UYQBn7gVeQDDgb4NcYnNzlr0yxaxcrvQm+PytmR4djQmsECZEA4ZteKjSUOhdp0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTQuMDguMTkgdW0gMTk6NDggc2NocmllYiBDaHJpcyBXaWxzb246DQo+IFF1b3RpbmcgQ2hy
aXMgV2lsc29uICgyMDE5LTA4LTE0IDE4OjM4OjIwKQ0KPj4gUXVvdGluZyBDaHJpcyBXaWxzb24g
KDIwMTktMDgtMTQgMTg6MjI6NTMpDQo+Pj4gUXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMDgt
MTQgMTg6MDY6MTgpDQo+Pj4+IFF1b3RpbmcgQ2hyaXMgV2lsc29uICgyMDE5LTA4LTE0IDE3OjQy
OjQ4KQ0KPj4+Pj4gUXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE5LTA4LTE0IDE2OjM5OjA4KQ0K
Pj4+Pj4+Pj4+ICsgICAgICAgfSB3aGlsZSAocmN1X2FjY2Vzc19wb2ludGVyKG9iai0+ZmVuY2Vf
ZXhjbCkgIT0gKmV4Y2wpOw0KPj4+Pj4+IFdoYXQgaWYgc29tZW9uZSBpcyByZWFsIGZhc3QgKGxp
a2UgcmVhbGx5IHJlYWwgZmFzdCkgYW5kIHJlY3ljbGVzIHRoZQ0KPj4+Pj4+IGV4Y2x1c2l2ZSBm
ZW5jZSBzbyB5b3UgcmVhZCB0aGUgc2FtZSBwb2ludGVyIHR3aWNlLCBidXQgZXZlcnl0aGluZyBl
bHNlDQo+Pj4+Pj4gY2hhbmdlZD8gcmV1c2VkIGZlbmNlIHBvaW50ZXIgaXMgYSBsb3QgbW9yZSBs
aWtlbHkgdGhhbiBzZXFsb2NrIHdyYXBwaW5nDQo+Pj4+Pj4gYXJvdW5kLg0KPj4+Pj4gSXQncyBh
biBleGNsdXNpdmUgZmVuY2UuIElmIGl0IGlzIHJlcGxhY2VkLCBpdCBtdXN0IGJlIGxhdGVyIHRo
YW4gYWxsDQo+Pj4+PiB0aGUgc2hhcmVkIGZlbmNlcyAoYW5kIGRlcGVuZGVudCBvbiB0aGVtIGRp
cmVjdGx5IG9yIGluZGlyZWN0bHkpLCBhbmQNCj4+Pj4+IHNvIHN0aWxsIGEgY29uc2lzdGVudCBz
bmFwc2hvdC4NCj4+Pj4gQW4gZXh0ZW5zaW9uIG9mIHRoYXQgYXJndW1lbnQgc2F5cyB3ZSBkb24n
dCBldmVuIG5lZWQgdG8gbG9vcCwNCj4+Pj4NCj4+Pj4gKmxpc3QgPSByY3VfZGVyZWZlcmVuY2Uo
b2JqLT5mZW5jZSk7DQo+Pj4+ICpzaGFyZWRfY291bnQgPSAqbGlzdCA/ICgqbGlzdCktPnNoYXJl
ZF9jb3VudCA6IDA7DQo+Pj4+IHNtcF9ybWIoKTsNCj4+Pj4gKmV4Y2wgPSByY3VfZGVyZWZlcmVu
Y2Uob2JqLT5mZW5jZV9leGNsKTsNCj4+Pj4NCj4+Pj4gR2l2ZXMgYSBjb25zaXN0ZW50IHNuYXBz
aG90LiBJdCBkb2Vzbid0IG1hdHRlciBpZiB0aGUgZmVuY2VfZXhjbCBpcw0KPj4+PiBiZWZvcmUg
b3IgYWZ0ZXIgdGhlIHNoYXJlZF9saXN0IC0tIGlmIGl0J3MgYWZ0ZXIsIGl0J3MgYSBzdXBlcnNl
dCBvZiBhbGwNCj4+Pj4gZmVuY2VzLCBpZiBpdCdzIGJlZm9yZSwgd2UgaGF2ZSBhIGNvcnJlY3Qg
bGlzdCBvZiBzaGFyZWQgZmVuY2VzIHRoZQ0KPj4+PiBlYXJsaWVyIGZlbmNlX2V4Y2wuDQo+Pj4g
VGhlIHByb2JsZW0gaXMgdGhhdCB0aGUgcG9pbnQgb2YgdGhlIGxvb3AgaXMgdGhhdCB3ZSBkbyBu
ZWVkIGEgY2hlY2sgb24NCj4+PiB0aGUgZmVuY2VzIGFmdGVyIHRoZSBmdWxsIG1lbW9yeSBiYXJy
aWVyLg0KPj4+DQo+Pj4gVGhpbmtpbmcgb2YgdGhlIHJhdGlvbmFsZSBiZWF0ZW4gb3V0IGZvciBk
bWFfZmVuY2VfZ2V0X2V4Y2xfcmN1X3NhZmUoKQ0KPj4+DQo+Pj4gV2UgZG9uJ3QgaGF2ZSBhIGZ1
bGwgbWVtb3J5IGJhcnJpZXIgaGVyZSwgc28gdGhpcyBjYW5ub3QgYmUgdXNlZCBzYWZlbHkNCj4+
PiBpbiBsaWdodCBvZiBmZW5jZSByZWFsbG9jYXRpb24uDQo+PiBpLmUuIHdlIG5lZWQgdG8gcmVz
dG9yZSB0aGUgbG9vcHMgaW4gdGhlIGNhbGxlcnMsDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9idXN5LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9nZW0vaTkxNV9nZW1fYnVzeS5jDQo+PiBpbmRleCBhMmFmZjFkODI5MGUuLmYwMTkwNjJjOGNk
NyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9idXN5
LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9idXN5LmMNCj4+
IEBAIC0xMTAsNiArMTEwLDcgQEAgaTkxNV9nZW1fYnVzeV9pb2N0bChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LCB2b2lkICpkYXRhLA0KPj4gICAgICAgICAgICogdG8gcmVwb3J0IHRoZSBvdmVyYWxs
IGJ1c3luZXNzLiBUaGlzIGlzIHdoYXQgdGhlIHdhaXQtaW9jdGwgZG9lcy4NCj4+ICAgICAgICAg
ICAqDQo+PiAgICAgICAgICAgKi8NCj4+ICtyZXRyeToNCj4+ICAgICAgICAgIGRtYV9yZXN2X2Zl
bmNlcyhvYmotPmJhc2UucmVzdiwgJmV4Y2wsICZsaXN0LCAmc2hhcmVkX2NvdW50KTsNCj4+DQo+
PiAgICAgICAgICAvKiBUcmFuc2xhdGUgdGhlIGV4Y2x1c2l2ZSBmZW5jZSB0byB0aGUgUkVBRCAq
YW5kKiBXUklURSBlbmdpbmUgKi8NCj4+IEBAIC0xMjIsNiArMTIzLDEwIEBAIGk5MTVfZ2VtX2J1
c3lfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwNCj4+ICAgICAgICAg
ICAgICAgICAgYXJncy0+YnVzeSB8PSBidXN5X2NoZWNrX3JlYWRlcihmZW5jZSk7DQo+PiAgICAg
ICAgICB9DQo+Pg0KPj4gKyAgICAgICBzbXBfcm1iKCk7DQo+PiArICAgICAgIGlmIChleGNsICE9
IHJjdV9hY2Nlc3NfcG9pbnRlcihvYmotPmJhc2UucmVzdi0+ZmVuY2VfZXhjbCkpDQo+PiArICAg
ICAgICAgICAgICAgZ290byByZXRyeTsNCj4+ICsNCj4+DQo+PiB3cmFwIHRoYXQgdXAgYXMNCj4+
DQo+PiBzdGF0aWMgaW5saW5lIGJvb2wNCj4+IGRtYV9yZXN2X2ZlbmNlc19yZXRyeShzdHJ1Y3Qg
ZG1hX3Jlc3YgKnJlc3YsIHN0cnVjdCBkbWFfZmVuY2UgKmV4Y2wpDQo+PiB7DQo+PiAgICAgICAg
ICBzbXBfcm1iKCk7DQo+PiAgICAgICAgICByZXR1cm4gZXhjbCAhPSByY3VfYWNjZXNzX3BvaW50
ZXIocmVzdi0+ZmVuY2VfZXhjbCk7DQo+PiB9DQo+IEkgZ2l2ZSB1cC4gSXQncyBub3QganVzdCB0
aGUgZmVuY2VfZXhjbCB0aGF0J3MgYW4gaXNzdWUgaGVyZS4NCj4NCj4gQW55IG9mIHRoZSBzaGFy
ZWQgZmVuY2VzIG1heSBiZSByZXBsYWNlZCBhZnRlciBkbWFfcmVzdl9mZW5jZXMoKQ0KPiBhbmQg
c28gdGhlIG9yaWdpbmFsIHNoYXJlZCBmZW5jZSBwb2ludGVyIG1heSBiZSByZWFzc2lnbmVkIChl
dmVuIHVuZGVyDQo+IFJDVSkuDQoNClllYWgsIGJ1dCB0aGlzIHNob3VsZCBiZSBoYXJtbGVzcy4g
U2VlIGZlbmNlcyBhcmUgYWx3YXlzIHJlcGxhY2VkIGVpdGhlciANCndoZW4gdGhleSBhcmUgc2ln
bmFsZWQgYW55d2F5IG9yIGJ5IGxhdGVyIGZlbmNlcyBmcm9tIHRoZSBzYW1lIGNvbnRleHQuDQoN
CkFuZCBleGlzdGluZyBmZW5jZXMgc2hvdWxkbid0IGJlIHJlLXVzZWQgd2hpbGUgdW5kZXIgUkNV
LCBvciBpcyBhbnlib2R5IA0Kc3RpbGwgdXNpbmcgU0xBQl9UWVBFU0FGRV9CWV9SQ1U/DQoNCkNo
cmlzdGlhbi4NCg0KPiAgIFRoZSBvbmx5IGRlZmVuc2UgYWdhaW5zdCB0aGF0IGlzIHRoZSBzZXFj
b3VudC4NCj4NCj4gSSB0b3RhbGx5IHNjcmV3ZWQgdGhhdCB1cC4NCj4gLUNocmlzDQoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
