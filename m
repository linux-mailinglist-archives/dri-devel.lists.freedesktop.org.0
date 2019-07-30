Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBA67A768
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 14:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8748999A;
	Tue, 30 Jul 2019 12:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770049.outbound.protection.outlook.com [40.107.77.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A0B8999A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 12:00:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lU9JquSgjglDtCisbyuZkdkzDjL9wGNz4+9VipwGwjtMldNke+XuhCUBdUo5DqLaPvWef5cOB+ILQ9FhI6rVeUCmtH6Pn0K/8f2p8Od7dYYg+aruH/BQ9epfGRwroOueS09WIgRlfLUnuRQHRzt9UtJeN+cAL2sCAMecgAqWYs1k+4aRiDAH4j6E4diomv4T1/ZTr9gYrO0HgSqcu9fwb9YD2RyvWfO8UuXojbruDm9xorh0nlUIzhWruLYUsmnr4rYYy5iJ5GDIyz8oNgFRXeVaI+OP6fkjH3DRbQg+iuTtRuNFbEnUKlOpOwmk9MT8ceUG2Jv3XZxrCyoHszZaaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yFtFZ92VRg6wlrI9YvwWXdrL4FI55AmJP9W/xngdWQ=;
 b=Pof1w5WgobFKrvK3T3NLxLSChwHzn/JV7WcHhHZ8ss9ZrvdLrKUuNh/nKcaCnA0Unp1yPe7vYIEWf1WbfduYTUMOolkIrFHgk06dLfixI70LAMufnDNQH5b7fwPuu1GGLfj1ty28AomlfMl5i9hzNek+K2CFo6f2Bb13j3wu805Oh+s9HvH6xwYUQ0NEUQIZYInTLI4CTh80qg1qDwKOwbFn3JgoNTxszt0oOxrvDQ7QN0ZED+420YTNLOGD0DLuN8gUZ7phTTrCyEEipHOkva1I2SiF+3nrzcCWOk/FTTKHRNw1WGRB7DbkIdkcwiO3+XD37W4k9JrqAu92xUnnAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1530.namprd12.prod.outlook.com (10.172.34.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 30 Jul 2019 12:00:49 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::9ddf:934:8155:a6ff]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::9ddf:934:8155:a6ff%2]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 12:00:49 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/syncobj: extend syncobj query ability
Thread-Topic: [PATCH] drm/syncobj: extend syncobj query ability
Thread-Index: AQHVQRbEyHnuqkVmP0qybSCa+o89TqbYOzmAgAACgYCAAABUgIAK3JiA
Date: Tue, 30 Jul 2019 12:00:49 +0000
Message-ID: <c39156ea-2393-826a-145e-3cd0a28c705d@amd.com>
References: <20190723052257.14436-1-david1.zhou@amd.com>
 <1946e636-7c21-7456-3824-72a98c7305a4@amd.com>
 <d9ecceda-0ce2-341b-3f42-9202be302772@amd.com>
 <adca21ee-24cc-7f66-ff96-59973d40051d@amd.com>
