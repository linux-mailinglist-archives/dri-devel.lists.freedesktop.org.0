Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA2ABC875
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 15:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3424E6EA2D;
	Tue, 24 Sep 2019 13:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3B66EA2A;
 Tue, 24 Sep 2019 13:00:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Sep 2019 06:00:27 -0700
X-IronPort-AV: E=Sophos;i="5.64,544,1559545200"; d="scan'208";a="200896177"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Sep 2019 06:00:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 9/9] drm/print: rename drm_debug to __drm_debug to
 discourage use
Date: Tue, 24 Sep 2019 15:59:05 +0300
Message-Id: <a82e299adfaf158603bfc2dd84a62558e68b7c24.1569329774.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1569329774.git.jani.nikula@intel.com>
References: <cover.1569329774.git.jani.nikula@intel.com>
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
cy4KCnYyOiBSZWJhc2Ugb24gbW92ZSB1bmxpa2VseSgpIHRvIGRybV9kZWJ1Z19lbmFibGVkKCkK
ClNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2RybV9wcmludC5jIHwgOCArKysrLS0tLQogaW5jbHVkZS9kcm0vZHJt
X3ByaW50LmggICAgIHwgNSArKystLQogMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyks
IDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmludC5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcmludC5jCmluZGV4IGE3Yzg5ZWM1ZmYyNi4uY2EzYzU2
YjAyNmYwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW50LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9wcmludC5jCkBAIC0zNywxMSArMzcsMTEgQEAKICNpbmNsdWRlIDxk
cm0vZHJtX3ByaW50Lmg+CiAKIC8qCi0gKiBkcm1fZGVidWc6IEVuYWJsZSBkZWJ1ZyBvdXRwdXQu
CisgKiBfX2RybV9kZWJ1ZzogRW5hYmxlIGRlYnVnIG91dHB1dC4KICAqIEJpdG1hc2sgb2YgRFJN
X1VUX3guIFNlZSBpbmNsdWRlL2RybS9kcm1fcHJpbnQuaCBmb3IgZGV0YWlscy4KICAqLwotdW5z
aWduZWQgaW50IGRybV9kZWJ1ZzsKLUVYUE9SVF9TWU1CT0woZHJtX2RlYnVnKTsKK3Vuc2lnbmVk
IGludCBfX2RybV9kZWJ1ZzsKK0VYUE9SVF9TWU1CT0woX19kcm1fZGVidWcpOwogCiBNT0RVTEVf
UEFSTV9ERVNDKGRlYnVnLCAiRW5hYmxlIGRlYnVnIG91dHB1dCwgd2hlcmUgZWFjaCBiaXQgZW5h
YmxlcyBhIGRlYnVnIGNhdGVnb3J5LlxuIgogIlx0XHRCaXQgMCAoMHgwMSkgIHdpbGwgZW5hYmxl
IENPUkUgbWVzc2FnZXMgKGRybSBjb3JlIGNvZGUpXG4iCkBAIC01Miw3ICs1Miw3IEBAIE1PRFVM
RV9QQVJNX0RFU0MoZGVidWcsICJFbmFibGUgZGVidWcgb3V0cHV0LCB3aGVyZSBlYWNoIGJpdCBl
bmFibGVzIGEgZGVidWcgY2F0CiAiXHRcdEJpdCA1ICgweDIwKSAgd2lsbCBlbmFibGUgVkJMIG1l
c3NhZ2VzICh2YmxhbmsgY29kZSlcbiIKICJcdFx0Qml0IDcgKDB4ODApICB3aWxsIGVuYWJsZSBM
RUFTRSBtZXNzYWdlcyAobGVhc2luZyBjb2RlKVxuIgogIlx0XHRCaXQgOCAoMHgxMDApIHdpbGwg
ZW5hYmxlIERQIG1lc3NhZ2VzIChkaXNwbGF5cG9ydCBjb2RlKSIpOwotbW9kdWxlX3BhcmFtX25h
bWVkKGRlYnVnLCBkcm1fZGVidWcsIGludCwgMDYwMCk7Cittb2R1bGVfcGFyYW1fbmFtZWQoZGVi
dWcsIF9fZHJtX2RlYnVnLCBpbnQsIDA2MDApOwogCiB2b2lkIF9fZHJtX3B1dHNfY29yZWR1bXAo
c3RydWN0IGRybV9wcmludGVyICpwLCBjb25zdCBjaGFyICpzdHIpCiB7CmRpZmYgLS1naXQgYS9p
bmNsdWRlL2RybS9kcm1fcHJpbnQuaCBiL2luY2x1ZGUvZHJtL2RybV9wcmludC5oCmluZGV4IDQ2
MThlOTBjZDEyNC4uY2RlNTQ5MDBkNTkzIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fcHJp
bnQuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaApAQCAtMzQsNyArMzQsOCBAQAogCiAj
aW5jbHVkZSA8ZHJtL2RybS5oPgogCi1leHRlcm4gdW5zaWduZWQgaW50IGRybV9kZWJ1ZzsKKy8q
IERvICpub3QqIHVzZSBvdXRzaWRlIG9mIGRybV9wcmludC5bY2hdISAqLworZXh0ZXJuIHVuc2ln
bmVkIGludCBfX2RybV9kZWJ1ZzsKIAogLyoqCiAgKiBET0M6IHByaW50CkBAIC0yOTYsNyArMjk3
LDcgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgZHJtX3ByaW50ZXIgZHJtX2Vycl9wcmludGVyKGNv
bnN0IGNoYXIgKnByZWZpeCkKIAogc3RhdGljIGlubGluZSBib29sIGRybV9kZWJ1Z19lbmFibGVk
KHVuc2lnbmVkIGludCBjYXRlZ29yeSkKIHsKLQlyZXR1cm4gdW5saWtlbHkoZHJtX2RlYnVnICYg
Y2F0ZWdvcnkpOworCXJldHVybiB1bmxpa2VseShfX2RybV9kZWJ1ZyAmIGNhdGVnb3J5KTsKIH0K
IAogX19wcmludGYoMywgNCkKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
