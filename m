Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2722A9C6B4
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EC66E149;
	Mon, 26 Aug 2019 00:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on071c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::71c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1566C6EC1E
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 08:47:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+UrdJs2RBL7ysUeQBTYAmfh31bAtT31zoyNyO+/XTrlRVIeugLgjkEreHsA6yFqCgnMjydfMa5LjjB+FeUPVaso7EtnUMvPzIQM1MIl8bHIjCVBxxyo7MR/1NUIu0i6sqvewVqMjm94SYMqBNE5FHdNPeFJ6DOSTpYR4YSPYXK6qjPbMkqODCEZMMJeFXfb7onVtQX7tkaIJMRI0yttz5X24LvpIvrpzgpmgJ2OhohnYyXzg0rAqRPoc8s83kyoUgoj/vKmQ6f/aq25EGiumdU6NQp+34KmaYUD7P/BS5qHEo9FAgeA9i5XXUffQvBjTHdoCNPHWv8pDANmaPJaqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHh5pz6CDFYyQgu2xiYoU4VNbYl3Y4bYqHD8MPU44Ys=;
 b=NvvzTpTa8bOCD8GdV0cw+rw7NOVPHomyACCfTSmlUIwpexvV6UvlX2/E2AkIs7jjpbcSIS/p5DVQhEwGw/wxzazxBhVBiZQxRd+1ufzqC+d5Ml49gYJxRgzrQR94FAA8zYFNR3ka9OQpXNWqhu0Ko0F5od3qYDGRwaYF9MouPEYoukodP83J5VNtFokHTNT9mewPErb5lcdJrom5APoyanrrIyq9BAvqcLmEb5jYBraG9/SpjyVU3VLRN2q3r0ailqblRnNiHDdKLqGpOtG1HbSfu38vpGWTFqRoDcvgz7MbF2uzFE1SDtJfUZEfdKgRyvTAfajanmisVm1I3Gq46g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3322.eurprd02.prod.outlook.com (52.134.66.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 23 Aug 2019 08:47:47 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::a0df:d7d9:f95e:f3ea]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::a0df:d7d9:f95e:f3ea%3]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 08:47:47 +0000
From: Peter Rosin <peda@axentia.se>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] fbdev: fbmem: allow overriding the number of bootup logos
Thread-Topic: [PATCH 2/2] fbdev: fbmem: allow overriding the number of bootup
 logos
Thread-Index: AQHVWY9wDEebDlWGKU6SxCgqM+Aamg==
Date: Fri, 23 Aug 2019 08:47:47 +0000
Message-ID: <20190823084725.4271-3-peda@axentia.se>
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
x-ms-office365-filtering-correlation-id: 81ce9c27-eab8-41e9-77f5-08d727a69292
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(2017052603328)(7193020);
 SRVR:DB3PR0202MB3322; 
