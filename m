Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB2345611
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64AD48991D;
	Fri, 14 Jun 2019 07:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40083.outbound.protection.outlook.com [40.107.4.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2FD890BB;
 Thu, 13 Jun 2019 19:58:32 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6030.eurprd05.prod.outlook.com (20.178.127.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Thu, 13 Jun 2019 19:58:29 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1%6]) with mapi id 15.20.1987.012; Thu, 13 Jun 2019
 19:58:29 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH 18/22] mm: mark DEVICE_PUBLIC as broken
Thread-Topic: [PATCH 18/22] mm: mark DEVICE_PUBLIC as broken
Thread-Index: AQHVIcyVeqgMzBs0VkumwilsEzSkhqaZ/TwAgAACYgCAAAF6gA==
Date: Thu, 13 Jun 2019 19:58:29 +0000
Message-ID: <20190613195819.GA22062@mellanox.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-19-hch@lst.de> <20190613194430.GY22062@mellanox.com>
 <a27251ad-a152-f84d-139d-e1a3bf01c153@nvidia.com>
In-Reply-To: <a27251ad-a152-f84d-139d-e1a3bf01c153@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:c0::16) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c5c3b5b4-9397-4985-fe76-08d6f039811e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB6030; 
x-ms-traffictypediagnostic: VI1PR05MB6030:
x-microsoft-antispam-prvs: <VI1PR05MB60308FFB6145E73B56AB9897CFEF0@VI1PR05MB6030.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(136003)(346002)(396003)(39860400002)(189003)(199004)(76176011)(256004)(99286004)(3846002)(4326008)(68736007)(66556008)(73956011)(2906002)(66946007)(6246003)(66446008)(64756008)(386003)(6116002)(53546011)(6506007)(1076003)(52116002)(66476007)(86362001)(446003)(316002)(14454004)(6512007)(2616005)(53936002)(66066001)(81166006)(478600001)(7416002)(33656002)(8936002)(71200400001)(71190400001)(36756003)(11346002)(6916009)(476003)(8676002)(7736002)(102836004)(5660300002)(186003)(305945005)(26005)(54906003)(6486002)(6436002)(25786009)(229853002)(81156014)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6030;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +rHR4yNz2DiEAD3ZeK5Nywni7ynWym3Tv9AxgXTqs7Di54gyzHpnC7Sn53lpHimljqLCvlTHL5Fm2/whl2TetvZ99ChjzU5mbuPPtL02FmKHU0zbx+B+i4VSgdXjvGlXUqLbyM9ksoeaCT4y33yEK7ojwFJrCQWUD5yA00jKpXGEaxzkkJfYcOvllHmFWMfbP97VK3sdwn5bJiA1Gi+5jjKe5YOB/LWKqIcalEy9+SrI1xvBifgZfk6LMrnkLUl/lTQch+pO3n7OU3C/W678nu4HzLwKoqMocAI1GDI49RnhIkfUskKgPu2eiPme7cdk44FpI1AqD6Gd8axVEOSp8Q/0BEPaBRrMkvpp+K5DHbQLwcnmK1Dank3QkGM0Ju/kXiG19aAalZiYdRGuEXKVftwFo07S6QPKvYhDO0klfyw=
Content-ID: <E2A7F637FAC6984B88734C89A688CD72@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c3b5b4-9397-4985-fe76-08d6f039811e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 19:58:29.4725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6030
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2htE/EYsrky4UH8MwG+WJWY3xDNbfvqPNXq0yl06kE=;
 b=NwrQy10/EB/7iKUzBwiP0xmPlH7ZtdAlNMflQH1hNbn4/r+oHD5CfsY9MXBj7FAnXVrVuSaY6GulI3Vah/8X2MrMbltvr3EEYzYKmGvnmP5JLdsfZXTlSxHbW/YL8LUsjhMibWBRxFD2oe6UOpY8Bog/vkEf6sFBQ0wUOe4qK6o=
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
 Dan Williams <dan.j.williams@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTI6NTM6MDJQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gCj4gT24gNi8xMy8xOSAxMjo0NCBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+
