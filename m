Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8481E38560
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3D489A77;
	Fri,  7 Jun 2019 07:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140055.outbound.protection.outlook.com [40.107.14.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BC6891AA
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 15:25:52 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6333.eurprd05.prod.outlook.com (20.179.25.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Thu, 6 Jun 2019 15:25:49 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1%6]) with mapi id 15.20.1965.011; Thu, 6 Jun 2019
 15:25:49 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>
Subject: Re: RFC: Run a dedicated hmm.git for 5.3
Thread-Topic: RFC: Run a dedicated hmm.git for 5.3
Thread-Index: AQHVHHwepzoj9aeiT0uMK+ZOBPXi0w==
Date: Thu, 6 Jun 2019 15:25:49 +0000
Message-ID: <20190606152543.GE17392@mellanox.com>
References: <20190523155207.GC5104@redhat.com>
 <20190523163429.GC12159@ziepe.ca> <20190523173302.GD5104@redhat.com>
 <20190523175546.GE12159@ziepe.ca> <20190523182458.GA3571@redhat.com>
 <20190523191038.GG12159@ziepe.ca> <20190524064051.GA28855@infradead.org>
 <20190524124455.GB16845@ziepe.ca>
 <20190525155210.8a9a66385ac8169d0e144225@linux-foundation.org>
 <20190527191247.GA12540@ziepe.ca>
In-Reply-To: <20190527191247.GA12540@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR01CA0022.prod.exchangelabs.com (2603:10b6:208:10c::35)
 To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a638c50-562c-4409-f22b-08d6ea9340bd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB6333; 
x-ms-traffictypediagnostic: VI1PR05MB6333:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR05MB6333E902FD50A38DF264B3ABCF170@VI1PR05MB6333.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(136003)(376002)(39860400002)(366004)(199004)(189003)(43544003)(446003)(26005)(2616005)(476003)(11346002)(36756003)(186003)(486006)(6436002)(966005)(76176011)(14454004)(102836004)(6506007)(5660300002)(478600001)(1076003)(6306002)(386003)(52116002)(99286004)(54906003)(110136005)(86362001)(316002)(33656002)(8936002)(3846002)(6116002)(6246003)(66066001)(68736007)(305945005)(229853002)(6512007)(6486002)(66946007)(2906002)(53936002)(73956011)(66476007)(256004)(66556008)(71200400001)(71190400001)(7416002)(81156014)(8676002)(66446008)(4326008)(81166006)(64756008)(7736002)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6333;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AbJMCQcRGx9GTjWdfJZrJkodaWaHU/JEUcYmTQNuI1w1hmmo5HaPZy3bzn+RxLTsmKB0jVP1VQbc+d43iYsdABOBAIMEr+PtjtaBEvdAFdcPsDKQ+6DO9h2ebIQvO8hoR4BKKkEZkMXy0rXbyC8ttg3Btv1bAaeJRHu/eIqndvUulVfqWVvMIuAqQV325AsIPDHoQ1kOg7lazgufEpym7HhgzStKIDX4uVCOppK7EqQi8i03qsmqDwP/KNXZIj6r8Zh69frCkB4cLPnFQJpdxt4YjyUOe8bQTlatVlvhDKh9pjNZ7QrqohJdoXaTko913JGpSQSiX7hy+90BxykxTKbQX76IpD9XiKwGq1gnczsUXNsnegLddEcBdPVmZ+em85ZXCNwb/HKkYmU/3+qr78ma9nsCxBm9GB4q0qvHXeY=
Content-ID: <994523D7B122E1489B649951953089FD@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a638c50-562c-4409-f22b-08d6ea9340bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 15:25:49.2982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6333
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWcAHdRQnqzHGJAKFZ2q4k/hoMaigFKEFslTi5hvcF0=;
 b=iKCdZuFeCZfsiVUojWwWi4mal8IjuxvXWQpE5dHU4Rmio4RRjWH/hAOHy/xB7P66oIaBEaAY+rfYQIBHwaq+CyJkyPxjGEQS50Kva4mCMadlJ550q3Au751OvJlyAlL4BbcmppOjnRGuN8051tv8c+GP+c5HlPds9xqx8wqOvJA=
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
Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Doug Ledford <dledford@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Kaike Wan <kaike.wan@intel.com>,
 Christoph Hellwig <hch@infradead.org>, Leon Romanovsky <leonro@mellanox.com>,
 Jerome Glisse <jglisse@redhat.com>, Moni Shoua <monis@mellanox.com>,
 Artemy Kovalyov <artemyko@mellanox.com>, Dave Airlie <airlied@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMDQ6MTI6NDdQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFNhdCwgTWF5IDI1LCAyMDE5IGF0IDAzOjUyOjEwUE0gLTA3MDAsIEFuZHJl
