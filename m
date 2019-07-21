Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F496F361
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jul 2019 15:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5509089B48;
	Sun, 21 Jul 2019 13:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FF9899F0
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2019 13:19:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9DA4D308FE9A;
 Sun, 21 Jul 2019 13:19:21 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-49.ams2.redhat.com
 [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A4D660BFB;
 Sun, 21 Jul 2019 13:19:20 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Peter Jones <pjones@redhat.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] efifb: BGRT: Improve efifb_bgrt_sanity_check
Date: Sun, 21 Jul 2019 15:19:18 +0200
Message-Id: <20190721131918.10115-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Sun, 21 Jul 2019 13:19:22 +0000 (UTC)
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
Cc: Hans de Goede <hdegoede@redhat.com>, linux-fbdev@vger.kernel.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIHZhcmlvdXMgcmVhc29ucywgYXQgbGVhc3Qgd2l0aCB4ODYgRUZJIGZpcm13YXJlcywgdGhl
IHhvZmZzZXQgYW5kCnlvZmZzZXQgaW4gdGhlIEJHUlQgaW5mbyBhcmUgbm90IGFsd2F5cyByZWxp
YWJsZS4KCkV4dGVuc2l2ZSB0ZXN0aW5nIGhhcyBzaG93biB0aGF0IHdoZW4gdGhlIGluZm8gaXMg
Y29ycmVjdCwgdGhlCkJHUlQgaW1hZ2UgaXMgYWx3YXlzIGV4YWN0bHkgY2VudGVyZWQgaG9yaXpv
bnRhbGx5ICh0aGUgeW9mZnNldCB2YXJpYWJsZQppcyBtb3JlIHZhcmlhYmxlIGFuZCBub3QgYWx3
YXlzIHByZWRpY3RhYmxlKS4KClRoaXMgY29tbWl0IHNpbXBsaWZpZXMgLyBpbXByb3ZlcyB0aGUg
YmdydF9zYW5pdHlfY2hlY2sgdG8gc2ltcGx5CmNoZWNrIHRoYXQgdGhlIEJHUlQgaW1hZ2UgaXMg
ZXhhY3RseSBjZW50ZXJlZCBob3Jpem9udGFsbHkgYW5kIHNraXBzCihyZSlkcmF3aW5nIGl0IHdo
ZW4gaXQgaXMgbm90LgoKVGhpcyBmaXhlcyB0aGUgQkdSVCBpbWFnZSBzb21ldGltZXMgYmVpbmcg
ZHJhd24gaW4gdGhlIHdyb25nIHBsYWNlLgoKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKRml4
ZXM6IDg4ZmU0Y2ViMjQ0NyAoImVmaWZiOiBCR1JUOiBEbyBub3QgY29weSB0aGUgYm9vdCBncmFw
aGljcyBmb3Igbm9uIG5hdGl2ZSByZXNvbHV0aW9ucyIpClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUg
R29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9lZmlm
Yi5jIHwgMjcgKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L2VmaWZiLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2VmaWZiLmMKaW5kZXggZGZhOGRk
NDdkMTlkLi41YjNjZWY5YmY3OTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvZWZp
ZmIuYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2VmaWZiLmMKQEAgLTEyMiwyOCArMTIyLDEz
IEBAIHN0YXRpYyB2b2lkIGVmaWZiX2NvcHlfYm1wKHU4ICpzcmMsIHUzMiAqZHN0LCBpbnQgd2lk
dGgsIHN0cnVjdCBzY3JlZW5faW5mbyAqc2kpCiAgKi8KIHN0YXRpYyBib29sIGVmaWZiX2JncnRf
c2FuaXR5X2NoZWNrKHN0cnVjdCBzY3JlZW5faW5mbyAqc2ksIHUzMiBibXBfd2lkdGgpCiB7Ci0J
c3RhdGljIGNvbnN0IGludCBkZWZhdWx0X3Jlc29sdXRpb25zW11bMl0gPSB7Ci0JCXsgIDgwMCwg
IDYwMCB9LAotCQl7IDEwMjQsICA3NjggfSwKLQkJeyAxMjgwLCAxMDI0IH0sCi0JfTsKLQl1MzIg
aSwgcmlnaHRfbWFyZ2luOwotCi0JZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoZGVmYXVsdF9y
ZXNvbHV0aW9ucyk7IGkrKykgewotCQlpZiAoZGVmYXVsdF9yZXNvbHV0aW9uc1tpXVswXSA9PSBz
aS0+bGZiX3dpZHRoICYmCi0JCSAgICBkZWZhdWx0X3Jlc29sdXRpb25zW2ldWzFdID09IHNpLT5s
ZmJfaGVpZ2h0KQotCQkJYnJlYWs7Ci0JfQotCS8qIElmIG5vdCBhIGRlZmF1bHQgcmVzb2x1dGlv
biB1c2VkIGZvciB0ZXh0bW9kZSwgdGhpcyBzaG91bGQgYmUgZmluZSAqLwotCWlmIChpID49IEFS
UkFZX1NJWkUoZGVmYXVsdF9yZXNvbHV0aW9ucykpCi0JCXJldHVybiB0cnVlOwotCi0JLyogSWYg
dGhlIHJpZ2h0IG1hcmdpbiBpcyA1IHRpbWVzIHNtYWxsZXIgdGhlbiB0aGUgbGVmdCBvbmUsIHJl
amVjdCAqLwotCXJpZ2h0X21hcmdpbiA9IHNpLT5sZmJfd2lkdGggLSAoYmdydF90YWIuaW1hZ2Vf
b2Zmc2V0X3ggKyBibXBfd2lkdGgpOwotCWlmIChyaWdodF9tYXJnaW4gPCAoYmdydF90YWIuaW1h
Z2Vfb2Zmc2V0X3ggLyA1KSkKLQkJcmV0dXJuIGZhbHNlOworCS8qCisJICogQWxsIHg4NiBmaXJt
d2FyZXMgaG9yaXpvbnRhbGx5IGNlbnRlciB0aGUgaW1hZ2UgKHRoZSB5b2Zmc2V0CisJICogY2Fs
Y3VsYXRpb25zIGRpZmZlciBiZXR3ZWVuIGJvYXJkcywgYnV0IHhvZmZzZXQgaXMgcHJlZGljdGFi
bGUpLgorCSAqLworCXUzMiBleHBlY3RlZF94b2Zmc2V0ID0gKHNpLT5sZmJfd2lkdGggLSBibXBf
d2lkdGgpIC8gMjsKIAotCXJldHVybiB0cnVlOworCXJldHVybiBiZ3J0X3RhYi5pbWFnZV9vZmZz
ZXRfeCA9PSBleHBlY3RlZF94b2Zmc2V0OwogfQogI2Vsc2UKIHN0YXRpYyBib29sIGVmaWZiX2Jn
cnRfc2FuaXR5X2NoZWNrKHN0cnVjdCBzY3JlZW5faW5mbyAqc2ksIHUzMiBibXBfd2lkdGgpCi0t
IAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
