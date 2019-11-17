Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D22FF904
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6AF6E2E4;
	Sun, 17 Nov 2019 11:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B42A6E1D8
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 02:41:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 12C5828F7B7
Received: by earth.universe (Postfix, from userid 1000)
 id ED59D3C0C9F; Sun, 17 Nov 2019 03:41:39 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [RFCv1 19/42] drm/omap: dsi: drop unused enable_te()
Date: Sun, 17 Nov 2019 03:40:05 +0100
Message-Id: <20191117024028.2233-20-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117024028.2233-1-sebastian.reichel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 17 Nov 2019 11:44:18 +0000
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogU2ViYXN0aWFuIFJlaWNoZWwgPHNlYmFzdGlhbi5yZWljaGVsQGNvbGxh
Ym9yYS5jb20+Ci0tLQogLi4uL2dwdS9kcm0vb21hcGRybS9kaXNwbGF5cy9wYW5lbC1kc2ktY20u
YyAgIHwgMzkgLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNz
L29tYXBkc3MuaCAgICAgICAgIHwgIDIgLQogMiBmaWxlcyBjaGFuZ2VkLCA0MSBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kaXNwbGF5cy9wYW5lbC1k
c2ktY20uYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rpc3BsYXlzL3BhbmVsLWRzaS1jbS5j
CmluZGV4IGIyZWI4MzRjOWVmZi4uMTY0ZjNhMzBkN2YyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vb21hcGRybS9kaXNwbGF5cy9wYW5lbC1kc2ktY20uYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vb21hcGRybS9kaXNwbGF5cy9wYW5lbC1kc2ktY20uYwpAQCAtODgyLDQzICs4ODIsNiBAQCBz
dGF0aWMgaW50IF9kc2ljbV9lbmFibGVfdGUoc3RydWN0IHBhbmVsX2Rydl9kYXRhICpkZGF0YSwg
Ym9vbCBlbmFibGUpCiAJcmV0dXJuIHI7CiB9CiAKLXN0YXRpYyBpbnQgZHNpY21fZW5hYmxlX3Rl
KHN0cnVjdCBvbWFwX2Rzc19kZXZpY2UgKmRzc2RldiwgYm9vbCBlbmFibGUpCi17Ci0Jc3RydWN0
IHBhbmVsX2Rydl9kYXRhICpkZGF0YSA9IHRvX3BhbmVsX2RhdGEoZHNzZGV2KTsKLQlzdHJ1Y3Qg
b21hcF9kc3NfZGV2aWNlICpzcmMgPSBkZGF0YS0+c3JjOwotCWludCByOwotCi0JbXV0ZXhfbG9j
aygmZGRhdGEtPmxvY2spOwotCi0JaWYgKGRkYXRhLT50ZV9lbmFibGVkID09IGVuYWJsZSkKLQkJ
Z290byBlbmQ7Ci0KLQlzcmMtPm9wcy0+ZHNpLmJ1c19sb2NrKHNyYyk7Ci0KLQlpZiAoZGRhdGEt
PmVuYWJsZWQpIHsKLQkJciA9IGRzaWNtX3dha2VfdXAoZGRhdGEpOwotCQlpZiAocikKLQkJCWdv
dG8gZXJyOwotCi0JCXIgPSBfZHNpY21fZW5hYmxlX3RlKGRkYXRhLCBlbmFibGUpOwotCQlpZiAo
cikKLQkJCWdvdG8gZXJyOwotCX0KLQotCWRkYXRhLT50ZV9lbmFibGVkID0gZW5hYmxlOwotCi0J
c3JjLT5vcHMtPmRzaS5idXNfdW5sb2NrKHNyYyk7Ci1lbmQ6Ci0JbXV0ZXhfdW5sb2NrKCZkZGF0
YS0+bG9jayk7Ci0KLQlyZXR1cm4gMDsKLWVycjoKLQlzcmMtPm9wcy0+ZHNpLmJ1c191bmxvY2so
c3JjKTsKLQltdXRleF91bmxvY2soJmRkYXRhLT5sb2NrKTsKLQotCXJldHVybiByOwotfQotCiBz
dGF0aWMgdm9pZCBkc2ljbV91bHBzX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQogewog
CXN0cnVjdCBwYW5lbF9kcnZfZGF0YSAqZGRhdGEgPSBjb250YWluZXJfb2Yod29yaywgc3RydWN0
IHBhbmVsX2Rydl9kYXRhLApAQCAtOTg4LDggKzk1MSw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
b21hcF9kc3NfZGV2aWNlX29wcyBkc2ljbV9vcHMgPSB7CiBzdGF0aWMgY29uc3Qgc3RydWN0IG9t
YXBfZHNzX2RyaXZlciBkc2ljbV9kc3NfZHJpdmVyID0gewogCS51cGRhdGUJCT0gZHNpY21fdXBk
YXRlLAogCS5zeW5jCQk9IGRzaWNtX3N5bmMsCi0KLQkuZW5hYmxlX3RlCT0gZHNpY21fZW5hYmxl
X3RlLAogfTsKIAogc3RhdGljIGludCBkc2ljbV9wcm9iZV9vZihzdHJ1Y3QgbWlwaV9kc2lfZGV2
aWNlICpkc2kpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mvb21hcGRz
cy5oIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL29tYXBkc3MuaAppbmRleCA5YmUxYzY1
OWQzYTQuLmJjNTgzMzQ2YWY0ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0v
ZHNzL29tYXBkc3MuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mvb21hcGRzcy5o
CkBAIC00MTAsOCArNDEwLDYgQEAgc3RydWN0IG9tYXBfZHNzX2RyaXZlciB7CiAJaW50ICgqdXBk
YXRlKShzdHJ1Y3Qgb21hcF9kc3NfZGV2aWNlICpkc3NkZXYsCiAJCQkgICAgICAgdTE2IHgsIHUx
NiB5LCB1MTYgdywgdTE2IGgpOwogCWludCAoKnN5bmMpKHN0cnVjdCBvbWFwX2Rzc19kZXZpY2Ug
KmRzc2Rldik7Ci0KLQlpbnQgKCplbmFibGVfdGUpKHN0cnVjdCBvbWFwX2Rzc19kZXZpY2UgKmRz
c2RldiwgYm9vbCBlbmFibGUpOwogfTsKIAogc3RydWN0IGRzc19kZXZpY2UgKm9tYXBkc3NfZ2V0
X2Rzcyh2b2lkKTsKLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
