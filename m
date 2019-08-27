Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9019FD04
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B049B89CDE;
	Wed, 28 Aug 2019 08:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10105.outbound.protection.outlook.com [40.107.1.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EBD894A7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 11:09:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAV6j1SjBj1Ycdlvo96H8/tpxsFmU3MIY8rapajZdeW0HAbJ/E5WQch7MfXdOvLWeWuDIBBp9GRZD19lNmA8y09P3fMS3YCxGD/2CBstLsAvhpDzZpQfJ/MxRMexPmM87AnV8taEMj1NJxpQBa/j6gmWW+6y17SdFCjz0YZlsRfCxuP+4+/iV2YJ8nOMxezIiqEbwvmYgbLBeHaBNpU71k0mUQgUXW/cchZpjJLu6wJ3pGLnXGPz6Dw+pcx0XDGysHd7SSKH8Y6jJHSpm0c+NZIRVB1tXe3kCqaTpE5jrpHcxaa5aY+l4QwK2EjCF0qs9Q+GBerXIaIWycyiBQSjZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYo8sJBv8YM1g/V/cokURBHRLd8P6275YpESc1rKdIE=;
 b=YN+AkrztSL73oWy3BiefA4vEHHf056HG2ag9RGln+ZvkdGdlwC8i6sJErwkR76550WfQnIpaZXisbc0e0tqT8a1xOKWWA6gsi70lu/RG0/rnHUTaZNnjRkkU9Gn/Y8n5WC8EF+P7qq5qti5KNgechhXXtiRmZaYElHtCI27SJ6xGCcKNzJKeuBIQCChBx43eLNvENv9RneVquSk6S6zNk0lkBwBD2o71bKddRIoVuIeDg/JiLdGo8YURNiIsPy2N4o/8zAgERQwMmeaS7ZHW3x3zl/ADmxzMczTirELnNfo0TOROVrvJ+pmSFYssZFJf+lzKMQRNJoPtbgn8jbyUXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3420.eurprd02.prod.outlook.com (52.134.67.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 27 Aug 2019 11:09:11 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::a0df:d7d9:f95e:f3ea]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::a0df:d7d9:f95e:f3ea%3]) with mapi id 15.20.2178.023; Tue, 27 Aug 2019
 11:09:11 +0000
From: Peter Rosin <peda@axentia.se>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/3] Add possibility to specify the number of displayed
 logos
Thread-Topic: [PATCH v3 0/3] Add possibility to specify the number of
 displayed logos
