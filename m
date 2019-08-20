Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9A49739E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 09:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ECC46E931;
	Wed, 21 Aug 2019 07:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150041.outbound.protection.outlook.com [40.107.15.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C076E3A4;
 Tue, 20 Aug 2019 12:36:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d49TK6e1Y9OWSQ5sFW7eMZmx8DofYOInqZc3pD2vYwjznKTv2t7Ab4QIU6+IKnqdVJGiH5CHX6HZs1sr+/O9mocg8PgN/+21uILU0PWHyprlxw9dx4xqJHB8hiZA6/dMiYkxVAs17FdkRbCcyHQXCbbJd15tuNR19c/zyAQvp99U9ZL7kqinYRf8nhjrXpayWVp0lSDsKQddAgcdAvhmCyuJX9z2AGl4pbthzHE7Ah+C9ep3RrihJ+zMdzGvP7kW7yyCRzCSMNT7eF5G66fQ3dkKU8SIZRY+gNpD7cScf/KazXe8nPiCzzfSn4JJNlpMIHAncl0Lg/STJII/s6R30g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5lW6ZVJMifvtjp+A6LbX1tQh/oG5NkB6LjiBbFbcgA=;
 b=P25vby3rIO67weB+fYNBkPjjaDipDo3JXkbH6gf4aPByBQM7/umClskaj9P+eIjvjA1zr/5tq6B5SfuOWHMPmu+cx07iMHCmetWtk4iJ4hxpLdDkH56mE46kUq9jf6vNWgsLDD2Vw1eoXQKsXP0rhU9KkLqWepMOvvFjLgPVVEnvJCXx9QqbIbXQe1Di27z4K0y6F3maDLc8iEjCuHE7RFTy4TjNIm3CM/6eHtLvZqfa075Uscsrkh8pmlDGHeyhdSgtVcvAGsIUZZRuXM3yJcK+asH6/AB2LMCZH3idiDze3YnOHK+40Lczn+96V6IyAwHUSHhW0/xsinkNnuOryA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6462.eurprd05.prod.outlook.com (20.179.24.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 20 Aug 2019 12:36:43 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7%6]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 12:36:43 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Aug 19 (amdgpu)
Thread-Topic: linux-next: Tree for Aug 19 (amdgpu)
Thread-Index: AQHVVvkFv70F6uhlHE+MpL/A8Ss0j6cD+d6A
Date: Tue, 20 Aug 2019 12:36:43 +0000
Message-ID: <20190820123637.GB29225@mellanox.com>
References: <20190819191832.03f1a579@canb.auug.org.au>
 <ba3cde82-6163-12e5-2e77-36834454113a@infradead.org>
 <20190820114554.0e522651@canb.auug.org.au>
In-Reply-To: <20190820114554.0e522651@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQBPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::30) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a27219f-e288-40ed-58a1-08d7256b0eb9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR05MB6462; 
x-ms-traffictypediagnostic: VI1PR05MB6462:
x-microsoft-antispam-prvs: <VI1PR05MB646288B7F984E7ED815EB2D1CFAB0@VI1PR05MB6462.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:397;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(189003)(199004)(53754006)(478600001)(71190400001)(5024004)(256004)(71200400001)(99286004)(14454004)(76176011)(66476007)(66946007)(6486002)(8676002)(66556008)(81156014)(8936002)(81166006)(25786009)(4326008)(64756008)(66446008)(229853002)(6512007)(6436002)(102836004)(186003)(486006)(5660300002)(6916009)(6246003)(53936002)(66066001)(6116002)(3846002)(6506007)(53546011)(386003)(2616005)(446003)(476003)(1076003)(4744005)(11346002)(2906002)(52116002)(36756003)(54906003)(7736002)(305945005)(316002)(86362001)(26005)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6462;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uhlLIvyV3SABRR+DF5pjB70gqsH70+slsdGH8U1GWtO5cGhuHKgeMkV0wGWltYwnVEHz6P2R28eRYv5A4cFyY5iuMpHUcsm8OcE8CaDlYUakwdQRorsza7iHgC7LMoEY/EDMOYRdvAquuTYmRdkwTwvY6npPTscv/8UBrRBFlUvDZD0swtkcHDEByuHzNUKBIDIje8qpM9Gv0NDMxnu9HaI5sziQu1kkwIlUqAhToPwt+oXA/bBdlL+eYuuePXdpNiCjFX9OxmqleInU5gH6n30YQHbqIZfNQY+0T0jdlnfeiD+BvGF8I/sSbVfP982sRGNk9eSU5a5KQRK8NEgqnaQ5c/oBkmxrA3tMMBeWlIU2R8xX8Foma0BvW4Na2AJJ5bN0nqLGPpX15a+T4U2zjmWK9iyX6ZZFITllf0bkr3U=
x-ms-exchange-transport-forked: True
Content-ID: <146AD0307B5F9244BBC8DDA184B159E7@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a27219f-e288-40ed-58a1-08d7256b0eb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 12:36:43.7009 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v3esOl9TUoOBUT+lZNM3sgVnetHnHqU17rO7Z+sPONv4wwgSfwxT+95rBolR+Cawb4F7uJS/ri+f1hdfIN3bxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6462
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:33:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5lW6ZVJMifvtjp+A6LbX1tQh/oG5NkB6LjiBbFbcgA=;
 b=Fvf87/FxuhC1NjhNOWkEPQMv2VuCFQELwbtjp7wBrdK3fgg86cibRG3BxtK2yol/5Bmof8JGu8pQYD+CBN5BLHryDGLysP7gfh1pprYleLKIzKIPCaLtuZE2chyrIHGWb/d9PyLJI3y2pb9IDD96ZSshK4QcTRMSWO3D+6Sr8YQ=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMTE6NDU6NTRBTSArMTAwMCwgU3RlcGhlbiBSb3Rod2Vs
