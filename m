Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3C852441
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9C289F2E;
	Tue, 25 Jun 2019 07:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810072.outbound.protection.outlook.com [40.107.81.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC3C89B9A;
 Tue, 25 Jun 2019 07:20:15 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2423.namprd12.prod.outlook.com (52.132.141.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 07:20:12 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935%6]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 07:20:12 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 1/6] dma-buf: add dynamic DMA-buf handling v10
Thread-Topic: [Intel-gfx] [PATCH 1/6] dma-buf: add dynamic DMA-buf handling v10
Thread-Index: AQHVKByfoRH24EaDVk6omoohzNq+pqamA2gAgABI64CABGHygIAAKywAgAAMCYCAARcfgA==
Date: Tue, 25 Jun 2019 07:20:12 +0000
Message-ID: <d2933e7a-5dd1-70af-cbb6-69755fcbbc5e@amd.com>
References: <20190618115455.1253-1-christian.koenig@amd.com>
 <20190621092022.GB12905@phenom.ffwll.local>
 <46bc08a3-1b84-c819-dbb5-882e95ab23e5@gmail.com>
 <CAKMK7uE6NUujY0ubOYkux-StOxMT-hYhBdAnQJkDsgEkuDjH9g@mail.gmail.com>
 <78db8951-2e62-2a9d-3d87-3b458fbba880@gmail.com>
 <20190621162753.GI12905@phenom.ffwll.local>
 <4d868c4c-cc00-bfa9-b6f5-969b76497cab@amd.com>
 <1d4f3779-8dc8-14ad-4d20-f7ccee7cea53@gmail.com>
 <20190624144105.GR12905@phenom.ffwll.local>
