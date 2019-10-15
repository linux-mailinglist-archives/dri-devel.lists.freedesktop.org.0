Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D580BD8997
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 09:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771036E8E3;
	Wed, 16 Oct 2019 07:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0A86E3BB
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 19:18:51 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
 by Galois.linutronix.de with esmtp (Exim 4.80)
 (envelope-from <bigeasy@linutronix.de>)
 id 1iKSLD-00067i-I9; Tue, 15 Oct 2019 21:18:43 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 29/34] backlight/jornada720: Use CONFIG_PREEMPTION
Date: Tue, 15 Oct 2019 21:18:16 +0200
Message-Id: <20191015191821.11479-30-bigeasy@linutronix.de>
In-Reply-To: <20191015191821.11479-1-bigeasy@linutronix.de>
References: <20191015191821.11479-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 16 Oct 2019 07:33:45 +0000
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tglx@linutronix.de,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CgpDT05GSUdfUFJFRU1Q
VElPTiBpcyBzZWxlY3RlZCBieSBDT05GSUdfUFJFRU1QVCBhbmQgYnkgQ09ORklHX1BSRUVNUFRf
UlQuCkJvdGggUFJFRU1QVCBhbmQgUFJFRU1QVF9SVCByZXF1aXJlIHRoZSBzYW1lIGZ1bmN0aW9u
YWxpdHkgd2hpY2ggdG9kYXkKZGVwZW5kcyBvbiBDT05GSUdfUFJFRU1QVC4KClN3aXRjaCB0aGUg
S2NvbmZpZyBkZXBlbmRlbmN5IHRvIENPTkZJR19QUkVFTVBUSU9OLgoKQ2M6IExlZSBKb25lcyA8
bGVlLmpvbmVzQGxpbmFyby5vcmc+CkNjOiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNv
bkBsaW5hcm8ub3JnPgpDYzogSmluZ29vIEhhbiA8amluZ29vaGFuMUBnbWFpbC5jb20+CkNjOiBC
YXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+CkNjOiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5l
bC5vcmcKU2lnbmVkLW9mZi1ieTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+
CltiaWdlYXN5OiArTENEX0hQNzAwXQpTaWduZWQtb2ZmLWJ5OiBTZWJhc3RpYW4gQW5kcnplaiBT
aWV3aW9yIDxiaWdlYXN5QGxpbnV0cm9uaXguZGU+Ci0tLQogZHJpdmVycy92aWRlby9iYWNrbGln
aHQvS2NvbmZpZyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9LY29uZmln
IGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvS2NvbmZpZwppbmRleCA0MDY3NmJlMmU0NmFhLi5k
MDkzOTYzOTM3MjRiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9LY29uZmln
CisrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L0tjb25maWcKQEAgLTk5LDcgKzk5LDcgQEAg
Y29uZmlnIExDRF9UT1NBCiAKIGNvbmZpZyBMQ0RfSFA3MDAKIAl0cmlzdGF0ZSAiSFAgSm9ybmFk
YSA3MDAgc2VyaWVzIExDRCBEcml2ZXIiCi0JZGVwZW5kcyBvbiBTQTExMDBfSk9STkFEQTcyMF9T
U1AgJiYgIVBSRUVNUFQKKwlkZXBlbmRzIG9uIFNBMTEwMF9KT1JOQURBNzIwX1NTUCAmJiAhUFJF
RU1QVElPTgogCWRlZmF1bHQgeQogCWhlbHAKIAkgIElmIHlvdSBoYXZlIGFuIEhQIEpvcm5hZGEg
NzAwIHNlcmllcyBoYW5kaGVsZCAoNzEwLzcyMC83MjgpCkBAIC0yMjgsNyArMjI4LDcgQEAgY29u
ZmlnIEJBQ0tMSUdIVF9IUDY4MAogCiBjb25maWcgQkFDS0xJR0hUX0hQNzAwCiAJdHJpc3RhdGUg
IkhQIEpvcm5hZGEgNzAwIHNlcmllcyBCYWNrbGlnaHQgRHJpdmVyIgotCWRlcGVuZHMgb24gU0Ex
MTAwX0pPUk5BREE3MjBfU1NQICYmICFQUkVFTVBUCisJZGVwZW5kcyBvbiBTQTExMDBfSk9STkFE
QTcyMF9TU1AgJiYgIVBSRUVNUFRJT04KIAlkZWZhdWx0IHkKIAloZWxwCiAJICBJZiB5b3UgaGF2
ZSBhbiBIUCBKb3JuYWRhIDcwMCBzZXJpZXMsCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