dyBNb3J0b24gd3JvdGU6Cj4gPiBPbiBGcmksIDI0IE1heSAyMDE5IDA5OjQ0OjU1IC0wMzAwIEph
c29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPiB3cm90ZToKPiA+IAo+ID4gPiBOb3cgdGhhdCAt
bW0gbWVyZ2VkIHRoZSBiYXNpYyBobW0gQVBJIHNrZWxldG9uIEkgdGhpbmsgcnVubmluZyBsaWtl
Cj4gPiA+IHRoaXMgd291bGQgZ2V0IHVzIHF1aWNrbHkgdG8gdGhlIHBsYWNlIHdlIGFsbCB3YW50
OiBjb21wcmVoZW5zaXZlIGluIHRyZWUKPiA+ID4gdXNlcnMgb2YgaG1tLgo+ID4gPiAKPiA+ID4g
QW5kcmV3LCB3b3VsZCB0aGlzIGJlIGFjY2VwdGFibGUgdG8geW91Pwo+ID4gCj4gPiBTdXJlLiAg
UGxlYXNlIHRha2UgY2FyZSBub3QgdG8gcGVybWl0IHRoaXMgdG8gcmVkdWNlIHRoZSBhbW91bnQg
b2YKPiA+IGV4cG9zdXJlIGFuZCByZXZpZXcgd2hpY2ggdGhlIGNvcmUgSE1NIHBpZWNlcyBnZXQu
Cj4gCj4gQ2VydGFpbmx5LCB0aGFua3MgYWxsCj4gCj4gSmVyb21lOiBJIHN0YXJ0ZWQgYSBITU0g
YnJhbmNoIG9uIHY1LjItcmMyIGluIHRoZSByZG1hLmdpdCBoZXJlOgo+IAo+IGdpdDovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9yZG1hL3JkbWEuZ2l0Cj4gaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmRtYS9yZG1hLmdpdC9s
b2cvP2g9aG1tCgpJIGRpZCBhIGZpcnN0IHJvdW5kIG9mIGNvbGxlY3RpbmcgcGF0Y2hlcyBmb3Ig
aG1tLmdpdAoKQW5kcmV3LCBJJ20gY2hlY2tpbmcgbGludXgtbmV4dCBhbmQgdG8gc3RheSBjby1v
cmRpbmF0ZWQsIEkgc2VlIHRoZQpwYXRjaGVzIGJlbG93IGFyZSBpbiB5b3VyIHRyZWUgYW5kIG5v
dyBhbHNvIGluIGhtbS5naXQuIENhbiB5b3UgcGxlYXNlCmRyb3AgdGhlbSBmcm9tIHlvdXIgdHJl
ZT8gCgo1YjY5Mzc0MWRlMmFjZSBtbS9obW0uYzogc3VwcHJlc3MgY29tcGlsYXRpb24gd2Fybmlu
Z3Mgd2hlbiBDT05GSUdfSFVHRVRMQl9QQUdFIGlzIG5vdCBzZXQKYjI4NzBmYjg4MjU5OWEgbW0v
aG1tLmM6IG9ubHkgc2V0IEZBVUxUX0ZMQUdfQUxMT1dfUkVUUlkgZm9yIG5vbi1ibG9ja2luZwpk
ZmY3YmFiZjhhZTlmMSBtbS9obW0uYzogc3VwcG9ydCBhdXRvbWF0aWMgTlVNQSBiYWxhbmNpbmcK
CkkgY2hlY2tlZCB0aGF0IHRoZSBvdGhlciB0d28gcGF0Y2hlcyBpbiAtbmV4dCBhbHNvIHRvdWNo
aW5nIGhtbS5jIGFyZQpiZXN0IHN1aXRlZCB0byBnbyB0aHJvdWdoIHlvdXIgdHJlZToKCmE3NmI5
YjMxOGE3MTgwIG1tL2Rldm1fbWVtcmVtYXBfcGFnZXM6IGZpeCBmaW5hbCBwYWdlIHB1dCByYWNl
CmZjNjRjMDU4ZDAxYjk4IG1tL21lbXJlbWFwOiByZW5hbWUgYW5kIGNvbnNvbGlkYXRlIFNFQ1RJ
T05fU0laRQoKU3RlcGhlblI6IENhbiB5b3UgcGljayB1cCB0aGUgaG1tIGJyYW5jaCBmcm9tIHJk
bWEuZ2l0IGZvciBsaW51eC1uZXh0IGZvcgp0aGlzIGN5Y2xlPyBBcyBhYm92ZSB3ZSBhcmUgbW92
aW5nIHRoZSBwYXRjaGVzIGZyb20gLW1tIHRvIGhtbS5naXQsIHNvCnRoZXJlIHdpbGwgYmUgYSBj
b25mbGljdCBpbiAtbmV4dCB1bnRpbCBBbmRyZXcgYWRqdXN0cyBoaXMgdHJlZSwKdGhhbmtzIQoK
UmVnYXJkcywKSmFzb24KKGhhc2hlcyBhcmUgZnJvbSB0b2RheSdzIGxpbnV4LW5leHQpCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
