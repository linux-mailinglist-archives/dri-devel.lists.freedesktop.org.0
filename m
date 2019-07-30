Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F6F7BA46
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E83F6E683;
	Wed, 31 Jul 2019 07:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7670F6E5F0;
 Tue, 30 Jul 2019 17:53:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CT806lH3GJFKccQD1MdEtYa59TfzKVZas0pBNefAL7MGwFs+IXfUKXWKfKiEUqG2IWFORXEEHhkcN80KYnMtpN4PZdLMJLelcQm/22Wc1+Pv1m3t/694c47Zjv2XYweXeTPEuG4eOn/Cp1ltLvC0FfQwh9FmW0vWC9XuzohqNdIuMECDei/XMjbOUIDyYZV0i6mv/MUqtYOwz/LKkQKfudSTNHcKQVgpthC5W0FmrSxrWivuC93ebpE40hRE/wmsN0fYkiKMZEPLuj2Xmetrdw9JDp4BwdnB9BHOkgGa0HfK0qikdDCMmWavw0ycDVieML3IUUzT1EL6tnDWe0glAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svBQypctoSakaJxDr/47kKSOg5ovdqk45jRwEu4qKbc=;
 b=Xyl0QzWvTn9K/PgDrSnOfnN1Metsv/zKFRdDxdgrdjkWfLJ4EFSyhkswpi6g0ctqWd3cJa12jhmb8DUxktP2tWvG2x728v7zgldFnE/NYyVuZ8yUWkpXKU/ijijO4YKNkSvLVR17pE54eTZbHqrEoU8DgJ6Wvdmo5bLdSihDUx55RD/eKn+DJMUY9Ze24WPPZNM9nb/vhzHwI41ereDwiABixOtmZF9itGrDHrlBe1N35Y+MDiQrlv/aQyeOhj055449iQEb6HLVRhXH5RChz61652KK+9b6R7C6qAs94zbXEXu1tW+wqIwJu/b+kDyTDmI7ehZi3aqrfs13n124kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6127.eurprd05.prod.outlook.com (20.178.205.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Tue, 30 Jul 2019 17:53:14 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 17:53:14 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/13] mm: cleanup the hmm_vma_handle_pmd stub
Thread-Topic: [PATCH 11/13] mm: cleanup the hmm_vma_handle_pmd stub
Thread-Index: AQHVRpsFqcopldMqYEmw+Nzxjc71m6bjchWA
Date: Tue, 30 Jul 2019 17:53:14 +0000
Message-ID: <20190730175309.GN24038@mellanox.com>
References: <20190730055203.28467-1-hch@lst.de>
 <20190730055203.28467-12-hch@lst.de>
