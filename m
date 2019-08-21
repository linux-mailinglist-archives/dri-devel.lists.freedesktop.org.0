Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F5C97C39
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 16:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F376E33A;
	Wed, 21 Aug 2019 14:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795406E33A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 14:15:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Aug 2019 07:15:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; d="scan'208";a="181040388"
Received: from wo73065l01s008.fi.intel.com ([10.237.72.188])
 by orsmga003.jf.intel.com with ESMTP; 21 Aug 2019 07:15:01 -0700
From: Simon Ser <simon.ser@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: add port info to debugfs
Date: Wed, 21 Aug 2019 17:15:54 +0300
Message-Id: <20190821141554.18347-1-simon.ser@intel.com>
X-Mailer: git-send-email 2.22.1
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRzIGEgbGluZSB3aXRoIHRoZSBwb3J0IG5hbWUgdG8gY29ubmVjdG9ycyBp
bgpkZWJ1Z2ZzL2k5MTZfZGlzcGxheV9pbmZvLiBBIGhpbnQgaXMgcHJpbnRlZCBpZiB0aGUgcG9y
dCBpcyB0eXBlLUMuCgpTaWduZWQtb2ZmLWJ5OiBTaW1vbiBTZXIgPHNpbW9uLnNlckBpbnRlbC5j
b20+CkNjOiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV9kZWJ1Z2ZzLmMgfCA5ICsrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZGVi
dWdmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kZWJ1Z2ZzLmMKaW5kZXggYjM5MjI2
ZDdmOGQyLi43MThhMzM3YzhmMGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5
MTVfZGVidWdmcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZGVidWdmcy5jCkBA
IC0yNTU3LDkgKzI1NTcsMTEgQEAgc3RhdGljIHZvaWQgaW50ZWxfbHZkc19pbmZvKHN0cnVjdCBz
ZXFfZmlsZSAqbSwKIHN0YXRpYyB2b2lkIGludGVsX2Nvbm5lY3Rvcl9pbmZvKHN0cnVjdCBzZXFf
ZmlsZSAqbSwKIAkJCQkgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIHsKKwlzdHJ1
Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSA9IHRvX2k5MTUoY29ubmVjdG9yLT5kZXYpOwogCXN0
cnVjdCBpbnRlbF9jb25uZWN0b3IgKmludGVsX2Nvbm5lY3RvciA9IHRvX2ludGVsX2Nvbm5lY3Rv
cihjb25uZWN0b3IpOwogCXN0cnVjdCBpbnRlbF9lbmNvZGVyICppbnRlbF9lbmNvZGVyID0gaW50
ZWxfY29ubmVjdG9yLT5lbmNvZGVyOwogCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlOwor
CWVudW0gdGNfcG9ydCB0Y19wb3J0OwoKIAlzZXFfcHJpbnRmKG0sICJjb25uZWN0b3IgJWQ6IHR5
cGUgJXMsIHN0YXR1czogJXNcbiIsCiAJCSAgIGNvbm5lY3Rvci0+YmFzZS5pZCwgY29ubmVjdG9y
LT5uYW1lLApAQCAtMjU3OCw2ICsyNTgwLDEzIEBAIHN0YXRpYyB2b2lkIGludGVsX2Nvbm5lY3Rv
cl9pbmZvKHN0cnVjdCBzZXFfZmlsZSAqbSwKIAlpZiAoIWludGVsX2VuY29kZXIpCiAJCXJldHVy
bjsKCisJaWYgKGludGVsX2VuY29kZXItPnBvcnQgIT0gUE9SVF9OT05FKSB7CisJCXRjX3BvcnQg
PSBpbnRlbF9wb3J0X3RvX3RjKGk5MTUsIGludGVsX2VuY29kZXItPnBvcnQpOworCQlzZXFfcHJp
bnRmKG0sICJcdHBvcnQ6ICVjJXNcbiIsCisJCQkgICBwb3J0X25hbWUoaW50ZWxfZW5jb2Rlci0+
cG9ydCksCisJCQkgICB0Y19wb3J0ICE9IFBPUlRfVENfTk9ORSA/ICIgKHR5cGUtQykiIDogIiIp
OworCX0KKwogCXN3aXRjaCAoY29ubmVjdG9yLT5jb25uZWN0b3JfdHlwZSkgewogCWNhc2UgRFJN
X01PREVfQ09OTkVDVE9SX0Rpc3BsYXlQb3J0OgogCWNhc2UgRFJNX01PREVfQ09OTkVDVE9SX2VE
UDoKLS0KMi4yMi4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
