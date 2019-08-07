Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD0D85BE6
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 09:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998956E7B5;
	Thu,  8 Aug 2019 07:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00060.outbound.protection.outlook.com [40.107.0.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC196E752;
 Wed,  7 Aug 2019 18:17:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQje8g+Ju47ImkZwiBuVOtSQHMkxvF0Wci+I/rnWd4JZ8GxXH78Brlpty7+pmS/s0wq56AcUeNT3AltTxYJfVReWuMYDi/LXp3qYWjfNWuLjaUO66wCW0USMFIRwa8FuP5UEg/2qnORN/7VbyJJc2NBAr17to8XHJ+WGQCNVfwLX0eccIgNOtx9kgve19yZRnpGWn79MXTIHPdTtDFmkjgovl6IDR2SCIng/RjiwHACrha4/THw4eb3XBSLnpMVnqe4vN1uW+lcvlMXi9zQeSdGooit6i0g3aZs8b63+rY52g7MLCjL6u5KDZC1qJbOWp3qM98sWV9plI3jOHUPdbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EXPUC9MWpnXQilcdUkMQeiZeh83FjcLgirnjUQqTlo=;
 b=VHq4j2uISXpKY39PO7d5XO2QvgjsSja0yPAs75Ph/HgBFSb4Wf7GWNc5nLRUHbTfKlKc68UZXWA5Q/pABCwEWRzrSekHIAFdUkEDiTrtqfLvG6D3iFI6pY/BVmibVaOt5TbFpFy6bI0mrP9Sb1oS8JqIRIJoqLBCx5lcZwijjeEw99lektl21mAa7wZpwLDGXns093ggStamS7b1erQHGrYC6Rng/nP70WA/0Gv0dte4uTsPSrYLm+F2o+kvqUgm+zf4S3ixIuhogx69QWXMcKF2CApciwkInJMoD2oqL1/2XixaOFH0duMYFbv283SMyfRvvIvhnDvRhl/vg9QHXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6461.eurprd05.prod.outlook.com (20.179.24.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Wed, 7 Aug 2019 18:17:39 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880%4]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 18:17:39 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>, John Hubbard <jhubbard@nvidia.com>
Subject: Re: hmm cleanups, v2
Thread-Topic: hmm cleanups, v2
Thread-Index: AQHVTHDXDUnAIZqjmEOq1Yke5EzQp6bv/+GA
Date: Wed, 7 Aug 2019 18:17:39 +0000
Message-ID: <20190807181733.GL1571@mellanox.com>
References: <20190806160554.14046-1-hch@lst.de>
In-Reply-To: <20190806160554.14046-1-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17)
 To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9004f64-56d0-4808-36e5-08d71b6387c7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB6461; 
