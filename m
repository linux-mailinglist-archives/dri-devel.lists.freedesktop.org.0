Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A165B6D06B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 16:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371026E405;
	Thu, 18 Jul 2019 14:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9116E405;
 Thu, 18 Jul 2019 14:51:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 07:51:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,278,1559545200"; d="scan'208";a="168288031"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 18 Jul 2019 07:51:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 18 Jul 2019 17:51:24 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 10/12] drm/i915: Document ILK+ pipe csc matrix better
Date: Thu, 18 Jul 2019 17:50:51 +0300
Message-Id: <20190718145053.25808-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190718145053.25808-1-ville.syrjala@linux.intel.com>
References: <20190718145053.25808-1-ville.syrjala@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkFk
ZCBjb21tZW50cyB0byBleHBsYWluIHRoZSBpbGsgcGlwZSBjc2Mgb3BlcmF0aW9uIGEgYml0IGJl
dHRlci4KClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51
eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xv
ci5jIHwgMjYgKysrKysrKysrKysrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9jb2xvci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9jb2xvci5jCmluZGV4IDIzYTg0ZGQ3OTg5Zi4uNzM2YzQyNzIwZGFmIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvci5jCkBAIC00Miw2ICs0MiwyMSBAQAog
CiAjZGVmaW5lIExFR0FDWV9MVVRfTEVOR1RICQkyNTYKIAorLyoKKyAqIElMSysgY3NjIG1hdHJp
eDoKKyAqCisgKiB8Ui9DcnwgICB8IGMwIGMxIGMyIHwgICAoIHxSL0NyfCAgIHxwcmVvZmYwfCAp
ICAgfHBvc3RvZmYwfAorICogfEcvWSB8ID0gfCBjMyBjNCBjNSB8IHggKCB8Ry9ZIHwgKyB8cHJl
b2ZmMXwgKSArIHxwb3N0b2ZmMXwKKyAqIHxCL0NifCAgIHwgYzYgYzcgYzggfCAgICggfEIvQ2J8
ICAgfHByZW9mZjJ8ICkgICB8cG9zdG9mZjJ8CisgKgorICogSUxLL1NOQiBkb24ndCBoYXZlIGV4
cGxpY2l0IHBvc3Qgb2Zmc2V0cywgYW5kIGluc3RlYWQKKyAqIENTQ19NT0RFX1lVVl9UT19SR0Ig
YW5kIENTQ19CTEFDS19TQ1JFRU5fT0ZGU0VUIGFyZSB1c2VkOgorICogIENTQ19NT0RFX1lVVl9U
T19SR0I9MCArIENTQ19CTEFDS19TQ1JFRU5fT0ZGU0VUPTAgLT4gMS8yLCAwLCAxLzIKKyAqICBD
U0NfTU9ERV9ZVVZfVE9fUkdCPTAgKyBDU0NfQkxBQ0tfU0NSRUVOX09GRlNFVD0xIC0+IDEvMiwg
MS8xNiwgMS8yCisgKiAgQ1NDX01PREVfWVVWX1RPX1JHQj0xICsgQ1NDX0JMQUNLX1NDUkVFTl9P
RkZTRVQ9MCAtPiAwLCAwLCAwCisgKiAgQ1NDX01PREVfWVVWX1RPX1JHQj0xICsgQ1NDX0JMQUNL
X1NDUkVFTl9PRkZTRVQ9MSAtPiAxLzE2LCAxLzE2LCAxLzE2CisgKi8KKwogLyoKICAqIEV4dHJh
Y3QgdGhlIENTQyBjb2VmZmljaWVudCBmcm9tIGEgQ1RNIGNvZWZmaWNpZW50IChpbiBVMzIuMzIg
Zml4ZWQgcG9pbnQKICAqIGZvcm1hdCkuIFRoaXMgbWFjcm8gdGFrZXMgdGhlIGNvZWZmaWNpZW50
IHdlIHdhbnQgdHJhbnNmb3JtZWQgYW5kIHRoZQpAQCAtNTksMzcgKzc0LDM4IEBACiAKICNkZWZp
bmUgSUxLX0NTQ19QT1NUT0ZGX0xJTUlURURfUkFOR0UgKDE2ICogKDEgPDwgMTIpIC8gMjU1KQog
CisvKiBOb3AgcHJlL3Bvc3Qgb2Zmc2V0cyAqLwogc3RhdGljIGNvbnN0IHUxNiBpbGtfY3NjX29m
Zl96ZXJvWzNdID0ge307CiAKKy8qIElkZW50aXR5IG1hdHJpeCAqLwogc3RhdGljIGNvbnN0IHUx
NiBpbGtfY3NjX2NvZWZmX2lkZW50aXR5WzldID0gewogCUlMS19DU0NfQ09FRkZfMV8wLCAwLCAw
LAogCTAsIElMS19DU0NfQ09FRkZfMV8wLCAwLAogCTAsIDAsIElMS19DU0NfQ09FRkZfMV8wLAog
fTsKIAorLyogTGltaXRlZCByYW5nZSBSR0IgcG9zdCBvZmZzZXRzICovCiBzdGF0aWMgY29uc3Qg
dTE2IGlsa19jc2NfcG9zdG9mZl9saW1pdGVkX3JhbmdlWzNdID0gewogCUlMS19DU0NfUE9TVE9G
Rl9MSU1JVEVEX1JBTkdFLAogCUlMS19DU0NfUE9TVE9GRl9MSU1JVEVEX1JBTkdFLAogCUlMS19D
U0NfUE9TVE9GRl9MSU1JVEVEX1JBTkdFLAogfTsKIAorLyogRnVsbCByYW5nZSBSR0IgLT4gbGlt
aXRlZCByYW5nZSBSR0IgbWF0cml4ICovCiBzdGF0aWMgY29uc3QgdTE2IGlsa19jc2NfY29lZmZf
bGltaXRlZF9yYW5nZVs5XSA9IHsKIAlJTEtfQ1NDX0NPRUZGX0xJTUlURURfUkFOR0UsIDAsIDAs
CiAJMCwgSUxLX0NTQ19DT0VGRl9MSU1JVEVEX1JBTkdFLCAwLAogCTAsIDAsIElMS19DU0NfQ09F
RkZfTElNSVRFRF9SQU5HRSwKIH07CiAKLS8qCi0gKiBUaGVzZSB2YWx1ZXMgYXJlIGRpcmVjdCBy
ZWdpc3RlciB2YWx1ZXMgc3BlY2lmaWVkIGluIHRoZSBCc3BlYywKLSAqIGZvciBSR0ItPllVViBj
b252ZXJzaW9uIG1hdHJpeCAoY29sb3JzcGFjZSBCVDcwOSkKLSAqLworLyogQlQuNzA5IGZ1bGwg
cmFuZ2UgUkdCIC0+IGxpbWl0ZWQgcmFuZ2UgWUNiQ3IgbWF0cml4ICovCiBzdGF0aWMgY29uc3Qg
dTE2IGlsa19jc2NfY29lZmZfcmdiX3RvX3ljYmNyWzldID0gewogCTB4MWUwOCwgMHg5Y2MwLCAw
eGI1MjgsCiAJMHgyYmE4LCAweDA5ZDgsIDB4MzdlOCwKIAkweGJjZTgsIDB4OWFkOCwgMHgxZTA4
LAogfTsKIAotLyogUG9zdCBvZmZzZXQgdmFsdWVzIGZvciBSR0ItPllDQkNSIGNvbnZlcnNpb24g
Ki8KKy8qIExpbWl0ZWQgcmFuZ2UgWUNiQ3IgcG9zdCBvZmZzZXRzICovCiBzdGF0aWMgY29uc3Qg
dTE2IGlsa19jc2NfcG9zdG9mZl9yZ2JfdG9feWNiY3JbM10gPSB7CiAJMHgwODAwLCAweDAxMDAs
IDB4MDgwMCwKIH07Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
