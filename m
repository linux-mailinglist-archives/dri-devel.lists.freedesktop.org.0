Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F32502E273
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 18:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014006E11A;
	Wed, 29 May 2019 16:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810081.outbound.protection.outlook.com [40.107.81.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322D26E11A;
 Wed, 29 May 2019 16:43:48 +0000 (UTC)
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1805.namprd12.prod.outlook.com (10.175.55.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.17; Wed, 29 May 2019 16:43:45 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::202b:98f2:9925:5d47]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::202b:98f2:9925:5d47%2]) with mapi id 15.20.1922.021; Wed, 29 May 2019
 16:43:45 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/sched: Fix make htmldocs warnings.
Thread-Topic: [PATCH] drm/sched: Fix make htmldocs warnings.
Thread-Index: AQHVFir7y5SoYvg/OUWWdh7nzY4lZ6aCTrkAgAAASgA=
Date: Wed, 29 May 2019 16:43:45 +0000
Message-ID: <aafdf860-4f83-1830-cbf4-855f97a56fb0@amd.com>
References: <1559140180-6762-1-git-send-email-andrey.grodzovsky@amd.com>
 <CADnq5_PoQ-+rmbr4Rq_DefyPcw+gUz8a5nL_YUEbHhXmzGQc=g@mail.gmail.com>
In-Reply-To: <CADnq5_PoQ-+rmbr4Rq_DefyPcw+gUz8a5nL_YUEbHhXmzGQc=g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::39) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7f25898-64d1-4787-a731-08d6e454d09a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR12MB1805; 
x-ms-traffictypediagnostic: MWHPR12MB1805:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR12MB1805C701F73E926BDD3D6F74EA1F0@MWHPR12MB1805.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:202;
x-forefront-prvs: 0052308DC6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(39860400002)(366004)(376002)(136003)(189003)(199004)(4326008)(6486002)(73956011)(99286004)(26005)(3846002)(86362001)(6116002)(6246003)(66476007)(64756008)(6436002)(53936002)(186003)(76176011)(7736002)(53546011)(6306002)(6506007)(6512007)(52116002)(66946007)(66556008)(2906002)(66446008)(386003)(25786009)(6916009)(102836004)(31696002)(305945005)(71200400001)(229853002)(316002)(5660300002)(66066001)(68736007)(256004)(2616005)(446003)(71190400001)(72206003)(966005)(81156014)(14454004)(8676002)(81166006)(486006)(11346002)(8936002)(54906003)(36756003)(476003)(1411001)(478600001)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1805;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZRbJhti8tTIxh+WeD3gFeiWYDaGIKgLL034xFTrdqXObvyFUgLKZAcsl42gkfIXY52fA5v86U4kV52lQ0EAYovdRcsWDEfsPQMwlVJVi1fmCtiGfCNAASmfD3zkE84P27gbhHgvJzftcDrjOIgmU7M1fFX28EMzJsWD3G0mRwFuq220+MQi/6221iwF7IaYdQaYrePrF+hMa3vZ0omXdNTCzEt+ZGBkXDLlQJk7HC3hou6YKEako+9haHX2XBs1FXwc0KteS/OMzIzaTcUc9D0DNuxu8BeSIHdkSp2O/TPq1lU+fkQyVh4KEOM5MN+KS/DOapMXjF+Q0rchO//t2Hjli8nB4kbx2z4F2fZBOhM4dGixLZw+LOnvBk8jZRopUZqu8VIdiY0uXS5pBrneQdRQAiEGBkD+XDQAwopdbRII=
Content-ID: <6EEE60ACB732C14EB2AA7734BE951CCE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f25898-64d1-4787-a731-08d6e454d09a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 16:43:45.0668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agrodzov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1805
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phkgzmBK9aWYtZeHIcFDDs+Exzii2E6Wr9qnGCLjuQs=;
 b=pgBvkBPf+GV6T0KdVjbVkcTO70lhuhyEdN6Qo9K2Rj32bAKMciqnEk8CjYzI5JQuRWrfZZC+SFRk3RHYPUqjIiptMugXCEfF4f1v42EdiUIOM4PsXvaTCqdp2RTYV8QeAjnvGJKDfLiUHFXAeY+nBzaAFeYZnI/4YCOBa/rhpI8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSBkb24ndCwgc29ycnkuDQoNCkFuZHJleQ0KDQpPbiA1LzI5LzE5IDEyOjQyIFBNLCBBbGV4IERl
dWNoZXIgd3JvdGU6DQo+IE9uIFdlZCwgTWF5IDI5LCAyMDE5IGF0IDEwOjI5IEFNIEFuZHJleSBH
cm9kem92c2t5DQo+IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPiB3cm90ZToNCj4+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPg0K
PiBSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0K
Pg0KPiBJJ2xsIHB1c2ggaXQgdG8gZHJtLW1pc2MgaW4gYSBtaW51dGUgdW5sZXNzIHlvdSBoYXZl
IGNvbW1pdCByaWdodHMuDQo+DQo+IEFsZXgNCj4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2dwdS9k
cm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyB8IDIgKysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1
bGVyL3NjaGVkX21haW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5j
DQo+PiBpbmRleCA0OWU3ZDA3Li5jMTA1OGVlIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hl
ZHVsZXIvc2NoZWRfbWFpbi5jDQo+PiBAQCAtMzUzLDYgKzM1Myw3IEBAIEVYUE9SVF9TWU1CT0wo
ZHJtX3NjaGVkX2luY3JlYXNlX2thcm1hKTsNCj4+ICAgICogZHJtX3NjaGVkX3N0b3AgLSBzdG9w
IHRoZSBzY2hlZHVsZXINCj4+ICAgICoNCj4+ICAgICogQHNjaGVkOiBzY2hlZHVsZXIgaW5zdGFu
Y2UNCj4+ICsgKiBAYmFkOiBqb2Igd2hpY2ggY2F1c2VkIHRoZSB0aW1lIG91dA0KPj4gICAgKg0K
Pj4gICAgKiBTdG9wIHRoZSBzY2hlZHVsZXIgYW5kIGFsc28gcmVtb3ZlcyBhbmQgZnJlZXMgYWxs
IGNvbXBsZXRlZCBqb2JzLg0KPj4gICAgKiBOb3RlOiBiYWQgam9iIHdpbGwgbm90IGJlIGZyZWVk
IGFzIGl0IG1pZ2h0IGJlIHVzZWQgbGF0ZXIgYW5kIHNvIGl0J3MNCj4+IEBAIC00MjIsNiArNDIz
LDcgQEAgRVhQT1JUX1NZTUJPTChkcm1fc2NoZWRfc3RvcCk7DQo+PiAgICAqIGRybV9zY2hlZF9q
b2JfcmVjb3ZlcnkgLSByZWNvdmVyIGpvYnMgYWZ0ZXIgYSByZXNldA0KPj4gICAgKg0KPj4gICAg
KiBAc2NoZWQ6IHNjaGVkdWxlciBpbnN0YW5jZQ0KPj4gKyAqIEBmdWxsX3JlY292ZXJ5OiBwcm9j
ZWVkIHdpdGggY29tcGxldGUgc2NoZWQgcmVzdGFydA0KPj4gICAgKg0KPj4gICAgKi8NCj4+ICAg
dm9pZCBkcm1fc2NoZWRfc3RhcnQoc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCwgYm9v
bCBmdWxsX3JlY292ZXJ5KQ0KPj4gLS0NCj4+IDIuNy40DQo+Pg0KPj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QNCj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
