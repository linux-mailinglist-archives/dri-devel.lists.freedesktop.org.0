Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3746C9DEBD
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 09:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939BB897E3;
	Tue, 27 Aug 2019 07:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on071b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::71b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A5289070
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 19:58:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eju46C8364uT/n+fZscxhbmRk2A6pfLet9S0RxD2vCPFXhlrkfbqcUneGResVbXo1ZmGLZZr9OGWus63vnbjx/6bBcdFdlxBDXhl2UPpydJqQeylKrhj47Q42gpKW32BY9n+C+6ClcRRJzG5jazdB9cFs/azvnKsnFiSsx0hp3bHMDZTxuwhXZpIizSJMSJ/g1Sy/h+CRZQCEHb6bpMopbbohbLqiYcz5KDLa7rEHOYSx543v+0eYilShArNXGad1N66xvW/FwH1E5cj+a6cazCjtIg8x6NI/wX8i1cIPVeFNvKJP5huDFpUffHz1Vg16y1AN2W8uPdddV6L3BcBOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzYkXKffNLiNfCQH5tfbnjcUD+zFyx9WF2wEk9JCzMY=;
 b=SA13ZlqIiNNKW4H7TDi+0cROuZnjuFTK41ykypwTA4md8bUgHA/jvQyzJ/A+I5TazIlkME5GCZkVSxrRMLem2/+DzFnGLC7mQFANqybxjLbw2o4CYDfSyB4AmYtlGjM4iLXDzwu+zsfjfNOQfHfAgwD4bMhEOKrNiczLcfRYesnPwWGcQfKi9Q9YIW/PIEIeIDWmOCfrGYrw1gOphhpkSkBsF2qn9+sPxb5ZZpD+spZLNtKCxT+/pZW7uCgTqaQjBHHAUBbMQrUn6vI2KnJ++G2V10j/3vZfgAjQo0P/g8KkJ6WzY5RSFlsl+QuovRMCZC4qba7gdKJexpTU4SFX+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3340.eurprd02.prod.outlook.com (52.134.67.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 26 Aug 2019 19:58:54 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::a0df:d7d9:f95e:f3ea]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::a0df:d7d9:f95e:f3ea%3]) with mapi id 15.20.2178.023; Mon, 26 Aug 2019
 19:58:54 +0000
From: Peter Rosin <peda@axentia.se>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/3] fbdev: fix numbering of fbcon options
Thread-Topic: [PATCH v2 1/3] fbdev: fix numbering of fbcon options
Thread-Index: AQHVXEiw/LRCleLuAUGVU4XBezNSZg==
Date: Mon, 26 Aug 2019 19:58:54 +0000
Message-ID: <20190826195740.29415-2-peda@axentia.se>
References: <20190826195740.29415-1-peda@axentia.se>
In-Reply-To: <20190826195740.29415-1-peda@axentia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.11.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0901CA0054.eurprd09.prod.outlook.com
 (2603:10a6:3:45::22) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e335a9b-3f48-478b-80ed-08d72a5fd2c3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB3PR0202MB3340; 
