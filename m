Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D27E5CA42
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 10:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C388889A5C;
	Tue,  2 Jul 2019 08:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2741589A5C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 08:01:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 635D1B090;
 Tue,  2 Jul 2019 08:01:47 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
 zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, hdegoede@redhat.com
Subject: [PATCH v2 1/5] drm/vram: Set GEM object functions for PRIME
Date: Tue,  2 Jul 2019 10:01:35 +0200
Message-Id: <20190702080139.21814-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190702080139.21814-1-tzimmermann@suse.de>
References: <20190702080139.21814-1-tzimmermann@suse.de>
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

UFJJTUUgZnVuY3Rpb25hbGl0eSBpcyBub3cgcHJvdmlkZWQgdmlhIHRoZSBjYWxsYmFjayBmdW5j
dGlvbnMgaW4Kc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNzLiBUaGUgZHJpdmVyLXN0cnVjdHVy
ZSBmdW5jdGlvbnMgYXJlIG9ic29sZXRlLgpBcyBhIHNpZGUgZWZmZWN0IG9mIHRoaXMgcGF0Y2gs
IFZSQU0tYmFzZWQgZHJpdmVycyBnZXQgYmFzaWMgUFJJTUUKc3VwcG9ydCBhdXRvbWF0aWNhbGx5
IHdpdGhvdXQgaGF2aW5nIHRvIHNldCBhbnkgZmxhZ3Mgb3IgYWRkaXRpb25hbApmaWVsZHMuCgp2
MjoKCS0gdXNlIGV4aXN0aW5nIFBSSU1FIGZ1bmN0aW9ucyBmb3Igb2JqZWN0J3MgdGFibGUKClNp
Z25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgfCAxNSArKysrKysrKysrKysr
KysKIGluY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaCAgICAgfCAgMyArKy0KIDIgZmls
ZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbV92cmFtX2hlbHBlci5jCmluZGV4IDRkZTc4MmNhMjZiMi4uYjc3NWZhZjYzMmVkIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKQEAgLTE0LDYgKzE0LDE4IEBACiAg
KiAoVlJBTSkuIEl0IGNhbiBiZSB1c2VkIGZvciBmcmFtZWJ1ZmZlciBkZXZpY2VzIHdpdGggZGVk
aWNhdGVkIG1lbW9yeS4KICAqLwogCisvKgorICogR0VNIG9iamVjdCBmdW5jcworICovCisKK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MgZHJtX2dlbV92cmFtX29iamVj
dF9mdW5jcyA9IHsKKwkuZnJlZQk9IGRybV9nZW1fdnJhbV9kcml2ZXJfZ2VtX2ZyZWVfb2JqZWN0
X3VubG9ja2VkLAorCS5waW4JPSBkcm1fZ2VtX3ZyYW1fZHJpdmVyX2dlbV9wcmltZV9waW4sCisJ
LnVucGluCT0gZHJtX2dlbV92cmFtX2RyaXZlcl9nZW1fcHJpbWVfdW5waW4sCisJLnZtYXAJPSBk
cm1fZ2VtX3ZyYW1fZHJpdmVyX2dlbV9wcmltZV92bWFwLAorCS52dW5tYXAJPSBkcm1fZ2VtX3Zy
YW1fZHJpdmVyX2dlbV9wcmltZV92dW5tYXAKK307CisKIC8qCiAgKiBCdWZmZXItb2JqZWN0cyBo
ZWxwZXJzCiAgKi8KQEAgLTgwLDYgKzkyLDkgQEAgc3RhdGljIGludCBkcm1fZ2VtX3ZyYW1faW5p
dChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCWludCByZXQ7CiAJc2l6ZV90IGFjY19zaXplOwog
CisJaWYgKCFnYm8tPmdlbS5mdW5jcykKKwkJZ2JvLT5nZW0uZnVuY3MgPSAmZHJtX2dlbV92cmFt
X29iamVjdF9mdW5jczsKKwogCXJldCA9IGRybV9nZW1fb2JqZWN0X2luaXQoZGV2LCAmZ2JvLT5n
ZW0sIHNpemUpOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CmRpZmYgLS1naXQgYS9pbmNsdWRl
L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVs
cGVyLmgKaW5kZXggMWEwZWExOGU3YTc0Li5iYzhmZTlmZWVlM2IgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZ2VtX3Zy
YW1faGVscGVyLmgKQEAgLTEyNyw3ICsxMjcsOCBAQCBpbnQgZHJtX2dlbV92cmFtX2RyaXZlcl9k
dW1iX21tYXBfb2Zmc2V0KHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwKIAkuZ2VtX2ZyZWVfb2JqZWN0
X3VubG9ja2VkID0gXAogCQlkcm1fZ2VtX3ZyYW1fZHJpdmVyX2dlbV9mcmVlX29iamVjdF91bmxv
Y2tlZCwgXAogCS5kdW1iX2NyZWF0ZQkJICA9IGRybV9nZW1fdnJhbV9kcml2ZXJfZHVtYl9jcmVh
dGUsIFwKLQkuZHVtYl9tYXBfb2Zmc2V0CSAgPSBkcm1fZ2VtX3ZyYW1fZHJpdmVyX2R1bWJfbW1h
cF9vZmZzZXQKKwkuZHVtYl9tYXBfb2Zmc2V0CSAgPSBkcm1fZ2VtX3ZyYW1fZHJpdmVyX2R1bWJf
bW1hcF9vZmZzZXQsIFwKKwkuZ2VtX3ByaW1lX21tYXAJCSAgPSBkcm1fZ2VtX3ByaW1lX21tYXAK
IAogLyoKICAqIFBSSU1FIGhlbHBlcnMgZm9yIHN0cnVjdCBkcm1fZHJpdmVyCi0tIAoyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
