Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 284AA45A55
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 12:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0878789385;
	Fri, 14 Jun 2019 10:25:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00052.outbound.protection.outlook.com [40.107.0.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C26489385
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 10:25:25 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5133.eurprd08.prod.outlook.com (20.179.30.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Fri, 14 Jun 2019 10:25:22 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1987.012; Fri, 14 Jun 2019
 10:25:22 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] komeda: no need to check return value of debugfs_create
 functions
Thread-Topic: [PATCH] komeda: no need to check return value of debugfs_create
 functions
Thread-Index: AQHVIpt07nJUfF0E0Uq6MTePuDXbHw==
Date: Fri, 14 Jun 2019 10:25:22 +0000
Message-ID: <20190614102515.GA4691@james-ThinkStation-P300>
References: <20190613132806.GA4863@kroah.com>
In-Reply-To: <20190613132806.GA4863@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0302CA0016.apcprd03.prod.outlook.com
 (2603:1096:202::26) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36034535-26e1-4cef-a880-08d6f0b29b98
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5133; 
x-ms-traffictypediagnostic: VE1PR08MB5133:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB5133AB99392C7A35573BF083B3EE0@VE1PR08MB5133.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0068C7E410
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(346002)(39860400002)(376002)(396003)(136003)(366004)(199004)(189003)(33656002)(6246003)(478600001)(316002)(5660300002)(53936002)(305945005)(6916009)(14454004)(476003)(446003)(7736002)(68736007)(11346002)(8676002)(81156014)(81166006)(8936002)(486006)(2906002)(76176011)(1076003)(6506007)(66066001)(386003)(55236004)(73956011)(99286004)(6436002)(33716001)(102836004)(26005)(66476007)(186003)(86362001)(6486002)(256004)(66946007)(66446008)(6512007)(3846002)(229853002)(25786009)(52116002)(71190400001)(58126008)(54906003)(4326008)(66556008)(64756008)(71200400001)(6116002)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5133;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wpvjAExAygNkKLgThZMFK1Vg4e8Lm1mZOvOx4JwxikjRKm7igPBKSupn+VFmDKcCeC3nP6S3zGEMSwv0n0BlNKpt91JB2/+Blwwjxpnk+SPEEHvzxGSc0VraPgI83lQE/nJXHDki0ewtTNQ2Q0ubRSXKEATUAhwu6BP0pNi3mH4GUJa/F01eKhbBYjH5RFj4PVZ0cUmpbLzi35N3ouZrkzsbbLz0O+dz2oSRfZGnXDwgxXT9OjXBSNa3jsIPzi6F5ADrXYF1YBfq2RI33H8YFtMZDSpDWfnO+7H43/fcbTVEz2YWaucUsYAP50Me07JqF7LkeksteMG7n8VPBBwXUcsSjbBc52XndRfe0llZI50vbgAWMYXvsuH/pEcyRr/DakHoZQ+EaGpc2eBZQYJJHW+y0hx4PlICiJGFKrMfmlo=
Content-ID: <0CACBC8D80EDC149BACA27754BF0E2AF@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36034535-26e1-4cef-a880-08d6f0b29b98
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2019 10:25:22.7830 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5133
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZPK9EoEn4/MTj3vPV1OMDk/EQwz0Q1zWMkyWSYiMp8=;
 b=o+Mi33bycuZBf1Viher141VTYHl/SynJe10QfpfPPL9Bo+6BNUfiIBF7Z4KV0qLAVbszvcsLvDcM6yoyjf53CPy2PGbrAZ0oBvBUaXyXrsKI2xQkI3AqXDnsOuDX9yVxtvs9eU8XeVQbpftj+nC33T3h10dHApJYzPCJlY/TSqA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDM6Mjg6MDZQTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IFdoZW4gY2FsbGluZyBkZWJ1Z2ZzIGZ1bmN0aW9ucywgdGhlcmUgaXMgbm8g
bmVlZCB0byBldmVyIGNoZWNrIHRoZQo+IHJldHVybiB2YWx1ZS4gIFRoZSBmdW5jdGlvbiBjYW4g
d29yayBvciBub3QsIGJ1dCB0aGUgY29kZSBsb2dpYyBzaG91bGQKPiBuZXZlciBkbyBzb21ldGhp
bmcgZGlmZmVyZW50IGJhc2VkIG9uIHRoaXMuCj4gCj4gQ2M6ICJKYW1lcyAoUWlhbikgV2FuZyIg
PGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgo+IENjOiBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVA
YXJtLmNvbT4KPiBDYzogQnJpYW4gU3RhcmtleSA8YnJpYW4uc3RhcmtleUBhcm0uY29tPgo+IENj
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNp
Z25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5v
cmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rl
di5jIHwgMyAtLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMKPiBpbmRleCBj
YTM1OTllNGE0ZDMuLjU4MTAwZWRmNThmYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jCj4gQEAgLTUxLDkgKzUxLDYgQEAgc3RhdGlj
IHZvaWQga29tZWRhX2RlYnVnZnNfaW5pdChzdHJ1Y3Qga29tZWRhX2RldiAqbWRldikKPiAgCQly
ZXR1cm47Cj4gIAo+ICAJbWRldi0+ZGVidWdmc19yb290ID0gZGVidWdmc19jcmVhdGVfZGlyKCJr
b21lZGEiLCBOVUxMKTsKPiAtCWlmIChJU19FUlJfT1JfTlVMTChtZGV2LT5kZWJ1Z2ZzX3Jvb3Qp
KQo+IC0JCXJldHVybjsKPiAtCj4gIAlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJyZWdpc3RlciIsIDA0
NDQsIG1kZXYtPmRlYnVnZnNfcm9vdCwKPiAgCQkJICAgIG1kZXYsICZrb21lZGFfcmVnaXN0ZXJf
Zm9wcyk7Cj4gIH0KPiAtLSAKPiAyLjIyLjAKCgpIaSBHcmVnOwoKVGhhbmsgeW91IGZvciBoZWxw
aW5nIHRvIGZpeCB0aGlzIHByb2JsZW0uCgpSZXZpZXdlZC1ieTogSmFtZXMgUWlhbiBXYW5nIChB
cm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
