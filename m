Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C553F186083
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 00:20:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56AF6E2DD;
	Sun, 15 Mar 2020 23:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA636E111
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 04:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=rMp7B3SVvE6I2C7kB0azgCg8wG5bTyv58BZYlsnbCqQ=; b=eYCPhWnamD9HpQqcnaeiPnYewi
 Lz5iHnOWc0EigcAeRzS40a0qC+BeCnD+pfRGAgr2wSYr7qR1AIVQFkFRr8xBAurwjtXUL5BPpwD/6
 1KxwOciMpG0f5Fpojl4SXPPicosfRI55uDPZv3vFqbLYp2PpxWGKJOuQ8X+f6yYA8aNvPqP6Rsbm2
 ne/v8ifpfEcQuSnrUOdNaieNosokO2JNVuNZl31juxFJi0K1i0PlwkqmVIAD8NeJ2ap2Dn1WjZ3eA
 9d6NpjtB2yADL+tsqL0EOhxz1uD/WodZ3BFGK2BAtvQrvx5w5owo/iTPh6+nFvzkYCdj2MgRU7qAj
 8IleLKvA==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDKbF-0003dY-2v; Sun, 15 Mar 2020 04:10:05 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] fbdev: aty: fix -Wextra build warning
Date: Sat, 14 Mar 2020 21:09:58 -0700
Message-Id: <20200315041002.24473-3-rdunlap@infradead.org>
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
CnByaW50ayBmb3JtYXQgY2hlY2tpbmc6CgouLi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9hdHlm
Yl9iYXNlLmM6Nzg0OjYxOiB3YXJuaW5nOiBzdWdnZXN0IGJyYWNlcyBhcm91bmQgZW1wdHkgYm9k
eSBpbiBhbiDigJhpZuKAmSBzdGF0ZW1lbnQgWy1XZW1wdHktYm9keV0KClNpZ25lZC1vZmYtYnk6
IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgpDYzogQmFydGxvbWllaiBab2xu
aWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgpDYzogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnCi0tLQpBbHRl
cm5hdGl2ZTogdXNlIHByX2RlYnVnKCkgc28gdGhhdCBDT05GSUdfRFlOQU1JQ19ERUJVRyBjYW4g
YmUgdXNlZAphdCB0aGVzZSBzaXRlcy4KCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9hdHlmYl9i
YXNlLmMgfCAgICAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCi0tLSBsaW51eC1uZXh0LTIwMjAwMzEzLm9yaWcvZHJpdmVycy92aWRlby9mYmRldi9h
dHkvYXR5ZmJfYmFzZS5jCisrKyBsaW51eC1uZXh0LTIwMjAwMzEzL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvYXR5L2F0eWZiX2Jhc2UuYwpAQCAtMTI2LDcgKzEyNiw3IEBACiAjaWZkZWYgREVCVUcKICNk
ZWZpbmUgRFBSSU5USyhmbXQsIGFyZ3MuLi4pCXByaW50ayhLRVJOX0RFQlVHICJhdHlmYjogIiBm
bXQsICMjIGFyZ3MpCiAjZWxzZQotI2RlZmluZSBEUFJJTlRLKGZtdCwgYXJncy4uLikKKyNkZWZp
bmUgRFBSSU5USyhmbXQsIGFyZ3MuLi4pCW5vX3ByaW50ayhmbXQsICMjYXJncykKICNlbmRpZgog
CiAjZGVmaW5lIFBSSU5US0koZm10LCBhcmdzLi4uKQlwcmludGsoS0VSTl9JTkZPICJhdHlmYjog
IiBmbXQsICMjIGFyZ3MpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
