Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B13B11029C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 17:40:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F8D6EA06;
	Tue,  3 Dec 2019 16:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FFB6E9FF;
 Tue,  3 Dec 2019 16:40:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 08:40:01 -0800
X-IronPort-AV: E=Sophos;i="5.69,273,1571727600"; d="scan'208";a="293859563"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 08:39:58 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v3 09/12] HID: picoLCD: constify fb ops
Date: Tue,  3 Dec 2019 18:38:51 +0200
Message-Id: <f415010cd52cce7d8a1250d4eca582ec64e67956.1575390741.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575390740.git.jani.nikula@intel.com>
References: <cover.1575390740.git.jani.nikula@intel.com>
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
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkFja2VkLWJ5OiBCcnVubyBQ
csOpbW9udCA8Ym9uYm9uc0BsaW51eC12c2VydmVyLm9yZz4KU2lnbmVkLW9mZi1ieTogSmFuaSBO
aWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2hpZC9oaWQtcGljb2xj
ZF9mYi5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2hpZC9oaWQtcGljb2xjZF9mYi5jIGIvZHJpdmVy
cy9oaWQvaGlkLXBpY29sY2RfZmIuYwppbmRleCBlMTYyYTY2OGZiN2UuLmE1NDljNDJlOGM5MCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9oaWQvaGlkLXBpY29sY2RfZmIuYworKysgYi9kcml2ZXJzL2hp
ZC9oaWQtcGljb2xjZF9mYi5jCkBAIC00MTcsOCArNDE3LDcgQEAgc3RhdGljIGludCBwaWNvbGNk
X3NldF9wYXIoc3RydWN0IGZiX2luZm8gKmluZm8pCiAJcmV0dXJuIDA7CiB9CiAKLS8qIE5vdGUg
dGhpcyBjYW4ndCBiZSBjb25zdCBiZWNhdXNlIG9mIHN0cnVjdCBmYl9pbmZvIGRlZmluaXRpb24g
Ki8KLXN0YXRpYyBzdHJ1Y3QgZmJfb3BzIHBpY29sY2RmYl9vcHMgPSB7CitzdGF0aWMgY29uc3Qg
c3RydWN0IGZiX29wcyBwaWNvbGNkZmJfb3BzID0gewogCS5vd25lciAgICAgICAgPSBUSElTX01P
RFVMRSwKIAkuZmJfZGVzdHJveSAgID0gcGljb2xjZF9mYl9kZXN0cm95LAogCS5mYl9yZWFkICAg
ICAgPSBmYl9zeXNfcmVhZCwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
