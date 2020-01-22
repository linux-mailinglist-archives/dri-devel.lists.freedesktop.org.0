Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DEF145900
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 16:50:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5B36F57B;
	Wed, 22 Jan 2020 15:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFFEA6F57B;
 Wed, 22 Jan 2020 15:50:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 07:50:39 -0800
X-IronPort-AV: E=Sophos;i="5.70,350,1574150400"; d="scan'208";a="220351265"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 07:50:36 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/2] drm: add drm_core_check_all_features() to check for a
 mask of features
Date: Wed, 22 Jan 2020 17:50:29 +0200
Message-Id: <20200122155030.29304-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG5ldyBkcm1fY29yZV9jaGVja19hbGxfZmVhdHVyZXMoKSBmdW5jdGlvbiB0byBjaGVjayBm
b3IgYSBtYXNrIG9mCmZlYXR1cmVzLiBBbGwgZmVhdHVyZXMgaW4gdGhlIG1hc2sgYXJlIHJlcXVp
cmVkLgoKUmVkZWZpbmUgZXhpc3RpbmcgZHJtX2NvcmVfY2hlY2tfZmVhdHVyZSgpIGluIHRlcm1z
IG9mIHRoaXMgZnVuY3Rpb24sCnVzaW5nIHRoZSBkcm1fZHJpdmVyX2ZlYXR1cmUgZW51bSBmb3Ig
dGhlIHBhcmFtZXRlci4KCnYzOgotIGFkZCBkcm1fY29yZV9jaGVja19hbGxfZmVhdHVyZXMoKSAo
VGhvbWFzKQoKdjI6Ci0gZml4IGtlcm5lbC1kb2MgKFZpbGxlKQotIGFkZCBhbiBleHRyYSB2YXJp
YWJsZSBmb3IgY2xhcml0eSAoVmlsbGUpCgpDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPgpTaWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29t
PgotLS0KIGluY2x1ZGUvZHJtL2RybV9kcnYuaCB8IDI0ICsrKysrKysrKysrKysrKysrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2Rydi5oIGIvaW5jbHVkZS9kcm0vZHJtX2Rydi5oCmlu
ZGV4IGNmMTM0NzA4MTBhNS4uMjNiNjM2NjkxZmI0IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9k
cm1fZHJ2LmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2Rydi5oCkBAIC04MjMsNiArODIzLDI1IEBA
IHN0YXRpYyBpbmxpbmUgYm9vbCBkcm1fZGV2X2lzX3VucGx1Z2dlZChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2KQogCXJldHVybiB0cnVlOwogfQogCisvKioKKyAqIGRybV9jb3JlX2NoZWNrX2FsbF9m
ZWF0dXJlcyAtIGNoZWNrIGRyaXZlciBmZWF0dXJlIGZsYWdzIG1hc2sKKyAqIEBkZXY6IERSTSBk
ZXZpY2UgdG8gY2hlY2sKKyAqIEBmZWF0dXJlczogZmVhdHVyZSBmbGFnKHMpIG1hc2sKKyAqCisg
KiBUaGlzIGNoZWNrcyBAZGV2IGZvciBkcml2ZXIgZmVhdHVyZXMsIHNlZSAmZHJtX2RyaXZlci5k
cml2ZXJfZmVhdHVyZXMsCisgKiAmZHJtX2RldmljZS5kcml2ZXJfZmVhdHVyZXMsIGFuZCB0aGUg
dmFyaW91cyAmZW51bSBkcm1fZHJpdmVyX2ZlYXR1cmUgZmxhZ3MuCisgKgorICogUmV0dXJucyB0
cnVlIGlmIGFsbCBmZWF0dXJlcyBpbiB0aGUgQGZlYXR1cmVzIG1hc2sgYXJlIHN1cHBvcnRlZCwg
ZmFsc2UKKyAqIG90aGVyd2lzZS4KKyAqLworc3RhdGljIGlubGluZSBib29sIGRybV9jb3JlX2No
ZWNrX2FsbF9mZWF0dXJlcyhjb25zdCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAorCQkJCQkgICAg
ICAgdTMyIGZlYXR1cmVzKQoreworCXUzMiBzdXBwb3J0ZWQgPSBkZXYtPmRyaXZlci0+ZHJpdmVy
X2ZlYXR1cmVzICYgZGV2LT5kcml2ZXJfZmVhdHVyZXM7CisKKwlyZXR1cm4gZmVhdHVyZXMgJiYg
KHN1cHBvcnRlZCAmIGZlYXR1cmVzKSA9PSBmZWF0dXJlczsKK30KKwogLyoqCiAgKiBkcm1fY29y
ZV9jaGVja19mZWF0dXJlIC0gY2hlY2sgZHJpdmVyIGZlYXR1cmUgZmxhZ3MKICAqIEBkZXY6IERS
TSBkZXZpY2UgdG8gY2hlY2sKQEAgLTgzMyw5ICs4NTIsMTAgQEAgc3RhdGljIGlubGluZSBib29s
IGRybV9kZXZfaXNfdW5wbHVnZ2VkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAgKgogICogUmV0
dXJucyB0cnVlIGlmIHRoZSBAZmVhdHVyZSBpcyBzdXBwb3J0ZWQsIGZhbHNlIG90aGVyd2lzZS4K
ICAqLwotc3RhdGljIGlubGluZSBib29sIGRybV9jb3JlX2NoZWNrX2ZlYXR1cmUoY29uc3Qgc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwgdTMyIGZlYXR1cmUpCitzdGF0aWMgaW5saW5lIGJvb2wgZHJt
X2NvcmVfY2hlY2tfZmVhdHVyZShjb25zdCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAorCQkJCQkg
IGVudW0gZHJtX2RyaXZlcl9mZWF0dXJlIGZlYXR1cmUpCiB7Ci0JcmV0dXJuIGRldi0+ZHJpdmVy
LT5kcml2ZXJfZmVhdHVyZXMgJiBkZXYtPmRyaXZlcl9mZWF0dXJlcyAmIGZlYXR1cmU7CisJcmV0
dXJuIGRybV9jb3JlX2NoZWNrX2FsbF9mZWF0dXJlcyhkZXYsIGZlYXR1cmUpOwogfQogCiAvKioK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
