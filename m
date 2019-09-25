Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF9ABDF7E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 15:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F69D6EBB7;
	Wed, 25 Sep 2019 13:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6596EBB7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 13:55:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 06:55:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,548,1559545200"; d="scan'208";a="183263901"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 25 Sep 2019 06:55:13 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 25 Sep 2019 16:55:12 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/4] drm/edid: Throw away the dummy VIC 0 cea mode
Date: Wed, 25 Sep 2019 16:55:01 +0300
Message-Id: <20190925135502.24055-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925135502.24055-1-ville.syrjala@linux.intel.com>
References: <20190925135502.24055-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfc@freedesktop.org, Hans Verkuil <hansverk@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCk5v
dyB0aGF0IHRoZSBjZWEgbW9kZSBoYW5kbGluZyBpcyBub3QgMTAwJSB0aWVkIHRvIHRoZSBzaW5n
bGUKYXJyYXkgdGhlIGR1bW15IFZJQyAwIG1vZGUgaXMgcHJldHR5IG11Y2ggcG9pbnRsZXMuIFRo
cm93IGl0Cm91dC4KCkNjOiBIYW5zIFZlcmt1aWwgPGhhbnN2ZXJrQGNpc2NvLmNvbT4KQ2M6IFNo
YXNoYW5rIFNoYXJtYSA8c2hhc2hhbmsuc2hhcm1hQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTog
VmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyB8IDE0ICsrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKaW5kZXggOWY2
OTk2MzIzZWZhLi4wMDA3MDA0ZDMyMjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZWRpZC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCkBAIC03MDksMTEgKzcwOSw5
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWluaW1vZGUgZXh0cmFfbW9kZXNbXSA9IHsKIC8qCiAg
KiBGcm9tIENFQS9DVEEtODYxIHNwZWMuCiAgKgotICogSW5kZXggd2l0aCBWSUMuCisgKiBJbmRl
eCB3aXRoIFZJQy0xLgogICovCi1zdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUg
ZWRpZF9jZWFfbW9kZXNfMFtdID0gewotCS8qIDAgLSBkdW1teSwgVklDcyBzdGFydCBhdCAxICov
Ci0JeyB9LAorc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIGVkaWRfY2VhX21v
ZGVzXzFbXSA9IHsKIAkvKiAxIC0gNjQweDQ4MEA2MEh6IDQ6MyAqLwogCXsgRFJNX01PREUoIjY0
MHg0ODAiLCBEUk1fTU9ERV9UWVBFX0RSSVZFUiwgMjUxNzUsIDY0MCwgNjU2LAogCQkgICA3NTIs
IDgwMCwgMCwgNDgwLCA0OTAsIDQ5MiwgNTI1LCAwLApAQCAtMzIxMSwxMCArMzIwOSw4IEBAIHN0
YXRpYyB1OCAqZHJtX2ZpbmRfY2VhX2V4dGVuc2lvbihjb25zdCBzdHJ1Y3QgZWRpZCAqZWRpZCkK
IAogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpjZWFfbW9kZV9mb3Jfdmlj
KHU4IHZpYykKIHsKLQlpZiAoIXZpYykKLQkJcmV0dXJuIE5VTEw7Ci0JaWYgKHZpYyA8IEFSUkFZ
X1NJWkUoZWRpZF9jZWFfbW9kZXNfMCkpCi0JCXJldHVybiAmZWRpZF9jZWFfbW9kZXNfMFt2aWNd
OworCWlmICh2aWMgPj0gMSAmJiB2aWMgPCAxICsgQVJSQVlfU0laRShlZGlkX2NlYV9tb2Rlc18x
KSkKKwkJcmV0dXJuICZlZGlkX2NlYV9tb2Rlc18xW3ZpYyAtIDFdOwogCWlmICh2aWMgPj0gMTkz
ICYmIHZpYyA8IDE5MyArIEFSUkFZX1NJWkUoZWRpZF9jZWFfbW9kZXNfMTkzKSkKIAkJcmV0dXJu
ICZlZGlkX2NlYV9tb2Rlc18xOTNbdmljIC0gMTkzXTsKIAlyZXR1cm4gTlVMTDsKQEAgLTMyMjcs
NyArMzIyMyw3IEBAIHN0YXRpYyB1OCBjZWFfbnVtX3ZpY3Modm9pZCkKIAogc3RhdGljIHU4IGNl
YV9uZXh0X3ZpYyh1OCB2aWMpCiB7Ci0JaWYgKCsrdmljID09IEFSUkFZX1NJWkUoZWRpZF9jZWFf
bW9kZXNfMCkpCisJaWYgKCsrdmljID09IDEgKyBBUlJBWV9TSVpFKGVkaWRfY2VhX21vZGVzXzEp
KQogCQl2aWMgPSAxOTM7CiAJcmV0dXJuIHZpYzsKIH0KLS0gCjIuMjEuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
