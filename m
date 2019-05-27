Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2EE2B4DF
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197D889DA9;
	Mon, 27 May 2019 12:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800057.outbound.protection.outlook.com [40.107.80.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C67689BF0;
 Mon, 27 May 2019 12:20:51 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1194.namprd12.prod.outlook.com (10.168.234.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.23; Mon, 27 May 2019 12:20:49 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1922.021; Mon, 27 May 2019
 12:20:49 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Topic: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Index: AQHVFGTgR+jNVTHnhkq6fR69g1cCsaZ+ymGAgAAV5gCAAAQjAA==
Date: Mon, 27 May 2019 12:20:49 +0000
Message-ID: <6e8cd288-b53f-fa75-f12b-db939eebb23e@amd.com>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <3c9b5688-5e83-f173-00e3-6e139e05d466@amd.com>
 <20190527120554.GB15067@arch-x1c3>
In-Reply-To: <20190527120554.GB15067@arch-x1c3>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6P195CA0012.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::25) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e397bc2-59e1-4fa9-4631-08d6e29dc0d2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1194; 
x-ms-traffictypediagnostic: DM5PR12MB1194:
x-microsoft-antispam-prvs: <DM5PR12MB11946F818A8908995AC32AF1831D0@DM5PR12MB1194.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0050CEFE70
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(39860400002)(346002)(136003)(366004)(189003)(199004)(53234004)(52116002)(6486002)(6246003)(8936002)(6436002)(4326008)(71190400001)(71200400001)(6916009)(99286004)(65806001)(65956001)(7736002)(66476007)(14444005)(73956011)(66446008)(64756008)(66556008)(256004)(64126003)(229853002)(65826007)(305945005)(25786009)(36756003)(66946007)(6512007)(86362001)(31696002)(54906003)(14454004)(6116002)(186003)(476003)(2616005)(46003)(446003)(11346002)(68736007)(486006)(53936002)(5660300002)(2906002)(31686004)(8676002)(316002)(81156014)(81166006)(76176011)(6506007)(386003)(102836004)(58126008)(478600001)(72206003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1194;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UebMIfDTYvK0yE/ZnFglaZtkZR9+4sP0PSsJ7lnPZeT8Y7gpEyMhwVBSU2n5s3hQbT6q2c7+fUTpimYPagxgZ3NgDDJild6E8u6mmBLCI0xFwsuNxMWvv/qzU32xRDtcuiG3BKOZRAKQS7veWkYBGjcBBGMvHinQeBskXuEBKKrRd71B0y1mkRIuX/7+rxwIJxHd8lc2EjS2C7Aam6Usnh5VtkqkpvhGFYjgvdIfAke8JpUys2V6NTzmBKe7CewlYwq8MgVATjHACKcbvX5oWaUJGYV7L64i2zI/A8eXPXJYiMA5bwIR5kzD8fc4kblbpXjSxm+QcPnSxFuKSEtBUdtkPfP4FRflxkDas2gg/ZDpSwJXDFborgw7BDEqUn+boRpwzN0MZ06FUOL3pLNn26vqIwDWLi6nkbq5Dr+lQ78=
Content-ID: <5BE724301091374EBF1E5D66E3712BF7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e397bc2-59e1-4fa9-4631-08d6e29dc0d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2019 12:20:49.5635 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1194
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2i61tDBnMLuGgQXerIa+6xq3OGWpmqQWGCSuowD+00=;
 b=xLzwasv551xT04ZRNyRhqvqT7tE7l8UQO1/oo3veRuceJC7LZSkwIal63aagjdgWnnqJexENolNSHbaiX42iwDZKhueS0T/HhFJl+HOMCQLdyOPp0cka56hTKj6k3mAtmARvWQuIQLTZ/uOUabxBzd78qUsZJ65HdSzH4knXo7Q=
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

QW0gMjcuMDUuMTkgdW0gMTQ6MDUgc2NocmllYiBFbWlsIFZlbGlrb3Y6DQo+IE9uIDIwMTkvMDUv
MjcsIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPj4gQW0gMjcuMDUuMTkgdW0gMTA6MTcgc2No
cmllYiBFbWlsIFZlbGlrb3Y6DQo+Pj4gRnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZA
Y29sbGFib3JhLmNvbT4NCj4+Pg0KPj4+IEN1cnJlbnRseSBvbmUgY2FuIGNpcmN1bXZlbnQgRFJN
X0FVVEgsIHdoZW4gdGhlIGlvY3RsIGlzIGV4cG9zZWQgdmlhIHRoZQ0KPj4+IHJlbmRlciBub2Rl
LiBBIHNlZW1pbmdseSBkZWxpYmVyYXRlIGRlc2lnbiBkZWNpc2lvbi4NCj4+Pg0KPj4+IEhlbmNl
IHdlIGNhbiBkcm9wIHRoZSBEUk1fQVVUSCBhbGwgdG9nZXRoZXIgKGRldGFpbHMgaW4gZm9sbG93
LXVwIHBhdGNoKQ0KPj4+IHlldCBub3QgYWxsIHVzZXJzcGFjZSBjaGVja3MgaWYgaXQncyBhdXRo
ZW50aWNhdGVkLCBidXQgaW5zdGVhZCB1c2VzDQo+Pj4gdW5jb21tb24gYXNzdW1wdGlvbnMuDQo+
Pj4NCj4+PiBBZnRlciBkYXlzIG9mIGRpZ2dpbmcgdGhyb3VnaCBnaXQgbG9nIGFuZCB0ZXN0aW5n
LCBvbmx5IGEgc2luZ2xlIChhYil1c2UNCj4+PiB3YXMgc3BvdHRlZCAtIHRoZSBNZXNhIFJBRFYg
ZHJpdmVyLCB1c2luZyB0aGUgQU1ER1BVX0lORk8gaW9jdGwgYW5kDQo+Pj4gYXNzdW1pbmcgdGhh
dCBmYWlsdXJlIGltcGxpZXMgbGFjayBvZiBhdXRoZW50aWNhdGlvbi4NCj4+Pg0KPj4+IEFmZmVj
dGVkIHZlcnNpb25zIGFyZToNCj4+PiAgICAtIHRoZSB3aG9sZSAxOC4yLnggc2VyaWVzLCB3aGlj
aCBpcyBFT0wNCj4+PiAgICAtIHRoZSB3aG9sZSAxOC4zLnggc2VyaWVzLCB3aGljaCBpcyBFT0wN
Cj4+PiAgICAtIHRoZSAxOS4wLnggc2VyaWVzLCBwcmlvciB0byAxOS4wLjQNCj4+IFdlbGwgeW91
IGNvdWxkIGhhdmUgc2F2ZWQgeW91ciB0aW1lLCBjYXVzZSB0aGlzIGlzIHN0aWxsIGEgTkFLLg0K
Pj4NCj4gRGlkIEkgbWVudGlvbiB0aGF0IEkndmUgc3BlbnQgcXVpdGUgYSBiaXQgb2YgdGltZSBp
biBBTURWTEs/IEV2ZW4gZml4ZWQNCj4gYSBidWcgd2hpbGUgSSB3YXMgdGhlcmUgOi0pDQoNClll
YWgsIHRoYW5rcyBmb3IgZG9pbmcgdGhpcy4NCg0KQnV0IHdlIGhhdmUgZG9uZSBzbyBtdWNoIHN0
dWZmIHdpdGggY3VzdG9tZXJzIHdoaWNoIGNhbid0IGJlIGF1ZGl0ZWQgDQp0aGlzIHdheSwgdGhh
dCBJIHN0aWxsIGhhdmUgYSByZWFsbHkgYmFkIGZlZWxpbmcgYWJvdXQgdGhpcyA6Lw0KDQo+PiBG
b3IgdGhlIHJlY29yZDogSSBzdHJvbmdseSB0aGluayB0aGF0IHdlIGRvbid0IHdhbnQgdG8gZXhw
b3NlIGFueSByZW5kZXINCj4+IGZ1bmN0aW9uYWxpdHkgb24gdGhlIHByaW1hcnkgbm9kZS4NCj4+
DQo+PiBUbyBldmVuIGdvIGEgc3RlcCBmdXJ0aGVyIEkgd291bGQgc2F5IHRoYXQgYXQgbGVhc3Qg
b24gQU1EIGhhcmR3YXJlIHdlDQo+PiBzaG91bGQgY29tcGxldGVseSBkaXNhYmxlIERSSTIgZm9y
IG9uZSBvZiB0aGUgbmV4dCBnZW5lcmF0aW9ucy4NCj4+DQo+IEl0J3MgZG9hYmxlIGFuZCBvdmVy
YWxsIHByZXR0eSBuZWF0IGlkZWEuDQo+DQo+IFRoZXJlIGlzIGEgY29uc2VybiB0aGF0IHRoaXMg
YXBwcm9hY2ggbWF5IGNhdXNlIGZhciBtb3JlIHJlZ3Jlc3Npb25zDQo+IHRoYXQgdGhpcyBzZXJp
ZXMuIFdlIGFyZSB0YWxraW5nIGFib3V0IHllYXJzIHdvcnRoIG9mIE1lc2EgZHJpdmVycyAoZXQN
Cj4gYWwpIHRoYXQgZGVwZW5kIG9uIHJlbmRlciBmdW5jdGlvbmFsaXR5IGV4cG9zZWQgdmlhIHRo
ZSBwcmltYXJ5IG5vZGUuDQoNClllYWgsIHRoYXQncyBJJ20gcGVyZmVjdGx5IGF3YXJlIG9mLiBJ
dCdzIHRoZSByZWFzb24gd2h5IEkgc2FpZCB3ZSANCnNob3VsZCBvbmx5IGRvIGl0IGZvciBuZXcg
aGFyZHdhcmUgZ2VuZXJhdGlvbnMuDQoNCkJ1dCBhdCBzb21lIHBvaW50IEkgdGhpbmsgd2Ugc2hv
dWxkIGRvIHRoaXMgYW5kIGdldCByaWQgb2YgDQphdXRoZW50aWNhdGlvbi9mbGluay9EUkkyLy4u
Li4NCg0KPiBJJ20gT0sgd2l0aCB3cml0aW5nIHRoZSBwYXRjaGVzLCBidXQgaXQnbGwgYmUgdXAt
dG8gdGhlIEFNREdQVSB0ZWFtIHRvDQo+IGZvbGxvdy11cCB3aXRoIGFueSByZWdyZXNzaW9ucy4g
QXJlIHlvdSBvayB3aXRoIHRoYXQ/DQoNCkFzIGxvbmcgYXMgd2UgaGF2ZSBhIGNoZWNrIGxpa2Ug
YWRldi0+ZmFtaWx5X2lkID4gDQpXSEFURVZFUl9JU19USEVfQ1VSUkVOVF9MQVRFU1RfVVBTVFJF
QU1fSFcsIEkgdGhpbmsgd2UgYXJlIGZpbmUgd2l0aCB0aGF0Lg0KDQpJZiBJIHVuZGVyc3Rvb2Qg
TWljaGVsIGNvcnJlY3RseSB4Zjg2LXZpZGVvLWFtZGdwdSBzaG91bGQgd29yaywgYnV0IA0KbW9k
ZXNldCBtaWdodCBicmVhayBhbmQgbmVlZHMgYSBwYXRjaC4NCg0KPiBGd2l3IEkgY291bGQgYWxz
byBtb3ZlIHRoZSBGT1JDRV9BVVRIIGhhY2sgdG8gY29yZSBkcm0sIGlmIHlvdSBwcmVmZXIuDQoN
CldlbGwsIHRoZSBoYWNrIGlzIHRoZSBsZWFzdCBvZiBteSBjb25jZXJucy4NCg0KVGhhbmtzLA0K
Q2hyaXN0aWFuLg0KDQo+DQo+IFRoYW5rcw0KPiBFbWlsDQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
