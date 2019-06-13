Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 254D5455A5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:22:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3673C894A7;
	Fri, 14 Jun 2019 07:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0a::623])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26223892E6;
 Thu, 13 Jun 2019 19:55:31 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6030.eurprd05.prod.outlook.com (20.178.127.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Thu, 13 Jun 2019 19:55:27 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1%6]) with mapi id 15.20.1987.012; Thu, 13 Jun 2019
 19:55:27 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 20/22] mm: sort out the DEVICE_PRIVATE Kconfig mess
Thread-Topic: [PATCH 20/22] mm: sort out the DEVICE_PRIVATE Kconfig mess
Thread-Index: AQHVIcyZrF37VPU7NkqyJQqyYg9vCKaaAEUA
Date: Thu, 13 Jun 2019 19:55:27 +0000
Message-ID: <20190613195522.GZ22062@mellanox.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-21-hch@lst.de>
In-Reply-To: <20190613094326.24093-21-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0044.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::21) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd28a2a7-5003-4b8d-267b-08d6f03914bd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB6030; 
x-ms-traffictypediagnostic: VI1PR05MB6030:
x-microsoft-antispam-prvs: <VI1PR05MB6030B13E365564B4E5481A54CFEF0@VI1PR05MB6030.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(136003)(346002)(396003)(39860400002)(189003)(199004)(76176011)(256004)(99286004)(3846002)(4326008)(68736007)(66556008)(73956011)(2906002)(66946007)(6246003)(66446008)(64756008)(386003)(6116002)(6506007)(1076003)(52116002)(66476007)(86362001)(446003)(316002)(14454004)(6512007)(2616005)(53936002)(66066001)(81166006)(478600001)(7416002)(33656002)(8936002)(71200400001)(71190400001)(36756003)(11346002)(6916009)(476003)(8676002)(7736002)(102836004)(5660300002)(186003)(305945005)(26005)(54906003)(6486002)(6436002)(25786009)(229853002)(81156014)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6030;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oI2gqlYWTW8WwdfpP4D/HtS9tiaNqRomendZIt6T1TP2oZFYff5e2998HL5tpSaK7cNH6gZd4/lIxSd+EKK2fTKqWmwLTlJVdXcuBjcWTkTz9KEQskxp20EE9U0BRqDMR0FwZHhN62AgCAbdERMl1RU1ZOROE8LZpdIQtD1C6ZNaPFsGVelIaENnV6EnaR8Pf7SCavVu4AUI2+feMWh3iKfRw8Dg5MrUSc6gXz87xbseLSalBRKCpQ6ofubmbZblPq8kvFYrJrHnIkB9v1Z93u1EN/fsLZoFW4Mxh6sIushFOBVLUW80QyyZ3b7UkDAlytgtUU9BwBLMCeH2gvd5j0JvApf9927RIC8KbY+9mbyg6p8OhGfLoFDD7psiLq5klX259sKQdGTi6P2zyV3peyWyYcTPqly0XRmsXFoHZNc=
Content-ID: <9319F5409ED4434CA9F8E3BAE5D597B1@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd28a2a7-5003-4b8d-267b-08d6f03914bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 19:55:27.4904 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6030
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nEwJJyAiRP/kORjuK5/bDnzsGqocm4iUPsZxcYdbwzk=;
 b=Jy1yI5/VKqd/VgdOmHrINnydsU/WCKDluPxkYA1Pz4noysXmRZKw3SBDPqzLK/yjwFybM9JGMxuWlsXvvtPro52Nns4TPcFNPIlc6XAW5nVbPvxGFz9fU3JFZ7ei9xPNVNSEbgsgZJkrkh2H6OChaMY3OIWUynUKKUpny8L6w4I=
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

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTE6NDM6MjNBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gVGhlIFpPTkVfREVWSUNFIHN1cHBvcnQgZG9lc24ndCBkZXBlbmQgb24gYW55
dGhpbmcgSE1NIHJlbGF0ZWQsIGp1c3Qgb24KPiB2YXJpb3VzIGJpdHMgb2YgYXJjaCBzdXBwb3J0
IGFzIGluZGljYXRlZCBieSB0aGUgYXJjaGl0ZWN0dXJlLiAgQWxzbwo+IGRvbid0IHNlbGVjdCB0
aGUgb3B0aW9uIGZyb20gbm91dmVhdSBhcyBpdCBpc24ndCBwcmVzZW50IGluIG1hbnkgc2V0dXBz
LAo+IGFuZCBkZXBlbmQgb24gaXQgaW5zdGVhZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rv
cGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvS2NvbmZp
ZyB8IDIgKy0KPiAgbW0vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8IDUgKystLS0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L0tjb25maWcgYi9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9LY29uZmlnCj4gaW5kZXggZGJhMjYxM2Y3MTgwLi42MzAzZDIwM2FiMWQgMTAw
NjQ0Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvS2NvbmZpZwo+IEBAIC04NSwxMCAr
ODUsMTAgQEAgY29uZmlnIERSTV9OT1VWRUFVX0JBQ0tMSUdIVAo+ICBjb25maWcgRFJNX05PVVZF
QVVfU1ZNCj4gIAlib29sICIoRVhQRVJJTUVOVEFMKSBFbmFibGUgU1ZNIChTaGFyZWQgVmlydHVh
bCBNZW1vcnkpIHN1cHBvcnQiCj4gIAlkZXBlbmRzIG9uIEFSQ0hfSEFTX0hNTQo+ICsJZGVwZW5k
cyBvbiBERVZJQ0VfUFJJVkFURQo+ICAJZGVwZW5kcyBvbiBEUk1fTk9VVkVBVQo+ICAJZGVwZW5k
cyBvbiBTVEFHSU5HCj4gIAlzZWxlY3QgSE1NX01JUlJPUgo+IC0Jc2VsZWN0IERFVklDRV9QUklW
QVRFCj4gIAlkZWZhdWx0IG4KPiAgCWhlbHAKPiAgCSAgU2F5IFkgaGVyZSBpZiB5b3Ugd2FudCB0
byBlbmFibGUgZXhwZXJpbWVudGFsIHN1cHBvcnQgZm9yCgpCZW4sIEkgaGVhcmQgeW91IG1pZ2h0
IGhhdmUgYSBwYXRjaCBsaWtlIHRoaXMgaW4geW91ciB0cmVlLCBidXQgSQpkb24ndCB0aGluayBJ
IGNvdWxkIGZpbmQgeW91ciB0cmVlPz8gCgpEbyB5b3UgaGF2ZSBhbnkgbm91dmVhdS9LY29uZmln
IHBhdGNoZXMgdGhhdCBtaWdodCBjb25mbGljdD8gVGhhbmtzCgpEb2VzIHRoaXMgZml4IHRoZSBy
YW5kY29uZmlncyBmYWlsdXJlcyB0aGF0IGhhdmUgYmVlbiByZXBvcnRlZD8KCj4gZGlmZiAtLWdp
dCBhL21tL0tjb25maWcgYi9tbS9LY29uZmlnCj4gaW5kZXggNDA2ZmE0NWU5ZWNjLi40ZGJkNzE4
YzhjZjQgMTAwNjQ0Cj4gKysrIGIvbW0vS2NvbmZpZwo+IEBAIC02NzcsMTMgKzY3NywxMyBAQCBj
b25maWcgQVJDSF9IQVNfSE1NX01JUlJPUgo+ICAKPiAgY29uZmlnIEFSQ0hfSEFTX0hNTQo+ICAJ
Ym9vbAo+IC0JZGVmYXVsdCB5Cj4gIAlkZXBlbmRzIG9uIChYODZfNjQgfHwgUFBDNjQpCj4gIAlk
ZXBlbmRzIG9uIFpPTkVfREVWSUNFCj4gIAlkZXBlbmRzIG9uIE1NVSAmJiA2NEJJVAo+ICAJZGVw
ZW5kcyBvbiBNRU1PUllfSE9UUExVRwo+ICAJZGVwZW5kcyBvbiBNRU1PUllfSE9UUkVNT1ZFCj4g
IAlkZXBlbmRzIG9uIFNQQVJTRU1FTV9WTUVNTUFQCj4gKwlkZWZhdWx0IHkKCldoYXQgaXMgdGhl
IHJlYXNvbiB3ZSBoYXZlIHRoaXMgQVJDSCB0aGluZyBhbnlob3c/IERvZXMgaG1tIGhhdmUgYXJj
aApkZXBlbmRlbmNpZXMgc29tZXBsYWNlPwoKVGhhbmtzCkphc29uCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
