Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C22362603
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 18:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040A089F99;
	Mon,  8 Jul 2019 16:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7077589F99;
 Mon,  8 Jul 2019 16:20:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2019 09:20:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,466,1557212400"; d="scan'208";a="176206588"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 08 Jul 2019 09:20:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Jul 2019 19:20:51 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 01/14] drm: Include the encoder itself in possible_clones
Date: Mon,  8 Jul 2019 19:20:35 +0300
Message-Id: <20190708162048.4286-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190708162048.4286-1-ville.syrjala@linux.intel.com>
References: <20190708162048.4286-1-ville.syrjala@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSBkb2NzIHNheSBwb3NzaWJsZV9jbG9uZXMgc2hvdWxkIGFsd2F5cyBpbmNsdWRlIHRoZSBlbmNv
ZGVyIGl0c2VsZi4KU2luY2UgbW9zdCBkcml2ZXJzIGRvbid0IHdhbnQgdG8gZGVhbCB3aXRoIHRo
ZSBjb21wbGV4aXRpZXMgb2YgY2xvbmluZwpsZXQncyBhbGxvdyB0aGVtIHRvIHNldCBwb3NzaWJs
ZV9jbG9uZXM9MCBhbmQgaW5zdGVhZCB3ZSdsbCBmaXggdGhhdAp1cCBpbiB0aGUgY29yZS4KCldl
IGNhbid0IHB1dCB0aGlzIHNwZWNpYWwgY2FzZSBpbnRvIGRybV9lbmNvZGVyX2luaXQoKSBiZWNh
dXNlIGRyaXZlcnMKd2lsbCBoYXZlIHRvIGZpbGwgdXAgcG9zc2libGVfY2xvbmVzIGFmdGVyIGFk
ZGluZyBhbGwgdGhlIHJlbGV2YW50CmVuY29kZXJzLiBPdGhlcndpc2UgdGhleSB3b3VsZG4ndCBr
bm93IHRoZSBwcm9wZXIgZW5jb2RlciBpbmRleGVzIHRvCnVzZS4gU28gd2UnbGwganVzdCBkbyBp
dCBqdXN0IGJlZm9yZSByZWdpc3RlcmluZyB0aGUgZW5jb2RlcnMuCgpUT0RPOiBTaG91bGQgd2Ug
YWRkIHRoZSBiaXQgZXZlbiBpZiBwb3NzaWJsZV9jbG9uZXMgd2FzIG90aGVyd2lzZQpwb3B1bGF0
ZWQgYnkgdGhlIGRyaXZlcj8KClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9lbmNvZGVy
LmMgfCAxNSArKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9lbmNvZGVyLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2VuY29kZXIuYwppbmRleCA3ZmI0N2I3YjhiNDQuLmU4N2U2ZmVjYzFmYiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9lbmNvZGVyLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9lbmNvZGVyLmMKQEAgLTY1LDExICs2NSwyNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGRybV9wcm9wX2VudW1fbGlzdCBkcm1fZW5jb2Rlcl9lbnVtX2xpc3RbXSA9IHsKIAl7IERSTV9N
T0RFX0VOQ09ERVJfRFBJLCAiRFBJIiB9LAogfTsKIAorLyoKKyAqIEZvciBzb21lIHJlYXNvbiB3
ZSB3YW50IHRoZSBlbmNvZGVyIGl0c2VsZiBpbmNsdWRlZCBpbgorICogcG9zc2libGVfY2xvbmVz
LiBNYWtlIGxpZmUgZWFzeSBmb3IgZHJpdmVycyBieSBhbGxvd2luZyB0aGVtCisgKiB0byBsZWF2
ZSBwb3NzaWJsZV9jbG9uZXMgdW5zZXQgaWYgbm8gY2xvbmluZyBpcyBwb3NzaWJsZS4KKyAqLwor
c3RhdGljIHZvaWQgZml4dXBfcG9zc2libGVfY2xvbmVzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYp
Cit7CisJc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyOworCisJZHJtX2Zvcl9lYWNoX2VuY29k
ZXIoZW5jb2RlciwgZGV2KQorCQllbmNvZGVyLT5wb3NzaWJsZV9jbG9uZXMgfD0gZHJtX2VuY29k
ZXJfbWFzayhlbmNvZGVyKTsKK30KKwogaW50IGRybV9lbmNvZGVyX3JlZ2lzdGVyX2FsbChzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2KQogewogCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsKIAlp
bnQgcmV0ID0gMDsKIAorCWZpeHVwX3Bvc3NpYmxlX2Nsb25lcyhkZXYpOworCiAJZHJtX2Zvcl9l
YWNoX2VuY29kZXIoZW5jb2RlciwgZGV2KSB7CiAJCWlmIChlbmNvZGVyLT5mdW5jcy0+bGF0ZV9y
ZWdpc3RlcikKIAkJCXJldCA9IGVuY29kZXItPmZ1bmNzLT5sYXRlX3JlZ2lzdGVyKGVuY29kZXIp
OwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
