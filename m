Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5CC5F3A3
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4276D6E2E6;
	Thu,  4 Jul 2019 07:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::614])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEC46E1AA;
 Wed,  3 Jul 2019 19:00:53 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6032.eurprd05.prod.outlook.com (20.178.127.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 19:00:50 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 19:00:50 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/5] mm: return valid info from hmm_range_unregister
Thread-Topic: [PATCH 1/5] mm: return valid info from hmm_range_unregister
Thread-Index: AQHVMc9vbnYVs0S/206V41dM/fYuDaa5P52A
Date: Wed, 3 Jul 2019 19:00:50 +0000
Message-ID: <20190703190045.GN18688@mellanox.com>
References: <20190703184502.16234-1-hch@lst.de>
 <20190703184502.16234-2-hch@lst.de>
In-Reply-To: <20190703184502.16234-2-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR02CA0052.namprd02.prod.outlook.com
 (2603:10b6:207:3d::29) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5c54ad6-e426-42ce-989f-08d6ffe8c394
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB6032; 
x-ms-traffictypediagnostic: VI1PR05MB6032:
x-microsoft-antispam-prvs: <VI1PR05MB6032B3B10FE9F9E9C6D63DB5CFFB0@VI1PR05MB6032.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(199004)(189003)(33656002)(26005)(81156014)(316002)(2616005)(36756003)(4326008)(6486002)(86362001)(386003)(81166006)(6506007)(53936002)(186003)(486006)(102836004)(14454004)(8936002)(6916009)(8676002)(305945005)(68736007)(11346002)(478600001)(476003)(446003)(54906003)(66476007)(52116002)(6246003)(5660300002)(2906002)(64756008)(66946007)(6512007)(66446008)(25786009)(73956011)(66556008)(1076003)(6436002)(3846002)(229853002)(99286004)(7736002)(76176011)(71190400001)(14444005)(66066001)(256004)(6116002)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6032;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tGLXfkxhn4UMvbBsaWRxIq0U0KZWaqqcr+rFSUIlHqJy9FP57IS59e+yPBehjk1jXreBrmMYaZKLDwE60fBKQncizWEKCVlj7f2vVm63/bzW05sS2PMhxm398RP5Hmv/P590lkCoPjMQRKB24p2IP8a8x3NPijoeN+P04YH6/1QVAa/Ik/7e6apiSgb6jpe142Ul4RF7XDbGN/OnPmjZDxet9AOe/f9F5VOtiFbKUcS7Djs89CW1B8IWygw8aQIjhFsM8y5zg6F8pwjrSjrILw1s2W+pW5X1P2ryJv8DOc4BKwt08BVubCP3a7kICP9tfw2lv58U0FlYDvtPxJanewqzVQN4kT2YfhNa4uNVh1wxPLzIUsEU7SwYel5Y7gnz2MQiytuGVMkswgQbJ2vsnwFMaFQae/LCLEwwjkolSqs=
Content-ID: <9EED1B508716C14685B4671208A7B4A6@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c54ad6-e426-42ce-989f-08d6ffe8c394
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 19:00:50.2152 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6032
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jW1QLqG0Yl8+6QA1y0hpQO2CW7YVwBm9xRUpZgg5RV8=;
 b=qCfJh6wtkaqMswWFwHSQZb4Z/kbjELjDI12Ai5aNxFMY7TXtie2JJdRuFId4OaJZbyNV9KI5zcICr+uBShl1DpHfsSe/jRb3b2mOxRKuBi7M4jMhTj9uPZj2VEb+9KLsMewYy1GIqsiltXHOOVmoloXhd95CwvPjfZxYkVR1/DE=
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
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMTE6NDQ6NThBTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gQ2hlY2tpbmcgcmFuZ2UtPnZhbGlkIGlzIHRyaXZpYWwgYW5kIGhhcyBubyBt
ZWFuaW5nZnVsIGNvc3QsIGJ1dAo+IG5pY2VseSBzaW1wbGlmaWVzIHRoZSBmYXN0cGF0aCBpbiB0
eXBpY2FsIGNhbGxlcnMuICAKCkl0IHNob3VsZCBub3QgYmUgdGhlIHR5cGljYWwgY2FsbGVyLi4K
Cj4gaG1tX3ZtYV9yYW5nZV9kb25lIGZ1bmN0aW9uLCB3aGljaCBub3cgaXMgYSB0cml2aWFsIHdy
YXBwZXIgYXJvdW5kCj4gaG1tX3JhbmdlX3VucmVnaXN0ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTog
Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gUmV2aWV3ZWQtYnk6IFJhbHBoIENhbXBi
ZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9zdm0uYyB8ICAyICstCj4gIGluY2x1ZGUvbGludXgvaG1tLmggICAgICAgICAgICAgICAg
ICAgfCAxMSArLS0tLS0tLS0tLQo+ICBtbS9obW0uYyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDcgKysrKysrLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTIg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfc3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCj4gaW5k
ZXggOGM5MjM3NGFmY2YyLi45ZDQwMTE0ZDc5NDkgMTAwNjQ0Cj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYwo+IEBAIC02NTIsNyArNjUyLDcgQEAgbm91dmVhdV9z
dm1fZmF1bHQoc3RydWN0IG52aWZfbm90aWZ5ICpub3RpZnkpCj4gIAkJcmV0ID0gaG1tX3ZtYV9m
YXVsdCgmc3ZtbS0+bWlycm9yLCAmcmFuZ2UsIHRydWUpOwo+ICAJCWlmIChyZXQgPT0gMCkgewo+
ICAJCQltdXRleF9sb2NrKCZzdm1tLT5tdXRleCk7Cj4gLQkJCWlmICghaG1tX3ZtYV9yYW5nZV9k
b25lKCZyYW5nZSkpIHsKPiArCQkJaWYgKCFobW1fcmFuZ2VfdW5yZWdpc3RlcigmcmFuZ2UpKSB7
Cj4gIAkJCQltdXRleF91bmxvY2soJnN2bW0tPm11dGV4KTsKPiAgCQkJCWdvdG8gYWdhaW47Cj4g
IAkJCX0KCkluIHRoaXMgY2FzZSBpZiB3ZSB0YWtlIHRoZSAnZ290byBhZ2FpbicgdGhlbiB3ZSBh
cmUgcG9pbnRsZXNzbHkKcmVtb3ZpbmcgYW5kIHJlLWFkZGluZyB0aGUgcmFuZ2UuCgpUaGUgcGF0
dGVybiBpcyBzdXBwb3NlZCB0byBiZToKCiAgICBobW1fcmFuZ2VfcmVnaXN0ZXIoKQphZ2FpbjoK
ICAgIC4uIHJlYWQgcGFnZSB0YWJsZXMgLi4KICAgIGxvY2sKICAgIGlmICghaG1tX3JhbmdlX3Zh
bGlkKCkpCiAgICAgICAgdW5sb2NrCiAgICAgICAgZ290byBhZ2FpbgogICAgLi4gc2V0dXAgZGV2
aWNlIC4uCiAgICB1bmxvY2sKICAgIGhtbV9yYW5nZV91bnJlZ2lzdGVyKCkKCkkgZG9uJ3QgdGhp
bmsgdGhlIEFQSSBzaG91bGQgYmUgZW5jb3VyYWdpbmcgc29tZSBzaG9ydGN1dCBoZXJlLi4KCldl
IGNhbid0IGRvIHRoZSBhYm92ZSBwYXR0ZXJuIGJlY2F1c2UgdGhlIG9sZCBobW1fdm1hIEFQSSBk
aWRuJ3QgYWxsb3cKaXQsIHdoaWNoIGlzIHByZXN1bWFibHkgYSByZWFzb24gd2h5IGl0IGlzIG9i
c29sZXRlLgoKSSdkIHJhdGhlciBzZWUgZHJpdmVycyBtb3ZlIHRvIGEgY29uc2lzdGVudCBwYXR0
ZXJuIHNvIHdlIGNhbiB0aGVuCmVhc2lseSBob2lzdCB0aGUgc2VxY291bnQgbG9jayBzY2hlbWUg
aW50byBzb21lIGNvbW1vbiBtbXUgbm90aWZpZXIKY29kZSwgYXMgZGlzY3Vzc2VkLgoKSmFzb24K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
