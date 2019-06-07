Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C12391F0
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 18:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D11389DE6;
	Fri,  7 Jun 2019 16:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9329189DE5;
 Fri,  7 Jun 2019 16:26:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jun 2019 09:26:18 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 07 Jun 2019 09:26:15 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2019 19:26:15 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm: Refuse to create zero width/height cmdline modes
Date: Fri,  7 Jun 2019 19:26:09 +0300
Message-Id: <20190607162611.23514-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190607162611.23514-1-ville.syrjala@linux.intel.com>
References: <20190607162611.23514-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCklm
IHRoZSB1c2VyIHNwZWNpZmllcyB6ZXJvIHdpZHRoL2hlaWdodCBjbWRsaW5lIG1vZGUgaTkxNSB3
aWxsCmJsb3cgdXAgYXMgdGhlIGZiZGV2IHBhdGggd2lsbCBieXBhc3MgdGhlIHJlZ3VsYXIgZmIg
c2FuaXR5CmNoZWNrIHRoYXQgd291bGQgb3RoZXJ3aXNlIGhhdmUgcmVmdXNlZCB0byBjcmVhdGUg
YSBmcmFtZWJ1ZmZlcgp3aXRoIHplcm8gd2lkdGgvaGVpZ2h0LgoKVGhlIHJlYXNvbiBJIHRob3Vn
aHQgdG8gdHJ5IHRoaXMgaXMgc28gdGhhdCBJIGNhbiBmb3JjZSBhIHNwZWNpZmljCmRlcHRoIGZv
ciBmYmRldiB3aXRob3V0IGFjdHVhbGx5IGhhdmluZyB0byBoYXJkY29kZSB0aGUgbW9kZQpvbiB0
aGUga2VybmVsIGNtZGxpbmUuIEVnLiBpZiBJIHBhc3MgdmlkZW89MHgwLTggSSB3aWxsIGdldCBh
bgo4YnBwIGZyYW1lYnVmZmVyIGF0IG15IG1vbml0b3IncyBuYXRpdmUgcmVzb2x1dGlvbi4KClNp
Z25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIHwgMyArKysKIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21v
ZGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKaW5kZXggNWEwN2EyOGZlYzZkLi5i
MzYyNDhhNWQ4MjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKQEAgLTE1OTMsNiArMTU5Myw5IEBAIGRybV9t
b2RlX2NyZWF0ZV9mcm9tX2NtZGxpbmVfbW9kZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogewog
CXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlOwogCisJaWYgKGNtZC0+eHJlcyA9PSAwIHx8
IGNtZC0+eXJlcyA9PSAwKQorCQlyZXR1cm4gTlVMTDsKKwogCWlmIChjbWQtPmN2dCkKIAkJbW9k
ZSA9IGRybV9jdnRfbW9kZShkZXYsCiAJCQkJICAgIGNtZC0+eHJlcywgY21kLT55cmVzLAotLSAK
Mi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
