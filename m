Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B2FE6FC0
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 11:39:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3EC46E573;
	Mon, 28 Oct 2019 10:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0077C6E570;
 Mon, 28 Oct 2019 10:38:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 03:38:58 -0700
X-IronPort-AV: E=Sophos;i="5.68,239,1569308400"; d="scan'208";a="350648828"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 03:38:55 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND 4/8] drm/print: rename drm_debug to __drm_debug to
 discourage use
Date: Mon, 28 Oct 2019 12:38:18 +0200
Message-Id: <840ff7292d1a39512bac2fcb1f45de9d50694bf1.1572258936.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1572258935.git.jani.nikula@intel.com>
References: <cover.1572258935.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, Alex Deucher <alexander.deucher@amd.com>,
 intel-gfx@lists.freedesktop.org, Eric Engestrom <eric@engestrom.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtX2RlYnVnX2VuYWJsZWQoKSBpcyB0aGUgd2F5IHRvIGNoZWNrLiBfX2RybV9kZWJ1ZyBpcyBu
b3cgcmVzZXJ2ZWQgZm9yCmRybSBwcmludCBjb2RlIG9ubHkuIE5vIGZ1bmN0aW9uYWwgY2hhbmdl
cy4KCnYyOiBSZWJhc2Ugb24gbW92ZSB1bmxpa2VseSgpIHRvIGRybV9kZWJ1Z19lbmFibGVkKCkK
CkFja2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClJldmll
d2VkLWJ5OiBFcmljIEVuZ2VzdHJvbSA8ZXJpY0Blbmdlc3Ryb20uY2g+ClNpZ25lZC1vZmYtYnk6
IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2RybV9wcmludC5jIHwgOCArKysrLS0tLQogaW5jbHVkZS9kcm0vZHJtX3ByaW50LmggICAgIHwg
NSArKystLQogMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmludC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9wcmludC5jCmluZGV4IDlhMjVkNzNjMTU1Yy4uYTBkMWNkZTk4ODhhIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW50LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9wcmludC5jCkBAIC0zNywxMSArMzcsMTEgQEAKICNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+
CiAKIC8qCi0gKiBkcm1fZGVidWc6IEVuYWJsZSBkZWJ1ZyBvdXRwdXQuCisgKiBfX2RybV9kZWJ1
ZzogRW5hYmxlIGRlYnVnIG91dHB1dC4KICAqIEJpdG1hc2sgb2YgRFJNX1VUX3guIFNlZSBpbmNs
dWRlL2RybS9kcm1fcHJpbnQuaCBmb3IgZGV0YWlscy4KICAqLwotdW5zaWduZWQgaW50IGRybV9k
ZWJ1ZzsKLUVYUE9SVF9TWU1CT0woZHJtX2RlYnVnKTsKK3Vuc2lnbmVkIGludCBfX2RybV9kZWJ1
ZzsKK0VYUE9SVF9TWU1CT0woX19kcm1fZGVidWcpOwogCiBNT0RVTEVfUEFSTV9ERVNDKGRlYnVn
LCAiRW5hYmxlIGRlYnVnIG91dHB1dCwgd2hlcmUgZWFjaCBiaXQgZW5hYmxlcyBhIGRlYnVnIGNh
dGVnb3J5LlxuIgogIlx0XHRCaXQgMCAoMHgwMSkgIHdpbGwgZW5hYmxlIENPUkUgbWVzc2FnZXMg
KGRybSBjb3JlIGNvZGUpXG4iCkBAIC01Miw3ICs1Miw3IEBAIE1PRFVMRV9QQVJNX0RFU0MoZGVi
dWcsICJFbmFibGUgZGVidWcgb3V0cHV0LCB3aGVyZSBlYWNoIGJpdCBlbmFibGVzIGEgZGVidWcg
Y2F0CiAiXHRcdEJpdCA1ICgweDIwKSAgd2lsbCBlbmFibGUgVkJMIG1lc3NhZ2VzICh2Ymxhbmsg
Y29kZSlcbiIKICJcdFx0Qml0IDcgKDB4ODApICB3aWxsIGVuYWJsZSBMRUFTRSBtZXNzYWdlcyAo
bGVhc2luZyBjb2RlKVxuIgogIlx0XHRCaXQgOCAoMHgxMDApIHdpbGwgZW5hYmxlIERQIG1lc3Nh
Z2VzIChkaXNwbGF5cG9ydCBjb2RlKSIpOwotbW9kdWxlX3BhcmFtX25hbWVkKGRlYnVnLCBkcm1f
ZGVidWcsIGludCwgMDYwMCk7Cittb2R1bGVfcGFyYW1fbmFtZWQoZGVidWcsIF9fZHJtX2RlYnVn
LCBpbnQsIDA2MDApOwogCiB2b2lkIF9fZHJtX3B1dHNfY29yZWR1bXAoc3RydWN0IGRybV9wcmlu
dGVyICpwLCBjb25zdCBjaGFyICpzdHIpCiB7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1f
cHJpbnQuaCBiL2luY2x1ZGUvZHJtL2RybV9wcmludC5oCmluZGV4IDViODA0OTk5MmMyNC4uNzdm
ZWYyYzdlMzEyIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaAorKysgYi9pbmNs
dWRlL2RybS9kcm1fcHJpbnQuaApAQCAtMzQsNyArMzQsOCBAQAogCiAjaW5jbHVkZSA8ZHJtL2Ry
bS5oPgogCi1leHRlcm4gdW5zaWduZWQgaW50IGRybV9kZWJ1ZzsKKy8qIERvICpub3QqIHVzZSBv
dXRzaWRlIG9mIGRybV9wcmludC5bY2hdISAqLworZXh0ZXJuIHVuc2lnbmVkIGludCBfX2RybV9k
ZWJ1ZzsKIAogLyoqCiAgKiBET0M6IHByaW50CkBAIC0yOTUsNyArMjk2LDcgQEAgc3RhdGljIGlu
bGluZSBzdHJ1Y3QgZHJtX3ByaW50ZXIgZHJtX2Vycl9wcmludGVyKGNvbnN0IGNoYXIgKnByZWZp
eCkKIAogc3RhdGljIGlubGluZSBib29sIGRybV9kZWJ1Z19lbmFibGVkKHVuc2lnbmVkIGludCBj
YXRlZ29yeSkKIHsKLQlyZXR1cm4gdW5saWtlbHkoZHJtX2RlYnVnICYgY2F0ZWdvcnkpOworCXJl
dHVybiB1bmxpa2VseShfX2RybV9kZWJ1ZyAmIGNhdGVnb3J5KTsKIH0KIAogX19wcmludGYoMywg
NCkKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
