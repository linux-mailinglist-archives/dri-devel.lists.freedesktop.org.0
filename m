Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3B410B35E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 17:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC79D6E356;
	Wed, 27 Nov 2019 16:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D6889973;
 Wed, 27 Nov 2019 16:33:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 08:33:06 -0800
X-IronPort-AV: E=Sophos;i="5.69,250,1571727600"; d="scan'208";a="211736590"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 08:33:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 05/13] video: fbdev: vesafb: modify the static fb_ops directly
Date: Wed, 27 Nov 2019 18:32:01 +0200
Message-Id: <07acc8c8ef93f36103c7a13dc98e12790c2847df.1574871797.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1574871797.git.jani.nikula@intel.com>
References: <cover.1574871797.git.jani.nikula@intel.com>
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
b20+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi92ZXNhZmIuYyB8IDYgKysrLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvdmVzYWZiLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3Zlc2FmYi5j
CmluZGV4IGQ5YzA4ZjZjMjE1NS4uYTFmZTI0ZWE4NjliIDEwMDY0NAotLS0gYS9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L3Zlc2FmYi5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvdmVzYWZiLmMKQEAg
LTQ0NywxNSArNDQ3LDE1IEBAIHN0YXRpYyBpbnQgdmVzYWZiX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKmRldikKIAkgICAgICAgdmVzYWZiX2ZpeC5zbWVtX3N0YXJ0LCBpbmZvLT5zY3Jl
ZW5fYmFzZSwKIAkgICAgICAgc2l6ZV9yZW1hcC8xMDI0LCBzaXplX3RvdGFsLzEwMjQpOwogCisJ
aWYgKCF5cGFuKQorCQl2ZXNhZmJfb3BzLmZiX3Bhbl9kaXNwbGF5ID0gTlVMTDsKKwogCWluZm8t
PmZib3BzID0gJnZlc2FmYl9vcHM7CiAJaW5mby0+dmFyID0gdmVzYWZiX2RlZmluZWQ7CiAJaW5m
by0+Zml4ID0gdmVzYWZiX2ZpeDsKIAlpbmZvLT5mbGFncyA9IEZCSU5GT19GTEFHX0RFRkFVTFQg
fCBGQklORk9fTUlTQ19GSVJNV0FSRSB8CiAJCSh5cGFuID8gRkJJTkZPX0hXQUNDRUxfWVBBTiA6
IDApOwogCi0JaWYgKCF5cGFuKQotCQlpbmZvLT5mYm9wcy0+ZmJfcGFuX2Rpc3BsYXkgPSBOVUxM
OwotCiAJaWYgKGZiX2FsbG9jX2NtYXAoJmluZm8tPmNtYXAsIDI1NiwgMCkgPCAwKSB7CiAJCWVy
ciA9IC1FTk9NRU07CiAJCWdvdG8gZXJyOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
