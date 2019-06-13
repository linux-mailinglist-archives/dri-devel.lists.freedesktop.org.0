Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F83455C6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26944896EB;
	Fri, 14 Jun 2019 07:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe02::623])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A41896E4;
 Thu, 13 Jun 2019 18:46:38 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB4701.eurprd05.prod.outlook.com (20.176.4.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Thu, 13 Jun 2019 18:46:36 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1%6]) with mapi id 15.20.1987.012; Thu, 13 Jun 2019
 18:46:36 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 02/22] mm: remove the struct hmm_device infrastructure
Thread-Topic: [PATCH 02/22] mm: remove the struct hmm_device infrastructure
Thread-Index: AQHVIcx635NBB7Z8DkeP0aiwq2XU+KaZ7QiA
Date: Thu, 13 Jun 2019 18:46:36 +0000
Message-ID: <20190613184631.GO22062@mellanox.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-3-hch@lst.de>
In-Reply-To: <20190613094326.24093-3-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::23) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e748266-6013-44cb-2451-08d6f02f765a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB4701; 
x-ms-traffictypediagnostic: VI1PR05MB4701:
x-microsoft-antispam-prvs: <VI1PR05MB47013CC710784AD316D44798CFEF0@VI1PR05MB4701.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(346002)(376002)(39860400002)(396003)(199004)(189003)(66556008)(305945005)(2616005)(476003)(54906003)(11346002)(8676002)(486006)(446003)(5660300002)(1076003)(64756008)(66476007)(66946007)(66446008)(86362001)(8936002)(36756003)(66066001)(81166006)(81156014)(73956011)(99286004)(229853002)(6512007)(4326008)(6916009)(386003)(478600001)(256004)(71190400001)(3846002)(2906002)(76176011)(14454004)(52116002)(102836004)(6116002)(6506007)(33656002)(186003)(26005)(6486002)(68736007)(7416002)(6246003)(25786009)(6436002)(7736002)(316002)(71200400001)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4701;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: G88QnbZ36FCyyTJ2ZfcHbffJ0GQh3bFvTCHaf2zR8pqVCi1LDB7+CL+El3nvKWgdu/iFQUyD78uJpeXN9987OemXcoF9Er8/LcElZsIfVhfRwVbjccuVRaIeehvTxYRLMWVEzcR/o4e4FldKcOVc9poTQwNp/jgyZ0HfEL8IsrNXDvJ7XIhkevcrwbqRj7kuwVCvuTW66hAIBhvfRIOpa3dfb6FLbY8YbDNh5d8jNlav9LNBhDjbZeXTuTf8PG1Rosp0LWh8hbbamrA77AxkORqOVq7tTqVoj4mQgrjouT6rGBIN4qYXzHUwO4LQxsNf+BJ09t6EfH+ysIufgj77LIZqcfVV+WVqIMB57vcvkp1AQQZ6mvkBdKGgK7F2LbCGmXi/3jDxfkSb6BPFgvpMWezYAqEUoFTQNnMxHT81ydY=
Content-ID: <547A0314023A5340818D48E18E9DA700@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e748266-6013-44cb-2451-08d6f02f765a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 18:46:36.2740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4701
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XcQHmpnLa8Ccm8n/NNb6h6pJP/b83WvVwKH4dVjrGI=;
 b=F2NGmmF8PcrSuKqYHZP/ltHNtTQ/3yXA1jxUOAv6zBo/PQnSoylORIuCAGTEg5bTKk5lnKFf0as+54Ck2eM3roPqwxGi69XuGjJnNgJRRGrex66U663ag2Zr/ob/qEYj8FEiAsc/evMyyzj2t89jw53MYPv/cMAfHehUy/IDIXc=
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
Cc: "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
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

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTE6NDM6MDVBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gVGhpcyBjb2RlIGlzIGEgdHJpdmlhbCB3cmFwcGVyIGFyb3VuZCBkZXZpY2Ug
bW9kZWwgaGVscGVycywgd2hpY2gKPiBzaG91bGQgaGF2ZSBiZWVuIGludGVncmF0ZWQgaW50byB0
aGUgZHJpdmVyIGRldmljZSBtb2RlbCB1c2FnZSBmcm9tCj4gdGhlIHN0YXJ0LiAgQXNzdW1pbmcg
aXQgYWN0dWFsbHkgaGFkIHVzZXJzLCB3aGljaCBpdCBuZXZlciBoYWQgc2luY2UKPiB0aGUgY29k
ZSB3YXMgYWRkZWQgbW9yZSB0aGFuIDEgMS8yIHllYXJzIGFnby4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAtLS0KPiAgaW5jbHVkZS9saW51eC9o
bW0uaCB8IDIwIC0tLS0tLS0tLS0tLQo+ICBtbS9obW0uYyAgICAgICAgICAgIHwgODAgLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMTAwIGRlbGV0aW9ucygtKQoKSSBoYXZlbid0IGxvb2tlZCBpbiBkZXRhaWwgYXQgdGhpcyBk
ZXZpY2UgbWVtb3J5IHN0dWZmLi4gQnV0IEkgZGlkCmNoZWNrIGEgYml0IHRocm91Z2ggdGhlIG1h
aWxpbmcgbGlzdCBhcmNoaXZlcyBmb3Igc29tZSBjbHVlIHdoYXQgdGhpcwp3YXMgc3VwcG9zZWQg
dG8gYmUgZm9yICh3b3csIHRoaXMgaXMgZnJvbSAyMDE2ISkKClRoZSBjb21taXQgdGhhdCBhZGRl
ZCB0aGlzIHNheXM6CiAgVGhpcyBpbnRyb2R1Y2UgYSBkdW1teSBITU0gZGV2aWNlIGNsYXNzIHNv
IGRldmljZSBkcml2ZXIgY2FuIHVzZSBpdCB0bwogIGNyZWF0ZSBobW1fZGV2aWNlIGZvciB0aGUg
c29sZSBwdXJwb3NlIG9mIHJlZ2lzdGVyaW5nIGRldmljZSBtZW1vcnkuCgpXaGljaCBJIGp1c3Qg
Y2FuJ3QgdW5kZXJzdGFuZCBhdCBhbGwuIAoKSWYgd2UgbmVlZCBhICdzdHJ1Y3QgZGV2aWNlJyBm
b3Igc29tZSAnZGV2aWNlIG1lbW9yeScgcHVycG9zZSB0aGVuIGl0CnByb2JhYmx5IG91Z2h0IHRv
IGJlIHRoZSAnc3RydWN0IHBjaV9kZXZpY2UnIGhvbGRpbmcgdGhlIEJBUiwgbm90IGEKZmFrZSBk
ZXZpY2UuCgpJIGFsc28gY2FuJ3QgY29tcHJlaGVuZCB3aHkgYSBzdXBwb3NlZCBmYWtlIGRldmlj
ZSB3b3VsZCBuZWVkIGEKY2hhcmRldiwgd2l0aCBhIHN0YW5hZHJkICdobW1fZGV2aWNlWCcgbmFt
ZSwgd2l0aG91dCBhbHNvIGRlZmluaW5nIGEKY29yZSBrZXJuZWwgQUJJIGZvciB0aGF0IGNoYXIg
ZGV2Li4KCklmIHRoaXMgY29tZXMgYmFjayBpdCBuZWVkcyBhIHByb3BlciBleHBsYW5hdGlvbiBh
bmQgcmV2aWV3LCB3aXRoIGEKdXNlci4KClJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpn
Z0BtZWxsYW5veC5jb20+CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
