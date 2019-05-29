Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 512712DAF8
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 12:43:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FFA6E04B;
	Wed, 29 May 2019 10:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CEC16E04B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 10:43:27 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.89)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hVw3A-00016K-AI; Wed, 29 May 2019 12:43:16 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Andrew Morton <akpm@linux-foundation.org>, Yue Hu <huyue2@yulong.com>,
 =?UTF-8?q?Micha=C5=82=20Nazarewicz?= <mina86@mina86.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dmitry Vyukov <dvyukov@google.com>
Subject: [PATCH 1/2] mm: cma: export functions to get CMA base and size
Date: Wed, 29 May 2019 12:43:11 +0200
Message-Id: <20190529104312.27835-1-l.stach@pengutronix.de>
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
Cc: kernel@pengutronix.de, linux-mm@kvack.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWFrZSB0aGVtIHVzYWJsZSBpbiBtb2R1bGVzLiBTb21lIGRyaXZlcnMgd2FudCB0byBrbm93IHdo
ZXJlIHRoZWlyCmRldmljZSBDTUEgYXJlYSBpcyBsb2NhdGVkIHRvIG1ha2UgYmV0dGVyIGRlY2lz
aW9ucyBhYm91dCB0aGUgRE1BCnByb2dyYW1taW5nLgoKU2lnbmVkLW9mZi1ieTogTHVjYXMgU3Rh
Y2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+Ci0tLQogbW0vY21hLmMgfCAyICsrCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbW0vY21hLmMgYi9tbS9jbWEu
YwppbmRleCAzMzQwZWYzNGMxNTQuLjE5MWM4OWJmMDM4ZCAxMDA2NDQKLS0tIGEvbW0vY21hLmMK
KysrIGIvbW0vY21hLmMKQEAgLTQ0LDExICs0NCwxMyBAQCBwaHlzX2FkZHJfdCBjbWFfZ2V0X2Jh
c2UoY29uc3Qgc3RydWN0IGNtYSAqY21hKQogewogCXJldHVybiBQRk5fUEhZUyhjbWEtPmJhc2Vf
cGZuKTsKIH0KK0VYUE9SVF9TWU1CT0xfR1BMKGNtYV9nZXRfYmFzZSk7CiAKIHVuc2lnbmVkIGxv
bmcgY21hX2dldF9zaXplKGNvbnN0IHN0cnVjdCBjbWEgKmNtYSkKIHsKIAlyZXR1cm4gY21hLT5j
b3VudCA8PCBQQUdFX1NISUZUOwogfQorRVhQT1JUX1NZTUJPTF9HUEwoY21hX2dldF9zaXplKTsK
IAogY29uc3QgY2hhciAqY21hX2dldF9uYW1lKGNvbnN0IHN0cnVjdCBjbWEgKmNtYSkKIHsKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