x-ms-traffictypediagnostic: VI1PR05MB6461:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR05MB646181193F251A672B9334EDCFD40@VI1PR05MB6461.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(199004)(189003)(966005)(6116002)(53936002)(229853002)(8676002)(6486002)(33656002)(7736002)(71190400001)(476003)(26005)(8936002)(81156014)(81166006)(486006)(71200400001)(36756003)(256004)(2616005)(305945005)(446003)(3846002)(2906002)(11346002)(14454004)(6506007)(4326008)(66946007)(66476007)(6246003)(54906003)(86362001)(386003)(66556008)(64756008)(66446008)(5660300002)(99286004)(478600001)(6306002)(6512007)(102836004)(68736007)(7416002)(186003)(1076003)(316002)(76176011)(6436002)(52116002)(110136005)(25786009)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6461;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: evQ9V92IoJTtn2zv2EdFZ9MNnfJPb2jedbASOg3TsWMb6M6dSvkP4p/klz0PwZ4o44H6NWNbOVS+G54hOrPtmpy6hqKzKV3Zp+0ciGNSFKpNdqWp50tSKaUBzE8aGYos4X5xC7Azbrl16BzFBJC6GFbIbD8VVYM4S1xXr9vlaZBHMoORPochpoM95SMZ8Y2+84yQpxmSK0stvOu3wHH64J6INsj0YzE5ws0AoXuOrwj2tx/ttYvAIsyBPvpoXOXjHMDUGTrOXoFUtKLqn6orpS/QMtNTdnIleogvsVDRCBC2HAJkfw0X8WuTxaJ3bKrV3kIEiJUrDDzaxDndXaaReZ/2U5EwdogoSOpXOYkpFyy9TsaDX4GDMuJwd6QTPa2PAYJCcx9edMWxz7k3iqZ0LGiJH8Q+9Dq2NGk6d+QSVRk=
Content-ID: <B71F314D18668A44A07719FC1462D90A@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9004f64-56d0-4808-36e5-08d71b6387c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 18:17:39.1325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6461
X-Mailman-Approved-At: Thu, 08 Aug 2019 07:46:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EXPUC9MWpnXQilcdUkMQeiZeh83FjcLgirnjUQqTlo=;
 b=XVrvAlprNK3yw7vO6hrlpoO7EMfq+IJe+Brm5elZxCR+n5Abs7XT34Xt7xU0KbaCm3SCTY7LmfWiTzQNDLU1HxCt5IRHqPEv4YfNvu2VSd6os3pyMbstgtcKDaTBL3joAOx29+r7m8x10HZNoP486tAU6SrllQnvTbLaL4idbfo=
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDc6MDU6MzhQTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6DQo+IA0KPiBIaSBKw6lyw7RtZSwgQmVuLCBGZWxpeCBhbmQgSmFzb24sDQo+IA0K
PiBiZWxvdyBpcyBhIHNlcmllcyBhZ2FpbnN0IHRoZSBobW0gdHJlZSB3aGljaCBjbGVhbnMgdXAg
dmFyaW91cyBtaW5vcg0KPiBiaXRzIGFuZCBhbGxvd3MgSE1NX01JUlJPUiB0byBiZSBidWlsdCBv
biBhbGwgYXJjaGl0ZWN0dXJlcy4NCj4gDQo+IERpZmZzdGF0Og0KPiANCj4gICAgIDExIGZpbGVz
IGNoYW5nZWQsIDk0IGluc2VydGlvbnMoKyksIDIxMCBkZWxldGlvbnMoLSkNCj4gDQo+IEEgZ2l0
IHRyZWUgaXMgYWxzbyBhdmFpbGFibGUgYXQ6DQo+IA0KPiAgICAgZ2l0Oi8vZ2l0LmluZnJhZGVh
ZC5vcmcvdXNlcnMvaGNoL21pc2MuZ2l0IGhtbS1jbGVhbnVwcy4yDQo+IA0KPiBHaXR3ZWI6DQo+
IA0KPiAgICAgaHR0cDovL2dpdC5pbmZyYWRlYWQub3JnL3VzZXJzL2hjaC9taXNjLmdpdC9zaG9y
dGxvZy9yZWZzL2hlYWRzL2htbS1jbGVhbnVwcy4yDQo+IA0KPiBDaGFuZ2VzIHNpbmNlIHYxOg0K
PiAgLSBmaXggdGhlIGNvdmVyIGxldHRlciBzdWJqZWN0DQo+ICAtIGltcHJvdmUgdmFyaW91cyBw
YXRjaCBkZXNjcmlwdGlvbnMNCj4gIC0gdXNlIHN2bW0tPm1tIGluIG5vdXZlYXVfcmFuZ2VfZmF1
bHQNCj4gIC0gaW52ZXJzZSB0aGUgaG1hc2sgZmllbGQgd2hlbiB1c2luZyBpdA0KPiAgLSBzZWxl
Y3QgSE1NX01JUlJPUiBpbnN0ZWFkIG9mIG1ha2luZyBpdCBhIHVzZXIgdmlzaWJsZSBvcHRpb24N
CiANCkkgdGhpbmsgaXQgaXMgc3RyYWlnaHRmb3J3YXJkIGVub3VnaCB0byBtb3ZlIGludG8gLW5l
eHQsIHNvIGFwcGxpZWQgdG8NCnRoZSBobW0uZ2l0IGxldHMgZ2V0IHNvbWUgbW9yZSByZXZpZXdl
ZC1ieXMvdGVzdGVkLWJ5IHRob3VnaC4NCg0KRm9yIG5vdyBJIGRyb3BwZWQgJ3JlbW92ZSB0aGUg
cGdtYXAgZmllbGQgZnJvbSBzdHJ1Y3QgaG1tX3ZtYV93YWxrJw0KanVzdCB0byBoZWFyIHRoZSBm
b2xsb3d1cCBhbmQgJ2FtZGdwdTogcmVtb3ZlDQpDT05GSUdfRFJNX0FNREdQVV9VU0VSUFRSJyB1
bnRpbCB0aGUgQU1EIHRlYW0gQWNrcw0KDQpUaGFua3MsDQpKYXNvbg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
