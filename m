Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE05F6A051
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 03:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569AD6E065;
	Tue, 16 Jul 2019 01:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150052.outbound.protection.outlook.com [40.107.15.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AA889AB2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 17:57:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4mjOkEjlICXRTf3wkyPTv+w23EO/N2pdzDSfIbHMJenMjg8CJqOZ8aIHlT5UuO8pTrBYX42pjJQpMuSGRog6z04O9fpwLhXRUkFYedUFSlA8LK0ocRkxhXPWIh4Ju0C18SyM/SPS+MiycS+096GAQ36l1y5JKA7Qk+ZGoIuo7zhFPMXUVoe5F+f+wxLdy31Hu/IQy0Le9QWKzgzPC1cceIlUnPyRz0Uijy3cJgsiOTpjI2y+EcUy5fz01p2nVMtqVX6WFeHyta+fZtFNLaHm5WRbzWzOgF/mncXnV+nwmynt5bXf6TL/gIfkx9D8oKduEXqSMtYAytEZxBumic8rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgx8blmTv5Q18LZPhRE1s0Xfk45hsAc1ACT/zyzYjQU=;
 b=Y3QrFP0vLifXzzEYwQRCEVnbPuq42ICGzZLuIqbBEbaN6xQsdcE7jw676GuRdxw5dx5Uoi8uxRaAswqHM5dH2kpGlySTRCMXzCn8wBEBiooBgWaOJ/jQdatgi6/bhulrsMaEkQWW0mX/6tXF7H2I567WaPkF12QNWwkoRBWNF2URTOyk2C1naUPGelGgr6E/MLk01iPE60gWTW7Z8jPWMveUwiKYS/RZWaDE4mbPBrwzgFZ7CRh7ATGBS+ybuW67vOmsYSeJkQHovTNqr0qXCoFUzm+W+OSCpfvQ9xaCrpPQudL56tpo9uRwOMpZ032eqW0qNJkKZE3wHEB+jab8MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6480.eurprd05.prod.outlook.com (20.179.27.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Mon, 15 Jul 2019 17:57:30 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 17:57:30 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: DRM pull for v5.3-rc1
Thread-Topic: DRM pull for v5.3-rc1
Thread-Index: AQHVOwjxvOBTsCZDkEWbf47t9QeYFabLuosAgAAMdgCAAC88AIAAATYA
Date: Mon, 15 Jul 2019 17:57:30 +0000
Message-ID: <20190715175726.GC5043@mellanox.com>
References: <CAPM=9tzJQ+26n_Df1eBPG1A=tXf4xNuVEjbG3aZj-aqYQ9nnAg@mail.gmail.com>
 <CAPM=9tx+CEkzmLZ-93GZmde9xzJ_rw3PJZxFu_pjZJc7KM5f-w@mail.gmail.com>
 <20190715122924.GA15202@mellanox.com>
 <CAKMK7uHvjuQ5Dqm0LPrtQxdHh5Z6Pt2mg4AnpRRR0gWb1Wp05g@mail.gmail.com>
 <20190715150402.GD15202@mellanox.com>
 <CAKMK7uGbNuA_pN=r9XKGz2MTVVJWm6q8tKBT3WJPa93nKEe4iA@mail.gmail.com>
In-Reply-To: <CAKMK7uGbNuA_pN=r9XKGz2MTVVJWm6q8tKBT3WJPa93nKEe4iA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR16CA0011.namprd16.prod.outlook.com
 (2603:10b6:208:134::24) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1108a0d8-7a62-456a-9f19-08d7094de7bd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB6480; 
x-ms-traffictypediagnostic: VI1PR05MB6480:
x-microsoft-antispam-prvs: <VI1PR05MB6480627D1FB67F0CE6932A5DCFCF0@VI1PR05MB6480.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(189003)(199004)(102836004)(486006)(3846002)(1076003)(6116002)(4744005)(53936002)(76176011)(6506007)(386003)(11346002)(52116002)(81166006)(81156014)(6246003)(66066001)(86362001)(6436002)(6486002)(6512007)(99286004)(68736007)(5660300002)(8936002)(316002)(256004)(33656002)(8676002)(4326008)(66476007)(36756003)(66446008)(66946007)(25786009)(64756008)(66556008)(6916009)(2906002)(2616005)(229853002)(478600001)(476003)(14454004)(186003)(446003)(71190400001)(7736002)(305945005)(71200400001)(26005)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6480;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: F9x6bK1ZmjjVpB27Y1wHQQ8sSe/p7NqxpLxlJJHwIB+Rb/7oWfZCvU0zq9Ecc6ent6vnnRzRN77Ezt4xqiEdEnuxttf/Kk9wfJzvG6iyXWt2nVLbJuXq7lD+rghQPWvtSOSvGwC3UzODEXOYWT6iJvBZkhmo9LnGxrL6qD+m1HP9EWKmnY/LfU2TAJWdGYAjpyDxiMboShy7oNZg6NPimRmlwNZDuf3TfnPVQ4O8h5IdaJbUjgFOlfe5oLcdauJM8fhTdZk5aPNpqfEaZhyPVQJ9We9qDPQ5RVB3MYssbxGO4AoSyLINeLqI6WuMd7F/FOhb0mmErbiJWOYgZ+XdcGXt5qJ3w23m+JBQBNBCFytJe15lfv7dnmx08l29+nAwgLPywqmYy8z0CeDKqOUpGkD8FW0cp55z+AsSMNZfzsI=
Content-ID: <235CAD9B97456C44AD6D8293CD6612A1@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1108a0d8-7a62-456a-9f19-08d7094de7bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 17:57:30.2859 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6480
X-Mailman-Approved-At: Tue, 16 Jul 2019 01:36:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgx8blmTv5Q18LZPhRE1s0Xfk45hsAc1ACT/zyzYjQU=;
 b=bVuLe4MabnoqzorxJpIYMEZEk00uG756ytq/IPYJRrsVsOmj1ppM3B/WRNiSvrfFaOXNRFMdysLi9NhfF4lC7KNK/J201kjzjghcVf+8vB1dfKymhxyJyEeyGF+3DL5efTzbBnQxPJBith2BfV+FZP3Xq6Nv+9VPvUHASaeDRbY=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Hellstrom <thellstrom@vmware.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jerome Glisse <jglisse@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMDc6NTM6MDZQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKCj4gPiBTbywgSSdsbCBwdXQgaXQgb24gYSB0b3BpYyBhbmQgc2VuZCB5b3UgdHdvIGEg
bm90ZSBuZXh0IHdlZWsgdG8gZGVjaWRlCj4gPiBpZiB5b3Ugd2FudCB0byBtZXJnZSBpdCBvciBu
b3QuIEknbSByZWFsbHkgdW5jbGVhciBob3cgbm91dmVhdSdzIGFuZAo+ID4gQU1EJ3MgcGF0Y2hm
bG93IHdvcmtzLi4KPiAKPiBEUk0gaXMgMi1sZXZlbCBmb3IgcHJldHR5IG11Y2ggZXZlcnl0aGlu
Zy4gRmlyc3QgaXQgbGFuZHMgaW4gYSBkcml2ZXIKPiB0cmVlIChvciBhIGNvbGxlY3RpdiBvZiBk
cml2ZXJzLCBsaWtlIGluIGRybS1taXNjKS4gVGhlbiB0aG9zZSBzZW5kCj4gcHVsbCByZXF1ZXN0
cyB0byBkcm0uZ2l0IGZvciBpbnRlZ3JhdGlvbi4gQnVzeSB0cmVlcyBkbyB0aGF0IGV2ZXJ5IDEt
Mgo+IHdlZWtzIChlLmcuIGFtZGdwdSksIHNsb3dlciB0cmVlcyBvbmNlIHBlciBtZXJnZSB3aW5k
b3cgKGUuZy4gbm91dmVhdSkKPiBmb3IgZHJtLW5leHQsIHNpbWlsYXIgZm9yIGRybS1maXhlcy4K
ClRoZSBEUk0gcGFydCBzZWVtcyBsb2dpY2FsIC0gaXQgaXMgaG93IHRoZSBBTUQgR1BVIGFuZCBu
b3V2ZWF1IGdpdAp0cmVlcyB0cmVlcyB3b3JrIHRoYXQgSSBkb24ndCBrbm93LiBJIGhlYXJkIHRo
YXQgbmVpdGhlciBjb3VsZCB0YWtlIGluCmEgc3RhYmxlIHRvcGljIGJyYW5jaD8KCkphc29uCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
