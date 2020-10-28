Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF7B29D1E4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 20:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE79E6E3F5;
	Wed, 28 Oct 2020 19:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72AF46E342;
 Wed, 28 Oct 2020 19:35:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1DC7DB913;
 Wed, 28 Oct 2020 19:35:27 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, sam@ravnborg.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, kraxel@redhat.com, l.stach@pengutronix.de,
 linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, hjc@rock-chips.com, heiko@sntech.de,
 hdegoede@redhat.com, sean@poorly.run, eric@anholt.net,
 oleksandr_andrushchenko@epam.com, ray.huang@amd.com,
 sumit.semwal@linaro.org, emil.velikov@collabora.com, luben.tuikov@amd.com,
 apaneers@amd.com, linus.walleij@linaro.org, melissa.srw@gmail.com,
 chris@chris-wilson.co.uk, miaoqinglang@huawei.com
Subject: [PATCH v6 04/10] drm/exynos: Remove empty exynos_drm_gem_prime_{vmap,
 vunmap}()
Date: Wed, 28 Oct 2020 20:35:15 +0100
Message-Id: <20201028193521.2489-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028193521.2489-1-tzimmermann@suse.de>
References: <20201028193521.2489-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 xen-devel@lists.xenproject.org, spice-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZ1bmN0aW9ucyBleHlub3NfZHJtX2dlbV9wcmltZV97dm1hcCx2dW5tYXB9KCkgYXJlIGVt
cHR5LiBSZW1vdmUKdGhlbSBiZWZvcmUgY2hhbmdpbmcgdGhlIGludGVyZmFjZSB0byB1c2Ugc3Ry
dWN0IGRybV9idWZfbWFwLiBBcyBhIHNpZGUKZWZmZWN0IG9mIHJlbW92aW5nIGRybV9nZW1fcHJp
bWVfdm1hcCgpLCB0aGUgZXJyb3IgY29kZSBjaGFuZ2VzIGZyb20KRU5PTUVNIHRvIEVPUE5PVFNV
UFAuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4KQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
VGVzdGVkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dlbS5jIHwgMTIgLS0tLS0tLS0tLS0tCiBkcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ2VtLmggfCAgMiAtLQogMiBmaWxlcyBjaGFuZ2Vk
LCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vc19kcm1fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ2VtLmMK
aW5kZXggZTdhNmViOTZmNjkyLi4xM2EzNTYyM2FjMDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9leHlub3MvZXh5bm9zX2RybV9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L2V4eW5vc19kcm1fZ2VtLmMKQEAgLTEzNyw4ICsxMzcsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHZtX29wZXJhdGlvbnNfc3RydWN0IGV4eW5vc19kcm1fZ2VtX3ZtX29wcyA9IHsKIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MgZXh5bm9zX2RybV9nZW1fb2JqZWN0X2Z1
bmNzID0gewogCS5mcmVlID0gZXh5bm9zX2RybV9nZW1fZnJlZV9vYmplY3QsCiAJLmdldF9zZ190
YWJsZSA9IGV4eW5vc19kcm1fZ2VtX3ByaW1lX2dldF9zZ190YWJsZSwKLQkudm1hcCA9IGV4eW5v
c19kcm1fZ2VtX3ByaW1lX3ZtYXAsCi0JLnZ1bm1hcAk9IGV4eW5vc19kcm1fZ2VtX3ByaW1lX3Z1
bm1hcCwKIAkudm1fb3BzID0gJmV4eW5vc19kcm1fZ2VtX3ZtX29wcywKIH07CiAKQEAgLTQ3MSwx
NiArNDY5LDYgQEAgZXh5bm9zX2RybV9nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsCiAJcmV0dXJuICZleHlub3NfZ2VtLT5iYXNlOwogfQogCi12b2lkICpl
eHlub3NfZHJtX2dlbV9wcmltZV92bWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQotewot
CXJldHVybiBOVUxMOwotfQotCi12b2lkIGV4eW5vc19kcm1fZ2VtX3ByaW1lX3Z1bm1hcChzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgdm9pZCAqdmFkZHIpCi17Ci0JLyogTm90aGluZyB0byBk
byAqLwotfQotCiBpbnQgZXh5bm9zX2RybV9nZW1fcHJpbWVfbW1hcChzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKm9iaiwKIAkJCSAgICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogewpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dlbS5oIGIvZHJpdmVy
cy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dlbS5oCmluZGV4IDc0ZTkyNmFiZWZmMC4uYTIz
MjcyZmI5NmZiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1f
Z2VtLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dlbS5oCkBAIC0x
MDcsOCArMTA3LDYgQEAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICoKIGV4eW5vc19kcm1fZ2VtX3By
aW1lX2ltcG9ydF9zZ190YWJsZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQkJCSAgICAgc3Ry
dWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoLAogCQkJCSAgICAgc3RydWN0IHNnX3RhYmxl
ICpzZ3QpOwotdm9pZCAqZXh5bm9zX2RybV9nZW1fcHJpbWVfdm1hcChzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKm9iaik7Ci12b2lkIGV4eW5vc19kcm1fZ2VtX3ByaW1lX3Z1bm1hcChzdHJ1Y3QgZHJt
X2dlbV9vYmplY3QgKm9iaiwgdm9pZCAqdmFkZHIpOwogaW50IGV4eW5vc19kcm1fZ2VtX3ByaW1l
X21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosCiAJCQkgICAgICBzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSk7CiAKLS0gCjIuMjkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
