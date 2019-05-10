Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B469C19FDB
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 17:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E1089CC1;
	Fri, 10 May 2019 15:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730072.outbound.protection.outlook.com [40.107.73.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81FAB89CC1;
 Fri, 10 May 2019 15:08:59 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2392.namprd12.prod.outlook.com (52.132.141.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Fri, 10 May 2019 15:08:57 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1878.022; Fri, 10 May 2019
 15:08:57 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Kenny Ho <y2kenny@gmail.com>
Subject: Re: [RFC PATCH v2 4/5] drm, cgroup: Add total GEM buffer allocation
 limit
Thread-Topic: [RFC PATCH v2 4/5] drm, cgroup: Add total GEM buffer allocation
 limit
Thread-Index: AQHVB0DJVkIxCCCoYECMKlqE0zp4P6ZkdgmA
Date: Fri, 10 May 2019 15:08:56 +0000
Message-ID: <1ca1363e-b39c-c299-1d24-098b1059f7ff@amd.com>
References: <20181120185814.13362-1-Kenny.Ho@amd.com>
 <20190509210410.5471-1-Kenny.Ho@amd.com>
 <20190509210410.5471-5-Kenny.Ho@amd.com>
 <f63c8d6b-92a4-2977-d062-7e0b7036834e@gmail.com>
 <CAOWid-fpHqvq35C+gfHmLnuHM9Lj+iiHFXE=3RPrkAiFL2=wvQ@mail.gmail.com>
In-Reply-To: <CAOWid-fpHqvq35C+gfHmLnuHM9Lj+iiHFXE=3RPrkAiFL2=wvQ@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM5P189CA0010.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:206:15::23) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c02fa72-003d-4199-b9c9-08d6d5596c0d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2392; 
x-ms-traffictypediagnostic: DM5PR12MB2392:
x-microsoft-antispam-prvs: <DM5PR12MB239271083AE88C104CC6A8DA830C0@DM5PR12MB2392.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(376002)(136003)(366004)(396003)(189003)(199004)(8936002)(52116002)(7736002)(54906003)(229853002)(8676002)(81166006)(81156014)(99286004)(58126008)(65826007)(6486002)(68736007)(6436002)(316002)(6512007)(1411001)(6506007)(76176011)(31686004)(386003)(53546011)(102836004)(64126003)(186003)(6916009)(5660300002)(36756003)(2906002)(31696002)(66574012)(14444005)(256004)(478600001)(86362001)(71200400001)(6246003)(25786009)(65956001)(65806001)(4326008)(11346002)(66476007)(446003)(486006)(64756008)(476003)(46003)(2616005)(66556008)(66446008)(53936002)(6116002)(71190400001)(66946007)(73956011)(72206003)(14454004)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2392;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iOdnsXDLP5ve+BPQuQWoG3KjNqInhysEBjsLuLRiFj0MTSeKqzilPmxctH54HR9VCjlI1CryIEHnLeMsGFiEvAR5fhCbSZwWHJw+fh1V1JL6X2k3/fGO1qWzNW4DGcCXS1mG8THOJIbY3N6tY0XCDK9X11kllcwlyjdTLA4fk7pMrUAJeynvGNRsrf1CPUo2Grf7/GOF4jlUhLs384SdlYPcS2jZoDSLGloqzne07KftyGsAJxJD3xVA+2wyeHnckuviL0R2GtSxT90IxjzjHARTCVwIOk99fDZsFEasPynKaG9nt7uRTNZggf/8a6VIGcyAPi1TetkW7JIdK4qiCesyjwnEt6Pm4014kWaFoI3NFLO8UgXiECJGQJESTcG90ABQJQbAYD57ovpfk+5AaSIF6qKxwFqsTlmlCvRNJFY=
Content-ID: <9A156827FCA34246B18E27B32C833FA6@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c02fa72-003d-4199-b9c9-08d6d5596c0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 15:08:56.9455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2392
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJWhlMy7XWoraoZljkJ+yKiPDGcUmXOVDXAw/HTxAUI=;
 b=0TEIlxkUtKPOKE4xTnOAuHaHWHy274oDsgjPX1njiYEFUmyVSNAgOJJn4LTfW8WPNutbdT/o0JenegePuav8EzEC1eP7u5izEwU3gtKmo8vB2LgHfy/CEBj3WHHozv1UHAqNxmDlUZFSHvZ2JBMBG9ddSAkJ0t+yrSgJQrnnXSI=
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
Cc: "sunnanyong@huawei.com" <sunnanyong@huawei.com>, "Ho,
 Kenny" <Kenny.Ho@amd.com>, Brian Welty <brian.welty@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Tejun Heo <tj@kernel.org>, "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTAuMDUuMTkgdW0gMTY6NTcgc2NocmllYiBLZW5ueSBIbzoNCj4gW0NBVVRJT046IEV4dGVy
bmFsIEVtYWlsXQ0KPg0KPiBPbiBGcmksIE1heSAxMCwgMjAxOSBhdCA4OjI4IEFNIENocmlzdGlh
biBLw7ZuaWcNCj4gPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToNCj4+
IEFtIDA5LjA1LjE5IHVtIDIzOjA0IHNjaHJpZWIgS2VubnkgSG86DQo+Pj4gKyAgICAgLyogb25s
eSBhbGxvdyBibyBmcm9tIHRoZSBzYW1lIGNncm91cCBvciBpdHMgYW5jZXN0b3IgdG8gYmUgaW1w
b3J0ZWQgKi8NCj4+PiArICAgICBpZiAoZHJtY2dycCAhPSBOVUxMICYmDQo+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICFkcm1jZ3JwX2lzX3NlbGZfb3JfYW5jZXN0b3IoZHJtY2dycCwgb2JqLT5k
cm1jZ3JwKSkgew0KPj4+ICsgICAgICAgICAgICAgcmV0ID0gLUVBQ0NFUzsNCj4+PiArICAgICAg
ICAgICAgIGdvdG8gb3V0X3VubG9jazsNCj4+PiArICAgICB9DQo+Pj4gKw0KPj4gVGhpcyB3aWxs
IG1vc3QgbGlrZWx5IGdvIHVwIGluIGZsYW1lcy4NCj4+DQo+PiBJZiBJJ20gbm90IGNvbXBsZXRl
bHkgbWlzdGFrZW4gd2UgYWxyZWFkeSB1c2UNCj4+IGRybV9nZW1fcHJpbWVfZmRfdG9faGFuZGxl
KCkgdG8gZXhjaGFuZ2UgaGFuZGxlcyBiZXR3ZWVuIGRpZmZlcmVudA0KPj4gY2dyb3VwcyBpbiBj
dXJyZW50IGNvbnRhaW5lciB1c2FnZXMuDQo+IFRoaXMgaXMgc29tZXRoaW5nIHRoYXQgSSBhbSBp
bnRlcmVzdGVkIGluIGdldHRpbmcgbW9yZSBkZXRhaWxzIGZyb20NCj4gdGhlIGJyb2FkZXIgY29t
bXVuaXR5IGJlY2F1c2UgdGhlIGRldGFpbHMgYWZmZWN0IGhvdyBsaWtlbHkgdGhpcyB3aWxsDQo+
IGdvIHVwIGluIGZsYW1lcyA7KS4gIE5vdGUgdGhhdCB0aGlzIGNoZWNrIGRvZXMgbm90IGJsb2Nr
IHNoYXJpbmcgb2YNCj4gaGFuZGxlcyBmcm9tIGNncm91cCBwYXJlbnQgdG8gY2hpbGRyZW4gaW4g
dGhlIGhpZXJhcmNoeSwgbm9yIGRvZXMgaXQNCj4gYmxvY2tzIHNoYXJpbmcgb2YgaGFuZGxlcyB3
aXRoaW4gYSBjZ3JvdXAuDQo+DQo+IEkgYW0gaW50ZXJlc3RlZCB0byBmaW5kIG91dCwgd2hlbiBl
eGlzdGluZyBhcHBzIHNoYXJlIGhhbmRsZXMgYmV0d2Vlbg0KPiBjb250YWluZXJzLCBpZiB0aGVy
ZSBhcmUgYW55IGV4cGVjdGF0aW9ucyBvbiByZXNvdXJjZSBtYW5hZ2VtZW50Lg0KPiBTaW5jZSB0
aGVyZSBhcmUgbm8gZHJtIGNncm91cCBmb3IgY3VycmVudCBjb250YWluZXIgdXNhZ2UsIEkgZXhw
ZWN0DQo+IHRoZSBhbnN3ZXIgdG8gYmUgbm8uICBJbiB0aGlzIGNhc2UsIHRoZSBkcm0gY2dyb3Vw
IGNvbnRyb2xsZXIgY2FuIGJlDQo+IGRpc2FibGVkIG9uIGl0cyBvd24gKGluIHRoZSBjb250ZXh0
IG9mIGNncm91cC12MidzIHVuaWZpZWQgaGllcmFyY2h5KSwNCj4gb3IgdGhlIHByb2Nlc3MgY2Fu
IHJlbWFpbiBhdCB0aGUgcm9vdCBmb3IgdGhlIGRybSBjZ3JvdXAgaGllcmFyY2h5IChpbg0KPiB0
aGUgY29udGV4dCBvZiBjZ3JvdXAtdjEuKSAgSWYgSSB1bmRlcnN0YW5kIHRoZSBjZ3JvdXAgYXBp
IGNvcnJlY3RseSwNCj4gdGhhdCBtZWFucyBhbGwgcHJvY2VzcyB3b3VsZCBiZSBwYXJ0IG9mIHRo
ZSByb290IGNncm91cCBhcyBmYXIgYXMgdGhlDQo+IGRybSBjb250cm9sbGVyIGlzIGNvbmNlcm5l
ZCBhbmQgdGhpcyBibG9jayB3aWxsIG5vdCBjb21lIGludG8gZWZmZWN0Lg0KPiBJIGhhdmUgdmVy
aWZpZWQgdGhhdCB0aGlzIGlzIGluZGVlZCB0aGUgY3VycmVudCBkZWZhdWx0IGJlaGF2aW91ciBv
ZiBhDQo+IGNvbnRhaW5lciBydW50aW1lIChydW5jLCB3aGljaCBpcyB1c2VkIGJ5IGRvY2tlciwg
cG9kbWFuIGFuZCBvdGhlcnMuKQ0KPiBUaGUgbmV3IGRybSBjZ3JvdXAgY29udHJvbGxlciBpcyBz
aW1wbHkgaWdub3JlZCBhbmQgYWxsIHByb2Nlc3Nlcw0KPiByZW1haW4gYXQgdGhlIHJvb3Qgb2Yg
dGhlIGhpZXJhcmNoeSAoc2luY2UgdGhlcmUgYXJlIG5vIG90aGVyDQo+IGNncm91cHMuKSAgSSBw
bGFuIHRvIG1ha2UgY29udHJpYnV0aW9ucyB0byBydW5jIChzbyBmb2xrcyBjYW4gYWN0dWFsbHkN
Cj4gdXNlIHRoaXMgZmVhdHVyZXMgd2l0aCBkb2NrZXIvcG9kbWFuL2s4cywgZXRjLikgb25jZSB0
aGluZ3Mgc3RhYmlsaXplZA0KPiBvbiB0aGUga2VybmVsIHNpZGUuDQoNClNvIHRoZSBkcm0gY2dy
b3VwIGNvbnRhaW5lciBpcyBzZXBhcmF0ZSB0byBvdGhlciBjZ3JvdXAgY29udGFpbmVycz8NCg0K
SW4gb3RoZXIgd29yZHMgYXMgbG9uZyBhcyB1c2Vyc3BhY2UgZG9lc24ndCBjaGFuZ2UsIHRoaXMg
d291bGRuJ3QgaGF2ZSANCmFueSBlZmZlY3Q/DQoNCldlbGwgdGhhdCBpcyB1bmV4cGVjdGVkIGNh
dXNlIHRoZW4gYSBwcm9jZXNzZXMgd291bGQgYmUgaW4gZGlmZmVyZW50IA0KZ3JvdXBzIGZvciBk
aWZmZXJlbnQgY29udHJvbGxlcnMsIGJ1dCBpZiB0aGF0J3MgcmVhbGx5IHRoZSBjYXNlIHRoYXQg
DQp3b3VsZCBjZXJ0YWlubHkgd29yay4NCg0KPiBPbiB0aGUgb3RoZXIgaGFuZCwgaWYgdGhlcmUg
YXJlIGV4cGVjdGF0aW9ucyBmb3IgcmVzb3VyY2UgbWFuYWdlbWVudA0KPiBiZXR3ZWVuIGNvbnRh
aW5lcnMsIEkgd291bGQgbGlrZSB0byBrbm93IHdobyBpcyB0aGUgZXhwZWN0ZWQgbWFuYWdlcg0K
PiBhbmQgaG93IGRvZXMgaXQgZml0IGludG8gdGhlIGNvbmNlcHQgb2YgY29udGFpbmVyICh3aGlj
aCBlbmZvcmNlIHNvbWUNCj4gbGV2ZWwgb2YgaXNvbGF0aW9uLikgIE9uZSBwb3NzaWJsZSBtYW5h
Z2VyIG1heSBiZSB0aGUgZGlzcGxheSBzZXJ2ZXIuDQo+IEJ1dCBhcyBsb25nIGFzIHRoZSBkaXNw
bGF5IHNlcnZlciBpcyBpbiBhIHBhcmVudCBjZ3JvdXAgb2YgdGhlIGFwcHMnDQo+IGNncm91cCwg
dGhlIGFwcHMgY2FuIHN0aWxsIGltcG9ydCBoYW5kbGVzIGZyb20gdGhlIGRpc3BsYXkgc2VydmVy
DQo+IHVuZGVyIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLiAgTXkgdW5kZXJzdGFuZGluZyBp
cyB0aGF0IHRoaXMgaXMNCj4gbW9zdCBsaWtlbHkgdGhlIGNhc2UsIHdpdGggdGhlIGRpc3BsYXkg
c2VydmVyIHNpbXBseSBzaXR0aW5nIGF0IHRoZQ0KPiBkZWZhdWx0L3Jvb3QgY2dyb3VwLiAgQnV0
IEkgY2VydGFpbmx5IHdhbnQgdG8gaGVhciBtb3JlIGFib3V0IG90aGVyDQo+IHVzZSBjYXNlcyAo
Zm9yIGV4YW1wbGUsIGlzIHJ1bm5pbmcgbXVsdGlwbGUgZGlzcGxheSBzZXJ2ZXJzIG9uIGENCj4g
c2luZ2xlIGhvc3QgYSByZWFsaXN0aWMgcG9zc2liaWxpdHk/ICBBcmUgdGhlcmUgcGVvcGxlIHJ1
bm5pbmcNCj4gbXVsdGlwbGUgZGlzcGxheSBzZXJ2ZXJzIGluc2lkZSBwZWVyIGNvbnRhaW5lcnM/
ICBJZiBzbywgaG93IGRvIHRoZXkNCj4gY29vcmRpbmF0ZSByZXNvdXJjZXM/KQ0KDQpXZSBkZWZp
bml0ZWx5IGhhdmUgc2l0dWF0aW9ucyB3aXRoIG11bHRpcGxlIGRpc3BsYXkgc2VydmVycyBydW5u
aW5nIA0KKGp1c3QgdGhpbmsgb2YgVlIpLg0KDQpJIGp1c3QgY2FuJ3Qgc2F5IGlmIHRoZXkgY3Vy
cmVudGx5IHVzZSBjZ3JvdXBzIGluIGFueSB3YXkuDQoNClRoYW5rcywNCkNocmlzdGlhbi4NCg0K
Pg0KPiBJIHNob3VsZCBwcm9iYWJseSBzdW1tYXJpemUgc29tZSBvZiB0aGVzZSBpbnRvIHRoZSBj
b21taXQgbWVzc2FnZS4NCj4NCj4gUmVnYXJkcywNCj4gS2VubnkNCj4NCj4NCj4NCj4+IENocmlz
dGlhbi4NCj4+DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
