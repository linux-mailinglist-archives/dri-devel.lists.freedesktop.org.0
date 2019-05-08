Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7627A173A2
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 10:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C98895C8;
	Wed,  8 May 2019 08:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB9D89690
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 08:26:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C47CCAEC8;
 Wed,  8 May 2019 08:26:38 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
 christian.koenig@amd.com, ray.huang@amd.com, hdegoede@redhat.com,
 noralf@tronnes.org, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
 zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com
Subject: [PATCH v5 07/20] drm: Add default instance for VRAM MM callback
 functions
Date: Wed,  8 May 2019 10:26:17 +0200
Message-Id: <20190508082630.15116-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190508082630.15116-1-tzimmermann@suse.de>
References: <20190508082630.15116-1-tzimmermann@suse.de>
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
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VlJBTSBNTSBpcyBtb3N0IGxpa2VseSBiZSB1c2VkIHdpdGggR0VNIFZSQU0uIFRoZSBsYXR0ZXIg
bm93IHByb3ZpZGVzIHRoZQpyZXF1aXJlZCBpbnN0YW5jZSBvZiBzdHJ1Y3QgZHJtX3ZyYW1fbW1f
ZnVuY3MgZm9yIGRyaXZlcnMgdG8gdXNlLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJh
bV9oZWxwZXIuYyB8IDE0ICsrKysrKysrKysrKysrCiBpbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1f
aGVscGVyLmggICAgIHwgIDMgKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYwppbmRleCAxNWM2MTkzZTQ5ODUuLmMy
MWIxZjkyMGUwYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxw
ZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCkBAIC0zLDYg
KzMsNyBAQAogI2luY2x1ZGUgPGRybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmg+CiAjaW5jbHVkZSA8
ZHJtL2RybV9tb2RlLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wcmltZS5oPgorI2luY2x1ZGUgPGRy
bS9kcm1fdnJhbV9tbV9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vdHRtL3R0bV9wYWdlX2FsbG9j
Lmg+CiAKIC8qKgpAQCAtNTI0LDYgKzUyNSwxOSBAQCBpbnQgZHJtX2dlbV92cmFtX2JvX2RyaXZl
cl92ZXJpZnlfYWNjZXNzKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiB9CiBFWFBPUlRf
U1lNQk9MKGRybV9nZW1fdnJhbV9ib19kcml2ZXJfdmVyaWZ5X2FjY2Vzcyk7CiAKKy8qKgorICog
ZHJtX2dlbV92cmFtX21tX2Z1bmNzIC0gRnVuY3Rpb25zIGZvciAmc3RydWN0IGRybV92cmFtX21t
CisgKgorICogTW9zdCB1c2VycyBvZiBAc3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3Qgd2lsbCBh
bHNvIHVzZQorICogQHN0cnVjdCBkcm1fdnJhbV9tbS4gVGhpcyBpbnN0YW5jZSBvZiAmc3RydWN0
IGRybV92cmFtX21tX2Z1bmNzCisgKiBjYW4gYmUgdXNlZCB0byBjb25uZWN0IGJvdGguCisgKi8K
K2NvbnN0IHN0cnVjdCBkcm1fdnJhbV9tbV9mdW5jcyBkcm1fZ2VtX3ZyYW1fbW1fZnVuY3MgPSB7
CisJLmV2aWN0X2ZsYWdzID0gZHJtX2dlbV92cmFtX2JvX2RyaXZlcl9ldmljdF9mbGFncywKKwku
dmVyaWZ5X2FjY2VzcyA9IGRybV9nZW1fdnJhbV9ib19kcml2ZXJfdmVyaWZ5X2FjY2VzcworfTsK
K0VYUE9SVF9TWU1CT0woZHJtX2dlbV92cmFtX21tX2Z1bmNzKTsKKwogLyoKICAqIEhlbHBlcnMg
Zm9yIHN0cnVjdCBkcm1fZHJpdmVyCiAgKi8KZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9n
ZW1fdnJhbV9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaAppbmRl
eCA5YThiZDk4YjYyM2YuLjc5NzE2NTZhZmU4NyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJt
X2dlbV92cmFtX2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIu
aApAQCAtOSw2ICs5LDcgQEAKICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4gLyogZm9yIGNvbnRh
aW5lcl9vZigpICovCiAKIHN0cnVjdCBkcm1fbW9kZV9jcmVhdGVfZHVtYjsKK3N0cnVjdCBkcm1f
dnJhbV9tbV9mdW5jczsKIHN0cnVjdCBmaWxwOwogCiAjZGVmaW5lIERSTV9HRU1fVlJBTV9QTF9G
TEFHX1ZSQU0JVFRNX1BMX0ZMQUdfVlJBTQpAQCAtMTA3LDYgKzEwOCw4IEBAIHZvaWQgZHJtX2dl
bV92cmFtX2JvX2RyaXZlcl9ldmljdF9mbGFncyhzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJv
LAogaW50IGRybV9nZW1fdnJhbV9ib19kcml2ZXJfdmVyaWZ5X2FjY2VzcyhzdHJ1Y3QgdHRtX2J1
ZmZlcl9vYmplY3QgKmJvLAogCQkJCQkgc3RydWN0IGZpbGUgKmZpbHApOwogCitleHRlcm4gY29u
c3Qgc3RydWN0IGRybV92cmFtX21tX2Z1bmNzIGRybV9nZW1fdnJhbV9tbV9mdW5jczsKKwogLyoK
ICAqIEhlbHBlcnMgZm9yIHN0cnVjdCBkcm1fZHJpdmVyCiAgKi8KLS0gCjIuMjEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
