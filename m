Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC6B57CA1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 958D46E5B8;
	Thu, 27 Jun 2019 07:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E466E5B6;
 Thu, 27 Jun 2019 07:01:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jun 2019 00:01:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,422,1557212400"; d="scan'208";a="167333007"
Received: from slisovsk-lenovo-ideapad-720s-13ikb.fi.intel.com
 ([10.237.66.154])
 by orsmga006.jf.intel.com with ESMTP; 27 Jun 2019 00:01:10 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 1/3] drm: Add helper to compare edids.
Date: Thu, 27 Jun 2019 10:00:15 +0300
Message-Id: <20190627070016.7047-2-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190627070016.7047-1-stanislav.lisovskiy@intel.com>
References: <20190627070016.7047-1-stanislav.lisovskiy@intel.com>
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 martin.peres@intel.com, Stanislav.Lisovskiy@intel.com, jani.saarinen@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWFueSBkcml2ZXJzIHdvdWxkIGJlbmVmaXQgZnJvbSB1c2luZwpkcm0gaGVscGVyIHRvIGNvbXBh
cmUgZWRpZCwgcmF0aGVyCnRoYW4gYm90aGVyaW5nIHdpdGggb3duIGltcGxlbWVudGF0aW9uLgoK
U2lnbmVkLW9mZi1ieTogU3RhbmlzbGF2IExpc292c2tpeSA8c3RhbmlzbGF2Lmxpc292c2tpeUBp
bnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgfCAyNiArKysrKysrKysr
KysrKysrKysrKysrKysrKwogaW5jbHVkZS9kcm0vZHJtX2VkaWQuaCAgICAgfCAgMiArKwogMiBm
aWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9lZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwppbmRleCA5ZDhmMmI5
NTIwMDQuLjVmMGY1MTk3OTI0ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlk
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKQEAgLTEzNjEsNiArMTM2MSwzMiBA
QCBzdGF0aWMgYm9vbCBkcm1fZWRpZF9pc196ZXJvKGNvbnN0IHU4ICppbl9lZGlkLCBpbnQgbGVu
Z3RoKQogCXJldHVybiB0cnVlOwogfQogCisKK2Jvb2wgZHJtX2VkaWRfYXJlX2VxdWFsKHN0cnVj
dCBlZGlkICplZGlkMSwgc3RydWN0IGVkaWQgKmVkaWQyKQoreworCWludCBlZGlkMV9sZW4sIGVk
aWQyX2xlbjsKKwlib29sIGVkaWQxX3ByZXNlbnQgPSBlZGlkMSAhPSBOVUxMOworCWJvb2wgZWRp
ZDJfcHJlc2VudCA9IGVkaWQyICE9IE5VTEw7CisKKwlpZiAoZWRpZDFfcHJlc2VudCAhPSBlZGlk
Ml9wcmVzZW50KQorCQlyZXR1cm4gZmFsc2U7CisKKwlpZiAoZWRpZDEpIHsKKworCQllZGlkMV9s
ZW4gPSBFRElEX0xFTkdUSCAqICgxICsgZWRpZDEtPmV4dGVuc2lvbnMpOworCQllZGlkMl9sZW4g
PSBFRElEX0xFTkdUSCAqICgxICsgZWRpZDItPmV4dGVuc2lvbnMpOworCisJCWlmIChlZGlkMV9s
ZW4gIT0gZWRpZDJfbGVuKQorCQkJcmV0dXJuIGZhbHNlOworCisJCWlmIChtZW1jbXAoZWRpZDEs
IGVkaWQyLCBlZGlkMV9sZW4pKQorCQkJcmV0dXJuIGZhbHNlOworCX0KKworCXJldHVybiB0cnVl
OworfQorCisKIC8qKgogICogZHJtX2VkaWRfYmxvY2tfdmFsaWQgLSBTYW5pdHkgY2hlY2sgdGhl
IEVESUQgYmxvY2sgKGJhc2Ugb3IgZXh0ZW5zaW9uKQogICogQHJhd19lZGlkOiBwb2ludGVyIHRv
IHJhdyBFRElEIGJsb2NrCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZWRpZC5oIGIvaW5j
bHVkZS9kcm0vZHJtX2VkaWQuaAppbmRleCBiOTcxOTQxOGMzZDIuLjhkMjhhNjAwMTI4NyAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2VkaWQuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZWRp
ZC5oCkBAIC0zNTQsNiArMzU0LDggQEAgZHJtX2xvYWRfZWRpZF9maXJtd2FyZShzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yKQogfQogI2VuZGlmCiAKK2Jvb2wgZHJtX2VkaWRfYXJlX2Vx
dWFsKHN0cnVjdCBlZGlkICplZGlkMSwgc3RydWN0IGVkaWQgKmVkaWQyKTsKKwogaW50CiBkcm1f
aGRtaV9hdmlfaW5mb2ZyYW1lX2Zyb21fZGlzcGxheV9tb2RlKHN0cnVjdCBoZG1pX2F2aV9pbmZv
ZnJhbWUgKmZyYW1lLAogCQkJCQkgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
