Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E47B2C0C7
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 10:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75FD88F94;
	Tue, 28 May 2019 08:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810088.outbound.protection.outlook.com [40.107.81.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0593088F94;
 Tue, 28 May 2019 08:03:39 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1131.namprd12.prod.outlook.com (10.168.236.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.21; Tue, 28 May 2019 08:03:37 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 08:03:37 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Topic: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Index: AQHVFGTgR+jNVTHnhkq6fR69g1cCsaZ+ymGAgAAqy4CAAAGFgIAABJ0AgAAdFgCAAQQpgIAAC1cAgAAG/4A=
Date: Tue, 28 May 2019 08:03:36 +0000
Message-ID: <98c3d891-6966-2043-9709-4e718dbc6bac@amd.com>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <3c9b5688-5e83-f173-00e3-6e139e05d466@amd.com>
 <20190527132041.GP21222@phenom.ffwll.local>
 <20190527132607.GH15067@arch-x1c3>
 <0426fb3e-e7bc-2464-cb42-4d5753956d23@amd.com>
 <CAKMK7uE_pRro8PxTwUq+pC_1GVVT7nUxan1T-kqSYT=BMHTf2g@mail.gmail.com>
 <d12a7dd4-595b-d0aa-a87d-527392fb0384@amd.com>
 <CAKMK7uE1ZWjCeg3q7qDrbcj89+DuPQwfjMqC8hTjDAMU5bhh-w@mail.gmail.com>
In-Reply-To: <CAKMK7uE1ZWjCeg3q7qDrbcj89+DuPQwfjMqC8hTjDAMU5bhh-w@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR02CA0076.eurprd02.prod.outlook.com
 (2603:10a6:208:154::17) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 471553aa-8539-40b3-8248-08d6e342fcbc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1131; 
x-ms-traffictypediagnostic: DM5PR12MB1131:
x-microsoft-antispam-prvs: <DM5PR12MB1131AE9CB0FFE6C71B898B44831E0@DM5PR12MB1131.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(366004)(396003)(39860400002)(346002)(199004)(189003)(186003)(5660300002)(6512007)(64126003)(7736002)(6436002)(305945005)(316002)(66946007)(73956011)(81166006)(478600001)(229853002)(65956001)(86362001)(31696002)(65826007)(8936002)(6486002)(65806001)(66446008)(66556008)(6916009)(66476007)(64756008)(76176011)(53936002)(54906003)(58126008)(2906002)(99286004)(11346002)(52116002)(6506007)(386003)(14454004)(31686004)(6116002)(102836004)(46003)(486006)(36756003)(72206003)(71200400001)(4326008)(8676002)(6246003)(71190400001)(25786009)(81156014)(14444005)(446003)(68736007)(2616005)(256004)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1131;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YgrnpQ9bLsP3kiB2dg8226FN2FaePvFUnB3sOSNeSAMY1XF0XOgdcC37o4SG1JqvMsfMkdQwDN2iaFqEw3fYxUxBvdlvvFXerEZmOrneZzRW+Afx+HYxGp0KbPMF4ilV/tGt7wNZRiC9xFRjE4Dzrg0imW7ao1M27eVJCaoRCipv+cpvBOsCX53DhsljxCKPYnGU3i+zdzYvg/kSYiqUft7NLh6cKT9D6DxFSps9G3XHYKzvIw/UfW47V/6wkXWM8ZlNCWJFbBxHJ0oFeNazohIz0N6pvJ5T6w9ocVmqGJjjMhwVDwAummPJ3hGAgB1nsouflZYxV/dG0Pv4TVsfsiofq5Or13icnsgpdwAdB2z7H0XbCPjm6VPJpPvVic84bnCFP3iOHgZVp5Qo91E8YTL+7LIpuQawlJmQVOv9Yq8=
Content-ID: <E831FA0FFED0FE47992255777D584653@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 471553aa-8539-40b3-8248-08d6e342fcbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 08:03:37.0155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1131
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FErNTYlsgq/3P5IHjuvZGGjuBznIugZN1CbXnyut/EY=;
 b=sGC6vN9CB9225WxhTUoP7b6m4ESpt6XSf4m4hRnlZ3PoluzaY6xCQ0epN15A9Qunv+ptRM7quBFf62Li8+P/kZckIFK5DnzsPeU0Z3VDEADWJj4zrx7QgkmpCMJOu+z6TXlQBRQ2HCSleUwn+4IVqup3iHqLK3e+L7+gc2ib2Mg=
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

QW0gMjguMDUuMTkgdW0gMDk6Mzggc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBbU05JUF0NCj4+
IE1pZ2h0IGJlIGEgZ29vZCBpZGVhIGxvb2tpbmcgaW50byByZXZlcnRpbmcgaXQgcGFydGlhbGx5
LCBzbyB0aGF0IGF0DQo+PiBsZWFzdCBjb21tYW5kIHN1Ym1pc3Npb24gYW5kIGJ1ZmZlciBhbGxv
Y2F0aW9uIGlzIHN0aWxsIGJsb2NrZWQuDQo+IEkgdGhvdWdodCB0aGUgaXNzdWUgaXMgYSBsb3Qg
bW9yZSB0aGFuIHZhaW5mbywgaXQncyBwcmV0dHkgbXVjaCBldmVyeQ0KPiBoYWNrZWQgdXAgY29t
cG9zaXRvciB1bmRlciB0aGUgc3VuIGdldHRpbmcgdGhpcyB3cm9uZyBvbmUgd2F5IG9yDQo+IGFu
b3RoZXIuIFRoaW5raW5nIGFib3V0IHRoaXMgc29tZSBtb3JlLCBJIGFsc28gaGF2ZSBubyBpZGVh
IGhvdyB5b3UnZA0KPiB3YW50IHRvIGRlcHJlY2F0ZSByZW5kZXJpbmcgb24gcHJpbWFyeSBub2Rl
cyBpbiBnZW5lcmFsLiBBcHBhcmVudGx5DQo+IHRoYXQgYnJlYWtzIC1tb2Rlc2V0dGluZyBhbHJl
YWR5LCBhbmQgcHJvYmFibHkgbG90cyBtb3JlIGNvbXBvc2l0b3JzLg0KPiBBbmQgaXQgbG9va3Mg
bGlrZSB3ZSdyZSBmaW5hbGx5IGFjaGlldmUgdGhlIGdvYWwga21zIHNldCBvdXQgdG8gMTANCj4g
eWVhcnMgYWdvLCBhbmQgbmV3IGNvbXBvc2l0b3JzIGFyZSBzcHJvdXRpbmcgdXAgYWxsIHRoZSB0
aW1lLiBJIGd1ZXNzDQo+IHdlIGNvdWxkIGp1c3QgYnJlYWsgdGhlbSBhbGwgKG9uIG5ldyBoYXJk
d2FyZSkgYW5kIHRlbGwgdGhlbSB0byBhbGwNCj4gc3VjayBpdCB1cC4gQnV0IEkgZG9uJ3QgdGhp
bmsgdGhhdCdzIGEgZ3JlYXQgb3B0aW9uLiBBbmQganVzdA0KPiBkZXByZWNhdGluZyB0aGlzIG9u
IGFtZGdwdSBpcyBnb2luZyB0byBiZSBldmVuIGhhcmRlciwgc2luY2UgdGhlbg0KPiBldmVyeXdo
ZXJlIGVsc2UgaXQnbGwga2VlcCB3b3JraW5nLCBhbmQgaXQncyBqdXN0IGFtZGdwdS5rbyB0aGF0
IGxvb2tzDQo+IGJyb2tlbi4NCj4NCj4gQXNpZGU6IEknbSBub3Qgc3VwcG9ydGluZyBFbWlsJ3Mg
aWRlYSBoZXJlIGJlY2F1c2UgaXQgZml4ZXMgYW55IGlzc3Vlcw0KPiBJbnRlbCBoYXMgLSBJbnRl
bCBkb2Vzbid0IGNhcmUuIEkgc3VwcG9ydCBpdCBiZWNhdXNlIHJlYWxpdHkgc3Vja3MsDQo+IHBl
b3BsZSBnZXQgdGhpcyByZW5kZXIgdnMuIHByaW1hcnkgdnMuIG11bHRpLWdwdSBwcmltZSB3cm9u
ZyBhbGwgdGhlDQo+IHRpbWUgKHRoYXQncyBhbHNvIHdoeSB3ZSBoYXZlIGhhcmRjb2RlZCBkaXNw
bGF5K2dwdSBwYWlycyBpbiBtZXNhIGZvcg0KPiB0aGUgdmFyaW91cyBzb2MgY29tYmluYXRpb25z
IG91dCB0aGVyZSksIGFuZCB0aGlzIGxvb2tzIGxpa2UgYQ0KPiBwcmFnbWF0aWMgc29sdXRpb24u
IEl0J2QgYmUgbmljZSBpZiBldmVyeSBjb21wb3NpdG9yIGFuZCBldmVyeXRoaW5nDQo+IGVsc2Ug
d291bGQgcGVyZmVjdGx5IHN1cHBvcnQgbXVsdGkgZ3B1IGFuZCBvbmx5IHVzZSByZW5kZXIgbm9k
ZXMgZm9yDQo+IHJlbmRlcmluZywgYW5kIG9ubHkgcHJpbWFyeSBub2RlcyBmb3IgZGlzcGxheS4g
QnV0IHJlYWxpdHkgaXMgdGhhdA0KPiBwZW9wbGUgaGFjayBvbiBzdHVmZiB1bnRpbCBnZWFycyBv
biBzY3JlZW4gYW5kIHRoZW4gbW92ZSBvbiB0byBtb3JlDQo+IGludGVyZXN0aW5nIHRoaW5ncyAo
dG8gdGhlbSkuIFNvIEkgZG9uJ3QgdGhpbmsgd2UnbGwgZXZlciB3aW4gdGhpcyA6LS8NCg0KWWVh
aCwgYnV0IHRoaXMgaXMgYSBjbGFzc2ljIGNhc2Ugb2Ygd29ya2luZyBhcm91bmQgdXNlciBzcGFj
ZSBpc3N1ZXMgYnkgDQptYWtpbmcga2VybmVsIGNoYW5nZXMgaW5zdGVhZCBvZiBmaXhpbmcgdXNl
ciBzcGFjZS4NCg0KSGF2aW5nIHByaXZpbGVnZWQgKG91dHB1dCBjb250cm9sKSBhbmQgdW5wcml2
aWxlZ2VkIChyZW5kZXJpbmcgY29udHJvbCkgDQpmdW5jdGlvbmFsaXR5IGJlaGluZCB0aGUgc2Ft
ZSBub2RlIGlzIGEgbWlzdGFrZSB3ZSBoYXZlIG1hZGUgYSBsb25nIHRpbWUgDQphZ28gYW5kIHJl
bmRlciBub2RlcyBmaW5hbGx5IHNlZW1lZCB0byBiZSBhIHdheSB0byBmaXggdGhhdC4NCg0KSSBt
ZWFuIHdoeSBhcmUgY29tcG9zaXRvcnMgdXNpbmcgdGhlIHByaW1hcnkgbm9kZSBpbiB0aGUgZmly
c3QgcGxhY2U/IA0KQmVjYXVzZSB0aGV5IHdhbnQgdG8gaGF2ZSBhY2Nlc3MgdG8gcHJpdmlsZWdl
ZCByZXNvdXJjZXMgSSB0aGluayBhbmQgaW4gDQp0aGlzIGNhc2UgaXQgaXMgcGVyZmVjdGx5IG9r
IHRvIGRvIHNvLg0KDQpOb3cgZXh0ZW5kaW5nIHVucHJpdmlsZWdlZCBhY2Nlc3MgdG8gdGhlIHBy
aW1hcnkgbm9kZSBhY3R1YWxseSBzb3VuZHMgDQpsaWtlIGEgc3RlcCBpbnRvIHRoZSB3cm9uZyBk
aXJlY3Rpb24gdG8gbWUuDQoNCkkgcmF0aGVyIHRoaW5rIHRoYXQgd2Ugc2hvdWxkIGdvIGRvd24g
dGhlIHJvdXRlIG9mIGNvbXBsZXRlbHkgZHJvcHBpbmcgDQpjb21tYW5kIHN1Ym1pc3Npb24gYW5k
IGJ1ZmZlciBhbGxvY2F0aW9uIHRocm91Z2ggdGhlIHByaW1hcnkgbm9kZSBmb3IgDQpub24gbWFz
dGVyIGNsaWVudHMuIEFuZCB0aGVuIGFzIG5leHQgc3RlcCBhdCBzb21lIHBvaW50IGRyb3Agc3Vw
cG9ydCBmb3IgDQphdXRoZW50aWNhdGlvbi9mbGluay4NCg0KSSBtZWFuIHdlIGhhdmUgZG9uZSB0
aGlzIHdpdGggVU1TIGFzIHdlbGwgYW5kIEkgZG9uJ3Qgc2VlIG11Y2ggb3RoZXIgd2F5IA0KdG8g
bW92ZSBmb3J3YXJkIGFuZCBnZXQgcmlkIG9mIHRob3NlIGFuY2llbnQgaW50ZXJmYWNlIGluIHRo
ZSBsb25nIHRlcm0uDQoNClJlZ2FyZHMsDQpDaHJpc3RpYW4uDQoNCj4gLURhbmllbA0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
