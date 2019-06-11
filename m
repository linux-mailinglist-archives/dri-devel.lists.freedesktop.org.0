Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AF541CDE
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393D3892D6;
	Wed, 12 Jun 2019 06:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8AB890DB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 14:24:06 +0000 (UTC)
Received: from [167.98.27.226] (helo=happy.office.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hahOU-0003vU-5F; Tue, 11 Jun 2019 15:04:58 +0100
From: Michael Drake <michael.drake@codethink.co.uk>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Drake <michael.drake@codethink.co.uk>
Subject: [PATCH v1 07/11] ti948: Add sysfs node for alive attribute
Date: Tue, 11 Jun 2019 15:04:08 +0100
Message-Id: <20190611140412.32151-8-michael.drake@codethink.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611140412.32151-1-michael.drake@codethink.co.uk>
References: <20190611140412.32151-1-michael.drake@codethink.co.uk>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:41 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kernel@lists.codethink.co.uk,
 David Airlie <airlied@linux.ie>, Nate Case <ncase@tesla.com>,
 Rob Herring <robh+dt@kernel.org>, Patrick Glaser <pglaser@tesla.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBtYXkgYmUgdXNlZCBieSB1c2Vyc3BhY2UgdG8gZGV0ZXJtaW5lIHRoZSBzdGF0ZQpvZiB0
aGUgZGV2aWNlLgoKU2lnbmVkLW9mZi1ieTogTWljaGFlbCBEcmFrZSA8bWljaGFlbC5kcmFrZUBj
b2RldGhpbmsuY28udWs+CkNjOiBQYXRyaWNrIEdsYXNlciA8cGdsYXNlckB0ZXNsYS5jb20+CkNj
OiBOYXRlIENhc2UgPG5jYXNlQHRlc2xhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3RpOTQ4LmMgfCAyOCArKysrKysrKysrKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMjYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3RpOTQ4LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpOTQ4LmMK
aW5kZXggYjVjNzY2NzExYzRiLi5iNjI0ZWFlYWJiNDMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGk5NDguYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpOTQ4LmMK
QEAgLTQxMiw2ICs0MTIsMTYgQEAgc3RhdGljIHZvaWQgdGk5NDhfYWxpdmVfY2hlY2soc3RydWN0
IHdvcmtfc3RydWN0ICp3b3JrKQogCXNjaGVkdWxlX2RlbGF5ZWRfd29yaygmdGk5NDgtPmFsaXZl
X2NoZWNrLCBUSTk0OF9BTElWRV9DSEVDS19ERUxBWSk7CiB9CiAKK3N0YXRpYyBzc2l6ZV90IGFs
aXZlX3Nob3coc3RydWN0IGRldmljZSAqZGV2LAorCQlzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAq
YXR0ciwgY2hhciAqYnVmKQoreworCXN0cnVjdCB0aTk0OF9jdHggKnRpOTQ4ID0gdGk5NDhfY3R4
X2Zyb21fZGV2KGRldik7CisKKwlyZXR1cm4gc2NucHJpbnRmKGJ1ZiwgUEFHRV9TSVpFLCAiJXVc
biIsICh1bnNpZ25lZCBpbnQpdGk5NDgtPmFsaXZlKTsKK30KKworc3RhdGljIERFVklDRV9BVFRS
X1JPKGFsaXZlKTsKKwogc3RhdGljIGludCB0aTk0OF9wbV9yZXN1bWUoc3RydWN0IGRldmljZSAq
ZGV2KQogewogCXN0cnVjdCB0aTk0OF9jdHggKnRpOTQ4ID0gdGk5NDhfY3R4X2Zyb21fZGV2KGRl
dik7CkBAIC02MTQsMTcgKzYyNCwzMSBAQCBzdGF0aWMgaW50IHRpOTQ4X3Byb2JlKHN0cnVjdCBp
MmNfY2xpZW50ICpjbGllbnQsCiAKIAlpMmNfc2V0X2NsaWVudGRhdGEoY2xpZW50LCB0aTk0OCk7
CiAKKwlyZXQgPSBkZXZpY2VfY3JlYXRlX2ZpbGUoJmNsaWVudC0+ZGV2LCAmZGV2X2F0dHJfYWxp
dmUpOworCWlmIChyZXQpIHsKKwkJZGV2X2VycigmY2xpZW50LT5kZXYsICJDb3VsZCBub3QgY3Jl
YXRlIGFsaXZlIGF0dHJcbiIpOworCQlyZXR1cm4gcmV0OworCX0KKwogCXJldCA9IHRpOTQ4X3Bt
X3Jlc3VtZSgmY2xpZW50LT5kZXYpOwotCWlmIChyZXQgIT0gMCkKLQkJcmV0dXJuIC1FUFJPQkVf
REVGRVI7CisJaWYgKHJldCAhPSAwKSB7CisJCXJldCA9IC1FUFJPQkVfREVGRVI7CisJCWdvdG8g
ZXJyb3I7CisJfQogCiAJZGV2X2luZm8oJnRpOTQ4LT5pMmMtPmRldiwgIkVuZCBwcm9iZSAoYWRk
cjogJXgpXG4iLCB0aTk0OC0+aTJjLT5hZGRyKTsKIAogCXJldHVybiAwOworCitlcnJvcjoKKwlk
ZXZpY2VfcmVtb3ZlX2ZpbGUoJmNsaWVudC0+ZGV2LCAmZGV2X2F0dHJfYWxpdmUpOworCXJldHVy
biByZXQ7CiB9CiAKIHN0YXRpYyBpbnQgdGk5NDhfcmVtb3ZlKHN0cnVjdCBpMmNfY2xpZW50ICpj
bGllbnQpCiB7CisJZGV2aWNlX3JlbW92ZV9maWxlKCZjbGllbnQtPmRldiwgJmRldl9hdHRyX2Fs
aXZlKTsKKwogCXJldHVybiB0aTk0OF9wbV9zdXNwZW5kKCZjbGllbnQtPmRldik7CiB9CiAKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