Thread-Index: AQHVXMfaisPyvC57MUmljkwoBL1ZPA==
Date: Tue, 27 Aug 2019 11:09:11 +0000
Message-ID: <20190827110854.12574-1-peda@axentia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.11.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0802CA0012.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::22) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99923712-40e9-4990-a6e9-08d72adefce1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB3PR0202MB3420; 
x-ms-traffictypediagnostic: DB3PR0202MB3420:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0202MB3420B6F0E4C07C5C98684127BCA00@DB3PR0202MB3420.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(346002)(39830400003)(396003)(376002)(199004)(189003)(3846002)(50226002)(2906002)(81156014)(6436002)(81166006)(4326008)(8936002)(6116002)(36756003)(66446008)(186003)(26005)(53936002)(256004)(5640700003)(99286004)(52116002)(6506007)(102836004)(25786009)(6512007)(14444005)(386003)(66476007)(66556008)(1076003)(4744005)(8676002)(5660300002)(6486002)(86362001)(14454004)(305945005)(7736002)(316002)(66066001)(64756008)(66946007)(2351001)(508600001)(2501003)(71190400001)(476003)(71200400001)(6916009)(486006)(2616005)(54906003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR0202MB3420;
 H:DB3PR0202MB3434.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nRINbDps++ALpDsPj3Vwaw1+WA7BKtcp34LG2dynwYdq0Y9KAckr8P8xvxjNT6GETPbs0D0W6QTcY+3GDTO5EQH0guSSPGUaP3a0ogBeA/TFnJVZYGg0zL7Qao+iRQnHOCvRWJcF9yA9G1O9IiDZN+bx75sLms0awoQKxSLDW9NZzZckEpE8PfhOqFCiWrkuH8bkQrDeGojozum/tKuZtf6v7Y0DEmWSF28G7vDsd3tQjY1/oHbzCaxWk/uOFmV4jtGWRdqgOQXEo8b44lEr8iW/INkNuPtk6hJ4IpB1Fp3DvmRmG5XtvgFwIft+rqiW8RAY3UtxmmgdXCjIQi8FiTY74XDRgxRxZbKqdDzbuH6J1I2A34tX7yU1wFEDi4J0TprVIPLhXhM82djFcycJc3f9cwDXeYldrt4FsbdIV/Y=
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 99923712-40e9-4990-a6e9-08d72adefce1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 11:09:11.6014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NHu3a5FVn7pFm7hTAjPCOlYZngF/4sZ7jk3F7z7jAo57OHlr3UuWTYw5Zb0nh78x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3420
X-Mailman-Approved-At: Wed, 28 Aug 2019 08:28:09 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axentia.se; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYo8sJBv8YM1g/V/cokURBHRLd8P6275YpESc1rKdIE=;
 b=WSPzSS36WfpmG9pSQkJjcW7L7DVCYUCLqEQJEQaxf2XNpuLEa15RMIrAtjj5SDC9iwbAh+XxhwCl1tHe7IkZCKKQSEHGI/8LIIzTHhzlnw/g6/OnkA08IiCazI2qTzWVocaNHawyvZWOlsIlNrJHe1BF2Mwht2/fTo6RAr1LPLQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Matthew Wilcox <willy@infradead.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhCgpUaGUgZmlyc3QgcGF0Y2ggZml4ZXMgdGhlIGZhY3QgdGhhdCB0aGVyZSBhcmUgdHdvIGl0
ZW1zIG51bWJlcmVkICI0IiBpbgp0aGUgbGlzdCBvZiBmYmNvbiBvcHRpb25zLiBUaGlzIGJ1ZyBp
cyBhIHRlZW5hZ2VyLi4uCgpUaGUgc2Vjb25kIHBhdGNoIGV4dGVuZHMgdGhhdCBsaXN0IHdpdGgg
YSBuZXcgb3B0aW9uIHRoYXQgYWxsb3dzIHRoZQp1c2VyIHRvIGRpc3BsYXkgYW55IG51bWJlciBv
ZiBsb2dvcyAodGhhdCBmaXRzIG9uIHRoZSBzY3JlZW4pLiBJIG5lZWQgaXQKdG8gbGltaXQgdGhl
IGRpc3BsYXkgdG8gb25seSBvbmUgbG9nbyBpbnN0ZWFkIG9mIG9uZSBmb3IgZWFjaCBDUFUgY29y
ZS4KCkNoYW5nZXMgc2luY2UgdjIKCi0gbWFrZSAtMSB0aGUgZGVmYXVsdCBhbmQgbWFrZSAwIGRp
c2FibGUgdGhlIGxvZ28gW0dlZXJ0IFV5dHRlcmhvZXZlbl0KLSBjcHUgLT4gQ1BVCgpDaGFuZ2Vz
IHNpbmNlIHYxCgotIGRvIG5vdCBuZWVkbGVzc2x5IGV4cG9ydCBmYl9sb2dvX2NvdW50IFtNYXR0
aGV3IFdpbGNveF0KLSBhZGRlZCBwYXRjaCAzLzMsIHdoaWNoIHJlbW92ZXMgdGhlIGV4cG9ydCBv
ZiBmYl9jZW50ZXJfbG9nbwoKQ2hlZXJzLApQZXRlcgoKUGV0ZXIgUm9zaW4gKDMpOgogIGZiZGV2
OiBmaXggbnVtYmVyaW5nIG9mIGZiY29uIG9wdGlvbnMKICBmYmRldjogZmJtZW06IGFsbG93IG92
ZXJyaWRpbmcgdGhlIG51bWJlciBvZiBib290dXAgbG9nb3MKICBmYmRldjogZmJtZW06IGF2b2lk
IGV4cG9ydGluZyBmYl9jZW50ZXJfbG9nbwoKIERvY3VtZW50YXRpb24vZmIvZmJjb24ucnN0ICAg
ICAgIHwgMTMgKysrKysrKysrLS0tLQogZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMg
fCAgNyArKysrKysrCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyB8IDEzICsrKysr
KysrKy0tLS0KIGluY2x1ZGUvbGludXgvZmIuaCAgICAgICAgICAgICAgIHwgIDEgKwogNCBmaWxl
cyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
