Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF04E744C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 16:01:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFBB6E8F3;
	Mon, 28 Oct 2019 15:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F6E6E8FF;
 Mon, 28 Oct 2019 15:01:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 08:00:59 -0700
X-IronPort-AV: E=Sophos;i="5.68,240,1569308400"; d="scan'208";a="189640630"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 08:00:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/5] drm/dsi: add missing DSI data types
Date: Mon, 28 Oct 2019 17:00:44 +0200
Message-Id: <20191028150047.22048-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028150047.22048-1-jani.nikula@intel.com>
References: <20191028150047.22048-1-jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, Vandita Kulkarni <vandita.kulkarni@intel.com>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGV4ZWN1dGUgcXVldWUgYW5kIGNvbXByZXNzZWQgcGl4ZWwgc3RyZWFtIHBhY2tldCBkYXRh
IHR5cGVzIGZvcgpjb21wbGV0ZW5lc3MuCgpDYzogVmFuZGl0YSBLdWxrYXJuaSA8dmFuZGl0YS5r
dWxrYXJuaUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3Vs
YUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RzaS5jIHwgMiArKwog
aW5jbHVkZS92aWRlby9taXBpX2Rpc3BsYXkuaCAgIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21pcGlfZHNp
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21pcGlfZHNpLmMKaW5kZXggZjIzN2Q4MDgyOGMzLi4z
ZjMzZjAyNTcxZmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kc2kuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21pcGlfZHNpLmMKQEAgLTM4OCw2ICszODgsNyBAQCBi
b29sIG1pcGlfZHNpX3BhY2tldF9mb3JtYXRfaXNfc2hvcnQodTggdHlwZSkKIAljYXNlIE1JUElf
RFNJX0RDU19TSE9SVF9XUklURToKIAljYXNlIE1JUElfRFNJX0RDU19TSE9SVF9XUklURV9QQVJB
TToKIAljYXNlIE1JUElfRFNJX0RDU19SRUFEOgorCWNhc2UgTUlQSV9EU0lfRVhFQ1VURV9RVUVV
RToKIAljYXNlIE1JUElfRFNJX1NFVF9NQVhJTVVNX1JFVFVSTl9QQUNLRVRfU0laRToKIAkJcmV0
dXJuIHRydWU7CiAJfQpAQCAtNDExLDYgKzQxMiw3IEBAIGJvb2wgbWlwaV9kc2lfcGFja2V0X2Zv
cm1hdF9pc19sb25nKHU4IHR5cGUpCiAJY2FzZSBNSVBJX0RTSV9HRU5FUklDX0xPTkdfV1JJVEU6
CiAJY2FzZSBNSVBJX0RTSV9EQ1NfTE9OR19XUklURToKIAljYXNlIE1JUElfRFNJX1BJQ1RVUkVf
UEFSQU1FVEVSX1NFVDoKKwljYXNlIE1JUElfRFNJX0NPTVBSRVNTRURfUElYRUxfU1RSRUFNOgog
CWNhc2UgTUlQSV9EU0lfTE9PU0VMWV9QQUNLRURfUElYRUxfU1RSRUFNX1lDQkNSMjA6CiAJY2Fz
ZSBNSVBJX0RTSV9QQUNLRURfUElYRUxfU1RSRUFNX1lDQkNSMjQ6CiAJY2FzZSBNSVBJX0RTSV9Q
QUNLRURfUElYRUxfU1RSRUFNX1lDQkNSMTY6CmRpZmYgLS1naXQgYS9pbmNsdWRlL3ZpZGVvL21p
cGlfZGlzcGxheS5oIGIvaW5jbHVkZS92aWRlby9taXBpX2Rpc3BsYXkuaAppbmRleCA3OWZkNzFj
ZjQ5MzQuLjZiNjM5MGRmYTIwMyAxMDA2NDQKLS0tIGEvaW5jbHVkZS92aWRlby9taXBpX2Rpc3Bs
YXkuaAorKysgYi9pbmNsdWRlL3ZpZGVvL21pcGlfZGlzcGxheS5oCkBAIC0zNyw2ICszNyw3IEBA
IGVudW0gewogCU1JUElfRFNJX0RDU19TSE9SVF9XUklURV9QQVJBTQkJCT0gMHgxNSwKIAogCU1J
UElfRFNJX0RDU19SRUFECQkJCT0gMHgwNiwKKwlNSVBJX0RTSV9FWEVDVVRFX1FVRVVFCQkJCT0g
MHgxNiwKIAogCU1JUElfRFNJX1NFVF9NQVhJTVVNX1JFVFVSTl9QQUNLRVRfU0laRQkJPSAweDM3
LAogCkBAIC00Niw2ICs0Nyw3IEBAIGVudW0gewogCU1JUElfRFNJX0RDU19MT05HX1dSSVRFCQkJ
CT0gMHgzOSwKIAogCU1JUElfRFNJX1BJQ1RVUkVfUEFSQU1FVEVSX1NFVAkJCT0gMHgwYSwKKwlN
SVBJX0RTSV9DT01QUkVTU0VEX1BJWEVMX1NUUkVBTQkJPSAweDBiLAogCiAJTUlQSV9EU0lfTE9P
U0VMWV9QQUNLRURfUElYRUxfU1RSRUFNX1lDQkNSMjAJPSAweDBjLAogCU1JUElfRFNJX1BBQ0tF
RF9QSVhFTF9TVFJFQU1fWUNCQ1IyNAkJPSAweDFjLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
