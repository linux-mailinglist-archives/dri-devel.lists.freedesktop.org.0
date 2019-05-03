Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 655EC12D4E
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 14:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3226C89E19;
	Fri,  3 May 2019 12:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750082.outbound.protection.outlook.com [40.107.75.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E4789DC1;
 Fri,  3 May 2019 12:15:57 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2501.namprd12.prod.outlook.com (52.132.141.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Fri, 3 May 2019 12:15:53 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba%10]) with mapi id 15.20.1856.008; Fri, 3 May 2019
 12:15:53 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "digetx@gmail.com" <digetx@gmail.com>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "m.szyprowski@samsung.com"
 <m.szyprowski@samsung.com>, "devel@driverdev.osuosl.org"
 <devel@driverdev.osuosl.org>, "sstabellini@kernel.org"
 <sstabellini@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "tomi.valkeinen@ti.com"
 <tomi.valkeinen@ti.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "pawel@osciak.com" <pawel@osciak.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "jgross@suse.com"
 <jgross@suse.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>
Subject: Re: [Intel-gfx] [PATCH] dma-buf: add struct dma_buf_attach_info v2
Thread-Topic: [Intel-gfx] [PATCH] dma-buf: add struct dma_buf_attach_info v2
Thread-Index: AQHVAakX08N5MfJN2UuxGmp0NXoZTaZZUImA
Date: Fri, 3 May 2019 12:15:53 +0000
Message-ID: <64f9e5ed-eb7d-d0f9-5041-05ac711b213e@amd.com>
References: <20190430111002.106168-1-christian.koenig@amd.com>
 <20190430173127.k5ivpaz6ktbfecgo@shell.armlinux.org.uk>
 <cbcbb076-a8b0-67b0-8c16-daf1d060fc1d@gmail.com>
 <20190503120933.GL3271@phenom.ffwll.local>
In-Reply-To: <20190503120933.GL3271@phenom.ffwll.local>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM5P190CA0010.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:206:14::23) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4d5c0af-3970-4b56-ca92-08d6cfc1168d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2501; 
x-ms-traffictypediagnostic: DM5PR12MB2501:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB25017250302F2F14486BA1B783350@DM5PR12MB2501.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0026334A56
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(136003)(366004)(39860400002)(396003)(189003)(199004)(6246003)(6436002)(64126003)(6512007)(71200400001)(2501003)(6486002)(11346002)(229853002)(14444005)(5024004)(53936002)(65806001)(65956001)(5660300002)(446003)(36756003)(110136005)(71190400001)(102836004)(6306002)(6116002)(31686004)(2616005)(186003)(2906002)(72206003)(486006)(478600001)(73956011)(966005)(66946007)(2201001)(305945005)(7736002)(65826007)(86362001)(64756008)(52116002)(46003)(476003)(58126008)(6506007)(68736007)(66574012)(14454004)(8936002)(66556008)(25786009)(99286004)(7416002)(81166006)(31696002)(386003)(316002)(256004)(66446008)(81156014)(8676002)(76176011)(66476007)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2501;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ty1jb6YkPLPnqBYPNAIiOPPKrVsARsWqj0hr7ftIxwJA5xmqt///Cg+I2s9L3Fh7fLZRv5suyUirvyDk0D9HgzhT47aDN6nPxWKKKi357szXAsLW0AH23EPtnUumzLD6HcI0xPSqtzsZzxlSYAROMF7GQC7AR/T0MNMe0T7pmXO2/ZkOXehzKJ29gCpauWsS39t78/To3fOqGhpRTb+sZoYCWV1iy2+OXpuH0f97ptPxmo8xfJm++UhyiDUCKxobfo8SI5Oh/oJob68N4kbKM7zOWE5AEG5JY+8QyGnNWpcAHEX65NBDWbJq+NLc94KKWkDxqQZaG4vKDQJt/8Jo2b2Y/jjyKbY753kiSeQ4Itg5n0buYAimIFhsCSsHQIvPegER3uXbY6nFAK/2nb8tXStbkxzVIl6kzEHQ5H1GhnY=
Content-ID: <8E3BFC8FCF8F65429E5AD60DC34769C0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d5c0af-3970-4b56-ca92-08d6cfc1168d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2019 12:15:53.6345 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2501
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vP8KghCwLC9SX9KlcJ0beUsqEQtZycE9YDWd3iaRohI=;
 b=3AmAgBWCUbkJjrOC+ORsnq534oquZdTu4nMvGQukuvCyKc35miu4kkzSmIVTrV6GRkrDSbWdOzcx5QZVh2Rkb4sW/y/pZaXGmktQZSh3IDsdYvkBg26xIvl2+yvFt7+ahXIyP3Tj2NkdpFduWse6Yt2swbn6APN+Ff9rY3SRKpA=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDMuMDUuMTkgdW0gMTQ6MDkgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBbQ0FVVElPTjog
