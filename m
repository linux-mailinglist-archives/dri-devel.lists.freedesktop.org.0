Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 033F62D905
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 11:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BAD6E0C4;
	Wed, 29 May 2019 09:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810041.outbound.protection.outlook.com [40.107.81.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48AB36E0C4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 09:27:13 +0000 (UTC)
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6013.namprd05.prod.outlook.com (20.178.244.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.14; Wed, 29 May 2019 09:27:11 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::c19e:e8f8:b151:9ad]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::c19e:e8f8:b151:9ad%6]) with mapi id 15.20.1943.015; Wed, 29 May 2019
 09:27:11 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: "Thomas.Lendacky@amd.com" <Thomas.Lendacky@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "thomas@shipmail.org"
 <thomas@shipmail.org>
Subject: Re: [RFC PATCH] drm/ttm, drm/vmwgfx: Have TTM support AMD SEV
 encryption
Thread-Topic: [RFC PATCH] drm/ttm, drm/vmwgfx: Have TTM support AMD SEV
 encryption
Thread-Index: AQHVEghYuDxSN1fVpkali7rG5/3Q76Z589+AgAAJhQCAAAwvAIAABlaAgAAFf4CAABf7gIAAB2IAgAAsKICABcndAIAAeesAgAAGZ4CAAAHSAIAACTYAgAAKSYCAAAFMgIAAB9EAgAABeoCAAAUPgIAA8jsAgAAa+oA=
Date: Wed, 29 May 2019 09:27:11 +0000
Message-ID: <d955aad649fe2ab2eb95c85d0f41e5d57365c08a.camel@vmware.com>
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
 <6dac8c560f75cae65e81a0f6466cbfdb270575e8.camel@vmware.com>
 <4b22c4ed-1d66-0aff-51a2-7a1ddb411878@amd.com>
 <1325ba3d-55f6-8b3c-c4b0-b0cc7b1a9d29@amd.com>
 <9da98001-1636-768d-e477-b96611406944@shipmail.org>
 <7124da0b-399a-81a3-dfca-b2ce64d73072@amd.com>
 <dd5ae5d1-7d94-895b-d2ab-ad5e174b8eb8@gmail.com>
In-Reply-To: <dd5ae5d1-7d94-895b-d2ab-ad5e174b8eb8@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06c98dc8-1d69-44a3-2822-08d6e417d45b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR05MB6013; 
x-ms-traffictypediagnostic: MN2PR05MB6013:
x-microsoft-antispam-prvs: <MN2PR05MB60135BC720A09C79F75582D3A11F0@MN2PR05MB6013.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0052308DC6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(366004)(136003)(376002)(396003)(189003)(199004)(51914003)(99286004)(76176011)(2201001)(4326008)(2501003)(305945005)(3846002)(7736002)(14454004)(186003)(6116002)(6512007)(25786009)(66574012)(478600001)(86362001)(66446008)(66556008)(8936002)(71200400001)(73956011)(91956017)(2906002)(76116006)(68736007)(256004)(110136005)(6436002)(476003)(11346002)(229853002)(6486002)(53546011)(446003)(118296001)(486006)(81156014)(2616005)(36756003)(26005)(5660300002)(6506007)(66066001)(6246003)(102836004)(8676002)(316002)(81166006)(71190400001)(66946007)(53936002)(64756008)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6013;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: r/HUrXr35hSWf5BY92woUf4fxXPSELeCmR3qkxT8Eglo7uF3IOfOEAhoAElhoBJr++/rY8gV3ZoYtq8DmRYJ1qmfIWxV9KOC6tDltRo0F/Eums2we9hDIDsr2hguoJwa97uz6A1JnmWESjpgPl6Y9T2t5QcV3ADC/6WNjkaWK3s13M0nRW+6SFw/f9K3V+xXmfzLChWT+SIjREEs8wEdM+4Ep27FQQFoQszB1HblW3ZkzPMYZuT1IAVCFFQQ9rqlhuRYR9ZTzQ6hOCyvVOJ0J33f4okCnCnTbC6L9NCn3qXO9aIQwgTNnxZ7bZgiJdVvaAdHC+qZOOv3VPyTaY10LgdQT7gRhpmD2COQWG3SJwiNkT58ycLD94VDsgHloe0ShVIQ1nYHt06BuWv3ELwDVXOeqw8wPUcR+23nRYFJtz8=
Content-ID: <7CA32DB661DB814EA8BD4EECE365C7B1@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c98dc8-1d69-44a3-2822-08d6e417d45b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 09:27:11.5379 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thellstrom@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6013
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6RWSjyh4L7f3xgZA7gCULmxqWRH7k4PHDlwqApQYGM=;
 b=ZVlQbY2IcRbXzJ7W/CIwW8aB8y27+wf2H7niRoGwiigOWtZ5TIpZw68uzUke7u/p5Z6h5XuBCplxCpbaUFegGrPqkfj33kDkGGfDC5WL5vQcGrKemjPqmHuIXpB6W68JyUtdBBAKnLBleocKJ+97RrJQhy/8YTKhjizKNhUI+pQ=
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

