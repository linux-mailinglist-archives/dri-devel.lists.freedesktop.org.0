Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9C5184C46
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 17:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E5C89DE6;
	Fri, 13 Mar 2020 16:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A466EC09;
 Fri, 13 Mar 2020 16:21:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Mar 2020 09:21:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,549,1574150400"; d="scan'208";a="237274210"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 13 Mar 2020 09:20:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 13 Mar 2020 18:20:57 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/9] drm: Constify topology id
Date: Fri, 13 Mar 2020 18:20:46 +0200
Message-Id: <20200313162054.16009-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200313162054.16009-1-ville.syrjala@linux.intel.com>
References: <20200313162054.16009-1-ville.syrjala@linux.intel.com>
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCk1h
a2UgdGhlIHRvcG9sb2d5IGlkIGNvbnN0IHNpbmNlIHdlIGRvbid0IHdhbnQgdG8gY2hhbmdlIGl0
LgoKU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4Lmlu
dGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jIHwgNCArKy0tCiBp
bmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggICAgIHwgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwpp
bmRleCA2NDRmMGFkMTA2NzEuLjQ2MmQ4Y2FhNmU3MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9jb25uZWN0b3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5j
CkBAIC0yMzkyLDcgKzIzOTIsNyBAQCBFWFBPUlRfU1lNQk9MKGRybV9tb2RlX3B1dF90aWxlX2dy
b3VwKTsKICAqIHRpbGUgZ3JvdXAgb3IgTlVMTCBpZiBub3QgZm91bmQuCiAgKi8KIHN0cnVjdCBk
cm1fdGlsZV9ncm91cCAqZHJtX21vZGVfZ2V0X3RpbGVfZ3JvdXAoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwKLQkJCQkJICAgICAgIGNoYXIgdG9wb2xvZ3lbOF0pCisJCQkJCSAgICAgICBjb25zdCBj
aGFyIHRvcG9sb2d5WzhdKQogewogCXN0cnVjdCBkcm1fdGlsZV9ncm91cCAqdGc7CiAJaW50IGlk
OwpAQCAtMjQyMiw3ICsyNDIyLDcgQEAgRVhQT1JUX1NZTUJPTChkcm1fbW9kZV9nZXRfdGlsZV9n
cm91cCk7CiAgKiBuZXcgdGlsZSBncm91cCBvciBOVUxMLgogICovCiBzdHJ1Y3QgZHJtX3RpbGVf
Z3JvdXAgKmRybV9tb2RlX2NyZWF0ZV90aWxlX2dyb3VwKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
Ci0JCQkJCQkgIGNoYXIgdG9wb2xvZ3lbOF0pCisJCQkJCQkgIGNvbnN0IGNoYXIgdG9wb2xvZ3lb
OF0pCiB7CiAJc3RydWN0IGRybV90aWxlX2dyb3VwICp0ZzsKIAlpbnQgcmV0OwpkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oIGIvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rv
ci5oCmluZGV4IDE5YWU2YmI1Yzg1Yi4uZmQ1NDNkMWRiOWIyIDEwMDY0NAotLS0gYS9pbmNsdWRl
L2RybS9kcm1fY29ubmVjdG9yLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCkBA
IC0xNjE3LDkgKzE2MTcsOSBAQCBzdHJ1Y3QgZHJtX3RpbGVfZ3JvdXAgewogfTsKIAogc3RydWN0
IGRybV90aWxlX2dyb3VwICpkcm1fbW9kZV9jcmVhdGVfdGlsZV9ncm91cChzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LAotCQkJCQkJICBjaGFyIHRvcG9sb2d5WzhdKTsKKwkJCQkJCSAgY29uc3QgY2hh
ciB0b3BvbG9neVs4XSk7CiBzdHJ1Y3QgZHJtX3RpbGVfZ3JvdXAgKmRybV9tb2RlX2dldF90aWxl
X2dyb3VwKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCi0JCQkJCSAgICAgICBjaGFyIHRvcG9sb2d5
WzhdKTsKKwkJCQkJICAgICAgIGNvbnN0IGNoYXIgdG9wb2xvZ3lbOF0pOwogdm9pZCBkcm1fbW9k
ZV9wdXRfdGlsZV9ncm91cChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQkJICAgICBzdHJ1Y3Qg
ZHJtX3RpbGVfZ3JvdXAgKnRnKTsKIAotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
