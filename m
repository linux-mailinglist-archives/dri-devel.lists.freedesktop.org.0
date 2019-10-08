Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13921D07F6
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E8F6E900;
	Wed,  9 Oct 2019 07:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A716E796;
 Tue,  8 Oct 2019 11:49:23 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iHnLC-0006Y7-IO; Tue, 08 Oct 2019 12:07:42 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iHnLB-0003aj-Qh; Tue, 08 Oct 2019 12:07:41 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/nouveau/kms/nv50-: make unexported items static
Date: Tue,  8 Oct 2019 12:07:38 +0100
Message-Id: <20191008110739.13757-2-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191008110739.13757-1-ben.dooks@codethink.co.uk>
References: <20191008110739.13757-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:50 +0000
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
Cc: David Airlie <airlied@linux.ie>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWFrZSBmdW5jdGlvbnMgdGhhdCBhcmUgbm90IHVzZWQgZGlyZWN0bHkgb3V0c2lkZSB0aGUgZmls
ZQp0aGV5IGFyZSBpbiBzdGF0aWMgdG8gYXZvaWQgdGhlIGZvbGxvd2luZyB3YXJuaW5nczoKCmRy
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWRjNTdkLmM6NzM6MTogd2FybmluZzog
c3ltYm9sICdoZWFkYzU3ZF9vbHV0X2Nscicgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJl
IHN0YXRpYz8KZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvaGVhZGM1N2QuYzo4NTox
OiB3YXJuaW5nOiBzeW1ib2wgJ2hlYWRjNTdkX29sdXRfc2V0JyB3YXMgbm90IGRlY2xhcmVkLiBT
aG91bGQgaXQgYmUgc3RhdGljPwpkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFk
YzU3ZC5jOjE1NToxOiB3YXJuaW5nOiBzeW1ib2wgJ2hlYWRjNTdkX29sdXQnIHdhcyBub3QgZGVj
bGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/CgpTaWduZWQtb2ZmLWJ5OiBCZW4gRG9va3MgPGJl
bi5kb29rc0Bjb2RldGhpbmsuY28udWs+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlz
cG52NTAvaGVhZGM1N2QuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L2Rpc3BudjUwL2hlYWRjNTdkLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9o
ZWFkYzU3ZC5jCmluZGV4IDMyYTdmOWU4NWZiMC4uZjNkNDYyNzZhN2M0IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkYzU3ZC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWRjNTdkLmMKQEAgLTY5LDcgKzY5LDcgQEAgaGVh
ZGM1N2RfcHJvY2FtcChzdHJ1Y3QgbnY1MF9oZWFkICpoZWFkLCBzdHJ1Y3QgbnY1MF9oZWFkX2F0
b20gKmFzeWgpCiAJfQogfQogCi12b2lkCitzdGF0aWMgdm9pZAogaGVhZGM1N2Rfb2x1dF9jbHIo
c3RydWN0IG52NTBfaGVhZCAqaGVhZCkKIHsKIAlzdHJ1Y3QgbnY1MF9kbWFjICpjb3JlID0gJm52
NTBfZGlzcChoZWFkLT5iYXNlLmJhc2UuZGV2KS0+Y29yZS0+Y2hhbjsKQEAgLTgxLDcgKzgxLDcg
QEAgaGVhZGM1N2Rfb2x1dF9jbHIoc3RydWN0IG52NTBfaGVhZCAqaGVhZCkKIAl9CiB9CiAKLXZv
aWQKK3N0YXRpYyB2b2lkCiBoZWFkYzU3ZF9vbHV0X3NldChzdHJ1Y3QgbnY1MF9oZWFkICpoZWFk
LCBzdHJ1Y3QgbnY1MF9oZWFkX2F0b20gKmFzeWgpCiB7CiAJc3RydWN0IG52NTBfZG1hYyAqY29y
ZSA9ICZudjUwX2Rpc3AoaGVhZC0+YmFzZS5iYXNlLmRldiktPmNvcmUtPmNoYW47CkBAIC0xNTEs
NyArMTUxLDcgQEAgaGVhZGM1N2Rfb2x1dF9sb2FkKHN0cnVjdCBkcm1fY29sb3JfbHV0ICppbiwg
aW50IHNpemUsIHZvaWQgX19pb21lbSAqbWVtKQogCXdyaXRldyhyZWFkdyhtZW0gLSA0KSwgbWVt
ICsgNCk7CiB9CiAKLXZvaWQKK3N0YXRpYyB2b2lkCiBoZWFkYzU3ZF9vbHV0KHN0cnVjdCBudjUw
X2hlYWQgKmhlYWQsIHN0cnVjdCBudjUwX2hlYWRfYXRvbSAqYXN5aCkKIHsKIAlhc3loLT5vbHV0
Lm1vZGUgPSAyOyAvKiBESVJFQ1QxMCAqLwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
