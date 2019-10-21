Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CA6DF7F6
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 00:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA1F6E2A3;
	Mon, 21 Oct 2019 22:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550ED6E14B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 14:52:13 +0000 (UTC)
Received: from ramsan ([84.194.98.4]) by baptiste.telenet-ops.be with bizsmtp
 id GErr2100905gfCL01Err8t; Mon, 21 Oct 2019 16:52:11 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iMZ2F-00075n-1J; Mon, 21 Oct 2019 16:51:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iMZ2E-0008FW-Vt; Mon, 21 Oct 2019 16:51:50 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Breno=20Leit=C3=A3o?= <leitao@debian.org>,
 Nayna Jain <nayna@linux.ibm.com>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David@rox.of.borg, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Casey Leedom <leedom@chelsio.com>,
 Shannon Nelson <snelson@pensando.io>,
 Pensando Drivers <drivers@pensando.io>, Kevin Hilman <khilman@kernel.org>,
 Nishanth Menon <nm@ti.com>
Subject: [PATCH 3/5] drm/amdgpu: Remove superfluous void * cast in
 debugfs_create_file() call
Date: Mon, 21 Oct 2019 16:51:47 +0200
Message-Id: <20191021145149.31657-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191021145149.31657-1-geert+renesas@glider.be>
References: <20191021145149.31657-1-geert+renesas@glider.be>
X-Mailman-Approved-At: Mon, 21 Oct 2019 22:23:09 +0000
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
Cc: amd-gfx@lists.freedesktop.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-pm@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgaXMgbm8gbmVlZCB0byBjYXN0IGEgdHlwZWQgcG9pbnRlciB0byBhIHZvaWQgcG9pbnRl
ciB3aGVuIGNhbGxpbmcKYSBmdW5jdGlvbiB0aGF0IGFjY2VwdHMgdGhlIGxhdHRlci4gIFJlbW92
ZSBpdCwgYXMgdGhlIGNhc3QgcHJldmVudHMKZnVydGhlciBjb21waWxlciBjaGVja3MuCgpTaWdu
ZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMgfCA0ICsrLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMKaW5kZXggNTY1MmNjNzJlZDNh
OWIzYS4uYjk3YTM4YjFlMDg5YjNkNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RlYnVnZnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGVidWdmcy5jCkBAIC0xMDkwLDggKzEwOTAsOCBAQCBpbnQgYW1kZ3B1X2RlYnVnZnNf
aW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKIAlhZGV2LT5kZWJ1Z2ZzX3ByZWVt
cHQgPQogCQlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJhbWRncHVfcHJlZW1wdF9pYiIsIDA2MDAsCi0J
CQkJICAgIGFkZXYtPmRkZXYtPnByaW1hcnktPmRlYnVnZnNfcm9vdCwKLQkJCQkgICAgKHZvaWQg
KilhZGV2LCAmZm9wc19pYl9wcmVlbXB0KTsKKwkJCQkgICAgYWRldi0+ZGRldi0+cHJpbWFyeS0+
ZGVidWdmc19yb290LCBhZGV2LAorCQkJCSAgICAmZm9wc19pYl9wcmVlbXB0KTsKIAlpZiAoIShh
ZGV2LT5kZWJ1Z2ZzX3ByZWVtcHQpKSB7CiAJCURSTV9FUlJPUigidW5hYmxlIHRvIGNyZWF0ZSBh
bWRncHVfcHJlZW1wdF9pYiBkZWJ1Z3NmcyBmaWxlXG4iKTsKIAkJcmV0dXJuIC1FSU87Ci0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
