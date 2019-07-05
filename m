Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3938660AD0
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 19:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4573D6E51A;
	Fri,  5 Jul 2019 17:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6803F6E519
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 17:15:40 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hjRo8-0006rI-Og; Fri, 05 Jul 2019 19:15:36 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH 2/2] drm/etnaviv: remove unused function
 etnaviv_gem_mapping_reference
Date: Fri,  5 Jul 2019 19:15:36 +0200
Message-Id: <20190705171536.26727-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705171536.26727-1-l.stach@pengutronix.de>
References: <20190705171536.26727-1-l.stach@pengutronix.de>
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
Cc: patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGFzbid0IGJlZW4gdXNlZCBmb3IgcXVpdGUgYSB3aGlsZS4gVGhlcmUgaXMgbm8gcG9pbnQgaW4g
a2VlcGluZwp1bnVzZWQgY29kZSBhcm91bmQuCgpTaWduZWQtb2ZmLWJ5OiBMdWNhcyBTdGFjaCA8
bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5h
dml2X2dlbS5jIHwgMTIgLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5h
dml2X2dlbS5oIHwgIDEgLQogMiBmaWxlcyBjaGFuZ2VkLCAxMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbS5jIGIvZHJpdmVycy9n
cHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW0uYwppbmRleCA3MjdiYjNmNWNlYjIuLmUxOTlhNjgz
M2ZmMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW0uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbS5jCkBAIC0yMzUsMTggKzIz
NSw2IEBAIGV0bmF2aXZfZ2VtX2dldF92cmFtX21hcHBpbmcoc3RydWN0IGV0bmF2aXZfZ2VtX29i
amVjdCAqb2JqLAogCXJldHVybiBOVUxMOwogfQogCi12b2lkIGV0bmF2aXZfZ2VtX21hcHBpbmdf
cmVmZXJlbmNlKHN0cnVjdCBldG5hdml2X3ZyYW1fbWFwcGluZyAqbWFwcGluZykKLXsKLQlzdHJ1
Y3QgZXRuYXZpdl9nZW1fb2JqZWN0ICpldG5hdml2X29iaiA9IG1hcHBpbmctPm9iamVjdDsKLQot
CWRybV9nZW1fb2JqZWN0X2dldCgmZXRuYXZpdl9vYmotPmJhc2UpOwotCi0JbXV0ZXhfbG9jaygm
ZXRuYXZpdl9vYmotPmxvY2spOwotCVdBUk5fT04obWFwcGluZy0+dXNlID09IDApOwotCW1hcHBp
bmctPnVzZSArPSAxOwotCW11dGV4X3VubG9jaygmZXRuYXZpdl9vYmotPmxvY2spOwotfQotCiB2
b2lkIGV0bmF2aXZfZ2VtX21hcHBpbmdfdW5yZWZlcmVuY2Uoc3RydWN0IGV0bmF2aXZfdnJhbV9t
YXBwaW5nICptYXBwaW5nKQogewogCXN0cnVjdCBldG5hdml2X2dlbV9vYmplY3QgKmV0bmF2aXZf
b2JqID0gbWFwcGluZy0+b2JqZWN0OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2
aXYvZXRuYXZpdl9nZW0uaCBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtLmgK
aW5kZXggNzUzYzQ1ODQ5N2QwLi5kN2Q4YTgzNWYzNzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYv
ZXRuYXZpdl9nZW0uaApAQCAtMTIwLDcgKzEyMCw2IEBAIHZvaWQgZXRuYXZpdl9nZW1fcHV0X3Bh
Z2VzKHN0cnVjdCBldG5hdml2X2dlbV9vYmplY3QgKm9iaik7CiAKIHN0cnVjdCBldG5hdml2X3Zy
YW1fbWFwcGluZyAqZXRuYXZpdl9nZW1fbWFwcGluZ19nZXQoCiAJc3RydWN0IGRybV9nZW1fb2Jq
ZWN0ICpvYmosIHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1KTsKLXZvaWQgZXRuYXZpdl9nZW1fbWFw
cGluZ19yZWZlcmVuY2Uoc3RydWN0IGV0bmF2aXZfdnJhbV9tYXBwaW5nICptYXBwaW5nKTsKIHZv
aWQgZXRuYXZpdl9nZW1fbWFwcGluZ191bnJlZmVyZW5jZShzdHJ1Y3QgZXRuYXZpdl92cmFtX21h
cHBpbmcgKm1hcHBpbmcpOwogCiAjZW5kaWYgLyogX19FVE5BVklWX0dFTV9IX18gKi8KLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
