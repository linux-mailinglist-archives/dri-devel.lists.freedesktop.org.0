Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BD74C804
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 09:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB206E4FE;
	Thu, 20 Jun 2019 07:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70085.outbound.protection.outlook.com [40.107.7.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736D66E451;
 Wed, 19 Jun 2019 19:27:28 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5072.eurprd05.prod.outlook.com (20.177.52.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.15; Wed, 19 Jun 2019 19:27:25 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1%6]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 19:27:25 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 18/22] mm: mark DEVICE_PUBLIC as broken
Thread-Topic: [PATCH 18/22] mm: mark DEVICE_PUBLIC as broken
Thread-Index: AQHVIcyVeqgMzBs0VkumwilsEzSkhqaZ/TwAgAACYgCAAAF6gIAAT5yAgAALIACACQqXgA==
Date: Wed, 19 Jun 2019 19:27:25 +0000
Message-ID: <20190619192719.GO9374@mellanox.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-19-hch@lst.de> <20190613194430.GY22062@mellanox.com>
 <a27251ad-a152-f84d-139d-e1a3bf01c153@nvidia.com>
 <20190613195819.GA22062@mellanox.com>
 <20190614004314.GD783@iweiny-DESK2.sc.intel.com>
 <d2b77ea1-7b27-e37d-c248-267a57441374@nvidia.com>