x-ms-traffictypediagnostic: DB3PR0202MB3322:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0202MB3322286FA48DD9A55BB6D204BCA40@DB3PR0202MB3322.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(346002)(376002)(396003)(39830400003)(189003)(199004)(2501003)(2351001)(86362001)(66066001)(36756003)(71190400001)(6512007)(71200400001)(2906002)(3846002)(4326008)(14444005)(5024004)(53936002)(256004)(25786009)(7736002)(26005)(305945005)(6486002)(6916009)(186003)(1076003)(102836004)(6506007)(386003)(6436002)(99286004)(52116002)(76176011)(8936002)(6116002)(11346002)(446003)(476003)(2616005)(50226002)(486006)(81156014)(81166006)(508600001)(8676002)(14454004)(5660300002)(66446008)(66946007)(5640700003)(54906003)(64756008)(316002)(66476007)(66556008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR0202MB3322;
 H:DB3PR0202MB3434.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GyDYt5qs7zZtv0oluN+lgqNqjZR+tsbUxYPcjACL0Dc4g7Z449phE7gbkGWh3FSLO1PxWqUC7iAGbFzB0hgWp4FAuhjvzyuPo7vudCn3h5oDlTo/XCuBoXA1XxtADA/0R7uApop/UsoUJm+SgBGyJHyR0CMpOnOP7MiSeeLZqyQGciaVHRPnINkXrLdlvBb6oO6Lcdj5APtGtIiklxq/VR4pfsBhjGvn9fSBi+C0Z5Z1AGxJ/YD4SvPkVnZq50TMCl0wgwgIpN1aEzKm9Sp8BDdPIBnJ999+TTdGkMLF4R+/Z4e2oibTeRuP5PzmHumpGRr6CqReEObaPZ27M1z7wFuPy5u46/IZF5C8vKFyRBdFEllVxo60/+pwKRydp6lknSaeQeX9E6dDWaNAMq9rEs/N+j3Lenfm4w+rMLj6P7Q=
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ce9c27-eab8-41e9-77f5-08d727a69292
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 08:47:47.5200 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xq39EpXg9qMmY/xvrGnMgD5fhd+EOVctJHSlxfVMc9RbnI6HRxovsEg3kN9zjbmB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3322
X-Mailman-Approved-At: Mon, 26 Aug 2019 00:18:57 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axentia.se; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHh5pz6CDFYyQgu2xiYoU4VNbYl3Y4bYqHD8MPU44Ys=;
 b=NXDxQjWGXpKpJw5VZNzfeuzUuNUFBSe68UmsM3vq5bKCbPJxxoBMDje5zhieSnij7l1Vm5jlUuCRXrYc7E8qABW57f91VwTFUSS3aTGNl1wlcieAAZhkSzQ+nxE2/sQ6N/ygnV0n6cQMpTVJyVxs2x33cv/k9cfC11RWwN0jg38=
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

UHJvYmFibHkgbW9zdCB1c2VmdWwgaWYgeW91IG9ubHkgd2FudCBvbmUgbG9nbyByZWdhcmRsZXNz
IG9mIGhvdyBtYW55CkNQVSBjb3JlcyB5b3UgaGF2ZS4KClNpZ25lZC1vZmYtYnk6IFBldGVyIFJv
c2luIDxwZWRhQGF4ZW50aWEuc2U+Ci0tLQogRG9jdW1lbnRhdGlvbi9mYi9mYmNvbi5yc3QgICAg
ICAgfCA1ICsrKysrCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYyB8IDcgKysrKysr
KwogZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMgfCA1ICsrKystCiBpbmNsdWRlL2xp
bnV4L2ZiLmggICAgICAgICAgICAgICB8IDEgKwogNCBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9mYi9mYmNv
bi5yc3QgYi9Eb2N1bWVudGF0aW9uL2ZiL2ZiY29uLnJzdAppbmRleCA2NWJhNDAyNTUxMzcuLjlm
MGIzOTlkOGQ0ZSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9mYi9mYmNvbi5yc3QKKysrIGIv
RG9jdW1lbnRhdGlvbi9mYi9mYmNvbi5yc3QKQEAgLTE3NCw2ICsxNzQsMTEgQEAgQy4gQm9vdCBv
cHRpb25zCiAJZGlzcGxheWVkIGR1ZSB0byBtdWx0aXBsZSBDUFVzLCB0aGUgY29sbGVjdGVkIGxp
bmUgb2YgbG9nb3MgaXMgbW92ZWQKIAlhcyBhIHdob2xlLgogCis5LiBmYmNvbj1sb2dvLWNvdW50
OjxuPgorCisJVGhlIHZhbHVlICduJyBvdmVycmlkZXMgdGhlIG51bWJlciBvZiBib290dXAgbG9n
b3MuIFplcm8gZ2l2ZXMgdGhlCisJZGVmYXVsdCwgd2hpY2ggaXMgdGhlIG51bWJlciBvZiBvbmxp
bmUgY3B1cy4KKwogQy4gQXR0YWNoaW5nLCBEZXRhY2hpbmcgYW5kIFVubG9hZGluZwogCiBCZWZv
cmUgZ29pbmcgb24gdG8gaG93IHRvIGF0dGFjaCwgZGV0YWNoIGFuZCB1bmxvYWQgdGhlIGZyYW1l
YnVmZmVyIGNvbnNvbGUsIGFuCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUv
ZmJjb24uYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jCmluZGV4IGM5MjM1YTJm
NDJmOC4uYmU0YmM1NTQwYWFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUv
ZmJjb24uYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYwpAQCAtNTM2LDYg
KzUzNiwxMyBAQCBzdGF0aWMgaW50IF9faW5pdCBmYl9jb25zb2xlX3NldHVwKGNoYXIgKnRoaXNf
b3B0KQogCQkJCWZiX2NlbnRlcl9sb2dvID0gdHJ1ZTsKIAkJCWNvbnRpbnVlOwogCQl9CisKKwkJ
aWYgKCFzdHJuY21wKG9wdGlvbnMsICJsb2dvLWNvdW50OiIsIDExKSkgeworCQkJb3B0aW9ucyAr
PSAxMTsKKwkJCWlmICgqb3B0aW9ucykKKwkJCQlmYl9sb2dvX2NvdW50ID0gc2ltcGxlX3N0cnRv
dWwob3B0aW9ucywgJm9wdGlvbnMsIDApOworCQkJY29udGludWU7CisJCX0KIAl9CiAJcmV0dXJu
IDE7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyBiL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jCmluZGV4IDY0ZGQ3MzIwMjFkOC4uNGM1N2Q1
MjJiNzJlIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYworKysg
Yi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYwpAQCAtNTYsNiArNTYsOSBAQCBFWFBP
UlRfU1lNQk9MKG51bV9yZWdpc3RlcmVkX2ZiKTsKIGJvb2wgZmJfY2VudGVyX2xvZ28gX19yZWFk
X21vc3RseTsKIEVYUE9SVF9TWU1CT0woZmJfY2VudGVyX2xvZ28pOwogCit1bnNpZ25lZCBpbnQg
ZmJfbG9nb19jb3VudCBfX3JlYWRfbW9zdGx5OworRVhQT1JUX1NZTUJPTChmYl9sb2dvX2NvdW50
KTsKKwogc3RhdGljIHN0cnVjdCBmYl9pbmZvICpnZXRfZmJfaW5mbyh1bnNpZ25lZCBpbnQgaWR4
KQogewogCXN0cnVjdCBmYl9pbmZvICpmYl9pbmZvOwpAQCAtNjg5LDcgKzY5Miw3IEBAIGludCBm
Yl9zaG93X2xvZ28oc3RydWN0IGZiX2luZm8gKmluZm8sIGludCByb3RhdGUpCiAJaW50IHk7CiAK
IAl5ID0gZmJfc2hvd19sb2dvX2xpbmUoaW5mbywgcm90YXRlLCBmYl9sb2dvLmxvZ28sIDAsCi0J
CQkgICAgICBudW1fb25saW5lX2NwdXMoKSk7CisJCQkgICAgICBmYl9sb2dvX2NvdW50ID86IG51
bV9vbmxpbmVfY3B1cygpKTsKIAl5ID0gZmJfc2hvd19leHRyYV9sb2dvcyhpbmZvLCB5LCByb3Rh
dGUpOwogCiAJcmV0dXJuIHk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2ZiLmggYi9pbmNs
dWRlL2xpbnV4L2ZiLmgKaW5kZXggMzAzNzcxMjY0NjQ0Li41ZjJiMDU0MDYyNjIgMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvbGludXgvZmIuaAorKysgYi9pbmNsdWRlL2xpbnV4L2ZiLmgKQEAgLTYzMCw2
ICs2MzAsNyBAQCBleHRlcm4gaW50IGZiX25ld19tb2RlbGlzdChzdHJ1Y3QgZmJfaW5mbyAqaW5m
byk7CiBleHRlcm4gc3RydWN0IGZiX2luZm8gKnJlZ2lzdGVyZWRfZmJbRkJfTUFYXTsKIGV4dGVy
biBpbnQgbnVtX3JlZ2lzdGVyZWRfZmI7CiBleHRlcm4gYm9vbCBmYl9jZW50ZXJfbG9nbzsKK2V4
dGVybiB1bnNpZ25lZCBpbnQgZmJfbG9nb19jb3VudDsKIGV4dGVybiBzdHJ1Y3QgY2xhc3MgKmZi
X2NsYXNzOwogCiAjZGVmaW5lIGZvcl9lYWNoX3JlZ2lzdGVyZWRfZmIoaSkJCVwKLS0gCjIuMTEu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
