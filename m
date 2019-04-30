Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3201F525
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 13:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92DE789157;
	Tue, 30 Apr 2019 11:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700075.outbound.protection.outlook.com [40.107.70.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134A289157
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 11:12:14 +0000 (UTC)
Received: from MN2PR12MB3151.namprd12.prod.outlook.com (20.178.244.80) by
 MN2PR12MB3390.namprd12.prod.outlook.com (20.178.242.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.15; Tue, 30 Apr 2019 11:12:12 +0000
Received: from MN2PR12MB3151.namprd12.prod.outlook.com
 ([fe80::c45b:31be:3eba:6332]) by MN2PR12MB3151.namprd12.prod.outlook.com
 ([fe80::c45b:31be:3eba:6332%2]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 11:12:12 +0000
From: "Sahu, Satyajit" <Satyajit.Sahu@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] amdgpu: Query uvd handles info
Thread-Topic: [PATCH] amdgpu: Query uvd handles info
Thread-Index: AQHU/0KcnCug65nra0CSUmQZHYvUhaZUiPkAgAADlYA=
Date: Tue, 30 Apr 2019 11:12:12 +0000
Message-ID: <a3cfa926-0a85-373d-1d64-2167ede73412@amd.com>
References: <20190430104904.23140-1-satyajit.sahu@amd.com>
 <ce0c18ac-0ca5-cbc3-1478-491cc93ddda5@gmail.com>
In-Reply-To: <ce0c18ac-0ca5-cbc3-1478-491cc93ddda5@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MAXPR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:49::14) To MN2PR12MB3151.namprd12.prod.outlook.com
 (2603:10b6:208:d1::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.157.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 018e2e7a-2353-4e59-7cf7-08d6cd5cb19e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3390; 
x-ms-traffictypediagnostic: MN2PR12MB3390:
x-microsoft-antispam-prvs: <MN2PR12MB339072F7D12A28D2F7891D4BF53A0@MN2PR12MB3390.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(396003)(376002)(39860400002)(136003)(189003)(199004)(8676002)(86362001)(229853002)(52116002)(11346002)(6506007)(2616005)(66066001)(31696002)(81166006)(81156014)(76176011)(53546011)(386003)(478600001)(72206003)(446003)(6512007)(99286004)(4326008)(25786009)(8936002)(6116002)(3846002)(2906002)(6246003)(66446008)(64756008)(66574012)(6486002)(66476007)(71200400001)(71190400001)(6436002)(14454004)(66556008)(73956011)(68736007)(66946007)(316002)(7736002)(5660300002)(256004)(476003)(53936002)(14444005)(305945005)(26005)(486006)(2501003)(102836004)(186003)(97736004)(36756003)(110136005)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3390;
 H:MN2PR12MB3151.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XgqpGn6UBVZ8lcvevr/xMANbOLtzWT8IQgi42w3y0c6Azp/pUJKBlG4OIRkAHBnaCX9USxxkJldQvIfg2NdLGbZ1fGjQ5gIgxfpBG1rp8k6ZKTcCk4GBZ253T0JYFM3g9soCtPPWf4Tvdoc+GBE5FI9QKx7G6tUyB1KjA+vpn9QVyY2ssPt5pYkSrI6x4fTjW+B1heR1TinKA+Zi5ss4uVOsqWw7aZafK5M2fahCpFzf4VllLrvrnwv1xHl50R0e1wsT7AgYh0+IMBPP6khfKYd2i1hHC0Eob2zSn9doPzhoIs+ZrVjBd0XjStfUl7+xfqgRiLXFiAznd5hVBq+bX9d4h3XmLmGOVQ28hbmnfsGBNn8HlxZ7NCbez4wTjTXoMVLf+j8mU3Dq3bazbVWtetHF9OOajAMjVzCnrogqlR4=
Content-ID: <536687B81295AE4781D2B2D7011F5BF9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 018e2e7a-2353-4e59-7cf7-08d6cd5cb19e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 11:12:12.2484 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3390
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPZJkxt6/n6XR9JvDKd1Yk41HG6ug2DpOd9Bt74iNhA=;
 b=GRTrLRDYrwMp2DVVs6s6C+GSAshJnqVS2IZ0e2d815tfu3XEgI45dM0ct92+pi6ZmNevhwywYg+ay5A2SgoDiirf9x3kulm2vstjWtNf8znDsmMfxaQCxO9YWm9VrvxqlIz+Jcie3/Vfjqz851dgU/+s+5OAaCMD9pgrAmkdmuw=
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

DQpPbiA0LzMwLzIwMTkgNDoyOSBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCj4gW0NBVVRJ
T046IEV4dGVybmFsIEVtYWlsXQ0KPg0KPiBBbSAzMC4wNC4xOSB1bSAxMjo1MSBzY2hyaWViIFNh
aHUsIFNhdHlhaml0Og0KPj4gUXVlcnkgdGhlIG1heCB1dmQgaGFuZGxlcyBhbmQgdXNlZCB1dmQg
aGFuZGxlcy4NCj4NCj4gTkFLLCBwbGVhc2UgdXNlIHRoZSBnZW5lcmljIGFtZGdwdV9xdWVyeV9p
bmZvKCkgZnVuY3Rpb24gZm9yIHRoaXMuDQo+DQo+IFJlZ2FyZHMsDQo+IENocmlzdGlhbi4NCg0K
Q3VycmVudGx5IGFtZGdwdV9xdWVyeV9pbmZvIGRvZXMgbm90IHByb3ZpZGUgYW4gb3B0aW9uIHRv
IHNwZWNpZnkgdGhlIA0KaHdfaXBfdHlwZS4gRm9yIEFNREdQVV9JTkZPX05VTV9IQU5ETEVTIHRo
ZSBod19pcF90eXBlIG5lZWRzIHRvIGJlIA0KQU1ER1BVX0hXX0lQX1VWRCwgb3RoZXJ3aXNlIHRo
ZSBrZXJuZWwgcmV0dXJucyBlcnJvci4NCg0KUmVnYXJkcywNCg0KU2F0eWFqaXQNCg0KPg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IFNhdHlhaml0IFNhaHUgPHNhdHlhaml0LnNhaHVAYW1kLmNvbT4N
Cj4+IC0tLQ0KPj4gwqAgYW1kZ3B1L2FtZGdwdS5owqDCoMKgwqDCoMKgwqDCoMKgIHwgMTQgKysr
KysrKysrKysrKysNCj4+IMKgIGFtZGdwdS9hbWRncHVfZ3B1X2luZm8uYyB8IDE1ICsrKysrKysr
KysrKysrKw0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL2FtZGdwdS9hbWRncHUuaCBiL2FtZGdwdS9hbWRncHUuaA0KPj4gaW5kZXgg
YzQ0YTQ5NWEuLjQwN2I1ZmFlIDEwMDY0NA0KPj4gLS0tIGEvYW1kZ3B1L2FtZGdwdS5oDQo+PiAr
KysgYi9hbWRncHUvYW1kZ3B1LmgNCj4+IEBAIC0xMTc0LDYgKzExNzQsMjAgQEAgaW50IGFtZGdw
dV9xdWVyeV9ncHVfaW5mbyhhbWRncHVfZGV2aWNlX2hhbmRsZSANCj4+IGRldiwNCj4+IMKgIGlu
dCBhbWRncHVfcXVlcnlfaW5mbyhhbWRncHVfZGV2aWNlX2hhbmRsZSBkZXYsIHVuc2lnbmVkIGlu
Zm9faWQsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25l
ZCBzaXplLCB2b2lkICp2YWx1ZSk7DQo+Pg0KPj4gKy8qKg0KPj4gKyAqIFF1ZXJ5IHV2ZCBoYW5k
bGVzIGluZm8uDQo+PiArICoNCj4+ICsgKg0KPj4gKyAqIFxwYXJhbcKgwqAgZGV2wqDCoMKgwqAg
LSBcYyBbaW5dIERldmljZSBoYW5kbGUuIFNlZSANCj4+ICNhbWRncHVfZGV2aWNlX2luaXRpYWxp
emUoKQ0KPj4gKyAqIFxwYXJhbcKgwqAgc2l6ZcKgwqDCoCAtIFxjIFtpbl0gU2l6ZSBvZiB0aGUg
cmV0dXJuZWQgdmFsdWUuDQo+PiArICogXHBhcmFtwqDCoCB2YWx1ZcKgwqAgLSBcYyBbb3V0XSBQ
b2ludGVyIHRvIHRoZSByZXR1cm4gdmFsdWUuDQo+PiArICoNCj4+ICsgKiBccmV0dXJuwqDCoCAw
IG9uIHN1Y2Nlc3Ncbg0KPj4gKyAqwqDCoMKgwqDCoMKgwqDCoMKgIDwwIC0gTmVnYXRpdmUgUE9T
SVggZXJyb3IgY29kZQ0KPj4gKyAqDQo+PiArKi8NCj4+ICtpbnQgYW1kZ3B1X3F1ZXJ5X3V2ZF9o
YW5kbGVzKGFtZGdwdV9kZXZpY2VfaGFuZGxlIGRldiwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgc2l6ZSwgdm9pZCAqdmFsdWUpOw0KPj4g
wqAgLyoqDQo+PiDCoMKgICogUXVlcnkgaGFyZHdhcmUgb3IgZHJpdmVyIGluZm9ybWF0aW9uLg0K
Pj4gwqDCoCAqDQo+PiBkaWZmIC0tZ2l0IGEvYW1kZ3B1L2FtZGdwdV9ncHVfaW5mby5jIGIvYW1k
Z3B1L2FtZGdwdV9ncHVfaW5mby5jDQo+PiBpbmRleCA3NzcwODdmMi4uMjUzYzRkYTcgMTAwNjQ0
DQo+PiAtLS0gYS9hbWRncHUvYW1kZ3B1X2dwdV9pbmZvLmMNCj4+ICsrKyBiL2FtZGdwdS9hbWRn
cHVfZ3B1X2luZm8uYw0KPj4gQEAgLTQ0LDYgKzQ0LDIxIEBAIGRybV9wdWJsaWMgaW50IA0KPj4g
YW1kZ3B1X3F1ZXJ5X2luZm8oYW1kZ3B1X2RldmljZV9oYW5kbGUgZGV2LCB1bnNpZ25lZCBpbmZv
X2lkLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgc2l6ZW9mKHN0cnVjdCBkcm1fYW1kZ3B1X2luZm8pKTsNCj4+IMKgIH0NCj4+DQo+
PiArZHJtX3B1YmxpYyBpbnQgYW1kZ3B1X3F1ZXJ5X3V2ZF9oYW5kbGVzKGFtZGdwdV9kZXZpY2Vf
aGFuZGxlIGRldiwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgc2l6ZSwgdm9p
ZCAqdmFsdWUpDQo+PiArew0KPj4gK8KgwqDCoMKgIHN0cnVjdCBkcm1fYW1kZ3B1X2luZm8gcmVx
dWVzdDsNCj4+ICsNCj4+ICvCoMKgwqDCoCBtZW1zZXQoJnJlcXVlc3QsIDAsIHNpemVvZihyZXF1
ZXN0KSk7DQo+PiArwqDCoMKgwqAgcmVxdWVzdC5yZXR1cm5fcG9pbnRlciA9ICh1aW50cHRyX3Qp
dmFsdWU7DQo+PiArwqDCoMKgwqAgcmVxdWVzdC5yZXR1cm5fc2l6ZSA9IHNpemU7DQo+PiArwqDC
oMKgwqAgcmVxdWVzdC5xdWVyeSA9IEFNREdQVV9JTkZPX05VTV9IQU5ETEVTOw0KPj4gK8KgwqDC
oMKgIHJlcXVlc3QucXVlcnlfaHdfaXAudHlwZSA9IEFNREdQVV9IV19JUF9VVkQ7DQo+PiArDQo+
PiArwqDCoMKgwqAgcmV0dXJuIGRybUNvbW1hbmRXcml0ZShkZXYtPmZkLCBEUk1fQU1ER1BVX0lO
Rk8sICZyZXF1ZXN0LA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzaXplb2Yoc3RydWN0IGRybV9hbWRncHVfaW5mbykpOw0KPj4gK30N
Cj4+ICsNCj4+IMKgIGRybV9wdWJsaWMgaW50IGFtZGdwdV9xdWVyeV9jcnRjX2Zyb21faWQoYW1k
Z3B1X2RldmljZV9oYW5kbGUgZGV2LCANCj4+IHVuc2lnbmVkIGlkLA0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpbnQzMl90ICpyZXN1bHQpDQo+PiDCoCB7DQo+DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
