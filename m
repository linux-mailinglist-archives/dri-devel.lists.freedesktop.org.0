Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1B3D900D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 13:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126AC6E94A;
	Wed, 16 Oct 2019 11:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547806E949;
 Wed, 16 Oct 2019 11:52:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D8FBE309321D;
 Wed, 16 Oct 2019 11:52:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2EC219C68;
 Wed, 16 Oct 2019 11:52:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E9B6B31E9A; Wed, 16 Oct 2019 13:52:04 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 07/11] drm/ttm: rename ttm_fbdev_mmap
Date: Wed, 16 Oct 2019 13:51:59 +0200
Message-Id: <20191016115203.20095-8-kraxel@redhat.com>
In-Reply-To: <20191016115203.20095-1-kraxel@redhat.com>
References: <20191016115203.20095-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Wed, 16 Oct 2019 11:52:12 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVuYW1lIHR0bV9mYmRldl9tbWFwIHRvIHR0bV9ib19tbWFwX29iai4gIE1vdmUgdGhlIHZtX3Bn
b2ZmIHNhbml0eQpjaGVjayB0byBhbWRncHVfYm9fZmJkZXZfbW1hcCAob25seSB0dG1fZmJkZXZf
bW1hcCB1c2VyIGluIHRyZWUpLgoKVGhlIHR0bV9ib19tbWFwX29iaiBmdW5jdGlvbiBjYW4gbm93
IGJlIHVzZWQgdG8gbWFwIGFueSBidWZmZXIgb2JqZWN0LgpUaGlzIGFsbG93cyB0byBpbXBsZW1l
bnQgJmRybV9nZW1fb2JqZWN0X2Z1bmNzLm1tYXAgaW4gZ2VtIHR0bSBoZWxwZXJzLgoKdjM6IHBh
dGNoIGFkZGVkIHRvIHNlcmllcwoKU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVs
QHJlZGhhdC5jb20+CkFja2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4KLS0tCiBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oICAgICAgICAgICAgICAgfCAx
MCArKysrLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMg
fCAgNSArKysrLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyAgICAgICAgICAgIHwg
IDggKystLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCBiL2luY2x1
ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKaW5kZXggNDNjNDkyOWEyMTcxLi5kMjI3N2UwNjMxNmQg
MTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKKysrIGIvaW5jbHVkZS9k
cm0vdHRtL3R0bV9ib19hcGkuaApAQCAtNzEwLDE2ICs3MTAsMTQgQEAgaW50IHR0bV9ib19rbWFw
KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIHVuc2lnbmVkIGxvbmcgc3RhcnRfcGFnZSwK
IHZvaWQgdHRtX2JvX2t1bm1hcChzdHJ1Y3QgdHRtX2JvX2ttYXBfb2JqICptYXApOwogCiAvKioK
LSAqIHR0bV9mYmRldl9tbWFwIC0gbW1hcCBmYmRldiBtZW1vcnkgYmFja2VkIGJ5IGEgdHRtIGJ1
ZmZlciBvYmplY3QuCisgKiB0dG1fYm9fbW1hcF9vYmogLSBtbWFwIG1lbW9yeSBiYWNrZWQgYnkg
YSB0dG0gYnVmZmVyIG9iamVjdC4KICAqCiAgKiBAdm1hOiAgICAgICB2bWEgYXMgaW5wdXQgZnJv
bSB0aGUgZmJkZXYgbW1hcCBtZXRob2QuCi0gKiBAYm86ICAgICAgICBUaGUgYm8gYmFja2luZyB0
aGUgYWRkcmVzcyBzcGFjZS4gVGhlIGFkZHJlc3Mgc3BhY2Ugd2lsbAotICogaGF2ZSB0aGUgc2Ft
ZSBzaXplIGFzIHRoZSBibywgYW5kIHN0YXJ0IGF0IG9mZnNldCAwLgorICogQGJvOiAgICAgICAg
VGhlIGJvIGJhY2tpbmcgdGhlIGFkZHJlc3Mgc3BhY2UuCiAgKgotICogVGhpcyBmdW5jdGlvbiBp
cyBpbnRlbmRlZCB0byBiZSBjYWxsZWQgYnkgdGhlIGZiZGV2IG1tYXAgbWV0aG9kCi0gKiBpZiB0
aGUgZmJkZXYgYWRkcmVzcyBzcGFjZSBpcyB0byBiZSBiYWNrZWQgYnkgYSBiby4KKyAqIE1hcHMg
YSBidWZmZXIgb2JqZWN0LgogICovCi1pbnQgdHRtX2ZiZGV2X21tYXAoc3RydWN0IHZtX2FyZWFf
c3RydWN0ICp2bWEsIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pOworaW50IHR0bV9ib19t
bWFwX29iaihzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgc3RydWN0IHR0bV9idWZmZXJfb2Jq
ZWN0ICpibyk7CiAKIC8qKgogICogdHRtX2JvX21tYXAgLSBtbWFwIG91dCBvZiB0aGUgdHRtIGRl
dmljZSBhZGRyZXNzIHNwYWNlLgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X29iamVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29i
amVjdC5jCmluZGV4IDFmZWFkMGU4Yjg5MC4uNmYwYjc4OWEwYjQ5IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCkBAIC0xMDU4LDcgKzEwNTgsMTAgQEAgdm9p
ZCBhbWRncHVfYm9fZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIGludCBhbWRncHVf
Ym9fZmJkZXZfbW1hcChzdHJ1Y3QgYW1kZ3B1X2JvICpibywKIAkJCSAgICAgc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWEpCiB7Ci0JcmV0dXJuIHR0bV9mYmRldl9tbWFwKHZtYSwgJmJvLT50Ym8p
OworCWlmICh2bWEtPnZtX3Bnb2ZmICE9IDApCisJCXJldHVybiAtRUFDQ0VTOworCisJcmV0dXJu
IHR0bV9ib19tbWFwX29iaih2bWEsICZiby0+dGJvKTsKIH0KIAogLyoqCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym9fdm0uYwppbmRleCA1MzM0NWMwODU0ZDUuLjFhOWRiNjkxZjk1NCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9ib192bS5jCkBAIC00NzksMTQgKzQ3OSwxMCBAQCBpbnQgdHRtX2JvX21tYXAoc3RydWN0IGZp
bGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAogfQogRVhQT1JUX1NZTUJPTCh0
dG1fYm9fbW1hcCk7CiAKLWludCB0dG1fZmJkZXZfbW1hcChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KnZtYSwgc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKK2ludCB0dG1fYm9fbW1hcF9vYmoo
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8p
CiB7Ci0JaWYgKHZtYS0+dm1fcGdvZmYgIT0gMCkKLQkJcmV0dXJuIC1FQUNDRVM7Ci0KIAl0dG1f
Ym9fZ2V0KGJvKTsKLQogCXR0bV9ib19tbWFwX3ZtYV9zZXR1cChibywgdm1hKTsKIAlyZXR1cm4g
MDsKIH0KLUVYUE9SVF9TWU1CT0wodHRtX2ZiZGV2X21tYXApOworRVhQT1JUX1NZTUJPTCh0dG1f
Ym9fbW1hcF9vYmopOwotLSAKMi4xOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
