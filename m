Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FDE7FFA0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 19:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3043F6EF21;
	Fri,  2 Aug 2019 17:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8733B6EF19
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 17:29:55 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1htbNJ-0005sQ-Rb; Fri, 02 Aug 2019 19:29:53 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH 0/3] etnaviv softpin support
Date: Fri,  2 Aug 2019 19:29:50 +0200
Message-Id: <20190802172953.4586-1-l.stach@pengutronix.de>
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
Cc: patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKdGhpcyBpbXBsZW1lbnRzIHRoZSBsYXN0IG1pc3NpbmcgYml0cyBmb3Igc29mdHBp
biBha2EgcHV0dGluZyB1c2Vyc3BhY2UKaW4gY2hhcmdlIG9mIHRoZSBHUFUgdmlydHVhbCBhZGRy
ZXNzIHNwYWNlLiBUaGlzIGJ1aWxkcyBvbiB0b3Agb2YgdGhlCnBlci1wcm9jZXNzIGFkZHJlc3Mg
c3BhY2Ugc2VyaWVzLiBBcyB0aGlzIGlzIHF1aXRlIGEgc3RhY2sgb2YgcGF0Y2hlcwpub3csIEkn
bSBwcm92aWRpbmcgYSBnaXQgYnJhbmNoIFsxXSB3aXRoIGFsbCB0aGUgbmVjZXNzYXJ5IHBhdGNo
ZXMuClBsZWFzZSBub3RlIHRoYXQgSSBoYXZlIG5vdCB5ZXQgd29ya2VkIGluIHRoZSBmZWVkYmFj
ayBJIGdvdCBmb3IgdGhlCnBlci1wcm9jZXNzIGFkZHJlc3Mgc3BhY2UgcGF0Y2hlcy4KClRoZSBj
b3JyZXNwb25kaW5nIHVzZXJzcGFjZSBiaXRzIGNhbiBiZSBmb3VuZCBhdCBbMl0uIFRoZSBNZXNh
IGNoYW5nZXMKYWx3YXlzIHVzZSBzb2Z0cGluIHdoZXJlIHBvc3NpYmxlIGFuZCBub3cgZmluYWxs
eSBhbGxvdyBHQzcwMDAgc3VwcG9ydAp0byB3b3JrIHdpdGggYSBub24taG9ycmlibGUgVUFQSSBp
bnRlcmZhY2UuCgpSZWdhcmRzLApMdWNhcwoKWzFdIGh0dHBzOi8vZ2l0LnBlbmd1dHJvbml4LmRl
L2dpdC9sc3QvbGludXggZXRuYXZpdi9leHBlcmltZW50YWwKWzJdIGh0dHBzOi8vZ2l0bGFiLmZy
ZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvbWVyZ2VfcmVxdWVzdHMvMTU1OQoKTHVjYXMgU3RhY2gg
KDMpOgogIGRybS9ldG5hdml2OiBza2lwIGNvbW1hbmQgc3RyZWFtIHZhbGlkYXRpb24gb24gUFBB
UyBjYXBhYmxlIEdQVXMKICBkcm0vZXRuYXZpdjogYWxsb3cgdG8gcmVxdWVzdCBzcGVjaWZpYyB2
aXJ0dWFsIGFkZHJlc3MgZm9yIGdlbSBtYXBwaW5nCiAgZHJtL2V0bmF2aXY6IGltcGxlbWVudCBz
b2Z0cGluCgogZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kcnYuYyAgICAgICAgfCAg
MiArLQogZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kcnYuaCAgICAgICAgfCAgMiAr
KwogZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW0uYyAgICAgICAgfCAgNCArLS0K
IGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtLmggICAgICAgIHwgIDMgKystCiBk
cml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbV9zdWJtaXQuYyB8IDI4ICsrKysrKysr
KysrKysrKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jICAgICAg
ICB8ICA5ICsrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfbW11LmMgICAg
ICAgIHwgMTYgKysrKysrKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfbW11
LmggICAgICAgIHwgIDIgKy0KIGluY2x1ZGUvdWFwaS9kcm0vZXRuYXZpdl9kcm0uaCAgICAgICAg
ICAgICAgIHwgIDUgKysrLQogOSBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspLCAxMCBk
ZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
