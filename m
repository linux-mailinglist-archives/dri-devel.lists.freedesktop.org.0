Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC75E2BFC8
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 08:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D650289B97;
	Tue, 28 May 2019 06:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710050.outbound.protection.outlook.com [40.107.71.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACA589B95;
 Tue, 28 May 2019 06:58:04 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1740.namprd12.prod.outlook.com (10.175.89.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Tue, 28 May 2019 06:58:01 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 06:58:01 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Topic: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Index: AQHVFGTgR+jNVTHnhkq6fR69g1cCsaZ+ymGAgAAqy4CAAAGFgIAABJ0AgAAdFgCAAQQpgA==
Date: Tue, 28 May 2019 06:58:01 +0000
Message-ID: <d12a7dd4-595b-d0aa-a87d-527392fb0384@amd.com>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <3c9b5688-5e83-f173-00e3-6e139e05d466@amd.com>
 <20190527132041.GP21222@phenom.ffwll.local>
 <20190527132607.GH15067@arch-x1c3>
 <0426fb3e-e7bc-2464-cb42-4d5753956d23@amd.com>
 <CAKMK7uE_pRro8PxTwUq+pC_1GVVT7nUxan1T-kqSYT=BMHTf2g@mail.gmail.com>
In-Reply-To: <CAKMK7uE_pRro8PxTwUq+pC_1GVVT7nUxan1T-kqSYT=BMHTf2g@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM4PR0202CA0006.eurprd02.prod.outlook.com
 (2603:10a6:200:89::16) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d17a2f8d-66f7-4cef-40b7-08d6e339d2d9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1740; 
x-ms-traffictypediagnostic: DM5PR12MB1740:
x-microsoft-antispam-prvs: <DM5PR12MB1740BB237A80DE15D50A080D831E0@DM5PR12MB1740.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(376002)(396003)(39860400002)(136003)(346002)(366004)(189003)(199004)(6486002)(6512007)(36756003)(2906002)(11346002)(446003)(46003)(476003)(2616005)(486006)(66446008)(53936002)(31696002)(4326008)(478600001)(14454004)(54906003)(58126008)(6436002)(7736002)(305945005)(8676002)(81166006)(8936002)(86362001)(64126003)(186003)(66556008)(6116002)(81156014)(64756008)(72206003)(5660300002)(6246003)(6916009)(102836004)(71190400001)(71200400001)(65806001)(65956001)(25786009)(65826007)(99286004)(66946007)(316002)(68736007)(14444005)(76176011)(6506007)(256004)(53546011)(73956011)(52116002)(31686004)(229853002)(386003)(66476007)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1740;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VwjvWe5DWya0C0iIQ9ntPxEdq3+Dqa4fVk0BIVuXDRqEk4HXT569nGr/boZLSaSSsWmKk7EULZR753GnkmlhHDBcWKwns4fjdvOd2lU43xmaDIvYwWtbJSq971wCrWfO78hHrGQ9so3vx3euwycOrpKjrkjUQa5fH1wWRKT/KJflx4vTPWfeHIpFDgysJVH0G4kd78rR28aAzyjC5i9lj1ONNDi3zcbaottAi1WCshM0QYDBp9E0zUsgHMPkn8HNTdRixQ08A747H/UMbneB5poRkaH7IfxN8lSHok3ktw1WXMk446+1LU9+OoZJj5jJFNP6Q5rzfN7IX7B6WMJqwXYwtXBZ0QasfaI3BWoMoLrPhcM+hXS/OHGUC8Y8JTYuq+F+jQ2Egj+cisLwLDlVJidBkLLSqyVbBz0gqm1Al28=
Content-ID: <100C50668EDF1C4A835F3F1D2788B412@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d17a2f8d-66f7-4cef-40b7-08d6e339d2d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 06:58:01.4522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1740
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jY5Tcji4kR9/5TpQTE2fo6nZeE1Xc+AXitipFV9uzB8=;
 b=0waBZbIpoVjSd6aodahS7AoAGi1XodddNIbErO1b0y4sjVwnhXyySM/RAnwAfmbtR29oRMurNJxRXHpo+aH89BuIBh0Ex6pRQBO8EPvT+ztm1os3onR7zGWL57FwIKnvDUm/D1cJbyIrl+M1QNB2ZAGUHtb7fljgz1jlD/kFfu0=
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

QW0gMjcuMDUuMTkgdW0gMTc6MjYgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBPbiBNb24sIE1h
eSAyNywgMjAxOSBhdCAzOjQyIFBNIEtvZW5pZywgQ2hyaXN0aWFuDQo+IDxDaHJpc3RpYW4uS29l
bmlnQGFtZC5jb20+IHdyb3RlOg0KPj4gQW0gMjcuMDUuMTkgdW0gMTU6MjYgc2NocmllYiBFbWls
IFZlbGlrb3Y6DQo+Pj4gT24gMjAxOS8wNS8yNywgRGFuaWVsIFZldHRlciB3cm90ZToNCj4+Pj4g
T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMTA6NDc6MzlBTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6DQo+Pj4+PiBBbSAyNy4wNS4xOSB1bSAxMDoxNyBzY2hyaWViIEVtaWwgVmVsaWtv
djoNCj4+Pj4+PiBGcm9tOiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29t
Pg0KPj4+Pj4+DQo+Pj4+Pj4gQ3VycmVudGx5IG9uZSBjYW4gY2lyY3VtdmVudCBEUk1fQVVUSCwg
d2hlbiB0aGUgaW9jdGwgaXMgZXhwb3NlZCB2aWEgdGhlDQo+Pj4+Pj4gcmVuZGVyIG5vZGUuIEEg
c2VlbWluZ2x5IGRlbGliZXJhdGUgZGVzaWduIGRlY2lzaW9uLg0KPj4+Pj4+DQo+Pj4+Pj4gSGVu
Y2Ugd2UgY2FuIGRyb3AgdGhlIERSTV9BVVRIIGFsbCB0b2dldGhlciAoZGV0YWlscyBpbiBmb2xs
b3ctdXAgcGF0Y2gpDQo+Pj4+Pj4geWV0IG5vdCBhbGwgdXNlcnNwYWNlIGNoZWNrcyBpZiBpdCdz
IGF1dGhlbnRpY2F0ZWQsIGJ1dCBpbnN0ZWFkIHVzZXMNCj4+Pj4+PiB1bmNvbW1vbiBhc3N1bXB0
aW9ucy4NCj4+Pj4+Pg0KPj4+Pj4+IEFmdGVyIGRheXMgb2YgZGlnZ2luZyB0aHJvdWdoIGdpdCBs
b2cgYW5kIHRlc3RpbmcsIG9ubHkgYSBzaW5nbGUgKGFiKXVzZQ0KPj4+Pj4+IHdhcyBzcG90dGVk
IC0gdGhlIE1lc2EgUkFEViBkcml2ZXIsIHVzaW5nIHRoZSBBTURHUFVfSU5GTyBpb2N0bCBhbmQN
Cj4+Pj4+PiBhc3N1bWluZyB0aGF0IGZhaWx1cmUgaW1wbGllcyBsYWNrIG9mIGF1dGhlbnRpY2F0
aW9uLg0KPj4+Pj4+DQo+Pj4+Pj4gQWZmZWN0ZWQgdmVyc2lvbnMgYXJlOg0KPj4+Pj4+ICAgICAt
IHRoZSB3aG9sZSAxOC4yLnggc2VyaWVzLCB3aGljaCBpcyBFT0wNCj4+Pj4+PiAgICAgLSB0aGUg
d2hvbGUgMTguMy54IHNlcmllcywgd2hpY2ggaXMgRU9MDQo+Pj4+Pj4gICAgIC0gdGhlIDE5LjAu
eCBzZXJpZXMsIHByaW9yIHRvIDE5LjAuNA0KPj4+Pj4gV2VsbCB5b3UgY291bGQgaGF2ZSBzYXZl
ZCB5b3VyIHRpbWUsIGNhdXNlIHRoaXMgaXMgc3RpbGwgYSBOQUsuDQo+Pj4+Pg0KPj4+Pj4gRm9y
IHRoZSByZWNvcmQ6IEkgc3Ryb25nbHkgdGhpbmsgdGhhdCB3ZSBkb24ndCB3YW50IHRvIGV4cG9z
ZSBhbnkgcmVuZGVyDQo+Pj4+PiBmdW5jdGlvbmFsaXR5IG9uIHRoZSBwcmltYXJ5IG5vZGUuDQo+
Pj4+Pg0KPj4+Pj4gVG8gZXZlbiBnbyBhIHN0ZXAgZnVydGhlciBJIHdvdWxkIHNheSB0aGF0IGF0
IGxlYXN0IG9uIEFNRCBoYXJkd2FyZSB3ZQ0KPj4+Pj4gc2hvdWxkIGNvbXBsZXRlbHkgZGlzYWJs
ZSBEUkkyIGZvciBvbmUgb2YgdGhlIG5leHQgZ2VuZXJhdGlvbnMuDQo+Pj4+Pg0KPj4+Pj4gQXMg
YSBmb2xsb3cgdXAgSSB3b3VsZCB0aGVuIGNvbXBsZXRlbHkgZGlzYWxsb3cgdGhlIERSTSBhdXRo
ZW50aWNhdGlvbg0KPj4+Pj4gZm9yIGFtZGdwdSwgc28gdGhhdCB0aGUgY29tbWFuZCBzdWJtaXNz
aW9uIGludGVyZmFjZSBvbiB0aGUgcHJpbWFyeSBub2RlDQo+Pj4+PiBjYW4gb25seSBiZSB1c2Vk
IGJ5IHRoZSBkaXNwbGF5IHNlcnZlci4NCj4+Pj4gU28gYW1kZ3B1IGlzIHJ1bm5pbmcgaW4gb25l
IGRpcmVjdGlvbiwgd2hpbGUgZXZlcnlvbmUgZWxzZSBpcyBydW5uaW5nIGluDQo+Pj4+IHRoZSBv
dGhlciBkaXJlY3Rpb24/IFBsZWFzZSBub3RlIHRoYXQgeW91ciBwYXRjaCB0byBjaGFuZ2UgaTkx
NSBsYW5kZWQNCj4+Pj4gYWxyZWFkeSwgc28gdGhhdCBzaGlwIGlzIHNhaWxpbmcgKGJ1dCB3ZSBj
b3VsZCBvZmMgcmV2ZXJ0IHRoYXQgYmFjaw0KPj4+PiBhZ2FpbikuDQo+Pj4+DQo+Pj4+IEltbyBy
ZWFsbHkgbm90IGEgZ3JlYXQgaWRlYSBpZiB3ZSBkbyBhIGFtZGdwdSB2cy4gZXZlcnlvbmUgZWxz
ZSBzcGxpdA0KPj4+PiBoZXJlLiBJZiB3ZSB3YW50IHRvIGRlcHJlY2F0ZSBkcmkyL2ZsaW5rL3Jl
bmRlcmluZyBvbiBwcmltYXJ5IG5vZGVzIGFjcm9zcw0KPj4+PiB0aGUgc3RhY2ssIHRoZW4gdGhh
dCBzaG91bGQgYmUgYSBzdGFjayB3aWRlIGRlY2lzaW9uLCBub3QgYW4gYW1kZ3B1IG9uZS4NCj4+
Pj4NCj4+PiBDYW5ub3QgYWdyZWUgbW9yZSAtIEkgd291bGQgbG92ZSB0byBzZWUgZHJpdmVycyBz
dGF5IGNvbnNpc3RlbnQuDQo+PiBZZWFoLCBjb21wbGV0ZWx5IGFncmVlIHRvIHRoYXQuIFRoYXQn
cyB3aHkgSSB0aGluayB3ZSBzaG91bGQgbm90IGRvIHRoaXMNCj4+IGF0IGFsbCBhbmQganVzdCBs
ZXQgSW50ZWwgZml4IGl0J3MgdXNlcnNwYWNlIGJ1Z3MgOlANCj4gU28geW91J3JlIHBsYW5uaW5n
IHRvIHN1Ym1pdCB0aGF0IHJldmVydD8gWW91IGRpZCBqdW1wIHRoZSBndW4gd2l0aA0KPiBzZW5k
aW5nIG91dCB0aGF0IHBhdGNoIGFmdGVyIGFsbCB0b28gLi4uIChhc2lkZSBmcm9tIGl0IGdvdCBt
ZXJnZWQNCj4gYmVjYXVzZSBvZiBzb21lIG90aGVyIG1peHVwIHdpdGggci1iIHRhZ3MgYW5kIHdo
YXQgbm90KS4NCg0KV2VsbCBhbHJlYWR5IHJlZ3JldHRpbmcgc3VibWl0dGluZyB0aGF0LiBPbiB0
aGUgb3RoZXIgaGFuZCB3aGF0IGlzIHRoZSANCm1pbmltdW0gSU9DVExzIHdlIG5lZWQgdG8gZ2V0
IHdvcmtpbmcgdG8gZml4IHRoZSB2YWluZm8gaXNzdWU/DQoNCk1pZ2h0IGJlIGEgZ29vZCBpZGVh
IGxvb2tpbmcgaW50byByZXZlcnRpbmcgaXQgcGFydGlhbGx5LCBzbyB0aGF0IGF0IA0KbGVhc3Qg
Y29tbWFuZCBzdWJtaXNzaW9uIGFuZCBidWZmZXIgYWxsb2NhdGlvbiBpcyBzdGlsbCBibG9ja2Vk
Lg0KDQpDaHJpc3RpYW4uDQoNCj4gLURhbmllbA0KPg0KPj4gQW55d2F5IG15IGNvbmNlcm4gaXMg
cmVhbGx5IHRoYXQgd2Ugc2hvdWxkIHN0b3AgZXh0ZW5kaW5nIGZ1bmN0aW9uYWxpdHkNCj4+IG9u
IHRoZSBwcmltYXJ5IG5vZGUuDQo+Pg0KPj4gRS5nLiB0aGUgcmVuZGVyIG5vZGUgaXMgZm9yIHVz
ZSBieSB0aGUgY2xpZW50cyBhbmQgdGhlIHByaW1hcnkgbm9kZSBmb3INCj4+IG1vZGUgc2V0dGlu
ZyBhbmQgdXNlIGJ5IHRoZSBkaXNwbGF5IHNlcnZlciBvbmx5Lg0KPj4NCj4+IFJlZ2FyZHMsDQo+
PiBDaHJpc3RpYW4uDQo+Pg0KPj4+IEZ3aXcsIHRoaXMgc2VyaWVzIGNvbnNpc3RlbnRseSBwYXZl
cyB0aGUgd2F5IHRvd2FyZCBudWtpbmcgRFJNX0FVVEggOy0pDQo+Pj4NCj4+PiBUaGFua3MNCj4+
PiBFbWlsDQo+DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
