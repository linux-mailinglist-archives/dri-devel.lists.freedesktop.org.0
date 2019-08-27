Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBBD9FCE9
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C6F89722;
	Wed, 28 Aug 2019 08:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10105.outbound.protection.outlook.com [40.107.1.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F07B894A7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 11:09:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LlVFuWg8UodMRa1zfCpjo3awEhcZbESYdq9rpPTtbKjdspm6g//MglKVK1Vk8cgJHGwD6I0/MZf+YQQBhE+cv1LTvoeK6XMm8w/R94qhy0C1JZ1V6MRii+je31uUmD8EzjNTd4Nu7LhewniXEudb5vH3ttUcZbFF0LTEzGZMYFwd+cgF6HktX1urAcesAc0lpBjJxgP5s7kXyaq4O8DmibiPOZUaXGW97NDm+pCtBtnrMuKzn5GSxSVHInDcF54XKlOmmNN7cGPDiR8xbQ9z3/wC1xKOrmOIzsCpmiKSgM/jwIygCA2lRlNsoyuq3pqNSx1C+zZq1IX53hyPLJeEgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzYkXKffNLiNfCQH5tfbnjcUD+zFyx9WF2wEk9JCzMY=;
 b=SechQxCzML1Tg4Em23j43XKFjVglpkPu4NVwdOkH+E2IaMbeR++BV4JIGLTmazaYYEg4mKTHR7XoDTrAf/ExEGGMa6ynCTqzxN3P/9zHhLyA3jysu/Fayp7mxuhwqfNk7ABha73J+mC6qsxNCzfmblO7WBG+TC9AZNOvtFIC6XU6wqgERm6LEfs5Hq+k9z+zjaWgauiI2SYfz61fZBPc/gz+IOTDWkL8m7Dv3mPUFs/0f+vb+TCXExq8Dz+59wN60PNEV34814n9Z0eNckhhspt1Z7lvj1eO4PPLBSZh0AZbNBZ3PwpTDhAyGgGIeX6pQA3ueKeMPZaKZsUGB76KCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3420.eurprd02.prod.outlook.com (52.134.67.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 27 Aug 2019 11:09:16 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::a0df:d7d9:f95e:f3ea]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::a0df:d7d9:f95e:f3ea%3]) with mapi id 15.20.2178.023; Tue, 27 Aug 2019
 11:09:16 +0000
From: Peter Rosin <peda@axentia.se>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/3] fbdev: fix numbering of fbcon options
Thread-Topic: [PATCH v3 1/3] fbdev: fix numbering of fbcon options
Thread-Index: AQHVXMfd9MAF8GUPp0SqrWDsOYLJ5w==
Date: Tue, 27 Aug 2019 11:09:16 +0000
Message-ID: <20190827110854.12574-2-peda@axentia.se>
References: <20190827110854.12574-1-peda@axentia.se>
In-Reply-To: <20190827110854.12574-1-peda@axentia.se>
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
x-ms-office365-filtering-correlation-id: 6f9b339b-b721-405d-dcf2-08d72adf001f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB3PR0202MB3420; 
x-ms-traffictypediagnostic: DB3PR0202MB3420:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0202MB3420B3E7154ED02B31752EFABCA00@DB3PR0202MB3420.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(346002)(39830400003)(396003)(376002)(199004)(189003)(3846002)(50226002)(2906002)(81156014)(6436002)(81166006)(4326008)(8936002)(6116002)(36756003)(66446008)(186003)(26005)(53936002)(76176011)(256004)(5640700003)(99286004)(52116002)(6506007)(102836004)(25786009)(6512007)(14444005)(386003)(66476007)(66556008)(1076003)(8676002)(5660300002)(6486002)(86362001)(14454004)(305945005)(7736002)(446003)(316002)(66066001)(64756008)(66946007)(2351001)(508600001)(2501003)(71190400001)(476003)(71200400001)(6916009)(486006)(11346002)(2616005)(54906003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR0202MB3420;
 H:DB3PR0202MB3434.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YIrlV1vWmV4GiLQ/KUBZLtLlblCypktSzvmuyU4DNnj7MeLAOEvUjBBD+XZNIRjDbvHYdQ5/Hz+w9szb7xKlSWEKebmtydfswbcbuuE96SnM/RX5+vpjeZpHeAIg9GYieXbIejBnEyCwoesJfoi/MauMzwK9+ue1f1ziWHaBc3DYoAnv0A0X+6UFbrs/Ivsz8WDIU00UhCkBpGAs29lHx5j9YMETFY20R0l24ucBVGfwz/C9Q1GVyIgMToVBN4W/poJzaXJJDJ/U5nW54OTbVS0KA6oIax6hJQ7HyKsDsz8RKnGtxJ2ZLmIi45IzC+DwzQBqeMnPEbf1Jan6q2PjZfZOzkOM0f/JkbreOzzxOnl8yRxiHjQoI76kjHbDjNzH83lCj0BcydySKiqUlVQHgyjgdtHaVlqs2om6qYpxJXE=
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f9b339b-b721-405d-dcf2-08d72adf001f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 11:09:16.5915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mZ0+DqBVKcyojV+oZvP7jAJh1oKG+NiXqawjOVhMPZyGfhRQPIlasPaioMgGhv3Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3420
X-Mailman-Approved-At: Wed, 28 Aug 2019 08:28:09 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axentia.se; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzYkXKffNLiNfCQH5tfbnjcUD+zFyx9WF2wEk9JCzMY=;
 b=gPPkmLboCGOlVVNYI2ZgjnejbnKWA3orDO/rMtZV4MUrW4Qggfr4ZLDmROzcSxay5d8SDAp4I6yYD3DVhADNMNtWxWkAj41U62HPq3+dNdO+jcW+i+aE+HxTmw4E+oP2HcY8+r/zmZaRUmP+GHXo6rbMx+9OHzlKg4Nndq2HLQ8=
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
