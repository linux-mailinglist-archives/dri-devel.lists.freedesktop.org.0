Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 119022CBEA
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 18:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71BB66E22C;
	Tue, 28 May 2019 16:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02on0606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe46::606])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6686E22C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 16:27:37 +0000 (UTC)
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6064.namprd05.prod.outlook.com (20.178.241.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.12; Tue, 28 May 2019 16:27:32 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::c19e:e8f8:b151:9ad]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::c19e:e8f8:b151:9ad%6]) with mapi id 15.20.1943.015; Tue, 28 May 2019
 16:27:32 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: "Thomas.Lendacky@amd.com" <Thomas.Lendacky@amd.com>,
 "Christian.Koenig@amd.com" <Christian.Koenig@amd.com>, "thomas@shipmail.org"
 <thomas@shipmail.org>
Subject: Re: [RFC PATCH] drm/ttm, drm/vmwgfx: Have TTM support AMD SEV
 encryption
Thread-Topic: [RFC PATCH] drm/ttm, drm/vmwgfx: Have TTM support AMD SEV
 encryption
Thread-Index: AQHVEghYuDxSN1fVpkali7rG5/3Q76Z589+AgAAJhQCAAAwvAIAABlaAgAAFf4CAABf7gIAAB2IAgAAsKICABcndAIAAeesAgAAGZ4CAAAHSAIAACTYAgAAKSYA=
Date: Tue, 28 May 2019 16:27:32 +0000
Message-ID: <6dac8c560f75cae65e81a0f6466cbfdb270575e8.camel@vmware.com>
References: <20190524081114.53661-1-thomas@shipmail.org>
 <f2c4ccdd-49c9-2188-3378-2f333a8f605f@amd.com>
 <d397836b-13a4-b6cd-e059-035203f2edc6@shipmail.org>
 <d59cb481-1360-25eb-a2da-1ae64c648daf@shipmail.org>
 <84fa57da-7bb7-8322-125a-89596fbb2145@amd.com>
 <33816cbd-ddfb-b47a-a305-2760f8568eff@shipmail.org>
 <79c8d26a-d2dd-3e2c-f0bc-cbfc47a67fee@amd.com>
 <deef176a-5467-5beb-7f1b-fcd7bd1deab7@shipmail.org>
 <CADnq5_O+L-aJ_WU4ZcBmLYOV3RqNouw_P-2wYfCoJwXxj6ny3g@mail.gmail.com>
 <52df61a9-028e-8ff6-0850-20ddddb11de3@shipmail.org>
 <5b1b3f22-beea-16c4-a98f-9e632b408020@amd.com>
 <6b9b8536-bfea-5817-06e4-23881b86ab31@shipmail.org>
 <cc1d736d-9a8f-03d0-26ab-60a686ad71bd@amd.com>
 <a1bdbae7-009a-85ad-beb1-f938995274db@amd.com>
In-Reply-To: <a1bdbae7-009a-85ad-beb1-f938995274db@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 890b5753-d4f4-4e10-67d2-08d6e38962e0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR05MB6064; 
x-ms-traffictypediagnostic: MN2PR05MB6064:
x-microsoft-antispam-prvs: <MN2PR05MB60648588190AE6467574F45EA11E0@MN2PR05MB6064.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(396003)(136003)(376002)(39860400002)(51914003)(199004)(189003)(68736007)(476003)(4326008)(2616005)(2906002)(53546011)(86362001)(2201001)(186003)(6512007)(118296001)(102836004)(6246003)(6506007)(76176011)(110136005)(486006)(54906003)(26005)(91956017)(76116006)(446003)(11346002)(53936002)(66446008)(66946007)(73956011)(64756008)(66556008)(305945005)(256004)(6486002)(7736002)(3846002)(316002)(6116002)(229853002)(36756003)(66476007)(14444005)(99286004)(25786009)(478600001)(14454004)(8936002)(8676002)(66066001)(5660300002)(6436002)(81166006)(81156014)(71200400001)(71190400001)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6064;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 17sA1rSpYKLPpozp074aKZZ+zN1LFqc6mBwOlsZwrICSvm1396O1KNpKtN68bSEHEwvtJMczTebN8Kj2S1npi0jNNxqsiEBbAj2gYlBdS9eqTpdXTSzSe73JaJTnedmtXWIPOngSLabjTRC4d01i6CKnkAwM/bjhepuGqWX4dU4+bw8I7QzN1tBBEcUnUY20VVo6dIoGeMtYVK4MtzVJJBearvJaTSW8b8Ew0f4p7552vUJ9tDzM6MUgtvztyWcTnd5TmbzrTLc7zW6ELwb84FW5sAlpCjdvnOG4F4WPYFX4F4hc8U5aRPc7hWFy9VoU5Wozj7ykyMui6qySWiBUFGTqZPgyatNlJVw6eiatzOE3hrgjYPDE9BEwf27tIFnW9+KvrGv4eZmZNYv2ZV4+TKr9GJRWlRiK1IMNHXD86wQ=
Content-ID: <22DB5BE4E7EDD24CB398E984D82F3A86@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 890b5753-d4f4-4e10-67d2-08d6e38962e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 16:27:32.7003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thellstrom@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6064
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLYWhiK7YTjTRnxPBkDJemUpSyQfpIdG691eiYF/LRQ=;
 b=TQwbUX4gOgMGEhrY08h0laAbk9XEhzF/EpDniBEgTMvSM9QX+GpKV/g6Lv5f/Gw/OT3J0LK7A9UIXv3ksu9D/QQ5KqCAWRPPgCrsEejqznnaxc9qChpRo7woZF9dsv8Q/JPlwJGSN/SnkZznygyFzhwonSkNh/dKqcJiJEXf1VI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
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

