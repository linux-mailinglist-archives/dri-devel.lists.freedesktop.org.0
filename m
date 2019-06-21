Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AC94E377
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 11:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66BF06E852;
	Fri, 21 Jun 2019 09:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730061.outbound.protection.outlook.com [40.107.73.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD0F6E852;
 Fri, 21 Jun 2019 09:25:16 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1643.namprd12.prod.outlook.com (10.172.40.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Fri, 21 Jun 2019 09:25:14 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935%6]) with mapi id 15.20.1987.014; Fri, 21 Jun 2019
 09:25:14 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Topic: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Index: AQHVFGTgR+jNVTHnhkq6fR69g1cCsaabKzyAgAAM3YCAADG2gIAAAe0AgAl2VwCAAPZpAIAAIOaAgAAEQoA=
Date: Fri, 21 Jun 2019 09:25:14 +0000
Message-ID: <be9f38f5-6bb5-9535-f3d9-bafa83370e0f@amd.com>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190614120927.GA32412@arch-x1c3>
 <9dbdda6c-8916-e5ae-1676-86828b9890e7@amd.com>
 <20190614155325.GC32412@arch-x1c3>
 <84b3337c-0cdc-44d4-02c6-c56bd729ed47@amd.com>
 <20190620163012.GF1896@arch-x1c3>
 <9cad6e74-4751-0b0a-35d1-e8f0ac4d3efc@amd.com>
 <20190621090953.GZ12905@phenom.ffwll.local>
