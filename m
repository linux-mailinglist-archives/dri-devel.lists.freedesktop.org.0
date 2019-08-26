Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8289DEBA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 09:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC37897C5;
	Tue, 27 Aug 2019 07:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0716.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::716])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6586E2F3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 19:59:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRzljwf6/beSMvsGWgUin0Mr0azW4md7lMVeJDYuE9pC6nf5U8tzMMV0RBoD1LENHcpgewjpF0VYl99SQBBxKpgLwSgb0HPBjFptdGOHBS+2Iy9908pbACdr4rZUwC5F8qzhlmbqMBud5FcaocF+hR/e/pf+FbVrK2H5C9y+NkbKBA5XLiJYLQRI/K2UhB3suUhpqMlYMeWuxEYsLOSLbPNs6IpEmMdFoXwIg4entrRYIN4JTr3RKl3TdVqwWp5VwUGCpG9X8nUeCCEIJWI11wIi8S+Orr1Hw/bXS/Z95hIskEjdw/nFzedd/5Bh6BaG2WD4fg96EzfqUcy3qSZubg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r48C9G2I6doSYZhilQaVgfdxXd9WEOXf/GFjchabS4M=;
 b=T4cM22YhXwPU9O7U5ZwsnFrsftP3LHP39QzjiduOrq6ZK+t//bw8tjuOn9TSuAtj4bXExCpDancr0O+5ZY0eHsUzqOJ9l12wRoKE8cwYlK86Ye6c1ZUib1Rc45TSEWAXajXcMZD8HUleosCJv9AOGj8DwSIZDH3BqH6EssqN6d/9sLAlrtWI6bVNr3UkiSK8k2MYuSx5kheUWjEASxeFkscKdnuk6xMKDASXqPNDHZ7yPwJ31MB2Mkc4eCr/MXkNQjiN9dQilAGh/wBpw0JDKspIEFRSKOI/IT6GJtXFtQ8El2gQb3GHkqqxxbtiWFhyBaCiS7QE1qvU9EBovmS/0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3340.eurprd02.prod.outlook.com (52.134.67.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 26 Aug 2019 19:58:58 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::a0df:d7d9:f95e:f3ea]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::a0df:d7d9:f95e:f3ea%3]) with mapi id 15.20.2178.023; Mon, 26 Aug 2019
 19:58:58 +0000
From: Peter Rosin <peda@axentia.se>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/3] fbdev: fbmem: allow overriding the number of bootup
 logos
Thread-Topic: [PATCH v2 2/3] fbdev: fbmem: allow overriding the number of
 bootup logos
Thread-Index: AQHVXEiydN7Y70k3jUSZvl39hK1AWQ==
Date: Mon, 26 Aug 2019 19:58:58 +0000
Message-ID: <20190826195740.29415-3-peda@axentia.se>
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
x-ms-office365-filtering-correlation-id: 365c794a-7de3-43a0-a10a-08d72a5fd542
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB3PR0202MB3340; 
x-ms-traffictypediagnostic: DB3PR0202MB3340:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0202MB33406A3E38AD7B784776CE9BBCA10@DB3PR0202MB3340.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(366004)(396003)(39830400003)(136003)(189003)(199004)(8936002)(256004)(316002)(54906003)(26005)(476003)(2616005)(99286004)(102836004)(76176011)(386003)(6506007)(66066001)(52116002)(5640700003)(508600001)(186003)(6436002)(486006)(66946007)(66476007)(66446008)(36756003)(64756008)(66556008)(2351001)(1076003)(6486002)(6916009)(2906002)(50226002)(86362001)(71200400001)(71190400001)(2501003)(53936002)(6512007)(4326008)(25786009)(11346002)(446003)(3846002)(6116002)(305945005)(14454004)(81156014)(81166006)(5024004)(14444005)(5660300002)(7736002)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR0202MB3340;
 H:DB3PR0202MB3434.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: l6jgyRjVcYmbXaWS06x6L2ziSOqjiebJWE0Y/JserifjhN5BCa/xxlEv9DOtPz0aL7QBJxmoAvH/a/9hYo1p6ekmRQrWN2XPKKGffhrZYP4RcfjfZqteYWhKRxwxMUfpiKOB/iE1ZiB2s7i2dXo88or7Z7VqCkhNs7n2oWC1YsexYearZA6rmqsHFGgcA3w9PvtLZ7woEwO0jeVLs5+vjMjFK51oBY6ZQsdGaL4NjHJ1fz1+igS3jFOryCiS4udf3D37azgkHbAxCYUznf5rUlA0gaA4G/99LiBl05lZ1jcUQnsuDG1AwVPQLKVGe0F2IBwHpkTU0/yCHLlp5LMQEj4TKFkUGpkvb8ZVb0I5q7hDXMNl95LPVnWU8u0gQHw/Tc0e8E+33F/NSSEKK1cfF5gcDrdv8pO0pX6cyM3X0Dg=
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 365c794a-7de3-43a0-a10a-08d72a5fd542
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 19:58:58.6526 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ffz/OaaPPIlQqPQFeossdHYIMwCeTNjOLUNmf6dQeWhOQyQZAD5T9SuWwE7uJOno
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3340
X-Mailman-Approved-At: Tue, 27 Aug 2019 07:29:19 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axentia.se; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r48C9G2I6doSYZhilQaVgfdxXd9WEOXf/GFjchabS4M=;
 b=cK4obFu0JaYJvAXAxs0++rP4HhqiIaDmrUu38U8CQsVVZ7eJVcE4s97Zueb/e/K4QFA2E3jJTHcvU0OodROg/CRwgLNO1PJjHIIK9L+pRKrpKv98upto1iAwkxskijS9fVsYNhxw+nE8GM1+F/qEV/84wHC+BYRMJi14eEuu1cQ=
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

