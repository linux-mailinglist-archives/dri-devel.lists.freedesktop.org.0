Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 564F3101AED
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42766EBBF;
	Tue, 19 Nov 2019 08:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDFC89F07;
 Mon, 18 Nov 2019 13:41:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KqHqmMHVUGaUOQ+YFJhxtskI+R7OZq9TfICgUMF9dTEArpQB3qwpztNiQTo4KSmyrVGZZu6RIe3G3f2nETiMIyWnhdOpRkcouNKh9ZHM1iWc2j5sNTGMBWhFQmEAsJpcd5SEcWzFKiI108vzZGY0vfi800WugG1aAUZMd3+R/S/UBcy7kaNqrlKFm8igHcnoJarsvyqDu4Rfvi4kj2L8yn4jnHqCiWqxVX8aqwAWG2yXpofr6tjlIfVmt6dfUBWc5KdScUgMN4r8aatYTRSYSQ9I9gCpkXjRY9SxuUHTpv2u1L38bcjlp4czvkkoaG605F39mJhHlBr+q3rtR70fVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuDqjpYHb6XmHKeGp5dNWvkHs1BEwfpCqtspgBewqlU=;
 b=lxvLQIY5/kkV4o8T9Mu9oEaAGBOVS1TS1YsAMyIoO4qlFNiKp9nqgGr3T/oZvnTE/KUh8FvJDz2di0iGWbb8+eBKVizZHgWc4QjITTpCTC5ZH4QzQIlXqj2i4QY+02snaFbGXTYVu1uZRT3H/7ySfUmgWNtqcvaZvsHHlyXqkoMNjDpd6CjxjQlztRya8N+ENe5XURyVMNROryO3+3QF3S5Z9qmhUtScxjDiYcnHH4cMidaxl+zQUPowElEW1Lg9vhc+gqUpH3zi1VTKwlUio0TrActR0z7BKEtqLwjebwDLRkE3KcPX7TTRX9xEnmhWfTGoOwA8NKX6g5+XuA1Dtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4944.eurprd05.prod.outlook.com (20.177.51.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.30; Mon, 18 Nov 2019 13:41:01 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2451.029; Mon, 18 Nov 2019
 13:41:00 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V13 4/6] mdev: introduce mediated virtio bus
Thread-Topic: [PATCH V13 4/6] mdev: introduce mediated virtio bus
Thread-Index: AQHVnf+nErtejYVqgk+5ox/jEh/QtKeQ75wA
Date: Mon, 18 Nov 2019 13:41:00 +0000
Message-ID: <20191118134056.GJ3873@mellanox.com>
References: <20191118105923.7991-1-jasowang@redhat.com>
 <20191118105923.7991-5-jasowang@redhat.com>
