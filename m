Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A766798D4D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8856EA90;
	Thu, 22 Aug 2019 08:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30056.outbound.protection.outlook.com [40.107.3.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1D46E343;
 Wed, 21 Aug 2019 16:10:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mx6LFLwYXk8KC00DVy2TRZpycQts7g5miEKY5AfKWUbeTUhFukTzC1HrNAssxO+DJf2jO0U2eIgqq2eptA0uMATlVswBK6KmfB42eiTv5Jg8oZ+RknsXkZacxa8Y/V40Ju79+e6jsogfwLO5o8ynFajsqlGjI01TbCsxYC65McC/SG2Ygm+HM7sSeGftjm9wDXIO/YJwiCYGMrDKaXrk6qOLTTlgx7Bj3z4mpxjVyXZqDgP+2gemcn10Ez+fnhGPkPO26CWCUO5m8nqBgxi16FqlceR7jlSFa9mmPIy94NpJf30e5WXtjS4rx8woWt9WDKmO5gr7C6CEm2T/OnChug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVhCgWyFt9x9wO/2D/TbZgymY3EGFsVqPvUnluM5MCk=;
 b=S+5Dfkgs4FDhpnNQmdfJuFoUBlpzu+Q1g1rEZiGS8pxIcrW2MKYxuYU7d3EdbV2OMSVtccRWL2CBKM1VRsprtvAteDFVj/kI28DNjLKhMfopQ5J6U7RWjC/xMWFkiOhGP62aWx0b/WCmOoOLq5QUHPHaNenLElLAhenyDEEdgjJuREWg9vjwBHvLY0aamDlP74tgJL2hqULygDd3fHPjBWCztCVCP/uphPwBI7MgQGWVH/e88mUdQlHJ+tRldrh2ih4jgXQzRlGT0T4J7hLSxrFVGZ6yQhOUx16N+El8IkpWMRaq+3qJ52clhpR7lO7wPnXXUx8z8aPB+stTSJRLNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB4431.eurprd05.prod.outlook.com (52.133.13.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Wed, 21 Aug 2019 16:10:03 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7%6]) with mapi id 15.20.2178.018; Wed, 21 Aug 2019
 16:10:03 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: Re: linux-next: Tree for Aug 19 (amdgpu)
Thread-Topic: linux-next: Tree for Aug 19 (amdgpu)
Thread-Index: AQHVVvkFv70F6uhlHE+MpL/A8Ss0j6cD+d6AgAHD8wCAAAn+AA==
Date: Wed, 21 Aug 2019 16:10:02 +0000
Message-ID: <20190821160958.GH8667@mellanox.com>
References: <20190819191832.03f1a579@canb.auug.org.au>
 <ba3cde82-6163-12e5-2e77-36834454113a@infradead.org>
 <20190820114554.0e522651@canb.auug.org.au>
 <20190820123637.GB29225@mellanox.com>
 <b60eb195-7263-2ba0-e8d9-8412c0de66e0@amd.com>
