Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D91AA6652
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 12:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BE98982A;
	Tue,  3 Sep 2019 10:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B56D89803
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 10:12:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 078D58980E1;
 Tue,  3 Sep 2019 10:12:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51FC35D6C8;
 Tue,  3 Sep 2019 10:12:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7961B31F3A; Tue,  3 Sep 2019 12:12:49 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/6] drm/vram: use drm_gem_ttm_print_info
Date: Tue,  3 Sep 2019 12:12:45 +0200
Message-Id: <20190903101248.12879-4-kraxel@redhat.com>
In-Reply-To: <20190903101248.12879-1-kraxel@redhat.com>
References: <20190903101248.12879-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Tue, 03 Sep 2019 10:12:53 +0000 (UTC)
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

U2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkFja2VkLWJ5
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jIHwgNCArKystCiBkcml2ZXJzL2dwdS9kcm0vS2Nv
bmZpZyAgICAgICAgICAgICAgIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3Zy
YW1faGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCmluZGV4
IGZkNzUxMDc4YmFlMS4uNzE1NTJmNzU3YjRhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbV92cmFtX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1f
aGVscGVyLmMKQEAgLTEsNSArMSw2IEBACiAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vci1sYXRlcgogCisjaW5jbHVkZSA8ZHJtL2RybV9nZW1fdHRtX2hlbHBlci5oPgogI2lu
Y2x1ZGUgPGRybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9kZXZp
Y2UuaD4KICNpbmNsdWRlIDxkcm0vZHJtX21vZGUuaD4KQEAgLTYzMyw1ICs2MzQsNiBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNzIGRybV9nZW1fdnJhbV9vYmplY3Rf
ZnVuY3MgPSB7CiAJLnBpbgk9IGRybV9nZW1fdnJhbV9vYmplY3RfcGluLAogCS51bnBpbgk9IGRy
bV9nZW1fdnJhbV9vYmplY3RfdW5waW4sCiAJLnZtYXAJPSBkcm1fZ2VtX3ZyYW1fb2JqZWN0X3Zt
YXAsCi0JLnZ1bm1hcAk9IGRybV9nZW1fdnJhbV9vYmplY3RfdnVubWFwCisJLnZ1bm1hcAk9IGRy
bV9nZW1fdnJhbV9vYmplY3RfdnVubWFwLAorCS5wcmludF9pbmZvID0gZHJtX2dlbV90dG1fcHJp
bnRfaW5mbywKIH07CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyBiL2RyaXZl
cnMvZ3B1L2RybS9LY29uZmlnCmluZGV4IGY3YjI1NTE5Zjk1Yy4uMWJlOGFkMzBkOGZlIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZworKysgYi9kcml2ZXJzL2dwdS9kcm0vS2Nv
bmZpZwpAQCAtMTY5LDYgKzE2OSw3IEBAIGNvbmZpZyBEUk1fVlJBTV9IRUxQRVIKIAl0cmlzdGF0
ZQogCWRlcGVuZHMgb24gRFJNCiAJc2VsZWN0IERSTV9UVE0KKwlzZWxlY3QgRFJNX1RUTV9IRUxQ
RVIKIAloZWxwCiAJICBIZWxwZXJzIGZvciBWUkFNIG1lbW9yeSBtYW5hZ2VtZW50CiAKLS0gCjIu
MTguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
