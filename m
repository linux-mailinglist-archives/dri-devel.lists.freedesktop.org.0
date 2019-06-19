Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1524B73E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 13:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 704D86E33C;
	Wed, 19 Jun 2019 11:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784EC6E33C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 11:42:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 08692260A33
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/imx: correct order of crtc disable
Date: Wed, 19 Jun 2019 12:41:35 +0100
Message-Id: <20190619114135.19405-1-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.18.0
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
Cc: Robert Beckett <bob.beckett@collabora.com>, David Airlie <airlied@linux.ie>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90aWZ5IGRybSBjb3JlIGJlZm9yZSBzZW5kaW5nIHBlbmRpbmcgZXZlbnRzIGR1cmluZyBjcnRj
IGRpc2FibGUuClRoaXMgZml4ZXMgdGhlIGZpcnN0IGV2ZW50IGFmdGVyIGRpc2FibGUgaGF2aW5n
IGFuIG9sZCBzdGFsZSB0aW1lc3RhbXAKYnkgaGF2aW5nIGRybV9jcnRjX3ZibGFua19vZmYgdXBk
YXRlIHRoZSB0aW1lc3RhbXAgdG8gbm93LgoKVGhpcyB3YXMgc2VlbiB3aGlsZSBkZWJ1Z2dpbmcg
d2VzdG9uIGxvZyBtZXNzYWdlOgpXYXJuaW5nOiBjb21wdXRlZCByZXBhaW50IGRlbGF5IGlzIGlu
c2FuZTogLTgyMTIgbXNlYwoKQWxzbyBvbmx5IHNlbmQgcGVuZGluZyBldmVudCBpZiBjcnRjIGlz
IGtlcHQgZGlzYWJsZWQsIG90aGVyd2lzZSBpdCB3aWxsCmJlIHNlbnQgb24gbmV4dCB2bGJsYW5r
LgoKRml4ZXM6IGE0NzQ0Nzg2NDJkNSAoImRybS9pbXg6IGZpeCBjcnRjIHZibGFuayBzdGF0ZSBy
ZWdyZXNzaW9uIikKCkNoYW5nZXMgc2luY2UgdjE6CkFkZCBkZXRhaWxzIHRvIGNvbW1pdCBtZXNz
YWdlLgoKU2lnbmVkLW9mZi1ieTogUm9iZXJ0IEJlY2tldHQgPGJvYi5iZWNrZXR0QGNvbGxhYm9y
YS5jb20+ClJldmlld2VkLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRl
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtY3J0Yy5jIHwgNiArKystLS0KIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My1jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vaW14L2lw
dXYzLWNydGMuYwppbmRleCA5Y2MxZDY3ODY3NGYuLmM0MzZhMjhkNTBlNCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My1jcnRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2lt
eC9pcHV2My1jcnRjLmMKQEAgLTkxLDE0ICs5MSwxNCBAQCBzdGF0aWMgdm9pZCBpcHVfY3J0Y19h
dG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJaXB1X2RjX2Rpc2FibGUoaXB1
KTsKIAlpcHVfcHJnX2Rpc2FibGUoaXB1KTsKIAorCWRybV9jcnRjX3ZibGFua19vZmYoY3J0Yyk7
CisKIAlzcGluX2xvY2tfaXJxKCZjcnRjLT5kZXYtPmV2ZW50X2xvY2spOwotCWlmIChjcnRjLT5z
dGF0ZS0+ZXZlbnQpIHsKKwlpZiAoY3J0Yy0+c3RhdGUtPmV2ZW50ICYmICFjcnRjLT5zdGF0ZS0+
YWN0aXZlKSB7CiAJCWRybV9jcnRjX3NlbmRfdmJsYW5rX2V2ZW50KGNydGMsIGNydGMtPnN0YXRl
LT5ldmVudCk7CiAJCWNydGMtPnN0YXRlLT5ldmVudCA9IE5VTEw7CiAJfQogCXNwaW5fdW5sb2Nr
X2lycSgmY3J0Yy0+ZGV2LT5ldmVudF9sb2NrKTsKLQotCWRybV9jcnRjX3ZibGFua19vZmYoY3J0
Yyk7CiB9CiAKIHN0YXRpYyB2b2lkIGlteF9kcm1fY3J0Y19yZXNldChzdHJ1Y3QgZHJtX2NydGMg
KmNydGMpCi0tIAoyLjE4LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
