Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D8965482
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 12:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA8E6E183;
	Thu, 11 Jul 2019 10:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E566E183;
 Thu, 11 Jul 2019 10:32:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jul 2019 03:32:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,478,1557212400"; d="scan'208";a="156783884"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 11 Jul 2019 03:32:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 11 Jul 2019 13:32:49 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/5] drm/edid: Throw away the dummy VIC 0 cea mode
Date: Thu, 11 Jul 2019 13:32:33 +0300
Message-Id: <20190711103234.6294-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190711103234.6294-1-ville.syrjala@linux.intel.com>
References: <20190711103234.6294-1-ville.syrjala@linux.intel.com>
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 Hans Verkuil <hansverk@cisco.com>, intel-gfx@lists.freedesktop.org
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
Z3B1L2RybS9kcm1fZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKaW5kZXggMGUx
MDNjOTllNDcxLi5lNmIxZTc4NWQxNTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
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
