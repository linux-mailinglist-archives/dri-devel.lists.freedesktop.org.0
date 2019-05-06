Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F0214735
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 11:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBAE89330;
	Mon,  6 May 2019 09:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E964789330
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 09:11:01 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2450:102f:3e0:95da:b269:747c:91b3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: robertfoss)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9A482261136;
 Mon,  6 May 2019 10:10:57 +0100 (BST)
From: Robert Foss <robert.foss@collabora.com>
To: airlied@linux.ie, kraxel@redhat.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v2] drm/virtio: Remove redundant return type
Date: Mon,  6 May 2019 11:10:34 +0200
Message-Id: <20190506091034.30289-1-robert.foss@collabora.com>
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
c3RlZC1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KUmV2aWV3
ZWQtYnk6IENoaWEtSSBXdSA8b2x2YWZmZUBnbWFpbC5jb20+Ci0tLQoKVGhpcyBwYXRjaCB3YXMg
c3VnZ2VzdGVkIGluIHRoaXMgZW1haWwgdGhyZWFkOgoKW1BBVENIXSBkcm0vdmlydGlvOiBhbGxv
Y2F0ZSBmZW5jZXMgd2l0aCBHRlBfS0VSTkVMCmh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3Rz
L2RyaS1kZXZlbC9tc2cyMDg1MzYuaHRtbAoKQ2hhbmdlcyBzaW5jZSB2MToKIC0gUmViYXNlZCBv
biBkcm0tbWlzYy1uZXh0CiAtIEFkZGVkIHItYiBmcm9tIENoaWEtSSBXdQoKCiBkcml2ZXJzL2dw
dS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmggICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0
aW8vdmlydGdwdV9mZW5jZS5jIHwgMyArLS0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8v
dmlydGdwdV9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaAppbmRl
eCA5MDQ2MWZlZWFmZGIuLjJkM2U1YjFkZWJiMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X2Rydi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdw
dV9kcnYuaApAQCAtMzU1LDcgKzM1NSw3IEBAIGludCB2aXJ0aW9fZ3B1X21tYXAoc3RydWN0IGZp
bGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsKIGJvb2wgdmlydGlvX2ZlbmNl
X3NpZ25hbGVkKHN0cnVjdCBkbWFfZmVuY2UgKmYpOwogc3RydWN0IHZpcnRpb19ncHVfZmVuY2Ug
KnZpcnRpb19ncHVfZmVuY2VfYWxsb2MoCiAJc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2Rl
dik7Ci1pbnQgdmlydGlvX2dwdV9mZW5jZV9lbWl0KHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAq
dmdkZXYsCit2b2lkIHZpcnRpb19ncHVfZmVuY2VfZW1pdChzdHJ1Y3QgdmlydGlvX2dwdV9kZXZp
Y2UgKnZnZGV2LAogCQkJICBzdHJ1Y3QgdmlydGlvX2dwdV9jdHJsX2hkciAqY21kX2hkciwKIAkJ
CSAgc3RydWN0IHZpcnRpb19ncHVfZmVuY2UgKmZlbmNlKTsKIHZvaWQgdmlydGlvX2dwdV9mZW5j
ZV9ldmVudF9wcm9jZXNzKHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmRldiwKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9mZW5jZS5jIGIvZHJpdmVycy9ncHUv
ZHJtL3ZpcnRpby92aXJ0Z3B1X2ZlbmNlLmMKaW5kZXggOGFlY2MzNmEwNDE3Li43MGQ2YzQzMjk3
NzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9mZW5jZS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9mZW5jZS5jCkBAIC04NSw3ICs4NSw3
IEBAIHN0cnVjdCB2aXJ0aW9fZ3B1X2ZlbmNlICp2aXJ0aW9fZ3B1X2ZlbmNlX2FsbG9jKHN0cnVj
dCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYpCiAJcmV0dXJuIGZlbmNlOwogfQogCi1pbnQgdmly
dGlvX2dwdV9mZW5jZV9lbWl0KHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYsCit2b2lk
IHZpcnRpb19ncHVfZmVuY2VfZW1pdChzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZnZGV2LAog
CQkJICBzdHJ1Y3QgdmlydGlvX2dwdV9jdHJsX2hkciAqY21kX2hkciwKIAkJCSAgc3RydWN0IHZp
cnRpb19ncHVfZmVuY2UgKmZlbmNlKQogewpAQCAtMTAyLDcgKzEwMiw2IEBAIGludCB2aXJ0aW9f
Z3B1X2ZlbmNlX2VtaXQoc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldiwKIAogCWNtZF9o
ZHItPmZsYWdzIHw9IGNwdV90b19sZTMyKFZJUlRJT19HUFVfRkxBR19GRU5DRSk7CiAJY21kX2hk
ci0+ZmVuY2VfaWQgPSBjcHVfdG9fbGU2NChmZW5jZS0+Zi5zZXFubyk7Ci0JcmV0dXJuIDA7CiB9
CiAKIHZvaWQgdmlydGlvX2dwdV9mZW5jZV9ldmVudF9wcm9jZXNzKHN0cnVjdCB2aXJ0aW9fZ3B1
X2RldmljZSAqdmdkZXYsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