T24gV2VkLCAyMDE5LTA1LTI5IGF0IDA5OjUwICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiBBbSAyOC4wNS4xOSB1bSAxOToyMyBzY2hyaWViIExlbmRhY2t5LCBUaG9tYXM6DQo+ID4g
T24gNS8yOC8xOSAxMjowNSBQTSwgVGhvbWFzIEhlbGxzdHJvbSB3cm90ZToNCj4gPiA+IE9uIDUv
MjgvMTkgNzowMCBQTSwgTGVuZGFja3ksIFRob21hcyB3cm90ZToNCj4gPiA+ID4gT24gNS8yOC8x
OSAxMTozMiBBTSwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6DQo+ID4gPiA+ID4gQW0gMjguMDUu
MTkgdW0gMTg6Mjcgc2NocmllYiBUaG9tYXMgSGVsbHN0cm9tOg0KPiA+ID4gPiA+ID4gT24gVHVl
LCAyMDE5LTA1LTI4IGF0IDE1OjUwICswMDAwLCBMZW5kYWNreSwgVGhvbWFzIHdyb3RlOg0KPiA+
ID4gPiA+ID4gPiBPbiA1LzI4LzE5IDEwOjE3IEFNLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToN
Cj4gPiA+ID4gPiA+ID4gPiBIaSBUaG9tYXMsDQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
PiA+ID4gQW0gMjguMDUuMTkgdW0gMTc6MTEgc2NocmllYiBUaG9tYXMgSGVsbHN0cm9tOg0KPiA+
ID4gPiA+ID4gPiA+ID4gSGksIFRvbSwNCj4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4g
PiA+ID4gVGhhbmtzIGZvciB0aGUgcmVwbHkuIFRoZSBxdWVzdGlvbiBpcyBub3QgZ3JhcGhpY3MN
Cj4gPiA+ID4gPiA+ID4gPiA+IHNwZWNpZmljLCBidXQNCj4gPiA+ID4gPiA+ID4gPiA+IGxpZXMN
Cj4gPiA+ID4gPiA+ID4gPiA+IGluIHlvdXIgYW5zd2VyIGZ1cnRoZXIgYmVsb3c6DQo+ID4gPiA+
ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+IE9uIDUvMjgvMTkgNDo0OCBQTSwgTGVuZGFj
a3ksIFRob21hcyB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPiA+ID4gT24gNS8yOC8xOSAyOjMxIEFN
LCBUaG9tYXMgSGVsbHN0cm9tIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+ID4gPiBbU05JUF0NCj4g
PiA+ID4gPiA+ID4gPiA+ID4gQXMgZm9yIGtlcm5lbCB2bWFwcyBhbmQgdXNlci1tYXBzLCB0aG9z
ZSBwYWdlcyB3aWxsDQo+ID4gPiA+ID4gPiA+ID4gPiA+IGJlIG1hcmtlZA0KPiA+ID4gPiA+ID4g
PiA+ID4gPiBlbmNyeXB0ZWQNCj4gPiA+ID4gPiA+ID4gPiA+ID4gKHVubGVzcyBleHBsaWNpdGx5
IG1hZGUgdW4tZW5jcnlwdGVkIGJ5IGNhbGxpbmcNCj4gPiA+ID4gPiA+ID4gPiA+ID4gc2V0X21l
bW9yeV9kZWNyeXB0ZWQoKSkuDQo+ID4gPiA+ID4gPiA+ID4gPiA+IEJ1dCwgaWYgeW91IGFyZSBj
b3B5aW5nIHRvL2Zyb20gdGhvc2UgYXJlYXMgaW50bw0KPiA+ID4gPiA+ID4gPiA+ID4gPiB0aGUg
dW4tDQo+ID4gPiA+ID4gPiA+ID4gPiA+IGVuY3J5cHRlZCBETUENCj4gPiA+ID4gPiA+ID4gPiA+
ID4gYXJlYSB0aGVuIGV2ZXJ5dGhpbmcgd2lsbCBiZSBvay4NCj4gPiA+ID4gPiA+ID4gPiA+IFRo
ZSBxdWVzdGlvbiBpcyByZWdhcmRpbmcgdGhlIGFib3ZlIHBhcmFncmFwaC4NCj4gPiA+ID4gPiA+
ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gQUZBSUNULCAgc2V0X21lbW9yeV9kZWNyeXB0ZWQo
KSBvbmx5IGNoYW5nZXMgdGhlDQo+ID4gPiA+ID4gPiA+ID4gPiBmaXhlZCBrZXJuZWwgbWFwDQo+
ID4gPiA+ID4gPiA+ID4gPiBQVEVzLg0KPiA+ID4gPiA+ID4gPiA+ID4gQnV0IHdoZW4gc2V0dGlu
ZyB1cCBvdGhlciBhbGlhc2VkIFBURXMgdG8gdGhlIGV4YWN0DQo+ID4gPiA+ID4gPiA+ID4gPiBz
YW1lDQo+ID4gPiA+ID4gPiA+ID4gPiBkZWNyeXB0ZWQNCj4gPiA+ID4gPiA+ID4gPiA+IHBhZ2Vz
LCBmb3IgZXhhbXBsZSB1c2luZyBkbWFfbW1hcF9jb2hlcmVudCgpLA0KPiA+ID4gPiA+ID4gPiA+
ID4ga21hcF9hdG9taWNfcHJvdCgpLA0KPiA+ID4gPiA+ID4gPiA+ID4gdm1hcCgpIGV0Yy4gV2hh
dCBjb2RlIGlzIHJlc3BvbnNpYmxlIGZvciBjbGVhcmluZyB0aGUNCj4gPiA+ID4gPiA+ID4gPiA+
IGVuY3J5cHRlZA0KPiA+ID4gPiA+ID4gPiA+ID4gZmxhZw0KPiA+ID4gPiA+ID4gPiA+ID4gb24g
dGhvc2UgUFRFcz8gSXMgdGhlcmUgc29tZXRoaW5nIGluIHRoZSB4ODYgcGxhdGZvcm0NCj4gPiA+
ID4gPiA+ID4gPiA+IGNvZGUgZG9pbmcNCj4gPiA+ID4gPiA+ID4gPiA+IHRoYXQ/DQo+ID4gPiA+
ID4gPiA+ID4gVG9tIGFjdHVhbGx5IGV4cGxhaW5lZCB0aGlzOg0KPiA+ID4gPiA+ID4gPiA+ID4g
VGhlIGVuY3J5cHRpb24gYml0IGlzIGJpdC00NyBvZiBhIHBoeXNpY2FsIGFkZHJlc3MuDQo+ID4g
PiA+ID4gPiA+ID4gSW4gb3RoZXIgd29yZHMgc2V0X21lbW9yeV9kZWNyeXB0ZWQoKSBjaGFuZ2Vz
IHRoZQ0KPiA+ID4gPiA+ID4gPiA+IHBoeXNpY2FsIGFkZHJlc3MNCj4gPiA+ID4gPiA+ID4gPiBp
bg0KPiA+ID4gPiA+ID4gPiA+IHRoZSBQVEVzIG9mIHRoZSBrZXJuZWwgbWFwcGluZyBhbmQgYWxs
IG90aGVyIHVzZSBjYXNlcw0KPiA+ID4gPiA+ID4gPiA+IGp1c3QgY29weQ0KPiA+ID4gPiA+ID4g
PiA+IHRoYXQNCj4gPiA+ID4gPiA+ID4gPiBmcm9tIHRoZXJlLg0KPiA+ID4gPiA+ID4gPiBFeGNl
cHQgSSBkb24ndCB0aGluayB0aGUgUFRFIGF0dHJpYnV0ZXMgYXJlIGNvcGllZCBmcm9tDQo+ID4g
PiA+ID4gPiA+IHRoZSBrZXJuZWwNCj4gPiA+ID4gPiA+ID4gbWFwcGluZw0KPiA+ID4gPiA+ID4g
KzEhDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gaW4gc29tZSBjYXNlcy4gRm9yIGV4YW1w
bGUsIGRtYV9tbWFwX2NvaGVyZW50KCkgd2lsbA0KPiA+ID4gPiA+ID4gPiBjcmVhdGUgdGhlIHNh
bWUNCj4gPiA+ID4gPiA+ID4gdm1fcGFnZV9wcm90IHZhbHVlIHJlZ2FyZGxlc3Mgb2Ygd2hldGhl
ciBvciBub3QgdGhlDQo+ID4gPiA+ID4gPiA+IHVuZGVybHlpbmcgbWVtb3J5DQo+ID4gPiA+ID4g
PiA+IGlzDQo+ID4gPiA+ID4gPiA+IGVuY3J5cHRlZCBvciBub3QuIEJ1dCBrbWFwX2F0b21pY19w
cm90KCkgd2lsbCByZXR1cm4gdGhlDQo+ID4gPiA+ID4gPiA+IGtlcm5lbA0KPiA+ID4gPiA+ID4g
PiB2aXJ0dWFsDQo+ID4gPiA+ID4gPiA+IGFkZHJlc3Mgb2YgdGhlIHBhZ2UsIHNvIHRoYXQgd291
bGQgYmUgZmluZS4NCj4gPiA+ID4gPiA+IFllcywgb24gNjQtYml0IHN5c3RlbXMuIE9uIDMyLWJp
dCBzeXN0ZW1zIChkbyB0aGV5IGV4aXN0DQo+ID4gPiA+ID4gPiB3aXRoIFNFVj8pLA0KPiA+ID4g
PiA+ID4gdGhleSBkb24ndC4NCj4gPiA+ID4gPiBJIGRvbid0IHRoaW5rIHNvLCBidXQgZmVlbCBm
cmVlIHRvIHByb3ZlIG1lIHdyb25nIFRvbS4NCj4gPiA+ID4gU0VWIGlzIDY0LWJpdCBvbmx5Lg0K
PiA+ID4gQW5kIEkganVzdCBub3RpY2VkIHRoYXQga21hcF9hdG9taWNfcHJvdCgpIGluZGVlZCBy
ZXR1cm5zIHRoZQ0KPiA+ID4ga2VybmVsIG1hcA0KPiA+ID4gYWxzbyBmb3IgMzItYml0IGxvd21l
bS4NCj4gPiA+IA0KPiA+ID4gPiA+ID4gQW5kIHNpbWlsYXJseSBUVE0gdXNlci1zcGFjZSBtYXBw
aW5ncyBhbmQgdm1hcCgpIGRvZXNuJ3QNCj4gPiA+ID4gPiA+IGNvcHkgZnJvbSB0aGUNCj4gPiA+
ID4gPiA+IGtlcm5lbCBtYXAgZWl0aGVyLCAgc28gSSB0aGluayB3ZSBhY3R1YWxseSBkbyBuZWVk
IHRvDQo+ID4gPiA+ID4gPiBtb2RpZnkgdGhlIHBhZ2UtDQo+ID4gPiA+ID4gPiBwcm90IGxpa2Ug
ZG9uZSBpbiB0aGUgcGF0Y2guDQo+ID4gPiA+ID4gV2VsbCB0aGUgcHJvYmxlbSBpcyB0aGF0IHRo
aXMgd29uJ3QgaGF2ZSBhbnkgZWZmZWN0Lg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEFzIFRvbSBl
eHBsYWluZWQgZW5jcnlwdGlvbiBpcyBub3QgaW1wbGVtZW50ZWQgYXMgYSBwYWdlDQo+ID4gPiA+
ID4gcHJvdGVjdGlvbiBiaXQsDQo+ID4gPiA+ID4gYnV0IHJhdGhlciBhcyBwYXJ0IG9mIHRoZSBw
aHlzaWNhbCBhZGRyZXNzIG9mIHRoZSBwYXJ0Lg0KPiA+ID4gPiBUaGlzIGlzIHdoZXJlIHRoaW5n
cyBnZXQgaW50ZXJlc3RpbmcuICBFdmVuIHRob3VnaCB0aGUNCj4gPiA+ID4gZW5jcnlwdGlvbiBi
aXQgaXMNCj4gPiA+ID4gcGFydCBvZiB0aGUgcGh5c2ljYWwgYWRkcmVzcyAoZS5nLiB1bmRlciBT
TUUgdGhlIGRldmljZQ0KPiA+ID4gPiBjb3VsZC93b3VsZCB1c2UgYW4NCj4gPiA+ID4gYWRkcmVz
cyB3aXRoIHRoZSBlbmNyeXB0aW9uIGJpdCBzZXQpLCBpdCBpcyBpbXBsZW1lbnRlZCBhcyBwYXJ0
DQo+ID4gPiA+IG9mIHRoZSBQVEUNCj4gPiA+ID4gYXR0cmlidXRlcy4gU28sIGZvciBleGFtcGxl
LCB1c2luZyBfUEFHRV9FTkMgd2hlbiBidWlsZGluZyBhDQo+ID4gPiA+IHBncHJvdCB2YWx1ZQ0K
PiA+ID4gPiB3b3VsZCBwcm9kdWNlIGFuIGVudHJ5IHdpdGggdGhlIGVuY3J5cHRpb24gYml0IHNl
dC4NCj4gPiA+ID4gDQo+ID4gPiA+IEFuZCB0aGUgdGhpbmcgdG8gd2F0Y2ggb3V0IGZvciBpcyB1
c2luZyB0d28gdmlydHVhbCBhZGRyZXNzZXMNCj4gPiA+ID4gdGhhdCBwb2ludA0KPiA+ID4gPiB0
byB0aGUgc2FtZSBwaHlzaWNhbCBhZGRyZXNzIChwYWdlKSBpbiBEUkFNIGJ1dCBvbmUgaGFzIHRo
ZQ0KPiA+ID4gPiBlbmNyeXB0aW9uIGJpdA0KPiA+ID4gPiBzZXQgYW5kIG9uZSBkb2Vzbid0LiBU
aGUgaGFyZHdhcmUgZG9lcyBub3QgZW5mb3JjZSBjb2hlcmVuY3kNCj4gPiA+ID4gYmV0d2VlbiBh
bg0KPiA+ID4gPiBlbmNyeXB0ZWQgYW5kIHVuLWVuY3J5cHRlZCBtYXBwaW5nIG9mIHRoZSBzYW1l
IHBoeXNpY2FsIGFkZHJlc3MNCj4gPiA+ID4gKHBhZ2UpLg0KPiA+ID4gPiBTZWUgc2VjdGlvbiA3
LjEwLjYgb2YgdGhlIEFNRDY0IEFyY2hpdGVjdHVyZSBQcm9ncmFtbWVyJ3MNCj4gPiA+ID4gTWFu
dWFsIFZvbHVtZSAyLg0KPiA+ID4gSW5kZWVkLiBBbmQgSSdtIHByZXR0eSBzdXJlIHRoZSBrZXJu
ZWwgbWFwIFBURSBhbmQgYSBUVE0gLyB2bWFwDQo+ID4gPiBQVEUNCj4gPiA+IHBvaW50aW5nIHRv
IHRoZSBzYW1lIGRlY3J5cHRlZCBwYWdlIGRpZmZlciBpbiB0aGUgZW5jcnlwdGlvbiBiaXQNCj4g
PiA+ICg0NykNCj4gPiA+IHNldHRpbmcuDQo+IA0KPiBUaGF0IGNhbid0IGJlIHRoZSBjYXNlLCBj
YXVzZSBvdGhlcndpc2UgYW1kZ3B1IHdvdWxkbid0IGFscmVhZHkgd29yayANCj4gd2l0aCBTTUUg
ZW5hYmxlZC4NCg0KV2l0aCBTTUUgdGhlIHNpdHVhdGlvbiBpcyBkaWZmZXJlbnQuIFRoZSBjb2hl
cmVudCBtZW1vcnkgaXMgc3RpbGwNCmVuY3J5cHRlZCwgYW5kIFRUTSBpcyBkb2luZyB0aGUgcmln
aHQgdGhpbmcuIFdpdGggU0VWIHRoZSBjb2hlcmVudA0KbWVtb3J5IGlzIG1hcmtlZCBkZWNyeXB0
ZWQsIGFuZCBUVE0gZG9lc24ndCBmb2xsb3cuIFRoYXQncyB3aHkgdGhlDQpkZWNyeXB0aW9uIGlu
IHRoZSBwYXRjaCBpcyBjb25kaXRpb25lZCBvbiBTRVYuDQoNCj4gDQo+IEkgdGhpbmsgeW91ciBw
YXRjaCBtaWdodCBnbyBpbnRvIHRoZSByaWdodCBkaXJlY3Rpb24sIGJ1dCBiZWZvcmUgd2UgDQo+
IGNvbW1pdCBhbnl0aGluZyBsaWtlIHRoYXQgd2UgbmVlZCB0byB1bmRlcnN0YW5kIGZpcnN0IGhv
dyBpdA0KPiBhY3R1YWxseSANCj4gd29ya3MgY3VycmVudGx5Lg0KPiANCj4gTWF5YmUgSSByZWFs
bHkgbmVlZCB0byBzZXR1cCBhIHRlc3Qgc3lzdGVtIGhlcmUuDQoNClRoZSBwcm9ibGVtIHdvdWxk
IGJlIHRvIGZpbmQgYSBWTSBndWVzdCB0aGF0IHVzZXMgVFRNIGluIHRoaXMgd2F5Li4NCg0KL1Ro
b21hcw0KDQoNCj4gDQo+IENocmlzdGlhbi4NCj4gDQo+ID4gPiBCdXQgb24gdGhlIGh5cGVydmlz
b3IgdGhhdCB3b3VsZCBzb3J0IG9mIHdvcmssIGJlY2F1c2UgZnJvbSB3aGF0DQo+ID4gPiBJDQo+
ID4gPiB1bmRlcnN0YW5kIHdpdGggU0VWIHdlIHNlbGVjdCBiZXR3ZWVuIHRoZSBndWVzdCBrZXkg
YW5kIHRoZQ0KPiA+ID4gaHlwZXJ2aXNvcg0KPiA+ID4ga2V5IHdpdGggdGhhdCBiaXQuIE9uIHRo
ZSBoeXBlcnZpc29yIGJvdGgga2V5cyBhcmUgdGhlIHNhbWU/IE9uIGENCj4gPiA+IGd1ZXN0DQo+
ID4gPiBpdCB3b3VsZCBwcm9iYWJseSBicmVhay4NCj4gPiBGb3IgU0VWLCBpZiB0aGUgZW5jcnlw
dGlvbiBiaXQgaXMgc2V0IHRoZW4gdGhlIGd1ZXN0IGtleSBpcyB1c2VkLg0KPiA+IElmIHRoZQ0K
PiA+IGVuY3J5cHRpb24gYml0IGlzIG5vdCBzZXQsIHRoZW4gdGhlIGh5cGVydmlzb3Iga2V5IGlz
IHVzZWQgSUZGIHRoZQ0KPiA+IGVuY3J5cHRpb24gYml0IGlzIHNldCBpbiB0aGUgaHlwZXJ2aXNv
ciBwYWdlIHRhYmxlcy4gIFlvdSBjYW4gaGF2ZQ0KPiA+IFNFVg0KPiA+IGd1ZXN0cyByZWdhcmRs
ZXNzIG9mIHdoZXRoZXIgU01FIGlzIGFjdGl2ZSAobm90ZSwgdGhlcmUgaXMgYQ0KPiA+IGRpZmZl
cmVuY2UNCj4gPiBiZXR3ZWVuIFNNRSBiZWluZyBlbmFibGVkIHZzLiBTTUUgYmVpbmcgYWN0aXZl
KS4NCj4gPiANCj4gPiBGb3IgU01FLCB0aGVyZSBpcyBvbmx5IG9uZSBrZXkuIFRoZSBlbmNyeXB0
aW9uIGJpdCBkZXRlcm1pbmVzDQo+ID4gd2hldGhlciB0aGUNCj4gPiBkYXRhIGlzIHJ1biB0aHJv
dWdoIHRoZSBlbmNyeXB0aW9uIHByb2Nlc3Mgb3Igbm90Lg0KPiA+IA0KPiA+IFRoYW5rcywNCj4g
PiBUb20NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
