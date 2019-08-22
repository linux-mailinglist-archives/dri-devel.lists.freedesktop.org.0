Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6106998EB9
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 11:06:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215766EAC5;
	Thu, 22 Aug 2019 09:06:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D09B6EAB7;
 Thu, 22 Aug 2019 09:06:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C3C13308FBAC;
 Thu, 22 Aug 2019 09:06:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4E0D5D772;
 Thu, 22 Aug 2019 09:06:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7C1C097A1; Thu, 22 Aug 2019 11:06:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915: switch to
 drm_fb_helper_remove_conflicting_pci_framebuffers
Date: Thu, 22 Aug 2019 11:06:45 +0200
Message-Id: <20190822090645.25410-4-kraxel@redhat.com>
In-Reply-To: <20190822090645.25410-1-kraxel@redhat.com>
References: <20190822090645.25410-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Thu, 22 Aug 2019 09:06:50 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:INTEL DRM DRIVERS excluding Poulsbo, Moorestow..., 
 linux-kernel@vger.kernel.org open list" <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gbmVlZCBmb3IgYSBob21lLWdyb3duIHZlcnNpb24sIHRoZSBnZW5lcmljIGhlbHBlciBzaG91
bGQgd29yayBqdXN0CmZpbmUuICBJdCBhbHNvIGhhbmRsZXMgdmdhY29uIHJlbW92YWwgdGhlc2Ug
ZGF5cywgc2VlIGNvbW1pdAoxYzc0Y2E3YTFhOWEgKCJkcm0vZmItaGVscGVyOiBjYWxsIHZnYV9y
ZW1vdmVfdmdhY29uIGF1dG9tYXRpY2FsbHkuIiksCnNvIHRoYXQgY2FuIGJlIHJlbW92ZWQgdG9v
LgoKU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuYyB8IDQxICsrLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMzkgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmMKaW5kZXggYjk5ZDczYzFjNGRiLi5kZGMzMTdj
ZWI4ZGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuYwpAQCAtNzY2LDMxICs3NjYsNiBAQCBzdGF0
aWMgaW50IGk5MTVfbG9hZF9tb2Rlc2V0X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAly
ZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgaW50IGk5MTVfa2lja19vdXRfZmlybXdhcmVfZmIoc3Ry
dWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2KQotewotCXN0cnVjdCBhcGVydHVyZXNfc3Ry
dWN0ICphcDsKLQlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IGRldl9wcml2LT5kcm0ucGRldjsKLQlz
dHJ1Y3QgaTkxNV9nZ3R0ICpnZ3R0ID0gJmRldl9wcml2LT5nZ3R0OwotCWJvb2wgcHJpbWFyeTsK
LQlpbnQgcmV0OwotCi0JYXAgPSBhbGxvY19hcGVydHVyZXMoMSk7Ci0JaWYgKCFhcCkKLQkJcmV0
dXJuIC1FTk9NRU07Ci0KLQlhcC0+cmFuZ2VzWzBdLmJhc2UgPSBnZ3R0LT5nbWFkci5zdGFydDsK
LQlhcC0+cmFuZ2VzWzBdLnNpemUgPSBnZ3R0LT5tYXBwYWJsZV9lbmQ7Ci0KLQlwcmltYXJ5ID0K
LQkJcGRldi0+cmVzb3VyY2VbUENJX1JPTV9SRVNPVVJDRV0uZmxhZ3MgJiBJT1JFU09VUkNFX1JP
TV9TSEFET1c7Ci0KLQlyZXQgPSBkcm1fZmJfaGVscGVyX3JlbW92ZV9jb25mbGljdGluZ19mcmFt
ZWJ1ZmZlcnMoYXAsICJpbnRlbGRybWZiIiwgcHJpbWFyeSk7Ci0KLQlrZnJlZShhcCk7Ci0KLQly
ZXR1cm4gcmV0OwotfQotCiBzdGF0aWMgdm9pZCBpbnRlbF9pbml0X2RwaW8oc3RydWN0IGRybV9p
OTE1X3ByaXZhdGUgKmRldl9wcml2KQogewogCS8qCkBAIC0xNTcwLDIxICsxNTQ1LDkgQEAgc3Rh
dGljIGludCBpOTE1X2RyaXZlcl9pbml0X2h3KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZf
cHJpdikKIAlpZiAocmV0KQogCQlnb3RvIGVycl9wZXJmOwogCi0JLyoKLQkgKiBXQVJOSU5HOiBB
cHBhcmVudGx5IHdlIG11c3Qga2ljayBmYmRldiBkcml2ZXJzIGJlZm9yZSB2Z2Fjb24sCi0JICog
b3RoZXJ3aXNlIHRoZSB2Z2EgZmJkZXYgZHJpdmVyIGZhbGxzIG92ZXIuCi0JICovCi0JcmV0ID0g
aTkxNV9raWNrX291dF9maXJtd2FyZV9mYihkZXZfcHJpdik7Ci0JaWYgKHJldCkgewotCQlEUk1f
RVJST1IoImZhaWxlZCB0byByZW1vdmUgY29uZmxpY3RpbmcgZnJhbWVidWZmZXIgZHJpdmVyc1xu
Iik7CisJcmV0ID0gZHJtX2ZiX2hlbHBlcl9yZW1vdmVfY29uZmxpY3RpbmdfcGNpX2ZyYW1lYnVm
ZmVycyhwZGV2LCAiaW50ZWxkcm1mYiIpOworCWlmIChyZXQpCiAJCWdvdG8gZXJyX2dndHQ7Ci0J
fQotCi0JcmV0ID0gdmdhX3JlbW92ZV92Z2Fjb24ocGRldik7Ci0JaWYgKHJldCkgewotCQlEUk1f
RVJST1IoImZhaWxlZCB0byByZW1vdmUgY29uZmxpY3RpbmcgVkdBIGNvbnNvbGVcbiIpOwotCQln
b3RvIGVycl9nZ3R0OwotCX0KIAogCXJldCA9IGk5MTVfZ2d0dF9pbml0X2h3KGRldl9wcml2KTsK
IAlpZiAocmV0KQotLSAKMi4xOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
