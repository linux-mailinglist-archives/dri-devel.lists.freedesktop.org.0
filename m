Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF482B6B8
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 15:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F9CF6E1FB;
	Mon, 27 May 2019 13:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810075.outbound.protection.outlook.com [40.107.81.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF356E1F1;
 Mon, 27 May 2019 13:42:47 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1610.namprd12.prod.outlook.com (10.172.33.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.21; Mon, 27 May 2019 13:42:46 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1922.021; Mon, 27 May 2019
 13:42:45 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Emil Velikov <emil.l.velikov@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Topic: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Index: AQHVFGTgR+jNVTHnhkq6fR69g1cCsaZ+ymGAgAAqy4CAAAGFgIAABJ0A
Date: Mon, 27 May 2019 13:42:45 +0000
Message-ID: <0426fb3e-e7bc-2464-cb42-4d5753956d23@amd.com>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <3c9b5688-5e83-f173-00e3-6e139e05d466@amd.com>
 <20190527132041.GP21222@phenom.ffwll.local>
 <20190527132607.GH15067@arch-x1c3>
In-Reply-To: <20190527132607.GH15067@arch-x1c3>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6P192CA0092.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::33) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da3a808c-aed9-4acf-45a1-08d6e2a93310
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1610; 
x-ms-traffictypediagnostic: DM5PR12MB1610:
x-microsoft-antispam-prvs: <DM5PR12MB1610FDB6C8C8DE50E653AEFC831D0@DM5PR12MB1610.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0050CEFE70
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(136003)(366004)(396003)(39860400002)(189003)(199004)(8936002)(64126003)(186003)(65826007)(2906002)(6116002)(486006)(31686004)(476003)(81166006)(2616005)(81156014)(446003)(46003)(31696002)(14444005)(256004)(86362001)(11346002)(6246003)(71190400001)(71200400001)(65806001)(65956001)(6436002)(6486002)(316002)(386003)(110136005)(478600001)(58126008)(229853002)(6506007)(5660300002)(102836004)(53936002)(14454004)(36756003)(76176011)(99286004)(72206003)(52116002)(4326008)(25786009)(66946007)(66476007)(66556008)(64756008)(66446008)(54906003)(8676002)(68736007)(305945005)(73956011)(7736002)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1610;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0AuTe9wf1vH71LczqcsZDkX9O9gGESidm9IDY7SQ28oRt9ntRAVcPq/8AD085zF+CWmQ+T3dnNVgITK0aIte3/5ySrsEsA56ID3+R/kbgLVXcwZKOGuPdvj+/CdRsUfk4w2nDVKNXwee2xyhynLNE06fVoXv9EKcqFSJK4tzAbUIVTxR4mPbrPnLQv/mZ2XS93Vb5OcmB2czPXf4UxqHk2vNyXZgm884VvBIQuSyVMUES9E7MMsb6lxQYv41VqpQhsL4jSRZo1ZEQXNnddHYv20M/DGv4v/M2A9XUQNd9v9f3mEn6SidxbURYjuUABYu+zWEYv0AmcPOGoxHXrh8VHWDcjfRgoPnqxuKP+/q6RurtkRWCneBFxH18BAfdJtVxc4AolGhsl/8Z1Eai2+euTfj9f1VAQP1f3hGR2gq9XU=
Content-ID: <C2A99B1FB63CD04D872602F61A1402E8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da3a808c-aed9-4acf-45a1-08d6e2a93310
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2019 13:42:45.7241 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1610
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOxjdegnxU5GVlce+C0EH47K+ki6i57FhwR8D3kjqms=;
 b=RR7v2HX5wuc94XU93FEI7a3a3QFC/LvBgXAmAc+PH/kmwgsFJr5AIKYpzgQLOxhA2CDGYcETAxTigovJ7QfXIdDDDGW4CN2ooWH8kpWWOwog8V6ru6TIQWlh8phVfxTKaAjZuTg9yaSiJtPlpSOjqn+3jh8pHgFauBmOh4hn4x8=
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

QW0gMjcuMDUuMTkgdW0gMTU6MjYgc2NocmllYiBFbWlsIFZlbGlrb3Y6DQo+IE9uIDIwMTkvMDUv
MjcsIERhbmllbCBWZXR0ZXIgd3JvdGU6DQo+PiBPbiBNb24sIE1heSAyNywgMjAxOSBhdCAxMDo0
NzozOUFNICswMDAwLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToNCj4+PiBBbSAyNy4wNS4xOSB1
bSAxMDoxNyBzY2hyaWViIEVtaWwgVmVsaWtvdjoNCj4+Pj4gRnJvbTogRW1pbCBWZWxpa292IDxl
bWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4NCj4+Pj4NCj4+Pj4gQ3VycmVudGx5IG9uZSBjYW4g
Y2lyY3VtdmVudCBEUk1fQVVUSCwgd2hlbiB0aGUgaW9jdGwgaXMgZXhwb3NlZCB2aWEgdGhlDQo+
Pj4+IHJlbmRlciBub2RlLiBBIHNlZW1pbmdseSBkZWxpYmVyYXRlIGRlc2lnbiBkZWNpc2lvbi4N
Cj4+Pj4NCj4+Pj4gSGVuY2Ugd2UgY2FuIGRyb3AgdGhlIERSTV9BVVRIIGFsbCB0b2dldGhlciAo
ZGV0YWlscyBpbiBmb2xsb3ctdXAgcGF0Y2gpDQo+Pj4+IHlldCBub3QgYWxsIHVzZXJzcGFjZSBj
aGVja3MgaWYgaXQncyBhdXRoZW50aWNhdGVkLCBidXQgaW5zdGVhZCB1c2VzDQo+Pj4+IHVuY29t
bW9uIGFzc3VtcHRpb25zLg0KPj4+Pg0KPj4+PiBBZnRlciBkYXlzIG9mIGRpZ2dpbmcgdGhyb3Vn
aCBnaXQgbG9nIGFuZCB0ZXN0aW5nLCBvbmx5IGEgc2luZ2xlIChhYil1c2UNCj4+Pj4gd2FzIHNw
b3R0ZWQgLSB0aGUgTWVzYSBSQURWIGRyaXZlciwgdXNpbmcgdGhlIEFNREdQVV9JTkZPIGlvY3Rs
IGFuZA0KPj4+PiBhc3N1bWluZyB0aGF0IGZhaWx1cmUgaW1wbGllcyBsYWNrIG9mIGF1dGhlbnRp
Y2F0aW9uLg0KPj4+Pg0KPj4+PiBBZmZlY3RlZCB2ZXJzaW9ucyBhcmU6DQo+Pj4+ICAgIC0gdGhl
IHdob2xlIDE4LjIueCBzZXJpZXMsIHdoaWNoIGlzIEVPTA0KPj4+PiAgICAtIHRoZSB3aG9sZSAx
OC4zLnggc2VyaWVzLCB3aGljaCBpcyBFT0wNCj4+Pj4gICAgLSB0aGUgMTkuMC54IHNlcmllcywg
cHJpb3IgdG8gMTkuMC40DQo+Pj4gV2VsbCB5b3UgY291bGQgaGF2ZSBzYXZlZCB5b3VyIHRpbWUs
IGNhdXNlIHRoaXMgaXMgc3RpbGwgYSBOQUsuDQo+Pj4NCj4+PiBGb3IgdGhlIHJlY29yZDogSSBz
dHJvbmdseSB0aGluayB0aGF0IHdlIGRvbid0IHdhbnQgdG8gZXhwb3NlIGFueSByZW5kZXINCj4+
PiBmdW5jdGlvbmFsaXR5IG9uIHRoZSBwcmltYXJ5IG5vZGUuDQo+Pj4NCj4+PiBUbyBldmVuIGdv
IGEgc3RlcCBmdXJ0aGVyIEkgd291bGQgc2F5IHRoYXQgYXQgbGVhc3Qgb24gQU1EIGhhcmR3YXJl
IHdlDQo+Pj4gc2hvdWxkIGNvbXBsZXRlbHkgZGlzYWJsZSBEUkkyIGZvciBvbmUgb2YgdGhlIG5l
eHQgZ2VuZXJhdGlvbnMuDQo+Pj4NCj4+PiBBcyBhIGZvbGxvdyB1cCBJIHdvdWxkIHRoZW4gY29t
cGxldGVseSBkaXNhbGxvdyB0aGUgRFJNIGF1dGhlbnRpY2F0aW9uDQo+Pj4gZm9yIGFtZGdwdSwg
c28gdGhhdCB0aGUgY29tbWFuZCBzdWJtaXNzaW9uIGludGVyZmFjZSBvbiB0aGUgcHJpbWFyeSBu
b2RlDQo+Pj4gY2FuIG9ubHkgYmUgdXNlZCBieSB0aGUgZGlzcGxheSBzZXJ2ZXIuDQo+PiBTbyBh
bWRncHUgaXMgcnVubmluZyBpbiBvbmUgZGlyZWN0aW9uLCB3aGlsZSBldmVyeW9uZSBlbHNlIGlz
IHJ1bm5pbmcgaW4NCj4+IHRoZSBvdGhlciBkaXJlY3Rpb24/IFBsZWFzZSBub3RlIHRoYXQgeW91
ciBwYXRjaCB0byBjaGFuZ2UgaTkxNSBsYW5kZWQNCj4+IGFscmVhZHksIHNvIHRoYXQgc2hpcCBp
cyBzYWlsaW5nIChidXQgd2UgY291bGQgb2ZjIHJldmVydCB0aGF0IGJhY2sNCj4+IGFnYWluKS4N
Cj4+DQo+PiBJbW8gcmVhbGx5IG5vdCBhIGdyZWF0IGlkZWEgaWYgd2UgZG8gYSBhbWRncHUgdnMu
IGV2ZXJ5b25lIGVsc2Ugc3BsaXQNCj4+IGhlcmUuIElmIHdlIHdhbnQgdG8gZGVwcmVjYXRlIGRy
aTIvZmxpbmsvcmVuZGVyaW5nIG9uIHByaW1hcnkgbm9kZXMgYWNyb3NzDQo+PiB0aGUgc3RhY2ss
IHRoZW4gdGhhdCBzaG91bGQgYmUgYSBzdGFjayB3aWRlIGRlY2lzaW9uLCBub3QgYW4gYW1kZ3B1
IG9uZS4NCj4+DQo+IENhbm5vdCBhZ3JlZSBtb3JlIC0gSSB3b3VsZCBsb3ZlIHRvIHNlZSBkcml2
ZXJzIHN0YXkgY29uc2lzdGVudC4NCg0KWWVhaCwgY29tcGxldGVseSBhZ3JlZSB0byB0aGF0LiBU
aGF0J3Mgd2h5IEkgdGhpbmsgd2Ugc2hvdWxkIG5vdCBkbyB0aGlzIA0KYXQgYWxsIGFuZCBqdXN0
IGxldCBJbnRlbCBmaXggaXQncyB1c2Vyc3BhY2UgYnVncyA6UA0KDQpBbnl3YXkgbXkgY29uY2Vy
biBpcyByZWFsbHkgdGhhdCB3ZSBzaG91bGQgc3RvcCBleHRlbmRpbmcgZnVuY3Rpb25hbGl0eSAN
Cm9uIHRoZSBwcmltYXJ5IG5vZGUuDQoNCkUuZy4gdGhlIHJlbmRlciBub2RlIGlzIGZvciB1c2Ug
YnkgdGhlIGNsaWVudHMgYW5kIHRoZSBwcmltYXJ5IG5vZGUgZm9yIA0KbW9kZSBzZXR0aW5nIGFu
ZCB1c2UgYnkgdGhlIGRpc3BsYXkgc2VydmVyIG9ubHkuDQoNClJlZ2FyZHMsDQpDaHJpc3RpYW4u
DQoNCj4gRndpdywgdGhpcyBzZXJpZXMgY29uc2lzdGVudGx5IHBhdmVzIHRoZSB3YXkgdG93YXJk
IG51a2luZyBEUk1fQVVUSCA7LSkNCj4NCj4gVGhhbmtzDQo+IEVtaWwNCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
