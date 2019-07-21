Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A67E6F9F4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 09:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43CDE89B51;
	Mon, 22 Jul 2019 07:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conuserg-09.nifty.com (conuserg-09.nifty.com [210.131.2.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB16B89B78
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2019 07:40:15 +0000 (UTC)
Received: from grover.flets-west.jp (softbank126026094249.bbtec.net
 [126.26.94.249]) (authenticated)
 by conuserg-09.nifty.com with ESMTP id x6L7did6032459;
 Sun, 21 Jul 2019 16:39:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x6L7did6032459
X-Nifty-SrcIP: [126.26.94.249]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH] backlight: add include guards to platform_lcd.h and ili9320.h
Date: Sun, 21 Jul 2019 16:39:40 +0900
Message-Id: <20190721073940.11422-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 22 Jul 2019 07:08:15 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1563694785;
 bh=W0RUjdCqSIfb8kJEGYHindDEe89Kcz2+NHbUKHueqzc=;
 h=From:To:Cc:Subject:Date:From;
 b=XAJuBIGZ21ReoDh6CZlT/2Sh/YRKG/vB22kdveU1dNeOC1kP38EjuChgisNKIVrOw
 nP0mTnaux9Vc7IwAb79qiFVDk6PSB9LrZokQqd9jw6smAresbU8xv06eVzbpSDLc4S
 fehvQyXWPn3fdcTWAshQ32TgF7FyBabdgfbtVSK4wsZeT0W712INelHMpqzzhyDMQW
 lWP+YKTKNarlwoj24ACDAgVTGUrpd/qvNJ3J+aOVkleLJL5UeRp+lTx1Bt1nka7nvg
 mveHMD/kMimOPZ/0BR+Z12zrY3GEf96L2rxL4P8SW3v6Tz+J2O0ZQz5umGzJRXAmHR
 +hneKraGoJl2g==
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
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGhlYWRlciBpbmNsdWRlIGd1YXJkcyBqdXN0IGluIGNhc2UuCgpTaWduZWQtb2ZmLWJ5OiBN
YXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPgotLS0KCiBpbmNs
dWRlL3ZpZGVvL2lsaTkzMjAuaCAgICAgIHwgNCArKysrCiBpbmNsdWRlL3ZpZGVvL3BsYXRmb3Jt
X2xjZC5oIHwgNCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvdmlkZW8vaWxpOTMyMC5oIGIvaW5jbHVkZS92aWRlby9pbGk5MzIwLmgK
aW5kZXggNjJmNDI0ZjBiYzUyLi5iNzZhMGI4ZjE2ZmMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdmlk
ZW8vaWxpOTMyMC5oCisrKyBiL2luY2x1ZGUvdmlkZW8vaWxpOTMyMC5oCkBAIC05LDYgKzksOSBA
QAogICogaHR0cDovL2FybWxpbnV4LnNpbXRlYy5jby51ay8KICovCiAKKyNpZm5kZWYgX1ZJREVP
X0lMSTkzMjBfSAorI2RlZmluZSBfVklERU9fSUxJOTMyMF9ICisKICNkZWZpbmUgSUxJOTMyMF9S
RUcoeCkJKHgpCiAKICNkZWZpbmUgSUxJOTMyMF9JTkRFWAkJCUlMSTkzMjBfUkVHKDB4MDApCkBA
IC0xOTYsMyArMTk5LDQgQEAgc3RydWN0IGlsaTkzMjBfcGxhdGRhdGEgewogCXVuc2lnbmVkIHNo
b3J0CWludGVyZmFjZTY7CiB9OwogCisjZW5kaWYgLyogX1ZJREVPX0lMSTkzMjBfSCAqLwpkaWZm
IC0tZ2l0IGEvaW5jbHVkZS92aWRlby9wbGF0Zm9ybV9sY2QuaCBiL2luY2x1ZGUvdmlkZW8vcGxh
dGZvcm1fbGNkLmgKaW5kZXggNmE5NTE4NGEyOGMxLi5jNjhmM2Y0NWI1YzEgMTAwNjQ0Ci0tLSBh
L2luY2x1ZGUvdmlkZW8vcGxhdGZvcm1fbGNkLmgKKysrIGIvaW5jbHVkZS92aWRlby9wbGF0Zm9y
bV9sY2QuaApAQCAtNyw2ICs3LDkgQEAKICAqIEdlbmVyaWMgcGxhdGZvcm0tZGV2aWNlIExDRCBw
b3dlciBjb250cm9sIGludGVyZmFjZS4KICovCiAKKyNpZm5kZWYgX1ZJREVPX1BMQVRGT1JNX0xD
RF9ICisjZGVmaW5lIF9WSURFT19QTEFURk9STV9MQ0RfSAorCiBzdHJ1Y3QgcGxhdF9sY2RfZGF0
YTsKIHN0cnVjdCBmYl9pbmZvOwogCkBAIC0xNiwzICsxOSw0IEBAIHN0cnVjdCBwbGF0X2xjZF9k
YXRhIHsKIAlpbnQJKCptYXRjaF9mYikoc3RydWN0IHBsYXRfbGNkX2RhdGEgKiwgc3RydWN0IGZi
X2luZm8gKik7CiB9OwogCisjZW5kaWYgLyogX1ZJREVPX1BMQVRGT1JNX0xDRF9IICovCi0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
