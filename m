Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8D971EFB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71DE6E34A;
	Tue, 23 Jul 2019 18:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140082.outbound.protection.outlook.com [40.107.14.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1C36E2D4;
 Tue, 23 Jul 2019 14:56:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KZ3ey2P0e5y8aqgx77XnaU/MNUPRQT3bxmxAw+9xfOLkMJcfBytL2RGjpIpGZKkjWtf23LJamsT6pTWN9MFkGquWbD59eN5unxPASFSx4e7Z92dL4YYU/x3OHBG16lqqsYP0U0FqZ+j7Jbg4c1t2/Sm/e3WnP5Gan27JO0ljyiEX9JG6HhLkYeFl7Uxc4tADq25DttekUKXeWxRSYMWJun1ys5twf1LiImg/EwQkx52j6LnawJ2bUaZufIZCI1qAevMdyr5uhRzLL9FUvJcGHy0ccX1zSzpNwhwg6T2dPAepgb+EMVAhRwVTqjPq5ZYf6pRBadFPQFOzz8ci0dWuRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKLrYPXEShueXftdvrzxZO5snWp5SaalgZzsLn2a6wg=;
 b=IhfYwTxhkl2RP3qTK0JtOROjLPAZbvXtVqDw95kt91WMXUgfJUBn3Xe93VUq5vMuOQjmum+Aa07wGvAJeUHKWNISM4QmYv9/lsicJFv3u0aaW687gDz2ZgSw+r2kGLUZ6VjX2Mxrem+BNM1SGpndpk1ac8ekejEhtjJQBC5lfIa5c8GI10xcPeFnYYjPirs5O6hZlUY3Doe3TRUbeYO1wraGeEAyNCbUXEiQ1JuJzI685AnZhIwFMW/dRrkhd5yG5C3H5S8AAvxM+4cZUFJXxTtm3FhH4ze4yqIC+g2XcnEKNXQ8oS8+5+ZqZeqDlRnQcKT0rdn2P9Xst/7lib0HIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB3311.eurprd05.prod.outlook.com (10.170.238.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Tue, 23 Jul 2019 14:56:24 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880%4]) with mapi id 15.20.2094.013; Tue, 23 Jul 2019
 14:56:24 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/6] nouveau: remove the block parameter to
 nouveau_range_fault
Thread-Topic: [PATCH 3/6] nouveau: remove the block parameter to
 nouveau_range_fault
Thread-Index: AQHVQHIUDnMs0tk2hUuxzK+Cwn7RDqbYTK4A
Date: Tue, 23 Jul 2019 14:56:24 +0000
Message-ID: <20190723145620.GK15331@mellanox.com>
References: <20190722094426.18563-1-hch@lst.de>
 <20190722094426.18563-4-hch@lst.de>
In-Reply-To: <20190722094426.18563-4-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR1501CA0028.namprd15.prod.outlook.com
 (2603:10b6:207:17::41) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 810b1f00-33f4-4691-d9a2-08d70f7dee7a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB3311; 
x-ms-traffictypediagnostic: VI1PR05MB3311:
x-microsoft-antispam-prvs: <VI1PR05MB331121DA3B64641E5898ED65CFC70@VI1PR05MB3311.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(189003)(199004)(71200400001)(71190400001)(256004)(8676002)(6116002)(3846002)(64756008)(76176011)(14454004)(6916009)(316002)(6506007)(86362001)(478600001)(6436002)(229853002)(5660300002)(6486002)(386003)(4744005)(99286004)(11346002)(25786009)(446003)(66066001)(1076003)(54906003)(7736002)(102836004)(52116002)(53936002)(305945005)(4326008)(476003)(2616005)(68736007)(66556008)(66476007)(8936002)(66946007)(81156014)(81166006)(33656002)(6512007)(486006)(2906002)(26005)(186003)(66446008)(36756003)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3311;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +U+aQ9ComUdtSu5ma3e9h0cA3v0Z+i4Ee4yWxNU9q57Aj8iNOVN5W+O/yavFbFty802oEecHj6JNe0y7xZrs7dikmR04JIGHQmoEK1afW5M869ko9msrOFp/eTkEv/tF2cJcXs77Q5XTboBjZMFEJ1GPGJHS1cw1R5tY1pe4XouRCABfWc7F135bNO+dJd1PDazO+KFAn7aT+bIJUQEcCs/zyaeiPLbCL8TZzcyp7J4Kj5dUoWrHwd5VTGQ6IVGFdtdRjb6WDD6E6Q1agtW14naa1yly6nNZLze+nrc7+q0vq9bA7WpfvFp6+N9O2FlSTcuX2dXrL828wT1edJ2L2CKXRo7cPPW4s2WIKaILS/K6z8XyrTF2FfjcWkwRnKzzwNlDQFZzvH4b0KukKVRZEy/FeXVN3ogGqpWDRpVrPaA=
Content-ID: <DF48CC2DF2A4274387A23969DFE1D1B1@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 810b1f00-33f4-4691-d9a2-08d70f7dee7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 14:56:24.3381 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3311
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKLrYPXEShueXftdvrzxZO5snWp5SaalgZzsLn2a6wg=;
 b=YkSM2M1bv+3btw+oF362T2E6s62dPdvex+P8nuOttQESkWjgQFqHXE5UKI5j8qO7HLAwIJh7Bos5DE1qiFFnWBjLLeDOjeqwbojFNWgFjKlsO5qOXJ7KlPJikBJv2S08V30MK2Z59FPYs3qgAJSw9G1kCxdShvQdzyNo+eEmpa4=
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

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMTE6NDQ6MjNBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gVGhlIHBhcmFtZXRlciBpcyBhbHdheXMgZmFsc2UsIHNvIHJlbW92ZSBpdCBh
cyB3ZWxsIGFzIHRoZSAtRUFHQUlOCj4gaGFuZGxpbmcgdGhhdCBjYW4gb25seSBoYXBwZW4gZm9y
IHRoZSBub24tYmxvY2tpbmcgY2FzZS4KCj8gRGlkIHRoZSBFQUdBSU4gaGFuZGxpbmcgZ2V0IHJl
bW92ZWQgaW4gdGhpcyBwYXRjaD8KCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcg
PGhjaEBsc3QuZGU+Cj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMgfCA3
ICsrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKCkNvZGUgc2VlbXMgZmluZQoKUmV2aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1l
bGxhbm94LmNvbT4KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
