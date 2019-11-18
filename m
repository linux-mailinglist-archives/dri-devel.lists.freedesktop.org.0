Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E03101B06
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:06:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C28A6EBBD;
	Tue, 19 Nov 2019 08:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00077.outbound.protection.outlook.com [40.107.0.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC046E82C;
 Mon, 18 Nov 2019 20:28:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrmkXkXZqO2h79XHgqZa/6VSJfMlSE3/NY+hfeoCS9McnvtICCB11pKfSA6sZo3kHLGO5EAHEvSmu8D/jYgtmMKFGpJdrR0pKGBsehmSitGLWBACTFAOcSmdvif0uH7yEE8CxMY6KoFtV/aMPOuti1dQ3af28+/mcrH+KFvaIwirJfQ67F5kop2FFhpj5mW1y4DuMsmApGOrpyqBx6NaIoSgiQEhb+plxJVHecqsYbHgoMEe33fBaA9DgtAgRjvWrG2WWpyfY5MOneXbTxnFwahoXVLLXsRgSHJlnEUhQ4ciXwpKIOWlr6KdAVNOofcWPUMkr6xGRYmK7iTJCxYb7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hu3RarQ3Suje4W/JTSQpw8g0zav4Ec+FF4uZVpGAtJ8=;
 b=kPIADUaWq+qHobadNNz9hHuca5fKJUDFPCTnBIjqu2ROezkWsNIhsutZOsuUESsUvSjdmGQlrSHkNoPOQIobvOadZ/uLGu+Gax7XzoySrrp20GHF8jtWLeOBHdi9pQfVuH5geutmvH5/duivjth89o9dGlquGc5oFx4Qnt/l8k8uRFkyWtQpzgIibyjPPjoOCdGXBr4MX2TmneA1F5UhOfCdqUIsRczUStJ3PZ87tR59i5cRNoqjpDzwXiHCqMNo+Hv0JbQFW7zf7gs5Ds7lsGyBVliNA7iUbWyVhqtYrQdBVqZoDbIY/nhAZw4iZ1mvvR4k4DttWfpfN2lg2NWG8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4286.eurprd05.prod.outlook.com (10.171.182.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.30; Mon, 18 Nov 2019 20:28:48 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2451.029; Mon, 18 Nov 2019
 20:28:48 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH V13 4/6] mdev: introduce mediated virtio bus
Thread-Topic: [PATCH V13 4/6] mdev: introduce mediated virtio bus
Thread-Index: AQHVnf+nErtejYVqgk+5ox/jEh/QtKeQ75wAgABxg4CAAABsgA==
Date: Mon, 18 Nov 2019 20:28:48 +0000
Message-ID: <20191118202843.GN3873@mellanox.com>
References: <20191118105923.7991-1-jasowang@redhat.com>
 <20191118105923.7991-5-jasowang@redhat.com>
 <20191118134056.GJ3873@mellanox.com>
 <20191118152642-mutt-send-email-mst@kernel.org>
In-Reply-To: <20191118152642-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN8PR04CA0040.namprd04.prod.outlook.com
 (2603:10b6:408:d4::14) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cc2753cf-3fb1-4062-5061-08d76c65eaa3
x-ms-traffictypediagnostic: VI1PR05MB4286:|VI1PR05MB4286:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR05MB4286177B41F320A612C29DF3CF4D0@VI1PR05MB4286.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0225B0D5BC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(396003)(376002)(366004)(199004)(189003)(1076003)(4326008)(6486002)(71200400001)(71190400001)(8676002)(8936002)(81156014)(81166006)(33656002)(6512007)(4744005)(76176011)(2906002)(66446008)(102836004)(36756003)(66556008)(66946007)(64756008)(316002)(386003)(6506007)(6116002)(186003)(3846002)(54906003)(52116002)(256004)(26005)(5660300002)(66476007)(99286004)(478600001)(86362001)(476003)(11346002)(229853002)(14454004)(6436002)(25786009)(7736002)(66066001)(305945005)(2616005)(6246003)(486006)(6916009)(7406005)(446003)(7416002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4286;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P3z0Z1tuJtkxkogv69aBdYPvMsi2Jzk/p0fMlpbmtlYq6iJqbk4NiABhZ3cJ3D9ZMgdYJh01juRxZypc/L/2PF0tc0CdPqaOD7SN4uHrEKEhtZvTwQjX6KfL4ZV3X85nIrKjxE/iMFIaT4dhqWzJe+Y33cLAwWtI6dYWi9UqucSG+BMVuPp/1t2SutFtJgEk3Dpi30NjGWcwczqt374Dz5sVxGr9MmRcidr6SEDxuiKDZmw6I5msO+GsdGI7UokcSYNYT+7PMR+1R1BZbfYEncfYHqEOLUB4dFVgbE5mgMbYXELa7OOLUUpGrZoVecJQ6LjrZ/eSgJaHuII4vhffs7vlXLr1E4Em7fUgJo3p4GrDgBwBzKtXa1qVIbIOC8DpM1E1L1+loVJOeisETcdqSvP8eqdowpl9oxSn/RkQ8/49qdI3wiPf/ja1KRI1uO7J
Content-ID: <89948722630ABD4FA06903337DA274A3@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc2753cf-3fb1-4062-5061-08d76c65eaa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2019 20:28:48.5869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Re/Ii7+HhbMQlhXGXPowgZLpW9QIHWDdudvwiG8Ia8kry/LLkk1kTBZkKNZsdhgUU3c1mnz9b1NEHMpIhMDrBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4286
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hu3RarQ3Suje4W/JTSQpw8g0zav4Ec+FF4uZVpGAtJ8=;
 b=SZ5Eehe3ERykSnzxjrgQK6ONWS7zFySBXDLteublzCw4bbZ+YOTdNWTNJt4OfB9crbZyIA6Bdn2pPwIv4To/9SzBqNztQE7LxS/7TdxTjR0Ymc1QxnvKBJ4wL8l+JF1K9GzOkLGZ6svxpaX4xrDeuDKxGzKc7GqpJ7vgBjWZlOw=
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
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "hch@infradead.org" <hch@infradead.org>, "airlied@linux.ie" <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>,
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
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 Parav Pandit <parav@mellanox.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "cunming.liang@intel.com" <cunming.liang@intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
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

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMDM6Mjc6MTNQTSAtMDUwMCwgTWljaGFlbCBTLiBUc2ly
a2luIHdyb3RlOgo+IE9uIE1vbiwgTm92IDE4LCAyMDE5IGF0IDAxOjQxOjAwUE0gKzAwMDAsIEph
c29uIEd1bnRob3JwZSB3cm90ZToKPiA+IE9uIE1vbiwgTm92IDE4LCAyMDE5IGF0IDA2OjU5OjIx
UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4gPiA+ICtzdHJ1Y3QgYnVzX3R5cGUgbWRldl92
aXJ0aW9fYnVzX3R5cGU7Cj4gPiA+ICsKPiA+ID4gK3N0cnVjdCBtZGV2X3ZpcnRpb19kZXZpY2Ug
ewo+ID4gPiArCXN0cnVjdCBtZGV2X2RldmljZSBtZGV2Owo+ID4gPiArCWNvbnN0IHN0cnVjdCBt
ZGV2X3ZpcnRpb19vcHMgKm9wczsKPiA+ID4gKwl1MTYgY2xhc3NfaWQ7Cj4gPiA+ICt9Owo+ID4g
Cj4gPiBUaGlzIHNlZW1zIHRvIHNoYXJlIG5vdGhpbmcgd2l0aCBtZGV2IChpZSBtZGV2LXZmaW8p
LCB3aHkgaXMgaXQgb24gdGhlCj4gPiBzYW1lIGJ1cz8KPiAKPiBJIG11c3QgYmUgbWlzc2luZyBz
b21ldGhpbmcgLSB3aGljaCBidXMgZG8gdGhleSBzaGFyZT8KCm1kZXZfYnVzX3R5cGUgPwoKSmFz
b24gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
