Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D903E435CB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 14:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815C28993B;
	Thu, 13 Jun 2019 12:18:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178C38993B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 12:18:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 05:18:12 -0700
X-ExtLoop1: 1
Received: from ovasilev-desk1.fi.intel.com ([10.237.72.57])
 by orsmga001.jf.intel.com with ESMTP; 13 Jun 2019 05:18:10 -0700
From: Oleg Vasilev <oleg.vasilev@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm: add debug print to update_vblank_count
Date: Thu, 13 Jun 2019 15:18:00 +0300
Message-Id: <20190613121802.2193-1-oleg.vasilev@intel.com>
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
Cc: Shayenne Moura <shayenneluzmoura@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2Ugd2UgYXJlIGxvZ2dpbmcgYWxsIHZibGFuayBjb3VudGVyIHVwZGF0ZXMgMzAgbGluZXMg
YmVsb3csCml0IGlzIGFsc28gZ29vZCB0byBoYXZlIHNvbWUgZGV0YWlscyB3aGV0aGVyIGFuZCBo
b3cgdmJsYW5rIGNvdW50CmRpZmZlcmVuY2UgaXMgY2FsY3VsYXRlZC4KClNpZ25lZC1vZmYtYnk6
IE9sZWcgVmFzaWxldiA8b2xlZy52YXNpbGV2QGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vZHJtX3ZibGFuay5jIHwgMTAgKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X3ZibGFuay5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwppbmRleCAwZDcwNGJkZGIx
YTYuLjYwM2FiMTA1MTI1ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV92Ymxhbmsu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jCkBAIC0yNDEsMTIgKzI0MSwxNiBA
QCBzdGF0aWMgdm9pZCBkcm1fdXBkYXRlX3ZibGFua19jb3VudChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LCB1bnNpZ25lZCBpbnQgcGlwZSwKIAkJICogb24gdGhlIGRpZmZlcmVuY2UgaW4gdGhlIHRp
bWVzdGFtcHMgYW5kIHRoZQogCQkgKiBmcmFtZS9maWVsZCBkdXJhdGlvbi4KIAkJICovCisKKwkJ
RFJNX0RFQlVHX1ZCTCgiY3J0YyAldTogQ2FsY3VsYXRpbmcgbnVtYmVyIG9mIHZibGFua3MuIgor
CQkJICAgICAgIiBkaWZmX25zID0gJWxsZCwgZnJhbWVkdXJfbnMgPSAlZClcbiIsCisJCQkgICAg
ICBwaXBlLCAobG9uZyBsb25nKSBkaWZmX25zLCBmcmFtZWR1cl9ucyk7CisKIAkJZGlmZiA9IERJ
Vl9ST1VORF9DTE9TRVNUX1VMTChkaWZmX25zLCBmcmFtZWR1cl9ucyk7CiAKIAkJaWYgKGRpZmYg
PT0gMCAmJiBpbl92YmxhbmtfaXJxKQotCQkJRFJNX0RFQlVHX1ZCTCgiY3J0YyAldTogUmVkdW5k
YW50IHZibGlycSBpZ25vcmVkLiIKLQkJCQkgICAgICAiIGRpZmZfbnMgPSAlbGxkLCBmcmFtZWR1
cl9ucyA9ICVkKVxuIiwKLQkJCQkgICAgICBwaXBlLCAobG9uZyBsb25nKSBkaWZmX25zLCBmcmFt
ZWR1cl9ucyk7CisJCQlEUk1fREVCVUdfVkJMKCJjcnRjICV1OiBSZWR1bmRhbnQgdmJsaXJxIGln
bm9yZWRcbiIsCisJCQkJICAgICAgcGlwZSk7CiAJfSBlbHNlIHsKIAkJLyogc29tZSBraW5kIG9m
IGRlZmF1bHQgZm9yIGRyaXZlcnMgdy9vIGFjY3VyYXRlIHZibCB0aW1lc3RhbXBpbmcgKi8KIAkJ
ZGlmZiA9IGluX3ZibGFua19pcnEgPyAxIDogMDsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
