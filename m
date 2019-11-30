Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F304E10DDE5
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 15:52:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5436E145;
	Sat, 30 Nov 2019 14:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7048E6E145
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2019 14:52:00 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2005)
 id 86B0F68BE1; Sat, 30 Nov 2019 15:51:55 +0100 (CET)
From: Torsten Duwe <duwe@lst.de>
To: Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge: analogix-anx78xx: Fix drm_dp_link helper removal
Message-Id: <20191130145155.86B0F68BE1@verein.lst.de>
Date: Sat, 30 Nov 2019 15:51:55 +0100 (CET)
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
Cc: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtX2RwX2xpbmtfcmF0ZV90b19id19jb2RlIGFuZCAuLi5id19jb2RlX3RvX2xpbmtfcmF0ZSBz
aW1wbHkgZGl2aWRlIGJ5CmFuZCBtdWx0aXBseSB3aXRoIDI3MDAwLCByZXNwZWN0aXZlbHkuIEF2
b2lkIGFuIG92ZXJmbG93IGluIHRoZSB1OCBkcGNkWzBdCmFuZCB0aGUgbXVsdGlwbHkrZGl2aWRl
IGFsbHRvZ2V0aGVyLgoKZml4ZXM6IGZmMWU4ZmI2OGVhMDYwMjcgKCJhbmFsb2dpeC1hbng3OHh4
OiBBdm9pZCBkcm1fZHBfbGluayBoZWxwZXJzIikKU2lnbmVkLW9mZi1ieTogVG9yc3RlbiBEdXdl
IDxkdXdlQHN1c2UuZGU+Ci0tLQpIYXMgYW55Ym9keSBhY3R1YWxseSB0ZXN0ZWQgZmYxZThmYjY4
ZWEwNjAyNyA/IEkgY29waWVkIHRoYXQgY29kZSBpbiBnb29kCmZhaXRoIGZvciB0aGUgYW54NjM0
NSBhbmQgY2hhbmdlZCBhIGZldyBvdGhlciB0aGluZ3Mgc2ltdWx0YW5lb3VzbHksIGFuZApzcGVu
dCBzb21lIHRpbWUgd29uZGVyaW5nIHdoeSB0aGUgcGFuZWwgc3RheWVkIGRhcmsuCgotLS0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54Nzh4
eC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1hbng3OHh4LmMK
aW5kZXggNDE4NjdiZTAzNzUxLi44NjQ0MjNmNTlkNjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54Nzh4eC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54Nzh4eC5jCkBAIC03MjIsMTAgKzcyMiw5
IEBAIHN0YXRpYyBpbnQgYW54Nzh4eF9kcF9saW5rX3RyYWluaW5nKHN0cnVjdCBhbng3OHh4ICph
bng3OHh4KQogCWlmIChlcnIpCiAJCXJldHVybiBlcnI7CiAKLQlkcGNkWzBdID0gZHJtX2RwX21h
eF9saW5rX3JhdGUoYW54Nzh4eC0+ZHBjZCk7Ci0JZHBjZFswXSA9IGRybV9kcF9saW5rX3JhdGVf
dG9fYndfY29kZShkcGNkWzBdKTsKIAllcnIgPSByZWdtYXBfd3JpdGUoYW54Nzh4eC0+bWFwW0ky
Q19JRFhfVFhfUDBdLAotCQkJICAgU1BfRFBfTUFJTl9MSU5LX0JXX1NFVF9SRUcsIGRwY2RbMF0p
OworCQkJICAgU1BfRFBfTUFJTl9MSU5LX0JXX1NFVF9SRUcsCisJCQkgICBhbng3OHh4LT5kcGNk
W0RQX01BWF9MSU5LX1JBVEVdKTsKIAlpZiAoZXJyKQogCQlyZXR1cm4gZXJyOwogCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
