Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B344E5F0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 12:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 558206E169;
	Fri, 21 Jun 2019 10:31:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710083.outbound.protection.outlook.com [40.107.71.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB546E169;
 Fri, 21 Jun 2019 10:31:53 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1259.namprd12.prod.outlook.com (10.168.237.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Fri, 21 Jun 2019 10:31:49 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935%6]) with mapi id 15.20.1987.014; Fri, 21 Jun 2019
 10:31:49 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Emil Velikov <emil.l.velikov@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Topic: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Index: AQHVFGTgR+jNVTHnhkq6fR69g1cCsaabKzyAgAAM3YCAADG2gIAAAe0AgAl2VwCAAPZpAIAAIOaAgAAEQoCAAALHAIAADKCAgAADNIA=
Date: Fri, 21 Jun 2019 10:31:49 +0000
Message-ID: <d241fab3-b6f0-d38a-b83f-03b70736b355@amd.com>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190614120927.GA32412@arch-x1c3>
 <9dbdda6c-8916-e5ae-1676-86828b9890e7@amd.com>
 <20190614155325.GC32412@arch-x1c3>
 <84b3337c-0cdc-44d4-02c6-c56bd729ed47@amd.com>
 <20190620163012.GF1896@arch-x1c3>
 <9cad6e74-4751-0b0a-35d1-e8f0ac4d3efc@amd.com>
 <20190621090953.GZ12905@phenom.ffwll.local>
 <be9f38f5-6bb5-9535-f3d9-bafa83370e0f@amd.com>
 <CAKMK7uE5qO4q3RYNDp22gkMSSJGgz9ChxhuWPYqXO6D1UUvy6Q@mail.gmail.com>
 <20190621102015.GA21486@arch-x1c3>
In-Reply-To: <20190621102015.GA21486@arch-x1c3>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0184.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::28) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4ed4828-c99d-4ad6-724c-08d6f633ab11
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1259; 
x-ms-traffictypediagnostic: DM5PR12MB1259:
x-microsoft-antispam-prvs: <DM5PR12MB1259692B70293AFC1FBA096183E70@DM5PR12MB1259.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(136003)(376002)(39850400004)(346002)(189003)(199004)(31686004)(65956001)(229853002)(478600001)(6436002)(186003)(8676002)(81156014)(68736007)(6512007)(65806001)(86362001)(11346002)(6116002)(64126003)(46003)(31696002)(6246003)(72206003)(65826007)(8936002)(81166006)(5660300002)(4326008)(2616005)(476003)(14454004)(25786009)(36756003)(2906002)(6486002)(446003)(76176011)(52116002)(486006)(66946007)(73956011)(102836004)(386003)(305945005)(53546011)(53936002)(66476007)(66556008)(64756008)(66446008)(54906003)(6506007)(71200400001)(58126008)(110136005)(71190400001)(7736002)(99286004)(316002)(256004)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1259;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ASSM0PEw1HAGUz/UWPTgzBvA4eMe1alIGIaQjT3ATOgV85k/xajpgiAEsDctaJu0UUZhWp1MBdrY4cLWiPc1f0g+6r+6X4KnrB5qWrAaRWTO6HhagNwL+RA+eaxcXSe15B7gdY918TGft+MMeIyjgHpXbJapD0tVi4S93iknhuMcyvqwuy6323XFU4h2OYYhmAwEByz2s0vUBeHOMoqWl4/yQ1D3z68WvmSPmoKJdfyl/8XK4LL4bJsJI90Y0iuYW6mQZZ00TYIjFIoCQIGTF0H9jZ/PAfbRhGBffFBQEfIAAssujjqXnK70mHAUXF/Gcw4MJx3JrrWACLnfAg2ATy/1yvwL3fP+AoLLrzBZ1MHYdZN0ZGwIsOIzniBQQaX56Xf04yjuNPvTI7sCoTIc9LfSk8+fY7cQ2jm391IMVKY=
Content-ID: <43C2E69228CEAD40B60747042A041126@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ed4828-c99d-4ad6-724c-08d6f633ab11
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 10:31:49.7269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1259
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8OJt9480lUvBwPIuVBk0uyQVRZtgKf7gTnZVMBLAs68=;
 b=Um32QnHCvbbEPaS3YVmnu/xgdqhcqH6rQhIpq3f/er8Z6TAy+2An1q1WSreWAMlEj/sEERXWvp9p4DLGvzlK2nEXHkHGxalb4GujaSli0Sl3WGlqZLAstXDSEp0qrmubDldaBdEvFLcu7iWSJkoVaN1kLkXe6nmbxEG9hpQ6FTY=
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

