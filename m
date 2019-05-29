Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7024B2DB53
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 13:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF8D6E25D;
	Wed, 29 May 2019 11:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171156E25D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 11:02:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 May 2019 04:02:10 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 29 May 2019 04:02:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 29 May 2019 14:02:07 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/edid: Ignore "DFP 1.x" bit for EDID 1.2 and earlier
Date: Wed, 29 May 2019 14:02:04 +0300
Message-Id: <20190529110204.2384-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529110204.2384-1-ville.syrjala@linux.intel.com>
References: <20190529110204.2384-1-ville.syrjala@linux.intel.com>
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkZy
b20gVkVTQSBFRElEIGltcGxlbWVudGF0aW9uIGd1aWRlIHYxLjA6CiJGb3IgRURJRCB2ZXJzaW9u
IDEgcmV2aXNpb24gMiBvciBlYXJsaWVyIGRhdGEgc3RydWN0dXJlcyB3aGVuIG9mZnNldCAxNGgK
IGJpdCA3IGlzIHNldCB0byBvbmUsIHRoZSB2YWx1ZSBvZiBiaXRzIDYtMCBhcmUgdW5kZWZpbmVk
LCBhbmQgdGhlcmVmb3JlCiBjYW5ub3QgYmUgaW50ZXJwcmV0ZWQgdG8gbWVhbiBhbnl0aGluZy4i
CgpBbmQgc2luY2UgRURJRCAxLjQgcmVkZWZpbmVzIHRoYXQgYml0IGxldCdzIGNvbnN1bHQgaXQg
b25seSBmb3IKRURJRCAxLjMuCgpDYzogTWFyaW8gS2xlaW5lciA8bWFyaW8ua2xlaW5lci5kZUBn
bWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBs
aW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgfCA0ICsrLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Vk
aWQuYwppbmRleCBkZDYwMWVkNmEzMGUuLmMzMjk2YTcyZmZmOSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9lZGlkLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKQEAg
LTQ1NjksOCArNDU2OSw4IEBAIHUzMiBkcm1fYWRkX2Rpc3BsYXlfaW5mbyhzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqY29ubmVjdG9yLCBjb25zdCBzdHJ1Y3QgZWRpZCAqZWRpCiAJICogdGVsbHMgdXMg
dG8gYXNzdW1lIDggYnBjIGNvbG9yIGRlcHRoIGlmIHRoZSBFRElEIGRvZXNuJ3QgaGF2ZQogCSAq
IGV4dGVuc2lvbnMgd2hpY2ggdGVsbCBvdGhlcndpc2UuCiAJICovCi0JaWYgKChpbmZvLT5icGMg
PT0gMCkgJiYgKGVkaWQtPnJldmlzaW9uIDwgNCkgJiYKLQkgICAgKGVkaWQtPmlucHV0ICYgRFJN
X0VESURfRElHSVRBTF9ERlBfMV9YKSkgeworCWlmIChpbmZvLT5icGMgPT0gMCAmJiBlZGlkLT5y
ZXZpc2lvbiA9PSAzICYmCisJICAgIGVkaWQtPmlucHV0ICYgRFJNX0VESURfRElHSVRBTF9ERlBf
MV9YKSB7CiAJCWluZm8tPmJwYyA9IDg7CiAJCURSTV9ERUJVRygiJXM6IEFzc2lnbmluZyBERlAg
c2luayBjb2xvciBkZXB0aCBhcyAlZCBicGMuXG4iLAogCQkJICBjb25uZWN0b3ItPm5hbWUsIGlu
Zm8tPmJwYyk7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
