Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB5ED93D2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 16:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18AC76E996;
	Wed, 16 Oct 2019 14:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DEB6E996
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 14:27:20 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1iKkGi-0002DO-Ib; Wed, 16 Oct 2019 16:27:16 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH 2/2] drm/etnaviv: reinstate MMUv1 command buffer window check
Date: Wed, 16 Oct 2019 16:27:16 +0200
Message-Id: <20191016142716.10168-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191016142716.10168-1-l.stach@pengutronix.de>
References: <20191016142716.10168-1-l.stach@pengutronix.de>
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

VGhlIHN3aXRjaCB0byBwZXItcHJvY2VzcyBhZGRyZXNzIHNwYWNlcyBlcnJvbmVvdXNseSBkcm9w
cGVkIHRoZSBjaGVjawp3aGljaCB2YWxpZGF0ZWQgdGhhdCB0aGUgY29tbWFuZCBidWZmZXIgaXMg
bWFwcGVkIHRocm91Z2ggdGhlIGxpbmVhcgphcHBlcnR1cmUgYXMgcmVxdWlyZWQgYnkgdGhlIGhh
cmR3YXJlLiBUaGlzIHR1cm5lZCBhIHN5c3RlbQptaXNjb25maWd1cmF0aW9uIHdpdGggYSBoZWxw
ZnVsIGVycm9yIG1lc3NhZ2UgaW50byBhIHZlcnkgaGFyZCB0bwpkZWJ1ZyBpc3N1ZS4gUmVpbnN0
YXRlIHRoZSBjaGVjayBhdCB0aGUgYXBwcm9wcmlhdGUgbG9jYXRpb24uCgpGaXhlczogMTdlNDY2
MGFlM2Q3IChkcm0vZXRuYXZpdjogaW1wbGVtZW50IHBlci1wcm9jZXNzIGFkZHJlc3Mgc3BhY2Vz
IG9uIE1NVXYyKQpTaWduZWQtb2ZmLWJ5OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25p
eC5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X21tdS5jIHwgMTcgKysr
KysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfbW11
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X21tdS5jCmluZGV4IDM1ZWJhZTZh
MWJlNy4uMzYwN2QzNDhjMjk4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9l
dG5hdml2X21tdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfbW11LmMK
QEAgLTMyOCwxMiArMzI4LDIzIEBAIGV0bmF2aXZfaW9tbXVfY29udGV4dF9pbml0KHN0cnVjdCBl
dG5hdml2X2lvbW11X2dsb2JhbCAqZ2xvYmFsLAogCiAJcmV0ID0gZXRuYXZpdl9jbWRidWZfc3Vi
YWxsb2NfbWFwKHN1YmFsbG9jLCBjdHgsICZjdHgtPmNtZGJ1Zl9tYXBwaW5nLAogCQkJCQkgIGds
b2JhbC0+bWVtb3J5X2Jhc2UpOwotCWlmIChyZXQpIHsKLQkJZ2xvYmFsLT5vcHMtPmZyZWUoY3R4
KTsKLQkJcmV0dXJuIE5VTEw7CisJaWYgKHJldCkKKwkJZ290byBvdXRfZnJlZTsKKworCWlmIChn
bG9iYWwtPnZlcnNpb24gPT0gRVROQVZJVl9JT01NVV9WMSAmJgorCSAgICBjdHgtPmNtZGJ1Zl9t
YXBwaW5nLmlvdmEgPiAweDgwMDAwMDAwKSB7CisJCWRldl9lcnIoZ2xvYmFsLT5kZXYsCisJCSAg
ICAgICAgImNvbW1hbmQgYnVmZmVyIG91dHNpZGUgdmFsaWQgbWVtb3J5IHdpbmRvd1xuIik7CisJ
CWdvdG8gb3V0X3VubWFwOwogCX0KIAogCXJldHVybiBjdHg7CisKK291dF91bm1hcDoKKwlldG5h
dml2X2NtZGJ1Zl9zdWJhbGxvY191bm1hcChjdHgsICZjdHgtPmNtZGJ1Zl9tYXBwaW5nKTsKK291
dF9mcmVlOgorCWdsb2JhbC0+b3BzLT5mcmVlKGN0eCk7CisJcmV0dXJuIE5VTEw7CiB9CiAKIHZv
aWQgZXRuYXZpdl9pb21tdV9yZXN0b3JlKHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1LAotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
