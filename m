Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2E618F7BB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:52:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E7F896AF;
	Mon, 23 Mar 2020 14:52:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D288975F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id BCAB6FB03;
 Mon, 23 Mar 2020 15:52:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F-X3cVK12ioL; Mon, 23 Mar 2020 15:52:47 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id D9654412BE; Mon, 23 Mar 2020 15:52:46 +0100 (CET)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mxsfb: Make supported modifiers explicit
Date: Mon, 23 Mar 2020 15:52:46 +0100
Message-Id: <26877532e272c12a74c33188e2a72abafc9a2e1c.1584973664.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gY29udHJhc3QgdG8gb3RoZXIgZGlzcGxheSBjb250cm9sbGVycyBvbiBpbXggbGlrZSBEQ1NT
IGFuZCBpcHV2MwpsY2RpZi9teHNmYiBkb2VzIG5vdCBzdXBwb3J0IGRldGlsaW5nIGUuZy4gdml2
YW50ZSB0aWxlZCBsYXlvdXRzLgpTaW5jZSBtZXNhIG1pZ2h0IGFzc3VtZSBvdGhlcndpc2UgbWFr
ZSBpdCBleHBsaWNpdCB0aGF0IG9ubHkKRFJNX0ZPUk1BVF9NT0RfTElORUFSIGlzIHN1cHBvcnRl
ZC4KClNpZ25lZC1vZmYtYnk6IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5jIHwgOSArKysrKysrLS0KIDEgZmlsZSBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL214c2ZiL214
c2ZiX2Rydi5jCmluZGV4IDc2MjM3OTUzMDkyOC4uZmM3MWU3YTdhMDJlIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL214
c2ZiL214c2ZiX2Rydi5jCkBAIC03Myw2ICs3MywxMSBAQCBzdGF0aWMgY29uc3QgdWludDMyX3Qg
bXhzZmJfZm9ybWF0c1tdID0gewogCURSTV9GT1JNQVRfUkdCNTY1CiB9OwogCitzdGF0aWMgY29u
c3QgdWludDY0X3QgbXhzZmJfbW9kaWZpZXJzW10gPSB7CisJRFJNX0ZPUk1BVF9NT0RfTElORUFS
LAorCURSTV9GT1JNQVRfTU9EX0lOVkFMSUQKK307CisKIHN0YXRpYyBzdHJ1Y3QgbXhzZmJfZHJt
X3ByaXZhdGUgKgogZHJtX3BpcGVfdG9fbXhzZmJfZHJtX3ByaXZhdGUoc3RydWN0IGRybV9zaW1w
bGVfZGlzcGxheV9waXBlICpwaXBlKQogewpAQCAtMzM0LDggKzMzOSw4IEBAIHN0YXRpYyBpbnQg
bXhzZmJfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCB1bnNpZ25lZCBsb25nIGZsYWdzKQog
CX0KIAogCXJldCA9IGRybV9zaW1wbGVfZGlzcGxheV9waXBlX2luaXQoZHJtLCAmbXhzZmItPnBp
cGUsICZteHNmYl9mdW5jcywKLQkJCW14c2ZiX2Zvcm1hdHMsIEFSUkFZX1NJWkUobXhzZmJfZm9y
bWF0cyksIE5VTEwsCi0JCQlteHNmYi0+Y29ubmVjdG9yKTsKKwkJCW14c2ZiX2Zvcm1hdHMsIEFS
UkFZX1NJWkUobXhzZmJfZm9ybWF0cyksCisJCQlteHNmYl9tb2RpZmllcnMsIG14c2ZiLT5jb25u
ZWN0b3IpOwogCWlmIChyZXQgPCAwKSB7CiAJCWRldl9lcnIoZHJtLT5kZXYsICJDYW5ub3Qgc2V0
dXAgc2ltcGxlIGRpc3BsYXkgcGlwZVxuIik7CiAJCWdvdG8gZXJyX3ZibGFuazsKLS0gCjIuMjMu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
