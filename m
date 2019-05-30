Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3909630058
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 18:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91E46E3BF;
	Thu, 30 May 2019 16:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150074.outbound.protection.outlook.com [40.107.15.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E126E15F;
 Thu, 30 May 2019 15:49:31 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5038.eurprd05.prod.outlook.com (20.177.52.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Thu, 30 May 2019 15:49:28 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1%6]) with mapi id 15.20.1943.016; Thu, 30 May 2019
 15:49:27 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Yuehaibing <yuehaibing@huawei.com>, =?iso-8859-1?Q?J=E9r=F4me_Glisse?=
 <jglisse@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Fix DEVICE_PRIVATE dependencies
Thread-Topic: [PATCH] drm/nouveau: Fix DEVICE_PRIVATE dependencies
Thread-Index: AQHU9Smp7DtPqq1csU6J+upeBQ7IX6aEDxgAgAAFFYA=
Date: Thu, 30 May 2019 15:49:27 +0000
Message-ID: <20190530154923.GJ13461@mellanox.com>
References: <20190417142632.12992-1-yuehaibing@huawei.com>
 <583de550-d816-f619-d402-688c87c86fe3@huawei.com>
In-Reply-To: <583de550-d816-f619-d402-688c87c86fe3@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR1501CA0010.namprd15.prod.outlook.com
 (2603:10b6:207:17::23) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb64e4a5-1883-4fa3-abde-08d6e516657f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB5038; 
