Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC82D2A88
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 15:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFC36EB2C;
	Thu, 10 Oct 2019 13:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512AC6EB2B;
 Thu, 10 Oct 2019 13:12:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Oct 2019 06:12:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,280,1566889200"; d="scan'208";a="207188648"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 10 Oct 2019 06:12:03 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Oct 2019 16:12:02 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/amdgpu/powerplay: Use swap() where appropriate
Date: Thu, 10 Oct 2019 16:11:58 +0300
Message-Id: <20191010131159.17346-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191010131159.17346-1-ville.syrjala@linux.intel.com>
References: <20191010131159.17346-1-ville.syrjala@linux.intel.com>
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
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>, Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkBz
d2FwQAppZGVudGlmaWVyIFRFTVA7CmV4cHJlc3Npb24gQSxCOwpAQAotIFRFTVAgPSBBOwotIEEg
PSBCOwotIEIgPSBURU1QOworIHN3YXAoQSwgQik7CgpAQAp0eXBlIFQ7CmlkZW50aWZpZXIgc3dh
cC5URU1QOwpAQAooCi0gVCBURU1QOwp8Ci0gVCBURU1QID0gey4uLn07CikKLi4uIHdoZW4gIT0g
VEVNUAoKQ2M6IFJleCBaaHUgPHJleC56aHVAYW1kLmNvbT4KQ2M6IEV2YW4gUXVhbiA8ZXZhbi5x
dWFuQGFtZC5jb20+CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6ICJE
YXZpZCAoQ2h1bk1pbmcpIFpob3UiIDxEYXZpZDEuWmhvdUBhbWQuY29tPgpDYzogYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9od21nci9zbXU3X2h3bWdyLmMgICB8IDYgKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYyB8IDYgKystLS0tCiAyIGZpbGVzIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXU3X2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9od21nci9zbXU3X2h3bWdyLmMKaW5kZXggMzRmOTVlMGUzZWE0Li4x
ZmU5OTI4MzVhNzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3
bWdyL3NtdTdfaHdtZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21n
ci9zbXU3X2h3bWdyLmMKQEAgLTE5OTQsNyArMTk5NCw2IEBAIHN0YXRpYyBpbnQgc211N19zb3J0
X2xvb2t1cF90YWJsZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAogCQlzdHJ1Y3QgcGhtX3BwdF92
MV92b2x0YWdlX2xvb2t1cF90YWJsZSAqbG9va3VwX3RhYmxlKQogewogCXVpbnQzMl90IHRhYmxl
X3NpemUsIGksIGo7Ci0Jc3RydWN0IHBobV9wcHRfdjFfdm9sdGFnZV9sb29rdXBfcmVjb3JkIHRt
cF92b2x0YWdlX2xvb2t1cF9yZWNvcmQ7CiAJdGFibGVfc2l6ZSA9IGxvb2t1cF90YWJsZS0+Y291
bnQ7CiAKIAlQUF9BU1NFUlRfV0lUSF9DT0RFKDAgIT0gbG9va3VwX3RhYmxlLT5jb3VudCwKQEAg
LTIwMDUsOSArMjAwNCw4IEBAIHN0YXRpYyBpbnQgc211N19zb3J0X2xvb2t1cF90YWJsZShzdHJ1
Y3QgcHBfaHdtZ3IgKmh3bWdyLAogCQlmb3IgKGogPSBpICsgMTsgaiA+IDA7IGotLSkgewogCQkJ
aWYgKGxvb2t1cF90YWJsZS0+ZW50cmllc1tqXS51c192ZGQgPAogCQkJCQlsb29rdXBfdGFibGUt
PmVudHJpZXNbaiAtIDFdLnVzX3ZkZCkgewotCQkJCXRtcF92b2x0YWdlX2xvb2t1cF9yZWNvcmQg
PSBsb29rdXBfdGFibGUtPmVudHJpZXNbaiAtIDFdOwotCQkJCWxvb2t1cF90YWJsZS0+ZW50cmll
c1tqIC0gMV0gPSBsb29rdXBfdGFibGUtPmVudHJpZXNbal07Ci0JCQkJbG9va3VwX3RhYmxlLT5l
bnRyaWVzW2pdID0gdG1wX3ZvbHRhZ2VfbG9va3VwX3JlY29yZDsKKwkJCQlzd2FwKGxvb2t1cF90
YWJsZS0+ZW50cmllc1tqIC0gMV0sCisJCQkJICAgICBsb29rdXBfdGFibGUtPmVudHJpZXNbal0p
OwogCQkJfQogCQl9CiAJfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9o
d21nci92ZWdhMTBfaHdtZ3IuYwppbmRleCBkMDg0OTNiNjdiNjcuLmY1ZGNiYTQ0Zjc0YSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdy
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdy
LmMKQEAgLTcxMiw3ICs3MTIsNiBAQCBzdGF0aWMgaW50IHZlZ2ExMF9zb3J0X2xvb2t1cF90YWJs
ZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAogCQlzdHJ1Y3QgcGhtX3BwdF92MV92b2x0YWdlX2xv
b2t1cF90YWJsZSAqbG9va3VwX3RhYmxlKQogewogCXVpbnQzMl90IHRhYmxlX3NpemUsIGksIGo7
Ci0Jc3RydWN0IHBobV9wcHRfdjFfdm9sdGFnZV9sb29rdXBfcmVjb3JkIHRtcF92b2x0YWdlX2xv
b2t1cF9yZWNvcmQ7CiAKIAlQUF9BU1NFUlRfV0lUSF9DT0RFKGxvb2t1cF90YWJsZSAmJiBsb29r
dXBfdGFibGUtPmNvdW50LAogCQkiTG9va3VwIHRhYmxlIGlzIGVtcHR5IiwgcmV0dXJuIC1FSU5W
QUwpOwpAQCAtNzI0LDkgKzcyMyw4IEBAIHN0YXRpYyBpbnQgdmVnYTEwX3NvcnRfbG9va3VwX3Rh
YmxlKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsCiAJCWZvciAoaiA9IGkgKyAxOyBqID4gMDsgai0t
KSB7CiAJCQlpZiAobG9va3VwX3RhYmxlLT5lbnRyaWVzW2pdLnVzX3ZkZCA8CiAJCQkJCWxvb2t1
cF90YWJsZS0+ZW50cmllc1tqIC0gMV0udXNfdmRkKSB7Ci0JCQkJdG1wX3ZvbHRhZ2VfbG9va3Vw
X3JlY29yZCA9IGxvb2t1cF90YWJsZS0+ZW50cmllc1tqIC0gMV07Ci0JCQkJbG9va3VwX3RhYmxl
LT5lbnRyaWVzW2ogLSAxXSA9IGxvb2t1cF90YWJsZS0+ZW50cmllc1tqXTsKLQkJCQlsb29rdXBf
dGFibGUtPmVudHJpZXNbal0gPSB0bXBfdm9sdGFnZV9sb29rdXBfcmVjb3JkOworCQkJCXN3YXAo
bG9va3VwX3RhYmxlLT5lbnRyaWVzW2ogLSAxXSwKKwkJCQkgICAgIGxvb2t1cF90YWJsZS0+ZW50
cmllc1tqXSk7CiAJCQl9CiAJCX0KIAl9Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
