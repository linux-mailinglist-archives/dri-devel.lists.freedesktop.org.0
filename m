Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCABD3302
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 22:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78026EB87;
	Thu, 10 Oct 2019 20:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D1C6EB87;
 Thu, 10 Oct 2019 20:59:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Oct 2019 13:59:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,281,1566889200"; d="scan'208";a="369214660"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.54.75.49])
 by orsmga005.jf.intel.com with ESMTP; 10 Oct 2019 13:59:36 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/dp: Remove the unused drm_device to get rid of build
 warning
Date: Thu, 10 Oct 2019 14:01:32 -0700
Message-Id: <20191010210132.8799-1-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
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
Cc: Manasi Navare <manasi.d.navare@intel.com>, Sean Paul <sean@poorly.run>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2Ugbm8gbG9uZ2VyIHVzZSB0aGUgY29ubmVjdGlvbiBtdXRleCBhbmQgaGVuY2Ugbm8gbmVlZCB0
bwpkZWZpbmUgZHJtX2RldmljZSAqZGV2LCBpdCBjYXVzZXMgYSB1bnVzZWQgdmFyaWFibGUgYnVp
bGQgd2FybmluZwoKRml4ZXM6IDgzZmE5ODQyYWZlNyAoImRybS9kcC1tc3Q6IERyb3AgY29ubmVj
dGlvbl9tdXRleCBjaGVjayIpCkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IEx5
dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogTWFuYXNpIE5hdmFyZSA8bWFuYXNpLmQubmF2
YXJlQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5j
IHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfbXN0X3RvcG9sb2d5LmMKaW5kZXggOTM2NGU0ZjQyOTc1Li45Y2NjYzVlNjMzMDkgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwpAQCAtNDE4NCw4ICs0MTg0LDYgQEAgRVhQ
T1JUX1NZTUJPTChkcm1fZHBfbXN0X3RvcG9sb2d5X3N0YXRlX2Z1bmNzKTsKIHN0cnVjdCBkcm1f
ZHBfbXN0X3RvcG9sb2d5X3N0YXRlICpkcm1fYXRvbWljX2dldF9tc3RfdG9wb2xvZ3lfc3RhdGUo
c3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAogCQkJCQkJCQkgICAgc3RydWN0IGRybV9k
cF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IpCiB7Ci0Jc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IG1n
ci0+ZGV2OwotCiAJcmV0dXJuIHRvX2RwX21zdF90b3BvbG9neV9zdGF0ZShkcm1fYXRvbWljX2dl
dF9wcml2YXRlX29ial9zdGF0ZShzdGF0ZSwgJm1nci0+YmFzZSkpOwogfQogRVhQT1JUX1NZTUJP
TChkcm1fYXRvbWljX2dldF9tc3RfdG9wb2xvZ3lfc3RhdGUpOwotLSAKMi4xOS4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
