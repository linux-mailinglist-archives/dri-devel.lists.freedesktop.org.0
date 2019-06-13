Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4915B455F1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A1E89824;
	Fri, 14 Jun 2019 07:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20060.outbound.protection.outlook.com [40.107.2.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F6D888D9;
 Thu, 13 Jun 2019 20:40:49 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5455.eurprd05.prod.outlook.com (20.177.201.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 13 Jun 2019 20:40:46 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1%6]) with mapi id 15.20.1987.012; Thu, 13 Jun 2019
 20:40:46 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: dev_pagemap related cleanups
Thread-Topic: dev_pagemap related cleanups
Thread-Index: AQHVIcx5DdVrUhs/HUiF5V2FmmsvzKaZ58OAgAAlLoA=
Date: Thu, 13 Jun 2019 20:40:46 +0000
Message-ID: <20190613204043.GD22062@mellanox.com>
References: <20190613094326.24093-1-hch@lst.de>
 <CAPcyv4jBdwYaiVwkhy6kP78OBAs+vJme1UTm47dX4Eq_5=JgSg@mail.gmail.com>
In-Reply-To: <CAPcyv4jBdwYaiVwkhy6kP78OBAs+vJme1UTm47dX4Eq_5=JgSg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM5PR0602CA0012.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::22) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de96dcdd-fcb6-4b31-c96c-08d6f03f6962
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR05MB5455; 
x-ms-traffictypediagnostic: VI1PR05MB5455:
x-microsoft-antispam-prvs: <VI1PR05MB5455783021F6B9AAA05E7D83CFEF0@VI1PR05MB5455.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(366004)(39860400002)(136003)(346002)(199004)(189003)(68736007)(53936002)(7116003)(14454004)(476003)(486006)(76176011)(1076003)(2616005)(256004)(14444005)(229853002)(8676002)(66476007)(66946007)(6436002)(66556008)(7416002)(6116002)(64756008)(446003)(81166006)(81156014)(11346002)(73956011)(6512007)(3846002)(8936002)(6486002)(66066001)(86362001)(2906002)(102836004)(6246003)(6916009)(478600001)(6506007)(66446008)(186003)(4326008)(52116002)(33656002)(36756003)(5660300002)(66574012)(99286004)(26005)(7736002)(71200400001)(71190400001)(316002)(25786009)(305945005)(54906003)(53546011)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5455;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VOUbwNTtQRybG06If3HGlhEeAdyRzVHyFE1PeYAnM2YST+XoV0HGXZmSRan2NLI4WzAL1uZHMOtxy2X19FOcN+ugIzEDUFaX/y9lsF432qn7eSAyrVCYonDHrej64NV4alsmCSSJokb9RspANzH4x63s7VqvMHLgzo59lUHDsWdAEVbzpL7WQ18EWRni5TbqLfFiUPRVpSCZGqmJDVxOTingKPJqTbNp+v0SquuxNy3Mex+3+W3QOi7ysRhyLQb0zSCh5J5QVp0cRn132iQGoWMQelu0ugQqizw44PX87UzQ2V2o6rwl6/4Hnvt21dLXxJjYf8VqxNV1nOX9BSxMnePDL//+83pg+owX+oZg6X73UgwJVYNPVw4bnFul+YoMR4T2/va4ViKQdFdOkUW3qT7Y3anPGP/LSkSZAo/2xrw=
Content-ID: <865564E19763524E9F69913C820BFA34@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de96dcdd-fcb6-4b31-c96c-08d6f03f6962
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 20:40:46.4819 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5455
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PX9Eys8Q8xmnOpn1Ekl1bpVYtyk5txyOqqCNrhyPFYU=;
 b=URF2uSJYN6xjfsDoOg3OcSWCsk/8ctWmC21ScNLKDpkwEtHJ77Vj0z41hA5Ec74JGDldBLZArLu5+S1sKmWbY1DMZNe7mhUfYpp2fx5Q/f3aOCCLDECz4wNM3EafC1Z9gcgvAOWNOJa9Jk5hWMKGL/4tbDvR5wOkPbeaKzUyz1g=
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTE6Mjc6MzlBTSAtMDcwMCwgRGFuIFdpbGxpYW1zIHdy
b3RlOg0KPiBPbiBUaHUsIEp1biAxMywgMjAxOSBhdCAyOjQzIEFNIENocmlzdG9waCBIZWxsd2ln
IDxoY2hAbHN0LmRlPiB3cm90ZToNCj4gPg0KPiA+IEhpIERhbiwgSsOpcsO0bWUgYW5kIEphc29u
LA0KPiA+DQo+ID4gYmVsb3cgaXMgYSBzZXJpZXMgdGhhdCBjbGVhbnMgdXAgdGhlIGRldl9wYWdl
bWFwIGludGVyZmFjZSBzbyB0aGF0DQo+ID4gaXQgaXMgbW9yZSBlYXNpbHkgdXNhYmxlLCB3aGlj
aCByZW1vdmVzIHRoZSBuZWVkIHRvIHdyYXAgaXQgaW4gaG1tDQo+ID4gYW5kIHRodXMgYWxsb3dp
bmcgdG8ga2lsbCBhIGxvdCBvZiBjb2RlDQo+ID4NCj4gPiBEaWZmc3RhdDoNCj4gPg0KPiA+ICAy
MiBmaWxlcyBjaGFuZ2VkLCAyNDUgaW5zZXJ0aW9ucygrKSwgODAyIGRlbGV0aW9ucygtKQ0KPiAN
Cj4gSG9vcmF5IQ0KPiANCj4gPiBHaXQgdHJlZToNCj4gPg0KPiA+ICAgICBnaXQ6Ly9naXQuaW5m
cmFkZWFkLm9yZy91c2Vycy9oY2gvbWlzYy5naXQgaG1tLWRldm1lbS1jbGVhbnVwDQo+IA0KPiBJ
IGp1c3QgcmVhbGl6ZWQgdGhpcyBjb2xsaWRlcyB3aXRoIHRoZSBkZXZfcGFnZW1hcCByZWxlYXNl
IHJld29yayBpbg0KPiBBbmRyZXcncyB0cmVlIChjb21taXQgaWRzIGJlbG93IGFyZSBmcm9tIG5l
eHQuZ2l0IGFuZCBhcmUgbm90IHN0YWJsZSkNCj4gDQo+IDQ0MjJlZTg0NzZmMCBtbS9kZXZtX21l
bXJlbWFwX3BhZ2VzOiBmaXggZmluYWwgcGFnZSBwdXQgcmFjZQ0KPiA3NzFmMDcxNGQwZGMgUENJ
L1AyUERNQTogdHJhY2sgcGdtYXAgcmVmZXJlbmNlcyBwZXIgcmVzb3VyY2UsIG5vdCBnbG9iYWxs
eQ0KPiBhZjM3MDg1ZGU5MDYgbGliL2dlbmFsbG9jOiBpbnRyb2R1Y2UgY2h1bmsgb3duZXJzDQo+
IGUwMDQ3ZmY4YWE3NyBQQ0kvUDJQRE1BOiBmaXggdGhlIGdlbl9wb29sX2FkZF92aXJ0KCkgZmFp
bHVyZSBwYXRoDQo+IDAzMTVkNDdkNmFlOSBtbS9kZXZtX21lbXJlbWFwX3BhZ2VzOiBpbnRyb2R1
Y2UgZGV2bV9tZW11bm1hcF9wYWdlcw0KPiAyMTY0NzVjN2VhYTggZHJpdmVycy9iYXNlL2RldnJl
czogaW50cm9kdWNlIGRldm1fcmVsZWFzZV9hY3Rpb24oKQ0KPiANCj4gQ09ORkxJQ1QgKGNvbnRl
bnQpOiBNZXJnZSBjb25mbGljdCBpbiB0b29scy90ZXN0aW5nL252ZGltbS90ZXN0L2lvbWFwLmMN
Cj4gQ09ORkxJQ1QgKGNvbnRlbnQpOiBNZXJnZSBjb25mbGljdCBpbiBtbS9obW0uYw0KPiBDT05G
TElDVCAoY29udGVudCk6IE1lcmdlIGNvbmZsaWN0IGluIGtlcm5lbC9tZW1yZW1hcC5jDQo+IENP
TkZMSUNUIChjb250ZW50KTogTWVyZ2UgY29uZmxpY3QgaW4gaW5jbHVkZS9saW51eC9tZW1yZW1h
cC5oDQo+IENPTkZMSUNUIChjb250ZW50KTogTWVyZ2UgY29uZmxpY3QgaW4gZHJpdmVycy9wY2kv
cDJwZG1hLmMNCj4gQ09ORkxJQ1QgKGNvbnRlbnQpOiBNZXJnZSBjb25mbGljdCBpbiBkcml2ZXJz
L252ZGltbS9wbWVtLmMNCj4gQ09ORkxJQ1QgKGNvbnRlbnQpOiBNZXJnZSBjb25mbGljdCBpbiBk
cml2ZXJzL2RheC9kZXZpY2UuYw0KPiBDT05GTElDVCAoY29udGVudCk6IE1lcmdlIGNvbmZsaWN0
IGluIGRyaXZlcnMvZGF4L2RheC1wcml2YXRlLmgNCj4gDQo+IFBlcmhhcHMgd2Ugc2hvdWxkIHB1
bGwgdGhvc2Ugb3V0IGFuZCByZXNlbmQgdGhlbSB0aHJvdWdoIGhtbS5naXQ/DQoNCkl0IGNvdWxk
IGJlIGRvbmUgLSBidXQgaG93IGJhZCBpcyB0aGUgY29uZmxpY3QgcmVzb2x1dGlvbj8NCg0KSSdk
IGJlIG1vcmUgY29tZm9ydGFibGUgdG8gdGFrZSBhIFBSIGZyb20geW91IHRvIG1lcmdlIGludG8g
aG1tLmdpdCwNCnJhdGhlciB0aGFuIHJhdyBwYXRjaGVzLCB0aGVuIGFwcGx5IENIJ3Mgc2VyaWVz
IG9uIHRvcC4gSSB0aGluay4NCg0KVGhhdCB3YXkgaWYgc29tZXRoaW5nIGdvZXMgd3JvbmcgeW91
IGNhbiBzZW5kIHlvdXIgUFIgdG8gTGludXMNCmRpcmVjdGx5Lg0KDQo+IEl0IGFsc28gdHVybnMg
b3V0IHRoZSBudmRpbW0gdW5pdCB0ZXN0cyBjcmFzaCB3aXRoIHRoaXMgc2lnbmF0dXJlIG9uDQo+
IHRoYXQgYnJhbmNoIHdoZXJlIGJhc2UgdjUuMi1yYzMgcGFzc2VzOg0KPiANCj4gICAgIEJVRzog
a2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSwgYWRkcmVzczogMDAwMDAwMDAwMDAwMDAw
OA0KPiAgICAgWy4uXQ0KPiAgICAgQ1BVOiAxNSBQSUQ6IDE0MTQgQ29tbTogbHQtbGlibmRjdGwg
VGFpbnRlZDogRyAgICAgICAgICAgT0UNCj4gNS4yLjAtcmMzKyAjMzM5OQ0KPiAgICAgSGFyZHdh
cmUgbmFtZTogUUVNVSBTdGFuZGFyZCBQQyAoaTQ0MEZYICsgUElJWCwgMTk5NiksIEJJT1MgMC4w
LjAgMDIvMDYvMjAxNQ0KPiAgICAgUklQOiAwMDEwOnBlcmNwdV9yZWZfa2lsbF9hbmRfY29uZmly
bSsweDFlLzB4MTgwDQo+ICAgICBbLi5dDQo+ICAgICBDYWxsIFRyYWNlOg0KPiAgICAgIHJlbGVh
c2Vfbm9kZXMrMHgyMzQvMHgyODANCj4gICAgICBkZXZpY2VfcmVsZWFzZV9kcml2ZXJfaW50ZXJu
YWwrMHhlOC8weDFiMA0KPiAgICAgIGJ1c19yZW1vdmVfZGV2aWNlKzB4ZjIvMHgxNjANCj4gICAg
ICBkZXZpY2VfZGVsKzB4MTY2LzB4MzcwDQo+ICAgICAgdW5yZWdpc3Rlcl9kZXZfZGF4KzB4MjMv
MHg1MA0KPiAgICAgIHJlbGVhc2Vfbm9kZXMrMHgyMzQvMHgyODANCj4gICAgICBkZXZpY2VfcmVs
ZWFzZV9kcml2ZXJfaW50ZXJuYWwrMHhlOC8weDFiMA0KPiAgICAgIHVuYmluZF9zdG9yZSsweDk0
LzB4MTIwDQo+ICAgICAga2VybmZzX2ZvcF93cml0ZSsweGYwLzB4MWEwDQo+ICAgICAgdmZzX3dy
aXRlKzB4YjcvMHgxYjANCj4gICAgICBrc3lzX3dyaXRlKzB4NWMvMHhkMA0KPiAgICAgIGRvX3N5
c2NhbGxfNjQrMHg2MC8weDI0MA0KDQpUb28gYmFkIHRoZSB0cmFjZSBkaWRuJ3Qgc2F5IHdoaWNo
IGRldm0gY2xlYW51cCB0cmlnZ2VyZWQgaXQuLiBEaWQNCmRldl9wYWdlbWFwX3BlcmNwdV9leGl0
IGdldCBjYWxsZWQgd2l0aCBhIE5VTEwgcGdtYXAtPnJlZiA/DQoNCkphc29uDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
