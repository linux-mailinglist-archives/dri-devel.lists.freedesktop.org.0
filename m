Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E079C69F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8208D6E111;
	Mon, 26 Aug 2019 00:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on070b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe08::70b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8AED6EC1E
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 08:47:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OlKgC1IrgNIFKl4vw1Y7wDsD+lNZYR2772EAlkj6uV14ryKuo0Q1kupX8uxgNJqW8DptcGFdERo2EeUK3yuKX4sgnxqsQsFydCYNUjeCilps0i+cLnxzblLl1nxlRHE3G1GbTaWoTXLvbzkZDGoR3ZM0XgnBWKKxTwXo+uaoVgJqWhG2lq0jQosVMYbpb5bzChzmc52Kuh4xToYIMiEZETbutp6cygb8wdTjjqenxrOCPkwdDXZRaNdQRZ5asRpKtPGBKMvejmbQ6Dwp6r8AOU2pmPWnMLOz44CPM1HHP8swAVP4Q/YKSiET0DWGfzPqV/f0h6PWt9pPLF1fiZ1WQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzYkXKffNLiNfCQH5tfbnjcUD+zFyx9WF2wEk9JCzMY=;
 b=BE7I7WrhDW+aLOwLVrC+fqEGZXwpyIItfJ0g+6XJB7bRDsiWK/XQbQM8Yx32zFHOSwRQlbQPOFUGnWc41AGqamRj0Ae2G5Anmk6lRehPumUec9C1X9Fzx9/2d04Wz7ebw+SpVjpyyDNKGryS/egvJNLe9GIaqiknuSZf2VZ33LySHvKj6ghpjgfWFzykMcLQcTNEoXQO2XFtTa6cSP3joPsFpp+iSD1weyC46sjtC1dIiLNW9JHhRjjNtWB+W0zdVelF2FNkQkjHp7QnB9l5OCfUuwWWluS56de5l56USwktvtl6f1mKWar59UkNtqdx7RMLlEnGmSnb/L9rb/dlfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3530.eurprd02.prod.outlook.com (52.134.69.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Fri, 23 Aug 2019 08:47:41 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::a0df:d7d9:f95e:f3ea]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::a0df:d7d9:f95e:f3ea%3]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 08:47:41 +0000
From: Peter Rosin <peda@axentia.se>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] fbdev: fix numbering of fbcon options
Thread-Topic: [PATCH 1/2] fbdev: fix numbering of fbcon options
Thread-Index: AQHVWY9s15L4R7AIg0aauCg41bxnyg==
Date: Fri, 23 Aug 2019 08:47:40 +0000
Message-ID: <20190823084725.4271-2-peda@axentia.se>
References: <20190823084725.4271-1-peda@axentia.se>
In-Reply-To: <20190823084725.4271-1-peda@axentia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.11.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0401CA0084.eurprd04.prod.outlook.com
 (2603:10a6:3:19::52) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 861411c9-a759-440a-3590-08d727a68e66
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB3PR0202MB3530; 
x-ms-traffictypediagnostic: DB3PR0202MB3530:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0202MB3530FC030785B7F4EFC49CADBCA40@DB3PR0202MB3530.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39830400003)(396003)(136003)(346002)(376002)(366004)(199004)(189003)(14454004)(186003)(6116002)(2616005)(476003)(2501003)(26005)(71190400001)(6436002)(2351001)(6512007)(8676002)(81156014)(54906003)(81166006)(76176011)(52116002)(6506007)(386003)(2906002)(3846002)(25786009)(102836004)(11346002)(446003)(99286004)(486006)(508600001)(5660300002)(305945005)(66446008)(66066001)(64756008)(66556008)(7736002)(6486002)(50226002)(36756003)(8936002)(5640700003)(1076003)(53936002)(4326008)(86362001)(256004)(14444005)(66476007)(316002)(66946007)(71200400001)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR0202MB3530;
 H:DB3PR0202MB3434.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oboJipY39yjqH7VHajiBsPkZb9g8xjTNWNS1G+i0S2a8sUT2TOB+Kr8QCyGKHtGdz6ds4tbHiaMz+n1iFbWZo00TI2FPZkeZq95PGn3fCvjKgeWB3+mH/yEtX9En/UBT+C1E2n7Glv8gKQpBr+MDHg5dLJICYqH9FbxGe7w/KITueVP+nXyPQW92LJl6gP8T4y9Q3l5XnzeuRFEkeJ4XA3lS7IbJM0En/PMb+dsXXjs9lK3mIKeDQS46HNTlH6MPPqWAPw56AGwhFLJDRwDv4JFSOiAP/VAwLTldszlVIPYMY8i1m5AU8gdtuPym7o3wq5FiaI0RFXnR6l4KGqGGRgIIUU0tg6fNkL8hxVI4YGCRi4QxyqIlLwIklPYvRY7bh6pNFshb5ER/TkCEMvaPeEak5Vxox1oYvhRWJ0NV3dU=
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 861411c9-a759-440a-3590-08d727a68e66
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 08:47:40.9178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3J9LnhxrZW5PXeFypzWazag5FMwIdB4WHi0PDaZJSk2aoOvWQygOXZsA3FwLfezk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3530
X-Mailman-Approved-At: Mon, 26 Aug 2019 00:18:57 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axentia.se; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzYkXKffNLiNfCQH5tfbnjcUD+zFyx9WF2wEk9JCzMY=;
 b=Eoo1CAa6SJmQ92glKJYweU/qQvLNsMtFnFSi6ojaDG+thrRemm4l8AtBCtZla0FZMQNue3qArk9HthQT1MvnM58/AwHiUZMJ42wOTRARFNCEai+Af0jhvg2Ewr7cUbyJK9viSMlRekhAqHX1yVJ3DINUkGE0NU9VnlrdYHSYfEg=
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
 Peter Rosin <peda@axentia.se>
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