In-Reply-To: <20190624144105.GR12905@phenom.ffwll.local>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0036.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::24) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d4888d8-2832-4cbe-132e-08d6f93d8f99
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2423; 
x-ms-traffictypediagnostic: DM5PR12MB2423:
x-microsoft-antispam-prvs: <DM5PR12MB242312062C5A06783823691C83E30@DM5PR12MB2423.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(366004)(376002)(136003)(396003)(189003)(199004)(66476007)(66446008)(54906003)(73956011)(64756008)(66946007)(478600001)(14454004)(66556008)(68736007)(25786009)(8936002)(46003)(6512007)(58126008)(71200400001)(71190400001)(86362001)(229853002)(2906002)(36756003)(6486002)(64126003)(31696002)(65826007)(6916009)(4326008)(66574012)(99286004)(52116002)(2616005)(6116002)(72206003)(486006)(76176011)(6436002)(8676002)(305945005)(31686004)(7736002)(446003)(256004)(65806001)(316002)(186003)(53936002)(81156014)(6246003)(476003)(11346002)(6506007)(386003)(65956001)(5660300002)(102836004)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2423;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: R71wT6ej130SdrAoIbgajqzjxe/+Gq8RaYLr2bhM8rw860f+7+qFrnKaNEZd2jqICey8CGXqm0Tj52xsYpU3l8yFqM7VZ+NDJ5mwLjdE661eUyASYMlbnqKyUpKXXKfwj5oRiPKzjKYl7w6auw8PMNVSYvRgBv2xfORGrb0i3BJH2Rv+bVrCee++jAA9VFn3k1AEHBodVVoIlV6HkR/l4XvWbp3CgPuixZn8wSwn0kYkhxOMZ5O/o+z+WWQy1BmlR+0LoRdSEaFs79MIjsFm5UsBUchaUzWCvXeHLL8gi6GHd4IpoKs4VLSdjzOHnvlUllcg/mFTtTArONh8mWtmMS7ixINWLE9aSBuPBqlHKo60tRjhAgwX75YbBeTHPh+nbJxM5l/GhrmGa0TOVij7MJ6PuwvQCzwJKDhVg/Wsunw=
Content-ID: <3B0A2450313E0F43823DBCE7D51F8772@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4888d8-2832-4cbe-132e-08d6f93d8f99
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 07:20:12.4795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2423
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9j/Vzwqic35fBsFKsmr3nkTAanWogO8YakvJ4bcCjlA=;
 b=gZ1r+E3SawKW3ZJmfXYR/CRYEDXRSHD0rMP5zD2qkglTv8s7jgZodSLzlbSmRLY1w1job6V9yxiHDYmvtjtRqZ3tWz3EVLYOMnODwojzTqbHoMoWWayUa3Okazm7r6U+QXbwnMmKHfZs09JXNTJxVgBsu+RrVPFvA3pkojZ6LHc=
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjQuMDYuMTkgdW0gMTY6NDEgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBPbiBNb24sIEp1
biAyNCwgMjAxOSBhdCAwMzo1ODowMFBNICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0K
Pj4gQW0gMjQuMDYuMTkgdW0gMTM6MjMgc2NocmllYiBLb2VuaWcsIENocmlzdGlhbjoNCj4+PiBB
bSAyMS4wNi4xOSB1bSAxODoyNyBzY2hyaWViIERhbmllbCBWZXR0ZXI6DQo+Pj4NCj4+Pj4gU28g
SSBwb25kZXJlZCBhIGZldyBpZGVhcyB3aGlsZSB3b3JraW5nIG91dDoNCj4+Pj4NCj4+Pj4gMSkg
V2UgZHJvcCB0aGlzIGZpbHRlcmluZy4gSW1wb3J0ZXIgbmVlZHMgdG8ga2VlcCB0cmFjayBvZiBh
bGwgaXRzDQo+Pj4+IG1hcHBpbmdzIGFuZCBmaWx0ZXIgb3V0IGludmFsaWRhdGVzIHRoYXQgYXJl
bid0IGZvciB0aGF0IHNwZWNpZmljIGltcG9ydGVyDQo+Pj4+IChlaXRoZXIgYmVjYXVzZSBhbHJl
YWR5IGludmFsaWRhdGVkLCBvciBub3QgeWV0IG1hcHBlZCwgb3Igd2hhdGV2ZXIpLg0KPj4+PiBG
ZWVscyBmcmFnaWxlLg0KPj4+Pg0KPj4+PiBbU05JUF0NCj4+PiBbU05JUF0NCj4+Pg0KPj4+IEkg
d2lsbCB0YWtlIGEgbW9tZW50IGFuZCBsb29rIGludG8gIzEgYXMgd2VsbCwgYnV0IEkgc3RpbGwg
ZG9uJ3Qgc2VlIHRoZQ0KPj4+IG5lZWQgdG8gY2hhbmdlIGFueXRoaW5nLg0KPj4gVGhhdCB0dXJu
ZWQgb3V0IG11Y2ggY2xlYW5lciB0aGFuIEkgdGhvdWdodCBpdCB3b3VsZCBiZS4gRXNzZW50aWFs
bHkgaXQgaXMNCj4+IG9ubHkgYSBzaW5nbGUgZXh0cmEgbGluZSBvZiBjb2RlIGluIGFtZGdwdS4N
Cj4+DQo+PiBHb2luZyB0byBzZW5kIHRoYXQgb3V0IGFzIGEgcGF0Y2ggc2V0IGluIGEgbWludXRl
Lg0KPiBZZWFoIEkgbWVhbiBraW5kYSBleHBlY3RlZCB0aGF0IGJlY2F1c2U6DQo+IC0gZXZlcnl0
aGluZydzIHByb3RlY3RlZCB3aXRoIHd3X211dGV4IGFueXdheQ0KPiAtIGltcG9ydGVyIG5lZWRz
IHRvIGtlZXAgdHJhY2sgb2YgbWFwcGluZ3MgYW53YXlzDQo+IFNvIHJlYWxseSBhbGwgaXQgbmVl
ZHMgdG8gZG8gaXMgbm90IGJlIHN0dXBpZCBhbmQgYWRkIHRoZSBtYXBwaW5nIGl0IGp1c3QNCj4g
Y3JlYXRlZCB0byBpdHMgdHJhY2tpbmcgd2hpbGUgc3RpbGwgaG9sZGluZyB0aGUgd3dfbXV0ZXgu
IFNpbWlsYXIgb24NCj4gaW52YWxpZGF0ZS91bm1hcC4NCj4NCj4gV2l0aCB0aGF0IGFsbCB3ZSBu
ZWVkIGlzIGEgaHVnZSBub3RlIGluIHRoZSBkb2NzIHRoYXQgaW1wb3J0ZXJzIG5lZWQgdG8NCj4g
a2VlcCB0cmFjayBvZiB0aGVpciBtYXBwaW5ncyBhbmQgZHRydCAod2l0aCBhbGwgdGhlIGV4YW1w
bGVzIGhlcmUgc3BlbGxlZA0KPiBvdXQgaW4gdGhlIGFwcHJvcHJpYXRlIGtlcm5lbGRvYykuIEFu
ZCB0aGVuIEknbSBoYXBweSA6LSkNCg0KU2hvdWxkIEkgYWxzbyByZW5hbWUgdGhlIGludmFsaWRh
dGUgY2FsbGJhY2sgaW50byBtb3ZlX25vdGlmeT8gV291bGQgDQpraW5kIG9mIG1ha2Ugc2Vuc2Ug
c2luY2Ugd2UgYXJlIG5vdCBuZWNlc3NhcnkgZGlyZWN0bHkgaW52YWxpZGF0aW5nIA0KbWFwcGlu
Z3MuDQoNCkNocmlzdGlhbi4NCg0KPg0KPiBDaGVlcnMsIERhbmllbA0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
