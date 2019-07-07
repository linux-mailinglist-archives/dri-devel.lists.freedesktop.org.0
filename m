Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1A7615DF
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2019 20:24:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4C989AEA;
	Sun,  7 Jul 2019 18:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C78889AEA
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 18:24:10 +0000 (UTC)
Received: from pendragon.nordic-sky.finnair.com (unknown [38.98.37.142])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 68219CC;
 Sun,  7 Jul 2019 20:23:47 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 13/60] drm/bridge: tfp410: Don't include drmP.h
Date: Sun,  7 Jul 2019 21:18:50 +0300
Message-Id: <20190707181937.6250-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562523849;
 bh=e+7YCJHLD5sQ7pZITxMIeH5Vi72llC4PLGgTfzY6Hz0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UViPulu1hNFcUfM3uBoMrpeAoOuOSXvG72QWEgUMeFaBf/tZAGToWVizi0YmBorDo
 fUw1zIaHYfwvXD+U1u3fnnKePznwtBnRArpwOr2WGKgvQEoED42YTzWZ7AtTKvXpEq
 Yq+gNq72h/DtyAMkPuEal4bmTzboY21/IL1r5hBc=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRybVAuaCBoZWFkZXIgaXMgZGVwcmVjYXRlZCwgcmVwbGFjZSBpdCB3aXRoIHRoZSBoZWFk
ZXJzCnNwZWNpZmljYWxseSBuZWVkZWQgYnkgdGhlIHRmcDQxMCBkcml2ZXIuIFdoaWxlIGF0IGl0
LCByZXBsYWNlIHRoZSBEUk0KcHJpbnQgbWFjcm9zIHdpdGggZGV2X2luZm8oKSBhbmQgZGV2X2Vy
cigpIGluc3RlYWQgb2YgaW5jbHVkaW5nCmRybV9wcmludC5oCgpTaWduZWQtb2ZmLWJ5OiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYyB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRm
cDQxMC5jCmluZGV4IDhkNDY5MGU0MzZjMy4uYTFjYWQ3NzdiMDU3IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvdGktdGZwNDEwLmMKQEAgLTE4LDYgKzE4LDcgQEAKICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9y
bV9kZXZpY2UuaD4KIAogI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPgorI2luY2x1
ZGUgPGRybS9kcm1fYnJpZGdlLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9jcnRjLmg+CiAjaW5jbHVk
ZSA8ZHJtL2RybV9wcmludC5oPgogI2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+CkBA
IC02NCw3ICs2NSw4IEBAIHN0YXRpYyBpbnQgdGZwNDEwX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqY29ubmVjdG9yKQogCiAJZWRpZCA9IGRybV9nZXRfZWRpZChjb25uZWN0b3IsIGR2
aS0+ZGRjKTsKIAlpZiAoIWVkaWQpIHsKLQkJRFJNX0lORk8oIkVESUQgcmVhZCBmYWlsZWQuIEZh
bGxiYWNrIHRvIHN0YW5kYXJkIG1vZGVzXG4iKTsKKwkJZGV2X2luZm8oZHZpLT5kZXYsCisJCQkg
IkVESUQgcmVhZCBmYWlsZWQuIEZhbGxiYWNrIHRvIHN0YW5kYXJkIG1vZGVzXG4iKTsKIAkJZ290
byBmYWxsYmFjazsKIAl9CiAKQEAgLTM2NSw3ICszNjcsNyBAQCBzdGF0aWMgaW50IHRmcDQxMF9p
bml0KHN0cnVjdCBkZXZpY2UgKmRldiwgYm9vbCBpMmMpCiAJCQlJUlFGX1RSSUdHRVJfRkFMTElO
RyB8IElSUUZfT05FU0hPVCwKIAkJCSJoZG1pLWhwZCIsIGR2aSk7CiAJCWlmIChyZXQpIHsKLQkJ
CURSTV9FUlJPUigiZmFpbGVkIHRvIHJlZ2lzdGVyIGhwZCBpbnRlcnJ1cHRcbiIpOworCQkJZGV2
X2VycihkZXYsICJmYWlsZWQgdG8gcmVnaXN0ZXIgaHBkIGludGVycnVwdFxuIik7CiAJCQlnb3Rv
IGZhaWw7CiAJCX0KIAl9Ci0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
