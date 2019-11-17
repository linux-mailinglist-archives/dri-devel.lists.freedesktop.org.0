Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CD7FF91A
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F756E33F;
	Sun, 17 Nov 2019 11:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B916E1F1
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 02:41:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 92B2428F761
Received: by earth.universe (Postfix, from userid 1000)
 id A51983C0C7E; Sun, 17 Nov 2019 03:41:39 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [RFCv1 06/42] drm/omap: dsi: unexport specific data transfer functions
Date: Sun, 17 Nov 2019 03:39:52 +0100
Message-Id: <20191117024028.2233-7-sebastian.reichel@collabora.com>
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

QWZ0ZXIgY29udmVydGluZyBhbGwgRFNJIGRyaXZlcnMsIHVuZXhwb3J0IHRoZSBzcGVjaWZpYyB0
cmFuc2ZlcgpmdW5jdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBTZWJhc3RpYW4gUmVpY2hlbCA8c2Vi
YXN0aWFuLnJlaWNoZWxAY29sbGFib3JhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9kc3MvZHNpLmMgICAgIHwgMTIgLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9kc3Mvb21hcGRzcy5oIHwgMjAgLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdl
ZCwgMzIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0v
ZHNzL2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2RzaS5jCmluZGV4IDc1NjA0
MTFmOGVkNi4uZGU0ZWM2MDU1NDkwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9kc3MvZHNpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2RzaS5jCkBAIC00
OTQxLDE4ICs0OTQxLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvbWFwX2Rzc19kZXZpY2Vfb3Bz
IGRzaV9vcHMgPSB7CiAJCS5yZWxlYXNlX3ZjID0gZHNpX3JlbGVhc2VfdmMsCiAKIAkJLnRyYW5z
ZmVyID0gb21hcF9kc2lfdHJhbnNmZXIsCi0KLQkJLmRjc193cml0ZSA9IGRzaV92Y19kY3Nfd3Jp
dGUsCi0JCS5kY3Nfd3JpdGVfbm9zeW5jID0gZHNpX3ZjX2Rjc193cml0ZV9ub3N5bmMsCi0JCS5k
Y3NfcmVhZCA9IGRzaV92Y19kY3NfcmVhZCwKLQotCQkuZ2VuX3dyaXRlID0gZHNpX3ZjX2dlbmVy
aWNfd3JpdGUsCi0JCS5nZW5fd3JpdGVfbm9zeW5jID0gZHNpX3ZjX2dlbmVyaWNfd3JpdGVfbm9z
eW5jLAotCQkuZ2VuX3JlYWQgPSBkc2lfdmNfZ2VuZXJpY19yZWFkLAotCi0JCS5idGFfc3luYyA9
IGRzaV92Y19zZW5kX2J0YV9zeW5jLAotCi0JCS5zZXRfbWF4X3J4X3BhY2tldF9zaXplID0gZHNp
X3ZjX3NldF9tYXhfcnhfcGFja2V0X3NpemUsCiAJfSwKIH07CiAKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9vbWFwZHNzLmggYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9kc3Mvb21hcGRzcy5oCmluZGV4IDA0OTUyYzI5MTUzNy4uNzlhZTQwNzNjMzVmIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mvb21hcGRzcy5oCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9vbWFwZHJtL2Rzcy9vbWFwZHNzLmgKQEAgLTMxNiwyNiArMzE2LDYgQEAgc3RydWN0
IG9tYXBkc3NfZHNpX29wcyB7CiAJLyogZGF0YSB0cmFuc2ZlciAqLwogCXNzaXplX3QgKCp0cmFu
c2Zlcikoc3RydWN0IG9tYXBfZHNzX2RldmljZSAqZHNzZGV2LAogCQkJY29uc3Qgc3RydWN0IG1p
cGlfZHNpX21zZyAqbXNnKTsKLQotCWludCAoKmRjc193cml0ZSkoc3RydWN0IG9tYXBfZHNzX2Rl
dmljZSAqZHNzZGV2LCBpbnQgY2hhbm5lbCwKLQkJCWNvbnN0IHU4ICpkYXRhLCBpbnQgbGVuKTsK
LQlpbnQgKCpkY3Nfd3JpdGVfbm9zeW5jKShzdHJ1Y3Qgb21hcF9kc3NfZGV2aWNlICpkc3NkZXYs
IGludCBjaGFubmVsLAotCQkJY29uc3QgdTggKmRhdGEsIGludCBsZW4pOwotCWludCAoKmRjc19y
ZWFkKShzdHJ1Y3Qgb21hcF9kc3NfZGV2aWNlICpkc3NkZXYsIGludCBjaGFubmVsLCB1OCBkY3Nf
Y21kLAotCQkJdTggKmRhdGEsIGludCBsZW4pOwotCi0JaW50ICgqZ2VuX3dyaXRlKShzdHJ1Y3Qg
b21hcF9kc3NfZGV2aWNlICpkc3NkZXYsIGludCBjaGFubmVsLAotCQkJY29uc3QgdTggKmRhdGEs
IGludCBsZW4pOwotCWludCAoKmdlbl93cml0ZV9ub3N5bmMpKHN0cnVjdCBvbWFwX2Rzc19kZXZp
Y2UgKmRzc2RldiwgaW50IGNoYW5uZWwsCi0JCQljb25zdCB1OCAqZGF0YSwgaW50IGxlbik7Ci0J
aW50ICgqZ2VuX3JlYWQpKHN0cnVjdCBvbWFwX2Rzc19kZXZpY2UgKmRzc2RldiwgaW50IGNoYW5u
ZWwsCi0JCQljb25zdCB1OCAqcmVxZGF0YSwgaW50IHJlcWxlbiwKLQkJCXU4ICpkYXRhLCBpbnQg
bGVuKTsKLQotCWludCAoKmJ0YV9zeW5jKShzdHJ1Y3Qgb21hcF9kc3NfZGV2aWNlICpkc3NkZXYs
IGludCBjaGFubmVsKTsKLQotCWludCAoKnNldF9tYXhfcnhfcGFja2V0X3NpemUpKHN0cnVjdCBv
bWFwX2Rzc19kZXZpY2UgKmRzc2RldiwKLQkJCWludCBjaGFubmVsLCB1MTYgcGxlbik7CiB9Owog
CiBzdHJ1Y3Qgb21hcF9kc3NfZGV2aWNlX29wcyB7Ci0tIAoyLjI0LjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
