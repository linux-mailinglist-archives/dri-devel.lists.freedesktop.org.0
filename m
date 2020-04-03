Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC6F19DF9F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 22:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF1D6EC91;
	Fri,  3 Apr 2020 20:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65E96EC8F;
 Fri,  3 Apr 2020 20:40:48 +0000 (UTC)
IronPort-SDR: yamPaI6H/zH3u+dWv47eNZyvf6ZMu5OEwpCVYgcEEWRxrJyteBuqgbsikMzPXHla0HnGYtX79O
 9ObF2mofafAA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 13:40:48 -0700
IronPort-SDR: afN9SuYJjl56aiiu/n8KaDqQwZ1bTtscDdTLQKGlFsM67d0DoMcTlm1klQi7hvisIcXg9AgEca
 s4WjOkpfpxXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,341,1580803200"; d="scan'208";a="253480468"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 03 Apr 2020 13:40:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 03 Apr 2020 23:40:45 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 08/17] drm: Shrink drm_display_mode timings
Date: Fri,  3 Apr 2020 23:39:59 +0300
Message-Id: <20200403204008.14864-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
References: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
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
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClN0
b3JlIHRoZSB0aW1pbmdzIChhcGFydCBmcm9tIHRoZSBjbG9jaykgYXMgdTE2LiBUaGUgdWFwaSBt
b2RlCnN0cnVjdCBhbHJlYWR5IHVzZXMgdTE2IGZvciBldmVyeXRoaW5nIHNvIHVzaW5nIHNvbWV0
aGluZyBiaWdnZXIKaW50ZXJuYWxseSBkb2Vzbid0IHJlYWxseSBoZWxwIHVzLgoKUmV2aWV3ZWQt
Ynk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+ClJldmlld2VkLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBW
aWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9kcm1fbW9kZXMuYyB8ICA3IC0tLS0tLQogaW5jbHVkZS9kcm0vZHJtX21vZGVz
LmggICAgIHwgNDYgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxl
cyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVz
LmMKaW5kZXggZTNkNWYwMTFmN2JkLi43N2Q2ODEyMDkzMWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fbW9kZXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKQEAg
LTE5MDEsMTMgKzE5MDEsNiBAQCBFWFBPUlRfU1lNQk9MKGRybV9tb2RlX2NyZWF0ZV9mcm9tX2Nt
ZGxpbmVfbW9kZSk7CiB2b2lkIGRybV9tb2RlX2NvbnZlcnRfdG9fdW1vZGUoc3RydWN0IGRybV9t
b2RlX21vZGVpbmZvICpvdXQsCiAJCQkgICAgICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21v
ZGUgKmluKQogewotCVdBUk4oaW4tPmhkaXNwbGF5ID4gVVNIUlRfTUFYIHx8IGluLT5oc3luY19z
dGFydCA+IFVTSFJUX01BWCB8fAotCSAgICAgaW4tPmhzeW5jX2VuZCA+IFVTSFJUX01BWCB8fCBp
bi0+aHRvdGFsID4gVVNIUlRfTUFYIHx8Ci0JICAgICBpbi0+aHNrZXcgPiBVU0hSVF9NQVggfHwg
aW4tPnZkaXNwbGF5ID4gVVNIUlRfTUFYIHx8Ci0JICAgICBpbi0+dnN5bmNfc3RhcnQgPiBVU0hS
VF9NQVggfHwgaW4tPnZzeW5jX2VuZCA+IFVTSFJUX01BWCB8fAotCSAgICAgaW4tPnZ0b3RhbCA+
IFVTSFJUX01BWCB8fCBpbi0+dnNjYW4gPiBVU0hSVF9NQVgsCi0JICAgICAidGltaW5nIHZhbHVl
cyB0b28gbGFyZ2UgZm9yIG1vZGUgaW5mb1xuIik7Ci0KIAlvdXQtPmNsb2NrID0gaW4tPmNsb2Nr
OwogCW91dC0+aGRpc3BsYXkgPSBpbi0+aGRpc3BsYXk7CiAJb3V0LT5oc3luY19zdGFydCA9IGlu
LT5oc3luY19zdGFydDsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9tb2Rlcy5oIGIvaW5j
bHVkZS9kcm0vZHJtX21vZGVzLmgKaW5kZXggZGE3ZGI3NGEyMTVlLi45MTc1MjdlYjgwNjcgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9tb2Rlcy5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9t
b2Rlcy5oCkBAIC0yNzgsMTYgKzI3OCwxNiBAQCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSB7CiAJ
ICogUGl4ZWwgY2xvY2sgaW4ga0h6LgogCSAqLwogCWludCBjbG9jazsJCS8qIGluIGtIeiAqLwot
CWludCBoZGlzcGxheTsKLQlpbnQgaHN5bmNfc3RhcnQ7Ci0JaW50IGhzeW5jX2VuZDsKLQlpbnQg
aHRvdGFsOwotCWludCBoc2tldzsKLQlpbnQgdmRpc3BsYXk7Ci0JaW50IHZzeW5jX3N0YXJ0Owot
CWludCB2c3luY19lbmQ7Ci0JaW50IHZ0b3RhbDsKLQlpbnQgdnNjYW47CisJdTE2IGhkaXNwbGF5
OworCXUxNiBoc3luY19zdGFydDsKKwl1MTYgaHN5bmNfZW5kOworCXUxNiBodG90YWw7CisJdTE2
IGhza2V3OworCXUxNiB2ZGlzcGxheTsKKwl1MTYgdnN5bmNfc3RhcnQ7CisJdTE2IHZzeW5jX2Vu
ZDsKKwl1MTYgdnRvdGFsOworCXUxNiB2c2NhbjsKIAkvKioKIAkgKiBAZmxhZ3M6CiAJICoKQEAg
LTM1NiwxOSArMzU2LDE5IEBAIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIHsKIAkgKiBkaWZmZXJl
bmNlIGlzIGV4YWN0bHkgYSBmYWN0b3Igb2YgMTAuCiAJICovCiAJaW50IGNydGNfY2xvY2s7Ci0J
aW50IGNydGNfaGRpc3BsYXk7Ci0JaW50IGNydGNfaGJsYW5rX3N0YXJ0OwotCWludCBjcnRjX2hi
bGFua19lbmQ7Ci0JaW50IGNydGNfaHN5bmNfc3RhcnQ7Ci0JaW50IGNydGNfaHN5bmNfZW5kOwot
CWludCBjcnRjX2h0b3RhbDsKLQlpbnQgY3J0Y19oc2tldzsKLQlpbnQgY3J0Y192ZGlzcGxheTsK
LQlpbnQgY3J0Y192Ymxhbmtfc3RhcnQ7Ci0JaW50IGNydGNfdmJsYW5rX2VuZDsKLQlpbnQgY3J0
Y192c3luY19zdGFydDsKLQlpbnQgY3J0Y192c3luY19lbmQ7Ci0JaW50IGNydGNfdnRvdGFsOwor
CXUxNiBjcnRjX2hkaXNwbGF5OworCXUxNiBjcnRjX2hibGFua19zdGFydDsKKwl1MTYgY3J0Y19o
YmxhbmtfZW5kOworCXUxNiBjcnRjX2hzeW5jX3N0YXJ0OworCXUxNiBjcnRjX2hzeW5jX2VuZDsK
Kwl1MTYgY3J0Y19odG90YWw7CisJdTE2IGNydGNfaHNrZXc7CisJdTE2IGNydGNfdmRpc3BsYXk7
CisJdTE2IGNydGNfdmJsYW5rX3N0YXJ0OworCXUxNiBjcnRjX3ZibGFua19lbmQ7CisJdTE2IGNy
dGNfdnN5bmNfc3RhcnQ7CisJdTE2IGNydGNfdnN5bmNfZW5kOworCXUxNiBjcnRjX3Z0b3RhbDsK
IAogCS8qKgogCSAqIEBwcml2YXRlX2ZsYWdzOgotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
