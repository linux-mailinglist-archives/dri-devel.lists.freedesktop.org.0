Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C40C1BC66A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 19:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B6E6E87F;
	Tue, 28 Apr 2020 17:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E7886E87E;
 Tue, 28 Apr 2020 17:20:19 +0000 (UTC)
IronPort-SDR: qQoaoSk+aLRd+0VXFA448dOxUn/d81ANlRPRQCo4gMvMZBrVxDSfhplKBP9lYF3xWNjlVXOR/D
 Rdutg/g3aOYQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2020 10:20:19 -0700
IronPort-SDR: gkNquIp2p2XKjQ3PJEGweFNEAuoCqNrJG6QAA7v6XhyLjs/AWKKZ2EYcL3JsCQlej2256tPAlw
 RLhvC4Ig/KAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,328,1583222400"; d="scan'208";a="249223577"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 28 Apr 2020 10:20:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 28 Apr 2020 20:20:15 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 08/16] drm: Shrink drm_display_mode timings
Date: Tue, 28 Apr 2020 20:19:32 +0300
Message-Id: <20200428171940.19552-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200428171940.19552-1-ville.syrjala@linux.intel.com>
References: <20200428171940.19552-1-ville.syrjala@linux.intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClN0
b3JlIHRoZSB0aW1pbmdzIChhcGFydCBmcm9tIHRoZSBjbG9jaykgYXMgdTE2LiBUaGUgdWFwaSBt
b2RlCnN0cnVjdCBhbHJlYWR5IHVzZXMgdTE2IGZvciBldmVyeXRoaW5nIHNvIHVzaW5nIHNvbWV0
aGluZyBiaWdnZXIKaW50ZXJuYWxseSBkb2Vzbid0IHJlYWxseSBoZWxwIHVzLgoKUmV2aWV3ZWQt
Ynk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KUmV2aWV3ZWQtYnk6IEVtaWwgVmVs
aWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+ClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rs
w6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9k
cm1fbW9kZXMuYyB8ICA3IC0tLS0tLQogaW5jbHVkZS9kcm0vZHJtX21vZGVzLmggICAgIHwgNDYg
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAy
MyBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX21vZGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKaW5kZXggZTNk
NWYwMTFmN2JkLi43N2Q2ODEyMDkzMWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
bW9kZXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKQEAgLTE5MDEsMTMgKzE5
MDEsNiBAQCBFWFBPUlRfU1lNQk9MKGRybV9tb2RlX2NyZWF0ZV9mcm9tX2NtZGxpbmVfbW9kZSk7
CiB2b2lkIGRybV9tb2RlX2NvbnZlcnRfdG9fdW1vZGUoc3RydWN0IGRybV9tb2RlX21vZGVpbmZv
ICpvdXQsCiAJCQkgICAgICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKmluKQogewot
CVdBUk4oaW4tPmhkaXNwbGF5ID4gVVNIUlRfTUFYIHx8IGluLT5oc3luY19zdGFydCA+IFVTSFJU
X01BWCB8fAotCSAgICAgaW4tPmhzeW5jX2VuZCA+IFVTSFJUX01BWCB8fCBpbi0+aHRvdGFsID4g
VVNIUlRfTUFYIHx8Ci0JICAgICBpbi0+aHNrZXcgPiBVU0hSVF9NQVggfHwgaW4tPnZkaXNwbGF5
ID4gVVNIUlRfTUFYIHx8Ci0JICAgICBpbi0+dnN5bmNfc3RhcnQgPiBVU0hSVF9NQVggfHwgaW4t
PnZzeW5jX2VuZCA+IFVTSFJUX01BWCB8fAotCSAgICAgaW4tPnZ0b3RhbCA+IFVTSFJUX01BWCB8
fCBpbi0+dnNjYW4gPiBVU0hSVF9NQVgsCi0JICAgICAidGltaW5nIHZhbHVlcyB0b28gbGFyZ2Ug
Zm9yIG1vZGUgaW5mb1xuIik7Ci0KIAlvdXQtPmNsb2NrID0gaW4tPmNsb2NrOwogCW91dC0+aGRp
c3BsYXkgPSBpbi0+aGRpc3BsYXk7CiAJb3V0LT5oc3luY19zdGFydCA9IGluLT5oc3luY19zdGFy
dDsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9tb2Rlcy5oIGIvaW5jbHVkZS9kcm0vZHJt
X21vZGVzLmgKaW5kZXggZGE3ZGI3NGEyMTVlLi45MTc1MjdlYjgwNjcgMTAwNjQ0Ci0tLSBhL2lu
Y2x1ZGUvZHJtL2RybV9tb2Rlcy5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9tb2Rlcy5oCkBAIC0y
NzgsMTYgKzI3OCwxNiBAQCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSB7CiAJICogUGl4ZWwgY2xv
Y2sgaW4ga0h6LgogCSAqLwogCWludCBjbG9jazsJCS8qIGluIGtIeiAqLwotCWludCBoZGlzcGxh
eTsKLQlpbnQgaHN5bmNfc3RhcnQ7Ci0JaW50IGhzeW5jX2VuZDsKLQlpbnQgaHRvdGFsOwotCWlu
dCBoc2tldzsKLQlpbnQgdmRpc3BsYXk7Ci0JaW50IHZzeW5jX3N0YXJ0OwotCWludCB2c3luY19l
bmQ7Ci0JaW50IHZ0b3RhbDsKLQlpbnQgdnNjYW47CisJdTE2IGhkaXNwbGF5OworCXUxNiBoc3lu
Y19zdGFydDsKKwl1MTYgaHN5bmNfZW5kOworCXUxNiBodG90YWw7CisJdTE2IGhza2V3OworCXUx
NiB2ZGlzcGxheTsKKwl1MTYgdnN5bmNfc3RhcnQ7CisJdTE2IHZzeW5jX2VuZDsKKwl1MTYgdnRv
dGFsOworCXUxNiB2c2NhbjsKIAkvKioKIAkgKiBAZmxhZ3M6CiAJICoKQEAgLTM1NiwxOSArMzU2
LDE5IEBAIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIHsKIAkgKiBkaWZmZXJlbmNlIGlzIGV4YWN0
bHkgYSBmYWN0b3Igb2YgMTAuCiAJICovCiAJaW50IGNydGNfY2xvY2s7Ci0JaW50IGNydGNfaGRp
c3BsYXk7Ci0JaW50IGNydGNfaGJsYW5rX3N0YXJ0OwotCWludCBjcnRjX2hibGFua19lbmQ7Ci0J
aW50IGNydGNfaHN5bmNfc3RhcnQ7Ci0JaW50IGNydGNfaHN5bmNfZW5kOwotCWludCBjcnRjX2h0
b3RhbDsKLQlpbnQgY3J0Y19oc2tldzsKLQlpbnQgY3J0Y192ZGlzcGxheTsKLQlpbnQgY3J0Y192
Ymxhbmtfc3RhcnQ7Ci0JaW50IGNydGNfdmJsYW5rX2VuZDsKLQlpbnQgY3J0Y192c3luY19zdGFy
dDsKLQlpbnQgY3J0Y192c3luY19lbmQ7Ci0JaW50IGNydGNfdnRvdGFsOworCXUxNiBjcnRjX2hk
aXNwbGF5OworCXUxNiBjcnRjX2hibGFua19zdGFydDsKKwl1MTYgY3J0Y19oYmxhbmtfZW5kOwor
CXUxNiBjcnRjX2hzeW5jX3N0YXJ0OworCXUxNiBjcnRjX2hzeW5jX2VuZDsKKwl1MTYgY3J0Y19o
dG90YWw7CisJdTE2IGNydGNfaHNrZXc7CisJdTE2IGNydGNfdmRpc3BsYXk7CisJdTE2IGNydGNf
dmJsYW5rX3N0YXJ0OworCXUxNiBjcnRjX3ZibGFua19lbmQ7CisJdTE2IGNydGNfdnN5bmNfc3Rh
cnQ7CisJdTE2IGNydGNfdnN5bmNfZW5kOworCXUxNiBjcnRjX3Z0b3RhbDsKIAogCS8qKgogCSAq
IEBwcml2YXRlX2ZsYWdzOgotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