UHJvYmFibHkgbW9zdCB1c2VmdWwgaWYgeW91IG9ubHkgd2FudCBvbmUgbG9nbyByZWdhcmRsZXNz
IG9mIGhvdyBtYW55CkNQVSBjb3JlcyB5b3UgaGF2ZS4KClNpZ25lZC1vZmYtYnk6IFBldGVyIFJv
c2luIDxwZWRhQGF4ZW50aWEuc2U+Ci0tLQogRG9jdW1lbnRhdGlvbi9mYi9mYmNvbi5yc3QgICAg
ICAgfCA1ICsrKysrCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYyB8IDcgKysrKysr
KwogZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMgfCA0ICsrKy0KIGluY2x1ZGUvbGlu
dXgvZmIuaCAgICAgICAgICAgICAgIHwgMSArCiA0IGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2ZiL2ZiY29u
LnJzdCBiL0RvY3VtZW50YXRpb24vZmIvZmJjb24ucnN0CmluZGV4IDY1YmE0MDI1NTEzNy4uOWYw
YjM5OWQ4ZDRlIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2ZiL2ZiY29uLnJzdAorKysgYi9E
b2N1bWVudGF0aW9uL2ZiL2ZiY29uLnJzdApAQCAtMTc0LDYgKzE3NCwxMSBAQCBDLiBCb290IG9w
dGlvbnMKIAlkaXNwbGF5ZWQgZHVlIHRvIG11bHRpcGxlIENQVXMsIHRoZSBjb2xsZWN0ZWQgbGlu
ZSBvZiBsb2dvcyBpcyBtb3ZlZAogCWFzIGEgd2hvbGUuCiAKKzkuIGZiY29uPWxvZ28tY291bnQ6
PG4+CisKKwlUaGUgdmFsdWUgJ24nIG92ZXJyaWRlcyB0aGUgbnVtYmVyIG9mIGJvb3R1cCBsb2dv
cy4gWmVybyBnaXZlcyB0aGUKKwlkZWZhdWx0LCB3aGljaCBpcyB0aGUgbnVtYmVyIG9mIG9ubGlu
ZSBjcHVzLgorCiBDLiBBdHRhY2hpbmcsIERldGFjaGluZyBhbmQgVW5sb2FkaW5nCiAKIEJlZm9y
ZSBnb2luZyBvbiB0byBob3cgdG8gYXR0YWNoLCBkZXRhY2ggYW5kIHVubG9hZCB0aGUgZnJhbWVi
dWZmZXIgY29uc29sZSwgYW4KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9m
YmNvbi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMKaW5kZXggYzkyMzVhMmY0
MmY4Li5iZTRiYzU1NDBhYWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9m
YmNvbi5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jCkBAIC01MzYsNiAr
NTM2LDEzIEBAIHN0YXRpYyBpbnQgX19pbml0IGZiX2NvbnNvbGVfc2V0dXAoY2hhciAqdGhpc19v
cHQpCiAJCQkJZmJfY2VudGVyX2xvZ28gPSB0cnVlOwogCQkJY29udGludWU7CiAJCX0KKworCQlp
ZiAoIXN0cm5jbXAob3B0aW9ucywgImxvZ28tY291bnQ6IiwgMTEpKSB7CisJCQlvcHRpb25zICs9
IDExOworCQkJaWYgKCpvcHRpb25zKQorCQkJCWZiX2xvZ29fY291bnQgPSBzaW1wbGVfc3RydG91
bChvcHRpb25zLCAmb3B0aW9ucywgMCk7CisJCQljb250aW51ZTsKKwkJfQogCX0KIAlyZXR1cm4g
MTsKIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jIGIvZHJp
dmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMKaW5kZXggNjRkZDczMjAyMWQ4Li5hN2Q4MDIy
ZGI1MTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jCisrKyBi
L2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jCkBAIC01Niw2ICs1Niw4IEBAIEVYUE9S
VF9TWU1CT0wobnVtX3JlZ2lzdGVyZWRfZmIpOwogYm9vbCBmYl9jZW50ZXJfbG9nbyBfX3JlYWRf
bW9zdGx5OwogRVhQT1JUX1NZTUJPTChmYl9jZW50ZXJfbG9nbyk7CiAKK3Vuc2lnbmVkIGludCBm
Yl9sb2dvX2NvdW50IF9fcmVhZF9tb3N0bHk7CisKIHN0YXRpYyBzdHJ1Y3QgZmJfaW5mbyAqZ2V0
X2ZiX2luZm8odW5zaWduZWQgaW50IGlkeCkKIHsKIAlzdHJ1Y3QgZmJfaW5mbyAqZmJfaW5mbzsK
QEAgLTY4OSw3ICs2OTEsNyBAQCBpbnQgZmJfc2hvd19sb2dvKHN0cnVjdCBmYl9pbmZvICppbmZv
LCBpbnQgcm90YXRlKQogCWludCB5OwogCiAJeSA9IGZiX3Nob3dfbG9nb19saW5lKGluZm8sIHJv
dGF0ZSwgZmJfbG9nby5sb2dvLCAwLAotCQkJICAgICAgbnVtX29ubGluZV9jcHVzKCkpOworCQkJ
ICAgICAgZmJfbG9nb19jb3VudCA/OiBudW1fb25saW5lX2NwdXMoKSk7CiAJeSA9IGZiX3Nob3df
ZXh0cmFfbG9nb3MoaW5mbywgeSwgcm90YXRlKTsKIAogCXJldHVybiB5OwpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9mYi5oIGIvaW5jbHVkZS9saW51eC9mYi5oCmluZGV4IDMwMzc3MTI2NDY0
NC4uNWYyYjA1NDA2MjYyIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2ZiLmgKKysrIGIvaW5j
bHVkZS9saW51eC9mYi5oCkBAIC02MzAsNiArNjMwLDcgQEAgZXh0ZXJuIGludCBmYl9uZXdfbW9k
ZWxpc3Qoc3RydWN0IGZiX2luZm8gKmluZm8pOwogZXh0ZXJuIHN0cnVjdCBmYl9pbmZvICpyZWdp
c3RlcmVkX2ZiW0ZCX01BWF07CiBleHRlcm4gaW50IG51bV9yZWdpc3RlcmVkX2ZiOwogZXh0ZXJu
IGJvb2wgZmJfY2VudGVyX2xvZ287CitleHRlcm4gdW5zaWduZWQgaW50IGZiX2xvZ29fY291bnQ7
CiBleHRlcm4gc3RydWN0IGNsYXNzICpmYl9jbGFzczsKIAogI2RlZmluZSBmb3JfZWFjaF9yZWdp
c3RlcmVkX2ZiKGkpCQlcCi0tIAoyLjExLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
