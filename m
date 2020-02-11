Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D921594C8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 17:22:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E036EEB6;
	Tue, 11 Feb 2020 16:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441DA6EEB6;
 Tue, 11 Feb 2020 16:22:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Feb 2020 08:22:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="226546586"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 11 Feb 2020 08:22:34 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 11 Feb 2020 18:22:33 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 7/7] drm: Allow drivers to leave encoder->possible_crtcs==0
Date: Tue, 11 Feb 2020 18:22:08 +0200
Message-Id: <20200211162208.16224-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200211162208.16224-1-ville.syrjala@linux.intel.com>
References: <20200211162208.16224-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkxl
dCdzIHNpbXBsaWZ5IGxpZmUgb2YgZHJpdmVyIGJ5IGFsbG93aW5nIHRoZW0gdG8gbGVhdmUKZW5j
b2Rlci0+cG9zc2libGVfY3J0Y3MgdW5zZXQgaWYgdGhleSBoYXZlIG5vIHJlc3RyaWN0aW9ucwpp
biBjcnRjPC0+ZW5jb2RlciBsaW5rYWdlLiBXZSdsbCBqdXN0IHBvcHVsYXRlIHBvc3NpYmxlX2Ny
dGNzCndpdGggdGhlIGZ1bGwgY3J0YyBtYXNrIHdoZW4gcmVnaXN0ZXJpbmcgdGhlIGVuY29kZXIg
c28gdGhhdAp1c2Vyc3BhY2UgZG9lc24ndCBoYXZlIHRvIGRlYWwgd2l0aCBkcml2ZXJzIG5vdCBw
b3B1bGF0aW5nCnRoaXMgY29ycmVjdGx5LgoKQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpTaWduZWQt
b2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgot
LS0KV2UgbWlnaHQgbm90IGFjdHVhbGx5IG5lZWQvd2FudCB0aGlzLCBidXQgaW5jbHVkZWQgaXQg
aGVyZSBmb3IKZnV0dXJlIHJlZmVyZW5jZSBpZiB0aGF0IGFzc3VtcHRpb24gdHVybnMgb3V0IHRv
IGJlIHdyb25nLgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9jb25maWcuYyB8IDE1ICsr
KysrKysrKysrKysrLQogaW5jbHVkZS9kcm0vZHJtX2VuY29kZXIuaCAgICAgICAgIHwgIDQgKysr
KwogMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX2NvbmZpZy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9tb2RlX2NvbmZpZy5jCmluZGV4IDRjMWIzNTBkZGI5NS4uY2UxOGMzZGQwYmRlIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVfY29uZmlnLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9tb2RlX2NvbmZpZy5jCkBAIC01OTIsNiArNTkyLDE3IEBAIHN0YXRpYyB1
MzIgZnVsbF9jcnRjX21hc2soc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAlyZXR1cm4gY3J0Y19t
YXNrOwogfQogCisvKgorICogTWFrZSBsaWZlIGVhc3kgZm9yIGRyaXZlcnMgYnkgYWxsb3dpbmcg
dGhlbSB0byBsZWF2ZQorICogcG9zc2libGVfY3J0Y3MgdW5zZXQgaWYgdGhlcmUgYXJlIG5vdCBj
cnRjPC0+ZW5jb2RlcgorICogcmVzdHJpY3Rpb25zLgorICovCitzdGF0aWMgdm9pZCBmaXh1cF9l
bmNvZGVyX3Bvc3NpYmxlX2NydGNzKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKK3sKKwlp
ZiAoZW5jb2Rlci0+cG9zc2libGVfY3J0Y3MgPT0gMCkKKwkJZW5jb2Rlci0+cG9zc2libGVfY3J0
Y3MgPSBmdWxsX2NydGNfbWFzayhlbmNvZGVyLT5kZXYpOworfQorCiBzdGF0aWMgdm9pZCB2YWxp
ZGF0ZV9lbmNvZGVyX3Bvc3NpYmxlX2NydGNzKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikK
IHsKIAl1MzIgY3J0Y19tYXNrID0gZnVsbF9jcnRjX21hc2soZW5jb2Rlci0+ZGV2KTsKQEAgLTYw
OCw4ICs2MTksMTAgQEAgdm9pZCBkcm1fbW9kZV9jb25maWdfdmFsaWRhdGUoc3RydWN0IGRybV9k
ZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXI7CiAKLQlkcm1fZm9y
X2VhY2hfZW5jb2RlcihlbmNvZGVyLCBkZXYpCisJZHJtX2Zvcl9lYWNoX2VuY29kZXIoZW5jb2Rl
ciwgZGV2KSB7CiAJCWZpeHVwX2VuY29kZXJfcG9zc2libGVfY2xvbmVzKGVuY29kZXIpOworCQlm
aXh1cF9lbmNvZGVyX3Bvc3NpYmxlX2NydGNzKGVuY29kZXIpOworCX0KIAogCWRybV9mb3JfZWFj
aF9lbmNvZGVyKGVuY29kZXIsIGRldikgewogCQl2YWxpZGF0ZV9lbmNvZGVyX3Bvc3NpYmxlX2Ns
b25lcyhlbmNvZGVyKTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9lbmNvZGVyLmggYi9p
bmNsdWRlL2RybS9kcm1fZW5jb2Rlci5oCmluZGV4IGIyMzYyNjlmNDFhYy4uYmQwMzNjNTYxOGJm
IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZW5jb2Rlci5oCisrKyBiL2luY2x1ZGUvZHJt
L2RybV9lbmNvZGVyLmgKQEAgLTE0Miw2ICsxNDIsMTAgQEAgc3RydWN0IGRybV9lbmNvZGVyIHsK
IAkgKiB0aGUgYml0cyBmb3IgYWxsICZkcm1fY3J0YyBvYmplY3RzIHRoaXMgZW5jb2RlciBjYW4g
YmUgY29ubmVjdGVkIHRvCiAJICogYmVmb3JlIGNhbGxpbmcgZHJtX2Rldl9yZWdpc3RlcigpLgog
CSAqCisJICogQXMgYW4gZXhjZXB0aW9uIHRvIHRoZSBhYm92ZSBydWxlIGlmIGFueSBjcnRjIGNh
biBiZSBjb25uZWN0ZWQgdG8KKwkgKiB0aGUgZW5jb2RlciB0aGUgZHJpdmVyIGNhbiBsZWF2ZSBA
cG9zc2libGVfY3J0Y3Mgc2V0IHRvIDAuIFRoZSBjb3JlCisJICogd2lsbCBhdXRvbWFnaWNhbGx5
IGZpeCB0aGlzIHVwIGJ5IHNldHRpbmcgdGhlIGJpdCBmb3IgZXZlcnkgY3J0Yy4KKwkgKgogCSAq
IFlvdSB3aWxsIGdldCBhIFdBUk4gaWYgeW91IGdldCB0aGlzIHdyb25nIGluIHRoZSBkcml2ZXIu
CiAJICoKIAkgKiBOb3RlIHRoYXQgc2luY2UgQ1JUQyBvYmplY3RzIGNhbid0IGJlIGhvdHBsdWdn
ZWQgdGhlIGFzc2lnbmVkIGluZGljZXMKLS0gCjIuMjQuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
