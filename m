Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4044596C3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 11:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15F26E8A2;
	Fri, 28 Jun 2019 09:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CF46E888
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 09:03:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 56078128B5;
 Fri, 28 Jun 2019 09:03:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2D011001B16;
 Fri, 28 Jun 2019 09:03:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4939B9D71; Fri, 28 Jun 2019 11:03:07 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 09/18] drm/vram: drop drm_gem_vram_driver_gem_prime_mmap
Date: Fri, 28 Jun 2019 11:02:54 +0200
Message-Id: <20190628090303.29467-10-kraxel@redhat.com>
In-Reply-To: <20190628090303.29467-1-kraxel@redhat.com>
References: <20190628090303.29467-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Fri, 28 Jun 2019 09:03:11 +0000 (UTC)
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
Cc: thomas@shipmail.org, tzimmermann@suse.de,
 Maxime Ripard <maxime.ripard@bootlin.com>, ckoenig.leichtzumerken@gmail.com,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>, Sean Paul <sean@poorly.run>,
 bskeggs@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHdyYXBwZXIgZG9lc24ndCBkbyBhbnl0aGluZyBhbnkgbW9yZSwgZHJvcCBpdC4KClNpZ25l
ZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpBY2tlZC1ieTogVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Ci0tLQogaW5jbHVkZS9kcm0vZHJt
X2dlbV92cmFtX2hlbHBlci5oICAgICB8ICA0ICstLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2Vt
X3ZyYW1faGVscGVyLmMgfCAxNyAtLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMjAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0v
ZHJtX2dlbV92cmFtX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5o
CmluZGV4IDI2MjdiYjYxODk3OS4uN2RlYzFiY2ZkNmY3IDEwMDY0NAotLS0gYS9pbmNsdWRlL2Ry
bS9kcm1fZ2VtX3ZyYW1faGVscGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hl
bHBlci5oCkBAIC0xMzcsMTQgKzEzNywxMiBAQCB2b2lkIGRybV9nZW1fdnJhbV9kcml2ZXJfZ2Vt
X3ByaW1lX3VucGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKTsKIHZvaWQgKmRybV9nZW1f
dnJhbV9kcml2ZXJfZ2VtX3ByaW1lX3ZtYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOwog
dm9pZCBkcm1fZ2VtX3ZyYW1fZHJpdmVyX2dlbV9wcmltZV92dW5tYXAoc3RydWN0IGRybV9nZW1f
b2JqZWN0ICpvYmosCiAJCQkJCSAgdm9pZCAqdmFkZHIpOwotaW50IGRybV9nZW1fdnJhbV9kcml2
ZXJfZ2VtX3ByaW1lX21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosCi0JCQkJICAgICAg
IHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsKIAogI2RlZmluZSBEUk1fR0VNX1ZSQU1fRFJJ
VkVSX1BSSU1FIFwKIAkuZ2VtX3ByaW1lX3BpbgkgID0gZHJtX2dlbV92cmFtX2RyaXZlcl9nZW1f
cHJpbWVfcGluLCBcCiAJLmdlbV9wcmltZV91bnBpbiAgPSBkcm1fZ2VtX3ZyYW1fZHJpdmVyX2dl
bV9wcmltZV91bnBpbiwgXAogCS5nZW1fcHJpbWVfdm1hcAkgID0gZHJtX2dlbV92cmFtX2RyaXZl
cl9nZW1fcHJpbWVfdm1hcCwgXAogCS5nZW1fcHJpbWVfdnVubWFwID0gZHJtX2dlbV92cmFtX2Ry
aXZlcl9nZW1fcHJpbWVfdnVubWFwLCBcCi0JLmdlbV9wcmltZV9tbWFwCSAgPSBkcm1fZ2VtX3Zy
YW1fZHJpdmVyX2dlbV9wcmltZV9tbWFwCisJLmdlbV9wcmltZV9tbWFwCSAgPSBkcm1fZ2VtX3By
aW1lX21tYXAKIAogI2VuZGlmCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92
cmFtX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYwppbmRl
eCAyZTQ3NGRlZTMwZGYuLmQ3ODc2MTgwMjM3NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2RybV9nZW1fdnJhbV9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFt
X2hlbHBlci5jCkBAIC02MTksMjAgKzYxOSwzIEBAIHZvaWQgZHJtX2dlbV92cmFtX2RyaXZlcl9n
ZW1fcHJpbWVfdnVubWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ2VtLAogCWRybV9nZW1fdnJh
bV91bnBpbihnYm8pOwogfQogRVhQT1JUX1NZTUJPTChkcm1fZ2VtX3ZyYW1fZHJpdmVyX2dlbV9w
cmltZV92dW5tYXApOwotCi0vKioKLSAqIGRybV9nZW1fdnJhbV9kcml2ZXJfZ2VtX3ByaW1lX21t
YXAoKSAtIFwKLQlJbXBsZW1lbnRzICZzdHJ1Y3QgZHJtX2RyaXZlci5nZW1fcHJpbWVfbW1hcAot
ICogQGdlbToJVGhlIEdFTSBvYmplY3QgdG8gbWFwCi0gKiBAdm1hOglUaGUgVk1BIGRlc2NyaWJp
bmcgdGhlIG1hcHBpbmcKLSAqCi0gKiBSZXR1cm5zOgotICogMCBvbiBzdWNjZXNzLCBvcgotICog
YSBuZWdhdGl2ZSBlcnJubyBjb2RlIG90aGVyd2lzZS4KLSAqLwotaW50IGRybV9nZW1fdnJhbV9k
cml2ZXJfZ2VtX3ByaW1lX21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpnZW0sCi0JCQkJICAg
ICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQotewotCXJldHVybiBkcm1fZ2VtX3ByaW1l
X21tYXAoZ2VtLCB2bWEpOwotfQotRVhQT1JUX1NZTUJPTChkcm1fZ2VtX3ZyYW1fZHJpdmVyX2dl
bV9wcmltZV9tbWFwKTsKLS0gCjIuMTguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
