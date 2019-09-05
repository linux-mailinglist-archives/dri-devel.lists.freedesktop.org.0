Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDD3AAA49
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 19:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD446E05D;
	Thu,  5 Sep 2019 17:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690070.outbound.protection.outlook.com [40.107.69.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1526E05D;
 Thu,  5 Sep 2019 17:44:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipm9n47G3A3HqUsQ2i54aiYYPj/edkxp1hyEOzTkfJgDqczgVYcaUfRhiCz4QsbsX/JLDBxZxfEjJwghgmLQr7r7dq20SRbp9yyut6WLcdmOH7ONxtze3goVMkKsgvRQ/ObqHltcqfvRIx/8Ob+FEEXRgP1f6izNeBhnBkRPtNnSf79S/k2CZfuqJJS/otibUu80+HMw+DolQpiwMqiqZjAZMey9Bm2AzoD5LsjRldyyywagNC1OevCFGIvEkav7EjlDHF5cws77Oq7r2vaQefJyFsxDGNCn7yrxjfNNbcHuw95eCouXhPJkoNH5EU59cLLlUgnh8rmf5oBt5MRq0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cG08WzxdqzasVv6LPQIIZYeDFquSc5Kn05WPeAfC3VQ=;
 b=dFbYKMBWTfDem1xcKxCgg4qabl3DOHSdugHEkvhAMrwoEVUrtkInmsvKIIbNIRFJxsUUv81q/5ABShaSyaxIRIQMQrM1sHgxo1PsVYpTZ7YbeR66lxchrVSnp+H7i0hvCrUTu5wA0hgioRU0gn+ox4H7CjStdsUx/zeCb3LjGqKso3plHOUB5fF0ZCMdy45xsIg+eFHWE+8JIPgFdrLiIn1llBlm8pLGlPp5/s9LhgCrdaTq/NUjkfdX33KrlTfW2faWfrI3Wo3qTj+Z14lQJzOvmshzFlL38wglBkeiTGQQ+xeUWbAdtgnsozjLmmHMNIFynHlVswlOpr6GjwahXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0024.namprd12.prod.outlook.com (10.172.77.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Thu, 5 Sep 2019 17:44:51 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0%11]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 17:44:51 +0000
From: Harry Wentland <hwentlan@amd.com>
To: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
Subject: Re: [PATCH V4] drm: Add LTTPR defines for DP 1.4a
Thread-Topic: [PATCH V4] drm: Add LTTPR defines for DP 1.4a
Thread-Index: AQHVY1NGou2ILAGT/Euu5mgRcB5bcacdWDkAgAAEWoA=
Date: Thu, 5 Sep 2019 17:44:51 +0000
Message-ID: <bc61a7de-2183-cb28-65e0-3b7545fb556b@amd.com>
References: <20190904190116.klyt2rjg3svswmot@outlook.office365.com>
 <20190905172914.GN7482@intel.com>
In-Reply-To: <20190905172914.GN7482@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:925f:916c::2]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0044.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::21) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ac92cfd-1ea3-436a-866a-08d73228c0ee
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0024; 
x-ms-traffictypediagnostic: CY4PR1201MB0024:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0024A3D0D5D9A6609EFD32528CBB0@CY4PR1201MB0024.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(39850400004)(346002)(136003)(376002)(199004)(189003)(7736002)(305945005)(31696002)(5660300002)(316002)(64756008)(66946007)(53936002)(36756003)(46003)(66574012)(446003)(81166006)(6246003)(81156014)(66446008)(2906002)(25786009)(229853002)(8936002)(14454004)(99286004)(6486002)(6436002)(478600001)(4326008)(186003)(386003)(6506007)(53546011)(65956001)(65806001)(71200400001)(71190400001)(6116002)(102836004)(6636002)(66556008)(14444005)(256004)(486006)(6512007)(58126008)(110136005)(66476007)(476003)(2616005)(54906003)(8676002)(11346002)(31686004)(76176011)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0024;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +QLHWmHBVZEGv0vAWloRvvFbUkGPG7Z6wrRkoGj5+26m+lCAipKcVe/7XQTJOF3tQA7rOuAm3eu9xlah0OBYDAkrSDAjHe/PiIzYYzF/jAywoHYnToABGOumfOLfPG0gqBn4vpCeRXoMFMP1gy9fhOojAYE60492+KvIBfyKHhjXE41WuSzjdTZoIX3G0FQBIWpT/vuoYwsRyVX7xv2bOOglt45CmMjMlNb6vvoPP0Ng7Z0ikRjCo0EPV17QvgU0LPnOvvYncVsx69J0aOvLTuwt5tVvW/THc0poYPIEp6gFaTG/1bzYPIyyRmc441OQ9wT3IORKLadAOt+vmJJfupOdBfdtClFjM2OOUE4RZUp9DLbkEWQcBu/YgaHJlczb3ZGx4Ttw8MTOPqqG1plZy6+VtBdPzB2uF6d4wMoKq9k=
Content-ID: <9BDAB1CCFB7B7648A54788813ABC5CC4@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac92cfd-1ea3-436a-866a-08d73228c0ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 17:44:51.6151 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CwRVVgu9MfHjgJa3CPkf6yTw3rW6jMoW01Nu0fdY0Z6xNaDmQvBqOpPz1vibljZaz+qYy44aNWNFM2UvjGcPxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0024
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cG08WzxdqzasVv6LPQIIZYeDFquSc5Kn05WPeAfC3VQ=;
 b=JAO45w7J7GOxo1M8eyzc3cAXtxQQ5jsXAwGRllJjcFw+oarMGwVbu3+YH4JPxK1hXXcojEF6g9nnL62b8Txxx7OP7HGhPs6BZ/4Z7l4G4q8zYIT4HWTuXJT26wbOL6jgIxJ6bEYAK81/ToNRQzKtkAZzmsVAAb37hgcXVYKqeuo=
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Berthe,
 Abdoulaye" <Abdoulaye.Berthe@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Manasi Navare <manasi.d.navare@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0wNSAxOjI5IHAubS4sIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToNCj4gT24gV2Vk
