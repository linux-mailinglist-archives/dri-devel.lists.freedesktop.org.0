Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5C378F32
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 17:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1571D89FDD;
	Mon, 29 Jul 2019 15:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720062.outbound.protection.outlook.com [40.107.72.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3CC689FDD;
 Mon, 29 Jul 2019 15:28:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNCDVOef6CJkNpB8/lR1R+lvqGxtfYMX87nk75eOz/K/CWOGr8+CmNxnEJ7a/eN1uSe7u9YquaG+IvlSI4llI5Med316IL7CAyInNcpj5Nm15Nl/nM0VkT4/U5uuGunT5JPTHioe4z6jhRlbTcjZ067vFvbGxYFxJ+5k+IvgcDgFYRJzydhMulV+NI0STh6yBvRhtuDqe8FbetFpXhASPpjhFkVNDAxjoaITHjyG4QGdTYNFwo1cAzkj2mB/dqOzF/SfBj9Q+kdQfAK/xwavaU1JCtytH/NB/Y/4v+GJDgZbBI2aiuKGNmFGys6fymgt+mnbaMULzHRchbYvPyXzxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Du1A6EJe7Bev/MzUoECU3SbhpZvFkTx5zpRmfOsJUOE=;
 b=QanaQW0FFs3yGU9/Dhe1ccGG687fcQ9PHNNLTd5o23kB1okGk2bG65g2lBcKGjBpAnd2unqsx04iHIKkL488/Z0LsJ9udnqfin3q0tkSa9U6dRFCExtixlFaMEBV4KP2wztH760Wxaan35y/w2/GrazRhlBz654Cpv5aeN00fyzPRpsW85BMivjqsow+qv2PaInCSgUK2meaZ6z8FZt0wKQKQUON6sy9s0Vb5FoTIwy+g55bTo/mNZ8pTUum9IWfZIB2OKnJcAu1PCk/+m45sijmkN3DpxynyQxJlYiJJixGa3LAg3rLqoexCaFNCJVny5CJZ9ycOFCHQxHWhmtrlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1628.namprd12.prod.outlook.com (10.172.35.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Mon, 29 Jul 2019 15:28:15 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::9ddf:934:8155:a6ff]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::9ddf:934:8155:a6ff%2]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 15:28:15 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Sam Ravnborg <sam@ravnborg.org>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v1 02/11] drm: drop uapi dependency from drm_print.h
Thread-Topic: [PATCH v1 02/11] drm: drop uapi dependency from drm_print.h
Thread-Index: AQHVPYQGC1CUWl5tBEabUnuzJI4nDabQlbYAgADs0ICAEBl5gIAAHtSAgAAOlwA=
Date: Mon, 29 Jul 2019 15:28:15 +0000
Message-ID: <67c2807f-582c-49a9-5699-a8baab3d3a0f@amd.com>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-3-sam@ravnborg.org>
 <156346840026.24728.936589728458336617@skylake-alporthouse-com>
 <460bf1e1-a38b-5f79-26e5-93764067f4e1@amd.com> <87tvb5nh5c.fsf@intel.com>
 <20190729143555.GA16927@ravnborg.org>
