Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F14E1D07F7
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D666E902;
	Wed,  9 Oct 2019 07:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1698 seconds by postgrey-1.36 at gabe;
 Tue, 08 Oct 2019 11:36:02 UTC
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87FF86E0FD;
 Tue,  8 Oct 2019 11:36:02 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iHnma-0007Yu-Mu; Tue, 08 Oct 2019 12:36:00 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iHnma-0007hi-7q; Tue, 08 Oct 2019 12:36:00 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/nouveau/fifo/tu102: make tu102_fifo_runlist static
Date: Tue,  8 Oct 2019 12:35:56 +0100
Message-Id: <20191008113559.29569-2-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191008113559.29569-1-ben.dooks@codethink.co.uk>
References: <20191008113559.29569-1-ben.dooks@codethink.co.uk>
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

VGhlIHR1MTAyX2ZpZm9fcnVubGlzdCBpcyBub3QgZXhvcnRlZCwgc28gbWFrZSBpdCBzdGF0aWMK
dG8gYXZvaWQgdGhlIGZvbGxvd2luZyB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bnZrbS9lbmdpbmUvZmlmby90dTEwMi5jOjQ3OjE6IHdhcm5pbmc6IHN5bWJvbCAndHUxMDJfZmlm
b19ydW5saXN0JyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwoKU2lnbmVk
LW9mZi1ieTogQmVuIERvb2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2ZpZm8vdHUxMDIuYyB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2ZpZm8vdHUxMDIuYyBiL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2ZpZm8vdHUxMDIuYwppbmRleCAwMDVmM2UxNzI5
YjkuLjNlNzhmNWI2YWNjYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZr
bS9lbmdpbmUvZmlmby90dTEwMi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20v
ZW5naW5lL2ZpZm8vdHUxMDIuYwpAQCAtNDMsNyArNDMsNyBAQCB0dTEwMl9maWZvX3J1bmxpc3Rf
Y29tbWl0KHN0cnVjdCBnazEwNF9maWZvICpmaWZvLCBpbnQgcnVubCwKIAkvKlhYWDogaG93IHRv
IHdhaXQ/IGNhbiB5b3UgZXZlbiB3YWl0PyAqLwogfQogCi1jb25zdCBzdHJ1Y3QgZ2sxMDRfZmlm
b19ydW5saXN0X2Z1bmMKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZ2sxMDRfZmlmb19ydW5saXN0X2Z1
bmMKIHR1MTAyX2ZpZm9fcnVubGlzdCA9IHsKIAkuc2l6ZSA9IDE2LAogCS5jZ3JwID0gZ3YxMDBf
Zmlmb19ydW5saXN0X2NncnAsCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
