Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E0218A24C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 19:25:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E496F6E941;
	Wed, 18 Mar 2020 18:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B736E93E;
 Wed, 18 Mar 2020 18:25:23 +0000 (UTC)
IronPort-SDR: lRidyU3vZKJO7Hr4IDjvoWpDvxGWfIZbkZ5rG5MDN/UefC11tIxKdOWw+cYUPGLXI8BYRxlCuW
 goNpxJWl42AQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 11:25:23 -0700
IronPort-SDR: pozaC+8KXJwAtw6GsZMjIkuvqAXxWmgIT+qQxAtcRX0J4xtd8CjO/CKM8gZl8rz+Tgipvej8qI
 600IOayjyMyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,568,1574150400"; d="scan'208";a="291390565"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 18 Mar 2020 11:25:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Mar 2020 20:25:18 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Skip drm_mode_config_validate() for !modeset
Date: Wed, 18 Mar 2020 20:25:18 +0200
Message-Id: <20200318182518.31618-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCmRy
bV9tb2RlX2NvbmZpZ19pbml0KCkgbWF5IG5vdCBoYXZlIGJlZW4gY2FsbGVkIHdoZW4gdGhlIGRy
aXZlci9kZXZpY2UKZG9lc24ndCBzdXBwb3J0IG1vZGVzZXQuIFRoYXQgd2lsbCBjYXVzZSBkcm1f
bW9kZV9jb25maWdfdmFsaWRhdGUoKQp0byBvb3BzLiBTa2lwIHRoZSB2YWxpZGF0aW9uIGZvciAh
bW9kZXNldC4KClRPRE86IFdlIG1heSB3YW50IHRvIGNvbnNpZGVyIGNhbGxpbmcgZHJtX21vZGVf
Y29uZmlnX2luaXQoKQp1bmNvbmRpdGlvbmFsbHkgdG8gYXZvaWQgc2ltaWxhciBpc3N1ZXMgZWxz
ZXdoZXJlLi4uCgpGaXhlczogNzRkMmFhY2JlODQwICgiZHJtOiBWYWxpZGF0ZSBlbmNvZGVyLT5w
b3NzaWJsZV9jbG9uZXMiKQpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9jb25m
aWcuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX2NvbmZpZy5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9tb2RlX2NvbmZpZy5jCmluZGV4IDU1MzIyZDcwNDhmNS4uZTFlYzFiYjcwNjhkIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVfY29uZmlnLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9tb2RlX2NvbmZpZy5jCkBAIC02MDgsNiArNjA4LDkgQEAgdm9pZCBkcm1fbW9kZV9j
b25maWdfdmFsaWRhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgZHJtX2Vu
Y29kZXIgKmVuY29kZXI7CiAKKwlpZiAoIWRybV9jb3JlX2NoZWNrX2ZlYXR1cmUoZGV2LCBEUklW
RVJfTU9ERVNFVCkpCisJCXJldHVybjsKKwogCWRybV9mb3JfZWFjaF9lbmNvZGVyKGVuY29kZXIs
IGRldikKIAkJZml4dXBfZW5jb2Rlcl9wb3NzaWJsZV9jbG9uZXMoZW5jb2Rlcik7CiAKLS0gCjIu
MjQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
