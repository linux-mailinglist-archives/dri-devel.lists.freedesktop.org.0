Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C62C1A1D5D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 10:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F276E9B1;
	Wed,  8 Apr 2020 08:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C026E9B0
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 08:26:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 44B34AC84;
 Wed,  8 Apr 2020 08:26:54 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: noralf@tronnes.org, daniel@ffwll.ch, airlied@linux.ie,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 xinliang.liu@linaro.org, zourongrong@gmail.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 paul@crapouillou.net, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, jsarha@ti.com, tomi.valkeinen@ti.com,
 sean@poorly.run, hdegoede@redhat.com, kraxel@redhat.com,
 emil.velikov@collabora.com, sam@ravnborg.org, yc_chen@aspeedtech.com,
 tiantao6@hisilicon.com
Subject: [PATCH v2 02/10] drm/hibmc: Remove error check from fbdev setup
Date: Wed,  8 Apr 2020 10:26:33 +0200
Message-Id: <20200408082641.590-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200408082641.590-1-tzimmermann@suse.de>
References: <20200408082641.590-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

R2VuZXJpYyBmYmRldiBzdXBwb3J0IGlzIGEgRFJNIGNsaWVudC4gUmVtb3ZlIHRoZSBlcnJvciBj
aGVjayBhcyB0aGUKZHJpdmVyJ3MgcHJvYmUgZnVuY3Rpb24gc2hvdWxkIG5vdCBkZXBlbmQgb24g
YSBEUk0gY2xpZW50J3Mgc3RhdGUuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4KUmV2aWV3ZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxm
QHRyb25uZXMub3JnPgpBY2tlZC1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMgfCA2
ICstLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Ry
di5jIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMKaW5k
ZXggNzlhMTgwYWU0NTA5Zi4uYTZmZDBjMjllNWI4OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMKQEAgLTMwNywxMSArMzA3LDcgQEAgc3Rh
dGljIGludCBoaWJtY19sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAJLyogcmVzZXQgYWxs
IHRoZSBzdGF0ZXMgb2YgY3J0Yy9wbGFuZS9lbmNvZGVyL2Nvbm5lY3RvciAqLwogCWRybV9tb2Rl
X2NvbmZpZ19yZXNldChkZXYpOwogCi0JcmV0ID0gZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoZGV2
LCBkZXYtPm1vZGVfY29uZmlnLnByZWZlcnJlZF9kZXB0aCk7Ci0JaWYgKHJldCkgewotCQlEUk1f
RVJST1IoImZhaWxlZCB0byBpbml0aWFsaXplIGZiZGV2OiAlZFxuIiwgcmV0KTsKLQkJZ290byBl
cnI7Ci0JfQorCWRybV9mYmRldl9nZW5lcmljX3NldHVwKGRldiwgZGV2LT5tb2RlX2NvbmZpZy5w
cmVmZXJyZWRfZGVwdGgpOwogCiAJcmV0dXJuIDA7CiAKLS0gCjIuMjYuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
