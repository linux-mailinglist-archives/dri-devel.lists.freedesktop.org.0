Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA124ED0D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 18:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D43A6E8F3;
	Fri, 21 Jun 2019 16:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770059.outbound.protection.outlook.com [40.107.77.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26CC6E8F3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 16:21:16 +0000 (UTC)
Received: from DM6PR12MB3561.namprd12.prod.outlook.com (20.178.199.24) by
 DM6PR12MB2713.namprd12.prod.outlook.com (20.176.116.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Fri, 21 Jun 2019 16:15:26 +0000
Received: from DM6PR12MB3561.namprd12.prod.outlook.com
 ([fe80::adb2:1a25:8c09:e73d]) by DM6PR12MB3561.namprd12.prod.outlook.com
 ([fe80::adb2:1a25:8c09:e73d%5]) with mapi id 15.20.1987.014; Fri, 21 Jun 2019
 16:15:26 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Zhang, Dingchen (David)" <Dingchen.Zhang@amd.com>
Subject: Re: [PATCH 2/2] drm: Set crc->opened = false before setting crc
 source to NULL.
Thread-Topic: [PATCH 2/2] drm: Set crc->opened = false before setting crc
 source to NULL.
Thread-Index: AQHVG8HKECGLdBwUwUyvtM4/apuAJqamQciAgAAXmICAAAgsAA==
Date: Fri, 21 Jun 2019 16:15:25 +0000
Message-ID: <d2651c30-7574-1363-8860-7273f4a32335@amd.com>
References: <20190605170639.8368-1-dingchen.zhang@amd.com>
 <20190605170639.8368-2-dingchen.zhang@amd.com>
 <dee2bc30-8af4-98f9-a7e9-936c925af840@amd.com>
 <20190621154609.GF12905@phenom.ffwll.local>
In-Reply-To: <20190621154609.GF12905@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::15) To DM6PR12MB3561.namprd12.prod.outlook.com
 (2603:10b6:5:3c::24)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a660d98-297d-4bc6-6b66-08d6f663ab1c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2713; 
x-ms-traffictypediagnostic: DM6PR12MB2713:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB2713E14F1458E190E70EDAAEECE70@DM6PR12MB2713.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(366004)(136003)(396003)(39860400002)(189003)(199004)(229853002)(6306002)(66946007)(14454004)(66446008)(76176011)(4326008)(110136005)(68736007)(3846002)(6486002)(14444005)(256004)(64756008)(6116002)(316002)(73956011)(66556008)(52116002)(71190400001)(102836004)(99286004)(66476007)(6636002)(5660300002)(486006)(7736002)(25786009)(2906002)(26005)(81166006)(71200400001)(8936002)(86362001)(53936002)(81156014)(53546011)(6506007)(6246003)(11346002)(72206003)(446003)(2616005)(476003)(36756003)(66066001)(305945005)(6436002)(386003)(31686004)(8676002)(478600001)(186003)(6512007)(31696002)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2713;
 H:DM6PR12MB3561.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +gBuxKIQYSyZXI3m8z4UEeOH9yXdP8gNLf21g0wIBuSt5prPBPGTS/Z7aGg4DIGZuzge3T894hizPjVDpGddcNH91HyothBmQw7KkX/13dRIcqxduiUXGRRSCB/2hZhm8R7huR+/f3yFLDrZdB1qxlUl0WuKwq/8b+Kw3C266IlTLy39baGW556EUEUVJUPU0fk73YPXtrOOZz6/JN2Ca/GqPspglEYFcDsYEvP8g/lz6YMT4cpjaj7nXXL8X0BJ+IS54gTRI+JQ7+PpA+gljpRQiUIKsX1hWfP+OxJOoErvJor5mmzF9nfQCjiGgdmt7ofQCVzznRvkjNs6ifSR1czfDOSJKNwHqayscP0AdysstF8znnNR9jZPRddr5WWm6obqZpWoclWdPYMt3qJAEs47fqj5Dgj0iLYh/mKNqgk=
Content-ID: <6CACCCF64C929041B888B4BCA8F3CE9A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a660d98-297d-4bc6-6b66-08d6f663ab1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 16:15:25.6083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2713
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRaOiJ40TPstEJn1zCTk/qZbebUCPq74cCLuhF+m6WQ=;
 b=1Fzf/ajHBVfyE7HoNb8i89F79hiAh87HIxEpQs1d4EtBg8Udi3fQDXn+zA54Sha6v4qxxqowVfKFcO386Dgx0yXpFbMjDJ8KgGOOjo2GLNbn/k18n33ocjmgvCRyVulLaVOlq1zS8c7UNdqU1EDrOF1nFiva21y8xbQyVAsyAK8=
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8yMS8xOSAxMTo0NiBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToNCj4gT24gRnJpLCBKdW4g
MjEsIDIwMTkgYXQgMDI6MjE6NDNQTSArMDAwMCwgSGFycnkgV2VudGxhbmQgd3JvdGU6DQo+PiBP
biAyMDE5LTA2LTA1IDE6MDYgcC5tLiwgRGluZ2NoZW4gWmhhbmcgd3JvdGU6DQo+Pj4gdG8gdGVy
bWluYXRlIHRoZSB3aGlsZS1sb29wIGluIGRybV9kcF9hdXhfY3JjX3dvcmsgd2hlbiBkcm1fZHBf
c3RhcnQvc3RvcF9jcmMNCj4+PiBhcmUgY2FsbGVkIGluIHRoZSBob29rIHRvIHNldCBjcmMgc291
cmNlLg0KPj4+DQo+Pj4gQ2M6TGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+LCBIYXJyeSA8SGFy
cnkuV2VudGxhbmRAYW1kLmNvbT4sIE5pY2sgPE5pY2hvbGFzLkthemxhdXNrYXNAYW1kLmNvbT4N
Cg0KVGhlIENjOiBuZWVkIHRvIGJlIGNsZWFuZWQgdXAgYmVmb3JlIG1lcmdlIGxpa2UgeW91IGRp
ZCB3aXRoIHlvdXIgb3RoZXIgDQpwYXRjaC4NCg0KPj4+IFNpZ25lZC1vZmYtYnk6IERpbmdjaGVu
IFpoYW5nIDxkaW5nY2hlbi56aGFuZ0BhbWQuY29tPg0KPj4NCj4+IEkgd29uZGVyIGhvdyB0aGlz
IGlzbid0IGNyZWF0aW5nIHByb2JsZW1zIGZvciBSb2NrY2hpcCB3aXRoIHRoZSBBbmFsb2dpeA0K
Pj4gYnJpZGdlLg0KPj4NCj4+IFJldmlld2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2Vu
dGxhbmRAYW1kLmNvbT4NCj4+DQo+PiBIYXJyeQ0KPj4NCj4+PiAtLS0NCj4+PiAgIGRyaXZlcnMv
Z3B1L2RybS9kcm1fZGVidWdmc19jcmMuYyB8IDcgKysrKysrKw0KPj4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZGVidWdmc19jcmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYw0K
Pj4+IGluZGV4IGUyMGFkZWY5ZDYyMy4uMGU4YmNjMTMwMzgzIDEwMDY0NA0KPj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZGVidWdmc19jcmMuYw0KPj4+IEBAIC0yNDksNiArMjQ5LDEzIEBAIHN0YXRpYyBpbnQg
Y3J0Y19jcmNfcmVsZWFzZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmlsZXAp
DQo+Pj4gICAJc3RydWN0IGRybV9jcnRjICpjcnRjID0gZmlsZXAtPmZfaW5vZGUtPmlfcHJpdmF0
ZTsNCj4+PiAgIAlzdHJ1Y3QgZHJtX2NydGNfY3JjICpjcmMgPSAmY3J0Yy0+Y3JjOw0KPj4+ICAg
DQo+Pj4gKwkvKiB0ZXJtaW5hdGUgdGhlIGluZmluaXRlIHdoaWxlIGxvb3AgaWYgJ2RybV9kcF9h
dXhfY3JjX3dvcmsnIHJ1bm5pbmcgKi8NCj4+PiArCWlmIChjcmMtPm9wZW5lZCkgew0KPj4+ICsJ
CXNwaW5fbG9ja19pcnEoJmNyYy0+bG9jayk7DQo+Pj4gKwkJY3JjLT5vcGVuZWQgPSBmYWxzZTsN
Cj4+PiArCQlzcGluX3VubG9ja19pcnEoJmNyYy0+bG9jayk7DQo+Pj4gKwl9DQo+IA0KPiBFaXRo
ZXIgeW91IGRvbid0IG5lZWQgYSBsb2NrIHRvIGxvb2sgYXQgLT5vcGVuZWQsIG9yIHlvdSBuZWVk
IGl0LiBOb3QNCj4gYm90aC4gVG9vIGxhenkgY2hlY2sgd2hpY2ggd2F5IHRoaXMgaXMsIGl0J3Mg
cHJhY3RpY2FsbHkgdy9lIGhlcmUgOi0pDQo+IC1EYW5pZWwNCg0KVGhlIGNoZWNrIG9uIGNyYy0+
b3BlbmVkIHNob3VsZCBwcm9iYWJseSBqdXN0IGJlIGRyb3BwZWQgc2luY2UgaXQncyBub3QgDQph
Y3R1YWxseSBkb2luZyBhbnl0aGluZyBoZXJlLg0KDQpXaXRoIHRob3NlIGZpeGVkLCB0aGlzIHBh
dGNoIGlzOg0KDQpSZXZpZXdlZC1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6
bGF1c2thc0BhbWQuY29tPg0KDQpOaWNob2xhcyBLYXpsYXVza2FzDQoNCj4gDQo+Pj4gKw0KPj4+
ICAgCWNydGMtPmZ1bmNzLT5zZXRfY3JjX3NvdXJjZShjcnRjLCBOVUxMKTsNCj4+PiAgIA0KPj4+
ICAgCXNwaW5fbG9ja19pcnEoJmNyYy0+bG9jayk7DQo+Pj4NCj4+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0
DQo+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA0KPiANCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
