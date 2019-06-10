Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D16E3C085
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 02:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C3C89137;
	Tue, 11 Jun 2019 00:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130079.outbound.protection.outlook.com [40.107.13.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5C089183;
 Mon, 10 Jun 2019 16:02:59 +0000 (UTC)
Received: from AM0PR05MB4130.eurprd05.prod.outlook.com (52.134.90.143) by
 AM0PR05MB4387.eurprd05.prod.outlook.com (52.134.93.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.13; Mon, 10 Jun 2019 16:02:56 +0000
Received: from AM0PR05MB4130.eurprd05.prod.outlook.com
 ([fe80::4825:8958:8055:def7]) by AM0PR05MB4130.eurprd05.prod.outlook.com
 ([fe80::4825:8958:8055:def7%3]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 16:02:56 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v2 hmm 11/11] mm/hmm: Remove confusing comment and logic
 from hmm_release
Thread-Topic: [PATCH v2 hmm 11/11] mm/hmm: Remove confusing comment and logic
 from hmm_release
Thread-Index: AQHVHJft+otwZ8rUPEekfSi3CzR0ZqaQuR+AgARZmwA=
Date: Mon, 10 Jun 2019 16:02:56 +0000
Message-ID: <20190610160252.GH18446@mellanox.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-12-jgg@ziepe.ca>
 <61ea869d-43d2-d1e5-dc00-cf5e3e139169@nvidia.com>
In-Reply-To: <61ea869d-43d2-d1e5-dc00-cf5e3e139169@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::34) To AM0PR05MB4130.eurprd05.prod.outlook.com
 (2603:10a6:208:57::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0456bf9-5aef-4511-cd81-08d6edbd19d8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR05MB4387; 
x-ms-traffictypediagnostic: AM0PR05MB4387:
x-microsoft-antispam-prvs: <AM0PR05MB4387F54CE3B8303BBA27A817CF130@AM0PR05MB4387.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(346002)(396003)(39860400002)(376002)(189003)(199004)(316002)(25786009)(2616005)(476003)(486006)(99286004)(76176011)(4326008)(66066001)(478600001)(52116002)(36756003)(11346002)(446003)(66946007)(186003)(6512007)(66476007)(26005)(6486002)(229853002)(66446008)(64756008)(386003)(6506007)(66556008)(53936002)(53546011)(102836004)(73956011)(68736007)(54906003)(6916009)(6436002)(305945005)(256004)(81166006)(7736002)(8936002)(2906002)(8676002)(81156014)(6246003)(71190400001)(71200400001)(6116002)(3846002)(86362001)(33656002)(1076003)(5660300002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR05MB4387;
 H:AM0PR05MB4130.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /XoWWl7DXZHkqt6HlSb0h/i3876cDXvgZJD7FRjHmDVQJC4j32FplncqgEl42kFVAZ21UO5yMzo+9aUjSa9MzSgERb4OdeF6NABWEWh/jDwuKvVK5u/M4s5Jh9QycDt00d5E7+4den8XeFui3NEzowflwyR0J7EMuzZlxv5H9SmfVBxXX7y3lRhXvxpQn7DsMvL6VWpVEFYQW/btyyTiGbNTEtZaIh9f7hOdCPkcydvKezjQzAkH6VVR6f4JWrfhZYjFEUE+7O6hLsAscYlbEhtitIzT5oEE9f3RQY3LfF2dRIt1hw5pX2pz7fpHYZQHrCg+AKpe6DI+ZcMrc/SDd497dYSniuK4axUed942M+cEUsmmB90jlgxxYQus0vGmdJULi6YnrC0pX08C3xggWhmm2Ii4hZwucXEF5wcBoPg=
Content-ID: <8C3BE8F336B51E4C8608A9C4C971BE76@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0456bf9-5aef-4511-cd81-08d6edbd19d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 16:02:56.0642 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB4387
X-Mailman-Approved-At: Tue, 11 Jun 2019 00:29:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=450d2MXVWodpENJheLwYn0Z7xWvqO7wr3qF4QWDO8sY=;
 b=kctyDxIfUDvoSeIPOePSVT3oHbQ3/3dDtOXCbB4D4/GE+Nai0EpzR0b+7w2Lgude1EulJskY2cIwuXFF5tBkBX5EUAVcsM+IjNX+2gkqkFTUIYjaLSkHD08hPwPRVxDe/K2VxSMq0wfuqMKyZmCVusOGejBp6nJo+eIvS0Izl14=
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDI6Mzc6MDdQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gCj4gT24gNi82LzE5IDExOjQ0IEFNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4g
PiBGcm9tOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4gPiAKPiA+IGhtbV9y
ZWxlYXNlKCkgaXMgY2FsbGVkIGV4YWN0bHkgb25jZSBwZXIgaG1tLiBvcHMtPnJlbGVhc2UoKSBj
YW5ub3QKPiA+IGFjY2lkZW50YWxseSB0cmlnZ2VyIGFueSBhY3Rpb24gdGhhdCB3b3VsZCByZWN1
cnNlIGJhY2sgb250bwo+ID4gaG1tLT5taXJyb3JzX3NlbS4KPiA+IAo+ID4gVGhpcyBmaXhlcyBh
IHVzZSBhZnRlci1mcmVlIHJhY2Ugb2YgdGhlIGZvcm06Cj4gPiAKPiA+ICAgICAgICAgQ1BVMCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ1BVMQo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBobW1fcmVsZWFzZSgpCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdXBfd3JpdGUoJmhtbS0+bWlycm9y
c19zZW0pOwo+ID4gICBobW1fbWlycm9yX3VucmVnaXN0ZXIobWlycm9yKQo+ID4gICAgZG93bl93
cml0ZSgmaG1tLT5taXJyb3JzX3NlbSk7Cj4gPiAgICB1cF93cml0ZSgmaG1tLT5taXJyb3JzX3Nl
bSk7Cj4gPiAgICBrZnJlZShtaXJyb3IpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgbWlycm9yLT5vcHMtPnJlbGVhc2UobWlycm9yKQo+ID4gCj4gPiBU
aGUgb25seSB1c2VyIHdlIGhhdmUgdG9kYXkgZm9yIG9wcy0+cmVsZWFzZSBpcyBhbiBlbXB0eSBm
dW5jdGlvbiwgc28gdGhpcwo+ID4gaXMgdW5hbWJpZ3VvdXNseSBzYWZlLgo+ID4gCj4gPiBBcyBh
IGNvbnNlcXVlbmNlIG9mIHBsdWdnaW5nIHRoaXMgcmFjZSBkcml2ZXJzIGFyZSBub3QgYWxsb3dl
ZCB0bwo+ID4gcmVnaXN0ZXIvdW5yZWdpc3RlciBtaXJyb3JzIGZyb20gd2l0aGluIGEgcmVsZWFz
ZSBvcC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFu
b3guY29tPgo+IAo+IEkgYWdyZWUgd2l0aCB0aGUgYW5hbHlzaXMgYWJvdmUgYnV0IEknbSBub3Qg
c3VyZSB0aGF0IHJlbGVhc2UoKSB3aWxsCj4gYWx3YXlzIGJlIGFuIGVtcHR5IGZ1bmN0aW9uLiBJ
dCBtaWdodCBiZSBtb3JlIGVmZmljaWVudCB0byB3cml0ZSBiYWNrCj4gYWxsIGRhdGEgbWlncmF0
ZWQgdG8gYSBkZXZpY2UgImluIG9uZSBwYXNzIiBpbnN0ZWFkIG9mIHJlbHlpbmcKPiBvbiB1bm1h
cF92bWFzKCkgY2FsbGluZyBobW1fc3RhcnRfcmFuZ2VfaW52YWxpZGF0ZSgpIHBlciBWTUEuCgpJ
IHRoaW5rIHdlIGhhdmUgdG8gZm9jdXMgb24gdGhlICpjdXJyZW50KiBrZXJuZWwgLSBhbmQgd2Ug
aGF2ZSB0d28KdXNlcnMgb2YgcmVsZWFzZSwgbm91dmVhdV9zdm0uYyBpcyBlbXB0eSBhbmQgYW1k
Z3B1X21uLmMgZG9lcwpzY2hlZHVsZV93b3JrKCkgLSBzbyBJIGJlbGlldmUgd2Ugc2hvdWxkIGdv
IGFoZWFkIHdpdGggdGhpcyBzaW1wbGUKc29sdXRpb24gdG8gdGhlIGFjdHVhbCByYWNlIHRvZGF5
IHRoYXQgYm90aCBvZiB0aG9zZSB3aWxsIHN1ZmZlciBmcm9tLgoKSWYgd2UgZmluZCBhIG5lZWQg
Zm9yIGEgbW9yZSBjb21wbGV4IHZlcnNpb24gdGhlbiBpdCBjYW4gYmUgZGViYXRlZAphbmQganVz
dGlmaWVkIHdpdGggcHJvcGVyIGNvbnRleHQuLi4KCk9rPwoKSmFzb24KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
