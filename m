Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C08111E95A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 18:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66E66EBA4;
	Fri, 13 Dec 2019 17:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66A36EBA6;
 Fri, 13 Dec 2019 17:44:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 09:44:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; d="scan'208";a="296989158"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 13 Dec 2019 09:44:00 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 13 Dec 2019 19:43:59 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/4] drm/edid: Throw away the dummy VIC 0 cea mode
Date: Fri, 13 Dec 2019 19:43:47 +0200
Message-Id: <20191213174348.27261-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191213174348.27261-1-ville.syrjala@linux.intel.com>
References: <20191213174348.27261-1-ville.syrjala@linux.intel.com>
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
Cc: Hans Verkuil <hansverk@cisco.com>,
 Manasi Navare <manasi.d.navare@intel.com>, intel-gfx@lists.freedesktop.org,
 Tom Anderson <thomasanderson@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCk5v
dyB0aGF0IHRoZSBjZWEgbW9kZSBoYW5kbGluZyBpcyBub3QgMTAwJSB0aWVkIHRvIHRoZSBzaW5n
bGUKYXJyYXkgdGhlIGR1bW15IFZJQyAwIG1vZGUgaXMgcHJldHR5IG11Y2ggcG9pbnRsZXMuIFRo
cm93IGl0Cm91dC4KCnYyOiBSZWJhc2UKCkNjOiBUb20gQW5kZXJzb24gPHRob21hc2FuZGVyc29u
QGdvb2dsZS5jb20+CkNjOiBIYW5zIFZlcmt1aWwgPGhhbnN2ZXJrQGNpc2NvLmNvbT4KQ2M6IE1h
bmFzaSBOYXZhcmUgPG1hbmFzaS5kLm5hdmFyZUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IFZp
bGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2RybV9lZGlkLmMgfCAxMiArKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9lZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwppbmRleCAyNzg3YWQw
ZWY4ODEuLjhiYzY5ZGE1M2MyZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlk
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKQEAgLTcxNCw5ICs3MTQsNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IG1pbmltb2RlIGV4dHJhX21vZGVzW10gPSB7CiAgKgogICogRG8g
bm90IGFjY2VzcyBkaXJlY3RseSwgaW5zdGVhZCBhbHdheXMgdXNlIGNlYV9tb2RlX2Zvcl92aWMo
KS4KICAqLwotc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIGVkaWRfY2VhX21v
ZGVzXzBbXSA9IHsKLQkvKiAwIC0gZHVtbXksIFZJQ3Mgc3RhcnQgYXQgMSAqLwotCXsgfSwKK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBlZGlkX2NlYV9tb2Rlc18xW10gPSB7
CiAJLyogMSAtIDY0MHg0ODBANjBIeiA0OjMgKi8KIAl7IERSTV9NT0RFKCI2NDB4NDgwIiwgRFJN
X01PREVfVFlQRV9EUklWRVIsIDI1MTc1LCA2NDAsIDY1NiwKIAkJICAgNzUyLCA4MDAsIDAsIDQ4
MCwgNDkwLCA0OTIsIDUyNSwgMCwKQEAgLTMyMTUsMTAgKzMyMTMsOCBAQCBzdGF0aWMgdTggKmRy
bV9maW5kX2NlYV9leHRlbnNpb24oY29uc3Qgc3RydWN0IGVkaWQgKmVkaWQpCiAKIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqY2VhX21vZGVfZm9yX3ZpYyh1OCB2aWMpCiB7
Ci0JaWYgKCF2aWMpCi0JCXJldHVybiBOVUxMOwotCWlmICh2aWMgPCBBUlJBWV9TSVpFKGVkaWRf
Y2VhX21vZGVzXzApKQotCQlyZXR1cm4gJmVkaWRfY2VhX21vZGVzXzBbdmljXTsKKwlpZiAodmlj
ID49IDEgJiYgdmljIDwgMSArIEFSUkFZX1NJWkUoZWRpZF9jZWFfbW9kZXNfMSkpCisJCXJldHVy
biAmZWRpZF9jZWFfbW9kZXNfMVt2aWMgLSAxXTsKIAlpZiAodmljID49IDE5MyAmJiB2aWMgPCAx
OTMgKyBBUlJBWV9TSVpFKGVkaWRfY2VhX21vZGVzXzE5MykpCiAJCXJldHVybiAmZWRpZF9jZWFf
bW9kZXNfMTkzW3ZpYyAtIDE5M107CiAJcmV0dXJuIE5VTEw7CkBAIC0zMjMxLDcgKzMyMjcsNyBA
QCBzdGF0aWMgdTggY2VhX251bV92aWNzKHZvaWQpCiAKIHN0YXRpYyB1OCBjZWFfbmV4dF92aWMo
dTggdmljKQogewotCWlmICgrK3ZpYyA9PSBBUlJBWV9TSVpFKGVkaWRfY2VhX21vZGVzXzApKQor
CWlmICgrK3ZpYyA9PSAxICsgQVJSQVlfU0laRShlZGlkX2NlYV9tb2Rlc18xKSkKIAkJdmljID0g
MTkzOwogCXJldHVybiB2aWM7CiB9Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
