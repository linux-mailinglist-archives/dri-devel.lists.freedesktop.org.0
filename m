Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24036160F0F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 10:45:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AC36E905;
	Mon, 17 Feb 2020 09:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BAE76E905
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 09:45:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Feb 2020 01:45:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,452,1574150400"; d="scan'208";a="348465197"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.9])
 by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2020 01:45:08 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: temporary workaround to pass HDMI 2.0 compliance
 HF1-13
Date: Tue, 18 Feb 2020 01:41:39 +0800
Message-Id: <20200217174139.3018-1-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Jani Nikula <jani.nikula@intel.com>, Lee Shawn C <shawn.c.lee@intel.com>,
 Cooper Chiou <cooper.chiou@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGVzdCBjYXNlIEhGMS0xMyBmb3IgSERNSSAyLjAgY29tcGxpYW5jZSB3b3VsZCBhc2sgRFVUIHRv
IGRvd25ncmFkZQpvdXRwdXQgcmVzb2x1dGlvbiB0byA3MjB4NDgwIG9yIDcyMHg1NzYgKGxvd2Vy
IHRoYW4gMy40R2JwcykuCkFuZCBjaGVjayBzY3JhbWJsaW5nIGZlYXR1cmUgd2FzIGRpc2FibGVk
IGFzIHdlbGwuCgpCdXQgUUQ5ODAgcmVwb3J0IGl0IGNhbiBzdXBwb3J0IGxvdyByYXRlIHNjcmFt
YmxpbmcuIFRoZSB2ZW5kb3IKc3BlY2lmaWMgZGF0YSBibG9jayBieXRlWzZdIHdhcyAweDg4LiBJ
ZiBkcml2ZXIgZW5hYmxlZCBzY3JhbWJsaW5nCnJlbHkgb24gdGhpcyBpbmZvLiBUaGVuIEhGMS0x
MyB3b3VsZCBub3QgZ2V0IHBhc3MgYmVjYXVzZSBEVVQgaGF2ZQp0byBkaXNhYmxlIHNjcmFtYmxp
bmcgdG8gcnVuIHRoaXMgY2FzZS4KCkNjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwu
Y29tPgpDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4K
Q2M6IENsaW50IFRheWxvciA8Y2xpbnRvbi5hLnRheWxvckBpbnRlbC5jb20+CkNjOiBDb29wZXIg
Q2hpb3UgPGNvb3Blci5jaGlvdUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IExlZSBTaGF3biBD
IDxzaGF3bi5jLmxlZUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMg
fCAxMyArKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCmluZGV4IDk5NzY5ZDZjOWY4NC4uMGI0YmFkYzIwYzM1
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2VkaWQuYwpAQCAtODUsNiArODUsOCBAQAogI2RlZmluZSBFRElEX1FVSVJLX0ZP
UkNFXzEwQlBDCQkJKDEgPDwgMTEpCiAvKiBOb24gZGVza3RvcCBkaXNwbGF5IChpLmUuIEhNRCkg
Ki8KICNkZWZpbmUgRURJRF9RVUlSS19OT05fREVTS1RPUAkJCSgxIDw8IDEyKQorLyogRG8gbm90
IGVuYWJsZSBsb3cgcmF0ZXMgc2NyYW1ibGluZyAqLworI2RlZmluZSBFRElEX1FVSVJLX0RJU0FC
TEVfTE9XX1JBVEVfU0NSQU1CTElORwkoMSA8PCAxMykKIAogc3RydWN0IGRldGFpbGVkX21vZGVf
Y2xvc3VyZSB7CiAJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcjsKQEAgLTIxNCw2ICsy
MTYsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGVkaWRfcXVpcmsgewogCiAJLyogT1NWUiBIREsg
YW5kIEhESzIgVlIgSGVhZHNldHMgKi8KIAl7ICJTVlIiLCAweDEwMTksIEVESURfUVVJUktfTk9O
X0RFU0tUT1AgfSwKKworCS8qIFF1YW50dW1kYXRhIDk4MCB0ZXN0IHBsYXRmb3JtICovCisJeyAi
UURJIiwgMHgwM0Q0LCBFRElEX1FVSVJLX0RJU0FCTEVfTE9XX1JBVEVfU0NSQU1CTElORyB9LAog
fTsKIAogLyoKQEAgLTQ3MTAsMTAgKzQ3MTUsMTEgQEAgc3RhdGljIHZvaWQgZHJtX3BhcnNlX3lj
YmNyNDIwX2RlZXBfY29sb3JfaW5mbyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAog
fQogCiBzdGF0aWMgdm9pZCBkcm1fcGFyc2VfaGRtaV9mb3J1bV92c2RiKHN0cnVjdCBkcm1fY29u
bmVjdG9yICpjb25uZWN0b3IsCi0JCQkJIGNvbnN0IHU4ICpoZl92c2RiKQorCQkJCSBjb25zdCB1
OCAqaGZfdnNkYiwgY29uc3Qgc3RydWN0IGVkaWQgKmVkaWQpCiB7CiAJc3RydWN0IGRybV9kaXNw
bGF5X2luZm8gKmRpc3BsYXkgPSAmY29ubmVjdG9yLT5kaXNwbGF5X2luZm87CiAJc3RydWN0IGRy
bV9oZG1pX2luZm8gKmhkbWkgPSAmZGlzcGxheS0+aGRtaTsKKwl1MzIgcXVpcmtzID0gZWRpZF9n
ZXRfcXVpcmtzKGVkaWQpOwogCiAJZGlzcGxheS0+aGFzX2hkbWlfaW5mb2ZyYW1lID0gdHJ1ZTsK
IApAQCAtNDc0Nyw3ICs0NzUzLDggQEAgc3RhdGljIHZvaWQgZHJtX3BhcnNlX2hkbWlfZm9ydW1f
dnNkYihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAogCQkJc2NkYy0+c2NyYW1ibGlu
Zy5zdXBwb3J0ZWQgPSB0cnVlOwogCiAJCQkvKiBGZXcgc2lua3Mgc3VwcG9ydCBzY3JhbWJsaW5n
IGZvciBjbG9ja3MgPCAzNDBNICovCi0JCQlpZiAoKGhmX3ZzZGJbNl0gJiAweDgpKQorCQkJaWYg
KChoZl92c2RiWzZdICYgMHg4KSAmJgorCQkJICAgICEocXVpcmtzICYgRURJRF9RVUlSS19ESVNB
QkxFX0xPV19SQVRFX1NDUkFNQkxJTkcpKQogCQkJCXNjZGMtPnNjcmFtYmxpbmcubG93X3JhdGVz
ID0gdHJ1ZTsKIAkJfQogCX0KQEAgLTQ4NzAsNyArNDg3Nyw3IEBAIHN0YXRpYyB2b2lkIGRybV9w
YXJzZV9jZWFfZXh0KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCiAJCWlmIChjZWFf
ZGJfaXNfaGRtaV92c2RiKGRiKSkKIAkJCWRybV9wYXJzZV9oZG1pX3ZzZGJfdmlkZW8oY29ubmVj
dG9yLCBkYik7CiAJCWlmIChjZWFfZGJfaXNfaGRtaV9mb3J1bV92c2RiKGRiKSkKLQkJCWRybV9w
YXJzZV9oZG1pX2ZvcnVtX3ZzZGIoY29ubmVjdG9yLCBkYik7CisJCQlkcm1fcGFyc2VfaGRtaV9m
b3J1bV92c2RiKGNvbm5lY3RvciwgZGIsIGVkaWQpOwogCQlpZiAoY2VhX2RiX2lzX3k0MjBjbWRi
KGRiKSkKIAkJCWRybV9wYXJzZV95NDIwY21kYl9iaXRtYXAoY29ubmVjdG9yLCBkYik7CiAJCWlm
IChjZWFfZGJfaXNfdmNkYihkYikpCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