In-Reply-To: <b60eb195-7263-2ba0-e8d9-8412c0de66e0@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::29) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 59923ef0-da37-4c6d-2035-08d726520626
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR05MB4431; 
x-ms-traffictypediagnostic: VI1PR05MB4431:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <VI1PR05MB443156649D139CBF6DB827C0CFAA0@VI1PR05MB4431.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(189003)(199004)(53754006)(6486002)(2906002)(3846002)(316002)(6436002)(6116002)(81166006)(11346002)(6512007)(446003)(54906003)(99286004)(66946007)(64756008)(8936002)(6306002)(102836004)(229853002)(66446008)(71190400001)(81156014)(66556008)(186003)(8676002)(25786009)(26005)(476003)(486006)(66476007)(2616005)(6506007)(76176011)(66066001)(1076003)(5660300002)(478600001)(6916009)(71200400001)(53546011)(86362001)(36756003)(52116002)(4326008)(386003)(256004)(33656002)(966005)(14454004)(53936002)(5024004)(6246003)(7736002)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4431;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6Rspc6oHDUos6xiDLmHePePgNRsAx7egBKU6mtx0skNG+qIy+HSf47EihiG7NCOd7UkrtB1zBK8jMk6hqu/Ai6sGs1HUH4vcXLJpUCq+fyuGq3/W/2TjDwiccDfFF0sICRaAydt8EUqnURY/vtfNoLYnACyXps66GP0Cr0SGGcvhpcYdrWGY07cNX6iGixbglpP6fF0TGu6C+pCFtdTx518LPsIuk39hLZnA/E0RAzsy8uLg24iu7hyDqpZONLnjMBoqdKTTraKyV7Rzw/dUsrodjmV+8xCZMa3Hgysdp1qM2r1Yll+LmENZ3OzNRXR3SMtzuWzELj9gCKGZMdllEF/iZomg3F1dP+rdtl2kDiluaRX7Op93RrULBc/VsqCNdenNmylwxRizuXH37DmKo+rCp32h0jivKtzmFPlgXmo=
x-ms-exchange-transport-forked: True
Content-ID: <94ED38A7D7E3484C82F74F384D7CB5E5@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59923ef0-da37-4c6d-2035-08d726520626
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 16:10:03.0079 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gg2YtrQLaonRW/BhJLsYHaRrbdwvnHsF3BMqBL35IHvkcCdmcTTxgfL2f3u7Yf/lRNTqbFJKkMm7HxF1KmuG/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4431
X-Mailman-Approved-At: Thu, 22 Aug 2019 08:14:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVhCgWyFt9x9wO/2D/TbZgymY3EGFsVqPvUnluM5MCk=;
 b=ESlDq/qtCd+72AYt5FYvAsES6Va9p9XdWYUwIaL2clBbE4eN3+nUImsszOUnXmj1i7Np0bxIJDYr4KTFN/tXFet8rCu31ck97YkZ/fBeRAIobJhkfcd1LDSx7uK2cswiRS3s0I8fD1XiP0CNhGG1kMzDVM+FkRDguGkRWt0A2Ww=
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
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMDM6MzQ6MTJQTSArMDAwMCwgS3VlaGxpbmcsIEZlbGl4
IHdyb3RlOg0KPiANCj4gT24gMjAxOS0wOC0yMCA4OjM2IGEubS4sIEphc29uIEd1bnRob3JwZSB3
cm90ZToNCj4gPiBPbiBUdWUsIEF1ZyAyMCwgMjAxOSBhdCAxMTo0NTo1NEFNICsxMDAwLCBTdGVw
aGVuIFJvdGh3ZWxsIHdyb3RlOg0KPiA+PiBIaSBhbGwsDQo+ID4+DQo+ID4+IE9uIE1vbiwgMTkg
QXVnIDIwMTkgMTg6MzQ6NDEgLTA3MDAgUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5v
cmc+IHdyb3RlOg0KPiA+Pj4gT24gOC8xOS8xOSAyOjE4IEFNLCBTdGVwaGVuIFJvdGh3ZWxsIHdy
b3RlOg0KPiA+Pj4+IEhpIGFsbCwNCj4gPj4+Pg0KPiA+Pj4+IENoYW5nZXMgc2luY2UgMjAxOTA4
MTY6DQo+ID4+Pj4gICAgDQo+ID4+PiBvbiB4ODZfNjQ6DQo+ID4+Pg0KPiA+Pj4gLi4vZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jOiBJbiBmdW5jdGlvbiDigJhhbWRncHVf
ZXhpdOKAmToNCj4gPj4+IC4uL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYu
YzoxNDcxOjI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhtbXVf
bm90aWZpZXJfc3luY2hyb25pemXigJk7IGRpZCB5b3UgbWVhbiDigJhfX3N5bmNfc3luY2hyb25p
emXigJk/IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0KPiA+Pj4gICAg
bW11X25vdGlmaWVyX3N5bmNocm9uaXplKCk7DQo+ID4+PiAgICBefn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn4NCj4gPj4+ICAgIF9fc3luY19zeW5jaHJvbml6ZQ0KPiA+Pj4NCj4gPj4+DQo+ID4+PiBG
dWxsIHJhbmRjb25maWcgZmlsZSBpcyBhdHRhY2hlZC4NCj4gPj4gQ2F1c2VkIGJ5IGNvbW1pdA0K
PiA+Pg0KPiA+PiAgICA2ODMyYzlkYzgzNTggKCJobW06IHVzZSBtbXVfbm90aWZpZXJfZ2V0L3B1
dCBmb3IgJ3N0cnVjdCBobW0nIikNCj4gPj4NCj4gPj4gZnJvbSB0aGUgaG1tIHRyZWUuDQo+ID4+
DQo+ID4+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBuZWVkIHRvIGlu
Y2x1ZGUgbGludXgvbW11X25vdGlmaWVyLmgNCj4gPiBBaCB5ZXMsIHRoYW5rcywgaXQgaXMgYmVj
YXVzZSBvZiAhQ09ORklHX0hNTV9NSVJST1IgaW4gdGhpcw0KPiA+IHJhbmRjb25maWcuIEkndmUg
Zml4ZWQgaXQgdXAuDQo+IA0KPiBUaGFua3MgSmFzb24uIEknbSB0cnlpbmcgdG8gZm9sbG93IHdo
YXQncyBnb2luZyBvbiBoZXJlLCBidXQgSSBjYW4ndCANCj4gZmluZCB0aGUgY29tbWl0IGhhc2gg
cXVvdGVkIGFib3ZlIGluIGFueSBvZiB0aGUgcHVibGljIHJlcG9zaXRvcmllcyBJJ20gDQo+IHRy
YWNraW5nDQoNCkkgd2FzIGFibGUgdG8gc3F1YXNoIHRoZSBvbmUgbGluZSBmaXgsIHNvIHRoZSBj
b21taXQgSUQgaXMgZ29uZSwgaXQgaXMNCm5vdzoNCg0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmRtYS9yZG1hLmdpdC9jb21taXQvP2g9aG1tJmlkPWM3
ZDhiNzgyNGZmOWRlODY2YTM1NmUxODkyZGJlOWYxOTFhYTVkMDYNCg0KRnJvbQ0KDQpodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9yZG1hL3JkbWEuZ2l0L2xv
Zy8/aD1obW0NCg0KSmFzb24NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
