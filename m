Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A7458FA9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 03:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A996E864;
	Fri, 28 Jun 2019 01:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on0623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe08::623])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3636E05A;
 Thu, 27 Jun 2019 16:18:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=LBJCwUQhZNZ7JO6Lm19Nly1Wj8bCpXKqTCKdgBXsd6H55hzx7W1wAb6hUJJrD5FqcHqpTPQWmGOjeeJB8iX/pkbU1eeUm2bF+4gSiCpHD3NQDYjzq9HHS7zfgVocvCuAlQZQxkhvFkyt3jKqK1xJXCcqBX6vSIItewtdUWpzMPc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQKJZidBThddtQhWQZohKcjkCp3iYRBt7c0S6siQ09M=;
 b=UtnblwRey3svlmUCbu+2ebcVAuSz5M+zsn+H8ORaEAtxvjgk96dUT6WBtbwkfbuiBC3bcUK96/X+QfQh7GO/4zgdibmsu0eYLFCKZzvsQlth1qResb22s9dFROK5zbAkTX5ZOcpgmeXJbziLc3phdsi3SLaNm0i00WScr2FO9xE=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5886.eurprd05.prod.outlook.com (20.178.125.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Thu, 27 Jun 2019 16:18:22 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2008.014; Thu, 27 Jun 2019
 16:18:22 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 03/25] mm: remove hmm_devmem_add_resource
Thread-Topic: [PATCH 03/25] mm: remove hmm_devmem_add_resource
Thread-Index: AQHVLBqRvJE5RWoAFEuwP/I4qHQ7paavr6GA
Date: Thu, 27 Jun 2019 16:18:22 +0000
Message-ID: <20190627161813.GB9499@mellanox.com>
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-4-hch@lst.de>
In-Reply-To: <20190626122724.13313-4-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::24) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.199.206.50]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c526e6d-f839-4214-2861-08d6fb1b12e9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB5886; 
x-ms-traffictypediagnostic: VI1PR05MB5886:
x-microsoft-antispam-prvs: <VI1PR05MB5886C35E617535FD2443239DCFFD0@VI1PR05MB5886.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(346002)(396003)(376002)(39860400002)(199004)(189003)(6436002)(66556008)(81166006)(99286004)(2616005)(3846002)(8936002)(6512007)(33656002)(6246003)(68736007)(4326008)(102836004)(53936002)(4744005)(8676002)(6486002)(73956011)(86362001)(81156014)(66946007)(478600001)(5660300002)(36756003)(54906003)(1076003)(186003)(66446008)(25786009)(66066001)(316002)(229853002)(71190400001)(76176011)(6116002)(26005)(66476007)(476003)(2906002)(7736002)(446003)(386003)(52116002)(14454004)(6916009)(256004)(305945005)(486006)(64756008)(11346002)(6506007)(7416002)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5886;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MPZH6fxej22oS7mLYEZmxFyn20waja4eRFeHmir8gtV1hjF9WJIgHwtjY4C36d2npItR/CWyxfgPjCQ+e19S8i/WruQpqNIHjrH8CZ+IYxP/SAf5mBH7mWcVbuKjO5vst38yOem1FSeiQc+UM2HMfjmCGzZa1IsRZcLs0/bJZFvSDMd7v8/irZB5vT9QtJv1uBJ3h7xdhz/QMy1Uw26YL0jRvCcMQ/atQgGDIJsmelkfWdS/PbSyMm+AYLLH079WJ+KZtdpsYfSGGYocok7klunoms3nZiojM8Wl2c8TBBunzsbCb3Y4kJbM5C/sD1C0N8RqfQHigF8REGgBv/QvoepFXUnYnPM6uoUomO356Lzf/kFxS5R31l4fpw9RbxA78tBT/LQENWHD6dP3CjqH5nHlGfE0H/4aTEuIRyx7Vjo=
Content-ID: <0E26856B4495E64E8EFED3F814341B4B@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c526e6d-f839-4214-2861-08d6fb1b12e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 16:18:22.2670 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5886
X-Mailman-Approved-At: Fri, 28 Jun 2019 01:25:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQKJZidBThddtQhWQZohKcjkCp3iYRBt7c0S6siQ09M=;
 b=J2dMlcNPZlD5N3vpQW1JjZMZcMPSA86ZsmMs/EA5ArN364tGhM/lbJBxFeL8QjH9sUmtmFktOVRL7mywOKEaFOcd259xase/Xs5EwItur4p4WBEUMAcCj0JbdS9MN5foY/pEt0x+MnDGkFVMwyd7bcVx8mwkr8hnhSOMGkaySa4=
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
Cc: Michal Hocko <mhocko@suse.com>, John Hubbard <jhubbard@nvidia.com>,
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDI6Mjc6MDJQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gVGhpcyBmdW5jdGlvbiBoYXMgbmV2ZXIgYmVlbiB1c2VkIHNpbmNlIGl0IHdh
cyBmaXJzdCBhZGRlZCB0byB0aGUga2VybmVsCj4gbW9yZSB0aGFuIGEgeWVhciBhbmQgYSBoYWxm
IGFnbywgYW5kIGlmIHdlIGV2ZXIgZ3JvdyBhIGNvbnN1bWVyIG9mIHRoZQo+IE1FTU9SWV9ERVZJ
Q0VfUFVCTElDIGluZnJhc3RydWN0dXJlIGl0IGNhbiBlYXNpbHkgdXNlIGRldm1fbWVtcmVtYXBf
cGFnZXMKPiBkaXJlY3RseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8
aGNoQGxzdC5kZT4KPiBSZXZpZXdlZC1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3gu
Y29tPgo+IFJldmlld2VkLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Cj4g
QWNrZWQtYnk6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgo+IC0tLQo+ICBpbmNsdWRl
L2xpbnV4L2htbS5oIHwgIDMgLS0tCj4gIG1tL2htbS5jICAgICAgICAgICAgfCA1MCAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2Vk
LCA1MyBkZWxldGlvbnMoLSkKClRoaXMgc2hvdWxkIGJlIHNxdWFzaGVkIHRvIHRoZSBuZXcgZWFy
bGllciBwYXRjaD8KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
