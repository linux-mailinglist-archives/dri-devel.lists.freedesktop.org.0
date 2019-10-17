Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A7EDCE38
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122326EBAB;
	Fri, 18 Oct 2019 18:37:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609D36EA52
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 11:12:46 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iL3hx-0002rw-TX; Thu, 17 Oct 2019 12:12:42 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iL3hx-0005o5-8W; Thu, 17 Oct 2019 12:12:41 +0100
From: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To: linux-kernel@lists.codethink.co.uk
Subject: [PATCH] drm/armada: make armada_overlay_duplicate_state static
Date: Thu, 17 Oct 2019 12:12:39 +0100
Message-Id: <20191017111239.22278-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:46 +0000
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 "Ben Dooks \(Codethink\)" <ben.dooks@codethink.co.uk>,
 Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGFybWFkYV9vdmVybGF5X2R1cGxpY2F0ZV9zdGF0ZSBpcyBub3QgZGVjbGFyZWQgb3V0c2lk
ZQp0aGUgdW5pdCwgc28gbWFrZSBpdCBzdGF0aWMgdG8gYXZvaWQgdGhlIGZvbGxvd2luZyBzcGFy
c2UKd2FybmluZzoKCmRyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX292ZXJsYXkuYzozMjg6
MjQ6IHdhcm5pbmc6IHN5bWJvbCAnYXJtYWRhX292ZXJsYXlfZHVwbGljYXRlX3N0YXRlJyB3YXMg
bm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwoKU2lnbmVkLW9mZi1ieTogQmVuIERv
b2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPgotLS0KQ2M6IFJ1c3NlbGwgS2luZyA8bGlu
dXhAYXJtbGludXgub3JnLnVrPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX292ZXJsYXku
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX292ZXJsYXkuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX292ZXJsYXkuYwppbmRleCAwN2YwZGE0ZDliYTEu
LmIzZTk0MjEyMWZkNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFf
b3ZlcmxheS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX292ZXJsYXkuYwpA
QCAtMzI1LDcgKzMyNSw3IEBAIHN0YXRpYyB2b2lkIGFybWFkYV9vdmVybGF5X3Jlc2V0KHN0cnVj
dCBkcm1fcGxhbmUgKnBsYW5lKQogCX0KIH0KIAotc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqCitz
dGF0aWMgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqCiBhcm1hZGFfb3ZlcmxheV9kdXBsaWNhdGVf
c3RhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUpCiB7CiAJc3RydWN0IGFybWFkYV9vdmVybGF5
X3N0YXRlICpzdGF0ZTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
