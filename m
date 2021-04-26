Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 163E536B0E3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 11:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D4A6E1A3;
	Mon, 26 Apr 2021 09:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B3F6E7D2;
 Mon, 26 Apr 2021 09:43:16 +0000 (UTC)
IronPort-SDR: JbEm4/5ppyz5ZItVORDe9V0mBT3dg+u70WeK6dcEjiEhlh70klPq0y/2W8B3rysq7CoI6cLSxc
 vhx3p4DW9S8g==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195861049"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="195861049"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 02:43:16 -0700
IronPort-SDR: AJdiFrkKDPtQ9w+1l5pywLx0IPdAbNDHn3gJ95N3Cj4pjbyviPJekkZ+fytZaqvLwuLcIBkbBd
 lVLOPY9QyKug==
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="429334208"
Received: from rgunnin1-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.12.201])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 02:43:12 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 9/9] drm/i915/gem: hide new uAPI behind CONFIG_BROKEN
Date: Mon, 26 Apr 2021 10:39:01 +0100
Message-Id: <20210426093901.28937-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210426093901.28937-1-matthew.auld@intel.com>
References: <20210426093901.28937-1-matthew.auld@intel.com>
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
Cc: Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>, dri-devel@lists.freedesktop.org,
 Kenneth Graunke <kenneth@whitecape.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, mesa-dev@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VHJlYXQgaXQgdGhlIHNhbWUgYXMgdGhlIGZha2UgbG9jYWwtbWVtb3J5IHN0dWZmLCB3aGVyZSBp
dCBpcyBkaXNhYmxlZApmb3Igbm9ybWFsIGtlcm5lbHMsIGluIGNhc2Ugc29tZSByYW5kb20gVU1E
IGlzIHRlbXB0ZWQgdG8gdXNlIHRoaXMuIE9uY2UKd2UgaGF2ZSBhbGwgdGhlIG90aGVyIGJpdHMg
YW5kIHBpZWNlcyBpbiBwbGFjZSwgbGlrZSB0aGUgVFRNIGNvbnZlcnNpb24sCndlIGNhbiB0dXJu
IHRoaXMgb24gZm9yIHJlYWwuCgpTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcu
YXVsZEBpbnRlbC5jb20+CkNjOiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51
eC5pbnRlbC5jb20+CkNjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51
eC5pbnRlbC5jb20+CkNjOiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5pZWxlLmNlcmFvbG9z
cHVyaW9AaW50ZWwuY29tPgpDYzogTGlvbmVsIExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJs
aW5AbGludXguaW50ZWwuY29tPgpDYzogSm9uIEJsb29tZmllbGQgPGpvbi5ibG9vbWZpZWxkQGlu
dGVsLmNvbT4KQ2M6IEpvcmRhbiBKdXN0ZW4gPGpvcmRhbi5sLmp1c3RlbkBpbnRlbC5jb20+CkNj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IEtlbm5ldGggR3Jh
dW5rZSA8a2VubmV0aEB3aGl0ZWNhcGUub3JnPgpDYzogSmFzb24gRWtzdHJhbmQgPGphc29uQGps
ZWtzdHJhbmQubmV0PgpDYzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPgpDYzogZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbWVzYS1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2NyZWF0ZS5jIHwg
MyArKysKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcXVlcnkuYyAgICAgICAgICB8IDMgKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9jcmVhdGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2dlbS9pOTE1X2dlbV9jcmVhdGUuYwppbmRleCAzMzhmMzg4M2UyMzguLjFkMDcyOGI4NzhkNSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2NyZWF0ZS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9jcmVhdGUuYwpAQCAtMzMyLDYg
KzMzMiw5IEBAIHN0YXRpYyBpbnQgZXh0X3NldF9wbGFjZW1lbnRzKHN0cnVjdCBpOTE1X3VzZXJf
ZXh0ZW5zaW9uIF9fdXNlciAqYmFzZSwKIHsKIAlzdHJ1Y3QgZHJtX2k5MTVfZ2VtX2NyZWF0ZV9l
eHRfbWVtb3J5X3JlZ2lvbnMgZXh0OwogCisJaWYgKCFJU19FTkFCTEVEKENPTkZJR19EUk1fSTkx
NV9VTlNUQUJMRV9GQUtFX0xNRU0pKQorCQlyZXR1cm4gLUVOT0RFVjsKKwogCWlmIChjb3B5X2Zy
b21fdXNlcigmZXh0LCBiYXNlLCBzaXplb2YoZXh0KSkpCiAJCXJldHVybiAtRUZBVUxUOwogCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3F1ZXJ5LmMgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X3F1ZXJ5LmMKaW5kZXggMGI0Y2IyZTFhMTVjLi41NjE2ODRkZWQ0YTAg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcXVlcnkuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3F1ZXJ5LmMKQEAgLTQzMiw2ICs0MzIsOSBAQCBzdGF0aWMg
aW50IHF1ZXJ5X21lbXJlZ2lvbl9pbmZvKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1LAog
CXUzMiB0b3RhbF9sZW5ndGg7CiAJaW50IHJldCwgaWQ7CiAKKwlpZiAoIUlTX0VOQUJMRUQoQ09O
RklHX0RSTV9JOTE1X1VOU1RBQkxFX0ZBS0VfTE1FTSkpCisJCXJldHVybiAtRU5PREVWOworCiAJ
aWYgKHF1ZXJ5X2l0ZW0tPmZsYWdzICE9IDApCiAJCXJldHVybiAtRUlOVkFMOwogCi0tIAoyLjI2
LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
