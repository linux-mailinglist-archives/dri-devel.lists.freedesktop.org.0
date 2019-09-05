Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF93AB2C2
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4DD6E155;
	Fri,  6 Sep 2019 07:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70083.outbound.protection.outlook.com [40.107.7.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCD68928B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 14:49:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EIylbdGE1EVlj9wu9nwaCJuRrI707OhvwBGnTgTIhnv/HFDWfKAaUsUBUwlrHMJ0KG0TBtpO3ElbGXMW9+FrZuF5TDS/VffHLW/0uyrqZi0Kt2MImW4agCHKkAJrDdu5ebG5JQ7mrQVigrnGOyB9rCiwWEuHOzUX3+P6A56MPvIHY8+jCAq01ZOd9MsW70LfQVNh6pU10TH/GrDHjSbUjj/KQ1tlTxJH1oaWTdIvF2b1NBd2Sa52Zzb6LG80a5WrjJ9X3fI8UJwgv5iDiSJvy7hHePg9nqaD3vmIODQ/TIa4iVv+i9TYZIb1iRN9vxryicEmK0GLeThTzvOTqorZ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CGgpiMxwsL6igR7+QqgBRYU93mG2jYhT5ek8gk7QPE=;
 b=Bfp3h+z6XMc1f1IKxjdCpuQSTlOwmjqPVKBtxiP1IzNE0bvEDV18HKww3ioDv3ySbkA+HxYEopNFZN3UR/JbhQ2Z+s/J+aMT0qw04avZQHp22bChGjcJyq+2cfW6oB+R4Ea+d0gUc/cQ84l/xLYXrKkJEJ7lZrlLR6fL+6deFhKhLskRXOFWE6PO6gIJY7MnzgVf3uUD0dIFYhncOGgQILFHUPPuxsEnbhmH0oM03aPB0im41KqzSJ42iU1NyvmMyRp3qxXOEoyvYqIOvaqdiyAf57bNHqK0byiWjD2vIPMq8g5D1KtU1TECUWeIGHw/51L5uBmxO/cyVc5yKsBvsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB4256.eurprd05.prod.outlook.com (52.133.12.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Thu, 5 Sep 2019 14:49:49 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::79a3:d971:d1f3:ab6f]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::79a3:d971:d1f3:ab6f%7]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 14:49:49 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 0/5] mmu notifer debug annotations
