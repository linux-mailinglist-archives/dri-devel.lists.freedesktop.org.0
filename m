Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF968202FB9
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 08:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA236E0DA;
	Mon, 22 Jun 2020 06:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C626E0DA;
 Mon, 22 Jun 2020 06:29:20 +0000 (UTC)
IronPort-SDR: QGqM+PxDqZFHtqiLU0vj5lG2neZ60TIJCR0AvFc9/h++qXsJoz7Ec23hwHhLrq2qtv1KL8bNQP
 9fUiEtS+4bOA==
X-IronPort-AV: E=McAfee;i="6000,8403,9659"; a="205153040"
X-IronPort-AV: E=Sophos;i="5.75,266,1589266800"; d="scan'208";a="205153040"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2020 23:29:20 -0700
IronPort-SDR: g77WJpEOgCrN4s6VYHp+s+mfOzn3duKRBUhq8phVNJrYuFe18RIR+RkOdR+4/WOAMYiKhK++1C
 l0UqLoGxqoJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,266,1589266800"; d="scan'208";a="300735621"
Received: from bhanu-nuc8i7beh.iind.intel.com ([10.145.162.210])
 by fmsmga004.fm.intel.com with ESMTP; 21 Jun 2020 23:29:18 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: bhanuprakash.modem@intel.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [v9 2/3] drm/debug: Expose connector VRR monitor range via debugfs
