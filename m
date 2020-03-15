Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3AF186088
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 00:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29716E2DC;
	Sun, 15 Mar 2020 23:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC856E119
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 04:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=Ud1rAlaZkbW3xeGSxpDHwIRUPo7qLdRG5FQjrplQSJc=; b=YEXf6+YUjq0EgZ0bQ46uq2Ln4b
 QF3CF/JlzvgozkKgXHgGdP93FfaspPJA5A3KZNCZmZO/mDLIwbPMFVevaywjP5zewRTFAv2mPqBRh
 m8P8wwFxXPgUHUE8XrWLU19AwuhU2VbnpRaWnxmf/Vzavi+B8+j/29t1WWl7QMInlwxrflQqrmWB1
 AtHPi8p28EboB+wMLz0hXByXxHSxNnrd2NmUG/feowoRpvkWWkBnoHlArY9W7AXiU8AZ2mhu/Dd4t
 bB7PPAoVTzEArlvSWjKZwOOS96GQcy36MYRwEhm642gWk+f8geny0ks0Ls1bBi0IEqtHiPwVnDX4K
 ZhdA0wDg==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDKbF-0003dY-V2; Sun, 15 Mar 2020 04:10:06 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] fbdev: savage: fix -Wextra build warning
Date: Sat, 14 Mar 2020 21:10:00 -0700
Message-Id: <20200315041002.24473-5-rdunlap@infradead.org>
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

V2hlbiAnU0FWQUdFRkJfREVCVUcnIGlzIG5vdCBkZWZpbmVkLCBtb2RpZnkgdGhlIERCRygpIG1h
Y3JvIHRvIHVzZSB0aGUKbm9fcHJpbnRrKCkgbWFjcm8gaW5zdGVhZCBvZiB1c2luZyA8ZW1wdHk+
LgpUaGlzIGZpeGVzIGEgYnVpbGQgd2FybmluZyB3aGVuIC1XZXh0cmEgaXMgdXNlZCBhbmQgcHJv
dmlkZXMKcHJpbnRrIGZvcm1hdCBjaGVja2luZzoKCi4uL2RyaXZlcnMvdmlkZW8vZmJkZXYvc2F2
YWdlL3NhdmFnZWZiX2RyaXZlci5jOjI0MTE6MTM6IHdhcm5pbmc6IHN1Z2dlc3QgYnJhY2VzIGFy
b3VuZCBlbXB0eSBib2R5IGluIGFuIOKAmGlm4oCZIHN0YXRlbWVudCBbLVdlbXB0eS1ib2R5XQoK
U2lnbmVkLW9mZi1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+CkNjOiBB
bnRvbmlubyBEYXBsYXMgPGFkYXBsYXNAZ21haWwuY29tPgpDYzogQmFydGxvbWllaiBab2xuaWVy
a2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnCi0tLQpBbHRlcm5h
dGl2ZTogdXNlIHByX2RlYnVnKCkgc28gdGhhdCBDT05GSUdfRFlOQU1JQ19ERUJVRyBjYW4gYmUg
dXNlZAphdCB0aGVzZSBzaXRlcy4KCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3NhdmFnZS9zYXZhZ2Vm
Yi5oIHwgICAgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgotLS0gbGludXgtbmV4dC0yMDIwMDMxMy5vcmlnL2RyaXZlcnMvdmlkZW8vZmJkZXYvc2F2
YWdlL3NhdmFnZWZiLmgKKysrIGxpbnV4LW5leHQtMjAyMDAzMTMvZHJpdmVycy92aWRlby9mYmRl
di9zYXZhZ2Uvc2F2YWdlZmIuaApAQCAtMjEsNyArMjEsNyBAQAogI2lmZGVmIFNBVkFHRUZCX0RF
QlVHCiAjIGRlZmluZSBEQkcoeCkJCXByaW50ayAoS0VSTl9ERUJVRyAic2F2YWdlZmI6ICVzXG4i
LCAoeCkpOwogI2Vsc2UKLSMgZGVmaW5lIERCRyh4KQorIyBkZWZpbmUgREJHKHgpCQlub19wcmlu
dGsoeCkKICMgZGVmaW5lIFNhdmFnZVByaW50UmVncyguLi4pCiAjZW5kaWYKIApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
