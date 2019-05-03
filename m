Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA6812D28
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 14:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA57F89DC2;
	Fri,  3 May 2019 12:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780085.outbound.protection.outlook.com [40.107.78.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B32589DC2
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 12:07:18 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2501.namprd12.prod.outlook.com (52.132.141.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Fri, 3 May 2019 12:07:15 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba%10]) with mapi id 15.20.1856.008; Fri, 3 May 2019
 12:07:14 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 01/19] drm: Add |struct drm_gem_vram_object| and helpers
Thread-Topic: [PATCH v3 01/19] drm: Add |struct drm_gem_vram_object| and
 helpers
Thread-Index: AQHU/pojWq8imvWZyUydqtyEboEK56ZTjr6AgADg3NuAAANEAIAE3/+OgAABYYA=
Date: Fri, 3 May 2019 12:07:14 +0000
Message-ID: <c74362eb-c43a-a7be-5b52-106d207e8a8d@amd.com>
References: <20190429144341.12615-1-tzimmermann@suse.de>
 <20190429144341.12615-2-tzimmermann@suse.de>
 <20190429195855.GA6610@ravnborg.org>
 <1d14ef87-e1cd-4f4a-3632-bc045a1981c6@suse.de>
 <20190430092327.GA13757@ravnborg.org>
 <6e07e6c9-2ce7-c39f-8d55-46e811c61510@amd.com>
 <a2398439-3bb5-d1ef-db94-82f252f461c2@suse.de>
 <CAKMK7uGnUeeK-UPHZC+P5TsQTaOWPQd=LLV_Rr+VvPgNEEHhyg@mail.gmail.com>
In-Reply-To: <CAKMK7uGnUeeK-UPHZC+P5TsQTaOWPQd=LLV_Rr+VvPgNEEHhyg@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM5PR0102CA0033.eurprd01.prod.exchangelabs.com
 (2603:10a6:206::46) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad97c3cf-e1ba-4914-7595-08d6cfbfe12a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2501; 
