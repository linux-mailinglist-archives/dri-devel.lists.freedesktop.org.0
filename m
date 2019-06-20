Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 527FA4D9C2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 20:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12C46E55F;
	Thu, 20 Jun 2019 18:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D816E4B3;
 Thu, 20 Jun 2019 18:50:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jun 2019 11:50:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,397,1557212400"; d="scan'208";a="168602650"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 20 Jun 2019 11:50:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 20 Jun 2019 21:50:54 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm: Dump mode picture aspect ratio
Date: Thu, 20 Jun 2019 21:50:49 +0300
Message-Id: <20190620185049.8974-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620185049.8974-1-ville.syrjala@linux.intel.com>
References: <20190620185049.8974-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkN1
cnJlbnRseSB0aGUgbG9ncyBzaG93IG5vdGhpbmcgYWJvdXQgdGhlIG1vZGUncyBhc3BlY3QgcmF0
aW8uCkluY2x1ZGUgdGhhdCBpbmZvcm1hdGlvbiBpbiB0aGUgbm9ybWFsIG1vZGUgZHVtcC4KCnYy
OiBEb24ndCBwcmludCBhbnl0aGluZyBmb3IgTk9ORSAoSWxpYSkKCkNjOiBJbGlhIE1pcmtpbiA8
aW1pcmtpbkBhbHVtLm1pdC5lZHU+ClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmls
bGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy92aWRlby9oZG1pLmMgICAg
fCAzICsrLQogaW5jbHVkZS9kcm0vZHJtX21vZGVzLmggfCA2ICsrKystLQogaW5jbHVkZS9saW51
eC9oZG1pLmggICAgfCAzICsrKwogMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9oZG1pLmMgYi9kcml2ZXJz
L3ZpZGVvL2hkbWkuYwppbmRleCBiOTM5YmMyOGQ4ODYuLmJjNTkzZmUxYzI2OCAxMDA2NDQKLS0t
IGEvZHJpdmVycy92aWRlby9oZG1pLmMKKysrIGIvZHJpdmVycy92aWRlby9oZG1pLmMKQEAgLTEw
NTcsNyArMTA1Nyw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICpoZG1pX2NvbG9yaW1ldHJ5X2dldF9u
YW1lKGVudW0gaGRtaV9jb2xvcmltZXRyeSBjb2xvcmltZXRyeSkKIAlyZXR1cm4gIkludmFsaWQi
OwogfQogCi1zdGF0aWMgY29uc3QgY2hhciAqCitjb25zdCBjaGFyICoKIGhkbWlfcGljdHVyZV9h
c3BlY3RfZ2V0X25hbWUoZW51bSBoZG1pX3BpY3R1cmVfYXNwZWN0IHBpY3R1cmVfYXNwZWN0KQog
ewogCXN3aXRjaCAocGljdHVyZV9hc3BlY3QpIHsKQEAgLTEwNzYsNiArMTA3Niw3IEBAIGhkbWlf
cGljdHVyZV9hc3BlY3RfZ2V0X25hbWUoZW51bSBoZG1pX3BpY3R1cmVfYXNwZWN0IHBpY3R1cmVf
YXNwZWN0KQogCX0KIAlyZXR1cm4gIkludmFsaWQiOwogfQorRVhQT1JUX1NZTUJPTChoZG1pX3Bp
Y3R1cmVfYXNwZWN0X2dldF9uYW1lKTsKIAogc3RhdGljIGNvbnN0IGNoYXIgKgogaGRtaV9hY3Rp
dmVfYXNwZWN0X2dldF9uYW1lKGVudW0gaGRtaV9hY3RpdmVfYXNwZWN0IGFjdGl2ZV9hc3BlY3Qp
CmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fbW9kZXMuaCBiL2luY2x1ZGUvZHJtL2RybV9t
b2Rlcy5oCmluZGV4IDM5NjJkYmY4MjEwMC4uMGE3MjQ4NzRmZDg0IDEwMDY0NAotLS0gYS9pbmNs
dWRlL2RybS9kcm1fbW9kZXMuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fbW9kZXMuaApAQCAtNDM2
LDcgKzQzNiw3IEBAIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIHsKIC8qKgogICogRFJNX01PREVf
Rk1UIC0gcHJpbnRmIHN0cmluZyBmb3IgJnN0cnVjdCBkcm1fZGlzcGxheV9tb2RlCiAgKi8KLSNk
ZWZpbmUgRFJNX01PREVfRk1UICAgICJcIiVzXCI6ICVkICVkICVkICVkICVkICVkICVkICVkICVk
ICVkIDB4JXggMHgleCAlcyIKKyNkZWZpbmUgRFJNX01PREVfRk1UICAgICJcIiVzXCI6ICVkICVk
ICVkICVkICVkICVkICVkICVkICVkICVkIDB4JXggMHgleCAlcyAlcyIKIAogLyoqCiAgKiBEUk1f
TU9ERV9BUkcgLSBwcmludGYgYXJndW1lbnRzIGZvciAmc3RydWN0IGRybV9kaXNwbGF5X21vZGUK
QEAgLTQ0OCw3ICs0NDgsOSBAQCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSB7CiAJKG0pLT5oZGlz
cGxheSwgKG0pLT5oc3luY19zdGFydCwgKG0pLT5oc3luY19lbmQsIChtKS0+aHRvdGFsLCBcCiAJ
KG0pLT52ZGlzcGxheSwgKG0pLT52c3luY19zdGFydCwgKG0pLT52c3luY19lbmQsIChtKS0+dnRv
dGFsLCBcCiAJKG0pLT50eXBlLCAobSktPmZsYWdzLCBcCi0JZHJtX2dldF9tb2RlX2ZsYWdzX25h
bWUoYiwgc2l6ZW9mKGIpLCAobSktPmZsYWdzKQorCWRybV9nZXRfbW9kZV9mbGFnc19uYW1lKGIs
IHNpemVvZihiKSwgKG0pLT5mbGFncyksIFwKKwkobSktPnBpY3R1cmVfYXNwZWN0X3JhdGlvID8g
XAorCWhkbWlfcGljdHVyZV9hc3BlY3RfZ2V0X25hbWUoKG0pLT5waWN0dXJlX2FzcGVjdF9yYXRp
bykgOiAiIgogCiAjZGVmaW5lIG9ial90b19tb2RlKHgpIGNvbnRhaW5lcl9vZih4LCBzdHJ1Y3Qg
ZHJtX2Rpc3BsYXlfbW9kZSwgYmFzZSkKIApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9oZG1p
LmggYi9pbmNsdWRlL2xpbnV4L2hkbWkuaAppbmRleCA5OTE4YTZjOTEwYzUuLmRlN2NiZTM4NWRi
YSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9oZG1pLmgKKysrIGIvaW5jbHVkZS9saW51eC9o
ZG1pLmgKQEAgLTQzNCw0ICs0MzQsNyBAQCBpbnQgaGRtaV9pbmZvZnJhbWVfdW5wYWNrKHVuaW9u
IGhkbWlfaW5mb2ZyYW1lICpmcmFtZSwKIHZvaWQgaGRtaV9pbmZvZnJhbWVfbG9nKGNvbnN0IGNo
YXIgKmxldmVsLCBzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJCQljb25zdCB1bmlvbiBoZG1pX2luZm9m
cmFtZSAqZnJhbWUpOwogCitjb25zdCBjaGFyICoKK2hkbWlfcGljdHVyZV9hc3BlY3RfZ2V0X25h
bWUoZW51bSBoZG1pX3BpY3R1cmVfYXNwZWN0IHBpY3R1cmVfYXNwZWN0KTsKKwogI2VuZGlmIC8q
IF9EUk1fSERNSV9IICovCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
