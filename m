Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0E1D898E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 09:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E376E8DB;
	Wed, 16 Oct 2019 07:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10048.outbound.protection.outlook.com [40.107.1.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48916E3F4;
 Wed, 16 Oct 2019 05:06:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Abu3erMAXd7b4z8WE/GaxpLEnRjVNhveU0bZ0l3KECtpgAy5tpnDVg4qtjMcygZL4pGQ08YDa5Dh+TxHzs1ywAbnOawLtJ6gowx9wf31VBX9tVDK5Bmxq0+vBRMJs9qm6ZnryzRUWphF+PwTWLo86ECLIe4FId3S7w5pqyeijRntLJuyIakXaYRKwP8PES/V5SMQYfrju7oDHaAoLyC4NdA5UFijOHsH0bQjPoJDZZA8PRlm3aTxtHJ8iQ8JDNjPG+uboAmBzW8chdqlZM+EnDMFfGtDZ/I/z70iDXUvcsAbo6VVWXM/5mdjpsH5Y4EJ9Ou9BKnGoWklaWKbB1WoZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLf88dwV5MRfS3kbM/mBtnId8rOybPvLeTH0Qk2kKV0=;
 b=K2+P4huq0X+Zctfkl+Ml+Na5NcfS7rf3gyuPXwhXp/6IY0ChJf6QSrzKV0Xii00F+fOKceULsng1SOOsMElP/kuhOcSQnrltrx81K6nqeJWUFQT6xlM9MzWYpd9xsrQQuRsulCKRd2ek7eFSYk//GfGym0WWyUQc5fN75KxcrZnP06LlXGN2EQvtj+YaKwCqgorcS3LCdQfdR4FHs7i8CZEbTJhetBNX+US2SXuY2F5ufe4m0E2ErHnMuqDPAlGnZyYjNcyKAIWfD+sXVNX85pofxIUMrxYlaj4mJqUBqhYaIPHXBj9bGveyGqIg4/P6vH244Gh5M5YKbphsSWnWrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from AM0PR05MB4866.eurprd05.prod.outlook.com (20.176.214.160) by
 AM0PR05MB5300.eurprd05.prod.outlook.com (20.178.18.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 16 Oct 2019 05:06:35 +0000
Received: from AM0PR05MB4866.eurprd05.prod.outlook.com
 ([fe80::64b2:6eb4:f000:3432]) by AM0PR05MB4866.eurprd05.prod.outlook.com
 ([fe80::64b2:6eb4:f000:3432%7]) with mapi id 15.20.2347.021; Wed, 16 Oct 2019
 05:06:35 +0000
From: Parav Pandit <parav@mellanox.com>
To: Jason Wang <jasowang@redhat.com>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "kwankhede@nvidia.com"
 <kwankhede@nvidia.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "tiwei.bie@intel.com" <tiwei.bie@intel.com>
Subject: RE: [PATCH V3 2/7] mdev: bus uevent support
Thread-Topic: [PATCH V3 2/7] mdev: bus uevent support
Thread-Index: AQHVgAxwOTFv76h8okS/5uHJAhcVf6dcvsLQ
Date: Wed, 16 Oct 2019 05:06:34 +0000
Message-ID: <AM0PR05MB4866CEC5CB9CFB6B7B409029D1920@AM0PR05MB4866.eurprd05.prod.outlook.com>
References: <20191011081557.28302-1-jasowang@redhat.com>
 <20191011081557.28302-3-jasowang@redhat.com>
In-Reply-To: <20191011081557.28302-3-jasowang@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2605:6000:ec82:1c00:8ddb:1e36:fbf6:de3d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb5026e1-4fb9-4c8d-151e-08d751f69df9
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: AM0PR05MB5300:|AM0PR05MB5300:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR05MB530000C90970E79C5BB7BAE0D1920@AM0PR05MB5300.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:561;
x-forefront-prvs: 0192E812EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(199004)(189003)(13464003)(476003)(446003)(52536014)(25786009)(81156014)(14454004)(81166006)(71190400001)(71200400001)(229853002)(316002)(110136005)(6436002)(486006)(54906003)(9686003)(7406005)(46003)(7416002)(55016002)(6246003)(76176011)(7736002)(186003)(6116002)(86362001)(33656002)(2906002)(2201001)(8676002)(11346002)(4326008)(74316002)(14444005)(53546011)(6506007)(305945005)(99286004)(5660300002)(478600001)(2501003)(66476007)(76116006)(102836004)(66446008)(66946007)(66556008)(64756008)(256004)(8936002)(7696005)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR05MB5300;
 H:AM0PR05MB4866.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: USIRKK135hjZiy2cR1Bcfs3XaJblthnntREI6dRe6tx649KkaMuwce4btTp3QScRb7met2r2oeyuT82vVYd7w7neNcXQraTgBv3UlnBJr1WePvL4fJ+ruDutKNtrMJwhKU1VEABR6ElbveeHx5cMlXolg1TLxPZLVPpobumVa0gvmCiXdPpQeI3KFDMUgoXu5D/ylZIiKp3BKp0BY5PxjOALWSxaah+oYy1CkY2Zugp8yUFbwRtj3EdNCQP8/9GgmCzRBAKucq4mL44+Z6AAHCzyEMP98n75b/2xBcEpJwIICR30BsZCqHUcdZPgzxNaWGku0czF40Xv69M8a4aKEetU5xDZV5q2TqTdLEbLY2sVmJeoK8qAvwxF2IyXPvii99ugp7CDSvE8v1cChl+NalKZlYSIAPj4bLIRApfQcWg=
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5026e1-4fb9-4c8d-151e-08d751f69df9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2019 05:06:34.9806 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zAfA9QKeKHVoDH630fM+A9ja9s0fJAyNVfJkE5sOmnURj8/TzfFm4Fm7Um2rAYefjgWET88I0d2Lq4lS+6I9xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB5300
X-Mailman-Approved-At: Wed, 16 Oct 2019 07:33:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLf88dwV5MRfS3kbM/mBtnId8rOybPvLeTH0Qk2kKV0=;
 b=WBaJWJawB0JCjkQf9JKoLD/jS/kMTpyqqCNrliJKYJ1req2eORc1fxV0DVR6LI9L+VUPhojCFYTSHDBT8w8T0IZZeL4dZKyL999CsjGSm1dq/tJcgbV0VSCivBgQXffUEEZkHQNn6NtfXnIYH7zdTO7cfH0v3H+fs6mYj67PMhk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=parav@mellanox.com; 
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
Cc: "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>, Ido Shamay <idos@mellanox.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "cunming.liang@intel.com" <cunming.liang@intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dh
bmdAcmVkaGF0LmNvbT4KPiBTZW50OiBGcmlkYXksIE9jdG9iZXIgMTEsIDIwMTkgMzoxNiBBTQo+
IFRvOiBrdm1Admdlci5rZXJuZWwub3JnOyBsaW51eC1zMzkwQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgtCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZzsgaW50ZWwtCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtZ3Z0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7Cj4ga3dhbmtoZWRlQG52aWRpYS5jb207IGFsZXgud2lsbGlh
bXNvbkByZWRoYXQuY29tOyBtc3RAcmVkaGF0LmNvbTsKPiB0aXdlaS5iaWVAaW50ZWwuY29tCj4g
Q2M6IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnOyBuZXRkZXZAdmdl
ci5rZXJuZWwub3JnOwo+IGNvaHVja0ByZWRoYXQuY29tOyBtYXhpbWUuY29xdWVsaW5AcmVkaGF0
LmNvbTsKPiBjdW5taW5nLmxpYW5nQGludGVsLmNvbTsgemhpaG9uZy53YW5nQGludGVsLmNvbTsK
PiByb2IubWlsbGVyQGJyb2FkY29tLmNvbTsgeGlhby53LndhbmdAaW50ZWwuY29tOwo+IGhhb3Rp
YW4ud2FuZ0BzaWZpdmUuY29tOyB6aGVueXV3QGxpbnV4LmludGVsLmNvbTsgemhpLmEud2FuZ0Bp
bnRlbC5jb207Cj4gamFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tOyBqb29uYXMubGFodGluZW5A
bGludXguaW50ZWwuY29tOwo+IHJvZHJpZ28udml2aUBpbnRlbC5jb207IGFpcmxpZWRAbGludXgu
aWU7IGRhbmllbEBmZndsbC5jaDsKPiBmYXJtYW5AbGludXguaWJtLmNvbTsgcGFzaWNAbGludXgu
aWJtLmNvbTsgc2Vib3R0QGxpbnV4LmlibS5jb207Cj4gb2JlcnBhckBsaW51eC5pYm0uY29tOyBo
ZWlrby5jYXJzdGVuc0BkZS5pYm0uY29tOyBnb3JAbGludXguaWJtLmNvbTsKPiBib3JudHJhZWdl
ckBkZS5pYm0uY29tOyBha3Jvd2lha0BsaW51eC5pYm0uY29tOyBmcmV1ZGVAbGludXguaWJtLmNv
bTsKPiBsaW5nc2hhbi56aHVAaW50ZWwuY29tOyBJZG8gU2hhbWF5IDxpZG9zQG1lbGxhbm94LmNv
bT47Cj4gZXBlcmV6bWFAcmVkaGF0LmNvbTsgbHVsdUByZWRoYXQuY29tOyBQYXJhdiBQYW5kaXQK
PiA8cGFyYXZAbWVsbGFub3guY29tPjsgY2hyaXN0b3BoZS5kZS5kaW5lY2hpbkBnbWFpbC5jb207
Cj4ga2V2aW4udGlhbkBpbnRlbC5jb207IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+
Cj4gU3ViamVjdDogW1BBVENIIFYzIDIvN10gbWRldjogYnVzIHVldmVudCBzdXBwb3J0Cj4gCj4g
VGhpcyBwYXRjaCBhZGRzIGJ1cyB1ZXZlbnQgc3VwcG9ydCBmb3IgbWRldiBidXMgaW4gb3JkZXIg
dG8gYWxsb3cKPiBjb29wZXJhdGlvbiB3aXRoIHVzZXJzcGFjZS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3ZmaW8v
bWRldi9tZGV2X2RyaXZlci5jIHwgOCArKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmZpby9tZGV2L21kZXZfZHJpdmVy
LmMKPiBiL2RyaXZlcnMvdmZpby9tZGV2L21kZXZfZHJpdmVyLmMgaW5kZXggYjdjNDBjZTg2ZWUz
Li4zMTlkODg2ZmZhZjcKPiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2Ry
aXZlci5jCj4gKysrIGIvZHJpdmVycy92ZmlvL21kZXYvbWRldl9kcml2ZXIuYwo+IEBAIC04Miw5
ICs4MiwxNyBAQCBzdGF0aWMgaW50IG1kZXZfbWF0Y2goc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1
Y3QKPiBkZXZpY2VfZHJpdmVyICpkcnYpCj4gIAlyZXR1cm4gMDsKPiAgfQo+IAo+ICtzdGF0aWMg
aW50IG1kZXZfdWV2ZW50KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGtvYmpfdWV2ZW50X2Vu
diAqZW52KQo+ICt7Cj4gKwlzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYgPSB0b19tZGV2X2Rldmlj
ZShkZXYpOwo+ICsKPiArCXJldHVybiBhZGRfdWV2ZW50X3ZhcihlbnYsICJNT0RBTElBUz1tZGV2
OmMlMDJYIiwgbWRldi0KPiA+Y2xhc3NfaWQpOyB9Cj4gKwo+ICBzdHJ1Y3QgYnVzX3R5cGUgbWRl
dl9idXNfdHlwZSA9IHsKPiAgCS5uYW1lCQk9ICJtZGV2IiwKPiAgCS5tYXRjaAkJPSBtZGV2X21h
dGNoLAo+ICsJLnVldmVudAkJPSBtZGV2X3VldmVudCwKPiAgCS5wcm9iZQkJPSBtZGV2X3Byb2Jl
LAo+ICAJLnJlbW92ZQkJPSBtZGV2X3JlbW92ZSwKPiAgfTsKPiAtLQo+IDIuMTkuMQpSZXZpZXdl
ZC1ieTogUGFyYXYgUGFuZGl0IDxwYXJhdkBtZWxsYW5veC5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