In-Reply-To: <d2b77ea1-7b27-e37d-c248-267a57441374@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQBPR0101CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::30) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 900ad4f4-9a37-403d-9297-08d6f4ec28b2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR05MB5072; 
x-ms-traffictypediagnostic: VI1PR05MB5072:
x-microsoft-antispam-prvs: <VI1PR05MB5072502328C7585990C51C52CFE50@VI1PR05MB5072.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(346002)(39860400002)(136003)(366004)(189003)(199004)(5660300002)(86362001)(6246003)(7736002)(73956011)(316002)(66476007)(71190400001)(7416002)(54906003)(486006)(1076003)(71200400001)(256004)(66556008)(2906002)(99286004)(26005)(11346002)(446003)(76176011)(476003)(52116002)(186003)(53546011)(6506007)(386003)(2616005)(36756003)(102836004)(25786009)(3846002)(8936002)(229853002)(6436002)(66946007)(6916009)(6486002)(68736007)(81166006)(53936002)(6116002)(66066001)(64756008)(81156014)(33656002)(66446008)(8676002)(4326008)(6512007)(478600001)(14454004)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5072;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: s0JMiyaM6v59K9Eqvq++39Arx4aDM+CpGKjs2X6UorK6bcpv6l9Q4i9tauNvj0vSZSD3N4mIT8Hy0RczR7OULw46AWpykaDPGF1OEg+O77QdgkpDWOpv6EWjxe0pahP7ur+CMqTY53LiG+BxjnFFCp8JQJtmb5bwiHUJegB+WQ8YHQ6cIuwuXKtyqf0J+vptYI6jTembRhhk2NbSxqeJ3aICqHn6qKizFRKk258+72b4as+ZsMq8T+L+kqMZ2lscGlebcSehAcXWxlWBgFCEtm5ZQ88/WBly85cxXZAolyF8V22GdtISRlQRpn9VBCgqKpJ2hvdBxWvhVfx0QzufxBaFBAPjRVRMNsw/QVIsTpXD2aPXpIJzN7yy81iT9PhiwC6koEHGMSJpMlOvS+4N3ZFn54BqDa6OSepntXF0w00=
Content-ID: <081C2DB7B7A13A4A93487CC051D6E961@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 900ad4f4-9a37-403d-9297-08d6f4ec28b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 19:27:25.5442 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5072
X-Mailman-Approved-At: Thu, 20 Jun 2019 07:13:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSRKc0hpLpMPKshog4wha+zcC6Sxgq2cZ5PlvZB0qoM=;
 b=ZSwtME/SMf2qmA+BpeVW3mHny8REA3FCMUxCHE8lRkkEMxElMjsQ1DX2cnJvGZGVJ8BbeL4b1n4axUNDLngO9Tr18RWshV7wZkZtMhndAHkT43IXAIrC7stLRS10BWy22PBb5aNUpDNdt5zSYXs70bV1ne5Av63H5Wf4DYzew6c=
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
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDY6MjM6MDRQTSAtMDcwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IE9uIDYvMTMvMTkgNTo0MyBQTSwgSXJhIFdlaW55IHdyb3RlOgo+ID4gT24gVGh1LCBK
dW4gMTMsIDIwMTkgYXQgMDc6NTg6MjlQTSArMDAwMCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+
ID4+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDEyOjUzOjAyUE0gLTA3MDAsIFJhbHBoIENhbXBi
ZWxsIHdyb3RlOgo+ID4+Pgo+IC4uLgo+ID4+IEh1bSwgc28gdGhlIG9ubHkgdGhpbmcgdGhpcyBj
b25maWcgZG9lcyBpcyBzaG9ydCBjaXJjdWl0IGhlcmU6Cj4gPj4KPiA+PiBzdGF0aWMgaW5saW5l
IGJvb2wgaXNfZGV2aWNlX3B1YmxpY19wYWdlKGNvbnN0IHN0cnVjdCBwYWdlICpwYWdlKQo+ID4+
IHsKPiA+PiAgICAgICAgIHJldHVybiBJU19FTkFCTEVEKENPTkZJR19ERVZfUEFHRU1BUF9PUFMp
ICYmCj4gPj4gICAgICAgICAgICAgICAgIElTX0VOQUJMRUQoQ09ORklHX0RFVklDRV9QVUJMSUMp
ICYmCj4gPj4gICAgICAgICAgICAgICAgIGlzX3pvbmVfZGV2aWNlX3BhZ2UocGFnZSkgJiYKPiA+
PiAgICAgICAgICAgICAgICAgcGFnZS0+cGdtYXAtPnR5cGUgPT0gTUVNT1JZX0RFVklDRV9QVUJM
SUM7Cj4gPj4gfQo+ID4+Cj4gPj4gV2hpY2ggaXMgY2FsbGVkIGFsbCBvdmVyIHRoZSBwbGFjZS4u
IAo+ID4gCj4gPiA8c2lnaD4gIHllcyBidXQgdGhlIGVhcmxpZXIgcGF0Y2g6Cj4gPiAKPiA+IFtQ
QVRDSCAwMy8yMl0gbW06IHJlbW92ZSBobW1fZGV2bWVtX2FkZF9yZXNvdXJjZQo+ID4gCj4gPiBS
ZW1vdmVzIHRoZSBvbmx5IHBsYWNlIHR5cGUgaXMgc2V0IHRvIE1FTU9SWV9ERVZJQ0VfUFVCTElD
Lgo+ID4gCj4gPiBTbyBJIHRoaW5rIGl0IGlzIG9rLiAgRnJhbmtseSBJIHdhcyB3b25kZXJpbmcg
aWYgd2Ugc2hvdWxkIHJlbW92ZSB0aGUgcHVibGljCj4gPiB0eXBlIGFsdG9nZXRoZXIgYnV0IGNv
bmNlcHR1YWxseSBpdCBzZWVtcyBvay4gIEJ1dCBJIGRvbid0IHNlZSBhbnkgdXNlcnMgb2YgaXQK
PiA+IHNvLi4uICBzaG91bGQgd2UgZ2V0IHJpZCBvZiBpdCBpbiB0aGUgY29kZSByYXRoZXIgdGhh
biB0dXJuaW5nIHRoZSBjb25maWcgb2ZmPwo+ID4gCj4gPiBJcmEKPiAKPiBUaGF0IHNlZW1zIHJl
YXNvbmFibGUuIEkgcmVjYWxsIHRoYXQgdGhlIGhvcGUgd2FzIGZvciB0aG9zZSBJQk0gUG93ZXIg
OQo+IHN5c3RlbXMgdG8gdXNlIF9QVUJMSUMsIGFzIHRoZXkgaGF2ZSBoYXJkd2FyZS1iYXNlZCBj
b2hlcmVudCBkZXZpY2UgKEdQVSkKPiBtZW1vcnksIGFuZCBzbyB0aGUgbWVtb3J5IHJlYWxseSBp
cyB2aXNpYmxlIHRvIHRoZSBDUFUuIEFuZCB0aGUgSUJNIHRlYW0KPiB3YXMgdGhpbmtpbmcgb2Yg
dGFraW5nIGFkdmFudGFnZSBvZiBpdC4gQnV0IEkgaGF2ZW4ndCBzZWVuIGFueXRoaW5nIG9uCj4g
dGhhdCBmcm9udCBmb3IgYSB3aGlsZS4KCkRvZXMgYW55b25lIGtub3cgd2hvIHRob3NlIHBlb3Bs
ZSBhcmUgYW5kIGNhbiB3ZSBlbmNvdXJhZ2UgdGhlbSB0bwpzZW5kIHNvbWUgcGF0Y2hlcz8gOikK
Ckphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
