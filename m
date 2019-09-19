Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46764B76F9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 12:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1B16FB3D;
	Thu, 19 Sep 2019 10:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E675D6FA61;
 Thu, 19 Sep 2019 10:02:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7AE6D18CB8EA;
 Thu, 19 Sep 2019 10:02:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B63A60872;
 Thu, 19 Sep 2019 10:02:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9A45C9D3C; Thu, 19 Sep 2019 12:02:24 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 07/11] drm/ttm: rename ttm_fbdev_mmap
Date: Thu, 19 Sep 2019 12:02:19 +0200
Message-Id: <20190919100223.13309-8-kraxel@redhat.com>
In-Reply-To: <20190919100223.13309-1-kraxel@redhat.com>
References: <20190919100223.13309-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Thu, 19 Sep 2019 10:02:28 +0000 (UTC)
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
bnQgJmRybV9nZW1fb2JqZWN0X2Z1bmNzLm1tYXAgaW4gZ2VtIHR0bSBoZWxwZXJzLgoKU2lnbmVk
LW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogaW5jbHVkZS9k
cm0vdHRtL3R0bV9ib19hcGkuaCAgICAgICAgICAgICAgIHwgMTAgKysrKy0tLS0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jIHwgIDUgKysrKy0KIGRyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvX3ZtLmMgICAgICAgICAgICB8ICA4ICsrLS0tLS0tCiAzIGZpbGVz
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmggYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2Fw
aS5oCmluZGV4IDQzYzQ5MjlhMjE3MS4uZDIyNzdlMDYzMTZkIDEwMDY0NAotLS0gYS9pbmNsdWRl
L2RybS90dG0vdHRtX2JvX2FwaS5oCisrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgK
QEAgLTcxMCwxNiArNzEwLDE0IEBAIGludCB0dG1fYm9fa21hcChzdHJ1Y3QgdHRtX2J1ZmZlcl9v
YmplY3QgKmJvLCB1bnNpZ25lZCBsb25nIHN0YXJ0X3BhZ2UsCiB2b2lkIHR0bV9ib19rdW5tYXAo
c3RydWN0IHR0bV9ib19rbWFwX29iaiAqbWFwKTsKIAogLyoqCi0gKiB0dG1fZmJkZXZfbW1hcCAt
IG1tYXAgZmJkZXYgbWVtb3J5IGJhY2tlZCBieSBhIHR0bSBidWZmZXIgb2JqZWN0LgorICogdHRt
X2JvX21tYXBfb2JqIC0gbW1hcCBtZW1vcnkgYmFja2VkIGJ5IGEgdHRtIGJ1ZmZlciBvYmplY3Qu
CiAgKgogICogQHZtYTogICAgICAgdm1hIGFzIGlucHV0IGZyb20gdGhlIGZiZGV2IG1tYXAgbWV0
aG9kLgotICogQGJvOiAgICAgICAgVGhlIGJvIGJhY2tpbmcgdGhlIGFkZHJlc3Mgc3BhY2UuIFRo
ZSBhZGRyZXNzIHNwYWNlIHdpbGwKLSAqIGhhdmUgdGhlIHNhbWUgc2l6ZSBhcyB0aGUgYm8sIGFu
ZCBzdGFydCBhdCBvZmZzZXQgMC4KKyAqIEBibzogICAgICAgIFRoZSBibyBiYWNraW5nIHRoZSBh
ZGRyZXNzIHNwYWNlLgogICoKLSAqIFRoaXMgZnVuY3Rpb24gaXMgaW50ZW5kZWQgdG8gYmUgY2Fs
bGVkIGJ5IHRoZSBmYmRldiBtbWFwIG1ldGhvZAotICogaWYgdGhlIGZiZGV2IGFkZHJlc3Mgc3Bh
Y2UgaXMgdG8gYmUgYmFja2VkIGJ5IGEgYm8uCisgKiBNYXBzIGEgYnVmZmVyIG9iamVjdC4KICAq
LwotaW50IHR0bV9mYmRldl9tbWFwKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCBzdHJ1Y3Qg
dHRtX2J1ZmZlcl9vYmplY3QgKmJvKTsKK2ludCB0dG1fYm9fbW1hcF9vYmooc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWEsIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pOwogCiAvKioKICAq
IHR0bV9ib19tbWFwIC0gbW1hcCBvdXQgb2YgdGhlIHR0bSBkZXZpY2UgYWRkcmVzcyBzcGFjZS4K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYwppbmRleCAyZjExZWJk
OTU1MjguLmU1NDQ3ZTBkOGI4OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X29iamVjdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9vYmplY3QuYwpAQCAtMTA1MSw3ICsxMDUxLDEwIEBAIHZvaWQgYW1kZ3B1X2JvX2Zpbmkoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiBpbnQgYW1kZ3B1X2JvX2ZiZGV2X21tYXAoc3RydWN0
IGFtZGdwdV9ibyAqYm8sCiAJCQkgICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogewot
CXJldHVybiB0dG1fZmJkZXZfbW1hcCh2bWEsICZiby0+dGJvKTsKKwlpZiAodm1hLT52bV9wZ29m
ZiAhPSAwKQorCQlyZXR1cm4gLUVBQ0NFUzsKKworCXJldHVybiB0dG1fYm9fbW1hcF9vYmoodm1h
LCAmYm8tPnRibyk7CiB9CiAKIC8qKgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm9fdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKaW5kZXggYjUzMTRl
Zjg1YTNkLi42Njg4ZDc4OTMxNjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X2JvX3ZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwpAQCAtNDc5LDE0
ICs0NzksMTAgQEAgaW50IHR0bV9ib19tbWFwKHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3QgKnZtYSwKIH0KIEVYUE9SVF9TWU1CT0wodHRtX2JvX21tYXApOwogCi1pbnQg
dHRtX2ZiZGV2X21tYXAoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCAqYm8pCitpbnQgdHRtX2JvX21tYXBfb2JqKHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hLCBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQogewotCWlmICh2bWEtPnZtX3Bn
b2ZmICE9IDApCi0JCXJldHVybiAtRUFDQ0VTOwotCiAJdHRtX2JvX2dldChibyk7Ci0KIAl0dG1f
Ym9fbW1hcF92bWFfc2V0dXAoYm8sIHZtYSk7CiAJcmV0dXJuIDA7CiB9Ci1FWFBPUlRfU1lNQk9M
KHR0bV9mYmRldl9tbWFwKTsKK0VYUE9SVF9TWU1CT0wodHRtX2JvX21tYXBfb2JqKTsKLS0gCjIu
MTguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
