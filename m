Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB297BA67
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A858F6E69F;
	Wed, 31 Jul 2019 07:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2583A6E5F6;
 Tue, 30 Jul 2019 18:02:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrutM+iHJB9jHdnnSd0r70zPglkgLyoBYC90vZccbpJkHArsK7yYBLqLr/c4rz/9lri1+61A2T0SWIru3RjmqYWCoFjGncmr5Z52d4GUT5vfFy8cvHBuL8qJheD4x/Wq/1gVUwkJ/4jFvraB00MUXH6d5i9g5CBVOm1zUt1JDEcc9WGl9GqQNJJbxI4VecEQQFQoNSQnuHxITDnqytXYvsRSJUPtDdmvhIPr+q7C8fNDQRlFMLjvU/UvXz3Nc+nM4M63y4ZgzHjCr2gcxiGe+MM4e7pOronR6NejLkVvOpZR/+6/3xFlSByUlT4BMLFVWbMhOnIWerh8RhneHKNsDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WU7QXpoWkU/mAmBMVHE04HkSslwitrq0gukekU5gI5A=;
 b=ZHCypFovxDjlgwCI+qKzpekTZNhNQWMXg136WdTB5TF2eHSSCJFMqEtn9DoX1joSxTi4m2wUVgDsgTa+o/qSsoxSH6h7oJ2Seno5nFIuoJdnhxWOKjf7V66ao+qde8yVAfi7Ru3hr4y4dSZZ4KfLeaStLN+qeYuehJlvdibBT7EzDNwqxNCnkqRVllu8JiMxFnaX2zRgetmzQ3xLEFlzb4zevrBF1D/K/SJrOr0nFsBAvy88kY3D11vEnQE8Wirv3NvuiqkDOnsbAfCU+BNeGCqFwTMzCG9Gc+OYoSBsk11ank2KNCnnHToK9FNX+VsJ8kwZLwcCux77k+jVwH1h1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5728.eurprd05.prod.outlook.com (20.178.121.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 18:02:53 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 18:02:53 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 12/13] mm: cleanup the hmm_vma_walk_hugetlb_entry stub
Thread-Topic: [PATCH 12/13] mm: cleanup the hmm_vma_walk_hugetlb_entry stub
Thread-Index: AQHVRpsH3arHPNDuEUqTx9EEJPBdwKbjdMcA
Date: Tue, 30 Jul 2019 18:02:52 +0000
Message-ID: <20190730180247.GQ24038@mellanox.com>
References: <20190730055203.28467-1-hch@lst.de>
 <20190730055203.28467-13-hch@lst.de>
In-Reply-To: <20190730055203.28467-13-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQBPR0101CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::46) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6539de2c-fded-4047-877e-08d715182442
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB5728; 
x-ms-traffictypediagnostic: VI1PR05MB5728:
x-microsoft-antispam-prvs: <VI1PR05MB5728B65C2DA5BA7A5472F8DACFDC0@VI1PR05MB5728.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(199004)(189003)(6116002)(3846002)(68736007)(2616005)(71200400001)(71190400001)(2906002)(11346002)(14454004)(386003)(102836004)(26005)(446003)(486006)(256004)(305945005)(6506007)(5660300002)(476003)(52116002)(186003)(76176011)(7736002)(66066001)(86362001)(81156014)(6916009)(6486002)(6512007)(6436002)(25786009)(4326008)(36756003)(7416002)(4744005)(99286004)(66946007)(478600001)(1076003)(8676002)(81166006)(8936002)(316002)(54906003)(66476007)(33656002)(66446008)(66556008)(64756008)(6246003)(53936002)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5728;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: C/ks47PRQnThPeuchvfvHLJvxrN1CNZZ1k8z7mZJ3afqvlrSMLtWwSaVNoKNQkqCT8rkHKrcV9lDre4DgLQXxeBjlmx+uxpveQTy9l9bnPGx9EqUqlt8ik+M1XNO/Q7CDGbak/BhJNMYceY10pCJefD6lJQm9FLP3q2+sInXVpVj5ndmyOduMjm7IHSyzrCZcLdT5VfPENi7Riwevj9WgajLt9nOfnnLIr51cVU4D3wST/XIGe8ouz30g0pbSQ70TzIJf75/7aPQdCbSSrJbh+JAc9GKL4MqoufOFsNUIdBn/qhrjJMxnTdbGH9s0LSp7zMSWefgCkaRbM5F+gwR8yDXNaUsuXM+rzECslcUWSSPEDTl5Iy/213WCiy7DyLI2UJmrpDqWCczRZrFoRv/SlgdldNHsg0XZjwQvGtDtUo=
Content-ID: <981A0DE32A12614DB8B2019E51F413F2@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6539de2c-fded-4047-877e-08d715182442
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 18:02:52.9621 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5728
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WU7QXpoWkU/mAmBMVHE04HkSslwitrq0gukekU5gI5A=;
 b=YCOylojYtDyxNhNVrJk8NW1AqeRL/+Nuq2oFq9nDtYR7RTB2D2BQl8SCicOLJeeZlUjm8Hzoc1fC+rF5lWdxWT0s4lYDITBymNSPj06JVHOFP4O5zDge5SoYchcj/P2dRqLGOqUN3a8q22y+RWz8m+bz9GN0SXgRJbB+46PJwkg=
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
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDg6NTI6MDJBTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gU3R1YiBvdXQgdGhlIHdob2xlIGZ1bmN0aW9uIGFuZCBhc3NpZ24gTlVMTCB0
byB0aGUgLmh1Z2V0bGJfZW50cnkgbWV0aG9kCj4gaWYgQ09ORklHX0hVR0VUTEJfUEFHRSBpcyBu
b3Qgc2V0LCBhcyB0aGUgbWV0aG9kIHdvbid0IGV2ZXIgYmUgY2FsbGVkIGluCj4gdGhhdCBjYXNl
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0t
LQo+ICBtbS9obW0uYyB8IDggKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0Bt
ZWxsYW5veC5jb20+CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
