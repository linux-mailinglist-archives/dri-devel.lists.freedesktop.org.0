Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF2118606E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 00:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B469B6E2DE;
	Sun, 15 Mar 2020 23:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF57E6E11B
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 04:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=geChFULqiY9Qc5SvHVzZJBad8vXBVakwRLiv7qGppg4=; b=X4ZzG6l2kt6LRNml+3PFZwy6FU
 XeJ297XxbtTXbNwsU7xOEUT2qsnoYDV8tE9+0HZuP6EJNNjbTmdttTl3q+M3vJEeqDVFRRRGh5ye8
 0QdJOjuOAqW/q0Bp/dS4Jcq8gE3w72u3wh+gS9nbovQVOdQQIkY/qpLL1Nc6WqR+TspJsZN4h6khF
 5nuQ5AXmif64N5/VPrM2DXs/WekAJcW+oGhPSjeK9v5giDPmeJMXlf7hsvEFxLAOX1qU45XvAa9zB
 /wlh3mRWmU/MK242NQy8FX9bh1l7ps0zA8oJl3AB4vg8GebzVoWJRQBqvQkpitIQS+mku+zkmhiNg
 UgTuGGqw==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDKbE-0003dY-L5; Sun, 15 Mar 2020 04:10:04 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] fbdev: fbmon: fix -Wextra build warnings
Date: Sat, 14 Mar 2020 21:09:57 -0700
Message-Id: <20200315041002.24473-2-rdunlap@infradead.org>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200315041002.24473-1-rdunlap@infradead.org>
References: <20200315041002.24473-1-rdunlap@infradead.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 15 Mar 2020 23:19:06 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-fbdev@vger.kernel.org,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiAnREVCVUcnIGlzIG5vdCBkZWZpbmVkLCBtb2RpZnkgdGhlIERQUklOVEsoKSBtYWNybyB0
byB1c2UgdGhlCm5vX3ByaW50aygpIG1hY3JvIGluc3RlYWQgb2YgdXNpbmcgPGVtcHR5Pi4KVGhp
cyBmaXhlcyBhIGJ1aWxkIHdhcm5pbmcgd2hlbiAtV2V4dHJhIGlzIHVzZWQgYW5kIHByb3ZpZGVz
CnByaW50ayBmb3JtYXQgY2hlY2tpbmc6CgouLi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJt
b24uYzo4MTI6NDc6IHdhcm5pbmc6IHN1Z2dlc3QgYnJhY2VzIGFyb3VuZCBlbXB0eSBib2R5IGlu
IGFuIOKAmGlm4oCZIHN0YXRlbWVudCBbLVdlbXB0eS1ib2R5XQouLi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2NvcmUvZmJtb24uYzo4NDI6MjQ6IHdhcm5pbmc6IHN1Z2dlc3QgYnJhY2VzIGFyb3VuZCBl
bXB0eSBib2R5IGluIGFuIOKAmGVsc2XigJkgc3RhdGVtZW50IFstV2VtcHR5LWJvZHldCi4uL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1vbi5jOjg0NzoyNDogd2FybmluZzogc3VnZ2VzdCBi
cmFjZXMgYXJvdW5kIGVtcHR5IGJvZHkgaW4gYW4g4oCYZWxzZeKAmSBzdGF0ZW1lbnQgWy1XZW1w
dHktYm9keV0KClNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQu
b3JnPgpDYzogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcu
Y29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgtZmJkZXZA
dmdlci5rZXJuZWwub3JnCi0tLQpBbHRlcm5hdGl2ZTogdXNlIHByX2RlYnVnKCkgc28gdGhhdCBD
T05GSUdfRFlOQU1JQ19ERUJVRyBjYW4gYmUgdXNlZAphdCB0aGVzZSBzaXRlcy4KCiBkcml2ZXJz
L3ZpZGVvL2ZiZGV2L2NvcmUvZmJtb24uYyB8ICAgIDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKLS0tIGxpbnV4LW5leHQtMjAyMDAzMTMub3JpZy9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtb24uYworKysgbGludXgtbmV4dC0yMDIwMDMxMy9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtb24uYwpAQCAtNDQsNyArNDQsNyBAQAogI2lmZGVm
IERFQlVHCiAjZGVmaW5lIERQUklOVEsoZm10LCBhcmdzLi4uKSBwcmludGsoZm10LCMjIGFyZ3Mp
CiAjZWxzZQotI2RlZmluZSBEUFJJTlRLKGZtdCwgYXJncy4uLikKKyNkZWZpbmUgRFBSSU5USyhm
bXQsIGFyZ3MuLi4pIG5vX3ByaW50ayhmbXQsICMjYXJncykKICNlbmRpZgogCiAjZGVmaW5lIEZC
TU9OX0ZJWF9IRUFERVIgIDEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
