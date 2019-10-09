Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66206D12F8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 17:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77716E9E2;
	Wed,  9 Oct 2019 15:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E8B6E9E1;
 Wed,  9 Oct 2019 15:37:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Oct 2019 08:37:56 -0700
X-IronPort-AV: E=Sophos;i="5.67,276,1566889200"; d="scan'208";a="345390719"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Oct 2019 08:37:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/8] drm/nouveau: use drm_debug_enabled() to check for debug
 categories
Date: Wed,  9 Oct 2019 18:37:29 +0300
Message-Id: <a78935faaaa73e9302c4dc21b01913c819a08ff5.1570635293.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1570635293.git.jani.nikula@intel.com>
References: <cover.1570635293.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxsb3cgYmV0dGVyIGFic3RyYWN0aW9uIG9mIHRoZSBkcm1fZGVidWcgZ2xvYmFsIHZhcmlhYmxl
IGluIHRoZQpmdXR1cmUuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KCnYyOiBtb3ZlIHVubGlrZWx5
KCkgdG8gZHJtX2RlYnVnX2VuYWJsZWQoKQoKQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0
LmNvbT4KQ2M6IG5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IEph
bmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvZGlzcG52NTAvZGlzcC5oIHwgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2Rydi5oICAgfCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rp
c3BudjUwL2Rpc3AuaCBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuaApp
bmRleCA3YzQxYjA1OTlkMWEuLmMwYTc5NTMxYjA4NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L2Rpc3BudjUwL2Rpc3AuaApAQCAtNzgsMTQgKzc4LDE0IEBAIHZvaWQgZXZvX2tpY2sodTMyICos
IHN0cnVjdCBudjUwX2RtYWMgKik7CiAKICNkZWZpbmUgZXZvX210aGQocCwgbSwgcykgZG8gewkJ
CQkJCVwKIAljb25zdCB1MzIgX20gPSAobSksIF9zID0gKHMpOwkJCQkJXAotCWlmIChkcm1fZGVi
dWcgJiBEUk1fVVRfS01TKQkJCQkJXAorCWlmIChkcm1fZGVidWdfZW5hYmxlZChEUk1fVVRfS01T
KSkJCQkJXAogCQlwcl9lcnIoIiUwNHggJWQgJXNcbiIsIF9tLCBfcywgX19mdW5jX18pOwkJXAog
CSooKHApKyspID0gKChfcyA8PCAxOCkgfCBfbSk7CQkJCQlcCiB9IHdoaWxlKDApCiAKICNkZWZp
bmUgZXZvX2RhdGEocCwgZCkgZG8gewkJCQkJCVwKIAljb25zdCB1MzIgX2QgPSAoZCk7CQkJCQkJ
XAotCWlmIChkcm1fZGVidWcgJiBEUk1fVVRfS01TKQkJCQkJXAorCWlmIChkcm1fZGVidWdfZW5h
YmxlZChEUk1fVVRfS01TKSkJCQkJXAogCQlwcl9lcnIoIlx0JTA4eFxuIiwgX2QpOwkJCQkJXAog
CSooKHApKyspID0gX2Q7CQkJCQkJCVwKIH0gd2hpbGUoMCkKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2Rydi5oCmluZGV4IDcwZjM0Y2FjYzU1Mi4uZGE4YzQ2ZTA5OTQzIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rydi5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJ2LmgKQEAgLTI0OCwxMSArMjQ4LDExIEBAIHZvaWQgbm91
dmVhdV9kcm1fZGV2aWNlX3JlbW92ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KTsKICNkZWZpbmUg
TlZfSU5GTyhkcm0sZixhLi4uKSBOVl9QUklOVEsoaW5mbywgJihkcm0pLT5jbGllbnQsIGYsICMj
YSkKIAogI2RlZmluZSBOVl9ERUJVRyhkcm0sZixhLi4uKSBkbyB7ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKLQlpZiAodW5saWtlbHkoZHJtX2RlYnVnICYg
RFJNX1VUX0RSSVZFUikpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKwlpZiAoZHJt
X2RlYnVnX2VuYWJsZWQoRFJNX1VUX0RSSVZFUikpICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKIAkJTlZfUFJJTlRLKGluZm8sICYoZHJtKS0+Y2xpZW50LCBmLCAjI2EpOyAgICAg
ICAgICAgICAgICAgICAgICAgXAogfSB3aGlsZSgwKQogI2RlZmluZSBOVl9BVE9NSUMoZHJtLGYs
YS4uLikgZG8geyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
LQlpZiAodW5saWtlbHkoZHJtX2RlYnVnICYgRFJNX1VUX0FUT01JQykpICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKKwlpZiAoZHJtX2RlYnVnX2VuYWJsZWQoRFJNX1VUX0FUT01JQykp
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKIAkJTlZfUFJJTlRLKGluZm8sICYo
ZHJtKS0+Y2xpZW50LCBmLCAjI2EpOyAgICAgICAgICAgICAgICAgICAgICAgXAogfSB3aGlsZSgw
KQogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
