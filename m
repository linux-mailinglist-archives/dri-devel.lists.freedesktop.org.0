Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C826A11028C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 17:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFC06E9F9;
	Tue,  3 Dec 2019 16:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCC96E9F7;
 Tue,  3 Dec 2019 16:39:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 08:39:25 -0800
X-IronPort-AV: E=Sophos;i="5.69,273,1571727600"; d="scan'208";a="213469188"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 08:39:23 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v3 04/12] video: fbdev: uvesafb: modify the static fb_ops
 directly
Date: Tue,  3 Dec 2019 18:38:46 +0200
Message-Id: <af63cda5de9fee3acd28e7d264f920338298bc0a.1575390740.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXZvaWQgbW9kaWZ5aW5nIHRoZSBmYl9vcHMgdmlhIGluZm8tPmZib3BzIHRvIGxldCB1cyBtYWtl
IHRoZSBwb2ludGVyCmNvbnN0IGluIHRoZSBmdXR1cmUuCgpDYzogbGludXgtZmJkZXZAdmdlci5r
ZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5j
b20+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi91dmVzYWZiLmMgfCA0ICsrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy92aWRlby9mYmRldi91dmVzYWZiLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3V2ZXNhZmIu
YwppbmRleCA0Mzk1NjVjYWU3YWIuLjUzZDA4ZDFiNTZmNSAxMDA2NDQKLS0tIGEvZHJpdmVycy92
aWRlby9mYmRldi91dmVzYWZiLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi91dmVzYWZiLmMK
QEAgLTE0NDAsNyArMTQ0MCw3IEBAIHN0YXRpYyB2b2lkIHV2ZXNhZmJfaW5pdF9pbmZvKHN0cnVj
dCBmYl9pbmZvICppbmZvLCBzdHJ1Y3QgdmJlX21vZGVfaWIgKm1vZGUpCiAKIAkvKiBEaXNhYmxl
IGJsYW5raW5nIGlmIHRoZSB1c2VyIHJlcXVlc3RlZCBzby4gKi8KIAlpZiAoIWJsYW5rKQotCQlp
bmZvLT5mYm9wcy0+ZmJfYmxhbmsgPSBOVUxMOworCQl1dmVzYWZiX29wcy5mYl9ibGFuayA9IE5V
TEw7CiAKIAkvKgogCSAqIEZpbmQgb3V0IGhvdyBtdWNoIElPIG1lbW9yeSBpcyByZXF1aXJlZCBm
b3IgdGhlIG1vZGUgd2l0aApAQCAtMTUxMCw3ICsxNTEwLDcgQEAgc3RhdGljIHZvaWQgdXZlc2Fm
Yl9pbml0X2luZm8oc3RydWN0IGZiX2luZm8gKmluZm8sIHN0cnVjdCB2YmVfbW9kZV9pYiAqbW9k
ZSkKIAkJCShwYXItPnlwYW4gPyBGQklORk9fSFdBQ0NFTF9ZUEFOIDogMCk7CiAKIAlpZiAoIXBh
ci0+eXBhbikKLQkJaW5mby0+ZmJvcHMtPmZiX3Bhbl9kaXNwbGF5ID0gTlVMTDsKKwkJdXZlc2Fm
Yl9vcHMuZmJfcGFuX2Rpc3BsYXkgPSBOVUxMOwogfQogCiBzdGF0aWMgdm9pZCB1dmVzYWZiX2lu
aXRfbXRycihzdHJ1Y3QgZmJfaW5mbyAqaW5mbykKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
