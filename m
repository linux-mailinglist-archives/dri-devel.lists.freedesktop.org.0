Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43E85F39A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F6C6E284;
	Thu,  4 Jul 2019 07:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70043.outbound.protection.outlook.com [40.107.7.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47E76E1D7;
 Wed,  3 Jul 2019 20:40:11 +0000 (UTC)
Received: from DB7PR05MB4138.eurprd05.prod.outlook.com (52.135.129.16) by
 DB7PR05MB5353.eurprd05.prod.outlook.com (20.178.42.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Wed, 3 Jul 2019 20:40:08 +0000
Received: from DB7PR05MB4138.eurprd05.prod.outlook.com
 ([fe80::9115:7752:2368:e7ec]) by DB7PR05MB4138.eurprd05.prod.outlook.com
 ([fe80::9115:7752:2368:e7ec%4]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 20:40:08 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/5] mm: return valid info from hmm_range_unregister
Thread-Topic: [PATCH 1/5] mm: return valid info from hmm_range_unregister
Thread-Index: AQHVMc9vbnYVs0S/206V41dM/fYuDaa5P52AgAAYpYCAAAMYAA==
Date: Wed, 3 Jul 2019 20:40:08 +0000
Message-ID: <20190703204002.GO18688@mellanox.com>
References: <20190703184502.16234-1-hch@lst.de>
 <20190703184502.16234-2-hch@lst.de> <20190703190045.GN18688@mellanox.com>
 <20190703202857.GA15690@lst.de>
In-Reply-To: <20190703202857.GA15690@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQBPR0101CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::37) To DB7PR05MB4138.eurprd05.prod.outlook.com
 (2603:10a6:5:23::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2d72fcc-a695-484b-3606-08d6fff6a28a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB7PR05MB5353; 
x-ms-traffictypediagnostic: DB7PR05MB5353:
x-microsoft-antispam-prvs: <DB7PR05MB53533520153B718AD8B44DDACFFB0@DB7PR05MB5353.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(199004)(189003)(6512007)(33656002)(52116002)(76176011)(476003)(3846002)(6116002)(11346002)(14444005)(6506007)(4326008)(25786009)(386003)(256004)(2616005)(305945005)(53936002)(6436002)(36756003)(8676002)(486006)(7736002)(8936002)(81166006)(6246003)(102836004)(6916009)(26005)(68736007)(81156014)(14454004)(73956011)(66446008)(66946007)(71190400001)(71200400001)(54906003)(66556008)(66476007)(66066001)(446003)(5660300002)(186003)(64756008)(2906002)(99286004)(316002)(229853002)(6486002)(478600001)(1076003)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR05MB5353;
 H:DB7PR05MB4138.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jDfglUojE6QaLohL81Wj7gLMka4NP5sT4AN2MpsjUeFYA6EfzUDsjUacYNqHNDlFkll4sbJK1dD/ShvMtZLgdFeyB/GEoFthG0LHCUVuw7Wh5kMrZnHrm0m/FI1PhVKTWCCl5vK66cQcpWhELIIuNI2DJNp+cZovrAuYwRjcARIONcgMdxlIq9E7kaVwhTkpWutut2nXEpSv1gLJ7BZA0X6+qLHClSI0z7vVxxkqUT9JhM0r0tFzI/L9VcfWNwGXE0Xomw8DCQ2vKY3lbjc3vP4eD2alypF9eHQGekJErn+iEFVqm0i2KP8eOc3+fV3XF98mLOF9eWI7zcvHx1meXJGI4/buvOZlIXQOnV9PLn/pX6u/JutGVa7YL/01jHtwM4nd0OeMg+r2GOIWkzscAMZ+JHqUATdyVgC4cxIA5gk=
Content-ID: <06E102C96309A349A6DAB9BA508DF1DD@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d72fcc-a695-484b-3606-08d6fff6a28a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 20:40:08.2593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR05MB5353
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=boRw7gXNEPgVKjC8JbPa9vT086kc+Ya39vsy5M66LG4=;
 b=rzUpG3JPf2lpis8U1+TAuOvlVTU04PTINLfcCiVuVwcUowQgkBQ079k37C/RxEik69OMUsO3hzstoG4LexH1TD6j0OMg7zrzjP9MQVq+NinnuOd/xljk0Z/CfJfTyUsmJi6qYhSatU2OKpvuOjNBYu/vJvlyXt1t7MxIihoZzQE=
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
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMTA6Mjg6NTdQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDc6MDA6NTBQTSArMDAwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gSSBkb24ndCB0aGluayB0aGUgQVBJIHNob3VsZCBiZSBl
bmNvdXJhZ2luZyBzb21lIHNob3J0Y3V0IGhlcmUuLgo+ID4gCj4gPiBXZSBjYW4ndCBkbyB0aGUg
YWJvdmUgcGF0dGVybiBiZWNhdXNlIHRoZSBvbGQgaG1tX3ZtYSBBUEkgZGlkbid0IGFsbG93Cj4g
PiBpdCwgd2hpY2ggaXMgcHJlc3VtYWJseSBhIHJlYXNvbiB3aHkgaXQgaXMgb2Jzb2xldGUuCj4g
PiAKPiA+IEknZCByYXRoZXIgc2VlIGRyaXZlcnMgbW92ZSB0byBhIGNvbnNpc3RlbnQgcGF0dGVy
biBzbyB3ZSBjYW4gdGhlbgo+ID4gZWFzaWx5IGhvaXN0IHRoZSBzZXFjb3VudCBsb2NrIHNjaGVt
ZSBpbnRvIHNvbWUgY29tbW9uIG1tdSBub3RpZmllcgo+ID4gY29kZSwgYXMgZGlzY3Vzc2VkLgo+
IAo+IFNvIHlvdSBkb24ndCBsaWtlIHRoZSB2ZXJzaW9uIGluIGFtZGdwdV90dG1fdHRfZ2V0X3Vz
ZXJfcGFnZXNfZG9uZSBpbgo+IGxpbnV4LW5leHQgZWl0aGVyPwoKSSBsb29rZWQgYXQgdGhpcyBm
b3IgNSBtaW5zLCBhbmQgSSBjYW4ndCBzZWUgdGhlIGtleSBlbGVtZW50cyBvZiB0aGUKY29sbGlz
aW9uIHJldHJ5IGxvY2s6CgotIFdoZXJlIGlzIHRoZSByZXRyeSBsb29wPwotIFdoZXJlIGlzIHRo
ZSBsb2NrIGFyb3VuZCB0aGUgZmluYWwgdGVzdCB0byB2YWxpZCBwcmlvciB0byB1c2luZwogIHRo
ZSBvdXRwdXQgb2YgcmFuZ2U/CgpGb3IgaW5zdGFuY2UgbG9va2luZyBhdCBhbWRncHVfZ2VtX3Vz
ZXJwdHJfaW9jdGwoKS4uCgpXZSBjYW4ndCBiZSBob2xkaW5nIGEgbG9jayB3aGVuIHdlIGRvIGht
bV9yYW5nZV93YWl0X3VudGlsX3ZhbGlkKCkKKGluc2lkZSBhbWRncHVfdHRtX3R0X2dldF91c2Vy
X3BhZ2VzKSwgb3RoZXJ3aXNlIGl0IGRlYWRsb2NrcywgYW5kCnRoZXJlIGFyZSBub3Qgb3RoZXIg
bG9ja3MgdGhhdCB3b3VsZCBlbmNvbXBhc3MgdGhlIGZpbmFsIGlzX3ZhbGlkIGNoZWNrLgoKQW5k
IGFtZGdwdV9nZW1fdXNlcnB0cl9pb2N0bCgpIGxvb2tzIGxpa2UgYSBzeXNjYWxsIGVudHJ5IHBv
aW50LCBzbwpoYXZpbmcgaXQgZmFpbCBqdXN0IGJlY2F1c2UgdGhlIGxvY2sgY29sbGlkZWQgKGll
IGlzX3ZhbGlkID09IGZhbHNlKQpjYW4ndCBwb3NzaWJseSBiZSB0aGUgcmlnaHQgdGhpbmcuCgpJ
J20gYWxzbyB1bmNsZWFyIHdoZW4gdGhlIGRldmljZSBkYXRhIGlzIHVwZGF0ZWQgaW4gdGhhdCBz
ZXF1ZW5jZS4uCgpTby4uIEkgdGhpbmsgdGhpcyBsb2NraW5nIGlzIHdyb25nLiBNYXliZSBBTUQg
dGVhbSBjYW4gZXhwbGFpbiBob3cgaXQKc2hvdWxkIHdvcms/CgpKYXNvbgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