ID4gT24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTE6NDM6MjFBTSArMDIwMCwgQ2hyaXN0b3BoIEhl
bGx3aWcgd3JvdGU6Cj4gPiA+IFRoZSBjb2RlIGhhc24ndCBiZWVuIHVzZWQgc2luY2UgaXQgd2Fz
IGFkZGVkIHRvIHRoZSB0cmVlLCBhbmQgZG9lc24ndAo+ID4gPiBhcHBlYXIgdG8gYWN0dWFsbHkg
YmUgdXNhYmxlLiAgTWFyayBpdCBhcyBCUk9LRU4gdW50aWwgZWl0aGVyIGEgdXNlcgo+ID4gPiBj
b21lcyBhbG9uZyBvciB3ZSBmaW5hbGx5IGdpdmUgdXAgb24gaXQuCj4gPiA+IAo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiA+ID4gICBtbS9LY29u
ZmlnIHwgMSArCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPiA+IAo+
ID4gPiBkaWZmIC0tZ2l0IGEvbW0vS2NvbmZpZyBiL21tL0tjb25maWcKPiA+ID4gaW5kZXggMGQy
YmE3ZTFmNDNlLi40MDZmYTQ1ZTllY2MgMTAwNjQ0Cj4gPiA+ICsrKyBiL21tL0tjb25maWcKPiA+
ID4gQEAgLTcyMSw2ICs3MjEsNyBAQCBjb25maWcgREVWSUNFX1BSSVZBVEUKPiA+ID4gICBjb25m
aWcgREVWSUNFX1BVQkxJQwo+ID4gPiAgIAlib29sICJBZGRyZXNzYWJsZSBkZXZpY2UgbWVtb3J5
IChsaWtlIEdQVSBtZW1vcnkpIgo+ID4gPiAgIAlkZXBlbmRzIG9uIEFSQ0hfSEFTX0hNTQo+ID4g
PiArCWRlcGVuZHMgb24gQlJPS0VOCj4gPiA+ICAgCXNlbGVjdCBITU0KPiA+ID4gICAJc2VsZWN0
IERFVl9QQUdFTUFQX09QUwo+ID4gCj4gPiBUaGlzIHNlZW1zIGEgYml0IGhhcnNoLCB3ZSBkbyBo
YXZlIGFub3RoZXIga2NvbmZpZyB0aGF0IHNlbGVjdHMgdGhpcwo+ID4gb25lIHRvZGF5Ogo+ID4g
Cj4gPiBjb25maWcgRFJNX05PVVZFQVVfU1ZNCj4gPiAgICAgICAgICBib29sICIoRVhQRVJJTUVO
VEFMKSBFbmFibGUgU1ZNIChTaGFyZWQgVmlydHVhbCBNZW1vcnkpIHN1cHBvcnQiCj4gPiAgICAg
ICAgICBkZXBlbmRzIG9uIEFSQ0hfSEFTX0hNTQo+ID4gICAgICAgICAgZGVwZW5kcyBvbiBEUk1f
Tk9VVkVBVQo+ID4gICAgICAgICAgZGVwZW5kcyBvbiBTVEFHSU5HCj4gPiAgICAgICAgICBzZWxl
Y3QgSE1NX01JUlJPUgo+ID4gICAgICAgICAgc2VsZWN0IERFVklDRV9QUklWQVRFCj4gPiAgICAg
ICAgICBkZWZhdWx0IG4KPiA+ICAgICAgICAgIGhlbHAKPiA+ICAgICAgICAgICAgU2F5IFkgaGVy
ZSBpZiB5b3Ugd2FudCB0byBlbmFibGUgZXhwZXJpbWVudGFsIHN1cHBvcnQgZm9yCj4gPiAgICAg
ICAgICAgIFNoYXJlZCBWaXJ0dWFsIE1lbW9yeSAoU1ZNKS4KPiA+IAo+ID4gTWF5YmUgaXQgc2hv
dWxkIGJlIGRlcGVuZHMgb24gU1RBR0lORyBub3QgYnJva2VuPwo+ID4gCj4gPiBvciBtYXliZSBu
b3V2ZWF1X3N2bSBkb2Vzbid0IGFjdHVhbGx5IG5lZWQgREVWSUNFX1BSSVZBVEU/Cj4gPiAKPiA+
IEphc29uCj4gCj4gSSB0aGluayB5b3UgYXJlIGNvbmZ1c2luZyBERVZJQ0VfUFJJVkFURSBmb3Ig
REVWSUNFX1BVQkxJQy4KPiBEUk1fTk9VVkVBVV9TVk0gZG9lcyB1c2UgREVWSUNFX1BSSVZBVEUg
YnV0IG5vdCBERVZJQ0VfUFVCTElDLgoKSW5kZWVkIHlvdSBhcmUgY29ycmVjdCwgbmV2ZXIgbWlu
ZAoKSHVtLCBzbyB0aGUgb25seSB0aGluZyB0aGlzIGNvbmZpZyBkb2VzIGlzIHNob3J0IGNpcmN1
aXQgaGVyZToKCnN0YXRpYyBpbmxpbmUgYm9vbCBpc19kZXZpY2VfcHVibGljX3BhZ2UoY29uc3Qg
c3RydWN0IHBhZ2UgKnBhZ2UpCnsKICAgICAgICByZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfREVW
X1BBR0VNQVBfT1BTKSAmJgogICAgICAgICAgICAgICAgSVNfRU5BQkxFRChDT05GSUdfREVWSUNF
X1BVQkxJQykgJiYKICAgICAgICAgICAgICAgIGlzX3pvbmVfZGV2aWNlX3BhZ2UocGFnZSkgJiYK
ICAgICAgICAgICAgICAgIHBhZ2UtPnBnbWFwLT50eXBlID09IE1FTU9SWV9ERVZJQ0VfUFVCTElD
Owp9CgpXaGljaCBpcyBjYWxsZWQgYWxsIG92ZXIgdGhlIHBsYWNlLi4gCgpTbywgeWVzLCB3ZSBy
ZWFsbHkgZG9uJ3Qgd2FudCBhbnkgZGlzdHJvIG9yIHNvbWV0aGluZyB0byB0dXJuIHRoaXMgb24K
dW50aWwgaXQgaGFzIGEgdXNlLgoKUmV2aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1l
bGxhbm94LmNvbT4KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
