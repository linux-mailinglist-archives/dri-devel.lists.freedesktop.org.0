Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 294BAE663
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 17:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CEB89221;
	Mon, 29 Apr 2019 15:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5CA89050
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 15:29:21 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.89)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hL8DX-0005f3-F3; Mon, 29 Apr 2019 17:29:19 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH] backlight: rave-sp: don't touch initial state and register
 with correct device
Date: Mon, 29 Apr 2019 17:29:19 +0200
Message-Id: <20190429152919.27277-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-fbdev@vger.kernel.org, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyB3YXkgdGhlIGJhY2tsaWdodCBjYW4gYmUgcmVmZXJlbmNlZCB0aHJvdWdoIGl0cyBkZXZp
Y2Ugbm9kZSBhbmQKZW5hYmxpbmcvZGlzYWJsaW5nIGNhbiBiZSBtYW5hZ2VkIHRocm91Z2ggdGhl
IHBhbmVsIGRyaXZlci4KClNpZ25lZC1vZmYtYnk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1
dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3JhdmUtc3AtYmFja2xpZ2h0
LmMgfCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9yYXZlLXNwLWJhY2tsaWdo
dC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcmF2ZS1zcC1iYWNrbGlnaHQuYwppbmRleCA0
NjJmMTRhMWIxOWQuLmQyOTZiZmNmNDM5NiAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvcmF2ZS1zcC1iYWNrbGlnaHQuYworKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9y
YXZlLXNwLWJhY2tsaWdodC5jCkBAIC00OCwxNSArNDgsMTMgQEAgc3RhdGljIGludCByYXZlX3Nw
X2JhY2tsaWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXN0cnVjdCBk
ZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7CiAJc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJkOwog
Ci0JYmQgPSBkZXZtX2JhY2tsaWdodF9kZXZpY2VfcmVnaXN0ZXIoZGV2LCBwZGV2LT5uYW1lLCBk
ZXYtPnBhcmVudCwKKwliZCA9IGRldm1fYmFja2xpZ2h0X2RldmljZV9yZWdpc3RlcihkZXYsIHBk
ZXYtPm5hbWUsIGRldiwKIAkJCQkJICAgIGRldl9nZXRfZHJ2ZGF0YShkZXYtPnBhcmVudCksCiAJ
CQkJCSAgICAmcmF2ZV9zcF9iYWNrbGlnaHRfb3BzLAogCQkJCQkgICAgJnJhdmVfc3BfYmFja2xp
Z2h0X3Byb3BzKTsKIAlpZiAoSVNfRVJSKGJkKSkKIAkJcmV0dXJuIFBUUl9FUlIoYmQpOwogCi0J
YmFja2xpZ2h0X3VwZGF0ZV9zdGF0dXMoYmQpOwotCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
