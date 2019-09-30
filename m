Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98185C2255
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 15:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A71B6E437;
	Mon, 30 Sep 2019 13:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE1A6E030;
 Mon, 30 Sep 2019 13:42:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Sep 2019 06:42:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,567,1559545200"; d="scan'208";a="191145244"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 30 Sep 2019 06:42:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 30 Sep 2019 16:42:18 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/rect: Add drm_rect_init()
Date: Mon, 30 Sep 2019 16:42:12 +0300
Message-Id: <20190930134214.24702-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190930134214.24702-1-ville.syrjala@linux.intel.com>
References: <20190930134214.24702-1-ville.syrjala@linux.intel.com>
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkFk
ZCBhIGhlbHBlciB0byBpbml0aWFsaXplIGEgcmVjdGFuZ2xlIGZyb20geC95L3cvaCBpbmZvcm1h
dGlvbi4KClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51
eC5pbnRlbC5jb20+Ci0tLQogaW5jbHVkZS9kcm0vZHJtX3JlY3QuaCB8IDE3ICsrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvZHJtL2RybV9yZWN0LmggYi9pbmNsdWRlL2RybS9kcm1fcmVjdC5oCmluZGV4IGZjN2Mx
NDYyN2VlMi4uY2QwMTA2MTM1YjZhIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fcmVjdC5o
CisrKyBiL2luY2x1ZGUvZHJtL2RybV9yZWN0LmgKQEAgLTY5LDYgKzY5LDIzIEBAIHN0cnVjdCBk
cm1fcmVjdCB7CiAJCShyKS0+eDEgPj4gMTYsICgoKHIpLT54MSAmIDB4ZmZmZikgKiAxNTYyNSkg
Pj4gMTAsIFwKIAkJKHIpLT55MSA+PiAxNiwgKCgociktPnkxICYgMHhmZmZmKSAqIDE1NjI1KSA+
PiAxMAogCisvKioKKyAqIGRybV9yZWN0X2luaXQgLSBpbml0aWFsaXplIHRoZSByZWN0YW5nbGUg
ZnJvbSB4L3kvdy9oCisgKiBAcjogcmVjdGFuZ2xlCisgKiBAeDogeCBjb29yZGluYXRlCisgKiBA
eTogeSBjb29yZGluYXRlCisgKiBAd2lkdGg6IHdpZHRoCisgKiBAaGVpZ2h0OiBoZWlnaHQKKyAq
Lworc3RhdGljIGlubGluZSB2b2lkIGRybV9yZWN0X2luaXQoc3RydWN0IGRybV9yZWN0ICpyLCBp
bnQgeCwgaW50IHksCisJCQkJIGludCB3aWR0aCwgaW50IGhlaWdodCkKK3sKKwlyLT54MSA9IHg7
CisJci0+eTEgPSB5OworCXItPngyID0geCArIHdpZHRoOworCXItPnkyID0geSArIGhlaWdodDsK
K30KKwogLyoqCiAgKiBkcm1fcmVjdF9hZGp1c3Rfc2l6ZSAtIGFkanVzdCB0aGUgc2l6ZSBvZiB0
aGUgcmVjdGFuZ2xlCiAgKiBAcjogcmVjdGFuZ2xlIHRvIGJlIGFkanVzdGVkCi0tIAoyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