RXh0ZXJuYWwgRW1haWxdDQo+DQo+IE9uIEZyaSwgTWF5IDAzLCAyMDE5IGF0IDAyOjA1OjQ3UE0g
KzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+PiBBbSAzMC4wNC4xOSB1bSAxOTozMSBz
Y2hyaWViIFJ1c3NlbGwgS2luZyAtIEFSTSBMaW51eCBhZG1pbjoNCj4+PiBPbiBUdWUsIEFwciAz
MCwgMjAxOSBhdCAwMToxMDowMlBNICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KPj4+
PiBBZGQgYSBzdHJ1Y3R1cmUgZm9yIHRoZSBwYXJhbWV0ZXJzIG9mIGRtYV9idWZfYXR0YWNoLCB0
aGlzIG1ha2VzIGl0IG11Y2ggZWFzaWVyDQo+Pj4+IHRvIGFkZCBuZXcgcGFyYW1ldGVycyBsYXRl
ciBvbi4NCj4+PiBJIGRvbid0IHVuZGVyc3RhbmQgdGhpcyByZWFzb25pbmcuICBXaGF0IGFyZSB0
aGUgIm5ldyBwYXJhbWV0ZXJzIiB0aGF0DQo+Pj4gYXJlIGJlaW5nIHByb3Bvc2VkLCBhbmQgd2h5
IGRvIHdlIG5lZWQgdG8gcHV0IHRoZW0gaW50byBtZW1vcnkgdG8gcGFzcw0KPj4+IHRoZW0gYWNy
b3NzIHRoaXMgaW50ZXJmYWNlPw0KPj4+DQo+Pj4gSWYgdGhlIGludGVudGlvbiBpcyB0byBtYWtl
IGl0IGVhc2llciB0byBjaGFuZ2UgdGhlIGludGVyZmFjZSwgcGFzc2luZw0KPj4+IHBhcmFtZXRl
cnMgaW4gdGhpcyBtYW5uZXIgbWVhbiB0aGF0IGl0J3MgZWFzeSBmb3IgdGhlIGludGVyZmFjZSB0
bw0KPj4+IGNoYW5nZSBhbmQgZHJpdmVycyBub3QgdG8gbm90aWNlIHRoZSBjaGFuZ2VzLCBzaW5j
ZSB0aGUgY29tcGlsZXIgd2lsbA0KPj4+IG5vdCB3YXJuICh1bmxlc3Mgc29tZSBtZW1iZXIgb2Yg
dGhlIHN0cnVjdHVyZSB0aGF0IHRoZSBkcml2ZXIgaXMgdXNpbmcNCj4+PiBnZXRzIHJlbW92ZWQs
IGluIHdoaWNoIGNhc2UgaXQgd2lsbCBlcnJvci4pDQo+Pj4NCj4+PiBBZGRpdGlvbnMgdG8gdGhl
IHN0cnVjdHVyZSB3aWxsIGdvIHVubm90aWNlZCBieSBkcml2ZXJzIC0gd2hhdCBpZiB0aGUNCj4+
PiBjYWxsZXIgaXMgZXhwZWN0aW5nIHNvbWUgZGlmZmVyZW50IGtpbmQgb2YgYmVoYXZpb3VyLCBh
bmQgdGhlIGRyaXZlcg0KPj4+IGlnbm9yZXMgdGhhdCBuZXcgYWRkaXRpb24/DQo+PiBXZWxsLCBl
eGFjdGx5IHRoYXQncyB0aGUgaW50ZW50aW9uIGhlcmU6IFRoYXQgdGhlIGRyaXZlcnMgdXNpbmcg
dGhpcw0KPj4gaW50ZXJmYWNlIHNob3VsZCBiZSBhYmxlIHRvIGlnbm9yZSB0aGUgbmV3IGFkZGl0
aW9ucyBmb3Igbm93IGFzIGxvbmcgYXMgdGhleQ0KPj4gYXJlIG5vdCBnb2luZyB0byB1c2UgdGhl
bS4NCj4+DQo+PiBUaGUgYmFja2dyb3VuZCBpcyB0aGF0IHdlIGhhdmUgbXVsdGlwbGUgaW50ZXJm
YWNlIGNoYW5nZXMgaW4gdGhlIHBpcGVsaW5lLA0KPj4gYW5kIGVhY2ggc3RlcCByZXF1aXJlcyBu
ZXcgb3B0aW9uYWwgcGFyYW1ldGVycy4NCj4+DQo+Pj4gVGhpcyBkb2Vzbid0IHNlZW0gdG8gbWUg
bGlrZSBhIGdvb2QgaWRlYS4NCj4+IFdlbGwsIHRoZSBvYnZpb3VzIGFsdGVybmF0aXZlcyBhcmU6
DQo+Pg0KPj4gYSkgQ2hhbmdlIGFsbCBkcml2ZXJzIHRvIGV4cGxpY2l0bHkgcHJvdmlkZSBOVUxM
LzAgZm9yIHRoZSBuZXcgcGFyYW1ldGVycy4NCj4+DQo+PiBiKSBVc2UgYSB3cmFwcGVyLCBzbyB0
aGF0IHRoZSBmdW5jdGlvbiBzaWduYXR1cmUgb2YgZG1hX2J1Zl9hdHRhY2ggc3RheXMgdGhlDQo+
PiBzYW1lLg0KPj4NCj4+IEtleSBwb2ludCBoZXJlIGlzIHRoYXQgSSBoYXZlIGFuIGludmFsaWRh
dGlvbiBjYWxsYmFjayBjaGFuZ2UsIGEgUDJQIHBhdGNoDQo+PiBzZXQgYW5kIHNvbWUgbG9ja2lu
ZyBjaGFuZ2VzIHdoaWNoIGFsbCByZXF1aXJlIGFkZGluZyBuZXcgcGFyYW1ldGVycyBvcg0KPj4g
ZmxhZ3MuIEFuZCBhdCBlYWNoIHN0ZXAgSSB3b3VsZCB0aGVuIHN0YXJ0IHRvIGNoYW5nZSBhbGwg
ZHJpdmVycywgYWRkaW5nDQo+PiBzb21lIG1vcmUgTlVMTCBwb2ludGVycyBvciBmbGFncyB3aXRo
IDAgZGVmYXVsdCB2YWx1ZS4NCj4+DQo+PiBJJ20gYWN0dWFsbHkgcGVyZmVjdGx5IGZpbmUgZ29p
bmcgZG93biBhbnkgcm91dGUsIGJ1dCB0aGlzIGp1c3Qgc2VlbWVkIHRvIG1lDQo+PiBzaW1wbGVz
dCBhbmQgd2l0aCB0aGUgbGVhc3QgcmlzayBvZiBicmVha2luZyBhbnl0aGluZy4gT3BpbmlvbnM/
DQo+IEkgdGhpbmsgZ2l2ZW4gYWxsIG91ciBkaXNjdXNzaW9ucyBhbmQgcGxhbnMgdGhlIGFyZ3Vt
ZW50IG9iamVjdCBtYWtlcyB0b25zDQo+IG9mIHNlbnNlLiBNdWNoIGVhc2llciB0byBkb2N1bWVu
dCB3ZWxsIHRoYW4gYSBsb25nIGxpc3Qgb2YgcGFyYW1ldGVycy4NCj4gTWF5YmUgd2Ugc2hvdWxk
IG1ha2UgaXQgY29uc3QsIHNvIGl0IGNvdWxkIHdvcmsgbGlrZSBhbiBvcHMvZnVuYyB0YWJsZSBh
bmQNCj4gd2UgY291bGQgc3RvcmUgaXQgYXMgYSBwb2ludGVyIGluIHRoZSBkbWFfYnVmX2F0dGFj
aG1lbnQ/DQoNClllYWgsIHRoZSBpbnZhbGlkYXRpb24gY2FsbGJhY2sgYW5kIFAyUCBmbGFncyBh
cmUgY29uc3RhbnQuIEJ1dCB0aGUgDQppbXBvcnRlcl9wcml2IGZpZWxkIGlzbid0Lg0KDQpXZSBj
b3VsZCBkbyBzb21ldGhpbmcgbGlrZSBhZGRpbmcgdGhlIGltcG9ydGVyX3ByaXYgZmllbGQgYXMg
cGFyYW1ldGVyIA0KYW5kIHRoZSBvdGhlciB0d28gYXMgY29uc3Qgc3RydWN0dXJlLg0KDQpUaGly
ZCBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byB0aHJvdyBvdXQgYWxsIHRoZSBEUk0gYWJzdHJhY3Rp
b24gYW5kIGp1c3QgDQplbWJlZCB0aGUgYXR0YWNobWVudCBzdHJ1Y3R1cmUgaW4gdGhlIGJ1ZmZl
ciBvYmplY3QgYW5kIGdldCBjb21wbGV0ZWx5IA0KcmlkIG9mIHRoZSBpbXBvcnRlcl9wcml2IGZp
ZWxkIChwcm9iYWJseSB0aGUgY2xlYW5lc3QgYWx0ZXJuYXRpdmUsIGJ1dCANCmFsc28gdGhlIG1v
c3Qgd29yayB0b2RvKS4NCg0KQ2hyaXN0aWFuLg0KDQo+IC1EYW5pZWwNCj4gLS0NCj4gRGFuaWVs
IFZldHRlcg0KPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24NCj4gaHR0cDov
L2Jsb2cuZmZ3bGwuY2gNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