Date: Mon, 22 Jun 2020 19:55:18 +0530
Message-Id: <20200622142519.16214-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200622142519.16214-1-bhanuprakash.modem@intel.com>
References: <20200622142519.16214-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1doeV0KSXQncyB1c2VmdWwgdG8ga25vdyB0aGUgbWluIGFuZCBtYXggdnJyIHJhbmdlIGZvciBJ
R1QgdGVzdGluZy4KCltIb3ddCkV4cG9zZSB0aGUgbWluIGFuZCBtYXggdmZyZXEgZm9yIHRoZSBj
b25uZWN0b3IgdmlhIGEgZGVidWdmcyBmaWxlCm9uIHRoZSBjb25uZWN0b3IsICJ2cnJfcmFuZ2Ui
LgoKRXhhbXBsZSB1c2FnZTogY2F0IC9zeXMva2VybmVsL2RlYnVnL2RyaS8wL0RQLTEvdnJyX3Jh
bmdlCgp2MjoKKiBGaXggdGhlIHR5cG8gaW4gbWF4X3ZmcmVxIChNYW5hc2kpCiogQ2hhbmdlIHRo
ZSBuYW1lIG9mIG5vZGUgdG8gaTkxNV92cnJfaW5mbyBzbyB3ZSBjYW4gYWRkCm90aGVyIHZyciBp
bmZvIGZvciBtb3JlIGRlYnVnIGluZm8gKE1hbmFzaSkKKiBDaGFuZ2UgdGhlIFZSUiBjYXBhYmxl
IHRvIGRpc3BsYXkgWWVzIG9yIE5vIChNYW5hc2kpCiogRml4IGluZGVudGF0aW9uIGNoZWNrcGF0
Y2ggZXJyb3JzIChNYW5hc2kpCnYzOgoqIFJlbW92ZSB0aGUgdW5uZWNlc3NhcnkgZGVidWcgcHJp
bnQgKE1hbmFzaSkKdjQ6CiogUmViYXNlCnY1OgoqIFJlbmFtZSB0byB2cnJfcmFuZ2UgdG8gbWF0
Y2ggQU1EIGRlYnVnZnMKdjY6CiogUmViYXNlIChtYW5hc2kpCnY3OgoqIEZpeCBjbXBpbGF0aW9u
IGR1ZSB0byByZWJhc2UKdjg6CiogTW92ZSBkZWJ1Z2ZzIG5vZGUgY3JlYXRpb24gbG9naWMgdG8g
RFJNIChFbWlsKQoqIFJlbW92ZSBBTUQgc3BlY2lmaWMgbG9naWMgKEVtaWwpCnY5OgoqIFNlcGVy
YXRlIHBhdGNoIGZvciByZW1vdmFsIG9mIEFNRCBzcGVjaWZpYyBsb2dpYyAoTWFuYXNpKQoKU2ln
bmVkLW9mZi1ieTogQmhhbnVwcmFrYXNoIE1vZGVtIDxiaGFudXByYWthc2gubW9kZW1AaW50ZWwu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBNYW5hc2kgTmF2YXJlIDxtYW5hc2kuZC5uYXZhcmVAaW50ZWwu
Y29tPgpDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IFZp
bGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBIYXJyeSBX
ZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KQ0M6IEVtaWwgVmVsaWtvdiA8ZW1pbC5s
LnZlbGlrb3ZAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmcy5jIHwg
MjIgKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZGVidWdmcy5jCmluZGV4IGJmZTQ2MDJmMjA2Yi4uM2Q3MTgyMDAxMDA0IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnMuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RlYnVnZnMuYwpAQCAtMzc2LDYgKzM3NiwyNCBAQCBzdGF0aWMgc3NpemVfdCBl
ZGlkX3dyaXRlKHN0cnVjdCBmaWxlICpmaWxlLCBjb25zdCBjaGFyIF9fdXNlciAqdWJ1ZiwKIAly
ZXR1cm4gKHJldCkgPyByZXQgOiBsZW47CiB9CiAKKy8qCisgKiBSZXR1cm5zIHRoZSBtaW4gYW5k
IG1heCB2cnIgdmZyZXEgdGhyb3VnaCB0aGUgY29ubmVjdG9yJ3MgZGVidWdmcyBmaWxlLgorICog
RXhhbXBsZSB1c2FnZTogY2F0IC9zeXMva2VybmVsL2RlYnVnL2RyaS8wL0RQLTEvdnJyX3Jhbmdl
CisgKi8KK3N0YXRpYyBpbnQgdnJyX3JhbmdlX3Nob3coc3RydWN0IHNlcV9maWxlICptLCB2b2lk
ICpkYXRhKQoreworCXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IgPSBtLT5wcml2YXRl
OworCisJaWYgKGNvbm5lY3Rvci0+c3RhdHVzICE9IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVk
KQorCQlyZXR1cm4gLUVOT0RFVjsKKworCXNlcV9wcmludGYobSwgIk1pbjogJXVcbiIsICh1OClj
b25uZWN0b3ItPmRpc3BsYXlfaW5mby5tb25pdG9yX3JhbmdlLm1pbl92ZnJlcSk7CisJc2VxX3By
aW50ZihtLCAiTWF4OiAldVxuIiwgKHU4KWNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvLm1vbml0b3Jf
cmFuZ2UubWF4X3ZmcmVxKTsKKworCXJldHVybiAwOworfQorREVGSU5FX1NIT1dfQVRUUklCVVRF
KHZycl9yYW5nZSk7CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGRybV9l
ZGlkX2ZvcHMgPSB7CiAJLm93bmVyID0gVEhJU19NT0RVTEUsCiAJLm9wZW4gPSBlZGlkX29wZW4s
CkBAIC00MTMsNiArNDMxLDEwIEBAIHZvaWQgZHJtX2RlYnVnZnNfY29ubmVjdG9yX2FkZChzdHJ1
Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCS8qIGVkaWQgKi8KIAlkZWJ1Z2ZzX2NyZWF0
ZV9maWxlKCJlZGlkX292ZXJyaWRlIiwgU19JUlVHTyB8IFNfSVdVU1IsIHJvb3QsIGNvbm5lY3Rv
ciwKIAkJCSAgICAmZHJtX2VkaWRfZm9wcyk7CisKKwkvKiB2cnIgcmFuZ2UgKi8KKwlkZWJ1Z2Zz
X2NyZWF0ZV9maWxlKCJ2cnJfcmFuZ2UiLCBTX0lSVUdPLCByb290LCBjb25uZWN0b3IsCisJCQkg
ICAgJnZycl9yYW5nZV9mb3BzKTsKIH0KIAogdm9pZCBkcm1fZGVidWdmc19jb25uZWN0b3JfcmVt
b3ZlKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCi0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