x-ms-traffictypediagnostic: VI1PR05MB5038:
x-microsoft-antispam-prvs: <VI1PR05MB5038A0DBC9732A6345508206CF180@VI1PR05MB5038.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-forefront-prvs: 00531FAC2C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(396003)(39860400002)(366004)(376002)(189003)(199004)(53754006)(6486002)(110136005)(446003)(486006)(66446008)(53936002)(86362001)(14454004)(6512007)(478600001)(54906003)(7416002)(7736002)(81156014)(26005)(186003)(1076003)(8936002)(8676002)(4326008)(6436002)(3846002)(305945005)(33656002)(66556008)(5660300002)(6116002)(64756008)(81166006)(2616005)(73956011)(66476007)(2906002)(25786009)(102836004)(36756003)(71200400001)(71190400001)(66066001)(256004)(76176011)(99286004)(316002)(386003)(229853002)(68736007)(66946007)(14444005)(53546011)(6246003)(52116002)(11346002)(6506007)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5038;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mD+yXMynfy4cxpwEDWUiTZK3y7e3HTcdtyeyxxhGMJYJCRoGQjggi/MVCYWDaEZhTs6JRyaO65Im0wo83Z7roj+akgVuSIaSi/tUocwZyEnlBMIhH+kT540cISNX7AQnsgvYJxOWqxXlHrvHnDs+oNoF+mLvxbpKeoChDYV/HwBsqbk8TOgVfqHsmDPMhu6nXgF85ULOdp+55FuClaG6W9OBO40IuayZ60NDABOdE2ofDNbpHDLNr7SOhbnZXe4wQC2qSZ/6BrKjUsHVNxQBIo+HyQFVZGCs6lhpfcAKMCwljEFtq957iVez48KViXGjvLMCslgwnV1JN2Bh7tLJATJGvN0Wg3jzvcoPxTJWizt1z7WllEXvcnqizgfXvP4Dlzc9QgcNgtOaNRsA/V/msr+SYHruZjBesDW69tYjOxs=
Content-ID: <56987BA9B86175409FE65B63660189BB@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb64e4a5-1883-4fa3-abde-08d6e516657f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2019 15:49:27.8018 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5038
X-Mailman-Approved-At: Thu, 30 May 2019 16:46:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4VhIAMP+vYb+hX1wa84OBgkG1r0ptiv6LE3EMVT/A8=;
 b=ibTaG1qkyX1q/WC9GufXcj5fQ9YrBrvprCTD5LAO1Wc2FHhWIZoUParniw8vwjBcrytDod1DCmH0fV1Yp9uIvowVzkvQiu9UI7/N13K89YE56yGABhvIv10Rr2IEECHUZeTgynr+DAAkIDYMTJ5g7EgXLRUUlpYR19XxfwK5j1k=
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
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Leon Romanovsky <leonro@mellanox.com>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIFRodSwgTWF5IDMwLCAyMDE5IGF0IDExOjMxOjEyUE0gKzA4MDAsIFl1ZWhhaWJpbmcgd3Jv
dGU6Cj4gSGkgYWxsLAo+IAo+IEZyaWVuZGx5IHBpbmc6Cj4gCj4gV2hvIGNhbiB0YWtlIHRoaXM/
Cj4gCj4gT24gMjAxOS80LzE3IDIyOjI2LCBZdWUgSGFpYmluZyB3cm90ZToKPiA+IEZyb206IFl1
ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KPiA+IAo+ID4gRHVyaW5nIHJhbmRjb25m
aWcgYnVpbGRzLCBJIG9jY2FzaW9uYWxseSBydW4gaW50byBhbiBpbnZhbGlkIGNvbmZpZ3VyYXRp
b24KPiA+IAo+ID4gV0FSTklORzogdW5tZXQgZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBm
b3IgREVWSUNFX1BSSVZBVEUKPiA+ICAgRGVwZW5kcyBvbiBbbl06IEFSQ0hfSEFTX0hNTV9ERVZJ
Q0UgWz1uXSAmJiBaT05FX0RFVklDRSBbPW5dCj4gPiAgIFNlbGVjdGVkIGJ5IFt5XToKPiA+ICAg
LSBEUk1fTk9VVkVBVV9TVk0gWz15XSAmJiBIQVNfSU9NRU0gWz15XSAmJiBBUkNIX0hBU19ITU0g
Wz15XSAmJiBEUk1fTk9VVkVBVSBbPXldICYmIFNUQUdJTkcgWz15XQo+ID4gCj4gPiBtbS9tZW1v
cnkubzogSW4gZnVuY3Rpb24gYGRvX3N3YXBfcGFnZSc6Cj4gPiBtZW1vcnkuYzooLnRleHQrMHgy
NzU0KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZGV2aWNlX3ByaXZhdGVfZW50cnlfZmF1bHQn
Cj4gPiAKPiA+IGNvbW1pdCA1ZGEyNTA5MGFiMDQgKCJtbS9obW06IGtjb25maWcgc3BsaXQgSE1N
IGFkZHJlc3Mgc3BhY2UgbWlycm9yaW5nIGZyb20gZGV2aWNlIG1lbW9yeSIpCj4gPiBzcGxpdCBD
T05GSUdfREVWSUNFX1BSSVZBVEUgZGVwZW5kZW5jaWVzIGZyb20KPiA+IEFSQ0hfSEFTX0hNTSB0
byBBUkNIX0hBU19ITU1fREVWSUNFIGFuZCBaT05FX0RFVklDRSwKPiA+IHNvIGVuYWJsZSBEUk1f
Tk9VVkVBVV9TVk0gd2lsbCB0cmlnZ2VyIHRoaXMgd2FybmluZywKPiA+IGNhdXNlIGJ1aWxkaW5n
IGZhaWxlZC4KPiA+IAo+ID4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWku
Y29tPgo+ID4gRml4ZXM6IDVkYTI1MDkwYWIwNCAoIm1tL2htbToga2NvbmZpZyBzcGxpdCBITU0g
YWRkcmVzcyBzcGFjZSBtaXJyb3JpbmcgZnJvbSBkZXZpY2UgbWVtb3J5IikKPiA+IFNpZ25lZC1v
ZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KPiA+ICBkcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9LY29uZmlnIHwgMyArKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvS2NvbmZpZwo+
ID4gaW5kZXggMDBjZDlhYi4uOTllMzBjMSAxMDA2NDQKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L0tjb25maWcKPiA+IEBAIC03NCw3ICs3NCw4IEBAIGNvbmZpZyBEUk1fTk9VVkVB
VV9CQUNLTElHSFQKPiA+ICAKPiA+ICBjb25maWcgRFJNX05PVVZFQVVfU1ZNCj4gPiAgCWJvb2wg
IihFWFBFUklNRU5UQUwpIEVuYWJsZSBTVk0gKFNoYXJlZCBWaXJ0dWFsIE1lbW9yeSkgc3VwcG9y
dCIKPiA+IC0JZGVwZW5kcyBvbiBBUkNIX0hBU19ITU0KPiA+ICsJZGVwZW5kcyBvbiBBUkNIX0hB
U19ITU1fREVWSUNFCj4gPiArCWRlcGVuZHMgb24gWk9ORV9ERVZJQ0UKPiA+ICAJZGVwZW5kcyBv
biBEUk1fTk9VVkVBVQo+ID4gIAlkZXBlbmRzIG9uIFNUQUdJTkcKPiA+ICAJc2VsZWN0IEhNTV9N
SVJST1IKPiA+IAoKSSdtIGV4cGVjdGluZyB0byB0YWtlIGEgcGF0Y2ggbGlrZSB0aGlzIGludG8g
dGhlIG5ldyBobW0gZ2l0IHRyZWUgb25jZQpKZXJvbWUgc2VuZHMgaGlzIEZpbmFsIFNvbHV0aW9u
IGZvciB0aGUga2NvbmZpZyBwcm9ibGVtcy4KCk1heWJlIGl0IGlzIHRoaXMgcGF0Y2gsIEplcm9t
ZT8/CgpSZWdhcmRzLApKYXNvbiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
