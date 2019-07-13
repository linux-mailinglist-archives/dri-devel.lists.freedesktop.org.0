Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D59DE67A77
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2019 16:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E481089F3C;
	Sat, 13 Jul 2019 14:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs19.siol.net [185.57.226.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50FF26E3CE
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jul 2019 12:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTP id C04B8520797;
 Sat, 13 Jul 2019 14:04:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id 9JqdsLTKX2Ig; Sat, 13 Jul 2019 14:04:01 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTPS id 7B44B5214F8;
 Sat, 13 Jul 2019 14:04:01 +0200 (CEST)
Received: from localhost.localdomain (cpe-194-152-11-237.cable.triera.net
 [194.152.11.237]) (Authenticated sender: 031275009)
 by mail.siol.net (Zimbra) with ESMTPSA id 0A2A9520797;
 Sat, 13 Jul 2019 14:03:59 +0200 (CEST)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: maxime.ripard@bootlin.com,
	wens@csie.org
Subject: [PATCH 2/3] drm/sun4i: sun8i_csc: Simplify register writes
Date: Sat, 13 Jul 2019 14:03:45 +0200
Message-Id: <20190713120346.30349-3-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190713120346.30349-1-jernej.skrabec@siol.net>
References: <20190713120346.30349-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 13 Jul 2019 14:24:23 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgdHVybnMgb3V0IGFkZGl0aW9uIG9mIDB4MjAwIHRvIGNvbnN0YW50IHBhcnRzICgrMC41KSBp
cyBub3QgcmVhbGx5Cm5lY2Vzc2FyeS4gQmVzaWRlcywgd2UgY2FuIGNvbnNpZGVyIHRoYXQgYmVm
b3JlIGFuZCBmaXggdmFsdWUgaW4gQ1NDCm1hdHJpeC4KClRoaXMgc2ltcGxpZmllcyByZWdpc3Rl
ciB3cml0ZXMgcXVpZXQgYSBiaXQuCgpTaWduZWQtb2ZmLWJ5OiBKZXJuZWogU2tyYWJlYyA8amVy
bmVqLnNrcmFiZWNAc2lvbC5uZXQ+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2Nz
Yy5jIHwgMTEgKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDgg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2Nz
Yy5jIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2NzYy5jCmluZGV4IGI4YzA1OWYxYTEx
OC4uZTA3Yjc4NzZkODliIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlf
Y3NjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2NzYy5jCkBAIC02OSw3ICs2
OSw3IEBAIHN0YXRpYyB2b2lkIHN1bjhpX2NzY19zZXRfY29lZmZpY2llbnRzKHN0cnVjdCByZWdt
YXAgKm1hcCwgdTMyIGJhc2UsCiAJCQkJICAgICAgIGVudW0gc3VuOGlfY3NjX21vZGUgbW9kZSkK
IHsKIAljb25zdCB1MzIgKnRhYmxlOwotCWludCBpLCBkYXRhOworCXUzMiBiYXNlX3JlZzsKIAog
CXN3aXRjaCAobW9kZSkgewogCWNhc2UgU1VOOElfQ1NDX01PREVfWVVWMlJHQjoKQEAgLTgzLDEz
ICs4Myw4IEBAIHN0YXRpYyB2b2lkIHN1bjhpX2NzY19zZXRfY29lZmZpY2llbnRzKHN0cnVjdCBy
ZWdtYXAgKm1hcCwgdTMyIGJhc2UsCiAJCXJldHVybjsKIAl9CiAKLQlmb3IgKGkgPSAwOyBpIDwg
MTI7IGkrKykgewotCQlkYXRhID0gdGFibGVbaV07Ci0JCS8qIEZvciBzb21lIHJlYXNvbiwgMHgy
MDAgbXVzdCBiZSBhZGRlZCB0byBjb25zdGFudCBwYXJ0cyAqLwotCQlpZiAoKChpICsgMSkgJiAz
KSA9PSAwKQotCQkJZGF0YSArPSAweDIwMDsKLQkJcmVnbWFwX3dyaXRlKG1hcCwgU1VOOElfQ1ND
X0NPRUZGKGJhc2UsIGkpLCBkYXRhKTsKLQl9CisJYmFzZV9yZWcgPSBTVU44SV9DU0NfQ09FRkYo
YmFzZSwgMCk7CisJcmVnbWFwX2J1bGtfd3JpdGUobWFwLCBiYXNlX3JlZywgdGFibGUsIDEyKTsK
IH0KIAogc3RhdGljIHZvaWQgc3VuOGlfZGUzX2Njc2Nfc2V0X2NvZWZmaWNpZW50cyhzdHJ1Y3Qg
cmVnbWFwICptYXAsIGludCBsYXllciwKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
