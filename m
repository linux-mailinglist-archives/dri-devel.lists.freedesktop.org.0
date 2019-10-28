Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C69CAE6FBD
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 11:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8C96E566;
	Mon, 28 Oct 2019 10:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F866E566;
 Mon, 28 Oct 2019 10:38:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 03:38:52 -0700
X-IronPort-AV: E=Sophos;i="5.68,239,1569308400"; d="scan'208";a="374195680"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 03:38:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND 3/8] drm/amdgpu: use drm_debug_enabled() to check for
 debug categories
Date: Mon, 28 Oct 2019 12:38:17 +0200
Message-Id: <e30ddbd627be1fe1c67dd007e0d36f81a094bc91.1572258936.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxsb3cgYmV0dGVyIGFic3RyYWN0aW9uIG9mIHRoZSBkcm1fZGVidWcgZ2xvYmFsIHZhcmlhYmxl
IGluIHRoZQpmdXR1cmUuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KCkNjOiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCAoQ2h1bk1pbmcpIFpob3UgPERhdmlkMS5aaG91
QGFtZC5jb20+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpBY2tlZC1ieTogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBKYW5p
IE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NtdV92MTFfMF9pMmMuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9zbXVfdjExXzBfaTJjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zbXVf
djExXzBfaTJjLmMKaW5kZXggYzQ0NzIzYzI2N2M5Li5jOTAyZjI2Y2Y1MGQgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NtdV92MTFfMF9pMmMuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zbXVfdjExXzBfaTJjLmMKQEAgLTIzNCw3ICsyMzQsNyBAQCBz
dGF0aWMgdWludDMyX3Qgc211X3YxMV8wX2kyY190cmFuc21pdChzdHJ1Y3QgaTJjX2FkYXB0ZXIg
KmNvbnRyb2wsCiAJRFJNX0RFQlVHX0RSSVZFUigiSTJDX1RyYW5zbWl0KCksIGFkZHJlc3MgPSAl
eCwgYnl0ZXMgPSAlZCAsIGRhdGE6ICIsCiAJCSAodWludDE2X3QpYWRkcmVzcywgbnVtYnl0ZXMp
OwogCi0JaWYgKGRybV9kZWJ1ZyAmIERSTV9VVF9EUklWRVIpIHsKKwlpZiAoZHJtX2RlYnVnX2Vu
YWJsZWQoRFJNX1VUX0RSSVZFUikpIHsKIAkJcHJpbnRfaGV4X2R1bXAoS0VSTl9JTkZPLCAiZGF0
YTogIiwgRFVNUF9QUkVGSVhfTk9ORSwKIAkJCSAgICAgICAxNiwgMSwgZGF0YSwgbnVtYnl0ZXMs
IGZhbHNlKTsKIAl9CkBAIC0zODgsNyArMzg4LDcgQEAgc3RhdGljIHVpbnQzMl90IHNtdV92MTFf
MF9pMmNfcmVjZWl2ZShzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmNvbnRyb2wsCiAJRFJNX0RFQlVHX0RS
SVZFUigiSTJDX1JlY2VpdmUoKSwgYWRkcmVzcyA9ICV4LCBieXRlcyA9ICVkLCBkYXRhIDoiLAog
CQkgICh1aW50MTZfdClhZGRyZXNzLCBieXRlc19yZWNlaXZlZCk7CiAKLQlpZiAoZHJtX2RlYnVn
ICYgRFJNX1VUX0RSSVZFUikgeworCWlmIChkcm1fZGVidWdfZW5hYmxlZChEUk1fVVRfRFJJVkVS
KSkgewogCQlwcmludF9oZXhfZHVtcChLRVJOX0lORk8sICJkYXRhOiAiLCBEVU1QX1BSRUZJWF9O
T05FLAogCQkJICAgICAgIDE2LCAxLCBkYXRhLCBieXRlc19yZWNlaXZlZCwgZmFsc2UpOwogCX0K
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
