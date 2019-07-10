Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ADB64650
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 14:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0ED6E0C2;
	Wed, 10 Jul 2019 12:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68F96E0D6;
 Wed, 10 Jul 2019 12:36:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jul 2019 05:36:59 -0700
X-IronPort-AV: E=Sophos;i="5.63,474,1557212400"; d="scan'208";a="170906953"
Received: from jkrzyszt-desk.igk.intel.com ([172.22.244.18])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jul 2019 05:36:57 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: [RFC PATCH 6/6] drm/i915: Rename "inject_load_failure" module
 parameter
Date: Wed, 10 Jul 2019 14:36:31 +0200
Message-Id: <20190710123631.26575-7-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190710123631.26575-1-janusz.krzysztofik@linux.intel.com>
References: <20190710123631.26575-1-janusz.krzysztofik@linux.intel.com>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSAicHJvYmUiIG5vbWVuY2xhdHVyZSBmb3IgY29uc2lzdGVuY3kgd2l0aCBpbnRlcm5h
bGx5IHVzZWQgbmFtZXMKb2YgZnVuY3Rpb25zIGFuZCB2YXJpYWJsZXMuCgpSZXF1aXJlcyBhZGp1
c3RtZW50IG9mIElHVCB0ZXN0cyBhbmQgcG9zc2libHkgYWZmZWN0cyBvdGhlciB1c2VyIGN1c3Rv
bQphcHBsaWNhdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBKYW51c3ogS3J6eXN6dG9maWsgPGphbnVz
ei5rcnp5c3p0b2Zpa0BsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUv
aTkxNV9kcnYuYyAgICB8IDEwICsrKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVf
cGFyYW1zLmMgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9wYXJhbXMuaCB8ICAy
ICstCiAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5jIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV9kcnYuYwppbmRleCA3MjQxYTdkMTRlOWIuLjNiYWM2YmU5ZjM3ZCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X2Rydi5jCkBAIC04NSwxMyArODUsMTMgQEAgc3RhdGljIHVuc2lnbmVk
IGludCBpOTE1X3Byb2JlX2ZhaWxfY291bnQ7CiAKIGJvb2wgX19pOTE1X2luamVjdF9wcm9iZV9m
YWlsdXJlKGNvbnN0IGNoYXIgKmZ1bmMsIGludCBsaW5lKQogewotCWlmIChpOTE1X3Byb2JlX2Zh
aWxfY291bnQgPj0gaTkxNV9tb2RwYXJhbXMuaW5qZWN0X2xvYWRfZmFpbHVyZSkKKwlpZiAoaTkx
NV9wcm9iZV9mYWlsX2NvdW50ID49IGk5MTVfbW9kcGFyYW1zLmluamVjdF9wcm9iZV9mYWlsdXJl
KQogCQlyZXR1cm4gZmFsc2U7CiAKLQlpZiAoKytpOTE1X3Byb2JlX2ZhaWxfY291bnQgPT0gaTkx
NV9tb2RwYXJhbXMuaW5qZWN0X2xvYWRfZmFpbHVyZSkgeworCWlmICgrK2k5MTVfcHJvYmVfZmFp
bF9jb3VudCA9PSBpOTE1X21vZHBhcmFtcy5pbmplY3RfcHJvYmVfZmFpbHVyZSkgewogCQlEUk1f
SU5GTygiSW5qZWN0aW5nIGZhaWx1cmUgYXQgY2hlY2twb2ludCAldSBbJXM6JWRdXG4iLAotCQkJ
IGk5MTVfbW9kcGFyYW1zLmluamVjdF9sb2FkX2ZhaWx1cmUsIGZ1bmMsIGxpbmUpOwotCQlpOTE1
X21vZHBhcmFtcy5pbmplY3RfbG9hZF9mYWlsdXJlID0gMDsKKwkJCSBpOTE1X21vZHBhcmFtcy5p
bmplY3RfcHJvYmVfZmFpbHVyZSwgZnVuYywgbGluZSk7CisJCWk5MTVfbW9kcGFyYW1zLmluamVj
dF9wcm9iZV9mYWlsdXJlID0gMDsKIAkJcmV0dXJuIHRydWU7CiAJfQogCkBAIC0xMDAsNyArMTAw
LDcgQEAgYm9vbCBfX2k5MTVfaW5qZWN0X3Byb2JlX2ZhaWx1cmUoY29uc3QgY2hhciAqZnVuYywg
aW50IGxpbmUpCiAKIGJvb2wgaTkxNV9lcnJvcl9pbmplY3RlZCh2b2lkKQogewotCXJldHVybiBp
OTE1X3Byb2JlX2ZhaWxfY291bnQgJiYgIWk5MTVfbW9kcGFyYW1zLmluamVjdF9sb2FkX2ZhaWx1
cmU7CisJcmV0dXJuIGk5MTVfcHJvYmVfZmFpbF9jb3VudCAmJiAhaTkxNV9tb2RwYXJhbXMuaW5q
ZWN0X3Byb2JlX2ZhaWx1cmU7CiB9CiAKICNlbmRpZgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV9wYXJhbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcGFyYW1z
LmMKaW5kZXggMjk2NDUyZjllZmU0Li41OWE2NTg2ZGFlMTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfcGFyYW1zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkx
NV9wYXJhbXMuYwpAQCAtMTY1LDcgKzE2NSw3IEBAIGk5MTVfcGFyYW1fbmFtZWRfdW5zYWZlKGVu
YWJsZV9kcF9tc3QsIGJvb2wsIDA2MDAsCiAJIkVuYWJsZSBtdWx0aS1zdHJlYW0gdHJhbnNwb3J0
IChNU1QpIGZvciBuZXcgRGlzcGxheVBvcnQgc2lua3MuIChkZWZhdWx0OiB0cnVlKSIpOwogCiAj
aWYgSVNfRU5BQkxFRChDT05GSUdfRFJNX0k5MTVfREVCVUcpCi1pOTE1X3BhcmFtX25hbWVkX3Vu
c2FmZShpbmplY3RfbG9hZF9mYWlsdXJlLCB1aW50LCAwNDAwLAoraTkxNV9wYXJhbV9uYW1lZF91
bnNhZmUoaW5qZWN0X3Byb2JlX2ZhaWx1cmUsIHVpbnQsIDA0MDAsCiAJIkZvcmNlIGFuIGVycm9y
IGFmdGVyIGEgbnVtYmVyIG9mIGZhaWx1cmUgY2hlY2sgcG9pbnRzICgwOmRpc2FibGVkIChkZWZh
dWx0KSwgTjpmb3JjZSBmYWlsdXJlIGF0IHRoZSBOdGggZmFpbHVyZSBjaGVjayBwb2ludCkiKTsK
ICNlbmRpZgogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3BhcmFtcy5o
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9wYXJhbXMuaAppbmRleCBkMjlhZGUzYjdkZTYu
LjhjODg3NDEzZmM3MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9wYXJh
bXMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3BhcmFtcy5oCkBAIC02Miw3ICs2
Miw3IEBAIHN0cnVjdCBkcm1fcHJpbnRlcjsKIAlwYXJhbShpbnQsIG1taW9fZGVidWcsIC1JU19F
TkFCTEVEKENPTkZJR19EUk1fSTkxNV9ERUJVR19NTUlPKSkgXAogCXBhcmFtKGludCwgZWRwX3Zz
d2luZywgMCkgXAogCXBhcmFtKGludCwgcmVzZXQsIDIpIFwKLQlwYXJhbSh1bnNpZ25lZCBpbnQs
IGluamVjdF9sb2FkX2ZhaWx1cmUsIDApIFwKKwlwYXJhbSh1bnNpZ25lZCBpbnQsIGluamVjdF9w
cm9iZV9mYWlsdXJlLCAwKSBcCiAJcGFyYW0oaW50LCBmYXN0Ym9vdCwgLTEpIFwKIAlwYXJhbShp
bnQsIGVuYWJsZV9kcGNkX2JhY2tsaWdodCwgMCkgXAogCXBhcmFtKGNoYXIgKiwgZm9yY2VfcHJv
YmUsIENPTkZJR19EUk1fSTkxNV9GT1JDRV9QUk9CRSkgXAotLSAKMi4yMS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