Thread-Topic: [PATCH 0/5] mmu notifer debug annotations
Thread-Index: AQHVY/kqS7drW7tYS0OaX2gILgkMmw==
Date: Thu, 5 Sep 2019 14:49:49 +0000
Message-ID: <20190905144946.GA22237@mellanox.com>
References: <20190826201425.17547-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20190826201425.17547-1-daniel.vetter@ffwll.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0425.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::29) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [193.47.165.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd59b6ed-9733-4cb9-93a1-08d732104cd9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB4256; 
x-ms-traffictypediagnostic: VI1PR05MB4256:
x-microsoft-antispam-prvs: <VI1PR05MB4256562AB84B0844F93239FCCFBB0@VI1PR05MB4256.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(39860400002)(136003)(376002)(199004)(53754006)(189003)(8676002)(8936002)(386003)(3846002)(81156014)(76176011)(54906003)(53936002)(86362001)(102836004)(6246003)(6116002)(7736002)(2906002)(6506007)(305945005)(52116002)(316002)(81166006)(6916009)(25786009)(6486002)(229853002)(99286004)(26005)(4326008)(66946007)(5660300002)(6512007)(33656002)(36756003)(66476007)(1076003)(486006)(66446008)(64756008)(66556008)(71190400001)(71200400001)(66066001)(6436002)(14454004)(4744005)(446003)(256004)(478600001)(2616005)(11346002)(476003)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4256;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: geCeaHgd+mTKJRfX0h8gvuKXdvU/D8ZbTSHB4mhrm2Me8VcHwpHYJc+wlFsXtVITXFTkDADEQrLgVkhX3xvCrSBvJ4rLeopOBUEB02R6wacHlBME4CxFnlLj0TvdU0KaOL0QrZUegiIoukQmR/BoFLvdD+EJL8/6Q7pOGI1ZZ9wVZzgWrMm54CdPLVO5zjqQCYhrrNm6FjMhexWllbWaOVjSlHjqiFJeHDrmiqdTRsB3/29e8Pzxhiw9ZjvUj503cIlB4EHlebiG3W5EEbQDbKE6Fq7HhiPBz19wGhhpOnc1U2s3iCJKzTm+l3pCMwMtTRET8T6YBI4AsKsTSkV0Qp1+9t+xwSwD1U/aMXpTkTs7TEYJUQvtqy8OzP9DRdCgqo6kQY6MweqwH+HzYgMidcUmsDmg5MPqEdgIyMn7cH8=
x-ms-exchange-transport-forked: True
Content-ID: <04647BF6CC7E11449F589A453BE4B4E0@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd59b6ed-9733-4cb9-93a1-08d732104cd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 14:49:49.6232 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nIf7WPDv3hzOOYMebUEEqA6sns02aoy3i+7TzAv8K6XpVea92/6MStbqsC3FkWMLN9kpmF/pokNlZ7rRT63uWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4256
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CGgpiMxwsL6igR7+QqgBRYU93mG2jYhT5ek8gk7QPE=;
 b=BBf28Ja+0dNr9KWmHIa2SU1e/zf8LROnAapoZjHUyUVlJ+ZqqGqO4UNL36G1FIx4Hp4lQecePb9nUKdsE8BG/mBdJxAVcipod4qUaqvHl7hhadTGAQBXARWgk0R+imwOTDY04L7CfFHCmwHcXsWD4ooSB3ZC3AfYrHoulYcFxUw=
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
Cc: Linux MM <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgMTA6MTQ6MjBQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBIaSBhbGwsCj4gCj4gTmV4dCByb3VuZC4gQ2hhbmdlczoKPiAKPiAtIEkga2VwdCB0
aGUgdHdvIGxvY2tkZXAgYW5ub3RhdGlvbnMgcGF0Y2hlcyBzaW5jZSB3aGVuIEkgcmViYXNlZCB0
aGlzCj4gICBiZWZvcmUgcmV0ZXN0aW5nIGxpbnV4LW5leHQgZGlkbid0IHlldCBoYXZlIHRoZW0u
IE90aGVyd2lzZSB1bmNoYW5nZWQKPiAgIGV4Y2VwdCBmb3IgYSB0cml2aWFsIGNvbmZsaWN0Lgo+
IAo+IC0gQWNrIGZyb20gUGV0ZXIgWi4gb24gdGhlIGtlcm5lbC5oIHBhdGNoLgo+IAo+IC0gQWRk
ZWQgYW5ub3RhdGlvbnMgZm9yIG5vbl9ibG9jayB0byBpbnZhbGlkYXRlX3JhbmdlX2VuZC4gSSBj
YW4ndCB0ZXN0Cj4gICB0aGF0IHJlYWRpbHkgc2luY2UgaTkxNSBkb2Vzbid0IHVzZSBpdC4KPiAK
PiAtIEFkZGVkIG1pZ2h0X3NsZWVwIGFubm90YXRpb25zIHRvIGFsc28gbWFrZSBzdXJlIHRoZSBt
bSBzaWRlIGtlZXBzIHVwCj4gICBpdCdzIHNpZGUgb2YgdGhlIGNvbnRyYWN0IGhlcmUgYXJvdW5k
IHdoYXQncyBhbGxvd2VkIGFuZCB3aGF0J3Mgbm90Lgo+IAo+IENvbW1lbnRzLCBmZWVkYmFjaywg
cmV2aWV3IGFzIHVzdWFsIHZlcnkgbXVjaCBhcHByZWNpYXRlZC4KPiAKPiAKPiBEYW5pZWwgVmV0
dGVyICg1KToKPiAgIGtlcm5lbC5oOiBBZGQgbm9uX2Jsb2NrX3N0YXJ0L2VuZCgpCj4gICBtbSwg
bm90aWZpZXI6IENhdGNoIHNsZWVwaW5nL2Jsb2NraW5nIGZvciAhYmxvY2thYmxlCgpUaGVzZSB0
d28gYXBwbGllZCB0byBobW0uZ2l0LCB3aXRoIHRoZSBzbWFsbCBjaGVjayBwYXRjaCBlZGl0LCB0
aGFua3MhCgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
