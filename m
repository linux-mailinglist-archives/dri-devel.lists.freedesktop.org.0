Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 515AC562C2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 08:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07DE6E29C;
	Wed, 26 Jun 2019 06:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3EE76E29C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 06:55:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DE765C057F2E;
 Wed, 26 Jun 2019 06:55:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7AAE05D71B;
 Wed, 26 Jun 2019 06:55:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9B8E016E19; Wed, 26 Jun 2019 08:55:51 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/vram: store dumb bo dimensions.
Date: Wed, 26 Jun 2019 08:55:50 +0200
Message-Id: <20190626065551.12956-2-kraxel@redhat.com>
In-Reply-To: <20190626065551.12956-1-kraxel@redhat.com>
References: <20190626065551.12956-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Wed, 26 Jun 2019 06:55:59 +0000 (UTC)
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
 Gerd Hoffmann <kraxel@redhat.com>, tzimmermann@suse.de,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3RvcmUgd2lkdGggYW5kIGhlaWdodCBvZiB0aGUgYm8uICBOZWVkZWQgaW4gY2FzZSB1c2Vyc3Bh
Y2UKc2V0cyB1cCBhIGZyYW1lYnVmZmVyIHdpdGggZmItPndpZHRoICE9IGJvLT53aWR0aC4uCgpT
aWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KLS0tCiBpbmNs
dWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmggICAgIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbV92cmFtX2hlbHBlci5jIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmggYi9p
bmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmgKaW5kZXggMWEwZWExOGU3YTc0Li4zNjky
ZGJhMTY3ZGYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaAor
KysgYi9pbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmgKQEAgLTM5LDYgKzM5LDcgQEAg
c3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3QgewogCXN0cnVjdCBkcm1fZ2VtX29iamVjdCBnZW07
CiAJc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0IGJvOwogCXN0cnVjdCB0dG1fYm9fa21hcF9vYmog
a21hcDsKKwl1bnNpZ25lZCBpbnQgd2lkdGgsIGhlaWdodDsKIAogCS8qIFN1cHBvcnRlZCBwbGFj
ZW1lbnRzIGFyZSAlVFRNX1BMX1ZSQU0gYW5kICVUVE1fUExfU1lTVEVNICovCiAJc3RydWN0IHR0
bV9wbGFjZW1lbnQgcGxhY2VtZW50OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9n
ZW1fdnJhbV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMK
aW5kZXggNGRlNzgyY2EyNmIyLi5jMDJiZjc2OTQxMTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1f
dnJhbV9oZWxwZXIuYwpAQCAtMzc3LDYgKzM3Nyw4IEBAIGludCBkcm1fZ2VtX3ZyYW1fZmlsbF9j
cmVhdGVfZHVtYihzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUsCiAJZ2JvID0gZHJtX2dlbV92cmFtX2Ny
ZWF0ZShkZXYsIGJkZXYsIHNpemUsIHBnX2FsaWduLCBpbnRlcnJ1cHRpYmxlKTsKIAlpZiAoSVNf
RVJSKGdibykpCiAJCXJldHVybiBQVFJfRVJSKGdibyk7CisJZ2JvLT53aWR0aCA9IGFyZ3MtPndp
ZHRoOworCWdiby0+aGVpZ2h0ID0gYXJncy0+aGVpZ2h0OwogCiAJcmV0ID0gZHJtX2dlbV9oYW5k
bGVfY3JlYXRlKGZpbGUsICZnYm8tPmdlbSwgJmhhbmRsZSk7CiAJaWYgKHJldCkKLS0gCjIuMTgu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
