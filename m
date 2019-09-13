Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 685B3B1DAB
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 14:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9086F6F394;
	Fri, 13 Sep 2019 12:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC00B6F393
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 12:29:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 61555308A9E2;
 Fri, 13 Sep 2019 12:29:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D422F19C78;
 Fri, 13 Sep 2019 12:29:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B225A31F96; Fri, 13 Sep 2019 14:29:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/8] drm/vram: drop verify_access
Date: Fri, 13 Sep 2019 14:29:07 +0200
Message-Id: <20190913122908.784-8-kraxel@redhat.com>
In-Reply-To: <20190913122908.784-1-kraxel@redhat.com>
References: <20190913122908.784-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Fri, 13 Sep 2019 12:29:16 +0000 (UTC)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90IG5lZWRlZCBhbnkgbW9yZS4KClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhl
bEByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMg
fCAyMiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKaW5kZXggZTEwMGI5N2VhNmUz
Li40MmVlODA0MTQyNzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1f
aGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYwpAQCAt
NDY5LDEzICs0NjksNiBAQCBzdGF0aWMgdm9pZCBkcm1fZ2VtX3ZyYW1fYm9fZHJpdmVyX2V2aWN0
X2ZsYWdzKHN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0ICpnYm8sCiAJKnBsID0gZ2JvLT5wbGFj
ZW1lbnQ7CiB9CiAKLXN0YXRpYyBpbnQgZHJtX2dlbV92cmFtX2JvX2RyaXZlcl92ZXJpZnlfYWNj
ZXNzKHN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0ICpnYm8sCi0JCQkJCQlzdHJ1Y3QgZmlsZSAq
ZmlscCkKLXsKLQlyZXR1cm4gZHJtX3ZtYV9ub2RlX3ZlcmlmeV9hY2Nlc3MoJmdiby0+Ym8uYmFz
ZS52bWFfbm9kZSwKLQkJCQkJICBmaWxwLT5wcml2YXRlX2RhdGEpOwotfQotCiBzdGF0aWMgdm9p
ZCBkcm1fZ2VtX3ZyYW1fYm9fZHJpdmVyX21vdmVfbm90aWZ5KHN0cnVjdCBkcm1fZ2VtX3ZyYW1f
b2JqZWN0ICpnYm8sCiAJCQkJCSAgICAgICBib29sIGV2aWN0LAogCQkJCQkgICAgICAgc3RydWN0
IHR0bV9tZW1fcmVnICpuZXdfbWVtKQpAQCAtNzY3LDIwICs3NjAsNiBAQCBzdGF0aWMgdm9pZCBi
b19kcml2ZXJfZXZpY3RfZmxhZ3Moc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAlkcm1f
Z2VtX3ZyYW1fYm9fZHJpdmVyX2V2aWN0X2ZsYWdzKGdibywgcGxhY2VtZW50KTsKIH0KIAotc3Rh
dGljIGludCBib19kcml2ZXJfdmVyaWZ5X2FjY2VzcyhzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3Qg
KmJvLAotCQkJCSAgIHN0cnVjdCBmaWxlICpmaWxwKQotewotCXN0cnVjdCBkcm1fZ2VtX3ZyYW1f
b2JqZWN0ICpnYm87Ci0KLQkvKiBUVE0gbWF5IHBhc3MgQk9zIHRoYXQgYXJlIG5vdCBHRU0gVlJB
TSBCT3MuICovCi0JaWYgKCFkcm1faXNfZ2VtX3ZyYW0oYm8pKQotCQlyZXR1cm4gLUVJTlZBTDsK
LQotCWdibyA9IGRybV9nZW1fdnJhbV9vZl9ibyhibyk7Ci0KLQlyZXR1cm4gZHJtX2dlbV92cmFt
X2JvX2RyaXZlcl92ZXJpZnlfYWNjZXNzKGdibywgZmlscCk7Ci19Ci0KIHN0YXRpYyB2b2lkIGJv
X2RyaXZlcl9tb3ZlX25vdGlmeShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQkJCSAg
Ym9vbCBldmljdCwKIAkJCQkgIHN0cnVjdCB0dG1fbWVtX3JlZyAqbmV3X21lbSkKQEAgLTgzNyw3
ICs4MTYsNiBAQCBzdGF0aWMgc3RydWN0IHR0bV9ib19kcml2ZXIgYm9fZHJpdmVyID0gewogCS5p
bml0X21lbV90eXBlID0gYm9fZHJpdmVyX2luaXRfbWVtX3R5cGUsCiAJLmV2aWN0aW9uX3ZhbHVh
YmxlID0gdHRtX2JvX2V2aWN0aW9uX3ZhbHVhYmxlLAogCS5ldmljdF9mbGFncyA9IGJvX2RyaXZl
cl9ldmljdF9mbGFncywKLQkudmVyaWZ5X2FjY2VzcyA9IGJvX2RyaXZlcl92ZXJpZnlfYWNjZXNz
LAogCS5tb3ZlX25vdGlmeSA9IGJvX2RyaXZlcl9tb3ZlX25vdGlmeSwKIAkuaW9fbWVtX3Jlc2Vy
dmUgPSBib19kcml2ZXJfaW9fbWVtX3Jlc2VydmUsCiAJLmlvX21lbV9mcmVlID0gYm9fZHJpdmVy
X2lvX21lbV9mcmVlLAotLSAKMi4xOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
