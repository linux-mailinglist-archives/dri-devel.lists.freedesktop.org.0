Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB086C2254
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 15:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA75789DE1;
	Mon, 30 Sep 2019 13:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA1C89DCF;
 Mon, 30 Sep 2019 13:42:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Sep 2019 06:42:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,567,1559545200"; d="scan'208";a="202888968"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 30 Sep 2019 06:42:15 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 30 Sep 2019 16:42:14 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/rect: Add drm_rect_translate_to()
Date: Mon, 30 Sep 2019 16:42:11 +0300
Message-Id: <20190930134214.24702-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkFk
ZCBhIGhlbHBlciB0byB0cmFuc2xhdGUgYSByZWN0YW5nbGUgdG8gYW4gYWJzb2x1dGUgcG9zaXRp
b24uCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXgu
aW50ZWwuY29tPgotLS0KIGluY2x1ZGUvZHJtL2RybV9yZWN0LmggfCAxNCArKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRl
L2RybS9kcm1fcmVjdC5oIGIvaW5jbHVkZS9kcm0vZHJtX3JlY3QuaAppbmRleCA2MTk1ODIwYWE1
YzUuLmZjN2MxNDYyN2VlMiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3JlY3QuaAorKysg
Yi9pbmNsdWRlL2RybS9kcm1fcmVjdC5oCkBAIC0xMDYsNiArMTA2LDIwIEBAIHN0YXRpYyBpbmxp
bmUgdm9pZCBkcm1fcmVjdF90cmFuc2xhdGUoc3RydWN0IGRybV9yZWN0ICpyLCBpbnQgZHgsIGlu
dCBkeSkKIAlyLT55MiArPSBkeTsKIH0KIAorLyoqCisgKiBkcm1fcmVjdF90cmFuc2xhdGVfdG8g
LSB0cmFuc2xhdGUgdGhlIHJlY3RhbmdsZSB0byBhbiBhYnNvbHV0ZSBwb3NpdGlvbgorICogQHI6
IHJlY3RhbmdsZSB0byBiZSB0cmFubGF0ZWQKKyAqIEB4OiBob3Jpem9udGFsIHBvc2l0aW9uCisg
KiBAeTogdmVydGljYWwgcG9zaXRpb24KKyAqCisgKiBNb3ZlIHJlY3RhbmdsZSBAciB0byBAeCBp
biB0aGUgaG9yaXpvbnRhbCBkaXJlY3Rpb24sCisgKiBhbmQgdG8gQHkgaW4gdGhlIHZlcnRpY2Fs
IGRpcmVjdGlvbi4KKyAqLworc3RhdGljIGlubGluZSB2b2lkIGRybV9yZWN0X3RyYW5zbGF0ZV90
byhzdHJ1Y3QgZHJtX3JlY3QgKnIsIGludCB4LCBpbnQgeSkKK3sKKwlkcm1fcmVjdF90cmFuc2xh
dGUociwgeCAtIHItPngxLCB5IC0gci0+eTEpOworfQorCiAvKioKICAqIGRybV9yZWN0X2Rvd25z
Y2FsZSAtIGRvd25zY2FsZSBhIHJlY3RhbmdsZQogICogQHI6IHJlY3RhbmdsZSB0byBiZSBkb3du
c2NhbGVkCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
