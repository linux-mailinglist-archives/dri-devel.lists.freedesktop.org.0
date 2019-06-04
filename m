Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B04723455F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 13:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959AE8969E;
	Tue,  4 Jun 2019 11:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820049.outbound.protection.outlook.com [40.107.82.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4AF8968D;
 Tue,  4 Jun 2019 11:24:41 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2453.namprd12.prod.outlook.com (52.132.141.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Tue, 4 Jun 2019 11:24:38 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 11:24:38 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Topic: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Index: AQHVFGTgR+jNVTHnhkq6fR69g1cCsaZ+ymGAgAAqy4CAAAGFgIAABJ0AgAAdFgCAAQQpgIAAC1cAgAAG/4CACy8cgIAACV4A
Date: Tue, 4 Jun 2019 11:24:38 +0000
Message-ID: <1b697f02-a6cf-0bc1-9149-3acd71eb4e30@amd.com>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <3c9b5688-5e83-f173-00e3-6e139e05d466@amd.com>
 <20190527132041.GP21222@phenom.ffwll.local>
 <20190527132607.GH15067@arch-x1c3>
 <0426fb3e-e7bc-2464-cb42-4d5753956d23@amd.com>
 <CAKMK7uE_pRro8PxTwUq+pC_1GVVT7nUxan1T-kqSYT=BMHTf2g@mail.gmail.com>
 <d12a7dd4-595b-d0aa-a87d-527392fb0384@amd.com>
 <CAKMK7uE1ZWjCeg3q7qDrbcj89+DuPQwfjMqC8hTjDAMU5bhh-w@mail.gmail.com>
 <98c3d891-6966-2043-9709-4e718dbc6bac@amd.com>
 <ee1b8980-3d78-aa6d-fe46-2c0d45c2bbdd@daenzer.net>
In-Reply-To: <ee1b8980-3d78-aa6d-fe46-2c0d45c2bbdd@daenzer.net>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6P194CA0106.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::47) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56c12f83-d0ea-485f-77e2-08d6e8df3aa0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2453; 
x-ms-traffictypediagnostic: DM5PR12MB2453:
x-microsoft-antispam-prvs: <DM5PR12MB24539F903721D6CA5B7BDC7283150@DM5PR12MB2453.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(396003)(136003)(39860400002)(346002)(199004)(189003)(14454004)(186003)(65956001)(72206003)(4744005)(6512007)(256004)(476003)(65806001)(446003)(81166006)(81156014)(8676002)(8936002)(11346002)(25786009)(229853002)(486006)(36756003)(86362001)(66446008)(64756008)(66556008)(66476007)(6436002)(68736007)(6486002)(64126003)(478600001)(76176011)(53936002)(6506007)(99286004)(316002)(31696002)(2616005)(46003)(52116002)(305945005)(73956011)(4326008)(7736002)(66946007)(110136005)(58126008)(5660300002)(6116002)(54906003)(2906002)(6246003)(53546011)(31686004)(65826007)(71200400001)(386003)(102836004)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2453;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gEtjFOkwPYhu5xt9dLc2Sus6mi/IHi3H99XRHXJGi91u/O/e13n++h0+D6nI7FBEDFevIuk67Q+HU1QO8OGDl6L0a+cruK4rUk278kJsevUw57xkIb7gsWZxmN1p5dNjMOHpl4Q6am924ftdjhMlqeE6s+IlqyzsQ4ujF16jgWk5ma4ipEE4/rHLsELWal+rM+/+yqyAcA0N3qCjYq1pDD1GL9qpTCmVRi/Ldg+33+TpJ+hM93NOb6FelSN5EGVesLyrWrN9/IiAm3hshe4DROQZ/GViXi/y350iiTm+BolPbmFsdL6jxwG9GwTlFL/pX8hYbYaN2DXJziCYoHAAXG0FlFAdjfms6E2NN0vyb18NU8R7Dq7B/VD1pLfeb243tV2766AbKnsL4Oj2hrb+ErjHH0OgpBvZ4wGqiqTKia0=
Content-ID: <4F9F40EEF4528C428DC8C64DDE2EE26C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c12f83-d0ea-485f-77e2-08d6e8df3aa0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 11:24:38.2173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2453
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oonmWG5wRC2GduFdJBs8M+IBX8pK9ez094OnTzI59wQ=;
 b=08fd4BYt09CiFbF+RfKpdKVdeM0vQqDbJUUxD4V8TwhQ+FUDJbi444yESRtSnWqVNS5zOxFs88ct5hkiXfD/1AXjNCPsXfaoClsKFHDyjXtuNa001mKAgwPr2lNfACvhs01fiyU6LwI8r6FLeM3lIFtNLoN4F9p9kX4V3sTMqN4=
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMDYuMTkgdW0gMTI6NTAgc2NocmllYiBNaWNoZWwgRMOkbnplcjoNCj4gT24gMjAxOS0w
NS0yOCAxMDowMyBhLm0uLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToNCj4+IEkgcmF0aGVyIHRo
aW5rIHRoYXQgd2Ugc2hvdWxkIGdvIGRvd24gdGhlIHJvdXRlIG9mIGNvbXBsZXRlbHkgZHJvcHBp
bmcNCj4+IGNvbW1hbmQgc3VibWlzc2lvbiBhbmQgYnVmZmVyIGFsbG9jYXRpb24gdGhyb3VnaCB0
aGUgcHJpbWFyeSBub2RlIGZvcg0KPj4gbm9uIG1hc3RlciBjbGllbnRzLiBBbmQgdGhlbiBhcyBu
ZXh0IHN0ZXAgYXQgc29tZSBwb2ludCBkcm9wIHN1cHBvcnQgZm9yDQo+PiBhdXRoZW50aWNhdGlv
bi9mbGluay4NCj4gS2VlcCBpbiBtaW5kIHRoYXQgZXZlbiBkaXNwbGF5IHNlcnZlcnMgYXJlbid0
IERSTSBtYXN0ZXIgd2hpbGUgdGhlaXIgVlQNCj4gaXNuJ3QgYWN0aXZlLCBzbyB0aGlzIG1pZ2h0
IGJlIHByb2JsZW1hdGljIGlmIGEgZGlzcGxheSBzZXJ2ZXIgbmVlZHMgdG8NCj4gZG8gc29tZSBj
b21tYW5kIHN1Ym1pc3Npb24gLyBidWZmZXIgYWxsb2NhdGlvbiBkdXJpbmcgdGhhdCB0aW1lLg0K
DQpJZiBJIHVuZGVyc3RhbmQgaXQgY29ycmVjdGx5IHRoZSBEUk0gZmQgc3RheXMgbWFzdGVyIGV2
ZW4gd2hlbiB0aGUgVlQgaXMgDQpzd2l0Y2hlZCBhd2F5LCBpdCdzIGp1c3Qgbm90IHRoZSBjdXJy
ZW50IG1hc3RlciBhbnkgbW9yZS4NCg0KU28gaW4gdGhpcyBjYXNlIGZwcml2LT5pc19tYXN0ZXIg
c3RheXMgdHJ1ZSwgYnV0IA0KZHJtX2lzX2N1cnJlbnRfbWFzdGVyKGZwcml2KSByZXR1cm5zIGZh
bHNlLg0KDQpBbmQgeWVzIHdlIG1peGVkIHRoYXQgdXAgaW4gYW1kZ3B1LCBpOTE1IGFuZCB2bXdn
ZnguIFNvbWVib2R5IHNob3VsZCANCnByb2JhYmx5IHdyaXRlIHBhdGNoZXMgdG8gZml4IHRoaXMu
DQoNClJlZ2FyZHMsDQpDaHJpc3RpYW4uDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