T24gVHVlLCAyMDE5LTA1LTI4IGF0IDE1OjUwICswMDAwLCBMZW5kYWNreSwgVGhvbWFzIHdyb3Rl
Og0KPiBPbiA1LzI4LzE5IDEwOjE3IEFNLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToNCj4gPiBI
aSBUaG9tYXMsDQo+ID4gDQo+ID4gQW0gMjguMDUuMTkgdW0gMTc6MTEgc2NocmllYiBUaG9tYXMg
SGVsbHN0cm9tOg0KPiA+ID4gSGksIFRvbSwNCj4gPiA+IA0KPiA+ID4gVGhhbmtzIGZvciB0aGUg
cmVwbHkuIFRoZSBxdWVzdGlvbiBpcyBub3QgZ3JhcGhpY3Mgc3BlY2lmaWMsIGJ1dA0KPiA+ID4g
bGllcyANCj4gPiA+IGluIHlvdXIgYW5zd2VyIGZ1cnRoZXIgYmVsb3c6DQo+ID4gPiANCj4gPiA+
IE9uIDUvMjgvMTkgNDo0OCBQTSwgTGVuZGFja3ksIFRob21hcyB3cm90ZToNCj4gPiA+ID4gT24g
NS8yOC8xOSAyOjMxIEFNLCBUaG9tYXMgSGVsbHN0cm9tIHdyb3RlOg0KPiA+ID4gPiBbU05JUF0N
Cj4gPiA+ID4gQXMgZm9yIGtlcm5lbCB2bWFwcyBhbmQgdXNlci1tYXBzLCB0aG9zZSBwYWdlcyB3
aWxsIGJlIG1hcmtlZA0KPiA+ID4gPiBlbmNyeXB0ZWQNCj4gPiA+ID4gKHVubGVzcyBleHBsaWNp
dGx5IG1hZGUgdW4tZW5jcnlwdGVkIGJ5IGNhbGxpbmcNCj4gPiA+ID4gc2V0X21lbW9yeV9kZWNy
eXB0ZWQoKSkuDQo+ID4gPiA+IEJ1dCwgaWYgeW91IGFyZSBjb3B5aW5nIHRvL2Zyb20gdGhvc2Ug
YXJlYXMgaW50byB0aGUgdW4tDQo+ID4gPiA+IGVuY3J5cHRlZCBETUENCj4gPiA+ID4gYXJlYSB0
aGVuIGV2ZXJ5dGhpbmcgd2lsbCBiZSBvay4NCj4gPiA+IA0KPiA+ID4gVGhlIHF1ZXN0aW9uIGlz
IHJlZ2FyZGluZyB0aGUgYWJvdmUgcGFyYWdyYXBoLg0KPiA+ID4gDQo+ID4gPiBBRkFJQ1QsICBz
ZXRfbWVtb3J5X2RlY3J5cHRlZCgpIG9ubHkgY2hhbmdlcyB0aGUgZml4ZWQga2VybmVsIG1hcA0K
PiA+ID4gUFRFcy4NCj4gPiA+IEJ1dCB3aGVuIHNldHRpbmcgdXAgb3RoZXIgYWxpYXNlZCBQVEVz
IHRvIHRoZSBleGFjdCBzYW1lDQo+ID4gPiBkZWNyeXB0ZWQgDQo+ID4gPiBwYWdlcywgZm9yIGV4
YW1wbGUgdXNpbmcgZG1hX21tYXBfY29oZXJlbnQoKSwNCj4gPiA+IGttYXBfYXRvbWljX3Byb3Qo
KSwgDQo+ID4gPiB2bWFwKCkgZXRjLiBXaGF0IGNvZGUgaXMgcmVzcG9uc2libGUgZm9yIGNsZWFy
aW5nIHRoZSBlbmNyeXB0ZWQNCj4gPiA+IGZsYWcgDQo+ID4gPiBvbiB0aG9zZSBQVEVzPyBJcyB0
aGVyZSBzb21ldGhpbmcgaW4gdGhlIHg4NiBwbGF0Zm9ybSBjb2RlIGRvaW5nDQo+ID4gPiB0aGF0
Pw0KPiA+IA0KPiA+IFRvbSBhY3R1YWxseSBleHBsYWluZWQgdGhpczoNCj4gPiA+IFRoZSBlbmNy
eXB0aW9uIGJpdCBpcyBiaXQtNDcgb2YgYSBwaHlzaWNhbCBhZGRyZXNzLg0KPiA+IA0KPiA+IElu
IG90aGVyIHdvcmRzIHNldF9tZW1vcnlfZGVjcnlwdGVkKCkgY2hhbmdlcyB0aGUgcGh5c2ljYWwg
YWRkcmVzcw0KPiA+IGluIA0KPiA+IHRoZSBQVEVzIG9mIHRoZSBrZXJuZWwgbWFwcGluZyBhbmQg
YWxsIG90aGVyIHVzZSBjYXNlcyBqdXN0IGNvcHkNCj4gPiB0aGF0IA0KPiA+IGZyb20gdGhlcmUu
DQo+IA0KPiBFeGNlcHQgSSBkb24ndCB0aGluayB0aGUgUFRFIGF0dHJpYnV0ZXMgYXJlIGNvcGll
ZCBmcm9tIHRoZSBrZXJuZWwNCj4gbWFwcGluZw0KDQorMSENCg0KPiBpbiBzb21lIGNhc2VzLiBG
b3IgZXhhbXBsZSwgZG1hX21tYXBfY29oZXJlbnQoKSB3aWxsIGNyZWF0ZSB0aGUgc2FtZQ0KPiB2
bV9wYWdlX3Byb3QgdmFsdWUgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIG9yIG5vdCB0aGUgdW5kZXJs
eWluZyBtZW1vcnkNCj4gaXMNCj4gZW5jcnlwdGVkIG9yIG5vdC4gQnV0IGttYXBfYXRvbWljX3By
b3QoKSB3aWxsIHJldHVybiB0aGUga2VybmVsDQo+IHZpcnR1YWwNCj4gYWRkcmVzcyBvZiB0aGUg
cGFnZSwgc28gdGhhdCB3b3VsZCBiZSBmaW5lLg0KDQpZZXMsIG9uIDY0LWJpdCBzeXN0ZW1zLiBP
biAzMi1iaXQgc3lzdGVtcyAoZG8gdGhleSBleGlzdCB3aXRoIFNFVj8pLA0KdGhleSBkb24ndC4g
DQoNCkFuZCBzaW1pbGFybHkgVFRNIHVzZXItc3BhY2UgbWFwcGluZ3MgYW5kIHZtYXAoKSBkb2Vz
bid0IGNvcHkgZnJvbSB0aGUNCmtlcm5lbCBtYXAgZWl0aGVyLCAgc28gSSB0aGluayB3ZSBhY3R1
YWxseSBkbyBuZWVkIHRvIG1vZGlmeSB0aGUgcGFnZS0NCnByb3QgbGlrZSBkb25lIGluIHRoZSBw
YXRjaC4NCg0KL1Rob21hcw0KDQo+IA0KPiBUaGlzIGlzIGFuIGFyZWEgdGhhdCBuZWVkcyBsb29r
aW5nIGludG8gdG8gYmUgc3VyZSBpdCBpcyB3b3JraW5nDQo+IHByb3Blcmx5DQo+IHdpdGggU01F
IGFuZCBTRVYuDQo+IA0KPiBUaGFua3MsDQo+IFRvbQ0KPiANCj4gPiBUaGF0J3MgcmF0aGVyIG5p
ZnR5LCBiZWNhdXNlIHRoaXMgd2F5IGV2ZXJ5Ym9keSB3aWxsIGVpdGhlciB1c2Ugb3INCj4gPiBu
b3QgDQo+ID4gdXNlIGVuY3J5cHRpb24gb24gdGhlIHBhZ2UuDQo+ID4gDQo+ID4gQ2hyaXN0aWFu
Lg0KPiA+IA0KPiA+ID4gVGhhbmtzLA0KPiA+ID4gVGhvbWFzDQo+ID4gPiANCj4gPiA+IA0KPiA+
ID4gPiBUaGluZ3MgZ2V0IGZ1enp5IGZvciBtZSB3aGVuIGl0IGNvbWVzIHRvIHRoZSBHUFUgYWNj
ZXNzIG9mIHRoZQ0KPiA+ID4gPiBtZW1vcnkNCj4gPiA+ID4gYW5kIHdoYXQgYW5kIGhvdyBpdCBp
cyBhY2Nlc3NlZC4NCj4gPiA+ID4gDQo+ID4gPiA+IFRoYW5rcywNCj4gPiA+ID4gVG9tDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
