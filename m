Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3145B1CA5
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 13:52:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5016EF3C;
	Fri, 13 Sep 2019 11:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2416EF39;
 Fri, 13 Sep 2019 11:52:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Sep 2019 04:52:54 -0700
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="197528565"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Sep 2019 04:52:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 9/9] drm/print: rename drm_debug to __drm_debug to discourage
 use
Date: Fri, 13 Sep 2019 14:51:46 +0300
Message-Id: <4975b87fcf65203aac3a8c3920461639e3301e18.1568375189.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1568375189.git.jani.nikula@intel.com>
References: <cover.1568375189.git.jani.nikula@intel.com>
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

ZHJtX2RlYnVnX2VuYWJsZWQoKSBpcyB0aGUgd2F5IHRvIGNoZWNrLiBfX2RybV9kZWJ1ZyBpcyBu
b3cgcmVzZXJ2ZWQgZm9yCmRybSBwcmludCBjb2RlIG9ubHkuIE5vIGZ1bmN0aW9uYWwgY2hhbmdl
cy4KClNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2RybV9wcmludC5jIHwgOCArKysrLS0tLQogaW5jbHVkZS9kcm0v
ZHJtX3ByaW50LmggICAgIHwgNSArKystLQogMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmlu
dC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcmludC5jCmluZGV4IGE3Yzg5ZWM1ZmYyNi4uY2Ez
YzU2YjAyNmYwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW50LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9wcmludC5jCkBAIC0zNywxMSArMzcsMTEgQEAKICNpbmNsdWRl
IDxkcm0vZHJtX3ByaW50Lmg+CiAKIC8qCi0gKiBkcm1fZGVidWc6IEVuYWJsZSBkZWJ1ZyBvdXRw
dXQuCisgKiBfX2RybV9kZWJ1ZzogRW5hYmxlIGRlYnVnIG91dHB1dC4KICAqIEJpdG1hc2sgb2Yg
RFJNX1VUX3guIFNlZSBpbmNsdWRlL2RybS9kcm1fcHJpbnQuaCBmb3IgZGV0YWlscy4KICAqLwot
dW5zaWduZWQgaW50IGRybV9kZWJ1ZzsKLUVYUE9SVF9TWU1CT0woZHJtX2RlYnVnKTsKK3Vuc2ln
bmVkIGludCBfX2RybV9kZWJ1ZzsKK0VYUE9SVF9TWU1CT0woX19kcm1fZGVidWcpOwogCiBNT0RV
TEVfUEFSTV9ERVNDKGRlYnVnLCAiRW5hYmxlIGRlYnVnIG91dHB1dCwgd2hlcmUgZWFjaCBiaXQg
ZW5hYmxlcyBhIGRlYnVnIGNhdGVnb3J5LlxuIgogIlx0XHRCaXQgMCAoMHgwMSkgIHdpbGwgZW5h
YmxlIENPUkUgbWVzc2FnZXMgKGRybSBjb3JlIGNvZGUpXG4iCkBAIC01Miw3ICs1Miw3IEBAIE1P
RFVMRV9QQVJNX0RFU0MoZGVidWcsICJFbmFibGUgZGVidWcgb3V0cHV0LCB3aGVyZSBlYWNoIGJp
dCBlbmFibGVzIGEgZGVidWcgY2F0CiAiXHRcdEJpdCA1ICgweDIwKSAgd2lsbCBlbmFibGUgVkJM
IG1lc3NhZ2VzICh2YmxhbmsgY29kZSlcbiIKICJcdFx0Qml0IDcgKDB4ODApICB3aWxsIGVuYWJs
ZSBMRUFTRSBtZXNzYWdlcyAobGVhc2luZyBjb2RlKVxuIgogIlx0XHRCaXQgOCAoMHgxMDApIHdp
bGwgZW5hYmxlIERQIG1lc3NhZ2VzIChkaXNwbGF5cG9ydCBjb2RlKSIpOwotbW9kdWxlX3BhcmFt
X25hbWVkKGRlYnVnLCBkcm1fZGVidWcsIGludCwgMDYwMCk7Cittb2R1bGVfcGFyYW1fbmFtZWQo
ZGVidWcsIF9fZHJtX2RlYnVnLCBpbnQsIDA2MDApOwogCiB2b2lkIF9fZHJtX3B1dHNfY29yZWR1
bXAoc3RydWN0IGRybV9wcmludGVyICpwLCBjb25zdCBjaGFyICpzdHIpCiB7CmRpZmYgLS1naXQg
YS9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaCBiL2luY2x1ZGUvZHJtL2RybV9wcmludC5oCmluZGV4
IGUxM2Y5MDEzMTJhNC4uODgwYmMwZDFmZDQ4IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1f
cHJpbnQuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaApAQCAtMzQsNyArMzQsOCBAQAog
CiAjaW5jbHVkZSA8ZHJtL2RybS5oPgogCi1leHRlcm4gdW5zaWduZWQgaW50IGRybV9kZWJ1ZzsK
Ky8qIERvICpub3QqIHVzZSBvdXRzaWRlIG9mIGRybV9wcmludC5bY2hdISAqLworZXh0ZXJuIHVu
c2lnbmVkIGludCBfX2RybV9kZWJ1ZzsKIAogLyoqCiAgKiBET0M6IHByaW50CkBAIC0yOTYsNyAr
Mjk3LDcgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgZHJtX3ByaW50ZXIgZHJtX2Vycl9wcmludGVy
KGNvbnN0IGNoYXIgKnByZWZpeCkKIAogc3RhdGljIGlubGluZSBib29sIGRybV9kZWJ1Z19lbmFi
bGVkKHVuc2lnbmVkIGludCBjYXRlZ29yeSkKIHsKLQlyZXR1cm4gZHJtX2RlYnVnICYgY2F0ZWdv
cnk7CisJcmV0dXJuIF9fZHJtX2RlYnVnICYgY2F0ZWdvcnk7CiB9CiAKIF9fcHJpbnRmKDMsIDQp
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