In-Reply-To: <20190729143555.GA16927@ravnborg.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0093.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::33) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ecfe9b11-0583-41ec-38f1-08d714396000
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1628; 
x-ms-traffictypediagnostic: DM5PR12MB1628:
x-microsoft-antispam-prvs: <DM5PR12MB16283D0D7B70DCBDBEA0B41683DD0@DM5PR12MB1628.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(199004)(189003)(486006)(54906003)(65956001)(64126003)(71190400001)(6512007)(476003)(11346002)(71200400001)(81156014)(68736007)(81166006)(99286004)(86362001)(65806001)(110136005)(31686004)(31696002)(14454004)(316002)(7736002)(76176011)(256004)(6116002)(446003)(6436002)(7416002)(58126008)(305945005)(46003)(66556008)(2616005)(4326008)(6246003)(8676002)(66946007)(8936002)(25786009)(65826007)(53936002)(6506007)(2906002)(64756008)(52116002)(66446008)(102836004)(5660300002)(386003)(6486002)(66476007)(186003)(229853002)(478600001)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1628;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MrfBZZa7YTsENGQs76boff0KVwMKjlTh5kviiZI6BeeIpAQuSoOIuLz20fJTvz4TQ6fvEYZJCHedCC9lzQP+Oi3IGP0YC+zw3rxJQqgoN/2J2p6f6PJ4n1uM8qh6Wm7CIe8fOdyK3bVGkRM4EcJeLUUyB5BuYh1RbVD/umKsai3er7n7ztYlQMqzjASNQHZwMd141s97JyPMtcKYmUABCnXsJSdWV1ulYLYNHPXCUsV7EHi97ub8tvDkLmuPvCrrQD3XlCaIJJ4q7RT69uaaEb/1Y3dEMjH+nPkPx0ZanIY8P6CvVdX87UwqfWiz87ziYc3egoa+2YMRW2KJejpQ5uiuOZDfkJvBh6liOZqPv8OhpjbRSI0VqrLjGItuC1PSlgj4WKh14im39aQ7V3iNnpqLsfILoiHZl78ioo25lvQ=
Content-ID: <84E71931003A7145BA52528F26BA144F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecfe9b11-0583-41ec-38f1-08d714396000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 15:28:15.4855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1628
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Du1A6EJe7Bev/MzUoECU3SbhpZvFkTx5zpRmfOsJUOE=;
 b=uAgxDrO4b1c88/tOCqIor4s9IkWAaL3EQc9gKSDj/FVQRpWYdJFIqZ/Bac0i9+cpAQf9xarQDKqvhWSgnpsEUwUax2OCsOtOHpFsYj2il21X4kvZ4A6yKUstd6PzRJTku6vAwn0bhgNYkwaib7C0mTUe2c8sSJo+detkzaYVp/M=
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Thierry Reding <treding@nvidia.com>, Sean Paul <sean@poorly.run>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjkuMDcuMTkgdW0gMTY6MzUgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+Pj4+IEV2ZW4gdGhl
biBpdCBzbyB1c2VsZXNzICh3aGljaCBkcm0gZHJpdmVyIGlzIHRoaXMgbWVzc2FnZSBmb3I/Pz8p
IHRoYXQgSQ0KPj4+PiB3YW50IHRvIHJlbW92ZSB0aGVtIGFsbCA6KA0KPj4+IFllYWgsIGFncmVl
LiBJIG1lYW4gaXQgaXMgbmljZSBpZiB0aGUgY29yZSBkcm0gZnVuY3Rpb25zIHVzZSBhIHByZWZp
eA0KPj4+IGZvciBkZWJ1ZyBvdXRwdXQuDQo+Pj4NCj4+PiBCdXQgSSBhY3R1YWxseSBkb24ndCBz
ZWUgdGhlIHBvaW50IGZvciBpbmRpdmlkdWFsIGRyaXZlcnMuDQo+PiBXZSBzaG91bGQgYWxsIG1p
Z3JhdGUgdG8gdGhlIHZlcnNpb25zIHdpdGggZGV2aWNlLi4uDQo+IEp1c3QgdG8gZG8gYW4geGtk
Yy5jb20vOTI3IEkgaGF2ZSBjb25zaWRlcmVkOg0KPg0KPiBkcm1fZXJyKGNvbnN0IHN0cnVjdCBk
cm1fZGV2aWNlICpkcm0sIC4uLikNCj4gZHJtX2luZm8oY29uc3Qgc3RydWN0IGRybV9kZXZpY2Ug
KmRybSwgLi4uKQ0KPg0KPiBkcm1fa21zX2Vycihjb25zdCBzdHJ1Y3QgZHJtX2RldmljZSAqZHJt
LCAuLi4pDQo+IGRybV9rbXNfaW5mbyhjb25zdCBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCAuLi4p
KQ0KDQpXaHkgbm90IGdldCBjb21wbGV0ZWx5IHJpZCBvZiB0aG9zZSBhbmQganVzdCB1c2UgZGV2
X2VyciwgZGV2X3dhcm4sIA0KcHJfZXJyLCBwcl93YXJuIGV0Yz8NCg0KSSBtZWFuIGlzIGl0IHVz
ZWZ1bCB0byBoYXZlIHRoaXMgZXh0cmEgcHJpbnRpbmcgc3Vic3lzdGVtIGluIERSTSB3aGlsZSAN
CnRoZSBzdGFuZGFyZCBMaW51eCBvbmUgYWN0dWFsbHkgZG9lcyBhIGJldHRlciBqb2I/DQoNCkNo
cmlzdGlhbi4NCg0KPg0KPiBBbmQgc28gb24gZm9yIHZibCwgcHJpbXNlLiBsZWFzZSwgc3RhdGUg
ZXRjLg0KPg0KPiBUaGVuIHdlIGNvdWxkIGZpc2ggb3V0IHJlbGV2YW50IGluZm8gZnJvbSB0aGUg
ZHJtIGRldmljZSBhbmQgcHJlc2VudA0KPiB0aGlzIG5pY2VseS4NCj4NCj4gRm9yIHRoZSBjYXNl
cyB3aGVyZSBubyBkcm1fZGV2aWNlIGlzIGF2YWlsYWJsZSB0aGUgZmFsbGJhY2sgaXM6DQo+IGRy
bV9kZXZfZXJyKGNvbnN0IHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIC4uLikNCj4gZHJtX2Rldl9p
bmZvKGNvbnN0IHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIC4uLikpDQo+DQo+IFdlIGNvdWxkIG1v
ZGlmeSB0aGUgZXhpc3RpbmcgVVBQRVJDQVNFIG1hY3JvcyB0byBiZSBwbGFjZWhvbGRlcnMgZm9y
DQo+IHRoZSBtb3JlIHJlYWRlciBmcmllbmRseSBsb3dlciBjYXNlcyB2YXJpYW50cyBhbmQgYmFz
ZSBpdCBhbGwgb24gdGhlDQo+IGVzdGFibGlzaGVkIGluZnJhc3RydWN0dXJlLg0KPg0KPiBCdXQg
dGhpcyBpcyBqdXN0IGlkbGUgdGhpbmtpbmcsIGFzIG9ubHkgYSBzZXJpb3VzIHBhdGNoIHdvdWxk
IHN0aXIgdGhlDQo+IHJlbGV2YW50IGRpc2N1c3Npb25zLg0KPg0KPiBGb3Igbm93IHRoaXMgaXMg
ZmFyIGZyb20gdGhlIHRvcCBvZiBteSBUT0RPIGxpc3QuDQo+DQo+DQo+IAlTYW0NCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
