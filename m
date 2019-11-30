Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE72E10DDE6
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 15:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9996E157;
	Sat, 30 Nov 2019 14:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761426E14A
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2019 14:52:03 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2005)
 id 8952C68BE1; Sat, 30 Nov 2019 15:52:00 +0100 (CET)
From: Torsten Duwe <duwe@lst.de>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge: analogix-anx6345: Fix drm_dp_link helper removal
Message-Id: <20191130145200.8952C68BE1@verein.lst.de>
Date: Sat, 30 Nov 2019 15:52:00 +0100 (CET)
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
Cc: Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtX2RwX2xpbmtfcmF0ZV90b19id19jb2RlIGFuZCAuLi5id19jb2RlX3RvX2xpbmtfcmF0ZSBz
aW1wbHkgZGl2aWRlIGJ5CmFuZCBtdWx0aXBseSB3aXRoIDI3MDAwLCByZXNwZWN0aXZlbHkuIEF2
b2lkIGFuIG92ZXJmbG93IGluIHRoZSB1OCBkcGNkWzBdCmFuZCB0aGUgbXVsdGlwbHkrZGl2aWRl
IGFsbHRvZ2V0aGVyLgoKZml4ZXM6IGUxY2ZmODJjMTA5N2JkYTI0NzggKCJmaXggYW54NjM0NSBj
b21waWxhdGlvbiBmb3IgdjUuNSIpClNpZ25lZC1vZmYtYnk6IFRvcnN0ZW4gRHV3ZSA8ZHV3ZUBz
dXNlLmRlPgotLS0KU2FtZSBhcyA3OHh4IGJlZm9yZS4gQ29kZSBjb3BpZWQgb3ZlciBpbiBhIHJ1
c2gsIG5vdCByZWFsaXNpbmcKaXQgd2FzIGJyb2tlbiBieSBpdHNlbGYuCgotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDYzNDUuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDYzNDUuYwpAQCAtMjEwLDEwICsy
MTAsOSBAQCBzdGF0aWMgaW50IGFueDYzNDVfZHBfbGlua190cmFpbmluZyhzdHJ1Y3QgYW54NjM0
NSAqYW54NjM0NSkKIAlpZiAoZXJyKQogCQlyZXR1cm4gZXJyOwogCi0JZHBjZFswXSA9IGRybV9k
cF9tYXhfbGlua19yYXRlKGFueDYzNDUtPmRwY2QpOwotCWRwY2RbMF0gPSBkcm1fZHBfbGlua19y
YXRlX3RvX2J3X2NvZGUoZHBjZFswXSk7CiAJZXJyID0gcmVnbWFwX3dyaXRlKGFueDYzNDUtPm1h
cFtJMkNfSURYX0RQVFhdLAotCQkJICAgU1BfRFBfTUFJTl9MSU5LX0JXX1NFVF9SRUcsIGRwY2Rb
MF0pOworCQkJICAgU1BfRFBfTUFJTl9MSU5LX0JXX1NFVF9SRUcsCisJCQkgICBhbng2MzQ1LT5k
cGNkW0RQX01BWF9MSU5LX1JBVEVdKTsKIAlpZiAoZXJyKQogCQlyZXR1cm4gZXJyOwogCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
