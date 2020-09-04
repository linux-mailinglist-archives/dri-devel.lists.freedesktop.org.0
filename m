Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C148025D7EF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 13:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C9C6EB4D;
	Fri,  4 Sep 2020 11:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5916EB4D;
 Fri,  4 Sep 2020 11:54:04 +0000 (UTC)
IronPort-SDR: 7ZnLyrq4Nq/idX5dijE10//j3MPNfvOJDWTW/8ft/sE2bU5ScZT2SJMag5o5ZSX6FmeqGrnXXt
 cvl78W+PKWSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="158705791"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="158705791"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 04:54:03 -0700
IronPort-SDR: 6vEE2l4bnznbn7v9qUDmS6e/EIzJdeRvUvUfOAVOwP5mSaaOuD1p02TWiyzqpFUeUi9FlrXdXa
 nvykfrwuQxNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="315819254"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 04 Sep 2020 04:54:01 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Sep 2020 14:54:00 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 02/18] drm/i915/lspcon: Do not send infoframes to non-HDMI
 sinks
Date: Fri,  4 Sep 2020 14:53:38 +0300
Message-Id: <20200904115354.25336-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
References: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCk5v
bi1IRE1JIHNpbmtzIHNob3VsZG4ndCBiZSBzZW50IGluZm9mcmFtZXMuIENoZWNrIGZvciB0aGF0
IHdoZW4KdXNpbmcgTFNQQ09OLgoKRklYTUU6IEhvdyBkbyB3ZSB0dXJuIG9mZiBpbmZvZnJhbWVz
IG9uY2UgZW5hYmxlZD8gRG8gd2UgZXZlbgogICAgICAgaGF2ZSB0bz8KClNpZ25lZC1vZmYtYnk6
IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYyAgICAgICAgICAgfCAxMCArKysr
LS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMu
aCB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyAgICAgICAg
ICAgIHwgIDcgKysrKysrLQogMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA3IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGRpLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jCmluZGV4
IDZhZjA4MDU0MmM5Ni4uMjhmZjg1NDkzZjI1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZGRpLmMKQEAgLTM1ODEsMTkgKzM1ODEsMTcgQEAgc3RhdGljIHZvaWQgaW50ZWxf
ZGRpX3ByZV9lbmFibGUoc3RydWN0IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsCiAJCWludGVs
X2RkaV9wcmVfZW5hYmxlX2hkbWkoc3RhdGUsIGVuY29kZXIsIGNydGNfc3RhdGUsCiAJCQkJCSAg
Y29ubl9zdGF0ZSk7CiAJfSBlbHNlIHsKLQkJc3RydWN0IGludGVsX2xzcGNvbiAqbHNwY29uID0K
LQkJCQllbmNfdG9faW50ZWxfbHNwY29uKGVuY29kZXIpOworCQlzdHJ1Y3QgaW50ZWxfZGlnaXRh
bF9wb3J0ICpkaWdfcG9ydCA9IGVuY190b19kaWdfcG9ydChlbmNvZGVyKTsKIAogCQlpbnRlbF9k
ZGlfcHJlX2VuYWJsZV9kcChzdGF0ZSwgZW5jb2RlciwgY3J0Y19zdGF0ZSwKIAkJCQkJY29ubl9z
dGF0ZSk7Ci0JCWlmIChsc3Bjb24tPmFjdGl2ZSkgewotCQkJc3RydWN0IGludGVsX2RpZ2l0YWxf
cG9ydCAqZGlnX3BvcnQgPQotCQkJCQllbmNfdG9fZGlnX3BvcnQoZW5jb2Rlcik7CiAKKwkJLyog
RklYTUUgcHJlY29tcHV0ZSBldmVyeXRoaW5nIHByb3Blcmx5ICovCisJCS8qIEZJWE1FIGhvdyBk
byB3ZSB0dXJuIGluZm9mcmFtZXMgb2ZmIGFnYWluPyAqLworCQlpZiAoZGlnX3BvcnQtPmxzcGNv
bi5hY3RpdmUgJiYgZGlnX3BvcnQtPmRwLmhhc19oZG1pX3NpbmspCiAJCQlkaWdfcG9ydC0+c2V0
X2luZm9mcmFtZXMoZW5jb2RlciwKIAkJCQkJCSBjcnRjX3N0YXRlLT5oYXNfaW5mb2ZyYW1lLAog
CQkJCQkJIGNydGNfc3RhdGUsIGNvbm5fc3RhdGUpOwotCQl9CiAJfQogfQogCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5oCmluZGV4IDQx
M2I2MDMzN2EwYi4uNmYzYTNkZGU5OWM4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaApAQCAtMTI3Nyw2ICsxMjc3LDcgQEAgc3Ry
dWN0IGludGVsX2RwIHsKIAl1OCBzaW5rX2NvdW50OwogCWJvb2wgbGlua19tc3Q7CiAJYm9vbCBs
aW5rX3RyYWluZWQ7CisJYm9vbCBoYXNfaGRtaV9zaW5rOwogCWJvb2wgaGFzX2F1ZGlvOwogCWJv
b2wgcmVzZXRfbGlua19wYXJhbXM7CiAJdTggZHBjZFtEUF9SRUNFSVZFUl9DQVBfU0laRV07CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKaW5kZXggOGE2NzNkMGQ3MDUxLi42
MGJmMDFhOGI0YWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKQEAg
LTYwNjksNyArNjA2OSwxMSBAQCBpbnRlbF9kcF9zZXRfZWRpZChzdHJ1Y3QgaW50ZWxfZHAgKmlu
dGVsX2RwKQogCWVkaWQgPSBpbnRlbF9kcF9nZXRfZWRpZChpbnRlbF9kcCk7CiAJaW50ZWxfY29u
bmVjdG9yLT5kZXRlY3RfZWRpZCA9IGVkaWQ7CiAKLQlpbnRlbF9kcC0+aGFzX2F1ZGlvID0gZHJt
X2RldGVjdF9tb25pdG9yX2F1ZGlvKGVkaWQpOworCWlmIChlZGlkICYmIGVkaWQtPmlucHV0ICYg
RFJNX0VESURfSU5QVVRfRElHSVRBTCkgeworCQlpbnRlbF9kcC0+aGFzX2hkbWlfc2luayA9IGRy
bV9kZXRlY3RfaGRtaV9tb25pdG9yKGVkaWQpOworCQlpbnRlbF9kcC0+aGFzX2F1ZGlvID0gZHJt
X2RldGVjdF9tb25pdG9yX2F1ZGlvKGVkaWQpOworCX0KKwogCWRybV9kcF9jZWNfc2V0X2VkaWQo
JmludGVsX2RwLT5hdXgsIGVkaWQpOwogCWludGVsX2RwLT5lZGlkX3F1aXJrcyA9IGRybV9kcF9n
ZXRfZWRpZF9xdWlya3MoZWRpZCk7CiB9CkBAIC02MDgzLDYgKzYwODcsNyBAQCBpbnRlbF9kcF91
bnNldF9lZGlkKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApCiAJa2ZyZWUoaW50ZWxfY29ubmVj
dG9yLT5kZXRlY3RfZWRpZCk7CiAJaW50ZWxfY29ubmVjdG9yLT5kZXRlY3RfZWRpZCA9IE5VTEw7
CiAKKwlpbnRlbF9kcC0+aGFzX2hkbWlfc2luayA9IGZhbHNlOwogCWludGVsX2RwLT5oYXNfYXVk
aW8gPSBmYWxzZTsKIAlpbnRlbF9kcC0+ZWRpZF9xdWlya3MgPSAwOwogfQotLSAKMi4yNi4yCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
