Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1A15DE76
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 09:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E2A6E0D7;
	Wed,  3 Jul 2019 07:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20082.outbound.protection.outlook.com [40.107.2.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D97F6E02F;
 Tue,  2 Jul 2019 18:42:10 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5855.eurprd05.prod.outlook.com (20.178.125.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 18:42:07 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 18:42:07 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: dev_pagemap related cleanups v4
Thread-Topic: dev_pagemap related cleanups v4
Thread-Index: AQHVL9UU5cGGdRKLlkyPcV6XfRMxZaa1bVyAgAI+pYA=
Date: Tue, 2 Jul 2019 18:42:07 +0000
Message-ID: <20190702184201.GO31718@mellanox.com>
References: <20190701062020.19239-1-hch@lst.de> <20190701082517.GA22461@lst.de>
In-Reply-To: <20190701082517.GA22461@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: QB1PR01CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::33) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3e918f6-e7b1-45d3-220d-08d6ff1cfc06
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB5855; 
x-ms-traffictypediagnostic: VI1PR05MB5855:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR05MB5855D9FC2C87AE8EDF4F3360CFF80@VI1PR05MB5855.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(189003)(199004)(36756003)(305945005)(7736002)(6246003)(2906002)(54906003)(64756008)(81156014)(8676002)(8936002)(86362001)(81166006)(53936002)(316002)(6916009)(68736007)(478600001)(7416002)(3846002)(229853002)(5660300002)(6486002)(66066001)(102836004)(6506007)(66446008)(6512007)(14444005)(26005)(4326008)(25786009)(99286004)(186003)(33656002)(14454004)(486006)(446003)(476003)(6116002)(256004)(6306002)(11346002)(1076003)(6436002)(66476007)(76176011)(73956011)(966005)(52116002)(71200400001)(66946007)(386003)(66556008)(71190400001)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5855;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uxvz6FxwQNsbgdBscCEIRaUYaJ9Hx5UYarazHW+5NehM9eLqQYvVoI1KKwDxw/TefzXSdN5/4xxaq2D7Tani/hQ3Ba46KvDWFZX1MzCawz6jHovyW1WbVATRJPe/6oCfFCi3u7vgRuAnaIKDN7CqC0ljSMhNokZQnmPfYTlZjMpHjSkEb/fv3JDQ1CElySfqAL/l4SpYJpExh8oDwUQRFHHntindvjHxrlA3vnEVyvFJ3u9/MyorpuyISuMH3O9fpPEFzvbkZ+C/6mcbz2FnOogmpZQUZXV8McdcqbNVN5fOXX29ykI848fp6PhT8GI+2FA8t3lq6/klVApz+1NqJaUYSLnxp43VAin0GArLmHF+KBQlgy2AbPkodq7v9nnCYT3QUUxkXF0uDyCQgO7rpgim7bFHYuOpyFu69U5lnyA=
Content-ID: <ADE83ECAC2BC474EA837455494A5DDBE@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e918f6-e7b1-45d3-220d-08d6ff1cfc06
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 18:42:07.4459 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5855
X-Mailman-Approved-At: Wed, 03 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+FoI6vpCgiLSBqPMjFHBUD4fTkpXFG2F39LPBhxl74=;
 b=I9ohJ6GNRLW+Zm+ooghClKVijPw+7yhdPymyZ9UYfnb4h8l6cgxmEgeOCdNbseE8x/L9Ge3wh5JFWVDJkBobwtg4AMDNxisbgOSckJW6DEFsDhCpj4Vvnc0r7ERyJeLyh4zmpM5zcIi36u7IFgX/RRdLh9hX6jYVNuPMYsv81uA=
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
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMDEsIDIwMTkgYXQgMTA6MjU6MTdBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gQW5kIEkndmUgZGVtb25zdHJhdGVkIHRoYXQgSSBjYW4ndCBzZW5kIHBhdGNo
IHNlcmllcy4uICBXaGlsZSB0aGlzCj4gaGFzIGFsbCB0aGUgcmlnaHQgcGF0Y2hlcywgaXQgYWxz
byBoYXMgdGhlIGV4dHJhIHBhdGNoZXMgYWxyZWFkeQo+IGluIHRoZSBobW0gdHJlZSwgYW5kIGZv
dXIgZXh0cmEgcGF0Y2hlcyBJIHdhbnRlZCB0byBzZW5kIG9uY2UKPiB0aGlzIHNlcmllcyBpcyBt
ZXJnZWQuICBJJ2xsIGdpdmUgdXAgZm9yIG5vdywgcGxlYXNlIHVzZSB0aGUgZ2l0Cj4gdXJsIGZv
ciBhbnl0aGluZyBzZXJpb3VzLCBhcyBpdCBjb250YWlucyB0aGUgcmlnaHQgdGhpbmcuCgpPa2F5
LCBJIHNvcnRlZCBpdCBhbGwgb3V0IGFuZCB0ZW1wb3JhcmlseSBwdXQgaXQgaGVyZToKCmh0dHBz
Oi8vZ2l0aHViLmNvbS9qZ3VudGhvcnBlL2xpbnV4L2NvbW1pdHMvaG1tCgpCaXQgaW52b2x2ZWQg
am9iOgotIFRvb2sgSXJhJ3MgdjQgcGF0Y2ggaW50byBobW0uZ2l0IGFuZCBjb25maXJtZWQgaXQg
bWF0Y2hlcyB3aGF0CiAgQW5kcmV3IGhhcyBpbiBsaW51eC1uZXh0IGFmdGVyIGFsbCB0aGUgZml4
dXBzCi0gQ2hlY2tlZCB5b3VyIGdpdGh1YiB2NCBhbmQgdGhlIHYzIHRoYXQgaGl0IHRoZSBtYWls
aW5nIGxpc3Qgd2VyZQogIHN1YnN0YW50aWFsbHkgc2ltaWxhciAoSSBuZXZlciBkaWQgZ2V0IGEg
Y2xlYW4gdjQpIGFuZCBsYXJnZWx5CiAgd2VudCB3aXRoIHRoZSBnaXRodWIgdmVyc2lvbgotIEJh
c2VkIENIJ3MgdjQgc2VyaWVzIG9uIC1yYzcgYW5kIHB1dCBiYWNrIHRoZSByZW1vdmFsIGh1bmsg
aW4gc3dhcC5jCiAgc28gaXQgY29tcGlsZXMKLSBNZXJnZSdkIENIJ3Mgc2VyaWVzIHRvIGhtbS5n
aXQgYW5kIGZpeGVkIGFsbCB0aGUgY29uZmxpY3RzIHdpdGggSXJhCiAgYW5kIFJhbHBoJ3MgcGF0
Y2hlcyAoc3VjaCB0aGF0IHN3YXAuYyByZW1haW5zIHVuY2hhbmdlZCkKLSBBZGRlZCBEYW4ncyBh
Y2sncyBhbmQgdGVzdGVkLWJ5J3MKCkkgdGhpbmsgdGhpcyBmYWlybHkgY2xvc2VseSBmb2xsb3dz
IHdoYXQgd2FzIHBvc3RlZCB0byB0aGUgbWFpbGluZwpsaXN0LgoKQXMgaXQgd2FzIG1vcmUgdGhh
biBhIHNpbXBsZSAnZ2l0IGFtJywgSSdsbCBsZXQgaXQgc2l0IG9uIGdpdGh1YiB1bnRpbApJIGhl
YXIgT0sncyB0aGVuIEknbGwgbW92ZSBpdCB0byBrZXJuZWwub3JnJ3MgaG1tLmdpdCBhbmQgaXQg
d2lsbCBoaXQKbGludXgtbmV4dC4gMC1kYXkgc2hvdWxkIGFsc28gcnVuIG9uIHRoaXMgd2hvbGUg
dGhpbmcgZnJvbSBteSBnaXRodWIuCgpXaGF0IEkga25vdyBpcyBvdXRzdGFuZGluZzoKIC0gVGhl
IGNvbmZsaWN0aW5nIEFSTSBwYXRjaGVzLCBJIHVuZGVyc3RhbmQgQW5kcmV3IHdpbGwgaGFuZGxl
IHRoZXNlCiAgIHBvc3QtbGludXgtbmV4dAogLSBUaGUgY29uZmxpY3Qgd2l0aCBBTUQgR1BVIGlu
IC1uZXh0LCBJIGFtIHdhaXRpbmcgdG8gaGVhciBmcm9tIEFNRAoKT3RoZXJ3aXNlIEkgdGhpbmsg
d2UgYXJlIGRvbmUgd2l0aCBobW0uZ2l0IGZvciB0aGlzCmN5Y2xlLgoKVW5mb3J0dW5hdGVseSB0
aGlzIGlzIHN0aWxsIG5vdCBlbm91Z2ggdG8gcHJvZ3Jlc3MgcmRtYSdzIE9EUCwgc28gd2UKd2ls
bCBuZWVkIHRvIGRvIHRoaXMgYWdhaW4gbmV4dCBjeWNsZSA6KCBJJ2xsIGJlIHdvcmtpbmcgb24g
cGF0Y2hlcwpvbmNlIEkgZ2V0IGFsbCB0aGUgbWVyZ2Ugd2luZG93IHByZXAgSSBoYXZlIHRvIGRv
IGRvbmUuCgpSZWdhcmRzLApKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