In-Reply-To: <20190621090953.GZ12905@phenom.ffwll.local>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0057.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::21) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d2e9aa9-ea6e-4b75-101b-08d6f62a5d8b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1643; 
x-ms-traffictypediagnostic: DM5PR12MB1643:
x-microsoft-antispam-prvs: <DM5PR12MB164314031938032F86F01BBC83E70@DM5PR12MB1643.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(366004)(346002)(376002)(39860400002)(189003)(199004)(11346002)(7736002)(6486002)(86362001)(72206003)(305945005)(256004)(81156014)(73956011)(64756008)(8936002)(6116002)(6512007)(36756003)(229853002)(8676002)(66476007)(25786009)(486006)(14444005)(81166006)(66556008)(2906002)(476003)(66446008)(66946007)(6436002)(6916009)(446003)(58126008)(478600001)(102836004)(64126003)(71200400001)(71190400001)(2616005)(53936002)(31696002)(6246003)(6506007)(65826007)(99286004)(65806001)(52116002)(76176011)(54906003)(31686004)(5660300002)(386003)(46003)(186003)(65956001)(316002)(4326008)(14454004)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1643;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3m89QJxow8Uemb1b3nGaxIoHRJzLqa5B53kCbcj926mUt+x/REXMFx3xEQWcOzkONrBVRtpXfs/67fEoFZVRJpfuTlkPIznHrsDBdtUtEjSKzlI6FYpDKF8elAUdRCLtfQaya5vz1rBv/acbkpRMu7E0YEZKTt/AwU5oYnTV5F3mEbzxn1sDRYNru7wQKmAjm0VpBvOWTTjA+gr651fY8PXqlIzaKVOWitVoYzRX8iPi6L+eMdMfKrOxasxa/ISknnKZFefiJfqkMp4Wm5NvcIVphWD4hv5w7bDpdsHt1gNgNzueGRpeaEe6EmDaUzmmE8u0txBe8dhm6lWcoyeLjCp40LJxRR5hKDQPf8KDOwM0KBNRNvaBTbAEJ5Hb3jrZqTeEM0PLrxfXs5hvIJq3KEzvR6H0Frsrde2NhYNt79Y=
Content-ID: <BA85386F2A8F4F42B39BF042F4F44126@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2e9aa9-ea6e-4b75-101b-08d6f62a5d8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 09:25:14.1320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1643
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duZnIjMMfVPoYwzjeFajvMe3mnfF0fUD+XmHgdYo0YM=;
 b=UYT3qFnThyiaeOSCJlCVXoWwOTj11iPXKkKRkWUbs3G/dvIA7Jcfs2wxiYbKNAkW1iJeEVZcRFcnEIO5uQpYj0/A7WoQ1zVtgkp3p90J+w9Qh0yFbDObgLBmc8vCE1miftvWuqlHsqdHh76TX48yEomnIaq9kVdOJMhYxaeMFLs=
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
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDYuMTkgdW0gMTE6MDkgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBPbiBGcmksIEp1
biAyMSwgMjAxOSBhdCAwNzoxMjoxNEFNICswMDAwLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToN
Cj4+IEFtIDIwLjA2LjE5IHVtIDE4OjMwIHNjaHJpZWIgRW1pbCBWZWxpa292Og0KPj4+IE9uIDIw
MTkvMDYvMTQsIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPj4+PiBBbSAxNC4wNi4xOSB1bSAx
Nzo1MyBzY2hyaWViIEVtaWwgVmVsaWtvdjoNCj4+Pj4+IE9uIDIwMTkvMDYvMTQsIEtvZW5pZywg
Q2hyaXN0aWFuIHdyb3RlOg0KPj4+Pj4+IEFtIDE0LjA2LjE5IHVtIDE0OjA5IHNjaHJpZWIgRW1p
bCBWZWxpa292Og0KPj4+Pj4+PiBPbiAyMDE5LzA1LzI3LCBFbWlsIFZlbGlrb3Ygd3JvdGU6DQo+
Pj4+Pj4+IFtTTklQXQ0KPj4+Pj4+PiBIaSBDaHJpc3RpYW4sDQo+Pj4+Pj4+DQo+Pj4+Pj4+DQo+
Pj4+Pj4+IEluIHRoZSBmb2xsb3dpbmcsIEkgd291bGQgbGlrZSB0byBzdW1tYXJpc2UgYW5kIGVt
cGhhc2l6ZSB0aGUgbmVlZCBmb3INCj4+Pj4+Pj4gRFJNX0FVVEggcmVtb3ZhbC4gSSB3b3VsZCBr
aW5kbHkgYXNrIHlvdSB0byBzcGVuZCBhIGNvdXBsZSBvZiBtaW51dGVzDQo+Pj4+Pj4+IGV4dHJh
IHJlYWRpbmcgaXQuDQo+Pj4+Pj4+DQo+Pj4+Pj4+DQo+Pj4+Pj4+IFRvZGF5IERSTSBkcml2ZXJz
KiBkbyBub3QgbWFrZSBhbnkgZGlzdGluY3Rpb24gYmV0d2VlbiBwcmltYXJ5IGFuZA0KPj4+Pj4+
PiByZW5kZXIgbm9kZSBjbGllbnRzLg0KPj4+Pj4+IFRoYXQgaXMgYWN0dWFsbHkgbm90IDEwMCUg
Y29ycmVjdC4gV2UgaGF2ZSBhIHNwZWNpYWwgY2FzZSB3aGVyZSBhIERSTQ0KPj4+Pj4+IG1hc3Rl
ciBpcyBhbGxvd2VkIHRvIGNoYW5nZSB0aGUgcHJpb3JpdHkgb2YgcmVuZGVyIG5vZGUgY2xpZW50
cy4NCj4+Pj4+Pg0KPj4+Pj4gQ2FuIHlvdSBwcm92aWRlIGEgbGluaz8gSSBjYW5ub3QgZmluZCB0
aGF0IGNvZGUuDQo+Pj4+IFNlZSBhbWRncHVfc2NoZWRfaW9jdGwoKS4NCj4+Pj4NCj4+Pj4+Pj4g
VGh1cyBmb3IgYSByZW5kZXIgY2FwYWJsZSBkcml2ZXIsIGFueSBwcmVtaXNlIG9mDQo+Pj4+Pj4+
IHNlcGFyYXRpb24sIHNlY3VyaXR5IG9yIG90aGVyd2lzZSBpbXBvc2VkIHZpYSBEUk1fQVVUSCBp
cyBhIGZhbGxhY3kuDQo+Pj4+Pj4gWWVhaCwgdGhhdCdzIHdoYXQgSSBhZ3JlZSBvbi4gSSBqdXN0
IGRvbid0IHRoaW5rIHRoYXQgcmVtb3ZpbmcgRFJNX0FVVEgNCj4+Pj4+PiBub3cgaXMgdGhlIHJp
Z2h0IGRpcmVjdGlvbiB0byB0YWtlLg0KPj4+Pj4+DQo+Pj4+PiBDb3VsZCBoYXZlIGJlZW4gY2xl
YXJlciAtIEknbSB0YWxraW5nIGFib3V0IERSTV9BVVRIIHwgRFJNX1JFTkRFUl9BTExPVw0KPj4+
Pj4gaW9jdGxzLg0KPj4+Pj4NCj4+Pj4+IFRoYXQgYXNpZGUsIGNhbiB5b3UgcHJvcG9zZSBhbiBh
bHRlcm5hdGl2ZSBzb2x1dGlvbiB0aGF0IGFkZHJlc3NlcyB0aGlzDQo+Pj4+PiBhbmQgdGhlIHNl
Y29uZCBwb2ludCBqdXN0IGJlbG93Pw0KPj4+PiBHaXZlIG1lIGEgZmV3IGRheXMgdG8gd29yayBv
biB0aGlzLCBpdCdzIGFscmVhZHkgRnJpZGF5IDZwbSBoZXJlLg0KPj4+Pg0KPj4+IEhpIENocmlz
dGlhbiwNCj4+Pg0KPj4+IEFueSBwcm9ncmVzcz8gQXMgbWVudGlvbmVkIGVhcmxpZXIsIEknbSBP
SyB3aXRoIHdyaXRpbmcgdGhlIHBhdGNoZXMgYWx0aG91Z2gNCj4+PiBJIHdvdWxkIGxvdmUgdG8g
aGVhciB5b3VyIHBsYW4uDQo+PiBGaXJzdCBvZiBhbGwgSSB0cmllZCB0byBkaXNhYmxlIERSTSBh
dXRoZW50aWNhdGlvbiBjb21wbGV0ZWx5IHdpdGggYQ0KPj4ga2VybmVsIGNvbmZpZyBvcHRpb24u
IFN1cnByaXNpbmdseSB0aGF0IGFjdHVhbGx5IHdvcmtzIG91dCBvZiB0aGUgYm94IGF0DQo+PiBs
ZWFzdCBvbiB0aGUgQU1ER1BVIHN0YWNrLg0KPj4NCj4+IFRoaXMgZWZmZWN0aXZlbHkgYWxsb3dz
IHVzIHRvIGdldCByaWQgb2YgRFJJMiBhbmQgdGhlIHJlbGF0ZWQgc2VjdXJpdHkNCj4+IHByb2Js
ZW1zLiBPbmx5IHRoaW5nIGxlZnQgZm9yIHRoYXQgaXMgdGhhdCBJJ20ganVzdCBub3Qgc3VyZSBo
b3cgdG8NCj4+IHNpZ25hbCB0aGlzIHRvIHVzZXJzcGFjZSBzbyB0aGF0IHRoZSBERFggd291bGRu
J3QgYWR2ZXJ0aXNlIERSSTIgYXQgYWxsDQo+PiBhbnkgbW9yZS4NCj4+DQo+Pg0KPj4gQXMgYSBu
ZXh0IHN0ZXAgSSBsb29rZWQgaW50byBpZiB3ZSBjYW4gZGlzYWJsZSB0aGUgY29tbWFuZCBzdWJt
aXNzaW9uDQo+PiBmb3IgRFJNIG1hc3Rlci4gVHVybmVkIG91dCB0aGF0IHRoaXMgaXMgcmVsYXRp
dmVseSBlYXN5IGFzIHdlbGwuDQo+Pg0KPj4gQWxsIHdlIGhhdmUgdG8gZG8gaXMgdG8gZml4IHRo
ZSBidWcgTWljaGVsIHBvaW50ZWQgb3V0IGFib3V0IEtNUyBoYW5kbGVzDQo+PiBmb3IgZGlzcGxh
eSBhbmQgbGV0IHRoZSBERFggdXNlIGEgcmVuZGVyIG5vZGUgaW5zdGVhZCBvZiB0aGUgRFJNIG1h
c3Rlcg0KPj4gZm9yIEdsYW1vci4gU3RpbGwgbmVlZCB0byBzeW5jIHVwIHdpdGggTWljaGVsIGFu
ZC9vciBNYXJlayB3aGF0cyB0aGUNCj4+IGJlc3Qgd2F5IG9mIGRvaW5nIHRoaXMuDQo+Pg0KPj4N
Cj4+IFRoZSBsYXN0IHN0ZXAgKGFuZCB0aGF0J3Mgd2hhdCBJIGhhdmVuJ3QgdHJpZWQgeWV0KSB3
b3VsZCBiZSB0byBkaXNhYmxlDQo+PiBEUk0gYXV0aGVudGljYXRpb24gZm9yIE5hdmkgZXZlbiB3
aGVuIGl0IGlzIHN0aWxsIGNvbXBpbGVkIGludG8gdGhlDQo+PiBrZXJuZWwuIEJ1dCB0aGF0IGlz
IG1vcmUgb3IgbGVzcyBqdXN0IGEgdHlwaW5nIGV4ZXJjaXNlLg0KPiBTbyBqdXN0IHRvIGdldCB0
aGlzIHN0cmFpZ2h0LCB3ZSdyZSBub3cgZnVsbCBvbiBlbWJyYWNpbmcgYSBzdWJzeXN0ZW0NCj4g
c3BsaXQgaGVyZToNCj4gLSBhbWRncHUgcGxhbnMgdG8gZGl0Y2ggZHJpMi9yZW5kZXJpbmcgb24g
cHJpbWFyeSBub2Rlcw0KPiAtIGJ1bmNoIG9mIGRyaXZlcnMgKEkgdGhpbmsgbW9yZSB0aGFuIGk5
MTUgYnkgbm93KSBtZXJnZWQgdGhlIERSTV9BVVRIDQo+ICAgIHJlbW92YWwNCj4gLSBvdGhlcnMg
YXJlIGp1c3QgaGFuZ2luZyBpbiB0aGVyZSBzb21laG93DQo+DQo+ICJiZXN0IG9mIGJvdGheVyB3
b3JsZHMiIGZ0dz8NCg0KWWVzLCBleGFjdGx5IQ0KDQpUaGluayBhIHN0ZXAgZnVydGhlciwgd2hl
biB0aGlzIGlzIHVwc3RyZWFtIHdlIGNhbiBhcHBseSB0aGUgRFJNX0FVVEggDQpyZW1vdmFsIHRv
IGFtZGdwdSBhcyB3ZWxsLg0KDQpCZWNhdXNlIHdlIHNpbXBseSBtYWRlIHN1cmUgdGhhdCB1c2Vy
c3BhY2UgaXMgdXNpbmcgdGhlIHJlbmRlciBub2RlIGZvciANCmNvbW1hbmQgc3VibWlzc2lvbiBh
bmQgbm90IHRoZSBwcmltYXJ5IG5vZGUuDQoNClNvIG5vYm9keSBjYW4gZ28gYWhlYWQgYW5kIHJl
bW92ZSByZW5kZXIgbm9kZSBzdXBwb3J0IGFueSBtb3JlIDopDQoNClJlZ2FyZHMsDQpDaHJpc3Rp
YW4uDQoNCj4gLURhbmllbA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