In-Reply-To: <adca21ee-24cc-7f66-ff96-59973d40051d@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0039.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::27) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6258f10-dd39-465c-f1ee-08d714e58fe3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1530; 
x-ms-traffictypediagnostic: DM5PR12MB1530:
x-microsoft-antispam-prvs: <DM5PR12MB1530285599724EBE3A6D01AD83DC0@DM5PR12MB1530.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(189003)(199004)(66446008)(476003)(66946007)(64126003)(11346002)(99286004)(64756008)(256004)(81156014)(316002)(65956001)(66476007)(66556008)(53936002)(2616005)(5660300002)(446003)(71200400001)(71190400001)(6512007)(486006)(8936002)(65826007)(86362001)(102836004)(36756003)(65806001)(386003)(76176011)(81166006)(6486002)(6506007)(52116002)(229853002)(6116002)(68736007)(478600001)(6436002)(8676002)(2906002)(31696002)(31686004)(305945005)(7736002)(25786009)(58126008)(110136005)(6246003)(4326008)(14454004)(186003)(2501003)(46003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1530;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IIvYkqed2ZvK+5pyBZ1WQCnZwChIm3C1oxVnRJA/qt7l1mSHsphTFAZE5YG7GzffjVFpmXrHEscDT82K1ElP+n+z6E1I32jMfq4wP8lYHGIxZdVS2WBOie9rYZmldqG5ssiANWs3nbrULcf40soONErXur3h8I08RFTUD19Bey/Ycxx0fWG+clkBdp21vIGgrUZA0Z+EBbb6MfIK7GO9BMBNvIJaBQbihtjN1XUhAsh5hQy1uPRHQ31n4Tc5S7PbUQhSRdlBAQ2dxgsgwbl1FU0n+ACgDfJK5rYgq9RKkXXwEbfamLyw6/KTvnVLGZPKiHs9hkWQ8K1EcV0F2WeuYbZmlakWZiWXScz7SPjJ9pJLXr7iha3FHqC+HCPVXZeaOrxvSz6pIwnKPRii8wFBOC5CLY/qRz84aXMmbNXKLHo=
Content-ID: <3922DEEACD25E64A87854C9875606653@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6258f10-dd39-465c-f1ee-08d714e58fe3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 12:00:49.2332 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1530
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yFtFZ92VRg6wlrI9YvwWXdrL4FI55AmJP9W/xngdWQ=;
 b=Kwg4VOvuDUo+4wyyLE9AsB6uKy0PoE6LuOOVZkCup5rOMZQAWTgRYa1/LTfPjUSYPG3uJQOsiK4kYH6VzdIcvmqi6ZaONG3FT5sCyoV3e/+dRLorksTLKNnmqT2BiB2B7S6Ca2fFtSi2lGk3x9GCpZrzbwtw+87zvFoBa96WF8o=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjMuMDcuMTkgdW0gMTY6MDggc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0KPiBBbSAyMy4w
Ny4xOSB1bSAxNjowNyBzY2hyaWViIFpob3UsIERhdmlkKENodW5NaW5nKToNCj4+IOWcqCAyMDE5
LzcvMjMgMjE6NTgsIEtvZW5pZywgQ2hyaXN0aWFuIOWGmemBkzoNCj4+PiBBbSAyMy4wNy4xOSB1
bSAwNzoyMiBzY2hyaWViIENodW5taW5nIFpob3U6DQo+Pj4+IHVzZXIgc3BhY2UgbmVlZHMgYSBm
bGV4aWFibGUgcXVlcnkgYWJpbGl0eS4NCj4+Pj4gU28gdGhhdCB1bWQgY2FuIGdldCBsYXN0IHNp
Z25hbGVkIG9yIHN1Ym1pdHRlZCBwb2ludC4NCj4+Pj4NCj4+Pj4gQ2hhbmdlLUlkOiBJNjUxMmI0
MzA1MjRlYmFiZTcxNWU2MDJhMmJmNWFiYjBhN2U3ODBlYQ0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBD
aHVubWluZyBaaG91IDxkYXZpZDEuemhvdUBhbWQuY29tPg0KPj4+PiBDYzogTGlvbmVsIExhbmR3
ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPg0KPj4+PiBDYzogQ2hyaXN0aWFu
IEvDtm5pZyA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KPj4+IEkndmUgcmVjZW50bHkgZm91
bmQgYSBidWcgaW4gZHJtX3N5bmNvYmpfcXVlcnlfaW9jdGwoKSB3aGljaCBJJ20gZ29pbmcNCj4+
PiB0byBjb21taXQgdG9tb3Jyb3cuDQo+PiBZZXMsIEkndmUgcmVhbGl6ZWQuIExvaW5lbCBoYXMg
cHV0IFJCIG9uIGl0Lg0KPj4NCj4+DQo+Pj4gQXBhcnQgZnJvbSB0aGF0IGl0IGxvb2tzIGdvb2Qg
dG8gbWUsDQo+PiBUaGFua3MsDQo+Pg0KPj4NCj4+PiDCoMKgIGJ1dCBJIHRoaW5rIHdlIHNob3Vs
ZCBjbGVhbnVwIGEgYml0DQo+Pj4gYW5kIG1vdmUgdGhlIGRtYV9mZW5jZV9jaGFpbl9mb3JfZWFj
aCgpLi4uIGludG8gYSBoZWxwZXIgZnVuY3Rpb24gaW4NCj4+PiBkbWEtZmVuY2UtY2hhaW4uYw0K
Pj4gRG8geW91IG1pbmQgYSBzYXBlcmF0ZSBjbGVhbnVwIHBhdGNoIGZvciB0aGF0PyBJIGRvbid0
IHdhbnQgdG8gdG91Y2gNCj4+IGtlcm5lbCBkaXJlY3RvcnkgaW4gdGhpcyBwYXRjaCwgc28gdGhh
dCB3ZSBjYW4gY2hlcnJ5LXBpY2sgaXQgZWFzaWx5Lg0KPg0KPiBZZWFoLCB3b3JrcyBmb3IgbWUg
YXMgd2VsbC4NCg0KU29ycnkgdGhpcyBnb3QgZGVsYXllZCBhIGJpdC4gSSd2ZSBqdXN0IHB1c2hl
ZCBteSBmaXggdG8gZHJtLW1pc2MtbmV4dCANCmFuZCBhbWQtc3RhZ2luZy1kcm0tbmV4dC4NCg0K
Q2FuIHlvdSByZWJhc2UgYW5kIHNlbmQgdGhpcyBvbmUgb3V0IGFnYWluPyBHb2luZyB0byBwdXNo
IGl0IHRvIA0KZHJtLW1pc2MtbmV4dCB0aGVuLg0KDQpDaHJpc3RpYW4uDQoNCj4NCj4gQ2hyaXN0
aWFuLg0KPg0KPj4NCj4+DQo+PiAtRGF2aWQNCj4+DQo+Pj4gQ2hyaXN0aWFuLg0KPj4+DQo+Pj4+
IC0tLQ0KPj4+PiDCoMKgwqAgZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMgfCAzNiANCj4+
Pj4gKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0NCj4+Pj4gwqDCoMKgIGluY2x1
ZGUvdWFwaS9kcm0vZHJtLmjCoMKgwqDCoMKgwqDCoCB8wqAgMyArKy0NCj4+Pj4gwqDCoMKgIDIg
ZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pDQo+Pj4+DQo+
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyANCj4+Pj4gYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYw0KPj4+PiBpbmRleCAzZDQwMDkwNTEwMGIuLmY3
MGRlZGYzZWY0ZiAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2Jq
LmMNCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMNCj4+Pj4gQEAgLTEx
OTcsOSArMTE5Nyw2IEBAIGRybV9zeW5jb2JqX3RpbWVsaW5lX3NpZ25hbF9pb2N0bChzdHJ1Y3Qg
DQo+Pj4+IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwNCj4+Pj4gwqDCoMKgwqDCoMKgwqAg
aWYgKCFkcm1fY29yZV9jaGVja19mZWF0dXJlKGRldiwgRFJJVkVSX1NZTkNPQkpfVElNRUxJTkUp
KQ0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU9QTk9UU1VQUDsNCj4+Pj4g
wqDCoMKgIC3CoMKgwqAgaWYgKGFyZ3MtPnBhZCAhPSAwKQ0KPj4+PiAtwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIC1FSU5WQUw7DQo+Pj4+IC0NCj4+Pj4gwqDCoMKgwqDCoMKgwqAgaWYgKGFyZ3MtPmNv
dW50X2hhbmRsZXMgPT0gMCkNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJ
TlZBTDsNCj4+Pj4gwqDCoMKgIEBAIC0xMjY4LDkgKzEyNjUsNiBAQCBpbnQgZHJtX3N5bmNvYmpf
cXVlcnlfaW9jdGwoc3RydWN0IA0KPj4+PiBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+
Pj4+IMKgwqDCoMKgwqDCoMKgIGlmICghZHJtX2NvcmVfY2hlY2tfZmVhdHVyZShkZXYsIERSSVZF
Ul9TWU5DT0JKX1RJTUVMSU5FKSkNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
LUVPUE5PVFNVUFA7DQo+Pj4+IMKgwqDCoCAtwqDCoMKgIGlmIChhcmdzLT5wYWQgIT0gMCkNCj4+
Pj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOw0KPj4+PiAtDQo+Pj4+IMKgwqDCoMKg
wqDCoMKgIGlmIChhcmdzLT5jb3VudF9oYW5kbGVzID09IDApDQo+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7DQo+Pj4+IMKgwqDCoCBAQCAtMTI5MSwyMyArMTI4NSwy
OSBAQCBpbnQgZHJtX3N5bmNvYmpfcXVlcnlfaW9jdGwoc3RydWN0IA0KPj4+PiBkcm1fZGV2aWNl
ICpkZXYsIHZvaWQgKmRhdGEsDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGNoYWlu
KSB7DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZG1hX2ZlbmNl
ICppdGVyLCAqbGFzdF9zaWduYWxlZCA9IE5VTEw7DQo+Pj4+IMKgwqDCoCAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBkbWFfZmVuY2VfY2hhaW5fZm9yX2VhY2goaXRlciwgZmVuY2UpIHsNCj4+Pj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIWl0ZXIpDQo+Pj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+Pj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfZmVuY2VfcHV0KGxhc3Rfc2lnbmFsZWQpOw0KPj4+PiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxhc3Rfc2lnbmFsZWQgPSBkbWFfZmVuY2Vf
Z2V0KGl0ZXIpOw0KPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghdG9f
ZG1hX2ZlbmNlX2NoYWluKGxhc3Rfc2lnbmFsZWQpLT5wcmV2X3NlcW5vKQ0KPj4+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogSXQgaXMgbW9zdCBsaWtlbHkgdGhh
dCB0aW1lbGluZSBoYXMNCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgKiB1bm9yZGVyIHBvaW50cy4gKi8NCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
YXJncy0+ZmxhZ3MgJg0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIERSTV9T
WU5DT0JKX1FVRVJZX0ZMQUdTX0xBU1RfU1VCTUlUVEVEKSB7DQo+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcG9pbnQgPSBmZW5jZS0+c2Vxbm87DQo+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIH0gZWxzZSB7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZG1hX2ZlbmNlX2NoYWluX2Zvcl9lYWNoKGl0ZXIsIGZlbmNlKSB7DQo+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIWl0ZXIpDQo+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0KPj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX2ZlbmNlX3B1dChsYXN0X3Np
Z25hbGVkKTsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxh
c3Rfc2lnbmFsZWQgPSBkbWFfZmVuY2VfZ2V0KGl0ZXIpOw0KPj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgDQo+Pj4+ICghdG9fZG1hX2ZlbmNlX2NoYWluKGxh
c3Rfc2lnbmFsZWQpLT5wcmV2X3NlcW5vKQ0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBJdCBpcyBtb3N0IGxpa2VseSB0aGF0IHRpbWVsaW5l
IGhhcw0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAqIHVub3JkZXIgcG9pbnRzLiAqLw0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB9DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG9pbnQgPSBk
bWFfZmVuY2VfaXNfc2lnbmFsZWQobGFzdF9zaWduYWxlZCkgPw0KPj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGFzdF9zaWduYWxlZC0+c2Vxbm8gOg0KPj4+PiAr
IHRvX2RtYV9mZW5jZV9jaGFpbihsYXN0X3NpZ25hbGVkKS0+cHJldl9zZXFubzsNCj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcG9pbnQgPSBkbWFfZmVuY2VfaXNfc2lnbmFsZWQobGFzdF9zaWduYWxlZCkgPw0KPj4+PiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxhc3Rfc2lnbmFsZWQtPnNlcW5vIDoNCj4+
Pj4gLSB0b19kbWFfZmVuY2VfY2hhaW4obGFzdF9zaWduYWxlZCktPnByZXZfc2Vxbm87DQo+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfZmVuY2VfcHV0KGxhc3Rfc2lnbmFs
ZWQpOw0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7DQo+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwb2ludCA9IDA7DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfQ0KPj4+PiArwqDCoMKgwqDCoMKgwqAgZG1hX2ZlbmNlX3B1dChmZW5jZSk7DQo+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gY29weV90b191c2VyKCZwb2ludHNbaV0sICZw
b2ludCwgc2l6ZW9mKHVpbnQ2NF90KSk7DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
ID0gcmV0ID8gLUVGQVVMVCA6IDA7DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJl
dCkNCj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtLmggYi9pbmNsdWRlL3Vh
cGkvZHJtL2RybS5oDQo+Pj4+IGluZGV4IDY2MWQ3M2Y5YTkxOS4uZmQ5ODdjZTI0ZDlmIDEwMDY0
NA0KPj4+PiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2RybS5oDQo+Pj4+ICsrKyBiL2luY2x1ZGUv
dWFwaS9kcm0vZHJtLmgNCj4+Pj4gQEAgLTc3NywxMSArNzc3LDEyIEBAIHN0cnVjdCBkcm1fc3lu
Y29ial9hcnJheSB7DQo+Pj4+IMKgwqDCoMKgwqDCoMKgIF9fdTMyIHBhZDsNCj4+Pj4gwqDCoMKg
IH07DQo+Pj4+IMKgwqDCoCArI2RlZmluZSBEUk1fU1lOQ09CSl9RVUVSWV9GTEFHU19MQVNUX1NV
Qk1JVFRFRCAoMSA8PCAwKSAvKiANCj4+Pj4gbGFzdCBhdmFpbGFibGUgcG9pbnQgb24gdGltZWxp
bmUgc3luY29iaiAqLw0KPj4+PiDCoMKgwqAgc3RydWN0IGRybV9zeW5jb2JqX3RpbWVsaW5lX2Fy
cmF5IHsNCj4+Pj4gwqDCoMKgwqDCoMKgwqAgX191NjQgaGFuZGxlczsNCj4+Pj4gwqDCoMKgwqDC
oMKgwqAgX191NjQgcG9pbnRzOw0KPj4+PiDCoMKgwqDCoMKgwqDCoCBfX3UzMiBjb3VudF9oYW5k
bGVzOw0KPj4+PiAtwqDCoMKgIF9fdTMyIHBhZDsNCj4+Pj4gK8KgwqDCoCBfX3UzMiBmbGFnczsN
Cj4+Pj4gwqDCoMKgIH07DQo+DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
