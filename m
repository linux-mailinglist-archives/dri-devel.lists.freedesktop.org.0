Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8AEA566B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 14:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB3A389BCD;
	Mon,  2 Sep 2019 12:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98253899E9
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 12:41:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E970A3084288;
 Mon,  2 Sep 2019 12:41:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-67.ams2.redhat.com
 [10.36.117.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C844860127;
 Mon,  2 Sep 2019 12:41:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0A1EB31EBC; Mon,  2 Sep 2019 14:41:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/vram: use drm_gem_ttm_print_info
Date: Mon,  2 Sep 2019 14:41:23 +0200
Message-Id: <20190902124126.7700-3-kraxel@redhat.com>
In-Reply-To: <20190902124126.7700-1-kraxel@redhat.com>
References: <20190902124126.7700-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Mon, 02 Sep 2019 12:41:31 +0000 (UTC)
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
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogaW5j
bHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5oICAgICB8IDEgKwogZHJpdmVycy9ncHUvZHJt
L2RybV9nZW1fdnJhbV9oZWxwZXIuYyB8IDMgKystCiBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyAg
ICAgICAgICAgICAgIHwgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIu
aCBiL2luY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaAppbmRleCBhYzIxN2Q3Njg0NTYu
LjE3ZjE2MGRkNmU3ZCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBl
ci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaApAQCAtNCw2ICs0LDcg
QEAKICNkZWZpbmUgRFJNX0dFTV9WUkFNX0hFTFBFUl9ICiAKICNpbmNsdWRlIDxkcm0vZHJtX2dl
bS5oPgorI2luY2x1ZGUgPGRybS9kcm1fZ2VtX3R0bV9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0v
dHRtL3R0bV9ib19hcGkuaD4KICNpbmNsdWRlIDxkcm0vdHRtL3R0bV9wbGFjZW1lbnQuaD4KICNp
bmNsdWRlIDxsaW51eC9rZXJuZWwuaD4gLyogZm9yIGNvbnRhaW5lcl9vZigpICovCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYwppbmRleCBmZDc1MTA3OGJhZTEuLmI0OTI5ZTFmYjE5
MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCkBAIC02MzMsNSArNjMzLDYg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcyBkcm1fZ2VtX3ZyYW1f
b2JqZWN0X2Z1bmNzID0gewogCS5waW4JPSBkcm1fZ2VtX3ZyYW1fb2JqZWN0X3BpbiwKIAkudW5w
aW4JPSBkcm1fZ2VtX3ZyYW1fb2JqZWN0X3VucGluLAogCS52bWFwCT0gZHJtX2dlbV92cmFtX29i
amVjdF92bWFwLAotCS52dW5tYXAJPSBkcm1fZ2VtX3ZyYW1fb2JqZWN0X3Z1bm1hcAorCS52dW5t
YXAJPSBkcm1fZ2VtX3ZyYW1fb2JqZWN0X3Z1bm1hcCwKKwkucHJpbnRfaW5mbyA9IGRybV9nZW1f
dHRtX3ByaW50X2luZm8sCiB9OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcg
Yi9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZwppbmRleCBmN2IyNTUxOWY5NWMuLjFiZThhZDMwZDhm
ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL0tjb25maWcKQEAgLTE2OSw2ICsxNjksNyBAQCBjb25maWcgRFJNX1ZSQU1fSEVMUEVSCiAJ
dHJpc3RhdGUKIAlkZXBlbmRzIG9uIERSTQogCXNlbGVjdCBEUk1fVFRNCisJc2VsZWN0IERSTV9U
VE1fSEVMUEVSCiAJaGVscAogCSAgSGVscGVycyBmb3IgVlJBTSBtZW1vcnkgbWFuYWdlbWVudAog
Ci0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
