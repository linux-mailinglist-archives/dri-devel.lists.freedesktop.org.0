Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F0C297C5
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 14:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BBD6E0D7;
	Fri, 24 May 2019 12:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810078.outbound.protection.outlook.com [40.107.81.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A28F6E0D7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 12:03:43 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1644.namprd12.prod.outlook.com (10.172.39.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.17; Fri, 24 May 2019 12:03:41 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1922.018; Fri, 24 May 2019
 12:03:41 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Thomas Hellstrom <thomas@shipmail.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [RFC PATCH] drm/ttm, drm/vmwgfx: Have TTM support AMD SEV
 encryption
Thread-Topic: [RFC PATCH] drm/ttm, drm/vmwgfx: Have TTM support AMD SEV
 encryption
Thread-Index: AQHVEghVWyfc42SAm0iQ56wuAPU/AaZ589eAgAAJjQCAAAwvAIAABk4AgAAFh4CAABf0gA==
Date: Fri, 24 May 2019 12:03:41 +0000
Message-ID: <79c8d26a-d2dd-3e2c-f0bc-cbfc47a67fee@amd.com>
References: <20190524081114.53661-1-thomas@shipmail.org>
 <f2c4ccdd-49c9-2188-3378-2f333a8f605f@amd.com>
 <d397836b-13a4-b6cd-e059-035203f2edc6@shipmail.org>
 <d59cb481-1360-25eb-a2da-1ae64c648daf@shipmail.org>
 <84fa57da-7bb7-8322-125a-89596fbb2145@amd.com>
 <33816cbd-ddfb-b47a-a305-2760f8568eff@shipmail.org>
In-Reply-To: <33816cbd-ddfb-b47a-a305-2760f8568eff@shipmail.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM3PR07CA0092.eurprd07.prod.outlook.com
 (2603:10a6:207:6::26) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 925120cb-b087-4219-819e-08d6e03fdcac
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1644; 
x-ms-traffictypediagnostic: DM5PR12MB1644:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB1644DF5445D8AF8E4A66C5EA83020@DM5PR12MB1644.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0047BC5ADE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(366004)(396003)(376002)(39860400002)(199004)(189003)(110136005)(76176011)(66574012)(6512007)(7736002)(53546011)(6306002)(6506007)(386003)(6246003)(316002)(73956011)(65826007)(99286004)(58126008)(31686004)(46003)(6486002)(5660300002)(8936002)(66446008)(2906002)(52116002)(68736007)(256004)(66556008)(64126003)(53936002)(2501003)(66476007)(71190400001)(14444005)(186003)(64756008)(81156014)(66946007)(65956001)(6436002)(229853002)(478600001)(2616005)(71200400001)(4326008)(14454004)(72206003)(446003)(486006)(31696002)(6116002)(8676002)(476003)(11346002)(86362001)(65806001)(305945005)(81166006)(36756003)(25786009)(966005)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1644;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ynMz91DfoNkMyR9mFtSUYCQ1yzdzaN4OLel+XkF5DAHRLxthjpLJgOHr4c68P/u4LTqnWUk+GtjUJcbs7ga42v5fQVKfpg+GjMSv2mIwJZ+rv/XrY4yoqKaQHcPAUJAJyV1HhVbKCUpJer4rafsLrd6LjSI9+omRlTzohCV31notgPNjsa9j+eNnzrNEbrKfr896G0nfTCvC9HJ4Csf0CqaL+3DpHol50mIL/W0nD/NKM+Pv3p6vEIGBrZ8PI4+jAScVycR5tzCSOF6lexwraU9QmbS/rWgPLj6hueS/yJueZfGxbp0u7femWb5xXbgr3j23pZEo+/6O4f39lpNpg4bf75NsYFIIL0r9rQ/8HODBQpzCCQSf5dd5jCGKH093yXXtLuDCbXp7EspApmosOTYHQUlgHlubqgbI56u6BT0=
Content-ID: <F7E75A22632B0E4BAA339B12E8B0F9B9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 925120cb-b087-4219-819e-08d6e03fdcac
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2019 12:03:41.3611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1644
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wormkcaw5wDHrO+tnJv8eXmRH9bMY/M1jMAKOFvO73E=;
 b=Ooln7ajbCGdhbGeoCvUX5QTvFSaJxkd+fEbJKyEAyESbKSCfR4NE7bmbByLnLbkWA5L83DvmDEokv+Uu7Zke6TXIM8qsqg8ZvEzat/rhJh6vmwb3LUjRcSiF+iZ8H1KmXLBAvObwM/ojVW50/auGkjLSzx+GkZk7D7vj9Q9DSKU=
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjQuMDUuMTkgdW0gMTI6Mzcgc2NocmllYiBUaG9tYXMgSGVsbHN0cm9tOg0KPiBbQ0FVVElP
TjogRXh0ZXJuYWwgRW1haWxdDQo+DQo+IE9uIDUvMjQvMTkgMTI6MTggUE0sIEtvZW5pZywgQ2hy
aXN0aWFuIHdyb3RlOg0KPj4gQW0gMjQuMDUuMTkgdW0gMTE6NTUgc2NocmllYiBUaG9tYXMgSGVs
bHN0cm9tOg0KPj4+IFtDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCj4+Pg0KPj4+IE9uIDUvMjQv
MTkgMTE6MTEgQU0sIFRob21hcyBIZWxsc3Ryb20gd3JvdGU6DQo+Pj4+IEhpLCBDaHJpc3RpYW4s
DQo+Pj4+DQo+Pj4+IE9uIDUvMjQvMTkgMTA6MzcgQU0sIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3Rl
Og0KPj4+Pj4gQW0gMjQuMDUuMTkgdW0gMTA6MTEgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAo
Vk13YXJlKToNCj4+Pj4+PiBbQ0FVVElPTjogRXh0ZXJuYWwgRW1haWxdDQo+Pj4+Pj4NCj4+Pj4+
PiBGcm9tOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+DQo+Pj4+Pj4N
Cj4+Pj4+PiBXaXRoIFNFViBlbmNyeXB0aW9uLCBhbGwgRE1BIG1lbW9yeSBtdXN0IGJlIG1hcmtl
ZCBkZWNyeXB0ZWQNCj4+Pj4+PiAoQUtBICJzaGFyZWQiKSBmb3IgZGV2aWNlcyB0byBiZSBhYmxl
IHRvIHJlYWQgaXQuIEluIHRoZSBmdXR1cmUgd2UNCj4+Pj4+PiBtaWdodA0KPj4+Pj4+IHdhbnQg
dG8gYmUgYWJsZSB0byBzd2l0Y2ggbm9ybWFsIChlbmNyeXB0ZWQpIG1lbW9yeSB0byBkZWNyeXB0
ZWQgaW4NCj4+Pj4+PiBleGFjdGx5DQo+Pj4+Pj4gdGhlIHNhbWUgd2F5IGFzIHdlIGhhbmRsZSBj
YWNoaW5nIHN0YXRlcywgYW5kIHRoYXQgd291bGQgcmVxdWlyZQ0KPj4+Pj4+IGFkZGl0aW9uYWwN
Cj4+Pj4+PiBtZW1vcnkgcG9vbHMuIEJ1dCBmb3Igbm93LCByZWx5IG9uIG1lbW9yeSBhbGxvY2F0
ZWQgd2l0aA0KPj4+Pj4+IGRtYV9hbGxvY19jb2hlcmVudCgpIHdoaWNoIGlzIGFscmVhZHkgZGVj
cnlwdGVkIHdpdGggU0VWIGVuYWJsZWQuDQo+Pj4+Pj4gU2V0IHVwDQo+Pj4+Pj4gdGhlIHBhZ2Ug
cHJvdGVjdGlvbiBhY2NvcmRpbmdseS4gRHJpdmVycyBtdXN0IGRldGVjdCBTRVYgZW5hYmxlZCBh
bmQNCj4+Pj4+PiBzd2l0Y2gNCj4+Pj4+PiB0byB0aGUgZG1hIHBhZ2UgcG9vbC4NCj4+Pj4+Pg0K
Pj4+Pj4+IFRoaXMgcGF0Y2ggaGFzIG5vdCB5ZXQgYmVlbiB0ZXN0ZWQuIEFzIGEgZm9sbG93LXVw
LCB3ZSBtaWdodCB3YW50IHRvDQo+Pj4+Pj4gY2FjaGUgZGVjcnlwdGVkIHBhZ2VzIGluIHRoZSBk
bWEgcGFnZSBwb29sIHJlZ2FyZGxlc3Mgb2YgdGhlaXIgDQo+Pj4+Pj4gY2FjaGluZw0KPj4+Pj4+
IHN0YXRlLg0KPj4+Pj4gVGhpcyBwYXRjaCBpcyB1bm5lY2Vzc2FyeSwgU0VWIHN1cHBvcnQgYWxy
ZWFkeSB3b3JrcyBmaW5lIHdpdGggYXQgDQo+Pj4+PiBsZWFzdA0KPj4+Pj4gYW1kZ3B1IGFuZCBJ
IHdvdWxkIGV4cGVjdCB0aGF0IGl0IGFsc28gd29ya3Mgd2l0aCBvdGhlciBkcml2ZXJzIGFzDQo+
Pj4+PiB3ZWxsLg0KPj4+Pj4NCj4+Pj4+IEFsc28gc2VlIHRoaXMgcGF0Y2g6DQo+Pj4+Pg0KPj4+
Pj4gY29tbWl0IDY0ZTFmODMwZWE1YjM1MTZhNDI1NmVkMWM1MDRhMjY1ZDdmMmE2NWMNCj4+Pj4+
IEF1dGhvcjogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPj4+
Pj4gRGF0ZTrCoMKgIFdlZCBNYXIgMTMgMTA6MTE6MTkgMjAxOSArMDEwMA0KPj4+Pj4NCj4+Pj4+
IMKgwqDCoMKgwqDCoCBkcm06IGZhbGxiYWNrIHRvIGRtYV9hbGxvY19jb2hlcmVudCB3aGVuIG1l
bW9yeSBlbmNyeXB0aW9uIGlzDQo+Pj4+PiBhY3RpdmUNCj4+Pj4+DQo+Pj4+PiDCoMKgwqDCoMKg
wqAgV2UgY2FuJ3QganVzdCBtYXAgYW55IHJhbmRvbWUgcGFnZSB3ZSBnZXQgd2hlbiBtZW1vcnkN
Cj4+Pj4+IGVuY3J5cHRpb24gaXMNCj4+Pj4+IMKgwqDCoMKgwqDCoCBhY3RpdmUuDQo+Pj4+Pg0K
Pj4+Pj4gwqDCoMKgwqDCoMKgIFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4+Pj4+IMKgwqDCoMKgwqDCoCBBY2tlZC1ieTogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPj4+Pj4gwqDCoMKgwqDCoMKgIExp
bms6IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA4NTA4MzMvDQo+Pj4+Pg0K
Pj4+Pj4gUmVnYXJkcywNCj4+Pj4+IENocmlzdGlhbi4NCj4+Pj4gWWVzLCBJIG5vdGljZWQgdGhh
dC4gQWx0aG91Z2ggSSBmYWlsIHRvIHNlZSB3aGVyZSB3ZSBhdXRvbWFnaWNhbGx5DQo+Pj4+IGNs
ZWFyIHRoZSBQVEUgZW5jcnlwdGVkIGJpdCB3aGVuIG1hcHBpbmcgY29oZXJlbnQgbWVtb3J5PyBG
b3IgdGhlDQo+Pj4+IGxpbmVhciBrZXJuZWwgbWFwLCB0aGF0J3MgZG9uZSB3aXRoaW4gZG1hX2Fs
bG9jX2NvaGVyZW50KCkgYnV0IGZvcg0KPj4+PiBrZXJuZWwgdm1hcHMgYW5kIGFuZCB1c2VyLXNw
YWNlIG1hcHM/IElzIHRoYXQgZG9uZSBhdXRvbWF0aWNhbGx5IGJ5DQo+Pj4+IHRoZSB4ODYgcGxh
dGZvcm0gbGF5ZXI/DQo+PiBZZXMsIEkgdGhpbmsgc28uIEhhdmVuJ3QgbG9va2VkIHRvIGNsb3Nl
bHkgYXQgdGhpcyBlaXRoZXIuDQo+DQo+IFRoaXMgc291bmRzIGEgYml0IG9kZC4gSWYgdGhhdCB3
ZXJlIHRoZSBjYXNlLCB0aGUgbmF0dXJhbCBwbGFjZSB3b3VsZCBiZQ0KPiB0aGUgUEFUIHRyYWNr
aW5nIGNvZGUsIGJ1dCBpdCBvbmx5IGhhbmRsZXMgY2FjaGluZyBmbGFncyBBRkFJQ1QuIE5vdA0K
PiBlbmNyeXB0aW9uIGZsYWdzLg0KPg0KPiBCdXQgd2hlbiB5b3UgdGVzdGVkIEFNRCB3aXRoIFNF
Viwgd2FzIHRoYXQgcnVubmluZyBhcyBoeXBlcnZpc29yIHJhdGhlcg0KPiB0aGFuIGEgZ3Vlc3Qs
IG9yIGRpZCB5b3UgcnVuIGFuIFNFViBndWVzdCB3aXRoIFBDSSBwYXNzdGhyb3VnaCB0byB0aGUN
Cj4gQU1EIGRldmljZT8NCg0KWWVhaCwgd2VsbCB0aGUgcHJvYmxlbSBpcyB3ZSBuZXZlciB0ZXN0
ZWQgdGhpcyBvdXJzZWxmIDopDQoNCj4NCj4+DQo+Pj4+IC9UaG9tYXMNCj4+Pj4NCj4+PiBBbmQs
IGFzIGEgZm9sbG93IHVwIHF1ZXN0aW9uLCB3aHkgZG8gd2UgbmVlZCBkbWFfYWxsb2NfY29oZXJl
bnQoKSB3aGVuDQo+Pj4gdXNpbmcgU01FPyBJIHRob3VnaHQgdGhlIGhhcmR3YXJlIHBlcmZvcm1z
IHRoZSBkZWNyeXB0aW9uIHdoZW4gRE1BLWluZw0KPj4+IHRvIC8gZnJvbSBhbiBlbmNyeXB0ZWQg
cGFnZSB3aXRoIFNNRSwgYnV0IG5vdCB3aXRoIFNFVj8NCj4+IEkgdGhpbmsgdGhlIGlzc3VlIHdh
cyB0aGF0IHRoZSBETUEgQVBJIHdvdWxkIHRyeSB0byB1c2UgYSBib3VuY2UgYnVmZmVyDQo+PiBp
biB0aGlzIGNhc2UuDQo+DQo+IFNFViBmb3JjZXMgU1dJT1RMQiBib3VuY2luZyBvbiwgYnV0IG5v
dCBTTUUuIFNvIGl0IHNob3VsZCBwcm9iYWJseSBiZQ0KPiBwb3NzaWJsZSB0byBhdm9pZCBkbWFf
YWxsb2NfY29oZXJlbnQoKSBpbiB0aGUgU01FIGNhc2UuDQoNCkluIHRoaXMgY2FzZSBJIGRvbid0
IGhhdmUgYW4gZXhwbGFuYXRpb24gZm9yIHRoaXMuDQoNCkZvciB0aGUgYmFja2dyb3VuZCB3aGF0
IGhhcHBlbmVkIGlzIHRoYXQgd2UgZ290IHJlcG9ydHMgdGhhdCBTVkUvU01FIA0KZG9lc24ndCB3
b3JrIHdpdGggYW1kZ3B1LiBTbyB3ZSB0b2xkIHRoZSBwZW9wbGUgdG8gdHJ5IHVzaW5nIHRoZSAN
CmRtYV9hbGxvY19jb2hlcmVudCgpIHBhdGggYW5kIHRoYXQgd29ya2VkIGZpbmUuIEJlY2F1c2Ug
b2YgdGhpcyB3ZSBjYW1lIA0KdXAgd2l0aCB0aGUgcGF0Y2ggSSBub3RlZCBlYXJsaWVyLg0KDQpJ
IGNhbiBjb25maXJtIHRoYXQgaXQgaW5kZWVkIHdvcmtzIG5vdyBmb3IgYSBjb3VwbGUgb2YgdXNl
cnMsIGJ1dCB3ZSANCnN0aWxsIGRvbid0IGhhdmUgYSB0ZXN0IHN5c3RlbSBmb3IgdGhpcyBpbiBv
dXIgdGVhbS4NCg0KQ2hyaXN0aWFuLg0KDQo+DQo+IC9UaG9tYXMNCj4NCj4NCj4+DQo+PiBDaHJp
c3RpYW4uDQo+Pg0KPj4+IFRoYW5rcywgVGhvbWFzDQo+Pj4NCj4+Pg0KPj4+DQo+DQoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
