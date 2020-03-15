Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E632F186070
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 00:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7256E2FF;
	Sun, 15 Mar 2020 23:19:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00936E11C
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 04:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=Va4hKd5UNxovGjVSxksW2kq4jkfcUPbqde9Oaz+go/c=; b=rcYdKyFvOVbMXkJsWJ4j39OuWV
 LztEjhk8AYp0LBMKYFosLO5hXiKZcXQG+X64+9zbzjLy7n9nQ3Q3CKZ2u4j9naJb3rW0t5YBB+ont
 1RM3Yw71w99ROvZDW1a1FCtulbooAp0uyavD+RdD1yTIAYOgmciTdJqF9uEXixLdMW8gP3icOpVM2
 VlGJftnoYsamCg98ZdS47t+J51YOIEmK8K7qNFYQRW+tebbBWqzXlrB3xLr9URuugr43TYAM5mzg/
 IygbqCJLHojxQveps9ropruKVmcvtp/u0AQV2L8tBX29l0EE86jsdZ9v57ewAX66zHgG48KezL5Yn
 j5BPnSlw==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDKbF-0003dY-Gm; Sun, 15 Mar 2020 04:10:05 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] fbdev: matrox: fix -Wextra build warnings
Date: Sat, 14 Mar 2020 21:09:59 -0700
Message-Id: <20200315041002.24473-4-rdunlap@infradead.org>
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

V2hlbiAnREVCVUcnIGlzIG5vdCBkZWZpbmVkLCBtb2RpZnkgdGhlIGRwcmludGsoKSBtYWNybyB0
byB1c2UgdGhlCm5vX3ByaW50aygpIG1hY3JvIGluc3RlYWQgb2YgdXNpbmcgPGVtcHR5Pi4KVGhp
cyBmaXhlcyBidWlsZCB3YXJuaW5ncyB3aGVuIC1XZXh0cmEgaXMgdXNlZCBhbmQgcHJvdmlkZXMK
cHJpbnRrIGZvcm1hdCBjaGVja2luZzoKCi4uL2RyaXZlcnMvdmlkZW8vZmJkZXYvbWF0cm94L21h
dHJveGZiX2Jhc2UuYzo2MzU6Nzc6IHdhcm5pbmc6IHN1Z2dlc3QgYnJhY2VzIGFyb3VuZCBlbXB0
eSBib2R5IGluIGFuIOKAmGlm4oCZIHN0YXRlbWVudCBbLVdlbXB0eS1ib2R5XQouLi9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L21hdHJveC9tYXRyb3hmYl9UaTMwMjYuYzo2MzI6NTQ6IHdhcm5pbmc6IHN1
Z2dlc3QgYnJhY2VzIGFyb3VuZCBlbXB0eSBib2R5IGluIGFuIOKAmGVsc2XigJkgc3RhdGVtZW50
IFstV2VtcHR5LWJvZHldCi4uL2RyaXZlcnMvdmlkZW8vZmJkZXYvbWF0cm94L21hdHJveGZiX1Rp
MzAyNi5jOjY1NDo1Mzogd2FybmluZzogc3VnZ2VzdCBicmFjZXMgYXJvdW5kIGVtcHR5IGJvZHkg
aW4gYW4g4oCYZWxzZeKAmSBzdGF0ZW1lbnQgWy1XZW1wdHktYm9keV0KClNpZ25lZC1vZmYtYnk6
IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgpDYzogQmFydGxvbWllaiBab2xu
aWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgpDYzogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnCi0tLQpBbHRl
cm5hdGl2ZTogdXNlIHByX2RlYnVnKCkgc28gdGhhdCBDT05GSUdfRFlOQU1JQ19ERUJVRyBjYW4g
YmUgdXNlZAphdCB0aGVzZSBzaXRlcy4KCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L21hdHJveC9tYXRy
b3hmYl9iYXNlLmggfCAgICAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCi0tLSBsaW51eC1uZXh0LTIwMjAwMzEzLm9yaWcvZHJpdmVycy92aWRlby9m
YmRldi9tYXRyb3gvbWF0cm94ZmJfYmFzZS5oCisrKyBsaW51eC1uZXh0LTIwMjAwMzEzL2RyaXZl
cnMvdmlkZW8vZmJkZXYvbWF0cm94L21hdHJveGZiX2Jhc2UuaApAQCAtODYsNyArODYsNyBAQAog
I2lmZGVmIERFQlVHCiAjZGVmaW5lIGRwcmludGsoWC4uLikJcHJpbnRrKFgpCiAjZWxzZQotI2Rl
ZmluZSBkcHJpbnRrKFguLi4pCisjZGVmaW5lIGRwcmludGsoWC4uLikJbm9fcHJpbnRrKFgpCiAj
ZW5kaWYKIAogI2lmbmRlZiBQQ0lfU1NfVkVORE9SX0lEX1NJRU1FTlNfTklYRE9SRgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