x-ms-traffictypediagnostic: DB3PR0202MB3340:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0202MB3340C8B75558178783E6F3D5BCA10@DB3PR0202MB3340.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(366004)(396003)(39830400003)(136003)(189003)(199004)(8936002)(256004)(316002)(54906003)(26005)(476003)(2616005)(99286004)(102836004)(76176011)(386003)(6506007)(66066001)(52116002)(5640700003)(508600001)(186003)(6436002)(486006)(66946007)(66476007)(66446008)(36756003)(64756008)(66556008)(2351001)(1076003)(6486002)(6916009)(2906002)(50226002)(86362001)(71200400001)(71190400001)(2501003)(53936002)(6512007)(4326008)(25786009)(11346002)(446003)(3846002)(6116002)(305945005)(14454004)(81156014)(81166006)(14444005)(5660300002)(7736002)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR0202MB3340;
 H:DB3PR0202MB3434.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jRI+w2kFyTUjZ+qAHX3MgBO1rVtqYYYmMNDaeKrCWca9U3zBrC8Ffjag6IgE26KrlX4xrqOXl1PHvOamS7TK707YHNn9t8l4P0C2DZOt7mg3eJUtwTnHxwn+YGeoljAf1UdvzhQF3/LbWvpV10bX1Ru8VyK/FoW3OB8DzmO+wMlsC0wKx5dw5WQb8oQgMPg6LlEosN9OJOJG7c89WyfZNcecqTNxWVgMfrLTzXlWpt1UGPTIotZqoF79Q4VOrrhe6IYDOIY32E+b0TkzAsLx9OfJV2X3r8sZAo20+5eMuOeL/c9e+eVDMR5zX2g6tyHn7J7G5bKm9AlJsVEl1KM6VY4jCAqbfy3uczx//uHhrxoRSWm7OW4sbW3KBCsdYcNWQL4/WIm6VJe23PGVyRPambCFZDhH4Ob7nN/ERdcpdgw=
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e335a9b-3f48-478b-80ed-08d72a5fd2c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 19:58:54.5250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WgMgXxylxdlEiVwcbDA4ZfefUI6ScWPqweRDa1vTCiXxw/gpQaABBZFr7h3pEhWI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3340
X-Mailman-Approved-At: Tue, 27 Aug 2019 07:29:19 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axentia.se; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzYkXKffNLiNfCQH5tfbnjcUD+zFyx9WF2wEk9JCzMY=;
 b=h/DTEI2N4Zbzzl3U4u5aPIWhNu+L4aGyzG9+PwHaSMggENpO5r6L9rXNJ3g5WGdE1YaUA0xz7HMb+KZYJHyxXtdguRTEGbVfR/pa7IztkZStVOAcj5KvJfwsxPiUp3aW/QmPncW7vKaTLgMqFBTS+hJP6grH4u0M3E03ebxtY0Q=
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
 Matthew Wilcox <willy@infradead.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhyZWUgc2hhbGwgYmUgdGhlIG51bWJlciB0aG91IHNoYWx0IGNvdW50LCBhbmQgdGhlIG51bWJl