x-ms-traffictypediagnostic: DM5PR12MB2501:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <DM5PR12MB25014A0A4B83E178D50154D383350@DM5PR12MB2501.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0026334A56
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(366004)(136003)(346002)(376002)(189003)(51914003)(199004)(68736007)(6506007)(66574012)(14454004)(58126008)(476003)(54906003)(8936002)(7736002)(53546011)(73956011)(305945005)(66946007)(966005)(65826007)(46003)(64756008)(86362001)(52116002)(4326008)(76176011)(8676002)(66476007)(316002)(386003)(7416002)(99286004)(25786009)(66556008)(81166006)(31696002)(81156014)(66446008)(256004)(71190400001)(110136005)(102836004)(446003)(36756003)(6116002)(6306002)(6436002)(6512007)(64126003)(6246003)(53936002)(14444005)(229853002)(5660300002)(65956001)(65806001)(6486002)(71200400001)(11346002)(478600001)(486006)(2906002)(186003)(31686004)(2616005)(72206003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2501;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Pt5tZ9WUpos6IEnPhMxFPDiT6KQbbH29kNbcLUSxcXA0r/pIAN2FsuzhHVXlHuUXWSSf4CEmpea73JaWHSCYaKRwe+yXDiHAc4HWdHV0+paapYVR1YN+qqbtdlB1Utz29A1L4Kc2kUBXM+/YSUU9E8MfCinz4j2TdeXrDpXdeyXc2+6p6hhWkSZ2eeFXxZ4qQHEdg90zgyUhTrK4IYt9wbNgZSAGDeYiKik929KMWA+4ZKOJAZnYl3uIwZZpLTXiw/E2Nxrftp9yKCBNjo4FX6Cnaup/ZOO1yXas5zfzd/aNN5BTIvkn+UmjJE4yfwGPtMGT3prnuelYQOPuwDr4mR+Eih3mZG5IMwl30YRcPT8pmpejwXIZnNYkilHyxEXJJcNBVodiOrmGQwl8fk9f8sXiLu/HixkdiU9fFSvSess=
Content-ID: <6DF2679DA14DA844A226D004228C778B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad97c3cf-e1ba-4914-7595-08d6cfbfe12a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2019 12:07:14.7737 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2501
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urQ25czqrK0VDoGWsA8mo/WaN3+rS4S4CUTCwYxMBDk=;
 b=tme5Oj6kWWGvcR4/1zMS1yN2Zs6oBX+2FEmRn9jnadEi9zyvInBTvEuSW35DEZDV1D1kQK66YRAyGg2KwCEY4s89PPuZBc3LHhbDnpyaYYi0wUXyjcVWL6TYoqikumpyZ0CsBUH3VkbhS9mNe8yHQSYODVS1GD/1JTW21M7eN6s=
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "puck.chen@hisilicon.com" <puck.chen@hisilicon.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "z.liuxinliang@hisilicon.com" <z.liuxinliang@hisilicon.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "zourongrong@gmail.com" <zourongrong@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDMuMDUuMTkgdW0gMTQ6MDEgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBbQ0FVVElPTjog
RXh0ZXJuYWwgRW1haWxdDQo+DQo+IE9uIEZyaSwgTWF5IDMsIDIwMTkgYXQgMTI6MTUgUE0gVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4gSGkgQ2hyaXN0
aWFuLA0KPj4NCj4+IHdvdWxkIHlvdSByZXZpZXcgdGhlIHdob2xlIHBhdGNoIHNldD8gRGFuaWVs
IG1lbnRpb25lZCB0aGF0IGhlJ2QgcHJlZmVyDQo+PiB0byBsZWF2ZSB0aGUgcmV2aWV3IHRvIG1l
bW9yeS1tZ210IGRldmVsb3BlcnMuDQo+IEkgdGhpbmsgTm9yYWxmIFRyb25uZXMgb3IgR2VyZCBI
b2ZmbWFubiB3b3VsZCBhbHNvIG1ha2UgZ29vZCByZXZpZXdlcnMNCj4gZm9yIHRoaXMsIGZhaXJs
eSBjbG9zZSB0byB3aGF0IHRoZXkndmUgYmVlbiB3b3JraW5nIG9uIGluIHRoZSBwYXN0Lg0KDQpJ
IHdpbGwgdHJ5IHRvIHRha2UgYW5vdGhlciBsb29rIG5leHQgd2Vlay4gQnVzeSBhcyB1c3VhbCBo
ZXJlLg0KDQpDaHJpc3RpYW4uDQoNCj4gLURhbmllbA0KPg0KPj4gQmVzdCByZWdhcmRzDQo+PiBU
aG9tYXMNCj4+DQo+PiBBbSAzMC4wNC4xOSB1bSAxMTozNSBzY2hyaWViIEtvZW5pZywgQ2hyaXN0
aWFuOg0KPj4+IEFtIDMwLjA0LjE5IHVtIDExOjIzIHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0KPj4+
PiBbQ0FVVElPTjogRXh0ZXJuYWwgRW1haWxdDQo+Pj4+DQo+Pj4+IEhpIFRob21hcy4NCj4+Pj4N
Cj4+Pj4+Pj4gKw0KPj4+Pj4+PiArLyoqDQo+Pj4+Pj4+ICsgKiBSZXR1cm5zIHRoZSBjb250YWlu
ZXIgb2YgdHlwZSAmc3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3QNCj4+Pj4+Pj4gKyAqIGZvciBm
aWVsZCBiby4NCj4+Pj4+Pj4gKyAqIEBibzogICAgICAgICAgIHRoZSBWUkFNIGJ1ZmZlciBvYmpl
Y3QNCj4+Pj4+Pj4gKyAqIFJldHVybnM6ICAgICAgIFRoZSBjb250YWluaW5nIEdFTSBWUkFNIG9i
amVjdA0KPj4+Pj4+PiArICovDQo+Pj4+Pj4+ICtzdGF0aWMgaW5saW5lIHN0cnVjdCBkcm1fZ2Vt
X3ZyYW1fb2JqZWN0KiBkcm1fZ2VtX3ZyYW1fb2ZfYm8oDQo+Pj4+Pj4+ICsgIHN0cnVjdCB0dG1f
YnVmZmVyX29iamVjdCAqYm8pDQo+Pj4+Pj4+ICt7DQo+Pj4+Pj4+ICsgIHJldHVybiBjb250YWlu
ZXJfb2YoYm8sIHN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0LCBibyk7DQo+Pj4+Pj4+ICt9DQo+
Pj4+Pj4gSW5kZW50IGZ1bm55LiBVU2Ugc2FtZSBpbmRlbnQgYXMgdXNlZCBpbiBvdGhlciBwYXJ0
cyBvZiBmaWxlIGZvcg0KPj4+Pj4+IGZ1bmN0aW9uIGFyZ3VtZW50cy4NCj4+Pj4+IElmIEkgcHV0
IHRoZSBhcmd1bWVudCBuZXh0IHRvIHRoZSBmdW5jdGlvbidzIG5hbWUsIGl0IHdpbGwgZXhjZWVk
IHRoZQ0KPj4+Pj4gODAtY2hhcmFjdGVyIGxpbWl0LiBGcm9tIHRoZSBjb2Rpbmctc3R5bGUgZG9j
dW1lbnQsIEkgY291bGQgbm90IHNlZSB3aGF0DQo+Pj4+PiB0byBkbyBpbiB0aGlzIGNhc2UuIE9u
ZSBzb2x1dGlvbiB3b3VsZCBtb3ZlIHRoZSByZXR1cm4gdHlwZSB0byBhDQo+Pj4+PiBzZXBhcmF0
ZSBsaW5lIGJlZm9yZSB0aGUgZnVuY3Rpb24gbmFtZS4gSSd2ZSBub3Qgc2VlbiB0aGF0IGFueXdo
ZXJlIGluDQo+Pj4+PiB0aGUgc291cmNlIGNvZGUsIHNvIG1vdmluZyB0aGUgYXJndW1lbnQgb250
byBhIHNlcGFyYXRlIGxpbmUgYW5kDQo+Pj4+PiBpbmRlbnRpbmcgYnkgb25lIHRhYiBhcHBlYXJz
IHRvIGJlIHRoZSBuZXh0IGJlc3Qgc29sdXRpb24uIFBsZWFzZSBsZXQgbWUNCj4+Pj4+IGtub3cg
aWYgdGhlcmUncyBpZiB0aGVyZSdzIGEgcHJlZmVycmVkIHN0eWxlIGZvciBjYXNlcyBsaWtlIHRo
aXMgb25lLg0KPj4+PiBSZWFkYWJpbGl0eSBoYXMgSU1PIGhpZ2hlciBwcmlvcml0eSB0aGFuIHNv
bWUgbGltaXQgb2YgODAgY2hhcnMuDQo+Pj4+IEFuZCBpdCBodXJ0cyByZWFkYWJpbGl0eSAoYXQg
bGVhc3QgbXkgT0NEKSB3aGVuIHN0eWxlIGNoYW5nZXMNCj4+Pj4gYXMgeW91IGRvIHdpdGggaW5k
ZW50IGhlcmUuIFNvIG15IHBlcnNvbmFsIHByZWZlcmVuY2UgaXMgdG8gZml4DQo+Pj4+IGluZGVu
dCBhbmQgYWNjZWN0IGxvbmdlciBsaW5lcy4NCj4+PiBJbiB0aGlzIGNhc2UgdGhlIGFuIG9mdGVu
IHVzZWQgY29udmVudGlvbiAod2hpY2ggaXMgYWxzbyBraW5kIG9mDQo+Pj4gcmVhZGFibGUpIGlz
IHRvIGFkZCBhIG5ld2xpbmUgYWZ0ZXIgdGhlIHJldHVybiB2YWx1ZXMsIGJ1dCBiZWZvcmUgdGhl
DQo+Pj4gZnVuY3Rpb24gbmFtZS4gRS5nLiBzb21ldGhpbmcgbGlrZSB0aGlzOg0KPj4+DQo+Pj4g
c3RhdGljIGlubGluZSBzdHJ1Y3QgZHJtX2dlbV92cmFtX29iamVjdCoNCj4+PiBkcm1fZ2VtX3Zy
YW1fb2ZfYm8oc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykNCj4+Pg0KPj4+IFJlZ2FyZHMs
DQo+Pj4gQ2hyaXN0aWFuLg0KPj4+DQo+Pj4+IEJ1dCB5b3UgYXNrIGZvciBhIHByZWZlcnJlZCBz
dHlsZSAtIHdoaWNoIEkgZG8gbm90IHRoaW5rIHdlIGhhdmUgaW4gdGhpcw0KPj4+PiBjYXNlLiBT
byBpdCBib2lscyBkb3duIHRvIHdoYXQgeW91IHByZWZlci4NCj4+Pj4NCj4+Pj4gRW5vdWdoIGJp
a2VzaGVkZGluZywgdGhhbmtzIGZvciB0aGUgcXVpY2sgcmVzcG9uc2UuDQo+Pj4+DQo+Pj4+ICAg
ICAgICAgICBTYW0NCj4+IC0tDQo+PiBUaG9tYXMgWmltbWVybWFubg0KPj4gR3JhcGhpY3MgRHJp
dmVyIERldmVsb3Blcg0KPj4gU1VTRSBMaW51eCBHbWJILCBNYXhmZWxkc3RyYXNzZSA1LCA5MDQw
OSBOdWVybmJlcmcsIEdlcm1hbnkNCj4+IEdGOiBGZWxpeCBJbWVuZMO2cmZmZXIsIE1hcnkgSGln
Z2lucywgU3JpIFJhc2lhaA0KPj4gSFJCIDIxMjg0IChBRyBOw7xybmJlcmcpDQo+Pg0KPj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+IGRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QNCj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsDQo+
DQo+DQo+IC0tDQo+IERhbmllbCBWZXR0ZXINCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uDQo+ICs0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gN
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
