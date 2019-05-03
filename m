Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD2413254
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 18:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CB96E81F;
	Fri,  3 May 2019 16:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB876E81F
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 16:38:28 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2450:102f:3e0:9052:5862:59e9:e098])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: robertfoss)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 94AD526104F;
 Fri,  3 May 2019 17:38:26 +0100 (BST)
From: Robert Foss <robert.foss@collabora.com>
To: airlied@linux.ie, kraxel@redhat.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH] drm/virtio: Remove redundant return type
Date: Fri,  3 May 2019 18:38:04 +0200
Message-Id: <20190503163804.31922-1-robert.foss@collabora.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Robert Foss <robert.foss@collabora.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dmlydGlvX2dwdV9mZW5jZV9lbWl0KCkgYWx3YXlzIHJldHVybnMgMCwgc2luY2UgaXQKaGFzIG5v
IGVycm9yIHBhdGhzLgoKQ29uc2VxdWVudGx5IG5vIGNhbGxzIGZvciB2aXJ0aW9fZ3B1X2ZlbmNl
X2VtaXQoKQp1c2UgdGhlIHJldHVybiB2YWx1ZSwgYW5kIGl0IGNhbiBiZSByZW1vdmVkLgoKU2ln
bmVkLW9mZi1ieTogUm9iZXJ0IEZvc3MgPHJvYmVydC5mb3NzQGNvbGxhYm9yYS5jb20+ClN1Z2dl
c3RlZC1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KLS0tCgpU
aGlzIHBhdGNoIHdhcyBzdWdnZXN0ZWQgaW4gdGhpcyBlbWFpbCB0aHJlYWQ6CgpbUEFUQ0hdIGRy
bS92aXJ0aW86IGFsbG9jYXRlIGZlbmNlcyB3aXRoIEdGUF9LRVJORUwKaHR0cHM6Ly93d3cuc3Bp
bmljcy5uZXQvbGlzdHMvZHJpLWRldmVsL21zZzIwODUzNi5odG1sCgogZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X2Rydi5oICAgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfZmVuY2UuYyB8IDMgKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRn
cHVfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmgKaW5kZXggZDU3
N2NiNzZmNWFkLi45YmM1Njg4N2ZiZGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0
aW8vdmlydGdwdV9kcnYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2
LmgKQEAgLTMzNCw3ICszMzQsNyBAQCBpbnQgdmlydGlvX2dwdV9tbWFwKHN0cnVjdCBmaWxlICpm
aWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7CiAvKiB2aXJ0aW9fZ3B1X2ZlbmNlLmMg
Ki8KIHN0cnVjdCB2aXJ0aW9fZ3B1X2ZlbmNlICp2aXJ0aW9fZ3B1X2ZlbmNlX2FsbG9jKAogCXN0
cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYpOwotaW50IHZpcnRpb19ncHVfZmVuY2VfZW1p
dChzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZnZGV2LAordm9pZCB2aXJ0aW9fZ3B1X2ZlbmNl
X2VtaXQoc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldiwKIAkJCSAgc3RydWN0IHZpcnRp
b19ncHVfY3RybF9oZHIgKmNtZF9oZHIsCiAJCQkgIHN0cnVjdCB2aXJ0aW9fZ3B1X2ZlbmNlICpm
ZW5jZSk7CiB2b2lkIHZpcnRpb19ncHVfZmVuY2VfZXZlbnRfcHJvY2VzcyhzdHJ1Y3QgdmlydGlv
X2dwdV9kZXZpY2UgKnZkZXYsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfZmVuY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9mZW5jZS5jCmlu
ZGV4IDIxYmQ0YzRhMzJkMS4uZTA3NDRhYzc2OGNjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdmlydGlvL3ZpcnRncHVfZmVuY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfZmVuY2UuYwpAQCAtODEsNyArODEsNyBAQCBzdHJ1Y3QgdmlydGlvX2dwdV9mZW5jZSAq
dmlydGlvX2dwdV9mZW5jZV9hbGxvYyhzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZnZGV2KQog
CXJldHVybiBmZW5jZTsKIH0KIAotaW50IHZpcnRpb19ncHVfZmVuY2VfZW1pdChzdHJ1Y3Qgdmly
dGlvX2dwdV9kZXZpY2UgKnZnZGV2LAordm9pZCB2aXJ0aW9fZ3B1X2ZlbmNlX2VtaXQoc3RydWN0
IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldiwKIAkJCSAgc3RydWN0IHZpcnRpb19ncHVfY3RybF9o
ZHIgKmNtZF9oZHIsCiAJCQkgIHN0cnVjdCB2aXJ0aW9fZ3B1X2ZlbmNlICpmZW5jZSkKIHsKQEAg
LTk2LDcgKzk2LDYgQEAgaW50IHZpcnRpb19ncHVfZmVuY2VfZW1pdChzdHJ1Y3QgdmlydGlvX2dw
dV9kZXZpY2UgKnZnZGV2LAogCiAJY21kX2hkci0+ZmxhZ3MgfD0gY3B1X3RvX2xlMzIoVklSVElP
X0dQVV9GTEFHX0ZFTkNFKTsKIAljbWRfaGRyLT5mZW5jZV9pZCA9IGNwdV90b19sZTY0KGZlbmNl
LT5zZXEpOwotCXJldHVybiAwOwogfQogCiB2b2lkIHZpcnRpb19ncHVfZmVuY2VfZXZlbnRfcHJv
Y2VzcyhzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZnZGV2LAotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
