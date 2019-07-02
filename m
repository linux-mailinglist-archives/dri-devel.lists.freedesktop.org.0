Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3570E5CEC9
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 13:50:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4495289A98;
	Tue,  2 Jul 2019 11:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6721889A98
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 11:50:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7C231B14D;
 Tue,  2 Jul 2019 11:50:17 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
 zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, hdegoede@redhat.com, emil.l.velikov@gmail.com
Subject: [PATCH v3 1/5] drm/vram: Set GEM object functions for PRIME
Date: Tue,  2 Jul 2019 13:50:08 +0200
Message-Id: <20190702115012.4418-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190702115012.4418-1-tzimmermann@suse.de>
References: <20190702115012.4418-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UFJJTUUgZnVuY3Rpb25hbGl0eSBpcyBub3cgcHJvdmlkZWQgdmlhIHRoZSBjYWxsYmFjayBmdW5j
dGlvbnMgaW4Kc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNzLiBUaGUgZHJpdmVyLXN0cnVjdHVy
ZSBmdW5jdGlvbnMgYXJlIG9ic29sZXRlLgpBcyBhIHNpZGUgZWZmZWN0IG9mIHRoaXMgcGF0Y2gs
IFZSQU0tYmFzZWQgZHJpdmVycyBnZXQgYmFzaWMgUFJJTUUKc3VwcG9ydCBhdXRvbWF0aWNhbGx5
IHdpdGhvdXQgaGF2aW5nIHRvIHNldCBhbnkgZmxhZ3Mgb3IgYWRkaXRpb25hbApmaWVsZHMuCgp2
MjoKCS0gdXNlIGV4aXN0aW5nIFBSSU1FIGZ1bmN0aW9ucyBmb3Igb2JqZWN0J3MgdGFibGUKdjM6
CgktIG1vdmUgb2JqZWN0IHRhYmxlIHRvIEVPRiBzbyBpdCBjYW4gcmVmZXIgdG8gaW50ZXJuYWwg
aW50ZXJmYWNlcwoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+ClJldmlld2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJv
cmEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgfCAxNyAr
KysrKysrKysrKysrKysrKwogaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5oICAgICB8
ICAzICsrLQogMiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKaW5kZXggNGRlNzgyY2EyNmIyLi4y
MmJjNjk4OWMxYzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVs
cGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYwpAQCAtNyw2
ICs3LDggQEAKICNpbmNsdWRlIDxkcm0vZHJtX3ZyYW1fbW1faGVscGVyLmg+CiAjaW5jbHVkZSA8
ZHJtL3R0bS90dG1fcGFnZV9hbGxvYy5oPgogCitzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9nZW1f
b2JqZWN0X2Z1bmNzIGRybV9nZW1fdnJhbV9vYmplY3RfZnVuY3M7CisKIC8qKgogICogRE9DOiBv
dmVydmlldwogICoKQEAgLTgwLDYgKzgyLDkgQEAgc3RhdGljIGludCBkcm1fZ2VtX3ZyYW1faW5p
dChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCWludCByZXQ7CiAJc2l6ZV90IGFjY19zaXplOwog
CisJaWYgKCFnYm8tPmdlbS5mdW5jcykKKwkJZ2JvLT5nZW0uZnVuY3MgPSAmZHJtX2dlbV92cmFt
X29iamVjdF9mdW5jczsKKwogCXJldCA9IGRybV9nZW1fb2JqZWN0X2luaXQoZGV2LCAmZ2JvLT5n
ZW0sIHNpemUpOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CkBAIC02MzksMyArNjQ0LDE1IEBA
IGludCBkcm1fZ2VtX3ZyYW1fZHJpdmVyX2dlbV9wcmltZV9tbWFwKHN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqZ2VtLAogCXJldHVybiBkcm1fZ2VtX3ByaW1lX21tYXAoZ2VtLCB2bWEpOwogfQogRVhQ
T1JUX1NZTUJPTChkcm1fZ2VtX3ZyYW1fZHJpdmVyX2dlbV9wcmltZV9tbWFwKTsKKworLyoKKyAq
IEdFTSBvYmplY3QgZnVuY3MKKyAqLworCitzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9nZW1fb2Jq
ZWN0X2Z1bmNzIGRybV9nZW1fdnJhbV9vYmplY3RfZnVuY3MgPSB7CisJLmZyZWUJPSBkcm1fZ2Vt
X3ZyYW1fZHJpdmVyX2dlbV9mcmVlX29iamVjdF91bmxvY2tlZCwKKwkucGluCT0gZHJtX2dlbV92
cmFtX2RyaXZlcl9nZW1fcHJpbWVfcGluLAorCS51bnBpbgk9IGRybV9nZW1fdnJhbV9kcml2ZXJf
Z2VtX3ByaW1lX3VucGluLAorCS52bWFwCT0gZHJtX2dlbV92cmFtX2RyaXZlcl9nZW1fcHJpbWVf
dm1hcCwKKwkudnVubWFwCT0gZHJtX2dlbV92cmFtX2RyaXZlcl9nZW1fcHJpbWVfdnVubWFwCit9
OwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5oIGIvaW5jbHVk
ZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5oCmluZGV4IDFhMGVhMThlN2E3NC4uYmM4ZmU5ZmVl
ZTNiIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmgKKysrIGIv
aW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5oCkBAIC0xMjcsNyArMTI3LDggQEAgaW50
IGRybV9nZW1fdnJhbV9kcml2ZXJfZHVtYl9tbWFwX29mZnNldChzdHJ1Y3QgZHJtX2ZpbGUgKmZp
bGUsCiAJLmdlbV9mcmVlX29iamVjdF91bmxvY2tlZCA9IFwKIAkJZHJtX2dlbV92cmFtX2RyaXZl
cl9nZW1fZnJlZV9vYmplY3RfdW5sb2NrZWQsIFwKIAkuZHVtYl9jcmVhdGUJCSAgPSBkcm1fZ2Vt
X3ZyYW1fZHJpdmVyX2R1bWJfY3JlYXRlLCBcCi0JLmR1bWJfbWFwX29mZnNldAkgID0gZHJtX2dl
bV92cmFtX2RyaXZlcl9kdW1iX21tYXBfb2Zmc2V0CisJLmR1bWJfbWFwX29mZnNldAkgID0gZHJt
X2dlbV92cmFtX2RyaXZlcl9kdW1iX21tYXBfb2Zmc2V0LCBcCisJLmdlbV9wcmltZV9tbWFwCQkg
ID0gZHJtX2dlbV9wcmltZV9tbWFwCiAKIC8qCiAgKiBQUklNRSBoZWxwZXJzIGZvciBzdHJ1Y3Qg
ZHJtX2RyaXZlcgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