In-Reply-To: <20190730055203.28467-12-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQBPR0101CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::47) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a86e21db-ce58-4552-20a6-08d71516cb53
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB6127; 
x-ms-traffictypediagnostic: VI1PR05MB6127:
x-microsoft-antispam-prvs: <VI1PR05MB6127DF35F7C611722F89A276CFDC0@VI1PR05MB6127.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(199004)(189003)(6506007)(6486002)(2906002)(256004)(476003)(11346002)(229853002)(66066001)(446003)(6436002)(25786009)(486006)(2616005)(86362001)(6916009)(305945005)(7416002)(81166006)(8676002)(81156014)(316002)(99286004)(1076003)(7736002)(8936002)(4326008)(54906003)(386003)(33656002)(6512007)(71200400001)(71190400001)(5660300002)(6116002)(3846002)(6246003)(186003)(478600001)(76176011)(68736007)(52116002)(14454004)(36756003)(66446008)(53936002)(64756008)(66556008)(66476007)(26005)(102836004)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6127;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eMqyxStZBZXBfI7QOYbRdCnQWZbklIeusgJmFjsEOIO5UawNseLehFkPAB+PnBPfGkBQoOyco5nEy+/0Bb1opqHO3IPX6n2Wx1gjcMjXSMMWaWCQX9u6fdGZ+XR2QGrqiwR7ipGZxNYBiqIsxkVKeXtnRnLdwkTWwIeKnTUAI88LJ7gGpii6LuqBceQu51tTKFHLDsAl/K2pVhyKp+1tNNvN2RNv+syEoL0XlZ1tGjtz4YJ+jEEM+lexqBmMSTAR1LqM0Z8fX9kYXouHw0M7BK7hC2uAoCPZ8ky13fy7a9bHhps2QjrPbqZ8X/NPkNN7Lkve+zgWk7cT1tylCHPSg+G4Ips+UH5tDuIwU+op8H/wlrD5Jzh1vah+ik6M3rNSf8ZxuTE43QEHJiGAVWCvJTY+amLgF0/Bg/rQuojOfrA=
Content-ID: <EC3900854AA3CC4983AC1C9EED4B06BC@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a86e21db-ce58-4552-20a6-08d71516cb53
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 17:53:14.2580 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6127
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svBQypctoSakaJxDr/47kKSOg5ovdqk45jRwEu4qKbc=;
 b=N4HQWp2clWmIY6kC/cFpcFbUva8KgFw4ye84Wigpj6+tFdnR44iE6vUc97vpPTw0gNAMhO6TKu2UHXIYadMNudLiWkw9h6pMFARZIi4KlWYs8iNlOrEDoDb9hg0cbwupovJeYsHloI8yDlUXblEr2rTUGR7jgjp+iPiwqE09S5E=
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

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDg6NTI6MDFBTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gU3R1YiBvdXQgdGhlIHdob2xlIGZ1bmN0aW9uIHdoZW4gQ09ORklHX1RSQU5T
UEFSRU5UX0hVR0VQQUdFIGlzIG5vdCBzZXQKPiB0byBtYWtlIHRoZSBmdW5jdGlvbiBlYXNpZXIg
dG8gcmVhZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5k
ZT4KPiAgbW0vaG1tLmMgfCAxOCArKysrKysrKystLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbW0vaG1t
LmMgYi9tbS9obW0uYwo+IGluZGV4IDRkM2JkNDFiNjUyMi4uZjRlOTBlYTU3NzlmIDEwMDY0NAo+
ICsrKyBiL21tL2htbS5jCj4gQEAgLTQ1NSwxMyArNDU1LDEwIEBAIHN0YXRpYyBpbmxpbmUgdWlu
dDY0X3QgcG1kX3RvX2htbV9wZm5fZmxhZ3Moc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsIHBtZF90
IHBtZCkKPiAgCQkJCXJhbmdlLT5mbGFnc1tITU1fUEZOX1ZBTElEXTsKPiAgfQo+ICAKPiAtc3Rh
dGljIGludCBobW1fdm1hX2hhbmRsZV9wbWQoc3RydWN0IG1tX3dhbGsgKndhbGssCj4gLQkJCSAg
ICAgIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAtCQkJICAgICAgdW5zaWduZWQgbG9uZyBlbmQsCj4g
LQkJCSAgICAgIHVpbnQ2NF90ICpwZm5zLAo+IC0JCQkgICAgICBwbWRfdCBwbWQpCj4gLXsKPiAg
I2lmZGVmIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRQo+ICtzdGF0aWMgaW50IGhtbV92bWFf
aGFuZGxlX3BtZChzdHJ1Y3QgbW1fd2FsayAqd2FsaywgdW5zaWduZWQgbG9uZyBhZGRyLAo+ICsJ
CXVuc2lnbmVkIGxvbmcgZW5kLCB1aW50NjRfdCAqcGZucywgcG1kX3QgcG1kKQo+ICt7Cj4gIAlz
dHJ1Y3QgaG1tX3ZtYV93YWxrICpobW1fdm1hX3dhbGsgPSB3YWxrLT5wcml2YXRlOwo+ICAJc3Ry
dWN0IGhtbV9yYW5nZSAqcmFuZ2UgPSBobW1fdm1hX3dhbGstPnJhbmdlOwo+ICAJc3RydWN0IGRl
dl9wYWdlbWFwICpwZ21hcCA9IE5VTEw7Cj4gQEAgLTQ5MCwxMSArNDg3LDE0IEBAIHN0YXRpYyBp
bnQgaG1tX3ZtYV9oYW5kbGVfcG1kKHN0cnVjdCBtbV93YWxrICp3YWxrLAo+ICAJCXB1dF9kZXZf
cGFnZW1hcChwZ21hcCk7Cj4gIAlobW1fdm1hX3dhbGstPmxhc3QgPSBlbmQ7Cj4gIAlyZXR1cm4g
MDsKPiAtI2Vsc2UKPiAtCS8qIElmIFRIUCBpcyBub3QgZW5hYmxlZCB0aGVuIHdlIHNob3VsZCBu
ZXZlciByZWFjaCB0aGlzIAoKVGhpcyBvbGQgY29tbWVudCBzYXlzIHdlIHNob3VsZCBuZXZlciBn
ZXQgaGVyZQoKPiArfQo+ICsjZWxzZSAvKiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UgKi8K
PiArc3RhdGljIGludCBobW1fdm1hX2hhbmRsZV9wbWQoc3RydWN0IG1tX3dhbGsgKndhbGssIHVu
c2lnbmVkIGxvbmcgYWRkciwKPiArCQl1bnNpZ25lZCBsb25nIGVuZCwgdWludDY0X3QgKnBmbnMs
IHBtZF90IHBtZCkKPiArewo+ICAJcmV0dXJuIC1FSU5WQUw7CgpTbyBjb3VsZCB3ZSBqdXN0IGRv
CiAgICNkZWZpbmUgaG1tX3ZtYV9oYW5kbGVfcG1kIE5VTEwKCj8KCkF0IHRoZSB2ZXJ5IGxlYXN0
IHRoaXMgc2VlbXMgbGlrZSBhIFdBUk5fT04gdG9vPwoKSmFzb24KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
