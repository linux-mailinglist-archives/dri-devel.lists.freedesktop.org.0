Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E9036362
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 20:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1903F895CA;
	Wed,  5 Jun 2019 18:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720067.outbound.protection.outlook.com [40.107.72.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C92B895CA
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 18:34:38 +0000 (UTC)
Received: from BYAPR12MB3607.namprd12.prod.outlook.com (20.178.197.29) by
 BYAPR12MB2853.namprd12.prod.outlook.com (20.179.90.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Wed, 5 Jun 2019 18:34:34 +0000
Received: from BYAPR12MB3607.namprd12.prod.outlook.com
 ([fe80::c01b:198b:3529:855]) by BYAPR12MB3607.namprd12.prod.outlook.com
 ([fe80::c01b:198b:3529:855%7]) with mapi id 15.20.1965.011; Wed, 5 Jun 2019
 18:34:34 +0000
From: David Zhang <dingzhan@amd.com>
To: Sam Ravnborg <sam@ravnborg.org>, "Zhang, Dingchen (David)"
 <Dingchen.Zhang@amd.com>
Subject: Re: [PATCH 1/2] drm: not to read outside the boundary for CRC source
 name.
Thread-Topic: [PATCH 1/2] drm: not to read outside the boundary for CRC source
 name.
Thread-Index: AQHVG8G76KlbjxuOUECZo/LbOw7TYaaNVrGAgAALa4A=
Date: Wed, 5 Jun 2019 18:34:34 +0000
Message-ID: <cd1a3e0f-3e08-aad8-9c82-7e0a20d133a5@amd.com>
References: <20190605170639.8368-1-dingchen.zhang@amd.com>
 <20190605175003.GA20307@ravnborg.org>
In-Reply-To: <20190605175003.GA20307@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::32) To BYAPR12MB3607.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a80a90d5-7c15-48cd-641d-08d6e9e474ed
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2853; 
x-ms-traffictypediagnostic: BYAPR12MB2853:
x-microsoft-antispam-prvs: <BYAPR12MB285350602C166E5A91D18CCC8D160@BYAPR12MB2853.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(346002)(396003)(376002)(136003)(51914003)(199004)(189003)(6486002)(6512007)(36756003)(68736007)(478600001)(102836004)(6436002)(14444005)(26005)(53546011)(14454004)(186003)(4326008)(2906002)(25786009)(6636002)(31696002)(6246003)(229853002)(316002)(71200400001)(64756008)(72206003)(73956011)(71190400001)(6506007)(386003)(66476007)(66946007)(66446008)(66556008)(81166006)(99286004)(256004)(2616005)(5660300002)(81156014)(52116002)(3846002)(11346002)(53936002)(486006)(76176011)(7736002)(446003)(476003)(110136005)(6116002)(305945005)(31686004)(8936002)(8676002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2853;
 H:BYAPR12MB3607.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yGXoj2aLTHR2CIwE1/+3CY4yXOy+j5HhgTXhx3fJsSy1VwbXKSDtg+34K2hRpvDNuh4ket2JGkPhPvCvqISlCZ4CsZo5dRY+IL8on2Zwa3zePBJ4jKLJMtsq4TZDrlrK48L6WM2eSvcdqtJJFrjDqH0KzP/DNc0XbDjL7HM223BsvrxUIyOKRr+WzbzE7kPQbpF7VimzfdoYs8Oxk/m80dnVkwLrOJbgx+7JM7YWmiZf7VnXuvB0BPz4dIUMoRWwQNzOG7qhJhWtdGPpDaBs9KoPSxyBk/tXeLJWlw+Gt/DRnOlGg76GoIRSkFFLh5buYTNWiR+KAuaYdT6o6pUAOJ2kvcwYxIUuOgBlfA5rww7rO4gTya5dP/HfWpkBovvzVWqiDNOssWEQw6p2d7e9whuAVf23jrDl3Czuxx5cLQQ=
Content-ID: <BC5102BC6A697842B1F107B179EE3704@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a80a90d5-7c15-48cd-641d-08d6e9e474ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 18:34:34.4762 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dingzhan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2853
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgV11cnbbC8UARngP76GZTlWbYPLMQiB/+ze7FFOZP4=;
 b=Gabg+tTsLFJ40CPnppOEjQ2lH5uwqvbauIt8WXx9wyIzHqW8z618xLp+YIRbl+h1u3DvtbKW+xneGfrKflWoTm0X3Ui5BnRAN9vSXRsJoLFdWotjEqzbKBqTLlG3b9q06WeAEyQ5q0+Obv+P8FkOF46scfqNxaxWixW538OrwBE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Dingchen.Zhang@amd.com; 
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciB0aGUgcmVwbHksIFNhbS4NCg0KT24gMjAxOS0wNi0wNSAxOjUwIHAubS4sIFNh
bSBSYXZuYm9yZyB3cm90ZToNCj4gSGkgRGluZ2NoZW4uDQo+DQo+IFRoYW5rcyBmb3IgdGhlIHBh
dGNoIQ0KPg0KPiBPbiBXZWQsIEp1biAwNSwgMjAxOSBhdCAwMTowNjozOFBNIC0wNDAwLCBEaW5n
Y2hlbiBaaGFuZyB3cm90ZToNCj4+ICduLTEnIGlzIHRoZSBpbmRleCB0byBhY2Nlc3MgdGhlIGxh
c3QgY2hhcmFjdGVyIG9mIENSQyBzb3VyY2UgbmFtZS4NCj4+DQo+PiBDYzpMZW8gTGkgPHN1bnBl
bmcubGlAYW1kLmNvbT4sIEhhcnJ5IFdlbnRsYW5kPEhhcnJ5LldlbnRsYW5kQGFtZC5jb20+DQo+
IFBsZWFzZSBhZGQgb25seSBvbmUgcGVyc29uIChtYWlsIGFkZHJlc3MpIHBlciBDYzogbGluZQ0K
Pg0KPiBJIGR1bm5vIGlmIHRoaXMgaXMgYSBoYXJkIHJ1bGUsIGJ1dCB0aGlzIGlzIHdoYXQgd2Ug
YWx3YXlzIGRvLg0KPg0KPj4gU2lnbmVkLW9mZi1ieTogRGluZ2NoZW4gWmhhbmcgPGRpbmdjaGVu
LnpoYW5nQGFtZC5jb20+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2Zz
X2NyYy5jIHwgNCArKy0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVi
dWdmc19jcmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYw0KPj4gaW5kZXgg
NTg1MTY5ZjBkY2M1Li5lMjBhZGVmOWQ2MjMgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RlYnVnZnNfY3JjLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdm
c19jcmMuYw0KPj4gQEAgLTEzMSw4ICsxMzEsOCBAQCBzdGF0aWMgc3NpemVfdCBjcmNfY29udHJv
bF93cml0ZShzdHJ1Y3QgZmlsZSAqZmlsZSwgY29uc3QgY2hhciBfX3VzZXIgKnVidWYsDQo+PiAg
IAlpZiAoSVNfRVJSKHNvdXJjZSkpDQo+PiAgIAkJcmV0dXJuIFBUUl9FUlIoc291cmNlKTsNCj4+
ICAgDQo+PiAtCWlmIChzb3VyY2VbbGVuXSA9PSAnXG4nKQ0KPj4gLQkJc291cmNlW2xlbl0gPSAn
XDAnOw0KPj4gKwlpZiAoc291cmNlW2xlbi0xXSA9PSAnXG4nKQ0KPj4gKwkJc291cmNlW2xlbi0x
XSA9ICdcMCc7DQo+IEluIHRoZSBrZXJuZWwgY29kZSB3ZSBhZGQgc3BhY2VzIGFyb3VuZCBvcGVy
YXRvcnMuDQo+IFNvIHRoZSBhYm92ZSBzaG91bGQgYmU6ICBzb3VyY2VbbGVuIC0gMV0NCj4NCj4g
RGV0YWlscyBhc2lkZS4NCj4gbWVtZHVwX3VzZXJfbnVsKCkgd2hpY2ggaXMgY2FsbGVkIGd1cmFu
dGVlIHRoYXQgdGhlIGJ1ZmZlciBpcyBudWxsDQo+IHRlcm1pbmF0ZWQuIFRoZSBidWZmZXIgYWxs
b2NhdGVkIGlzIGxlbiArIDEgYW5kIHRoZSBsYXN0IGJ5dGUgaW4gdGhlDQo+IGJ1ZmZlciBpcyBz
ZXQgdG8gJ1wwJyBpbiBtZW1kdXBfdXNlcl9udWwoKS4NCj4NCj4gU28gdGhlIHJpZ2h0IGZpeCBp
cyB0byBraWxsIHRoZSB0d28gbGluZXMgc2luY2UgdGhleSBoYXZlIG5vIGVmZmVjdC4NCj4gQ291
bGQgeW91IHBsZWFzZSB2ZXJpZnkgbXkgYW5hbHlzaXMsIGFuZCBpZiB5b3UgYWdyZWUgc3VibWl0
IGEgbmV3DQo+IHBhdGNoLg0KPg0KPiBUaGFua3MsDQo+IAlTYW0NCg0KWW91IGFyZSByaWdodCB0
aGUgYnVmZmVyIGlzIG51bGwgdGVybWluYXRlZCBhdCAnbGVuKzEndGguIEhvd2V2ZXIsIHRoZSAN
CnBhdGNoIGlzIHRvIGFjdHVhbGx5IHJlbW92ZSB0aGUgbmV3IGxpbmUgY2hhcmFjdGVyLiBGb3Ig
ZXhhbXBsZSwgaWYgeW91IA0KdHlwZSAnZWNobyAiYWJjZCIgPiAvc3lzL2tlcm5lbC9kZWJ1Z2Zz
L2RyaS8wL2NydGMteC9jcmMvY29udHJvbCcgaW4gDQpkZWJ1Z2ZzLCB0aGUgJ2xlbicgaGVyZSBp
cyA1LCB3aGVyZSB0aGUgNXRoIGlzIHRoZSBuZXcgbGluZS4NCg0KSSB3aWxsIHN1Ym1pdCBhIG5l
dyBwYXRjaCB3aXRoIGEgY2xlYXIgdGl0bGUgYW5kIG1vZGlmeSB0aGUgZm9ybWF0Lg0KDQpUaGFu
a3MsDQoNCkRpbmdjaGVuDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
