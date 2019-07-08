Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F99C62607
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 18:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0056889FC9;
	Mon,  8 Jul 2019 16:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC4089F73;
 Mon,  8 Jul 2019 16:21:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2019 09:21:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,466,1557212400"; d="scan'208";a="248865601"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 08 Jul 2019 09:20:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Jul 2019 19:20:57 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 03/14] drm/sti: Remove pointless casts
Date: Mon,  8 Jul 2019 19:20:37 +0300
Message-Id: <20190708162048.4286-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190708162048.4286-1-ville.syrjala@linux.intel.com>
References: <20190708162048.4286-1-ville.syrjala@linux.intel.com>
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
Cc: Vincent Abriou <vincent.abriou@st.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZXJlJ3Mgbm8gcG9pbnQgaW4gdGhlIGNhc3QgZm9yIGFjY2Vzc2luZyB0aGUgYmFzZSBjbGFzcy4g
SnVzdAp0YWtlIHRoZSBhZGRyZXNzIG9mIHRoZSBzdHJ1Y3QgaW5zdGVhZC4KCkNjOiBCZW5qYW1p
biBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAbGluYXJvLm9yZz4KQ2M6IFZpbmNlbnQgQWJy
aW91IDx2aW5jZW50LmFicmlvdUBzdC5jb20+CkFja2VkLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8
YmVuamFtaW4uZ2FpZ25hcmRAbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
c3RpL3N0aV90dm91dC5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlf
dHZvdXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX3R2b3V0LmMKaW5kZXggZTFiM2M4Y2I3
Mjg3Li40MmY0YzI2NGE3ODMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX3R2
b3V0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfdHZvdXQuYwpAQCAtNjY5LDcgKzY2
OSw3IEBAIHN0aV90dm91dF9jcmVhdGVfZHZvX2VuY29kZXIoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwKIAogCWVuY29kZXItPnR2b3V0ID0gdHZvdXQ7CiAKLQlkcm1fZW5jb2RlciA9IChzdHJ1Y3Qg
ZHJtX2VuY29kZXIgKillbmNvZGVyOworCWRybV9lbmNvZGVyID0gJmVuY29kZXItPmVuY29kZXI7
CiAKIAlkcm1fZW5jb2Rlci0+cG9zc2libGVfY3J0Y3MgPSBFTkNPREVSX0NSVENfTUFTSzsKIAlk
cm1fZW5jb2Rlci0+cG9zc2libGVfY2xvbmVzID0gMSA8PCAwOwpAQCAtNzIyLDcgKzcyMiw3IEBA
IHN0YXRpYyBzdHJ1Y3QgZHJtX2VuY29kZXIgKnN0aV90dm91dF9jcmVhdGVfaGRhX2VuY29kZXIo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAogCWVuY29kZXItPnR2b3V0ID0gdHZvdXQ7CiAKLQlk
cm1fZW5jb2RlciA9IChzdHJ1Y3QgZHJtX2VuY29kZXIgKikgZW5jb2RlcjsKKwlkcm1fZW5jb2Rl
ciA9ICZlbmNvZGVyLT5lbmNvZGVyOwogCiAJZHJtX2VuY29kZXItPnBvc3NpYmxlX2NydGNzID0g
RU5DT0RFUl9DUlRDX01BU0s7CiAJZHJtX2VuY29kZXItPnBvc3NpYmxlX2Nsb25lcyA9IDEgPDwg
MDsKQEAgLTc3MSw3ICs3NzEsNyBAQCBzdGF0aWMgc3RydWN0IGRybV9lbmNvZGVyICpzdGlfdHZv
dXRfY3JlYXRlX2hkbWlfZW5jb2RlcihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCiAJZW5jb2Rl
ci0+dHZvdXQgPSB0dm91dDsKIAotCWRybV9lbmNvZGVyID0gKHN0cnVjdCBkcm1fZW5jb2RlciAq
KSBlbmNvZGVyOworCWRybV9lbmNvZGVyID0gJmVuY29kZXItPmVuY29kZXI7CiAKIAlkcm1fZW5j
b2Rlci0+cG9zc2libGVfY3J0Y3MgPSBFTkNPREVSX0NSVENfTUFTSzsKIAlkcm1fZW5jb2Rlci0+
cG9zc2libGVfY2xvbmVzID0gMSA8PCAxOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
