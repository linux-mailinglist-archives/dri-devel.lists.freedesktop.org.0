Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A552E177
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 17:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33F56E0E4;
	Wed, 29 May 2019 15:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD036E0E4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 15:46:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A5A4F30B46F1;
 Wed, 29 May 2019 15:46:40 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-29.ams2.redhat.com
 [10.36.112.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBC86600C4;
 Wed, 29 May 2019 15:46:37 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] efifb: BGRT: Add check for new BGRT status field rotation bits
Date: Wed, 29 May 2019 17:46:35 +0200
Message-Id: <20190529154635.2659-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Wed, 29 May 2019 15:46:45 +0000 (UTC)
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
Cc: linux-efi@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 linux-fbdev@vger.kernel.org, Peter Jones <pjones@redhat.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3RhcnRpbmcgd2l0aCBBQ1BJIDYuMiBiaXRzIDEgYW5kIDIgb2YgdGhlIEJHUlQgc3RhdHVzIGZp
ZWxkIGFyZSBubyBsb25nZXIKcmVzZXJ2ZWQuIFRoZXNlIGJpdHMgYXJlIG5vdyB1c2VkIHRvIGlu
ZGljYXRlIGlmIHRoZSBpbWFnZSBuZWVkcyB0byBiZQpyb3RhdGVkIGJlZm9yZSBiZWluZyBkaXNw
bGF5ZWQuCgpUaGUgZWZpZmIgY29kZSBkb2VzIG5vdCBzdXBwb3J0IHJvdGF0aW5nIHRoZSBpbWFn
ZSBiZWZvcmUgY29weWluZyBpdCB0bwp0aGUgc2NyZWVuLgoKVGhpcyBjb21taXQgYWRkcyBhIGNo
ZWNrIGZvciB0aGVzZSBuZXcgYml0cyBhbmQgaWYgdGhleSBhcmUgc2V0IGxlYXZlcyB0aGUKZmIg
Y29udGVudHMgYXMgaXMgaW5zdGVhZCBvZiB0cnlpbmcgdG8gdXNlIHRoZSB1bi1yb3RhdGVkIEJH
UlQgaW1hZ2UuCgpTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgotLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvZWZpZmIuYyB8IDUgKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L2VmaWZiLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2VmaWZiLmMKaW5kZXggOWYzOWYwYzM2MGUw
Li5kZmE4ZGQ0N2QxOWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvZWZpZmIuYwor
KysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2VmaWZiLmMKQEAgLTE2OSw2ICsxNjksMTEgQEAgc3Rh
dGljIHZvaWQgZWZpZmJfc2hvd19ib290X2dyYXBoaWNzKHN0cnVjdCBmYl9pbmZvICppbmZvKQog
CQlyZXR1cm47CiAJfQogCisJaWYgKGJncnRfdGFiLnN0YXR1cyAmIDB4MDYpIHsKKwkJcHJfaW5m
bygiZWZpZmI6IEJHUlQgcm90YXRpb24gYml0cyBzZXQsIG5vdCBzaG93aW5nIGJvb3QgZ3JhcGhp
Y3NcbiIpOworCQlyZXR1cm47CisJfQorCiAJLyogQXZvaWQgZmxhc2hpbmcgdGhlIGxvZ28gaWYg
d2UncmUgZ29pbmcgdG8gcHJpbnQgc3RkIHByb2JlIG1lc3NhZ2VzICovCiAJaWYgKGNvbnNvbGVf
bG9nbGV2ZWwgPiBDT05TT0xFX0xPR0xFVkVMX1FVSUVUKQogCQlyZXR1cm47Ci0tIAoyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
