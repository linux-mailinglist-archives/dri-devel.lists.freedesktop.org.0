Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E554C1F7F6B
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 01:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8E76E219;
	Fri, 12 Jun 2020 23:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82536E20A;
 Fri, 12 Jun 2020 23:03:49 +0000 (UTC)
IronPort-SDR: ZcAIlb1GND6tOSbZxBA1yyZ5kvOAHuZSrkavXzTJnUg9z37eOs56Gu8DkIt8pzBhgw91gwhZWW
 n26oD1BVvy9A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2020 16:03:49 -0700
IronPort-SDR: 55OGXrmEf9zFJF/aMP8vu7ervjdwu8n7RD34K1eeVwhGuAN3gF6wjATE1skk4XUlujaV/uiGnB
 pjLvI77kuHCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,504,1583222400"; d="scan'208";a="307446315"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by fmsmga002.fm.intel.com with ESMTP; 12 Jun 2020 16:03:48 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 3/3] drm/i915/dp: Expose connector VRR monitor range via
 debugfs
Date: Fri, 12 Jun 2020 16:04:44 -0700
Message-Id: <20200612230444.10121-4-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200612230444.10121-1-manasi.d.navare@intel.com>
References: <20200612230444.10121-1-manasi.d.navare@intel.com>
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmhhbnVwcmFrYXNoIE1vZGVtIDxiaGFudXByYWthc2gubW9kZW1AaW50ZWwuY29tPgoK
W1doeV0KSXQncyB1c2VmdWwgdG8ga25vdyB0aGUgbWluIGFuZCBtYXggdnJyIHJhbmdlIGZvciBJ
R1QgdGVzdGluZy4KCltIb3ddCkV4cG9zZSB0aGUgbWluIGFuZCBtYXggdmZyZXEgZm9yIHRoZSBj
b25uZWN0b3IgdmlhIGEgZGVidWdmcyBmaWxlCm9uIHRoZSBjb25uZWN0b3IsICJ2cnJfcmFuZ2Ui
LgoKRXhhbXBsZSB1c2FnZTogY2F0IC9zeXMva2VybmVsL2RlYnVnL2RyaS8wL0RQLTEvdnJyX3Jh
bmdlCgp2NjoKKiBSZWJhc2UgKG1hbmFzaSkKdjU6CiogUmVuYW1lIHRvIHZycl9yYW5nZSB0byBt
YXRjaCBBTUQgZGVidWdmcwp2NDoKKiBSZWJhc2UKdjM6CiogUmVtb3ZlIHRoZSB1bm5lY2Vzc2Fy
eSBkZWJ1ZyBwcmludCAoTWFuYXNpKQp2MjoKKiBGaXggdGhlIHR5cG8gaW4gbWF4X3ZmcmVxIChN
YW5hc2kpCiogQ2hhbmdlIHRoZSBuYW1lIG9mIG5vZGUgdG8gaTkxNV92cnJfaW5mbyBzbyB3ZSBj
YW4gYWRkCm90aGVyIHZyciBpbmZvIGZvciBtb3JlIGRlYnVnIGluZm8gKE1hbmFzaSkKKiBDaGFu
Z2UgdGhlIFZSUiBjYXBhYmxlIHRvIGRpc3BsYXkgWWVzIG9yIE5vIChNYW5hc2kpCiogRml4IGlu
ZGVudGF0aW9uIGNoZWNrcGF0Y2ggZXJyb3JzIChNYW5hc2kpCgpTaWduZWQtb2ZmLWJ5OiBCaGFu
dXByYWthc2ggTW9kZW0gPGJoYW51cHJha2FzaC5tb2RlbUBpbnRlbC5jb20+ClNpZ25lZC1vZmYt
Ynk6IE1hbmFzaSBOYXZhcmUgPG1hbmFzaS5kLm5hdmFyZUBpbnRlbC5jb20+CkNjOiBKYW5pIE5p
a3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPgpDYzogVmlsbGUgU3lyasOkbMOkIDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KVGVzdGVkLWJ5OiBNYW5hc2kgTmF2YXJlIDxt
YW5hc2kuZC5uYXZhcmVAaW50ZWwuY29tPgotLS0KIC4uLi9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2Rpc3BsYXlfZGVidWdmcy5jICB8IDIwICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCAyMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RlYnVnZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGlzcGxheV9kZWJ1Z2ZzLmMKaW5kZXggMjhkZDcxN2U5NDNhLi5mYzA1ZDM0
NjhhN2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheV9kZWJ1Z2ZzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
aXNwbGF5X2RlYnVnZnMuYwpAQCAtMjE4NSw2ICsyMTg1LDIxIEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgZmlsZV9vcGVyYXRpb25zIGk5MTVfZHNjX2ZlY19zdXBwb3J0X2ZvcHMgPSB7CiAJLndyaXRl
ID0gaTkxNV9kc2NfZmVjX3N1cHBvcnRfd3JpdGUKIH07CiAKK3N0YXRpYyBpbnQgdnJyX3Jhbmdl
X3Nob3coc3RydWN0IHNlcV9maWxlICptLCB2b2lkICpkYXRhKQoreworCXN0cnVjdCBkcm1fY29u
bmVjdG9yICpjb25uZWN0b3IgPSBtLT5wcml2YXRlOworCisJaWYgKGNvbm5lY3Rvci0+c3RhdHVz
ICE9IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVkKQorCQlyZXR1cm4gLUVOT0RFVjsKKworCXNl
cV9wcmludGYobSwgIlZycl9jYXBhYmxlOiAlc1xuIiwgeWVzbm8oaW50ZWxfZHBfaXNfdnJyX2Nh
cGFibGUoY29ubmVjdG9yKSkpOworCXNlcV9wcmludGYobSwgIk1pbjogJXVcbiIsICh1OCljb25u
ZWN0b3ItPmRpc3BsYXlfaW5mby5tb25pdG9yX3JhbmdlLm1pbl92ZnJlcSk7CisJc2VxX3ByaW50
ZihtLCAiTWF4OiAldVxuIiwgKHU4KWNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvLm1vbml0b3JfcmFu
Z2UubWF4X3ZmcmVxKTsKKworCXJldHVybiAwOworfQorREVGSU5FX1NIT1dfQVRUUklCVVRFKHZy
cl9yYW5nZSk7CisKIC8qKgogICogaW50ZWxfY29ubmVjdG9yX2RlYnVnZnNfYWRkIC0gYWRkIGk5
MTUgc3BlY2lmaWMgY29ubmVjdG9yIGRlYnVnZnMgZmlsZXMKICAqIEBjb25uZWN0b3I6IHBvaW50
ZXIgdG8gYSByZWdpc3RlcmVkIGRybV9jb25uZWN0b3IKQEAgLTIyMjQsNiArMjIzOSwxMSBAQCBp
bnQgaW50ZWxfY29ubmVjdG9yX2RlYnVnZnNfYWRkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IpCiAJCWRlYnVnZnNfY3JlYXRlX2ZpbGUoImk5MTVfZHNjX2ZlY19zdXBwb3J0IiwgU19J
UlVHTywgcm9vdCwKIAkJCQkgICAgY29ubmVjdG9yLCAmaTkxNV9kc2NfZmVjX3N1cHBvcnRfZm9w
cyk7CiAKKwkJaWYgKElOVEVMX0dFTihkZXZfcHJpdikgPj0gMTIpCisJCQlkZWJ1Z2ZzX2NyZWF0
ZV9maWxlKCJ2cnJfcmFuZ2UiLCBTX0lSVUdPLAorCQkJCQkgICAgcm9vdCwgY29ubmVjdG9yLCAm
dnJyX3JhbmdlX2ZvcHMpOworCX0KKwogCS8qIExlZ2FjeSBwYW5lbHMgZG9lc24ndCBscHNwIG9u
IGFueSBwbGF0Zm9ybSAqLwogCWlmICgoSU5URUxfR0VOKGRldl9wcml2KSA+PSA5IHx8IElTX0hB
U1dFTEwoZGV2X3ByaXYpIHx8CiAJICAgICBJU19CUk9BRFdFTEwoZGV2X3ByaXYpKSAmJgotLSAK
Mi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
