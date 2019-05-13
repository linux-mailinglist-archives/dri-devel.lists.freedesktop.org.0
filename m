Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3412B1B710
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 15:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D57B8991D;
	Mon, 13 May 2019 13:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6DD18991D;
 Mon, 13 May 2019 13:32:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 May 2019 06:32:38 -0700
X-ExtLoop1: 1
Received: from nuc.iind.intel.com ([10.99.66.149])
 by fmsmga001.fm.intel.com with ESMTP; 13 May 2019 06:32:36 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: [PATCH] drm/hdcp: drm_hdcp_request_srm() as static
Date: Mon, 13 May 2019 19:05:04 +0530
Message-Id: <20190513133504.18612-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.19.1
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QmVsb3cgU3BhcnNoIHdhcm5pbmdzIGFyZSBmaXhlZC4KCkNvbW1pdDogZHJtOiByZXZvY2F0aW9u
IGNoZWNrIGF0IGRybSBzdWJzeXN0ZW0KK2RyaXZlcnMvZ3B1L2RybS9kcm1faGRjcC5jOjIzNTo2
OiB3YXJuaW5nOiBzeW1ib2wKJ2RybV9oZGNwX3JlcXVlc3Rfc3JtJyB3YXMgbm90IGRlY2xhcmVk
LiBTaG91bGQgaXQgYmUgc3RhdGljPworZHJpdmVycy9ncHUvZHJtL2RybV9oZGNwLmM6Mjc6Mzog
d2FybmluZzogc3ltYm9sICdzcm1fZGF0YScgd2FzIG5vdApkZWNsYXJlZC4gU2hvdWxkIGl0IGJl
IHN0YXRpYz8KK2RyaXZlcnMvZ3B1L2RybS9kcm1faGRjcC5jOjMxNzo1OiB3YXJuaW5nOiBzeW1i
b2wgJ2RybV9zZXR1cF9oZGNwX3NybScKd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0
YXRpYz8KK2RyaXZlcnMvZ3B1L2RybS9kcm1faGRjcC5jOjMyNzo2OiB3YXJuaW5nOiBzeW1ib2wK
J2RybV90ZWFyZG93bl9oZGNwX3NybScgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0
YXRpYz8KCmNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpSZXBvcnRl
ZC1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IFJh
bWFsaW5nYW0gQyA8cmFtYWxpbmdhbS5jQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2hkY3AuYyAgICAgfCA2ICsrKystLQogZHJpdmVycy9ncHUvZHJtL2RybV9pbnRlcm5hbC5o
IHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2hkY3AuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1faGRjcC5jCmluZGV4IDBkYTdiMzcxOGJhZC4uY2Q4MzdiZDQwOWY3IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2hkY3AuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2hk
Y3AuYwpAQCAtMjEsNyArMjEsOSBAQAogI2luY2x1ZGUgPGRybS9kcm1fbW9kZV9vYmplY3QuaD4K
ICNpbmNsdWRlIDxkcm0vZHJtX2Nvbm5lY3Rvci5oPgogCi1zdHJ1Y3QgaGRjcF9zcm0geworI2lu
Y2x1ZGUgImRybV9pbnRlcm5hbC5oIgorCitzdGF0aWMgc3RydWN0IGhkY3Bfc3JtIHsKIAl1MzIg
cmV2b2tlZF9rc3ZfY250OwogCXU4ICpyZXZva2VkX2tzdl9saXN0OwogCkBAIC0yMzUsNyArMjM3
LDcgQEAgc3RhdGljIHZvaWQgZHJtX2hkY3Bfc3JtX3VwZGF0ZShjb25zdCB1OCAqYnVmLCBzaXpl
X3QgY291bnQpCiAJCWRybV9oZGNwX3BhcnNlX2hkY3AyX3NybShidWYsIGNvdW50KTsKIH0KIAot
dm9pZCBkcm1faGRjcF9yZXF1ZXN0X3NybShzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldikKK3N0
YXRpYyB2b2lkIGRybV9oZGNwX3JlcXVlc3Rfc3JtKHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2
KQogewogCWNoYXIgZndfbmFtZVszNl0gPSAiZGlzcGxheV9oZGNwX3NybS5iaW4iOwogCWNvbnN0
IHN0cnVjdCBmaXJtd2FyZSAqZnc7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2lu
dGVybmFsLmggYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ludGVybmFsLmgKaW5kZXggNDc2YTQyMjQx
NGY2Li42NWFiZjNhNjliNDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1faW50ZXJu
YWwuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ludGVybmFsLmgKQEAgLTEwNiw2ICsxMDYs
NyBAQCB2b2lkIGRybV9zeXNmc19jb25uZWN0b3JfcmVtb3ZlKHN0cnVjdCBkcm1fY29ubmVjdG9y
ICpjb25uZWN0b3IpOwogdm9pZCBkcm1fc3lzZnNfbGVhc2VfZXZlbnQoc3RydWN0IGRybV9kZXZp
Y2UgKmRldik7CiAKIC8qIGRybV9nZW0uYyAqLworc3RydWN0IGRybV9nZW1fb2JqZWN0OwogaW50
IGRybV9nZW1faW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KTsKIHZvaWQgZHJtX2dlbV9kZXN0
cm95KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOwogaW50IGRybV9nZW1faGFuZGxlX2NyZWF0ZV90
YWlsKHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2LAotLSAKMi4xOS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
