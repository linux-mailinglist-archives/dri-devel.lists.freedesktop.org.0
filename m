Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF9210D40D
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 11:30:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 642566E8BA;
	Fri, 29 Nov 2019 10:30:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35E36E8B9;
 Fri, 29 Nov 2019 10:30:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 02:30:37 -0800
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; d="scan'208";a="221570949"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 02:30:35 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v2 06/14] video: fbmem: use const pointer for fb_ops
Date: Fri, 29 Nov 2019 12:29:36 +0200
Message-Id: <3a27f95b424a67b3542b5906c660741daf1d4ea6.1575022735.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIGNvbnN0IGZvciBmYl9vcHMgdG8gbGV0IHVzIG1ha2UgdGhlIGluZm8tPmZib3BzIHBvaW50
ZXIgY29uc3QgaW4gdGhlCmZ1dHVyZS4KCnYyOiByZWJhc2UKCkNjOiBsaW51eC1mYmRldkB2Z2Vy
Lmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVs
LmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyB8IDQgKystLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYv
Y29yZS9mYm1lbS5jCmluZGV4IDk5MDU1MDkzMGE4ZS4uN2RkZWI5MDMzN2JjIDEwMDY0NAotLS0g
YS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYworKysgYi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2NvcmUvZmJtZW0uYwpAQCAtMTA3OSw3ICsxMDc5LDcgQEAgRVhQT1JUX1NZTUJPTChmYl9i
bGFuayk7CiBzdGF0aWMgbG9uZyBkb19mYl9pb2N0bChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgdW5z
aWduZWQgaW50IGNtZCwKIAkJCXVuc2lnbmVkIGxvbmcgYXJnKQogewotCXN0cnVjdCBmYl9vcHMg
KmZiOworCWNvbnN0IHN0cnVjdCBmYl9vcHMgKmZiOwogCXN0cnVjdCBmYl92YXJfc2NyZWVuaW5m
byB2YXI7CiAJc3RydWN0IGZiX2ZpeF9zY3JlZW5pbmZvIGZpeDsKIAlzdHJ1Y3QgZmJfY21hcCBj
bWFwX2Zyb207CkBAIC0xMjkyLDcgKzEyOTIsNyBAQCBzdGF0aWMgbG9uZyBmYl9jb21wYXRfaW9j
dGwoc3RydWN0IGZpbGUgKmZpbGUsIHVuc2lnbmVkIGludCBjbWQsCiAJCQkgICAgdW5zaWduZWQg
bG9uZyBhcmcpCiB7CiAJc3RydWN0IGZiX2luZm8gKmluZm8gPSBmaWxlX2ZiX2luZm8oZmlsZSk7
Ci0Jc3RydWN0IGZiX29wcyAqZmI7CisJY29uc3Qgc3RydWN0IGZiX29wcyAqZmI7CiAJbG9uZyBy
ZXQgPSAtRU5PSU9DVExDTUQ7CiAKIAlpZiAoIWluZm8pCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
