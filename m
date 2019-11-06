Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7049F2841
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 08:43:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD00E6EEAA;
	Thu,  7 Nov 2019 07:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00071.outbound.protection.outlook.com [40.107.0.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00886E199;
 Wed,  6 Nov 2019 13:36:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNm0HTlMrga0aOIXKkjkw0sx1MzlAmzM6uHJgEKhlDzwUd8APsgixsH/el1nmqfR/or/RoKoALSDdxSLKsUlYUnvtXb2kGMGcqAzUiUj5RSbNqzUQKKs61TZVg0ASYIhlX4hv545UhTeBomoFWcy3fZ5lU2O8KVPvjg7G3n88R1XiktaaqDW/m2zy0CySQ7rzHPrWcVGKsbegAFy6W9QXohTCD3MrjoW1CuKOkbSsXwr6B5b9/3JxXt9msiZN7YmHvGZfVwGfSR3cT+pwUWfGXamSgX1d+Xn0bynrxc5MAvoLKM/W9c51XKvFTYAFrZS5U+YB/5gIT7YcpzVV5zXVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSYRMVOxQdiajVHDrB1ZWywWX0yisdKKCsAIbjlbH7M=;
 b=kcFOsXcTqEUYKGkn5z2orUFcoOPlMf3tqhWXQJttZF0j1hROKz4ltdlypZKDJ6qxqAkxXN9voEVyw7TCsEnINpgos9DM1UM/vgONDwud7QLqV9cIxRJCe8HhvTRy8gCV9mkPP2a4PqX9dRFehG7rrkLpcxt94/ToGQT5LRj2nelQxmHrg3RjVIvCAJb9FPBQ9Y8Q3JzRCDToTEID382YgS7M38tMY8NUJ7FWSPT9LvRRxBKmVc4PImFURPTC1S/nSK6+CxuQKk1siBFmpZOQE+/NFYbNuNzIXgLV9b8Xh6zNVQGWtzYQVRfAGFtnpDXySG40JhDM/RF2XCeREjmjNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4142.eurprd05.prod.outlook.com (52.133.12.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Wed, 6 Nov 2019 13:36:10 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2408.024; Wed, 6 Nov 2019
 13:36:10 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 01/15] mm/mmu_notifier: define the header pre-processor
 parts even if disabled
Thread-Topic: [PATCH v2 01/15] mm/mmu_notifier: define the header
 pre-processor parts even if disabled
Thread-Index: AQHVjcvKLi62CBGJ7kWsGjKWZ8qqVqd9IwUAgAEPqwA=
Date: Wed, 6 Nov 2019 13:36:10 +0000
Message-ID: <20191106133606.GC22766@mellanox.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-2-jgg@ziepe.ca>
 <770248ae-efa1-efae-a978-f52d8510f7b1@nvidia.com>
In-Reply-To: <770248ae-efa1-efae-a978-f52d8510f7b1@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR18CA0002.namprd18.prod.outlook.com
 (2603:10b6:404:121::12) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8f06dec5-2715-413b-9b5d-08d762be48c8
x-ms-traffictypediagnostic: VI1PR05MB4142:
x-microsoft-antispam-prvs: <VI1PR05MB4142E1A64CB606FD98EDECCDCF790@VI1PR05MB4142.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(189003)(199004)(86362001)(186003)(6916009)(102836004)(26005)(386003)(66066001)(6506007)(53546011)(99286004)(316002)(4326008)(229853002)(66574012)(2906002)(52116002)(76176011)(1076003)(256004)(11346002)(446003)(36756003)(81156014)(2616005)(476003)(8676002)(8936002)(81166006)(54906003)(14444005)(7416002)(66556008)(66476007)(66946007)(33656002)(478600001)(71200400001)(71190400001)(486006)(305945005)(6486002)(7736002)(6512007)(5660300002)(6436002)(25786009)(6116002)(6246003)(3846002)(14454004)(64756008)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4142;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JPvYlziAVByepieEeLxtpLGPljYV7kW7mQ4jvvUsSEA8JTJotYbtIM6wgq29ga5wlb7rbwkZgWsZLw/VMWQhwwot4M/HQoXUuXIwZzRkZR39cCEv8w3RzAKAdl7zM+Qz188vGp1fgyzBvZKYsUsY86EYcNPkf9GZJIe/V+sQj5v9S9oTpZ3VL2N3iE1zIthGEXZTzGeyy64f/tqF01COUsCGI0EULI74WbQBuHeRzyH2bn/SAiXJ3cxuM14/bE65wTuvVlUvPHicIH4BOFqzaD2lv4oRVGH3J/xbrFc099hUIAPitTYoOz/N86fc35MuOmUtNXsnvo5oyDRvB9wtKOqv2ejjY6dFc26uGh3xkH1pQbwi79UE9++1lMKgp25zKzLPM/cX337YvDhNzPh7z8LJv3wJ0uGngZL5Ofc/+wOjGDbLF5vxEjXvGODRU9Hz
x-ms-exchange-transport-forked: True
Content-ID: <79E66DC5C25B0D4EBC7ECCB2D81D0009@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f06dec5-2715-413b-9b5d-08d762be48c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 13:36:10.3537 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9N4VkzBzdqxM27Yj1ihfnzoZc7qLuE2NBf9sEDlemzMa3uI7R1Y5Iq8lTv1KSeoMlH0074TpypzVCgcgOal+2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4142
X-Mailman-Approved-At: Thu, 07 Nov 2019 07:43:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSYRMVOxQdiajVHDrB1ZWywWX0yisdKKCsAIbjlbH7M=;
 b=SmALHb2MWIdvKrq9nUe9UaYAgM8S5ZNBJaRZm5qNgLIQ5HSvFFoeMYdN0rZKzclNckGs00sfeIMa6yDyt7TJAN4XGyp3FUmTob5XFPuARoldvutK50uMJ9KqtycjTLGu5rHCkuxATf9y1Hu+2cPagn6qOyfvmiVJn20XId7ee2s=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
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
Cc: Juergen Gross <jgross@suse.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMDE6MjM6NDZQTSAtMDgwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOg0KPiBPbiAxMC8yOC8xOSAxOjEwIFBNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6DQo+ID4g
RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPg0KPiA+IA0KPiA+IE5vdyB0
aGF0IHdlIGhhdmUgS0VSTkVMX0hFQURFUl9URVNUIGFsbCBoZWFkZXJzIGFyZSBnZW5lcmFsbHkg
Y29tcGlsZQ0KPiA+IHRlc3RlZCwgc28gcmVseWluZyBvbiBtYWtlZmlsZSB0cmlja3MgdG8gYXZv
aWQgY29tcGlsaW5nIGNvZGUgdGhhdCBkZXBlbmRzDQo+ID4gb24gQ09ORklHX01NVV9OT1RJRklF
UiBpcyBtb3JlIGFubm95aW5nLg0KPiA+IA0KPiA+IEluc3RlYWQgZm9sbG93IHRoZSB1c3VhbCBw
YXR0ZXJuIGFuZCBwcm92aWRlIG1vc3Qgb2YgdGhlIGhlYWRlciB3aXRoIG9ubHkNCj4gPiB0aGUg
ZnVuY3Rpb25zIHN0dWJiZWQgb3V0IHdoZW4gQ09ORklHX01NVV9OT1RJRklFUiBpcyBkaXNhYmxl
ZC4gVGhpcw0KPiA+IGVuc3VyZXMgY29kZSBjb21waWxlcyBubyBtYXR0ZXIgd2hhdCB0aGUgY29u
ZmlnIHNldHRpbmcgaXMuDQo+ID4gDQo+ID4gV2hpbGUgaGVyZSwgc3RydWN0IG1tdV9ub3RpZmll
cl9tbSBpcyBwcml2YXRlIHRvIG1tdV9ub3RpZmllci5jLCBtb3ZlIGl0Lg0KPiANCj4gYW5kIGNv
cnJlY3QgYSBtaW5vciBzcGVsbGluZyBlcnJvciBpbiBhIGNvbW1lbnQuIEdvb2QuIDopDQo+IA0K
PiA+IA0KPiA+IFJldmlld2VkLWJ5OiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNv
bT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+
DQo+ID4gIGluY2x1ZGUvbGludXgvbW11X25vdGlmaWVyLmggfCA0NiArKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAgbW0vbW11X25vdGlmaWVyLmMgICAgICAgICAgICB8
IDEzICsrKysrKysrKysNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAy
OSBkZWxldGlvbnMoLSkNCj4gPiANCj4gDQo+IEJlY2F1c2UgdGhpcyBpcyBjb3JyZWN0IGFzLWlz
LCB5b3UgY2FuIGFkZDoNCj4gDQo+IFJldmlld2VkLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJk
QG52aWRpYS5jb20+DQo+IA0KDQpUaGFua3MNCg0KPiBkaWZmIC0tZ2l0IGEvbW0vbW11X25vdGlm
aWVyLmMgYi9tbS9tbXVfbm90aWZpZXIuYw0KPiBpbmRleCAyYjc0ODU5MTllY2YuLjEwN2Y5NDA2
YTkyZCAxMDA2NDQNCj4gKysrIGIvbW0vbW11X25vdGlmaWVyLmMNCj4gQEAgLTQ3LDYgKzQ3LDE2
IEBAIHN0cnVjdCBtbXVfbm90aWZpZXJfbW0gew0KPiAgICAgICAgIHN0cnVjdCBobGlzdF9oZWFk
IGRlZmVycmVkX2xpc3Q7DQo+ICB9Ow0KPiAgDQo+ICtpbnQgbW1faGFzX25vdGlmaWVycyhzdHJ1
Y3QgbW1fc3RydWN0ICptbSkNCj4gK3sNCj4gKyAgICAgICByZXR1cm4gdW5saWtlbHkobW0tPm1t
dV9ub3RpZmllcl9tbSk7DQo+ICt9DQoNClRoaXMgaW5saW5lIGlzIHBlcmZvcm1hbmNlIHNlbnNp
dGl2ZSwgaXQgbmVlZHMgdG8gc3RheSBpbmxpbmVkLi4NCg0KSmFzb24NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