In-Reply-To: <20191118105923.7991-5-jasowang@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:208:d4::37) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 239f48b8-9b0d-4197-edbe-08d76c2cf2ab
x-ms-traffictypediagnostic: VI1PR05MB4944:|VI1PR05MB4944:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR05MB49448C062B1A8FEA44BE78E1CF4D0@VI1PR05MB4944.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0225B0D5BC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(39860400002)(346002)(136003)(396003)(199004)(189003)(4326008)(6486002)(71200400001)(71190400001)(8936002)(33656002)(81166006)(81156014)(8676002)(6512007)(76176011)(64756008)(2906002)(66446008)(102836004)(66556008)(66946007)(36756003)(386003)(6506007)(316002)(6116002)(186003)(3846002)(54906003)(52116002)(256004)(486006)(5660300002)(26005)(66476007)(99286004)(478600001)(86362001)(2616005)(11346002)(229853002)(476003)(14454004)(6436002)(25786009)(7736002)(66066001)(305945005)(6916009)(446003)(6246003)(1076003)(7416002)(7406005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4944;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 61rMdXnl/5n2hYyesmJ4QPI5uaIOr2FSJWMRWXsTRuJDF0PER7YG8FkgTTHriaaMTV2xfY3UwGTmmUiIgMMByefcc5WiT+HGwldi718mRb1CD8qGEs16ME0vjs13DSPpaH6hdXm/QHBNqSTudJpkpTqYIbjn28qI4+OUG+U3MOH1HNSRL2DRtxL6QOlthFUc3s8J9ul7kXC7xabtF4yazDg83v/cnFszDCkBVZSyzMlg9H/CLaHXvUP77+eriMn3OTFPJ4yrl2Gnx8dcf/dPCCFShfvczOqYauKEgXascao+o8hLao43mB74LrvX+zPiFJUEc5pqzmcX+saCQM0+ymnReVatiPuC7ju4hYTbhh9Xi7ykg0Yq1F15oIRn2MUIS+XwOfsXYKHtpn9TfG8ym40ts7ufkzPMIDaOUEJNjDv8g3T+6LDrRW84yNPKLkU2
Content-ID: <DDDEEE12AA60DD4680F4090107703C6E@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 239f48b8-9b0d-4197-edbe-08d76c2cf2ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2019 13:41:00.5237 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 13CaT/VHTu4e6QWVhbqAB89fmBfNh1pcF6EDRoJ9EZg49blk5yCsYqZECUnszPtTBfAzF8balw/KiGaQ+ptHEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4944
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuDqjpYHb6XmHKeGp5dNWvkHs1BEwfpCqtspgBewqlU=;
 b=E7fHb0ufM4+pKySDeeoN1hhB4Ha10z84rbBBsB/DRVE/JIwyw21S/7Dgd6UnR5xWo/RJa3WEnRxa5q7mKZ+IoOpyjF12PxuIANkipvLfv+vMbWtkc5fBXYNq4nNVAnOyQJ/iF/yOJBaRv73M6CQ8+Joz/ZO5N2CaX20+13Bdcuc=
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
Cc: "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "mst@redhat.com" <mst@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
 "cunming.liang@intel.com" <cunming.liang@intel.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 Parav Pandit <parav@mellanox.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "hch@infradead.org" <hch@infradead.org>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "aadam@redhat.com" <aadam@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 "tiwei.bie@intel.com" <tiwei.bie@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMDY6NTk6MjFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiArc3RydWN0IGJ1c190eXBlIG1kZXZfdmlydGlvX2J1c190eXBlOwo+ICsKPiArc3RydWN0
IG1kZXZfdmlydGlvX2RldmljZSB7Cj4gKwlzdHJ1Y3QgbWRldl9kZXZpY2UgbWRldjsKPiArCWNv
bnN0IHN0cnVjdCBtZGV2X3ZpcnRpb19vcHMgKm9wczsKPiArCXUxNiBjbGFzc19pZDsKPiArfTsK
ClRoaXMgc2VlbXMgdG8gc2hhcmUgbm90aGluZyB3aXRoIG1kZXYgKGllIG1kZXYtdmZpbyksIHdo
eSBpcyBpdCBvbiB0aGUKc2FtZSBidXM/CgpXZSB3ZW50IG92ZXIgdGhpcyByZWNlbnRseSB3aXRo
IEdyZWcgYW5kIGhlIHNlZW1lZCBwcmV0dHkgY2xlYXIgb24KdGhpcy4uCgo+ICtzdHJ1Y3QgbWRl
dl92aXJ0aW9fb3BzIHsKPiArCS8qIFZpcnRxdWV1ZSBvcHMgKi8KPiArCWludCAoKnNldF92cV9h
ZGRyZXNzKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsCj4gKwkJCSAgICAgIHUxNiBpZHgsIHU2
NCBkZXNjX2FyZWEsIHU2NCBkcml2ZXJfYXJlYSwKPiArCQkJICAgICAgdTY0IGRldmljZV9hcmVh
KTsKPiArCXZvaWQgKCpzZXRfdnFfbnVtKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHUxNiBp
ZHgsIHUzMiBudW0pOwo+ICsJdm9pZCAoKmtpY2tfdnEpKHN0cnVjdCBtZGV2X2RldmljZSAqbWRl
diwgdTE2IGlkeCk7Cj4gKwl2b2lkICgqc2V0X3ZxX2NiKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1k
ZXYsIHUxNiBpZHgsCj4gKwkJCSAgc3RydWN0IHZpcnRpb19tZGV2X2NhbGxiYWNrICpjYik7Cj4g
Kwl2b2lkICgqc2V0X3ZxX3JlYWR5KShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHUxNiBpZHgs
IGJvb2wgcmVhZHkpOwo+ICsJYm9vbCAoKmdldF92cV9yZWFkeSkoc3RydWN0IG1kZXZfZGV2aWNl
ICptZGV2LCB1MTYgaWR4KTsKPiArCWludCAoKnNldF92cV9zdGF0ZSkoc3RydWN0IG1kZXZfZGV2
aWNlICptZGV2LCB1MTYgaWR4LCB1NjQgc3RhdGUpOwo+ICsJdTY0ICgqZ2V0X3ZxX3N0YXRlKShz
dHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHUxNiBpZHgpOwo+ICsKPiArCS8qIERldmljZSBvcHMg
Ki8KPiArCXUxNiAoKmdldF92cV9hbGlnbikoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KTsKPiAr
CXU2NCAoKmdldF9mZWF0dXJlcykoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KTsKPiArCWludCAo
KnNldF9mZWF0dXJlcykoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1NjQgZmVhdHVyZXMpOwo+
ICsJdm9pZCAoKnNldF9jb25maWdfY2IpKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwKPiArCQkJ
ICAgICAgc3RydWN0IHZpcnRpb19tZGV2X2NhbGxiYWNrICpjYik7Cj4gKwl1MTYgKCpnZXRfdnFf
bnVtX21heCkoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KTsKPiArCXUzMiAoKmdldF9kZXZpY2Vf
aWQpKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldik7Cj4gKwl1MzIgKCpnZXRfdmVuZG9yX2lkKShz
dHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpOwo+ICsJdTggKCpnZXRfc3RhdHVzKShzdHJ1Y3QgbWRl
dl9kZXZpY2UgKm1kZXYpOwo+ICsJdm9pZCAoKnNldF9zdGF0dXMpKHN0cnVjdCBtZGV2X2Rldmlj
ZSAqbWRldiwgdTggc3RhdHVzKTsKPiArCXZvaWQgKCpnZXRfY29uZmlnKShzdHJ1Y3QgbWRldl9k
ZXZpY2UgKm1kZXYsIHVuc2lnbmVkIGludCBvZmZzZXQsCj4gKwkJCSAgIHZvaWQgKmJ1ZiwgdW5z
aWduZWQgaW50IGxlbik7Cj4gKwl2b2lkICgqc2V0X2NvbmZpZykoc3RydWN0IG1kZXZfZGV2aWNl
ICptZGV2LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAo+ICsJCQkgICBjb25zdCB2b2lkICpidWYsIHVu
c2lnbmVkIGludCBsZW4pOwo+ICsJdTMyICgqZ2V0X2dlbmVyYXRpb24pKHN0cnVjdCBtZGV2X2Rl
dmljZSAqbWRldik7Cj4gK307CgpXaHkgYXJlbid0IGFsbCBvZiB0aGVzZSAnc3RydWN0IG1kZXZf
ZGV2aWNlX3ZpcnRpbyAqJyA/CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
