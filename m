Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB4591161
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533A46EAD0;
	Sat, 17 Aug 2019 15:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00088.outbound.protection.outlook.com [40.107.0.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081296E34B;
 Fri, 16 Aug 2019 15:23:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9yCuMmIa9f/kdv0lr2Z5X84QAU3Zjf4qwY2bQJ8FDddObWqengMjMGUlQy38x5+MDnssNhos98bJPWiKKNc1mg5VsRknKY+dGeGSIIxxlxk1bSMEJfZrrKf0L5QQP8dVOkbBnnBCVu8T5u1Xn0bZqQ1dGcBxMfMWjq5YZt0hpMXCHvAeIBClj1P35I6YXJLM+oPyyGZx69pkwaYGP0FdN9hQA023nKnvRBtDcYrF0rhOnktDe0tkBFo9gKisXSfO6CvFS5DAhLBPL6S4XGFpn2IH/dyHIL4aGjWDQxYytA5bo1gkhYso25bw4krmPYlO6vf18ERLihtGxXapIUlYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLj0+5s8J4sPOjNLh2U7YQGSIRaX9TNUBlVpzIo7nrE=;
 b=LryzlOrjBeaQ5p5tZF/R7GoMcr3VU+zTb+Stzh8zb/EmhwGyUaGBdl+vZiOiC1g0BD357sUvxARKqj30unbLq3srW0t4Gi/4A7GvtsO9KzaEG6GFW2yaoBmwwrQjbyxJ5/obA3+tQXy2jdty1sqQ4bptOtp1hL61dAs5J0rv8B3pzJAEVa/OXWRh2h1DV3IuuJ/M3VVnhe35MQpJ23KOL+7nB8kEzRbf8vtRgrZ8oemfJ+gZiscy0Y2YTSKkAaF+qszbs1UV1fW9TQdnFgeIIAsWtl2CTqaG9FUG7zoyA6SascHFztBRjYu9UkFfuttEygOo2HdBHcaIO32nd5Ed1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5806.eurprd05.prod.outlook.com (20.178.122.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Fri, 16 Aug 2019 15:23:17 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7%6]) with mapi id 15.20.2178.016; Fri, 16 Aug 2019
 15:23:17 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 09/10] mm: remove the unused MIGRATE_PFN_DEVICE flag
Thread-Topic: [PATCH 09/10] mm: remove the unused MIGRATE_PFN_DEVICE flag
Thread-Index: AQHVUnZHuPYLs17X5ES78msdznuF1ab96BsA
Date: Fri, 16 Aug 2019 15:23:17 +0000
Message-ID: <20190816152312.GJ5412@mellanox.com>
References: <20190814075928.23766-1-hch@lst.de>
 <20190814075928.23766-10-hch@lst.de>
In-Reply-To: <20190814075928.23766-10-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: QB1PR01CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::25) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3a52c03-835c-4fea-8361-08d7225da9fb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB5806; 
x-ms-traffictypediagnostic: VI1PR05MB5806:
x-microsoft-antispam-prvs: <VI1PR05MB580694E32408ABDF5E1F20E3CFAF0@VI1PR05MB5806.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(189003)(199004)(25786009)(3846002)(316002)(66556008)(99286004)(6512007)(486006)(54906003)(476003)(76176011)(446003)(256004)(2616005)(36756003)(6486002)(6436002)(8936002)(4326008)(71190400001)(6116002)(2906002)(478600001)(66066001)(229853002)(33656002)(11346002)(6916009)(102836004)(1076003)(6246003)(7416002)(386003)(71200400001)(186003)(4744005)(52116002)(66476007)(6506007)(53936002)(81156014)(86362001)(7736002)(305945005)(5660300002)(8676002)(14454004)(81166006)(66946007)(66446008)(64756008)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5806;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: O0hU/8wSHSywervEfRcqYXbmdilbl3ug6l6GV7LAsWtd0dYKf+qW6SgBQTVj2ilV6btto2PSuNmwHB8DP2K7o8SsWlru1LEdyucz4P7GWOV4qBZ+zRiyRQzOFEYUMl+TJDV9VtXmXenPLT0iriafXWcgCbuhVBW/mQv0fxYvPfI3MpS6C7OwpqteVXNoFJUmKGejn1WXP3Sx2kIQ7SvBAOtgjJjyO9QgDGjHdsa0PCDZOnimBifYdLDQxvUDEbbVNqAFICIeOFj+BVFrEtJrR5WkAEBYbZX2XPpMe1LBt3YyAA4K9sM88gGPKGcXKedXpkSgbzSnVCpCxDkyiRifmuhm5VnnlkYSnZGZJUQ+ir3Ixtx2+dIO2sRXC6Gv81gTe44NCO4QIpnJhd/CCAv01Oh29BrU8mXNCjhqCZaJqEk=
x-ms-exchange-transport-forked: True
Content-ID: <3EB9395C750F37448F03B7FC8F9B531F@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a52c03-835c-4fea-8361-08d7225da9fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 15:23:17.6119 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GzK5fNV+K9WuO7Kuped3qoX9mXDcuyVmPFlH2li/ySQFL8J+V6Skf05PZDux1MNgAsJ0DniWqbk3ATrTl5/7MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5806
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLj0+5s8J4sPOjNLh2U7YQGSIRaX9TNUBlVpzIo7nrE=;
 b=DU4dUVjkfM/n2QsXl5K9QmD6eAymwjgkoDA5Rp5poek10h0GfrTdSWlbb4D4TXhOgmW2v/9uOpSjSnv0R4WcINftQrgjdKyEVFMau3ZZLYhVDCp/WgKTs5cRBpybz0JV4fEFimrDaO+u5QVk9eu0mwCAyFlyQxNVwd6Wpu1PlP0=
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
 Bharata B Rao <bharata@linux.ibm.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDk6NTk6MjdBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gTm8gb25lIGV2ZXIgY2hlY2tzIHRoaXMgZmxhZywgYW5kIHdlIGNvdWxkIGVh
c2lseSBnZXQgdGhhdCBpbmZvcm1hdGlvbgo+IGZyb20gdGhlIHBhZ2UgaWYgbmVlZGVkLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IFJldmlld2Vk
LWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5jIHwgMyArLS0KPiAgaW5jbHVkZS9saW51
eC9taWdyYXRlLmggICAgICAgICAgICAgICAgfCAxIC0KPiAgbW0vbWlncmF0ZS5jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCA0ICsrLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dA
bWVsbGFub3guY29tPgoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
