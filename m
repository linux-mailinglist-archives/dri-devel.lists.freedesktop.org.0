Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F54B7C02
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 16:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BB86F957;
	Thu, 19 Sep 2019 14:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1516F975;
 Thu, 19 Sep 2019 14:19:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Sep 2019 07:19:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,523,1559545200"; d="scan'208";a="217314140"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 19 Sep 2019 07:19:13 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 19 Sep 2019 17:19:12 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/atomic-helper: Improve
 drm_atomic_helper_check_plane_state() debugs
Date: Thu, 19 Sep 2019 17:19:04 +0300
Message-Id: <20190919141904.15840-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190919141904.15840-1-ville.syrjala@linux.intel.com>
References: <20190919141904.15840-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkR1
bXAgb3V0IHRoZSBwbGFuZS9jcnRjIGlkL25hbWUgaW4gdGhlIGZhaWx1cmUgZGVidWcgbWVzc2Fn
ZXMuCk1ha2VzIGEgYml0IGVhc2llciB0byBmaWd1cmUgb3V0IHdoaWNoIHBsYW5lIGV4YWN0bHkg
aGFzIGZhaWxlZAp3aGVuIHlvdSBoYXZlIHRvbnMgb2YgdGhlbS4KCkNjOiBTZWFuIFBhdWwgPHNl
YW5AcG9vcmx5LnJ1bj4KU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxw
ZXIuYyB8IDkgKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBl
ci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMKaW5kZXggOWRlMzlkYTU0
YzQ4Li44NmEyODM5ZGJmZGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWlj
X2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jCkBAIC03
NjEsNiArNzYxLDcgQEAgaW50IGRybV9hdG9taWNfaGVscGVyX2NoZWNrX3BsYW5lX3N0YXRlKHN0
cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlLAogCQkJCQlib29sIGNhbl91cGRhdGVf
ZGlzYWJsZWQpCiB7CiAJc3RydWN0IGRybV9wbGFuZSAqcGxhbmUgPSBwbGFuZV9zdGF0ZS0+cGxh
bmU7CisJc3RydWN0IGRybV9jcnRjICpjcnRjID0gY3J0Y19zdGF0ZS0+Y3J0YzsKIAlzdHJ1Y3Qg
ZHJtX2ZyYW1lYnVmZmVyICpmYiA9IHBsYW5lX3N0YXRlLT5mYjsKIAlzdHJ1Y3QgZHJtX3JlY3Qg
KnNyYyA9ICZwbGFuZV9zdGF0ZS0+c3JjOwogCXN0cnVjdCBkcm1fcmVjdCAqZHN0ID0gJnBsYW5l
X3N0YXRlLT5kc3Q7CkBAIC03ODUsNyArNzg2LDkgQEAgaW50IGRybV9hdG9taWNfaGVscGVyX2No
ZWNrX3BsYW5lX3N0YXRlKHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlLAogCX0K
IAogCWlmICghY3J0Y19zdGF0ZS0+ZW5hYmxlICYmICFjYW5fdXBkYXRlX2Rpc2FibGVkKSB7Ci0J
CURSTV9ERUJVR19LTVMoIkNhbm5vdCB1cGRhdGUgcGxhbmUgb2YgYSBkaXNhYmxlZCBDUlRDLlxu
Iik7CisJCURSTV9ERUJVR19LTVMoIkNhbm5vdCB1cGRhdGUgW1BMQU5FOiVkOiVzXSBvZiBkaXNh
YmxlZCBbQ1JUQzolZDolc10uXG4iLAorCQkJICAgICAgcGxhbmUtPmJhc2UuaWQsIHBsYW5lLT5u
YW1lLAorCQkJICAgICAgY3J0Yy0+YmFzZS5pZCwgY3J0Yy0+bmFtZSk7CiAJCXJldHVybiAtRUlO
VkFMOwogCX0KIApAQCAtODMxLDcgKzgzNCw5IEBAIGludCBkcm1fYXRvbWljX2hlbHBlcl9jaGVj
a19wbGFuZV9zdGF0ZShzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZSwKIAkJcmV0
dXJuIDA7CiAKIAlpZiAoIWNhbl9wb3NpdGlvbiAmJiAhZHJtX3JlY3RfZXF1YWxzKGRzdCwgJmNs
aXApKSB7Ci0JCURSTV9ERUJVR19LTVMoIlBsYW5lIG11c3QgY292ZXIgZW50aXJlIENSVENcbiIp
OworCQlEUk1fREVCVUdfS01TKCJbUExBTkU6JWQ6JXNdIG11c3QgY292ZXIgZW50aXJlIFtDUlRD
OiVkOiVzXVxuIiwKKwkJCSAgICAgIHBsYW5lLT5iYXNlLmlkLCBwbGFuZS0+bmFtZSwKKwkJCSAg
ICAgIGNydGMtPmJhc2UuaWQsIGNydGMtPm5hbWUpOwogCQlkcm1fcmVjdF9kZWJ1Z19wcmludCgi
ZHN0OiAiLCBkc3QsIGZhbHNlKTsKIAkJZHJtX3JlY3RfZGVidWdfcHJpbnQoImNsaXA6ICIsICZj
bGlwLCBmYWxzZSk7CiAJCXJldHVybiAtRUlOVkFMOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
