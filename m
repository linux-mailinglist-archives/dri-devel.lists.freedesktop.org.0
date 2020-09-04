Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 775C125D80F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 13:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A70B6EB6C;
	Fri,  4 Sep 2020 11:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E116EB6C;
 Fri,  4 Sep 2020 11:54:46 +0000 (UTC)
IronPort-SDR: 4DlOWxiya9r/PLsilpQDIZvxa6oR+JVajD3bBIFk3snaEoJOxteMvKenQO2Tq47C4kFNtIb4cX
 OdWFIgGNRg0A==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="221938833"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="221938833"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 04:54:45 -0700
IronPort-SDR: Y2DSNYXz9HW+iYKE9TSXBMCAVYZLqIruibrr8hB55+UJcKFhJBq6kanT7zI7bC0y7HF0Gm3dHG
 d8XsrGPsjDzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="376223969"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 04 Sep 2020 04:54:43 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Sep 2020 14:54:43 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 15/18] drm/i915: Extract intel_hdmi_has_audio()
Date: Fri,  4 Sep 2020 14:53:51 +0300
Message-Id: <20200904115354.25336-16-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
References: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClB1
bGwgdGhlICJkbyB3ZSB3YW50IHRvIGVuYWJsZSBhdWRpbz8iIGNvbXB1dGF0aW9uIGludG8gYSBz
bWFsbCBoZWxwZXIKdG8gbWFrZSBpbnRlbF9oZG1pX2NvbXB1dGVfY29uZmlnKCkgbGVzcyBtZXNz
eS4gV2lsbCBtYWtlIGl0IGVhc2llciB0bwphZGQgbW9yZSBjaGVja3MgZm9yIHRoaXMgbGF0ZXIg
KGVnLiB3ZSBzaG91bGQgYWN0dWFsbHkgYmUgY2hlY2tpbmcKYXQgdGhlIGhibGFuayBpcyBsb25n
IGVub3VnaCBmb3IgYXVkaW8gdHJhbnNtaXNzaW9uKS4KClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5
cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMgfCAyOCArKysrKysrKysrKysrKystLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYwppbmRleCAwOTc4YjBkOGY0YzYu
LjliZjY2NGJmZDdkZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1p
LmMKQEAgLTI0NjUsNiArMjQ2NSwyMyBAQCBib29sIGludGVsX2hkbWlfbGltaXRlZF9jb2xvcl9y
YW5nZShjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwKIAl9CiB9CiAK
K3N0YXRpYyBib29sIGludGVsX2hkbWlfaGFzX2F1ZGlvKHN0cnVjdCBpbnRlbF9lbmNvZGVyICpl
bmNvZGVyLAorCQkJCSBjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwK
KwkJCQkgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3RhdGUpCit7CisJ
c3RydWN0IGludGVsX2hkbWkgKmludGVsX2hkbWkgPSBlbmNfdG9faW50ZWxfaGRtaShlbmNvZGVy
KTsKKwljb25zdCBzdHJ1Y3QgaW50ZWxfZGlnaXRhbF9jb25uZWN0b3Jfc3RhdGUgKmludGVsX2Nv
bm5fc3RhdGUgPQorCQl0b19pbnRlbF9kaWdpdGFsX2Nvbm5lY3Rvcl9zdGF0ZShjb25uX3N0YXRl
KTsKKworCWlmICghY3J0Y19zdGF0ZS0+aGFzX2hkbWlfc2luaykKKwkJcmV0dXJuIGZhbHNlOwor
CisJaWYgKGludGVsX2Nvbm5fc3RhdGUtPmZvcmNlX2F1ZGlvID09IEhETUlfQVVESU9fQVVUTykK
KwkJcmV0dXJuIGludGVsX2hkbWktPmhhc19hdWRpbzsKKwllbHNlCisJCXJldHVybiBpbnRlbF9j
b25uX3N0YXRlLT5mb3JjZV9hdWRpbyA9PSBIRE1JX0FVRElPX09OOworfQorCiBpbnQgaW50ZWxf
aGRtaV9jb21wdXRlX2NvbmZpZyhzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2RlciwKIAkJCSAg
ICAgIHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpwaXBlX2NvbmZpZywKIAkJCSAgICAgIHN0cnVj
dCBkcm1fY29ubmVjdG9yX3N0YXRlICpjb25uX3N0YXRlKQpAQCAtMjQ3NCw4ICsyNDkxLDYgQEAg
aW50IGludGVsX2hkbWlfY29tcHV0ZV9jb25maWcoc3RydWN0IGludGVsX2VuY29kZXIgKmVuY29k
ZXIsCiAJc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKmFkanVzdGVkX21vZGUgPSAmcGlwZV9jb25m
aWctPmh3LmFkanVzdGVkX21vZGU7CiAJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciA9
IGNvbm5fc3RhdGUtPmNvbm5lY3RvcjsKIAlzdHJ1Y3QgZHJtX3NjZGMgKnNjZGMgPSAmY29ubmVj
dG9yLT5kaXNwbGF5X2luZm8uaGRtaS5zY2RjOwotCXN0cnVjdCBpbnRlbF9kaWdpdGFsX2Nvbm5l
Y3Rvcl9zdGF0ZSAqaW50ZWxfY29ubl9zdGF0ZSA9Ci0JCXRvX2ludGVsX2RpZ2l0YWxfY29ubmVj
dG9yX3N0YXRlKGNvbm5fc3RhdGUpOwogCWludCByZXQ7CiAKIAlpZiAoYWRqdXN0ZWRfbW9kZS0+
ZmxhZ3MgJiBEUk1fTU9ERV9GTEFHX0RCTFNDQU4pCkBAIC0yNTAxLDEzICsyNTE2LDggQEAgaW50
IGludGVsX2hkbWlfY29tcHV0ZV9jb25maWcoc3RydWN0IGludGVsX2VuY29kZXIgKmVuY29kZXIs
CiAJaWYgKEhBU19QQ0hfU1BMSVQoZGV2X3ByaXYpICYmICFIQVNfRERJKGRldl9wcml2KSkKIAkJ
cGlwZV9jb25maWctPmhhc19wY2hfZW5jb2RlciA9IHRydWU7CiAKLQlpZiAocGlwZV9jb25maWct
Pmhhc19oZG1pX3NpbmspIHsKLQkJaWYgKGludGVsX2Nvbm5fc3RhdGUtPmZvcmNlX2F1ZGlvID09
IEhETUlfQVVESU9fQVVUTykKLQkJCXBpcGVfY29uZmlnLT5oYXNfYXVkaW8gPSBpbnRlbF9oZG1p
LT5oYXNfYXVkaW87Ci0JCWVsc2UKLQkJCXBpcGVfY29uZmlnLT5oYXNfYXVkaW8gPQotCQkJCWlu
dGVsX2Nvbm5fc3RhdGUtPmZvcmNlX2F1ZGlvID09IEhETUlfQVVESU9fT047Ci0JfQorCXBpcGVf
Y29uZmlnLT5oYXNfYXVkaW8gPQorCQlpbnRlbF9oZG1pX2hhc19hdWRpbyhlbmNvZGVyLCBwaXBl
X2NvbmZpZywgY29ubl9zdGF0ZSk7CiAKIAlyZXQgPSBpbnRlbF9oZG1pX2NvbXB1dGVfY2xvY2so
ZW5jb2RlciwgcGlwZV9jb25maWcpOwogCWlmIChyZXQpCi0tIAoyLjI2LjIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
