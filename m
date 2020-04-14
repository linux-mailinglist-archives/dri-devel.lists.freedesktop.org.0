Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B97F11A72D1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 07:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124C36E44C;
	Tue, 14 Apr 2020 05:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C906E44A;
 Tue, 14 Apr 2020 05:07:08 +0000 (UTC)
IronPort-SDR: CMyPoM3k9WvIqClxUvnZQl3tUBeSGAf/ALM1V3SFnhzI953c5J3jBie/HUAdjfIgaqjT9kZtl6
 4WkqxPk3VGDw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2020 22:07:07 -0700
IronPort-SDR: YSRhDqLJs8t6oh45/wMnGPoGKbBkvTgdeoRrW6P0IbBJV6MjGC/xc1DLSsN/yp8hdzZPwTpCAb
 bGv8GleKx58Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,381,1580803200"; d="scan'208";a="454445195"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by fmsmga006.fm.intel.com with ESMTP; 13 Apr 2020 22:07:07 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/3] drm/i915/dp: Expose connector VRR info via debugfs
Date: Mon, 13 Apr 2020 22:08:07 -0700
Message-Id: <20200414050807.13531-3-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200414050807.13531-1-manasi.d.navare@intel.com>
References: <20200414050807.13531-1-manasi.d.navare@intel.com>
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
b25uZWN0b3IgdmlhIGEgZGVidWdmcyBmaWxlCm9uIHRoZSBjb25uZWN0b3IsICJpOTE1X3Zycl9p
bmZvIi4KCkV4YW1wbGUgdXNhZ2U6IGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9kcmkvMC9EUC0xL2k5
MTVfdnJyX2luZm8KCnYzOgoqIFJlbW92ZSB0aGUgdW5uZWNlc3NhcnkgZGVidWcgcHJpbnQgKE1h
bmFzaSkKdjI6CiogRml4IHRoZSB0eXBvIGluIG1heF92ZnJlcSAoTWFuYXNpKQoqIENoYW5nZSB0
aGUgbmFtZSBvZiBub2RlIHRvIGk5MTVfdnJyX2luZm8gc28gd2UgY2FuIGFkZApvdGhlciB2cnIg
aW5mbyBmb3IgbW9yZSBkZWJ1ZyBpbmZvIChNYW5hc2kpCiogQ2hhbmdlIHRoZSBWUlIgY2FwYWJs
ZSB0byBkaXNwbGF5IFllcyBvciBObyAoTWFuYXNpKQoqIEZpeCBpbmRlbnRhdGlvbiBjaGVja3Bh
dGNoIGVycm9ycyAoTWFuYXNpKQoKU2lnbmVkLW9mZi1ieTogQmhhbnVwcmFrYXNoIE1vZGVtIDxi
aGFudXByYWthc2gubW9kZW1AaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBNYW5hc2kgTmF2YXJl
IDxtYW5hc2kuZC5uYXZhcmVAaW50ZWwuY29tPgpDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxh
QGxpbnV4LmludGVsLmNvbT4KQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51
eC5pbnRlbC5jb20+ClRlc3RlZC1ieTogTWFuYXNpIE5hdmFyZSA8bWFuYXNpLmQubmF2YXJlQGlu
dGVsLmNvbT4KLS0tCiAuLi4vZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RlYnVnZnMu
YyAgfCAyMiArKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGlzcGxheV9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2Rpc3BsYXlfZGVidWdmcy5jCmluZGV4IGJkZWVhMmUwMjY0Mi4uMzViMjI5YWI0
ZDE5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3Bs
YXlfZGVidWdmcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheV9kZWJ1Z2ZzLmMKQEAgLTIwOTYsNiArMjA5NiwyMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGZpbGVfb3BlcmF0aW9ucyBpOTE1X2RzY19mZWNfc3VwcG9ydF9mb3BzID0gewogCS53cml0ZSA9
IGk5MTVfZHNjX2ZlY19zdXBwb3J0X3dyaXRlCiB9OwogCitzdGF0aWMgaW50IGk5MTVfdnJyX2lu
Zm9fc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKmRhdGEpCit7CisJc3RydWN0IGRybV9j
b25uZWN0b3IgKmNvbm5lY3RvciA9IG0tPnByaXZhdGU7CisKKwlpZiAoY29ubmVjdG9yLT5zdGF0
dXMgIT0gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQpCisJCXJldHVybiAtRU5PREVWOworCisJ
c2VxX3ByaW50ZihtLCAiVnJyX2NhcGFibGU6ICVzXG4iLCB5ZXNubyhpbnRlbF9kcF9pc192cnJf
Y2FwYWJsZShjb25uZWN0b3IpKSk7CisJc2VxX3ByaW50ZihtLCAiTWluOiAldVxuIiwgKHU4KWNv
bm5lY3Rvci0+ZGlzcGxheV9pbmZvLm1vbml0b3JfcmFuZ2UubWluX3ZmcmVxKTsKKwlzZXFfcHJp
bnRmKG0sICJNYXg6ICV1XG4iLCAodTgpY29ubmVjdG9yLT5kaXNwbGF5X2luZm8ubW9uaXRvcl9y
YW5nZS5tYXhfdmZyZXEpOworCisJcmV0dXJuIDA7Cit9CitERUZJTkVfU0hPV19BVFRSSUJVVEUo
aTkxNV92cnJfaW5mbyk7CisKIC8qKgogICogaW50ZWxfY29ubmVjdG9yX2RlYnVnZnNfYWRkIC0g
YWRkIGk5MTUgc3BlY2lmaWMgY29ubmVjdG9yIGRlYnVnZnMgZmlsZXMKICAqIEBjb25uZWN0b3I6
IHBvaW50ZXIgdG8gYSByZWdpc3RlcmVkIGRybV9jb25uZWN0b3IKQEAgLTIxMzAsOSArMjE0NSwx
NCBAQCBpbnQgaW50ZWxfY29ubmVjdG9yX2RlYnVnZnNfYWRkKHN0cnVjdCBkcm1fY29ubmVjdG9y
ICpjb25uZWN0b3IpCiAKIAlpZiAoSU5URUxfR0VOKGRldl9wcml2KSA+PSAxMCAmJgogCSAgICAo
Y29ubmVjdG9yLT5jb25uZWN0b3JfdHlwZSA9PSBEUk1fTU9ERV9DT05ORUNUT1JfRGlzcGxheVBv
cnQgfHwKLQkgICAgIGNvbm5lY3Rvci0+Y29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVD
VE9SX2VEUCkpCisJICAgICBjb25uZWN0b3ItPmNvbm5lY3Rvcl90eXBlID09IERSTV9NT0RFX0NP
Tk5FQ1RPUl9lRFApKSB7CiAJCWRlYnVnZnNfY3JlYXRlX2ZpbGUoImk5MTVfZHNjX2ZlY19zdXBw
b3J0IiwgU19JUlVHTywgcm9vdCwKIAkJCQkgICAgY29ubmVjdG9yLCAmaTkxNV9kc2NfZmVjX3N1
cHBvcnRfZm9wcyk7CiAKKwkJaWYgKElOVEVMX0dFTihkZXZfcHJpdikgPj0gMTIpCisJCQlkZWJ1
Z2ZzX2NyZWF0ZV9maWxlKCJpOTE1X3Zycl9pbmZvIiwgU19JUlVHTywKKwkJCQkJICAgIHJvb3Qs
IGNvbm5lY3RvciwgJmk5MTVfdnJyX2luZm9fZm9wcyk7CisJfQorCiAJcmV0dXJuIDA7CiB9Ci0t
IAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
