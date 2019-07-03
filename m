Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A98195DE83
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 09:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991CA6E0EC;
	Wed,  3 Jul 2019 07:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00049.outbound.protection.outlook.com [40.107.0.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874496E038;
 Wed,  3 Jul 2019 01:08:30 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6190.eurprd05.prod.outlook.com (20.178.123.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 01:08:27 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 01:08:27 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: dev_pagemap related cleanups v4
Thread-Topic: dev_pagemap related cleanups v4
Thread-Index: AQHVL9UU5cGGdRKLlkyPcV6XfRMxZaa1bVyAgAI+pYCAAE0OAIAAHuWA
Date: Wed, 3 Jul 2019 01:08:27 +0000
Message-ID: <20190703010823.GB11833@mellanox.com>
References: <20190701062020.19239-1-hch@lst.de>
 <20190701082517.GA22461@lst.de> <20190702184201.GO31718@mellanox.com>
 <CAPcyv4iWXJ-c7LahPD=Qt4RuDNTU7w_8HjsitDuj3cxngzb56g@mail.gmail.com>
In-Reply-To: <CAPcyv4iWXJ-c7LahPD=Qt4RuDNTU7w_8HjsitDuj3cxngzb56g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR0102CA0058.prod.exchangelabs.com
 (2603:10b6:208:25::35) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 666e2153-d0c6-48b5-99ee-08d6ff52f414
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB6190; 
x-ms-traffictypediagnostic: VI1PR05MB6190:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR05MB61903AF6C1A65E8369742AA3CFFB0@VI1PR05MB6190.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(199004)(189003)(36756003)(4326008)(33656002)(26005)(2616005)(81156014)(305945005)(86362001)(6506007)(966005)(53936002)(486006)(186003)(102836004)(446003)(14454004)(386003)(6916009)(6486002)(316002)(476003)(478600001)(81166006)(53546011)(11346002)(8676002)(68736007)(25786009)(8936002)(7416002)(5660300002)(66476007)(6246003)(6306002)(71200400001)(2906002)(64756008)(6512007)(66946007)(66556008)(66446008)(1076003)(73956011)(52116002)(6436002)(3846002)(229853002)(66066001)(76176011)(7736002)(99286004)(54906003)(14444005)(256004)(6116002)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6190;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tDKuuIfgR9oX45s9hP9f7523FVZuj/Cp4IDBxNigMSr5WEC2agQIzrEXUBuNboGMSlvz67S1Uv6KuO5ZVoYd5GYuM2F54yxs2sTTMi7FCmrslBqo7dj9at7q74+TdPen4Ou5eFR3mxXkZfyOMYDWnkaLgqzNL/2If2wmF9amG3XbUzJrrF2i9Y4zdvEfxHk9R6qJRkf1ORCx28U/T4g+NZc4f1kuljqQ7WijxNpAVCogMYiR2X1Bk/db8lPDR/VAJvnU79i6YYQsywnUHwhH1zw+GXfs5OX1quMtO1UbEOoC10CfEL+pXw4pjtS9lPIj4b+ktBwFtMnKhYrF4qAXJUgVjOMvu9C0TEJuKee9QFswmucNkvOOYZpnw8ASNXTTpgYjkkaU87VUc1nZzBDTTlMhEbysA2yhWNye1T9POjE=
Content-ID: <9433B9982DD5FE40BE697C702241BE2B@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 666e2153-d0c6-48b5-99ee-08d6ff52f414
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 01:08:27.1163 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6190
X-Mailman-Approved-At: Wed, 03 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYH8NoUBbuO2DOp2zCSNKmlTWAV3O/N7vZgO68ZXz/0=;
 b=XPpTI/dvpyr+KQdeVAbwUKBph62vq391kwQ9z8vUhHMjQELdyP2iVsuCI8V3ojKcwRycOSwBRa0cazWesE+wGLDs5A719Gw5wn0NidA7BnveoZaIU1uT97hcXtNLBJZmkCZhUoBuJVr2zyHN7bKMDy4j0+0ME2BA8zmaHzz82NM=
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
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMDIsIDIwMTkgYXQgMDQ6MTc6NDhQTSAtMDcwMCwgRGFuIFdpbGxpYW1zIHdy
b3RlOgo+IE9uIFR1ZSwgSnVsIDIsIDIwMTkgYXQgMTE6NDIgQU0gSmFzb24gR3VudGhvcnBlIDxq
Z2dAbWVsbGFub3guY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIEp1bCAwMSwgMjAxOSBhdCAx
MDoyNToxN0FNICswMjAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiA+ID4gQW5kIEkndmUg
ZGVtb25zdHJhdGVkIHRoYXQgSSBjYW4ndCBzZW5kIHBhdGNoIHNlcmllcy4uICBXaGlsZSB0aGlz
Cj4gPiA+IGhhcyBhbGwgdGhlIHJpZ2h0IHBhdGNoZXMsIGl0IGFsc28gaGFzIHRoZSBleHRyYSBw
YXRjaGVzIGFscmVhZHkKPiA+ID4gaW4gdGhlIGhtbSB0cmVlLCBhbmQgZm91ciBleHRyYSBwYXRj
aGVzIEkgd2FudGVkIHRvIHNlbmQgb25jZQo+ID4gPiB0aGlzIHNlcmllcyBpcyBtZXJnZWQuICBJ
J2xsIGdpdmUgdXAgZm9yIG5vdywgcGxlYXNlIHVzZSB0aGUgZ2l0Cj4gPiA+IHVybCBmb3IgYW55
dGhpbmcgc2VyaW91cywgYXMgaXQgY29udGFpbnMgdGhlIHJpZ2h0IHRoaW5nLgo+ID4KPiA+IE9r
YXksIEkgc29ydGVkIGl0IGFsbCBvdXQgYW5kIHRlbXBvcmFyaWx5IHB1dCBpdCBoZXJlOgo+ID4K
PiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9qZ3VudGhvcnBlL2xpbnV4L2NvbW1pdHMvaG1tCj4gPgo+
ID4gQml0IGludm9sdmVkIGpvYjoKPiA+IC0gVG9vayBJcmEncyB2NCBwYXRjaCBpbnRvIGhtbS5n
aXQgYW5kIGNvbmZpcm1lZCBpdCBtYXRjaGVzIHdoYXQKPiA+ICAgQW5kcmV3IGhhcyBpbiBsaW51
eC1uZXh0IGFmdGVyIGFsbCB0aGUgZml4dXBzCj4gPiAtIENoZWNrZWQgeW91ciBnaXRodWIgdjQg
YW5kIHRoZSB2MyB0aGF0IGhpdCB0aGUgbWFpbGluZyBsaXN0IHdlcmUKPiA+ICAgc3Vic3RhbnRp
YWxseSBzaW1pbGFyIChJIG5ldmVyIGRpZCBnZXQgYSBjbGVhbiB2NCkgYW5kIGxhcmdlbHkKPiA+
ICAgd2VudCB3aXRoIHRoZSBnaXRodWIgdmVyc2lvbgo+ID4gLSBCYXNlZCBDSCdzIHY0IHNlcmll
cyBvbiAtcmM3IGFuZCBwdXQgYmFjayB0aGUgcmVtb3ZhbCBodW5rIGluIHN3YXAuYwo+ID4gICBz
byBpdCBjb21waWxlcwo+ID4gLSBNZXJnZSdkIENIJ3Mgc2VyaWVzIHRvIGhtbS5naXQgYW5kIGZp
eGVkIGFsbCB0aGUgY29uZmxpY3RzIHdpdGggSXJhCj4gPiAgIGFuZCBSYWxwaCdzIHBhdGNoZXMg
KHN1Y2ggdGhhdCBzd2FwLmMgcmVtYWlucyB1bmNoYW5nZWQpCj4gPiAtIEFkZGVkIERhbidzIGFj
aydzIGFuZCB0ZXN0ZWQtYnkncwo+IAo+IExvb2tzIGdvb2QuIFRlc3QgbWVyZ2UgKHdpdGggc29t
ZSBjb2xsaXNpb25zLCBzZWUgYmVsb3cpIGFsc28gcGFzc2VzCj4gbXkgdGVzdCBzdWl0ZS4KCk9r
YXksIHB1Ymxpc2hlZCB0b3dhcmQgbGludXgtbmV4dCBub3cKCj4gPgo+ID4gSSB0aGluayB0aGlz
IGZhaXJseSBjbG9zZWx5IGZvbGxvd3Mgd2hhdCB3YXMgcG9zdGVkIHRvIHRoZSBtYWlsaW5nCj4g
PiBsaXN0Lgo+ID4KPiA+IEFzIGl0IHdhcyBtb3JlIHRoYW4gYSBzaW1wbGUgJ2dpdCBhbScsIEkn
bGwgbGV0IGl0IHNpdCBvbiBnaXRodWIgdW50aWwKPiA+IEkgaGVhciBPSydzIHRoZW4gSSdsbCBt
b3ZlIGl0IHRvIGtlcm5lbC5vcmcncyBobW0uZ2l0IGFuZCBpdCB3aWxsIGhpdAo+ID4gbGludXgt
bmV4dC4gMC1kYXkgc2hvdWxkIGFsc28gcnVuIG9uIHRoaXMgd2hvbGUgdGhpbmcgZnJvbSBteSBn
aXRodWIuCj4gPgo+ID4gV2hhdCBJIGtub3cgaXMgb3V0c3RhbmRpbmc6Cj4gPiAgLSBUaGUgY29u
ZmxpY3RpbmcgQVJNIHBhdGNoZXMsIEkgdW5kZXJzdGFuZCBBbmRyZXcgd2lsbCBoYW5kbGUgdGhl
c2UKPiA+ICAgIHBvc3QtbGludXgtbmV4dAo+ID4gIC0gVGhlIGNvbmZsaWN0IHdpdGggQU1EIEdQ
VSBpbiAtbmV4dCwgSSBhbSB3YWl0aW5nIHRvIGhlYXIgZnJvbSBBTUQKPiAKPiBKdXN0IGEgaGVh
ZHMgdXAgdGhhdCB0aGlzIGFsc28gY29sbGlkZXMgd2l0aCB0aGUgInN1Yi1zZWN0aW9uIiBwYXRj
aGVzCj4gaW4gQW5kcmV3J3MgdHJlZS4gVGhlIHJlc29sdXRpb24gaXMgc3RyYWlnaHRmb3J3YXJk
LCBtb3N0bHkganVzdAo+IGNvbGxpZGluZyB1cGRhdGVzIHRvIGFyY2hfe2FkZCxyZW1vdmV9X21l
bW9yeSgpIGNhbGwgc2l0ZXMgaW4KPiBrZXJuZWwvbWVtcmVtYXAuYyBhbmQgY29sbGlzaW9ucyB3
aXRoIHBnbWFwX2FsdG1hcCgpIHVzYWdlLgoKT2theSwgdGhhbmtzCgpKYXNvbgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
