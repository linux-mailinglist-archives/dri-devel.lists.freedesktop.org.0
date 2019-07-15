Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 412976A049
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 03:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CF46E04E;
	Tue, 16 Jul 2019 01:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::61e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88673895EE
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 12:29:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVahyFQQXIFokxA9t4v5RzQcMelocAbzN3xTlPEul7qdx+vx0o+kqihHSlZ4zAla2N06lxcIWhuu6RNwMFfljeeTik1WEOUUfkLUPtWHoJbWV73KXPauoc0qyAYr1pisVKQGVuOQ0rsYwmqegCEYnetz3LDKNPcr+WVm1OG+lpW8JkCgy6uWkX+ez6YzUVjbIf1jbkso5ojpWsS8qkbpsV6505LUHtZBbwia7Y29HRuS+ShNv5AzpkWM2ePbw+2nALjARG74G0wlAYVxnM8VJ3p/KzZMQ+zLgyGZIK0+iL/sMN/CJjxyOz2WBzlDSAF4drr2aa3iM8bcgEvqSrZEhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Akapq/9daGyVJ60ceakWNGGwz1EagQPDxIEO0hWhUpM=;
 b=f/Kg0YT0My7C4XlJYUNtxlpCoKNboC22txggh7mWucaQP0lgyILmTUWI7SHbDgt6lso3Q882L6rOAD4/+NydkxKp2M7iTcaVqwD11NgBjg2r+/zWGzfYNFM1QhmIeE60Izxd19pFMDIZ0WRWx8M1xhbK4uv+h1SQPTdIjTXjgabUgAT8tMSlLCQHEuxmJgr65JMBJWPVAKUcldnsy6B+XNbI9eMj28w+rHIuc4kn4v0fmfYMK0b71oAioNzSmMU5H+RHzWyN2XHd8TlND+E84nbiqRxHSNRwsDo/ecG+yJsLYsE/FGNhYx5WQJi0GWTzklHSvolJot8/miHbG76lvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB4800.eurprd05.prod.outlook.com (20.176.4.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 12:29:28 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 12:29:28 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: DRM pull for v5.3-rc1
Thread-Topic: DRM pull for v5.3-rc1
Thread-Index: AQHVOwjxvOBTsCZDkEWbf47t9QeYFQ==
Date: Mon, 15 Jul 2019 12:29:28 +0000
Message-ID: <20190715122924.GA15202@mellanox.com>
References: <CAPM=9tzJQ+26n_Df1eBPG1A=tXf4xNuVEjbG3aZj-aqYQ9nnAg@mail.gmail.com>
 <CAPM=9tx+CEkzmLZ-93GZmde9xzJ_rw3PJZxFu_pjZJc7KM5f-w@mail.gmail.com>
In-Reply-To: <CAPM=9tx+CEkzmLZ-93GZmde9xzJ_rw3PJZxFu_pjZJc7KM5f-w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR12CA0028.namprd12.prod.outlook.com
 (2603:10b6:208:a8::41) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39b432ae-8622-459d-d658-08d709201442
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB4800; 
x-ms-traffictypediagnostic: VI1PR05MB4800:
x-microsoft-antispam-prvs: <VI1PR05MB4800229D63E8D8F46822BF41CFCF0@VI1PR05MB4800.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(199004)(189003)(386003)(102836004)(6506007)(256004)(14444005)(26005)(7736002)(68736007)(8936002)(25786009)(478600001)(99286004)(1411001)(2906002)(305945005)(6246003)(8676002)(14454004)(486006)(71190400001)(54906003)(71200400001)(6116002)(81166006)(81156014)(4326008)(33656002)(76176011)(52116002)(3846002)(186003)(11346002)(53936002)(64756008)(446003)(86362001)(6436002)(1076003)(229853002)(66946007)(36756003)(66446008)(66476007)(5660300002)(6486002)(476003)(2616005)(66066001)(66556008)(6512007)(316002)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4800;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XvWuynTcGBBrOfp3GFfG94yLV2FH4VG5X3fXfSBTeZGcq8vBW95TMWRz5eB6inQqJJENO0NFfI/RmrdlVUkvRILFKLQumMjnIl+w4J/KACQocg+sc6x0rEBxRGfOZ7CddpCeNNKp8d936h26nGmA9APjkcDHequz73K1fd9N/K+2rClkIDNT4NA9F6lpBguEuvDfDvMUg7wyjvUEXKBwfiU8mjOiB8wfkvopyN4bC8I4paSkkNsaVY2n+1U/rpOO8LHqaQNnJ1XPvVSGjN4VqDJfuKGInNZjW/gqN6V2hJQjRqyBiSskru+w3DnEO8wx0znZ3gBo6z53V8/Jm6zJL7+EaUfFsDG0U8mQioK/VPB2KTLnPYuYStJXHjEJqeqxMDI/JwfDQivfIfemmknH8nxgoFow9UYI0y0gQr78IVY=
Content-ID: <8FEAD40FF44C9646ADFEFE6B81EBB6E0@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b432ae-8622-459d-d658-08d709201442
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 12:29:28.1841 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4800
X-Mailman-Approved-At: Tue, 16 Jul 2019 01:36:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Akapq/9daGyVJ60ceakWNGGwz1EagQPDxIEO0hWhUpM=;
 b=glASsluy9Ym4+EShVYM2XOc8iuWUlVZuEdTBA5MdEIbLc+Km+jV9mqGJnfPplMKD1xnAeD2ON7luPykCcQFv6ipOOJMQ4WqPWLDb6uJeWM1rp9Re56jQic0ADtMLksKaULGnITz2coPceBDW7MBPHkvFQ7EqsjxCtSGYOvo6DoM=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jerome Glisse <jglisse@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W3VyaywgaHRtbCBlbWFpbC4uIGZvcmdpdmUgdGhlIG1lc3NdCgpPbiBNb24sIEp1bCAxNSwgMjAx
OSBhdCAwNDo1OTozOVBNICsxMDAwLCBEYXZlIEFpcmxpZSB3cm90ZToKCj4gICAgICBWTXdhcmUg
aGFkIHNvbWUgbW0gaGVscGVycyBnbyBpbiB2aWEgbXkgdHJlZSAobG9va2luZyBiYWNrIEknbQo+
ICAgICAgbm90IHN1cmUgVGhvbWFzIHJlYWxseSBzZWN1cmVkIGVub3VnaCBhY2tzIG9uIHRoZXNl
LCBidXQgSSdtCgpJIHNhdyB0aG9zZSBwYXRjaGVzLCBob25lc3RseSBJIGNvdWxkbid0IGVudGly
ZWx5IHVuZGVyc3RhbmQgd2hhdApwcm9ibGVtIHRoZXkgd2VyZSB0cnlpbmcgdG8gYWRkcmVzcy4u
Cgo+ICAgICAgZ29pbmcgd2l0aCBpdCBmb3Igbm93IHVudGlsIEkgZ2V0IHB1c2ggYmFjaykuIFRo
ZXkgY29uZmxpY3RlZAo+ICAgICAgd2l0aCBvbmUgb2YgdGhlIG1tIGNsZWFudXBzIGluIHRoZSBo
bW0gdHJlZSwgSSd2ZSBwdXNoZWQgYQo+ICAgICAgcGF0Y2ggdG8gdGhlIHRvcCBvZiBteSBuZXh0
IHRvIGZpeCBtb3N0IG9mIHRoZSBmYWxsb3V0IGluIG15Cj4gICAgICB0cmVlLCBhbmQgdGhlIHJl
c3VsdGluZyBmaXh1cCBpcyB0byBwaWNrIHRoZSBjbG9zdXJlLT5wdGVmbgo+ICAgICAgaHVuayBh
bmQgYXBwbHkgc29tZXRoaW5nIGxpa2UgaW4gbW0vbWVtb3J5LmMKCkRpZCBJIG1lc3MgYSBub3Rp
ZmljYXRpb24gZnJvbSBTdGVwaGVuUiBpbiBsaW51eC1uZXh0PyBJIHdhcyB1bndhd2FyZQpvZiB0
aGlzIGNvbmZsaWN0PwoKVGhlICdobW0nIHRyZWUgaXMgc29tZXRoaW5nIEkgcmFuIHRvIHRyeSBh
bmQgaGVscCB3b3JrZmxvdyBpc3N1ZXMgbGlrZQp0aGlzLCBhcyBpdCBjb3VsZCBiZSBtZXJnZWQg
dG8gRFJNIGFzIGEgdG9waWMgYnJhbmNoIC0gbWF5YmUgY29uc2lkZXIKdGhpcyBmbG93IGluIGZ1
dHVyZT8KCkxpbnVzLCBkbyB5b3UgaGF2ZSBhbnkgYWR2aWNlIG9uIGhvdyBiZXN0IHRvIGhhbmRs
ZSBzaGFyaW5nIG1tCnBhdGNoZXM/IFRoZSBobW0uZ2l0IHdhcyBtaWxkbHkgcGFpbmZ1bCBhcyBp
dCBzaXRzIGJldHdlZW4gcXVpbHQgb24KdGhlIC1tbSBzaWRlIGFuZCB3aGF0IHNlZW1zIGxpa2Ug
J2Egd29ybGQgb2YgaW50ZXJlc3RpbmcgZ2l0IHRoaW5ncycKb24gdGhlIERSTSBzaWRlIChidXQg
bWF5YmUgSSBqdXN0IGRvbid0IGtub3cgZW5vdWdoIGFib3V0IERSTSkuCgo+IEBAIC0yMjAxLDcg
KzIxNjIsNyBAQCBzdGF0aWMgaW50IGFwcGx5X3RvX3BhZ2VfcmFuZ2Vfd3JhcHBlcihwdGVfdAo+
ICAgICAgKnB0ZSwKPiAgICAgICAgICAgICAgc3RydWN0IHBhZ2VfcmFuZ2VfYXBwbHkgKnByYSA9
Cj4gICAgICAgICAgICAgICAgICAgICAgY29udGFpbmVyX29mKHB0ZXIsIHR5cGVvZigqcHJhKSwg
cHRlcik7Cj4gICAgICAtICAgICAgIHJldHVybiBwcmEtPmZuKHB0ZSwgTlVMTCwgYWRkciwgcHJh
LT5kYXRhKTsKPiAgICAgICsgICAgICAgcmV0dXJuIHByYS0+Zm4ocHRlLCBhZGRyLCBwcmEtPmRh
dGEpOwo+ICAgICAgIH0KCkkgbG9va2VkIHRocm91Z2ggdGhpcyBhbmQgaXQgbG9va3MgT0sgdG8g
bWUsIHRoYW5rcwoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
