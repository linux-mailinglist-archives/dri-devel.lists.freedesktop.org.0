Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C3EABF26
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 20:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56E36E06F;
	Fri,  6 Sep 2019 18:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F196E06F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 18:11:18 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1i6IhW-0007zm-Uk; Fri, 06 Sep 2019 18:11:15 +0000
From: Colin King <colin.king@canonical.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] fbdev: matrox: make array wtst_xlat static const,
 makes object smaller
Date: Fri,  6 Sep 2019 19:11:14 +0100
Message-Id: <20190906181114.31414-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KCkRvbid0IHBv
cHVsYXRlIHRoZSBhcnJheSB3dHN0X3hsYXQgb24gdGhlIHN0YWNrIGJ1dCBpbnN0ZWFkIG1ha2Ug
aXQKc3RhdGljIGNvbnN0LiBNYWtlcyB0aGUgb2JqZWN0IGNvZGUgc21hbGxlciBieSA4OSBieXRl
cy4KCkJlZm9yZToKICAgdGV4dAkgICBkYXRhCSAgICBic3MJICAgIGRlYwkgICAgaGV4CWZpbGVu
YW1lCiAgMTQzNDcJICAgIDg0MAkgICAgICAwCSAgMTUxODcJICAgM2I1MwlmYmRldi9tYXRyb3gv
bWF0cm94ZmJfbWlzYy5vCgpBZnRlcjoKICAgdGV4dAkgICBkYXRhCSAgICBic3MJICAgIGRlYwkg
ICAgaGV4CWZpbGVuYW1lCiAgMTQxNjIJICAgIDkzNgkgICAgICAwCSAgMTUwOTgJICAgM2FmYQlm
YmRldi9tYXRyb3gvbWF0cm94ZmJfbWlzYy5vCgooZ2NjIHZlcnNpb24gOS4yLjEsIGFtZDY0KQoK
U2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4K
LS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L21hdHJveC9tYXRyb3hmYl9taXNjLmMgfCA1ICsrKyst
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9tYXRyb3gvbWF0cm94ZmJfbWlzYy5jIGIvZHJpdmVy
cy92aWRlby9mYmRldi9tYXRyb3gvbWF0cm94ZmJfbWlzYy5jCmluZGV4IGM3YWFjYTEyODA1ZS4u
ZmViMDk3N2M4MmViIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L21hdHJveC9tYXRy
b3hmYl9taXNjLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9tYXRyb3gvbWF0cm94ZmJfbWlz
Yy5jCkBAIC02NzMsNyArNjczLDEwIEBAIHN0YXRpYyBpbnQgcGFyc2VfcGluczUoc3RydWN0IG1h
dHJveF9mYl9pbmZvICptaW5mbywKIAlpZiAoYmQtPnBpbnNbMTE1XSAmIDQpIHsKIAkJbWluZm8t
PnZhbHVlcy5yZWcubWN0bHd0c3RfY29yZSA9IG1pbmZvLT52YWx1ZXMucmVnLm1jdGx3dHN0Owog
CX0gZWxzZSB7Ci0JCXVfaW50MzJfdCB3dHN0X3hsYXRbXSA9IHsgMCwgMSwgNSwgNiwgNywgNSwg
MiwgMyB9OworCQlzdGF0aWMgY29uc3QgdV9pbnQzMl90IHd0c3RfeGxhdFtdID0geworCQkJMCwg
MSwgNSwgNiwgNywgNSwgMiwgMworCQl9OworCiAJCW1pbmZvLT52YWx1ZXMucmVnLm1jdGx3dHN0
X2NvcmUgPSAobWluZm8tPnZhbHVlcy5yZWcubWN0bHd0c3QgJiB+NykgfAogCQkJCQkJICB3dHN0
X3hsYXRbbWluZm8tPnZhbHVlcy5yZWcubWN0bHd0c3QgJiA3XTsKIAl9Ci0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
