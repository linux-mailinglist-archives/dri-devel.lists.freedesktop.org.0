Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F2C10FB5C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 11:04:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E7E6E45F;
	Tue,  3 Dec 2019 10:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBCF6E453
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 10:04:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BE8B8B1A0;
 Tue,  3 Dec 2019 10:04:10 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch,
 alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com,
 kraxel@redhat.com, sam@ravnborg.org, laurent.pinchart@ideasonboard.com,
 chris@chris-wilson.co.uk, emil.velikov@collabora.com,
 dan.carpenter@oracle.com
Subject: [PATCH 05/12] drm/mga: Don't include <drm/drm_pci.h>
Date: Tue,  3 Dec 2019 11:03:59 +0100
Message-Id: <20191203100406.9674-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203100406.9674-1-tzimmermann@suse.de>
References: <20191203100406.9674-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5jbHVkaW5nIDxkcm0vZHJtX3BjaS5oPiBpcyB1bm5lY2Vzc2FyeSBpbiBtb3N0IGNhc2VzLiBS
ZXBsYWNlCnRoZXNlIGluc3RhbmNlcy4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2EvbWdhX2Rydi5o
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYS9tZ2FfZHJ2LmggYi9kcml2ZXJzL2dwdS9k
cm0vbWdhL21nYV9kcnYuaAppbmRleCBkNWRlZWNiOTM5NzUuLjY2ZGY1MTYwNzg5NiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYS9tZ2FfZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJt
L21nYS9tZ2FfZHJ2LmgKQEAgLTMyLDYgKzMyLDcgQEAKICNkZWZpbmUgX19NR0FfRFJWX0hfXwog
CiAjaW5jbHVkZSA8bGludXgvaXJxcmV0dXJuLmg+CisjaW5jbHVkZSA8bGludXgvcGNpLmg+CiAj
aW5jbHVkZSA8bGludXgvc2xhYi5oPgogCiAjaW5jbHVkZSA8ZHJtL2RybV9hZ3BzdXBwb3J0Lmg+
CkBAIC00MCw3ICs0MSw2IEBACiAjaW5jbHVkZSA8ZHJtL2RybV9pb2N0bC5oPgogI2luY2x1ZGUg
PGRybS9kcm1faXJxLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9sZWdhY3kuaD4KLSNpbmNsdWRlIDxk
cm0vZHJtX3BjaS5oPgogI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KICNpbmNsdWRlIDxkcm0v
ZHJtX3NhcmVhLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV92YmxhbmsuaD4KLS0gCjIuMjMuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
