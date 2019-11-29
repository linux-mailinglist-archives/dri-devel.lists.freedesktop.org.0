Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BFC10D420
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 11:31:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610D16E8C6;
	Fri, 29 Nov 2019 10:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45EE96E8C8;
 Fri, 29 Nov 2019 10:31:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 02:31:08 -0800
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; d="scan'208";a="409598270"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 02:31:05 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v2 11/14] HID: picoLCD: constify fb ops
Date: Fri, 29 Nov 2019 12:29:41 +0200
Message-Id: <8678a9a3566279c881bb4db944850eef35d0a4bb.1575022735.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575022735.git.jani.nikula@intel.com>
References: <cover.1575022735.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Bruno=20Pr=C3=A9mont?= <bonbons@linux-vserver.org>,
 linux-input@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHRoYXQgdGhlIGZib3BzIG1lbWJlciBvZiBzdHJ1Y3QgZmJfaW5mbyBpcyBjb25zdCwgd2Ug
Y2FuIHN0YXJ0Cm1ha2luZyB0aGUgb3BzIGNvbnN0IGFzIHdlbGwuCgp2MjogZml4CXR5cG8gKENo
cmlzdG9waGUgZGUgRGluZWNoaW4pCgpDYzogQnJ1bm8gUHLDqW1vbnQgPGJvbmJvbnNAbGludXgt
dnNlcnZlci5vcmc+CkNjOiBsaW51eC1pbnB1dEB2Z2VyLmtlcm5lbC5vcmcKUmV2aWV3ZWQtYnk6
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+ClNpZ25lZC1vZmYtYnk6IEph
bmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9oaWQvaGlkLXBp
Y29sY2RfZmIuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9oaWQvaGlkLXBpY29sY2RfZmIuYyBiL2Ry
aXZlcnMvaGlkL2hpZC1waWNvbGNkX2ZiLmMKaW5kZXggZTE2MmE2NjhmYjdlLi5hNTQ5YzQyZThj
OTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaGlkL2hpZC1waWNvbGNkX2ZiLmMKKysrIGIvZHJpdmVy
cy9oaWQvaGlkLXBpY29sY2RfZmIuYwpAQCAtNDE3LDggKzQxNyw3IEBAIHN0YXRpYyBpbnQgcGlj
b2xjZF9zZXRfcGFyKHN0cnVjdCBmYl9pbmZvICppbmZvKQogCXJldHVybiAwOwogfQogCi0vKiBO
b3RlIHRoaXMgY2FuJ3QgYmUgY29uc3QgYmVjYXVzZSBvZiBzdHJ1Y3QgZmJfaW5mbyBkZWZpbml0
aW9uICovCi1zdGF0aWMgc3RydWN0IGZiX29wcyBwaWNvbGNkZmJfb3BzID0geworc3RhdGljIGNv
bnN0IHN0cnVjdCBmYl9vcHMgcGljb2xjZGZiX29wcyA9IHsKIAkub3duZXIgICAgICAgID0gVEhJ
U19NT0RVTEUsCiAJLmZiX2Rlc3Ryb3kgICA9IHBpY29sY2RfZmJfZGVzdHJveSwKIAkuZmJfcmVh
ZCAgICAgID0gZmJfc3lzX3JlYWQsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