ciBvZiB0aGUKY291bnRpbmcgc2hhbGwgYmUgdGhyZWUuIEZvdXIgc2hhbHQgdGhvdSBub3QgY291
bnQuLi4KCk9uZSEgVHdvISBGaXZlIQoKRml4ZXM6IGVmYjk4NWY2YjI2NSAoIltQQVRDSF0gZmJj
b246IENvbnNvbGUgUm90YXRpb24gLSBBZGQgZnJhbWVidWZmZXIgY29uc29sZSBkb2N1bWVudGF0
aW9uIikKU2lnbmVkLW9mZi1ieTogUGV0ZXIgUm9zaW4gPHBlZGFAYXhlbnRpYS5zZT4KLS0tCiBE
b2N1bWVudGF0aW9uL2ZiL2ZiY29uLnJzdCB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9mYi9mYmNvbi5yc3QgYi9Eb2N1bWVudGF0aW9uL2ZiL2ZiY29uLnJzdAppbmRleCBlYmNhNDE3
ODVhYmUuLjY1YmE0MDI1NTEzNyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9mYi9mYmNvbi5y
c3QKKysrIGIvRG9jdW1lbnRhdGlvbi9mYi9mYmNvbi5yc3QKQEAgLTEyNyw3ICsxMjcsNyBAQCBD
LiBCb290IG9wdGlvbnMKIAlpcyB0eXBpY2FsbHkgbG9jYXRlZCBvbiB0aGUgc2FtZSB2aWRlbyBj
YXJkLiAgVGh1cywgdGhlIGNvbnNvbGVzIHRoYXQKIAlhcmUgY29udHJvbGxlZCBieSB0aGUgVkdB
IGNvbnNvbGUgd2lsbCBiZSBnYXJibGVkLgogCi00LiBmYmNvbj1yb3RhdGU6PG4+Cis1LiBmYmNv
bj1yb3RhdGU6PG4+CiAKIAlUaGlzIG9wdGlvbiBjaGFuZ2VzIHRoZSBvcmllbnRhdGlvbiBhbmds
ZSBvZiB0aGUgY29uc29sZSBkaXNwbGF5LiBUaGUKIAl2YWx1ZSAnbicgYWNjZXB0cyB0aGUgZm9s
bG93aW5nOgpAQCAtMTUyLDIxICsxNTIsMjEgQEAgQy4gQm9vdCBvcHRpb25zCiAJQWN0dWFsbHks
IHRoZSB1bmRlcmx5aW5nIGZiIGRyaXZlciBpcyB0b3RhbGx5IGlnbm9yYW50IG9mIGNvbnNvbGUK
IAlyb3RhdGlvbi4KIAotNS4gZmJjb249bWFyZ2luOjxjb2xvcj4KKzYuIGZiY29uPW1hcmdpbjo8
Y29sb3I+CiAKIAlUaGlzIG9wdGlvbiBzcGVjaWZpZXMgdGhlIGNvbG9yIG9mIHRoZSBtYXJnaW5z
LiBUaGUgbWFyZ2lucyBhcmUgdGhlCiAJbGVmdG92ZXIgYXJlYSBhdCB0aGUgcmlnaHQgYW5kIHRo
ZSBib3R0b20gb2YgdGhlIHNjcmVlbiB0aGF0IGFyZSBub3QKIAl1c2VkIGJ5IHRleHQuIEJ5IGRl
ZmF1bHQsIHRoaXMgYXJlYSB3aWxsIGJlIGJsYWNrLiBUaGUgJ2NvbG9yJyB2YWx1ZQogCWlzIGFu
IGludGVnZXIgbnVtYmVyIHRoYXQgZGVwZW5kcyBvbiB0aGUgZnJhbWVidWZmZXIgZHJpdmVyIGJl
aW5nIHVzZWQuCiAKLTYuIGZiY29uPW5vZGVmZXIKKzcuIGZiY29uPW5vZGVmZXIKIAogCUlmIHRo
ZSBrZXJuZWwgaXMgY29tcGlsZWQgd2l0aCBkZWZlcnJlZCBmYmNvbiB0YWtlb3ZlciBzdXBwb3J0
LCBub3JtYWxseQogCXRoZSBmcmFtZWJ1ZmZlciBjb250ZW50cywgbGVmdCBpbiBwbGFjZSBieSB0
aGUgZmlybXdhcmUvYm9vdGxvYWRlciwgd2lsbAogCWJlIHByZXNlcnZlZCB1bnRpbCB0aGVyZSBh
Y3R1YWxseSBpcyBzb21lIHRleHQgaXMgb3V0cHV0IHRvIHRoZSBjb25zb2xlLgogCVRoaXMgb3B0
aW9uIGNhdXNlcyBmYmNvbiB0byBiaW5kIGltbWVkaWF0ZWx5IHRvIHRoZSBmYmRldiBkZXZpY2Uu
CiAKLTcuIGZiY29uPWxvZ28tcG9zOjxsb2NhdGlvbj4KKzguIGZiY29uPWxvZ28tcG9zOjxsb2Nh
dGlvbj4KIAogCVRoZSBvbmx5IHBvc3NpYmxlICdsb2NhdGlvbicgaXMgJ2NlbnRlcicgKHdpdGhv
dXQgcXVvdGVzKSwgYW5kIHdoZW4KIAlnaXZlbiwgdGhlIGJvb3R1cCBsb2dvIGlzIG1vdmVkIGZy
b20gdGhlIGRlZmF1bHQgdG9wLWxlZnQgY29ybmVyCi0tIAoyLjExLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