bCB3cm90ZToNCj4gSGkgYWxsLA0KPiANCj4gT24gTW9uLCAxOSBBdWcgMjAxOSAxODozNDo0MSAt
MDcwMCBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4gd3JvdGU6DQo+ID4NCj4g
PiBPbiA4LzE5LzE5IDI6MTggQU0sIFN0ZXBoZW4gUm90aHdlbGwgd3JvdGU6DQo+ID4gPiBIaSBh
bGwsDQo+ID4gPiANCj4gPiA+IENoYW5nZXMgc2luY2UgMjAxOTA4MTY6DQo+ID4gPiAgIA0KPiA+
IA0KPiA+IG9uIHg4Nl82NDoNCj4gPiANCj4gPiAuLi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZHJ2LmM6IEluIGZ1bmN0aW9uIOKAmGFtZGdwdV9leGl04oCZOg0KPiA+IC4uL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYzoxNDcxOjI6IGVycm9yOiBpbXBs
aWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhtbXVfbm90aWZpZXJfc3luY2hyb25pemXi
gJk7IGRpZCB5b3UgbWVhbiDigJhfX3N5bmNfc3luY2hyb25pemXigJk/IFstV2Vycm9yPWltcGxp
Y2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0KPiA+ICAgbW11X25vdGlmaWVyX3N5bmNocm9uaXpl
KCk7DQo+ID4gICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gPiAgIF9fc3luY19zeW5jaHJv
bml6ZQ0KPiA+IA0KPiA+IA0KPiA+IEZ1bGwgcmFuZGNvbmZpZyBmaWxlIGlzIGF0dGFjaGVkLg0K
PiANCj4gQ2F1c2VkIGJ5IGNvbW1pdA0KPiANCj4gICA2ODMyYzlkYzgzNTggKCJobW06IHVzZSBt
bXVfbm90aWZpZXJfZ2V0L3B1dCBmb3IgJ3N0cnVjdCBobW0nIikNCj4gDQo+IGZyb20gdGhlIGht
bSB0cmVlLg0KPiANCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIG5l
ZWQgdG8gaW5jbHVkZSBsaW51eC9tbXVfbm90aWZpZXIuaA0KDQpBaCB5ZXMsIHRoYW5rcywgaXQg
aXMgYmVjYXVzZSBvZiAhQ09ORklHX0hNTV9NSVJST1IgaW4gdGhpcw0KcmFuZGNvbmZpZy4gSSd2
ZSBmaXhlZCBpdCB1cC4NCg0KUmVnYXJkcywNCkphc29uDQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
