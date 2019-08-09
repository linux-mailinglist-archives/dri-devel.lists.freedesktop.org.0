Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A208793D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 14:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A6F6EDD7;
	Fri,  9 Aug 2019 12:04:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1276EDE7
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 12:04:04 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hw3cm-00050R-O5; Fri, 09 Aug 2019 14:04:00 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/etnaviv: pass mmu pointer to etnaviv_core_dump_mmu
Date: Fri,  9 Aug 2019 14:03:59 +0200
Message-Id: <20190809120359.31659-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809120359.31659-1-l.stach@pengutronix.de>
References: <20190809120359.31659-1-l.stach@pengutronix.de>
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

VGhpcyBmdW5jdGlvbiBkb2VzIG9ubHkgbmVlZCB0aGUgbW11IHBhcnQgcGFydCBvZiB0aGUgZ3B1
IHN0cnVjdC4KClNpZ25lZC1vZmYtYnk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4
LmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZHVtcC5jIHwgNiArKyst
LS0KIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZHVtcC5oIHwgNCArKy0tCiAyIGZp
bGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2R1bXAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ldG5hdml2L2V0bmF2aXZfZHVtcC5jCmluZGV4IDI5OTg0NjE5MGU0Yi4uY2M4MDhiMDk0MWMy
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2R1bXAuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2R1bXAuYwpAQCAtOTMsOSArOTMsOSBA
QCBzdGF0aWMgdm9pZCBldG5hdml2X2NvcmVfZHVtcF9yZWdpc3RlcnMoc3RydWN0IGNvcmVfZHVt
cF9pdGVyYXRvciAqaXRlciwKIH0KIAogc3RhdGljIHZvaWQgZXRuYXZpdl9jb3JlX2R1bXBfbW11
KHN0cnVjdCBjb3JlX2R1bXBfaXRlcmF0b3IgKml0ZXIsCi0Jc3RydWN0IGV0bmF2aXZfZ3B1ICpn
cHUsIHNpemVfdCBtbXVfc2l6ZSkKKwlzdHJ1Y3QgZXRuYXZpdl9pb21tdSAqbW11LCBzaXplX3Qg
bW11X3NpemUpCiB7Ci0JZXRuYXZpdl9pb21tdV9kdW1wKGdwdS0+bW11LCBpdGVyLT5kYXRhKTsK
KwlldG5hdml2X2lvbW11X2R1bXAobW11LCBpdGVyLT5kYXRhKTsKIAogCWV0bmF2aXZfY29yZV9k
dW1wX2hlYWRlcihpdGVyLCBFVERVTVBfQlVGX01NVSwgaXRlci0+ZGF0YSArIG1tdV9zaXplKTsK
IH0KQEAgLTE2OSw3ICsxNjksNyBAQCB2b2lkIGV0bmF2aXZfY29yZV9kdW1wKHN0cnVjdCBldG5h
dml2X2dlbV9zdWJtaXQgKnN1Ym1pdCkKIAltZW1zZXQoaXRlci5oZHIsIDAsIGl0ZXIuZGF0YSAt
IGl0ZXIuc3RhcnQpOwogCiAJZXRuYXZpdl9jb3JlX2R1bXBfcmVnaXN0ZXJzKCZpdGVyLCBncHUp
OwotCWV0bmF2aXZfY29yZV9kdW1wX21tdSgmaXRlciwgZ3B1LCBtbXVfc2l6ZSk7CisJZXRuYXZp
dl9jb3JlX2R1bXBfbW11KCZpdGVyLCBncHUtPm1tdSwgbW11X3NpemUpOwogCWV0bmF2aXZfY29y
ZV9kdW1wX21lbSgmaXRlciwgRVREVU1QX0JVRl9SSU5HLCBncHUtPmJ1ZmZlci52YWRkciwKIAkJ
CSAgICAgIGdwdS0+YnVmZmVyLnNpemUsCiAJCQkgICAgICBldG5hdml2X2NtZGJ1Zl9nZXRfdmEo
JmdwdS0+YnVmZmVyKSk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5h
dml2X2R1bXAuaCBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZHVtcC5oCmluZGV4
IDJkOTE2YzI2NjdlZS4uYTEyNWM0NmI4OTViIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZXRuYXZpdi9ldG5hdml2X2R1bXAuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5h
dml2X2R1bXAuaApAQCAtMzUsOCArMzUsOCBAQCBzdHJ1Y3QgZXRuYXZpdl9kdW1wX3JlZ2lzdGVy
cyB7CiB9OwogCiAjaWZkZWYgX19LRVJORUxfXwotc3RydWN0IGV0bmF2aXZfZ3B1Owotdm9pZCBl
dG5hdml2X2NvcmVfZHVtcChzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSk7CitzdHJ1Y3QgZXRuYXZp
dl9nZW1fc3VibWl0Owordm9pZCBldG5hdml2X2NvcmVfZHVtcChzdHJ1Y3QgZXRuYXZpdl9nZW1f
c3VibWl0ICpzdWJtaXQpOwogI2VuZGlmCiAKICNlbmRpZgotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
