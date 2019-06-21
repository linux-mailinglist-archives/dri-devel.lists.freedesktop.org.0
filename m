Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE884E7DA
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 14:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23AE6E89B;
	Fri, 21 Jun 2019 12:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760041.outbound.protection.outlook.com [40.107.76.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F8B6E89B;
 Fri, 21 Jun 2019 12:13:56 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1948.namprd12.prod.outlook.com (10.175.88.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Fri, 21 Jun 2019 12:13:54 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935%6]) with mapi id 15.20.1987.014; Fri, 21 Jun 2019
 12:13:54 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Topic: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Index: AQHVFGTgR+jNVTHnhkq6fR69g1cCsaabKzyAgAAM3YCAADG2gIAAAe0AgAl2VwCAAPZpAIAAIOaAgAAEQoCAAALHAIAADKCAgAADNICAAAYrgIAAA7EAgAAOdoCAAAQ0AA==
Date: Fri, 21 Jun 2019 12:13:54 +0000
Message-ID: <76158d1f-676d-2afa-244b-934967a9cb75@amd.com>
References: <84b3337c-0cdc-44d4-02c6-c56bd729ed47@amd.com>
 <20190620163012.GF1896@arch-x1c3>
 <9cad6e74-4751-0b0a-35d1-e8f0ac4d3efc@amd.com>
 <20190621090953.GZ12905@phenom.ffwll.local>
 <be9f38f5-6bb5-9535-f3d9-bafa83370e0f@amd.com>
 <CAKMK7uE5qO4q3RYNDp22gkMSSJGgz9ChxhuWPYqXO6D1UUvy6Q@mail.gmail.com>
 <20190621102015.GA21486@arch-x1c3>
 <d241fab3-b6f0-d38a-b83f-03b70736b355@amd.com>
 <20190621105347.GB21486@arch-x1c3>
 <338bb519-05f1-cb76-d965-81237f432937@amd.com>
 <20190621115845.GC21486@arch-x1c3>
In-Reply-To: <20190621115845.GC21486@arch-x1c3>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0074.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::14) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: efec70e8-83e9-419d-012d-08d6f641eda1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1948; 
x-ms-traffictypediagnostic: DM5PR12MB1948:
x-microsoft-antispam-prvs: <DM5PR12MB194840D1FB8F67F76AF4898883E70@DM5PR12MB1948.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:177;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(396003)(346002)(376002)(136003)(199004)(189003)(81166006)(6916009)(66446008)(58126008)(65806001)(65956001)(52116002)(256004)(6486002)(11346002)(66946007)(6512007)(66556008)(229853002)(14444005)(64756008)(66476007)(486006)(6246003)(386003)(76176011)(73956011)(7736002)(476003)(54906003)(2616005)(31686004)(102836004)(14454004)(46003)(99286004)(186003)(86362001)(446003)(4326008)(36756003)(25786009)(6436002)(316002)(31696002)(6116002)(6506007)(305945005)(65826007)(478600001)(53936002)(71200400001)(8676002)(71190400001)(68736007)(2906002)(8936002)(81156014)(64126003)(72206003)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1948;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9tl8PiHd3kSw1gVgn+VX6ksVcRyxmlCcH+6hYQ3tfkcuTT11MjBlLmhxNG29DlWk0Ahyjbk90L20lyehs2h1pYN82hBBu4d1YpJgrAV7J4C5b5dXm0vdwNgaCAoqE+3tv+ntV3EVDHsnmFNYoZUTHvsjkGcghxFq4loJoyVQSuUxALvMtuuV6ZKC6Je9jjKI05P3wzK/ndhP4IHZMLH2FBvR28eWyquVfA00tvH+SKFOdzDSkyTRBFOpCClJZI60oi3GDZ5NoDlRgmQo51zWHQtATdmMXtSvicPuuW5PZPErUSg79wgsCGwiVXnYxFn/wlPX32KtVYjnm28mfV+Xt3Q0XQQo+6n3Vldel36vi3y9B6VoRwZznm85kdaHvyxewUHXj3fOpfdj48vecTGdPNjjRGxoti65k30cdFBi+XM=
Content-ID: <CE5CD21BFDD951449D44878C1C6114A7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efec70e8-83e9-419d-012d-08d6f641eda1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 12:13:54.5597 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1948
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17K9n8ceHkhA00w5qyB4+Mvy6L2QCGKOQBcESPv892w=;
 b=QUbRamwUElEAV7S4d78qG7BVAU23t1IGOLMEnSVNPjtZnYIIFBolTz6veiNkUBChzmnhFCOkoriCrPNv8dv+u0yJD1y21Hgg+spUT0bvjWDAK+baLme0NLB35yBEHpiNfL4QxozLb7aivPIt5JPwr24SSEodPMvFdv2ayCsx1YU=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 David Airlie <airlied@linux.ie>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDYuMTkgdW0gMTM6NTggc2NocmllYiBFbWlsIFZlbGlrb3Y6DQo+IE9uIDIwMTkvMDYv
MjEsIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPj4gQW0gMjEuMDYuMTkgdW0gMTI6NTMgc2No
cmllYiBFbWlsIFZlbGlrb3Y6DQo+Pj4gT24gMjAxOS8wNi8yMSwgS29lbmlnLCBDaHJpc3RpYW4g
d3JvdGU6DQo+Pj4+IFtTTklQXQ0KPj4+PiBXZWxsIHBhcnRpYWxseS4gVGhhdCBSQURWIGJyb2tl
IGlzIHVuZm9ydHVuYXRlLCBidXQgd2UgaGF2ZSBkb25lIHNvIG1hbnkNCj4+Pj4gY3VzdG9taXpl
ZCB1c2Vyc3BhY2Ugc3R1ZmYgYm90aCBiYXNlZCBvbiBNZXNhL0REWCBhcyB3ZWxsIGFzIGNsb3Nl
ZA0KPj4+PiBzb3VyY2UgY29tcG9uZW50cyB0aGF0IGl0IGlzIGp1c3QgaGlnaGx5IGxpa2VseSB0
aGF0IHdlIHdvdWxkIGJyZWFrDQo+Pj4+IHNvbWV0aGluZyBlbHNlIGFzIHdlbGwuDQo+Pj4+DQo+
Pj4gQXMgYW4gZW5naW5lZXIgSSBsaWtlIHRvIHdvcmsgd2l0aCB0YW5naWJsZXMuIFRoZSBoaWdo
bHkgbGlrZWx5IHBhcnQgaXMNCj4+PiBwcm9iYWJsZSwgYnV0IGFzIG1lbnRpb25lZCBtdWx0aXBs
ZSB0aW1lcyB0aGUgc2VyaWVzIGFsbG93cyBmb3IgYSBfZGVhZF8NCj4+PiB0cml2aWFsIHdheSB0
byBhZGRyZXNzIGFueSBzdWNoIHByb2JsZW1zLg0KPj4gV2VsbCB0byBjbGFyaWZ5IG15IGNvbmNl
cm4gaXMgdGhhdCB0aGlzIHdvbid0IGJlIHNvIHRyaXZpYWwuDQo+Pg0KPj4gWW91IGltcGxlbWVu
dGVkIG9uIHdvcmthcm91bmQgZm9yIG9uZSBzcGVjaWZpYyBjYXNlIGFuZCBpdCBpcyBwZXJmZWN0
bHkNCj4+IHBvc3NpYmxlIHRoYXQgZm9yIG90aGVyIGNhc2VzIHdlIHdvdWxkIGhhdmUgdG8gY29t
cGxldGVseSByZXZlcnQgdGhlDQo+PiByZW1vdmFsIG9mIERSTV9BVVRILg0KPj4NCj4gSSB3b3Vs
ZCBlbmNvdXJhZ2UgeW91IHRvIHRha2UgYSBjbG9zZXIgbG9vayBhdCBteSBwYXRjaCBhbmQgcG9p
bnQgb3V0DQo+IGhvdyBwYXJjaWN1bGFyIGNhc2VzIGNhbm5vdCBiZSBoYW5kbGVkLg0KDQpXZWxs
IHRoZSBsYXN0IHRpbWUgSSBsb29rZWQgaXQgb25seSBibG9ja2VkIHRoZSBmaXJzdCBjYWxsIHRv
IHRoZSBJT0NUTC4NCg0KSWYgdGhhdCBpcyBubyBsb25nZXIgdGhlIGNhc2UgdGhlbiB3aGF0IGlz
IHRoZSBhY3R1YWwgZGlmZmVyZW5jZSB0byANCkRSTV9BVVRIK0RSTV9BTExPV19SRU5ERVI/DQoN
Cj4+Pj4+IEluIHBhcnRpY3VsYXIsIHRoYXQgdXNlci1zcGFjZSB3aWxsICJyZW1vdmUiIHJlbmRl
ciBub2Rlcy4NCj4+Pj4gWWVzLCB0aGF0IGlzIG15IG1haW4gY29uY2VybiBoZXJlLiBZb3UgYmFz
aWNhbGx5IG1ha2UgcmVuZGVyIG5vZGVzDQo+Pj4+IHN1cGVyZmx1b3VzbHkuIFRoYXQgZ2l2ZXMg
dXNlcnNwYWNlIGFsbCBsZWdpdGltaXphdGlvbiB0byBhbHNvIHJlbW92ZQ0KPj4+PiBzdXBwb3J0
IGZvciB0aGVtLiBUaGF0IGlzIG5vdCBzdHVwaWQgb3IgZXZpbCBvciB3aGF0ZXZlciwgdXNlcnNw
YWNlDQo+Pj4+IHdvdWxkIGp1c3QgZm9sbG93IHRoZSBrZXJuZWwgZGVzaWduLg0KPj4+Pg0KPj4+
IERvIHlvdSBoYXZlIGFuIGV4YW1wbGUgb2YgdXNlcnNwYWNlIGRvaW5nIHN1Y2ggYW4gZXh0cmVt
ZWx5IHNpbGx5IHRoaW5nPw0KPj4+IEl0IGRvZXMgc2VlbSBsaWtlIHN1c3BlY3QgeW91J3JlIGEg
Y291cGxlIG9mIHN0ZXBzIGJleW9uZCBvdmVyY2F1dGlvdXMsDQo+Pj4gcGVyaGFwcyByaWdodGZ1
bGx5IHNvLiBNYXliZSB5b3UndmUgc2VlbiBzb21lIGNsb3NlZC1zb3VyY2UgdXNlci1zcGFjZQ0K
Pj4+IGdvaW5nIGNyYXp5PyBPciBhbnkgb3RoZXIgcHJvamVjdHM/DQo+PiBUaGUga2V5IHBvaW50
IGlzIHRoYXQgSSBkb24ndCB0aGluayB0aGlzIGlzIHNpbGx5IG9yIHN0cmFuZ2Ugb3IgY3Jhenkg
YXQNCj4+IGFsbC4gU2VlIHRoZSBrZXJuZWwgZGVmaW5lcyB0aGUgaW50ZXJmYWNlIHVzZXJzcGFj
ZSBjYW4gYW5kIHNob3VsZCB1c2UuDQo+Pg0KPj4gV2hlbiB0aGUga2VybmVsIGRlZmluZXMgdGhh
dCBldmVyeXRoaW5nIHdpbGwgd29yayB3aXRoIHRoZSBwcmltYXJ5IG5vZGUNCj4+IGl0IGlzIHBl
cmZlY3RseSB2YWxpZCBmb3IgdXNlcnNwYWNlIHRvIGRyb3Agc3VwcG9ydCBmb3IgdGhlIHJlbmRl
ciBub2RlLg0KPj4NCj4+IEkgbWVhbiB3aHkgc2hvdWxkIHRoZXkga2VlcCB0aGlzPyBKdXN0IGJl
Y2F1c2Ugd2UgdGVsbCB0aGVtIG5vdCB0byBkbyB0aGlzPw0KPj4NCj4gIEZyb20geW91ciBleHBl
cmllbnNlLCBkbyB1c2VyLXNwYWNlIGRldmVsb3BlcnMgY2FyZSBhYm91dCBkb2luZyAob3INCj4g
Z2VuZXJhbGx5IGRvKSB0aGUgcmlnaHQgdGhpbmc/DQoNCk5vLCBub3QgYXQgYWxsLiBFeGNlcHQg
Zm9yIE1hcmVrIGFuZCBNaWNoZWwgdGhleSBqdXN0IHRha2Ugd2hhdCB3b3JrcyANCmFuZCBldmVu
IE1hcmVrIGlzIG9mdGVuIHNob3J0LWN1dHRpbmcgb24gdGhpcy4NCg0KPiBJbiBlaXRoZXIgY2Fz
ZSwgYXMgcG9pbnRlZCBhbHJlYWR5IHRoZSBjYXQgaXMgb3V0IG9mIHRoZSBiYWcgLSBoYXMgYmVl
bg0KPiBmb3IgeWVhcnMsIGFuZCBpZiBkZXZlbG9wZXJzIGRpZCBiZWhhdmUgYXMgeW91IGRlc2Ny
aWJlIHRoZW0gdGhleSB3b3VsZA0KPiBoYXZlICJyZW1vdmVkIiByZW5kZXIgbm9kZXMgYWxyZWFk
eS4NCg0KQ3VycmVudGx5IHJlbmRlciBub2RlcyBhcmUgbWFuZGF0b3J5IGJlY2F1c2UgdGhleSBh
cmUgbmVlZGVkIGZvciANCmhlYWRsZXNzIG9wZXJhdGlvbi4NCg0KRS5nLiB3ZSBoYXZlIGEgd2hv
bGUgYnVuY2ggb2YgY3VzdG9tZXJzIHdoaWNoIGRvIHRyYW5zY29kaW5nIHdpdGggdGhhdCANCm9u
IEdQVXMgd2hpY2ggZG9uJ3QgZXZlbiBoYXZlIGEgQ1JUQyBvciBldmVuIFggcnVubmluZy4NCg0K
UmVnYXJkcywNCkNocmlzdGlhbi4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