QW0gMjEuMDYuMTkgdW0gMTI6MjAgc2NocmllYiBFbWlsIFZlbGlrb3Y6DQo+IE9uIDIwMTkvMDYv
MjEsIERhbmllbCBWZXR0ZXIgd3JvdGU6DQo+PiBPbiBGcmksIEp1biAyMSwgMjAxOSBhdCAxMToy
NSBBTSBLb2VuaWcsIENocmlzdGlhbg0KPj4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4gd3Jv
dGU6DQo+Pj4gQW0gMjEuMDYuMTkgdW0gMTE6MDkgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPj4+
PiBPbiBGcmksIEp1biAyMSwgMjAxOSBhdCAwNzoxMjoxNEFNICswMDAwLCBLb2VuaWcsIENocmlz
dGlhbiB3cm90ZToNCj4+Pj4+IEFtIDIwLjA2LjE5IHVtIDE4OjMwIHNjaHJpZWIgRW1pbCBWZWxp
a292Og0KPj4+Pj4+IE9uIDIwMTkvMDYvMTQsIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPj4+
Pj4+PiBBbSAxNC4wNi4xOSB1bSAxNzo1MyBzY2hyaWViIEVtaWwgVmVsaWtvdjoNCj4+Pj4+Pj4+
IE9uIDIwMTkvMDYvMTQsIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPj4+Pj4+Pj4+IEFtIDE0
LjA2LjE5IHVtIDE0OjA5IHNjaHJpZWIgRW1pbCBWZWxpa292Og0KPj4+Pj4+Pj4+PiBPbiAyMDE5
LzA1LzI3LCBFbWlsIFZlbGlrb3Ygd3JvdGU6DQo+Pj4+Pj4+Pj4+IFtTTklQXQ0KPj4+Pj4+Pj4+
PiBIaSBDaHJpc3RpYW4sDQo+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+IEluIHRo
ZSBmb2xsb3dpbmcsIEkgd291bGQgbGlrZSB0byBzdW1tYXJpc2UgYW5kIGVtcGhhc2l6ZSB0aGUg
bmVlZCBmb3INCj4+Pj4+Pj4+Pj4gRFJNX0FVVEggcmVtb3ZhbC4gSSB3b3VsZCBraW5kbHkgYXNr
IHlvdSB0byBzcGVuZCBhIGNvdXBsZSBvZiBtaW51dGVzDQo+Pj4+Pj4+Pj4+IGV4dHJhIHJlYWRp
bmcgaXQuDQo+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+IFRvZGF5IERSTSBkcml2
ZXJzKiBkbyBub3QgbWFrZSBhbnkgZGlzdGluY3Rpb24gYmV0d2VlbiBwcmltYXJ5IGFuZA0KPj4+
Pj4+Pj4+PiByZW5kZXIgbm9kZSBjbGllbnRzLg0KPj4+Pj4+Pj4+IFRoYXQgaXMgYWN0dWFsbHkg
bm90IDEwMCUgY29ycmVjdC4gV2UgaGF2ZSBhIHNwZWNpYWwgY2FzZSB3aGVyZSBhIERSTQ0KPj4+
Pj4+Pj4+IG1hc3RlciBpcyBhbGxvd2VkIHRvIGNoYW5nZSB0aGUgcHJpb3JpdHkgb2YgcmVuZGVy
IG5vZGUgY2xpZW50cy4NCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gQ2FuIHlvdSBwcm92aWRlIGEgbGlu
az8gSSBjYW5ub3QgZmluZCB0aGF0IGNvZGUuDQo+Pj4+Pj4+IFNlZSBhbWRncHVfc2NoZWRfaW9j
dGwoKS4NCj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4gVGh1cyBmb3IgYSByZW5kZXIgY2FwYWJsZSBkcml2
ZXIsIGFueSBwcmVtaXNlIG9mDQo+Pj4+Pj4+Pj4+IHNlcGFyYXRpb24sIHNlY3VyaXR5IG9yIG90
aGVyd2lzZSBpbXBvc2VkIHZpYSBEUk1fQVVUSCBpcyBhIGZhbGxhY3kuDQo+Pj4+Pj4+Pj4gWWVh
aCwgdGhhdCdzIHdoYXQgSSBhZ3JlZSBvbi4gSSBqdXN0IGRvbid0IHRoaW5rIHRoYXQgcmVtb3Zp
bmcgRFJNX0FVVEgNCj4+Pj4+Pj4+PiBub3cgaXMgdGhlIHJpZ2h0IGRpcmVjdGlvbiB0byB0YWtl
Lg0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBDb3VsZCBoYXZlIGJlZW4gY2xlYXJlciAtIEknbSB0YWxr
aW5nIGFib3V0IERSTV9BVVRIIHwgRFJNX1JFTkRFUl9BTExPVw0KPj4+Pj4+Pj4gaW9jdGxzLg0K
Pj4+Pj4+Pj4NCj4+Pj4+Pj4+IFRoYXQgYXNpZGUsIGNhbiB5b3UgcHJvcG9zZSBhbiBhbHRlcm5h
dGl2ZSBzb2x1dGlvbiB0aGF0IGFkZHJlc3NlcyB0aGlzDQo+Pj4+Pj4+PiBhbmQgdGhlIHNlY29u
ZCBwb2ludCBqdXN0IGJlbG93Pw0KPj4+Pj4+PiBHaXZlIG1lIGEgZmV3IGRheXMgdG8gd29yayBv
biB0aGlzLCBpdCdzIGFscmVhZHkgRnJpZGF5IDZwbSBoZXJlLg0KPj4+Pj4+Pg0KPj4+Pj4+IEhp
IENocmlzdGlhbiwNCj4+Pj4+Pg0KPj4+Pj4+IEFueSBwcm9ncmVzcz8gQXMgbWVudGlvbmVkIGVh
cmxpZXIsIEknbSBPSyB3aXRoIHdyaXRpbmcgdGhlIHBhdGNoZXMgYWx0aG91Z2gNCj4+Pj4+PiBJ
IHdvdWxkIGxvdmUgdG8gaGVhciB5b3VyIHBsYW4uDQo+Pj4+PiBGaXJzdCBvZiBhbGwgSSB0cmll
ZCB0byBkaXNhYmxlIERSTSBhdXRoZW50aWNhdGlvbiBjb21wbGV0ZWx5IHdpdGggYQ0KPj4+Pj4g
a2VybmVsIGNvbmZpZyBvcHRpb24uIFN1cnByaXNpbmdseSB0aGF0IGFjdHVhbGx5IHdvcmtzIG91
dCBvZiB0aGUgYm94IGF0DQo+Pj4+PiBsZWFzdCBvbiB0aGUgQU1ER1BVIHN0YWNrLg0KPj4+Pj4N
Cj4+Pj4+IFRoaXMgZWZmZWN0aXZlbHkgYWxsb3dzIHVzIHRvIGdldCByaWQgb2YgRFJJMiBhbmQg
dGhlIHJlbGF0ZWQgc2VjdXJpdHkNCj4+Pj4+IHByb2JsZW1zLiBPbmx5IHRoaW5nIGxlZnQgZm9y
IHRoYXQgaXMgdGhhdCBJJ20ganVzdCBub3Qgc3VyZSBob3cgdG8NCj4+Pj4+IHNpZ25hbCB0aGlz
IHRvIHVzZXJzcGFjZSBzbyB0aGF0IHRoZSBERFggd291bGRuJ3QgYWR2ZXJ0aXNlIERSSTIgYXQg
YWxsDQo+Pj4+PiBhbnkgbW9yZS4NCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gQXMgYSBuZXh0IHN0ZXAg
SSBsb29rZWQgaW50byBpZiB3ZSBjYW4gZGlzYWJsZSB0aGUgY29tbWFuZCBzdWJtaXNzaW9uDQo+
Pj4+PiBmb3IgRFJNIG1hc3Rlci4gVHVybmVkIG91dCB0aGF0IHRoaXMgaXMgcmVsYXRpdmVseSBl
YXN5IGFzIHdlbGwuDQo+Pj4+Pg0KPj4+Pj4gQWxsIHdlIGhhdmUgdG8gZG8gaXMgdG8gZml4IHRo
ZSBidWcgTWljaGVsIHBvaW50ZWQgb3V0IGFib3V0IEtNUyBoYW5kbGVzDQo+Pj4+PiBmb3IgZGlz
cGxheSBhbmQgbGV0IHRoZSBERFggdXNlIGEgcmVuZGVyIG5vZGUgaW5zdGVhZCBvZiB0aGUgRFJN
IG1hc3Rlcg0KPj4+Pj4gZm9yIEdsYW1vci4gU3RpbGwgbmVlZCB0byBzeW5jIHVwIHdpdGggTWlj
aGVsIGFuZC9vciBNYXJlayB3aGF0cyB0aGUNCj4+Pj4+IGJlc3Qgd2F5IG9mIGRvaW5nIHRoaXMu
DQo+Pj4+Pg0KPj4+Pj4NCj4+Pj4+IFRoZSBsYXN0IHN0ZXAgKGFuZCB0aGF0J3Mgd2hhdCBJIGhh
dmVuJ3QgdHJpZWQgeWV0KSB3b3VsZCBiZSB0byBkaXNhYmxlDQo+Pj4+PiBEUk0gYXV0aGVudGlj
YXRpb24gZm9yIE5hdmkgZXZlbiB3aGVuIGl0IGlzIHN0aWxsIGNvbXBpbGVkIGludG8gdGhlDQo+
Pj4+PiBrZXJuZWwuIEJ1dCB0aGF0IGlzIG1vcmUgb3IgbGVzcyBqdXN0IGEgdHlwaW5nIGV4ZXJj
aXNlLg0KPj4+PiBTbyBqdXN0IHRvIGdldCB0aGlzIHN0cmFpZ2h0LCB3ZSdyZSBub3cgZnVsbCBv
biBlbWJyYWNpbmcgYSBzdWJzeXN0ZW0NCj4+Pj4gc3BsaXQgaGVyZToNCj4+Pj4gLSBhbWRncHUg
cGxhbnMgdG8gZGl0Y2ggZHJpMi9yZW5kZXJpbmcgb24gcHJpbWFyeSBub2Rlcw0KPj4+PiAtIGJ1
bmNoIG9mIGRyaXZlcnMgKEkgdGhpbmsgbW9yZSB0aGFuIGk5MTUgYnkgbm93KSBtZXJnZWQgdGhl
IERSTV9BVVRIDQo+Pj4+ICAgICByZW1vdmFsDQo+Pj4+IC0gb3RoZXJzIGFyZSBqdXN0IGhhbmdp
bmcgaW4gdGhlcmUgc29tZWhvdw0KPj4+Pg0KPj4+PiAiYmVzdCBvZiBib3RoXlcgd29ybGRzIiBm
dHc/DQo+Pj4gWWVzLCBleGFjdGx5IQ0KPj4+DQo+Pj4gVGhpbmsgYSBzdGVwIGZ1cnRoZXIsIHdo
ZW4gdGhpcyBpcyB1cHN0cmVhbSB3ZSBjYW4gYXBwbHkgdGhlIERSTV9BVVRIDQo+Pj4gcmVtb3Zh
bCB0byBhbWRncHUgYXMgd2VsbC4NCj4+Pg0KPiBTbyB0aGlzIGlzIGVmZmVjdGl2ZWx5IHdoYXQg
SSBzdWdnZXN0ZWQvcGxhbm5lZCB3aXRoIGEgY291cGxlIG9mIGNhdmVhdHM6DQo+ICAgLSBtYWtp
bmcgYW1kZ3B1IGJlaGF2ZSBkaWZmZXJlbnRseSBmcm9tIHRoZSByZXN0IG9mIGRybSA7LSgNCj4g
ICAtIGhhdmluZyB0aGUgS0NvbmZpZyBhbWRncHUgb25seSBhbmQgbWVyZ2VkIGJlZm9yZSB0aGlz
IERSTV9BVVRIDQoNCk5vIHRoaXMgc2hvdWxkIGFwcGx5IHRvIGFsbCBkcml2ZXJzLCBub3QganVz
dCBhbWRncHUuDQoNCj4gV2hpbGUgSSBzdWdnZXN0ZWQ6DQo+ICAgLSBrZWVwaW5nIGFtZGdwdSBj
b25zaXN0ZW50IHdpdGggdGhlIHJlc3QNCj4gICAtIGV4cG9zaW5nIHRoZSBLQ29uZmlnIG9wdGlv
biBmb3IgdGhlIHdob2xlIG9mIHRoZSBrZXJuZWwsIGFuZA0KPiAgIC0gbWVyZ2luZyBpdCBhbG9u
Z3NpZGUgdGhpcyB3b3JrDQo+DQo+IFNvIEkgZWZmZWN0aXZlbHkgd2FpdGVkIGZvciB3ZWVrcywg
aW5zdGVhZCBvZiBzaW1wbHkgZ29pbmcgYWhlYWQgYW5kDQo+IHdyaXRpbmcvc3VibWl0dGluZyBw
YXRjaGVzLiBUaGF0J3MgYSBiaXQgdW5mb3J0dW5hdGUuLi4NCj4NCj4+PiBCZWNhdXNlIHdlIHNp
bXBseSBtYWRlIHN1cmUgdGhhdCB1c2Vyc3BhY2UgaXMgdXNpbmcgdGhlIHJlbmRlciBub2RlIGZv
cg0KPj4+IGNvbW1hbmQgc3VibWlzc2lvbiBhbmQgbm90IHRoZSBwcmltYXJ5IG5vZGUuDQo+Pj4N
Cj4+PiBTbyBub2JvZHkgY2FuIGdvIGFoZWFkIGFuZCByZW1vdmUgcmVuZGVyIG5vZGUgc3VwcG9y
dCBhbnkgbW9yZSA6KQ0KPj4gSG93IGRvZXMgdGhpcyB3b3JrPyBJIHRob3VnaHQgdGhlIGVudGly
ZSBwcm9ibGVtIG9mIERSTV9BVVRIIHJlbW92YWwNCj4+IGZvciB5b3Ugd2FzIHRoYXQgaXQgYnJv
a2Ugc3R1ZmYsIGFuZCB5b3UgZGlkbid0IHdhbnQgdG8gZGVhbCB3aXRoDQo+PiB0aGF0LiBXZSBz
dGlsbCBoYXZlIHRoYXQgZXhhY3QgcHJvYmxlbSBhZmFpY3MgLi4uIG9sZCB1c2Vyc3BhY2UNCj4+
IGRvZXNuJ3Qgc2ltcGx5IHZhbmlzaCwgZXZlbiBpZiB5b3UgZW50aXJlbHkgbnVrZSBpdCBnb2lu
ZyBmb3J3YXJkLg0KPj4NCj4+IEFsc28sIHRlc3Rpbmcgb24gdGhlIGFtZGdwdSBzdGFjayBpc24n
dCByZWFsbHkgdGVzdGluZyBhIGhvbGUgbG90DQo+PiBoZXJlLCBpdCdzIGFsbCB0aGUgdmFyaW91
cyBzaWxseSBjb21wb3NpdG9ycyBvdXQgdGhlcmUgSSdkIGV4cGVjdCB0bw0KPj4gZmFsbCBvdmVy
LiBXaWxsIGdibS9yYWRlb25zaS93aGF0ZXZlciBqdXN0IGludGVybmFsbHkgZG8gYWxsIHRoZQ0K
Pj4gbmVjZXNzYXJ5IGRtYS1idWYgaW1wb3J0L2V4cG9ydCBiZXR3ZWVuIHRoZSBwcmltYXJ5IG5v
ZGUgYW5kIGRpc3BsYXkNCj4+IG5vZGUgdG8ga2VlcCB0aGlzIGFsbCB3b3JraW5nPw0KPiBJZiBJ
IHVuZGVyc3Rvb2QgQ2hyaXN0aWFuLCBmZWVsIGZyZWUgdG8gY29ycmVjdCBtZSwgdGhlIGZhY3Qg
dGhhdCBteQ0KPiBlYXJsaWVyIHBhdGNoIGJyb2tlIFJBRFYgd2FzIG5vdCB0aGUgYXJndW1lbnQu
IFRoZSBwcm9ibGVtIHdhcyB3YXMgdGhlDQo+IHBhdGNoIGRvZXMuDQoNCldlbGwgcGFydGlhbGx5
LiBUaGF0IFJBRFYgYnJva2UgaXMgdW5mb3J0dW5hdGUsIGJ1dCB3ZSBoYXZlIGRvbmUgc28gbWFu
eSANCmN1c3RvbWl6ZWQgdXNlcnNwYWNlIHN0dWZmIGJvdGggYmFzZWQgb24gTWVzYS9ERFggYXMg
d2VsbCBhcyBjbG9zZWQgDQpzb3VyY2UgY29tcG9uZW50cyB0aGF0IGl0IGlzIGp1c3QgaGlnaGx5
IGxpa2VseSB0aGF0IHdlIHdvdWxkIGJyZWFrIA0Kc29tZXRoaW5nIGVsc2UgYXMgd2VsbC4NCg0K
PiBJbiBwYXJ0aWN1bGFyLCB0aGF0IHVzZXItc3BhY2Ugd2lsbCAicmVtb3ZlIiByZW5kZXIgbm9k
ZXMuDQoNClllcywgdGhhdCBpcyBteSBtYWluIGNvbmNlcm4gaGVyZS4gWW91IGJhc2ljYWxseSBt
YWtlIHJlbmRlciBub2RlcyANCnN1cGVyZmx1b3VzbHkuIFRoYXQgZ2l2ZXMgdXNlcnNwYWNlIGFs
bCBsZWdpdGltaXphdGlvbiB0byBhbHNvIHJlbW92ZSANCnN1cHBvcnQgZm9yIHRoZW0uIFRoYXQg
aXMgbm90IHN0dXBpZCBvciBldmlsIG9yIHdoYXRldmVyLCB1c2Vyc3BhY2UgDQp3b3VsZCBqdXN0
IGZvbGxvdyB0aGUga2VybmVsIGRlc2lnbi4NCg0KPiBJJ20gcmVhbGx5IHNhZCB0aGF0IGFtZGdw
dSBpbnNpc3RzIG9uIHN0YW5kaW5nIG91dCwgaG9wZSBvbmUgZGF5IGl0IHdpbGwNCj4gY29udmVy
Z2UuIFlldCBzaW5jZSBhbGwgb3RoZXIgbWFpbnRhaW5lcnMgYXJlIG9rIHdpdGggdGhlIHNlcmll
cywgSSdsbA0KPiBzdGFydCBtZXJnaW5nIHBhdGNoZXMgaW4gYSBmZXcgaG91cnMuIEknbSByZWFs
bHkgc2FkIHRoYXQgYW1kZ3B1IHdhbnRzDQo+IHRvIHN0YW5kIG91dCwgaG9wZSBpdCB3aWxsIGNv
bnZlcmdlIHNvb25lciByYXRoZXIgdGhhbiBsYXRlci4NCj4NCj4gQ2hyaXN0aWFuLCBob3cgd291
bGQgeW91IGxpa2UgYW1kZ3B1IGhhbmRsZWQgLSB3aXRoIGEgc2VwYXJhdGUgZmxhZyBpbg0KPiB0
aGUgZHJpdmVyIG9yIHNoYWxsIHdlIHNwZWNpYWwgY2FzZSBhbWRncHUgd2l0aGluIGNvcmUgZHJt
Pw0KDQpObywgSSBhc2sgeW91IHRvIHBsZWFzZSBzdGljayBhcm91bmQgRFJNX0FVVEggZm9yIGF0
IGxlYXN0IGFtZGdwdSBhbmQgDQpyYWRlb24uIEFuZCBOT1QgZW5hYmxlIGFueSByZW5kZXIgbm9k
ZSBmdW5jdGlvbmFsaXR5IGZvciB0aGVtIG9uIHRoZSANCnByaW1hcnkgbm9kZS4NCg0KVGhhbmtz
LA0KQ2hyaXN0aWFuLg0KDQo+DQo+IFRoYW5rcw0KPiBFbWlsDQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
