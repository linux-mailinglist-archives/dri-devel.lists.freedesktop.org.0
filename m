Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA3C165018
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 21:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FAF26ECB2;
	Wed, 19 Feb 2020 20:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0F86ECAF;
 Wed, 19 Feb 2020 20:36:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2020 12:36:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,461,1574150400"; d="scan'208";a="229234043"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 19 Feb 2020 12:36:21 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Feb 2020 22:36:19 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/12] drm: Shrink drm_display_mode timings
Date: Wed, 19 Feb 2020 22:35:41 +0200
Message-Id: <20200219203544.31013-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClN0
b3JlIHRoZSB0aW1pbmdzIChhcGFydCBmcm9tIHRoZSBjbG9jaykgYXMgdTE2LiBUaGUgdWFwaSBt
b2RlCnN0cnVjdCBhbHJlYWR5IHVzZXMgdTE2IGZvciBldmVyeXRoaW5nIHNvIHVzaW5nIHNvbWV0
aGluZyBiaWdnZXIKaW50ZXJuYWxseSBkb2Vzbid0IHJlYWxseSBoZWxwIHVzLgoKU2lnbmVkLW9m
Zi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgfCAgNyAtLS0tLS0KIGluY2x1ZGUvZHJtL2Ry
bV9tb2Rlcy5oICAgICB8IDQ2ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0K
IDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9tb2Rlcy5jCmluZGV4IDBlN2M5YmEyNDFjNC4uY2M5ZmM1MmY5ZjdjIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rl
cy5jCkBAIC0xOTE3LDEzICsxOTE3LDYgQEAgRVhQT1JUX1NZTUJPTChkcm1fbW9kZV9jcmVhdGVf
ZnJvbV9jbWRsaW5lX21vZGUpOwogdm9pZCBkcm1fbW9kZV9jb252ZXJ0X3RvX3Vtb2RlKHN0cnVj
dCBkcm1fbW9kZV9tb2RlaW5mbyAqb3V0LAogCQkJICAgICAgIGNvbnN0IHN0cnVjdCBkcm1fZGlz
cGxheV9tb2RlICppbikKIHsKLQlXQVJOKGluLT5oZGlzcGxheSA+IFVTSFJUX01BWCB8fCBpbi0+
aHN5bmNfc3RhcnQgPiBVU0hSVF9NQVggfHwKLQkgICAgIGluLT5oc3luY19lbmQgPiBVU0hSVF9N
QVggfHwgaW4tPmh0b3RhbCA+IFVTSFJUX01BWCB8fAotCSAgICAgaW4tPmhza2V3ID4gVVNIUlRf
TUFYIHx8IGluLT52ZGlzcGxheSA+IFVTSFJUX01BWCB8fAotCSAgICAgaW4tPnZzeW5jX3N0YXJ0
ID4gVVNIUlRfTUFYIHx8IGluLT52c3luY19lbmQgPiBVU0hSVF9NQVggfHwKLQkgICAgIGluLT52
dG90YWwgPiBVU0hSVF9NQVggfHwgaW4tPnZzY2FuID4gVVNIUlRfTUFYLAotCSAgICAgInRpbWlu
ZyB2YWx1ZXMgdG9vIGxhcmdlIGZvciBtb2RlIGluZm9cbiIpOwotCiAJb3V0LT5jbG9jayA9IGlu
LT5jbG9jazsKIAlvdXQtPmhkaXNwbGF5ID0gaW4tPmhkaXNwbGF5OwogCW91dC0+aHN5bmNfc3Rh
cnQgPSBpbi0+aHN5bmNfc3RhcnQ7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fbW9kZXMu
aCBiL2luY2x1ZGUvZHJtL2RybV9tb2Rlcy5oCmluZGV4IGIyOGMwMjM0ZmNkNy4uYjU4NTA3NDk0
NWI1IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fbW9kZXMuaAorKysgYi9pbmNsdWRlL2Ry
bS9kcm1fbW9kZXMuaApAQCAtMjc4LDE2ICsyNzgsMTYgQEAgc3RydWN0IGRybV9kaXNwbGF5X21v
ZGUgewogCSAqIFBpeGVsIGNsb2NrIGluIGtIei4KIAkgKi8KIAlpbnQgY2xvY2s7CQkvKiBpbiBr
SHogKi8KLQlpbnQgaGRpc3BsYXk7Ci0JaW50IGhzeW5jX3N0YXJ0OwotCWludCBoc3luY19lbmQ7
Ci0JaW50IGh0b3RhbDsKLQlpbnQgaHNrZXc7Ci0JaW50IHZkaXNwbGF5OwotCWludCB2c3luY19z
dGFydDsKLQlpbnQgdnN5bmNfZW5kOwotCWludCB2dG90YWw7Ci0JaW50IHZzY2FuOworCXUxNiBo
ZGlzcGxheTsKKwl1MTYgaHN5bmNfc3RhcnQ7CisJdTE2IGhzeW5jX2VuZDsKKwl1MTYgaHRvdGFs
OworCXUxNiBoc2tldzsKKwl1MTYgdmRpc3BsYXk7CisJdTE2IHZzeW5jX3N0YXJ0OworCXUxNiB2
c3luY19lbmQ7CisJdTE2IHZ0b3RhbDsKKwl1MTYgdnNjYW47CiAJLyoqCiAJICogQGZsYWdzOgog
CSAqCkBAIC0zNTYsMTkgKzM1NiwxOSBAQCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSB7CiAJICog
ZGlmZmVyZW5jZSBpcyBleGFjdGx5IGEgZmFjdG9yIG9mIDEwLgogCSAqLwogCWludCBjcnRjX2Ns
b2NrOwotCWludCBjcnRjX2hkaXNwbGF5OwotCWludCBjcnRjX2hibGFua19zdGFydDsKLQlpbnQg
Y3J0Y19oYmxhbmtfZW5kOwotCWludCBjcnRjX2hzeW5jX3N0YXJ0OwotCWludCBjcnRjX2hzeW5j
X2VuZDsKLQlpbnQgY3J0Y19odG90YWw7Ci0JaW50IGNydGNfaHNrZXc7Ci0JaW50IGNydGNfdmRp
c3BsYXk7Ci0JaW50IGNydGNfdmJsYW5rX3N0YXJ0OwotCWludCBjcnRjX3ZibGFua19lbmQ7Ci0J
aW50IGNydGNfdnN5bmNfc3RhcnQ7Ci0JaW50IGNydGNfdnN5bmNfZW5kOwotCWludCBjcnRjX3Z0
b3RhbDsKKwl1MTYgY3J0Y19oZGlzcGxheTsKKwl1MTYgY3J0Y19oYmxhbmtfc3RhcnQ7CisJdTE2
IGNydGNfaGJsYW5rX2VuZDsKKwl1MTYgY3J0Y19oc3luY19zdGFydDsKKwl1MTYgY3J0Y19oc3lu
Y19lbmQ7CisJdTE2IGNydGNfaHRvdGFsOworCXUxNiBjcnRjX2hza2V3OworCXUxNiBjcnRjX3Zk
aXNwbGF5OworCXUxNiBjcnRjX3ZibGFua19zdGFydDsKKwl1MTYgY3J0Y192YmxhbmtfZW5kOwor
CXUxNiBjcnRjX3ZzeW5jX3N0YXJ0OworCXUxNiBjcnRjX3ZzeW5jX2VuZDsKKwl1MTYgY3J0Y192
dG90YWw7CiAKIAkvKioKIAkgKiBAcHJpdmF0ZV9mbGFnczoKLS0gCjIuMjQuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
