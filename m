Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D06EAD3C4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 09:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8692D898B7;
	Mon,  9 Sep 2019 07:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182B96E29C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 13:48:53 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
 (Authenticated sender: jacopo@jmondi.org)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id CCE5BFF80F;
 Fri,  6 Sep 2019 13:48:50 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3] drm: rcar-du: kms: Expand comment in vsps parsing routine
Date: Fri,  6 Sep 2019 15:50:12 +0200
Message-Id: <20190906135012.10285-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Sep 2019 07:23:02 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RXhwYW5kIGNvbW1lbnQgaW4gdGhlICd2c3BzJyBwYXJzaW5nIHJvdXRpbmUgdG8gc3BlY2lmeSB0
aGUgTElGCmNoYW5uZWwgaW5kZXggZGVmYXVsdHMgdG8gMCBpbiBjYXNlIHRoZSBzZWNvbmQgY2Vs
bCBvZiB0aGUgcHJvcGVydHkKaXMgbm90IHNwZWNpZmllZCB0byByZW1haW4gY29tcGF0aWJsZSB3
aXRoIG9sZGVyIERUIGJpbmRpbmdzLgoKUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxh
dXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1v
bmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgotLS0KVGhpcyB0cml2aWFsIGNoYW5nZSBp
cyBhIGxlZnRvdmVyIGZyb20gYSBzZXJpZXMgdGhhdCBHZWVydCBhbHJlYWR5CnRvb2sgaW4uIFJl
LXNlbmRpbmcgYXMgSSBmb3Jnb3QgdG8gYWRkIHRoZSBkcmkgbGlzdC4KCkxhdXJlbnQsIGNvdWxk
IHlvdSBwaWNrIHRoaXMgb25lIHBsZWFzZT8KClRoYW5rcwogIGoKLS0tCiBkcml2ZXJzL2dwdS9k
cm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jIHwgNiArKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cmNhci1kdS9yY2FyX2R1X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9r
bXMuYwppbmRleCBmYzMwZmZmMGViOGQuLmNiNjM2NjM3MDMyZCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNh
ci1kdS9yY2FyX2R1X2ttcy5jCkBAIC02MjUsNyArNjI1LDExIEBAIHN0YXRpYyBpbnQgcmNhcl9k
dV92c3BzX2luaXQoc3RydWN0IHJjYXJfZHVfZGV2aWNlICpyY2R1KQoKIAkJdnNwc1tqXS5jcnRj
c19tYXNrIHw9IEJJVChpKTsKCi0JCS8qIFN0b3JlIHRoZSBWU1AgcG9pbnRlciBhbmQgcGlwZSBp
bmRleCBpbiB0aGUgQ1JUQy4gKi8KKwkJLyoKKwkJICogU3RvcmUgdGhlIFZTUCBwb2ludGVyIGFu
ZCBwaXBlIGluZGV4IGluIHRoZSBDUlRDLiBJZiB0aGUKKwkJICogc2Vjb25kIGNlbGwgb2YgdGhl
ICd2c3BzJyBzcGVjaWZpZXIgaXNuJ3QgcHJlc2VudCwgZGVmYXVsdAorCQkgKiB0byAwIHRvIHJl
bWFpbiBjb21wYXRpYmxlIHdpdGggb2xkZXIgRFQgYmluZGluZ3MuCisJCSAqLwogCQlyY2R1LT5j
cnRjc1tpXS52c3AgPSAmcmNkdS0+dnNwc1tqXTsKIAkJcmNkdS0+Y3J0Y3NbaV0udnNwX3BpcGUg
PSBjZWxscyA+PSAxID8gYXJncy5hcmdzWzBdIDogMDsKIAl9Ci0tCjIuMjMuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
