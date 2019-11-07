Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE90F2930
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 09:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D486EEF9;
	Thu,  7 Nov 2019 08:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C236EEEE
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 08:34:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 113B7AD35;
 Thu,  7 Nov 2019 08:34:07 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, sam@ravnborg.org,
 yc_chen@aspeedtech.com
Subject: [PATCH v2 1/9] drm/ast: Remove last traces of struct ast_gem_object
Date: Thu,  7 Nov 2019 09:33:56 +0100
Message-Id: <20191107083404.6852-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107083404.6852-1-tzimmermann@suse.de>
References: <20191107083404.6852-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGFzdCBkcml2ZXIgaGFzIHN3aXRjaGVkIHRvIHN0cnVjdCBkcm1fdnJhbV9nZW1fb2JqZWN0
IGEgd2hpbGUgYWdvLgpUaGlzIHBhdGNoIHJlbW92ZXMgYSBmdW5jdGlvbiBhbmQgZm9yd2FyZCBk
ZWNsYXJhdGlvbiB0aGF0IHdlcmUgZm9yZ290dGVuCmJlZm9yZS4KClNpZ25lZC1vZmYtYnk6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpBY2tlZC1ieTogR2VyZCBIb2Zm
bWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2
LmggIHwgIDYgLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMgfCAyNCAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMzAgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmggYi9kcml2ZXJzL2dwdS9k
cm0vYXN0L2FzdF9kcnYuaAppbmRleCBmZjE2MWJkNjIyZjMuLmY0NDE1MGZmNTQ4MyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FzdC9hc3RfZHJ2LmgKQEAgLTEzNyw4ICsxMzcsNiBAQCBzdHJ1Y3QgYXN0X3ByaXZhdGUgewog
aW50IGFzdF9kcml2ZXJfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBsb25n
IGZsYWdzKTsKIHZvaWQgYXN0X2RyaXZlcl91bmxvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRldik7
CiAKLXN0cnVjdCBhc3RfZ2VtX29iamVjdDsKLQogI2RlZmluZSBBU1RfSU9fQVJfUE9SVF9XUklU
RQkJKDB4NDApCiAjZGVmaW5lIEFTVF9JT19NSVNDX1BPUlRfV1JJVEUJCSgweDQyKQogI2RlZmlu
ZSBBU1RfSU9fVkdBX0VOQUJMRV9QT1JUCQkoMHg0MykKQEAgLTI4OSwxMCArMjg3LDYgQEAgZXh0
ZXJuIHZvaWQgYXN0X21vZGVfZmluaShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KTsKIGludCBhc3Rf
bW1faW5pdChzdHJ1Y3QgYXN0X3ByaXZhdGUgKmFzdCk7CiB2b2lkIGFzdF9tbV9maW5pKHN0cnVj
dCBhc3RfcHJpdmF0ZSAqYXN0KTsKIAotaW50IGFzdF9nZW1fY3JlYXRlKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsCi0JCSAgIHUzMiBzaXplLCBib29sIGlza2VybmVsLAotCQkgICBzdHJ1Y3QgZHJt
X2dlbV9vYmplY3QgKipvYmopOwotCiAvKiBhc3QgcG9zdCAqLwogdm9pZCBhc3RfZW5hYmxlX3Zn
YShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KTsKIHZvaWQgYXN0X2VuYWJsZV9tbWlvKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFp
bi5jIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jCmluZGV4IDIxNzE1ZDZhOWI1Ni4u
M2E5YjRjYjczZjJmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jCkBAIC01MzUsMjcgKzUzNSwzIEBA
IHZvaWQgYXN0X2RyaXZlcl91bmxvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAlwY2lfaW91
bm1hcChkZXYtPnBkZXYsIGFzdC0+cmVncyk7CiAJa2ZyZWUoYXN0KTsKIH0KLQotaW50IGFzdF9n
ZW1fY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCi0JCSAgIHUzMiBzaXplLCBib29sIGlz
a2VybmVsLAotCQkgICBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKipvYmopCi17Ci0Jc3RydWN0IGRy
bV9nZW1fdnJhbV9vYmplY3QgKmdibzsKLQlpbnQgcmV0OwotCi0JKm9iaiA9IE5VTEw7Ci0KLQlz
aXplID0gcm91bmR1cChzaXplLCBQQUdFX1NJWkUpOwotCWlmIChzaXplID09IDApCi0JCXJldHVy
biAtRUlOVkFMOwotCi0JZ2JvID0gZHJtX2dlbV92cmFtX2NyZWF0ZShkZXYsICZkZXYtPnZyYW1f
bW0tPmJkZXYsIHNpemUsIDAsIGZhbHNlKTsKLQlpZiAoSVNfRVJSKGdibykpIHsKLQkJcmV0ID0g
UFRSX0VSUihnYm8pOwotCQlpZiAocmV0ICE9IC1FUkVTVEFSVFNZUykKLQkJCURSTV9FUlJPUigi
ZmFpbGVkIHRvIGFsbG9jYXRlIEdFTSBvYmplY3RcbiIpOwotCQlyZXR1cm4gcmV0OwotCX0KLQkq
b2JqID0gJmdiby0+Ym8uYmFzZTsKLQlyZXR1cm4gMDsKLX0KLS0gCjIuMjMuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