LCBTZXAgMDQsIDIwMTkgYXQgMDc6MDI6MThQTSArMDAwMCwgU2lxdWVpcmEsIFJvZHJpZ28gd3Jv
dGU6DQo+PiBEUCAxLjRhIHNwZWNpZmljYXRpb24gZGVmaW5lcyBMaW5rIFRyYWluaW5nIFR1bmFi
bGUgUEhZIFJlcGVhdGVyIChMVFRQUikNCj4gDQo+IEEgYnVuY2ggb2YgdGhpcyBzdHVmZiB3YXMg
YWxyZWFkeSBpbiBEUCAxLjMgc28gdGhlIHN0YXRlbWVudCBoZXJlDQo+IChhbmQgaW4gdGhlIGNv
bW1lbnQpIGlzIGEgYml0IG1pc2xlYWRpbmcuDQo+IA0KPiAiTFRUUFIiIGlzIG5vdCBhIG5hbWUg
dGhhdCBhcHBlYXJzIGFueXdoZXJlIGluIHRoZSBzcGVjIEFGQUlDUywgc28NCj4gY2FsbGluZyBp
dCB0aGF0IGlzIGEgYml0IGNvbmZ1c2luZy4NCj4gDQo+PiB3aGljaCBpcyByZXF1aXJlZCB0byBh
ZGQgc3VwcG9ydCBmb3Igc3lzdGVtcyB3aXRoIFRodW5kZXJib2x0IG9yIG90aGVyDQo+PiByZXBl
YXRlciBkZXZpY2VzLg0KPiANCj4gInJlcXVpcmVkIiBzZWVtcyBhIGJpdCBzdHJvbmcuIElJUkMg
YnkgZGVmYXVsdCB0aGVzZSB0aGluZ3Mgc2hvdWxkIGJlIGluDQo+IHRyYW5zcGFyZW50IG1vZGUg
c28gdGhlIERQVFggY2FuIHJlbWFpbiBibGlzc2Z1bGx5IHVuYXdhcmUgb2YgdGhlaXINCj4gcHJl
c2VuY2UuDQo+IA0KDQpUaGF0J3MgdGhlIGlkZWEgYnV0IGluIHJlYWxpdHkgdGhpbmdzIHVzdWFs
bHkgZG9uJ3Qgd29yayBvdXQgbGlrZSB0aGlzLg0KSSByZW1lbWJlciBhIGNvdXBsZSB5ZWFycyBi
YWNrIGRlYnVnZ2luZyBUaHVuZGVyYm9sdCBhbmQgaGF2aW5nIGl0DQptb2RpZnkgRFBDRCByZWdp
c3RlciByZWFkcyBvbiBtZSBhbmQgbWVzc2luZyB1cCBsaW5rIHRyYWluaW5nIHdpdGgNCmNlcnRh
aW4gcmVjZWl2ZXJzLg0KDQpFaXRoZXIgd2F5LCB3ZSd2ZSBmb3VuZCB0aGF0IGluIG9yZGVyIHRv
IHJlY2VpdmUgYSByZWxpYWJsZQ0KaW1wbGVtZW50YXRpb24gd2UgbmVlZCB0byBtYWtlIHVzZSBv
ZiB0aGUgTFRUUFIgZnVuY3Rpb25hbGl0eS4NCg0KPj4NCj4+IENoYW5nZXMgc2luY2UgVjM6DQo+
PiAtIFJlcGxhY2Ugc3BhY2VzIGJ5IHRhYnMNCj4+IENoYW5nZXMgc2luY2UgVjI6DQo+PiAtIERy
b3AgdGhlIGtlcm5lbC1kb2MgY29tbWVudA0KPj4gLSBSZW9yZGVyIExUVFBSIGFjY29yZGluZyB0
byByZWdpc3RlciBvZmZzZXQNCj4+IENoYW5nZXMgc2luY2UgVjE6DQo+PiAtIEFkanVzdHMgcmVn
aXN0ZXJzIG5hbWVzIHRvIGJlIGFsaWduZWQgd2l0aCBzcGVjIGFuZCB0aGUgcmVzdCBvZiB0aGUN
Cj4+ICAgZmlsZQ0KPj4gLSBVcGRhdGUgc3BlYyBjb21tZW50IGZyb20gMS40IHRvIDEuNGENCj4+
DQo+PiBDYzogQWJkb3VsYXllIEJlcnRoZSA8QWJkb3VsYXllLkJlcnRoZUBhbWQuY29tPg0KPj4g
Q2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPg0KPj4gQ2M6IExlbyBM
aSA8c3VucGVuZy5saUBhbWQuY29tPg0KPj4gQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBs
aW51eC5pbnRlbC5jb20+DQo+PiBDYzogTWFuYXNpIE5hdmFyZSA8bWFuYXNpLmQubmF2YXJlQGlu
dGVsLmNvbT4NCj4+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50
ZWwuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogUm9kcmlnbyBTaXF1ZWlyYSA8Um9kcmlnby5TaXF1
ZWlyYUBhbWQuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogQWJkb3VsYXllIEJlcnRoZSA8QWJkb3Vs
YXllLkJlcnRoZUBhbWQuY29tPg0KPj4gUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxIYXJy
eS5XZW50bGFuZEBhbWQuY29tPg0KPj4gLS0tDQo+PiAgaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBl
ci5oIHwgMjUgKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAy
NSBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcF9o
ZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaA0KPj4gaW5kZXggODM2NDUwMmY5
MmNmLi41YWJlZDk2YTFjYjEgMTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVs
cGVyLmgNCj4+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaA0KPj4gQEAgLTk2Niw2
ICs5NjYsMzEgQEANCj4+ICAjZGVmaW5lIERQX0hEQ1BfMl8yX1JFR19TVFJFQU1fVFlQRV9PRkZT
RVQJMHg2OTQ5NA0KPj4gICNkZWZpbmUgRFBfSERDUF8yXzJfUkVHX0RCR19PRkZTRVQJCTB4Njk1
MTgNCj4+ICANCj4+ICsvKiBMaW5rIFRyYWluaW5nIChMVCktdHVuYWJsZSBQaHlzaWNhbCBSZXBl
YXRlcnMgLSBEUCAxLjRhICovDQo+IA0KPiBzL1BoeXNpY2FsL1BIWS8gdG8gbWF0Y2ggdGhlIHNw
ZWMuDQo+IA0KPj4gKyNkZWZpbmUgRFBfTFRfVFVOQUJMRV9QSFlfUkVQRUFURVJfRklFTERfREFU
QV9TVFJVQ1RVUkVfUkVWCTB4ZjAwMDANCj4+ICsjZGVmaW5lIERQX01BWF9MSU5LX1JBVEVfUEhZ
X1JFUEVBVEVSCQkJCTB4ZjAwMDENCj4+ICsjZGVmaW5lIERQX1BIWV9SRVBFQVRFUl9DTlQJCQkJ
CTB4ZjAwMDINCj4+ICsjZGVmaW5lIERQX1BIWV9SRVBFQVRFUl9NT0RFCQkJCQkweGYwMDAzDQo+
PiArI2RlZmluZSBEUF9NQVhfTEFORV9DT1VOVF9QSFlfUkVQRUFURVIJCQkJMHhmMDAwNA0KPj4g
KyNkZWZpbmUgRFBfUEhZX1JFUEVBVEVSX0VYVEVOREVEX1dBSVRfVElNRU9VVAkJCTB4ZjAwMDUN
Cj4gDQo+IFRoZSBsYXN0IHR3byBhcmUgRFAgMS40YSBpdCBzZWVtcy4NCj4gDQo+IDB4ZjAwMDQg
d2FzIGNhbGxlZCBSZXBlYXRlcl9GRUNfQ0FQQUJJTElUWSBpbiAxLjQuIEJ1dCB0aGUgc3BlYyBk
b2Vzbid0DQo+IHNheSBhbnl0aGluZyBhYm91dCB0aGUgRFBDRCByZXZpc2lvbiBzbyBJIGhhdmUg
bm8gaWRlYSBob3cgeW91J3JlDQo+IHN1cHBvc2VkIHRvIGRlY2lkZSB3aGljaCBkZWZpbml0aW9u
IHRvIHVzZS4NCj4gDQo+IERQIDEuNGEgc2VlbXMgdG8gaGF2ZSBhZGRlZCBGRUNfQ0FQQUJJTElU
WV9QSFlfUkVQRUFURVIxIGF0IDB4ZjAyOTQuDQo+IFRvIHJlcGxhY2UgdGhlIDEuNCBSZXBlYXRl
cl9GRUNfQ0FQQUJJTElUWSBJIHN1cHBvc2UuDQo+IA0KDQpUaGlzIHBhcnQgY29uZnVzZWQgbWUg
d2hlbiBJIHNhdyBpdCBpbiAxLjQgYW5kIDEuNGEuIEl0J3MgcHJvYmFibHkNCnNhZmVzdCB0byBn
byB3aXRoIHRoZSAxLjRhIGRlZmluaXRpb24uDQoNCj4+ICsjZGVmaW5lIERQX1RSQUlOSU5HX1BB
VFRFUk5fU0VUX1BIWV9SRVBFQVRFUjEJCQkweGYwMDEwDQo+PiArI2RlZmluZSBEUF9UUkFJTklO
R19MQU5FMF9TRVRfUEhZX1JFUEVBVEVSMQkJCTB4ZjAwMTENCj4+ICsjZGVmaW5lIERQX1RSQUlO
SU5HX0xBTkUxX1NFVF9QSFlfUkVQRUFURVIxCQkJMHhmMDAxMg0KPj4gKyNkZWZpbmUgRFBfVFJB
SU5JTkdfTEFORTJfU0VUX1BIWV9SRVBFQVRFUjEJCQkweGYwMDEzDQo+PiArI2RlZmluZSBEUF9U
UkFJTklOR19MQU5FM19TRVRfUEhZX1JFUEVBVEVSMQkJCTB4ZjAwMTQNCj4+ICsjZGVmaW5lIERQ
X1RSQUlOSU5HX0FVWF9SRF9JTlRFUlZBTF9QSFlfUkVQRUFURVIxCQkweGYwMDIwDQo+PiArI2Rl
ZmluZSBEUF9UUkFOU01JVFRFUl9DQVBBQklMSVRZX1BIWV9SRVBFQVRFUjEJCQkweGYwMDIxDQo+
IA0KPiBBYm92ZSB0d28gYXJlIERQIDEuNGEuDQo+IA0KPj4gKyNkZWZpbmUgRFBfTEFORTBfMV9T
VEFUVVNfUEhZX1JFUEVBVEVSMQkJCQkweGYwMDMwDQo+PiArI2RlZmluZSBEUF9MQU5FMl8zX1NU
QVRVU19QSFlfUkVQRUFURVIxCQkJCTB4ZjAwMzENCj4+ICsjZGVmaW5lIERQX0xBTkVfQUxJR05f
U1RBVFVTX1VQREFURURfUEhZX1JFUEVBVEVSMQkJMHhmMDAzMg0KPj4gKyNkZWZpbmUgRFBfQURK
VVNUX1JFUVVFU1RfTEFORTBfMV9QSFlfUkVQRUFURVIxCQkJMHhmMDAzMw0KPj4gKyNkZWZpbmUg
RFBfQURKVVNUX1JFUVVFU1RfTEFORTJfM19QSFlfUkVQRUFURVIxCQkJMHhmMDAzNA0KPj4gKyNk
ZWZpbmUgRFBfU1lNQk9MX0VSUk9SX0NPVU5UX0xBTkUwX1BIWV9SRVBFQVRFUjEJCTB4ZjAwMzUN
Cj4+ICsjZGVmaW5lIERQX1NZTUJPTF9FUlJPUl9DT1VOVF9MQU5FMV9QSFlfUkVQRUFURVIxCQkw
eGYwMDM3DQo+PiArI2RlZmluZSBEUF9TWU1CT0xfRVJST1JfQ09VTlRfTEFORTJfUEhZX1JFUEVB
VEVSMQkJMHhmMDAzOQ0KPj4gKyNkZWZpbmUgRFBfU1lNQk9MX0VSUk9SX0NPVU5UX0xBTkUzX1BI
WV9SRVBFQVRFUjEJCTB4ZjAwM2INCj4+ICsjZGVmaW5lIERQX0ZFQ19TVEFUVVNfUEhZX1JFUEVB
VEVSMQkJCQkweGYwMjkwDQo+IA0KPiBUaGlzIHNlZW1zIHRvIGhhdmUgYXBwYXJlZCBpbiBEUCAx
LjQuDQo+IA0KPiBZb3Ugc2tpcHBlZCBxdWl0ZSBhIGZldyByZWdpc3RlcnMgaGVyZS4gSSBndWVz
cyB0aG9zZSB3ZXJlIGRlZW1lZCBub3QNCj4gaW1wb3J0YW50Pw0KPiANCg0KVGhleSB3b24ndCBi
ZSB1c2VkIGJ5IHVzIGF0IHRoZSBtb21lbnQuDQoNCkhhcnJ5DQoNCj4+ICsNCj4+ICAvKiBEUCBI
RENQIG1lc3NhZ2Ugc3RhcnQgb2Zmc2V0cyBpbiBEUENEIGFkZHJlc3Mgc3BhY2UgKi8NCj4+ICAj
ZGVmaW5lIERQX0hEQ1BfMl8yX0FLRV9JTklUX09GRlNFVAkJRFBfSERDUF8yXzJfUkVHX1JUWF9P
RkZTRVQNCj4+ICAjZGVmaW5lIERQX0hEQ1BfMl8yX0FLRV9TRU5EX0NFUlRfT0ZGU0VUCURQX0hE
Q1BfMl8yX1JFR19DRVJUX1JYX09GRlNFVA0KPj4gLS0gDQo+PiAyLjIzLjANCj4gDQo+IA0KPiAN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
