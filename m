Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62844F7D1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 14:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B660891A6;
	Tue, 30 Apr 2019 12:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710056.outbound.protection.outlook.com [40.107.71.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10A3891A6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 12:03:02 +0000 (UTC)
Received: from MN2PR12MB3151.namprd12.prod.outlook.com (20.178.244.80) by
 MN2PR12MB3616.namprd12.prod.outlook.com (20.178.243.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Tue, 30 Apr 2019 12:03:01 +0000
Received: from MN2PR12MB3151.namprd12.prod.outlook.com
 ([fe80::c45b:31be:3eba:6332]) by MN2PR12MB3151.namprd12.prod.outlook.com
 ([fe80::c45b:31be:3eba:6332%2]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 12:03:01 +0000
From: "Sahu, Satyajit" <Satyajit.Sahu@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] amdgpu: Query uvd handles info
Thread-Topic: [PATCH] amdgpu: Query uvd handles info
Thread-Index: AQHU/0KcnCug65nra0CSUmQZHYvUhaZUiPkAgAADlYCAAAXQgIAACGAA
Date: Tue, 30 Apr 2019 12:03:01 +0000
Message-ID: <2fb181ae-f546-b984-fca2-fc1ff88fbaaf@amd.com>
References: <20190430104904.23140-1-satyajit.sahu@amd.com>
 <ce0c18ac-0ca5-cbc3-1478-491cc93ddda5@gmail.com>
 <a3cfa926-0a85-373d-1d64-2167ede73412@amd.com>
 <3d4ef984-0f81-f7fd-da28-0a1943252af4@gmail.com>
In-Reply-To: <3d4ef984-0f81-f7fd-da28-0a1943252af4@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR0101CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::11) To MN2PR12MB3151.namprd12.prod.outlook.com
 (2603:10b6:208:d1::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.157.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bdd25777-d5ff-4866-16f0-08d6cd63cad0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3616; 
x-ms-traffictypediagnostic: MN2PR12MB3616:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB36168A0DF68A685C8ED050D3F53A0@MN2PR12MB3616.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(346002)(396003)(366004)(39860400002)(376002)(136003)(199004)(189003)(68736007)(966005)(31696002)(476003)(14444005)(6306002)(6246003)(2616005)(99286004)(486006)(256004)(64756008)(8936002)(73956011)(316002)(5660300002)(66556008)(66946007)(66446008)(81166006)(93886005)(11346002)(8676002)(6512007)(66476007)(446003)(36756003)(66574012)(97736004)(81156014)(31686004)(186003)(2501003)(102836004)(305945005)(4326008)(478600001)(26005)(25786009)(86362001)(110136005)(53936002)(53546011)(71200400001)(2906002)(6486002)(71190400001)(14454004)(6506007)(7736002)(6436002)(72206003)(66066001)(52116002)(229853002)(3846002)(6116002)(76176011)(386003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3616;
 H:MN2PR12MB3151.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rZjk6tZFoWfisBQdywjq5+zGUvjOZXxCgxzCHJwB+skibceNnYwr9+a4jIPNLZttcKWpsL6ZvP9zGe4nF4eGlvzCV80GQ22SYwVOQ/TMT3l5nGG3OkB/BVhlyg/4rwfM4ia5VHShRpN9rrvQXGcj6jBYSPARIB/LXGlIRel2YVWTBKonR5oCYN1Z7RkMoMTa+UB9omhT7pKILBcb6YQzA0hPBOhuVvEi+uQRrairmtf6F1Whogc/XaNKc8aj6pn4F2j4PRk0yRl0gi1qItmzxkJz+9hB4G/dFmeCpg3WatfnRywThOk4IXLSg+GUQyougN7ovLh4o9WGchxTREtYYjDmPuvfv5f3YagshB8fszcaszteM78EDBsuRBtd/qybL5/lEXy6LEjzyZX+2Ep9wFb8El8lKNbdCtcA94tIxHE=
Content-ID: <09D6E19A47211547A9A181D9D9644481@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdd25777-d5ff-4866-16f0-08d6cd63cad0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 12:03:01.0667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3616
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2ZOKGoLIhHxQvQHwKWe2W7e5HP4JURFXuFZ+0TJ88g=;
 b=Sfn0TJgosb/5yJI0EcE+tZQj0FbhWragLvswy7MPrUos5zZViYjGGnZF+IjvjBdKj1Y3uofNufPQBi51nsTO8FVUlDTms+keexH+0DwbaJ1tRjxqJ7cCzrxpsAj9W+9swbhcPo9u/J1shX5nrtM+XD10/h9wyveC0TYMcnwKHgQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Satyajit.Sahu@amd.com; 
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
Cc: "Sharma, Deepak" <Deepak.Sharma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiA0LzMwLzIwMTkgNTowMiBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCj4gW0NBVVRJ
T046IEV4dGVybmFsIEVtYWlsXQ0KPg0KPiBBbSAzMC4wNC4xOSB1bSAxMzoxMiBzY2hyaWViIFNh
aHUsIFNhdHlhaml0Og0KPj4gT24gNC8zMC8yMDE5IDQ6MjkgUE0sIENocmlzdGlhbiBLw7ZuaWcg
d3JvdGU6DQo+Pj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQ0KPj4+DQo+Pj4gQW0gMzAuMDQu
MTkgdW0gMTI6NTEgc2NocmllYiBTYWh1LCBTYXR5YWppdDoNCj4+Pj4gUXVlcnkgdGhlIG1heCB1
dmQgaGFuZGxlcyBhbmQgdXNlZCB1dmQgaGFuZGxlcy4NCj4+PiBOQUssIHBsZWFzZSB1c2UgdGhl
IGdlbmVyaWMgYW1kZ3B1X3F1ZXJ5X2luZm8oKSBmdW5jdGlvbiBmb3IgdGhpcy4NCj4+Pg0KPj4+
IFJlZ2FyZHMsDQo+Pj4gQ2hyaXN0aWFuLg0KPj4gQ3VycmVudGx5IGFtZGdwdV9xdWVyeV9pbmZv
IGRvZXMgbm90IHByb3ZpZGUgYW4gb3B0aW9uIHRvIHNwZWNpZnkgdGhlDQo+PiBod19pcF90eXBl
LiBGb3IgQU1ER1BVX0lORk9fTlVNX0hBTkRMRVMgdGhlIGh3X2lwX3R5cGUgbmVlZHMgdG8gYmUN
Cj4+IEFNREdQVV9IV19JUF9VVkQsIG90aGVyd2lzZSB0aGUga2VybmVsIHJldHVybnMgZXJyb3Iu
DQo+DQo+IE9rLCB0aGF0IG1ha2VzIHNlbnNlLg0KPg0KPiBCdXQgcGxlYXNlIHN0aWxsIGFkZCBh
IGdlbmVyaWMgcXVlcnkgZnVuY3Rpb24gd2hpY2ggdGFrZXMgcXVlcnkgYW5kDQo+IGh3X2lwX3R5
cGUgaW5zdGVhZCBvZiBoYXJkIGNvZGluZyB0aG9zZSB2YWx1ZXMuDQpTaG91bGQgSSBhZGQgYSBu
ZXcgcGFyYW1ldGVyIGluIGFtZGdwdV9xdWVyeV9pbmZvIG9yIGFkZCBhIG5ldyBxdWVyeV9pbmZv
Pw0KPg0KPiBCVFc6IFdoYXQgZG8geW91IG5lZWQgdGhpcyBmb3I/IFRoZSBudW1iZXIgcmV0dXJu
ZWQgaXMgcHJldHR5IHVzZWxlc3Mgb24NCj4gbmV3ZXIgaGFyZHdhcmUuDQpPbiBzdG9uZXkgY2hy
b21lYm9vayB3aGVuwqAgc2ltdWx0YW5lb3VzIHVzZWQgdXZkIGhhbmRsZXMgZXhjZWVkcyBtYXgg
DQpzdXBwb3J0ZWQgdXZkIGhhbmRsZXMsIHRoZXJlIGlzIGEgZmFpbHVyZSB3aGljaCBpcyBub3Qg
aGFuZGxlZC4gVGhhdHN3aHkgDQp0aGVyZSBpcyBhIG5lZWQgdG8gY2hlY2sgaXQgYmVmb3JlIGFs
bG9jYXRpb24gc28gdGhhdCB3ZSBjYW4gZmFsbGJhY2sgdG8gDQpzb2Z0d2FyZSBkZWNvZGluZy4N
Cj4NCj4gUmVnYXJkcywNCj4gQ2hyaXN0aWFuLg0KPg0KPj4NCj4+IFJlZ2FyZHMsDQo+Pg0KPj4g
U2F0eWFqaXQNCg0KUmVnYXJkcywNCg0KU2F0eWFqaXQNCg0KPj4NCj4+Pj4gU2lnbmVkLW9mZi1i
eTogU2F0eWFqaXQgU2FodSA8c2F0eWFqaXQuc2FodUBhbWQuY29tPg0KPj4+PiAtLS0NCj4+Pj4g
wqDCoCBhbWRncHUvYW1kZ3B1LmjCoMKgwqDCoMKgwqDCoMKgwqAgfCAxNCArKysrKysrKysrKysr
Kw0KPj4+PiDCoMKgIGFtZGdwdS9hbWRncHVfZ3B1X2luZm8uYyB8IDE1ICsrKysrKysrKysrKysr
Kw0KPj4+PiDCoMKgIDIgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKQ0KPj4+Pg0KPj4+
PiBkaWZmIC0tZ2l0IGEvYW1kZ3B1L2FtZGdwdS5oIGIvYW1kZ3B1L2FtZGdwdS5oDQo+Pj4+IGlu
ZGV4IGM0NGE0OTVhLi40MDdiNWZhZSAxMDA2NDQNCj4+Pj4gLS0tIGEvYW1kZ3B1L2FtZGdwdS5o
DQo+Pj4+ICsrKyBiL2FtZGdwdS9hbWRncHUuaA0KPj4+PiBAQCAtMTE3NCw2ICsxMTc0LDIwIEBA
IGludCBhbWRncHVfcXVlcnlfZ3B1X2luZm8oYW1kZ3B1X2RldmljZV9oYW5kbGUNCj4+Pj4gZGV2
LA0KPj4+PiDCoMKgIGludCBhbWRncHVfcXVlcnlfaW5mbyhhbWRncHVfZGV2aWNlX2hhbmRsZSBk
ZXYsIHVuc2lnbmVkIGluZm9faWQsDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgdW5zaWduZWQgc2l6ZSwgdm9pZCAqdmFsdWUpOw0KPj4+Pg0KPj4+PiArLyoq
DQo+Pj4+ICsgKiBRdWVyeSB1dmQgaGFuZGxlcyBpbmZvLg0KPj4+PiArICoNCj4+Pj4gKyAqDQo+
Pj4+ICsgKiBccGFyYW3CoMKgIGRldsKgwqDCoMKgIC0gXGMgW2luXSBEZXZpY2UgaGFuZGxlLiBT
ZWUNCj4+Pj4gI2FtZGdwdV9kZXZpY2VfaW5pdGlhbGl6ZSgpDQo+Pj4+ICsgKiBccGFyYW3CoMKg
IHNpemXCoMKgwqAgLSBcYyBbaW5dIFNpemUgb2YgdGhlIHJldHVybmVkIHZhbHVlLg0KPj4+PiAr
ICogXHBhcmFtwqDCoCB2YWx1ZcKgwqAgLSBcYyBbb3V0XSBQb2ludGVyIHRvIHRoZSByZXR1cm4g
dmFsdWUuDQo+Pj4+ICsgKg0KPj4+PiArICogXHJldHVybsKgwqAgMCBvbiBzdWNjZXNzXG4NCj4+
Pj4gKyAqwqDCoMKgwqDCoMKgwqDCoMKgIDwwIC0gTmVnYXRpdmUgUE9TSVggZXJyb3IgY29kZQ0K
Pj4+PiArICoNCj4+Pj4gKyovDQo+Pj4+ICtpbnQgYW1kZ3B1X3F1ZXJ5X3V2ZF9oYW5kbGVzKGFt
ZGdwdV9kZXZpY2VfaGFuZGxlIGRldiwNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBzaXplLCB2b2lkICp2YWx1ZSk7DQo+Pj4+IMKgwqAg
LyoqDQo+Pj4+IMKgwqDCoCAqIFF1ZXJ5IGhhcmR3YXJlIG9yIGRyaXZlciBpbmZvcm1hdGlvbi4N
Cj4+Pj4gwqDCoMKgICoNCj4+Pj4gZGlmZiAtLWdpdCBhL2FtZGdwdS9hbWRncHVfZ3B1X2luZm8u
YyBiL2FtZGdwdS9hbWRncHVfZ3B1X2luZm8uYw0KPj4+PiBpbmRleCA3NzcwODdmMi4uMjUzYzRk
YTcgMTAwNjQ0DQo+Pj4+IC0tLSBhL2FtZGdwdS9hbWRncHVfZ3B1X2luZm8uYw0KPj4+PiArKysg
Yi9hbWRncHUvYW1kZ3B1X2dwdV9pbmZvLmMNCj4+Pj4gQEAgLTQ0LDYgKzQ0LDIxIEBAIGRybV9w
dWJsaWMgaW50DQo+Pj4+IGFtZGdwdV9xdWVyeV9pbmZvKGFtZGdwdV9kZXZpY2VfaGFuZGxlIGRl
diwgdW5zaWduZWQgaW5mb19pZCwNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplb2Yoc3RydWN0IGRybV9hbWRncHVfaW5m
bykpOw0KPj4+PiDCoMKgIH0NCj4+Pj4NCj4+Pj4gK2RybV9wdWJsaWMgaW50IGFtZGdwdV9xdWVy
eV91dmRfaGFuZGxlcyhhbWRncHVfZGV2aWNlX2hhbmRsZSBkZXYsDQo+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgdW5zaWduZWQgc2l6ZSwgdm9pZCAqdmFsdWUpDQo+Pj4+ICt7DQo+Pj4+ICvC
oMKgwqDCoCBzdHJ1Y3QgZHJtX2FtZGdwdV9pbmZvIHJlcXVlc3Q7DQo+Pj4+ICsNCj4+Pj4gK8Kg
wqDCoMKgIG1lbXNldCgmcmVxdWVzdCwgMCwgc2l6ZW9mKHJlcXVlc3QpKTsNCj4+Pj4gK8KgwqDC
oMKgIHJlcXVlc3QucmV0dXJuX3BvaW50ZXIgPSAodWludHB0cl90KXZhbHVlOw0KPj4+PiArwqDC
oMKgwqAgcmVxdWVzdC5yZXR1cm5fc2l6ZSA9IHNpemU7DQo+Pj4+ICvCoMKgwqDCoCByZXF1ZXN0
LnF1ZXJ5ID0gQU1ER1BVX0lORk9fTlVNX0hBTkRMRVM7DQo+Pj4+ICvCoMKgwqDCoCByZXF1ZXN0
LnF1ZXJ5X2h3X2lwLnR5cGUgPSBBTURHUFVfSFdfSVBfVVZEOw0KPj4+PiArDQo+Pj4+ICvCoMKg
wqDCoCByZXR1cm4gZHJtQ29tbWFuZFdyaXRlKGRldi0+ZmQsIERSTV9BTURHUFVfSU5GTywgJnJl
cXVlc3QsDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc2l6ZW9mKHN0cnVjdCBkcm1fYW1kZ3B1X2luZm8pKTsNCj4+Pj4gK30NCj4+
Pj4gKw0KPj4+PiDCoMKgIGRybV9wdWJsaWMgaW50IGFtZGdwdV9xdWVyeV9jcnRjX2Zyb21faWQo
YW1kZ3B1X2RldmljZV9oYW5kbGUgZGV2LA0KPj4+PiB1bnNpZ25lZCBpZCwNCj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGludDMyX3QgKnJlc3VsdCkNCj4+Pj4gwqDCoCB7DQo+PiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPj4gZHJpLWRldmVsIG1h
aWxpbmcgbGlzdA0KPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwNCj4NCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
