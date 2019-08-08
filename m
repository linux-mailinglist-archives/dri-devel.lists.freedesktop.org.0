Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBCF86C3F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 23:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050736ECBF;
	Thu,  8 Aug 2019 21:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F25A6ECBF
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 21:23:29 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MnFps-1icdKs0qea-00jKxt; Thu, 08 Aug 2019 23:23:10 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Tony Lindgren <tony@atomide.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 01/22] ARM: omap1: innovator: pass lcd control address as pdata
Date: Thu,  8 Aug 2019 23:22:10 +0200
Message-Id: <20190808212234.2213262-2-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190808212234.2213262-1-arnd@arndb.de>
References: <20190808212234.2213262-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:gYQzCnwbWs8mL7daViFjHUrU0375LB2jW2jmopnOztbOKCOlUH9
 wzr6xMzlYNNwM9kds2mG3qevqDGBNAJ3ckfUEAJNYKK2tsSbQCiKiSG2zIoL5FigrrtryXb
 Y4gOJjw9g/rplk35Su3pjCxkNftH4wqexHHFCHXeHNLLb4peZcfvWmcPJIjtkK+3FpiI1uO
 R3+EaCP0c583jcXIH3TLw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+scwJx1aJ24=:fzzjaWEd6UPfzIwJQkEsjs
 3PTOJzPRcySccl4YgEgKXsQSYLtgS3T1hlqg3ZG2nwTEaklnDQd1wsErnSVNJ2YjuNtkgEUNh
 iLJMSmvFG/ccgp/BsS5ghJUtr6n8vBlVcGNIvumQMiY/5sE2/504mNQ2uAI03GlBW3LmYwjcL
 cYCUmNpBsQfxoatS96SDmS+0c56C8BdC5Cs2QkPQ5Zo3VG7V98t2Th5OYJ8U7dD3mEs8wKAau
 +3mXwnpIAvpMCQ4+862wyYMuYn+63CjZgS/J+sdQEqioMPPONV3Cl5u0Kf07S/WtLpvrrkHpz
 Fie4Uaa4YHh+u1hpgJyZUkMl8yDDXLwLPhGWtWFfTGVHALI0RwN12IWuUjFYbXDGLn6hSHYyF
 n11jgojUqdWQF59bUBi7NqCEuGwKXCvylQbWaW1eLg79pLVjw9SZmBgAjoxkEcAuRf/PMfTVb
 93uOK5qGjcH/0VJDhP4u5EQNPEkLjhXYrs7f0fGWQIxH2awjzUHHhBaO8E8TZcuCmY7XR/sZw
 fouqZmyBUeyGE9kyGsRTjLpIisj1GhWIqDXQFQHnaI5xn9abxsiGjPdGL4t507DJ/g2puzCYz
 mO5yy+hPpJ/V44WQbdwNgmuU61K3Ol0StT+Go+tfZLZu5CGGp1cY8F/dZPnyy3fDcfguqzXsq
 3VUbPE24+i8zOqaZL1+UCpVISxqc7h6WID356sPIluGWaulaS4+f6xXxbT5cy3ejlJejzCobv
 pXs4GXE031dxuO+xu0W3giaP84+bJ+pQrG0nMQ==
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VG8gYXZvaWQgdXNpbmcgdGhlIG1hY2gvb21hcDE1MTAuaCBoZWFkZXIgZmlsZSwgcGFzcyB0aGUg
Y29ycmVjdAphZGRyZXNzIGFzIHBsYXRmb3JtIGRhdGEuCgpTaWduZWQtb2ZmLWJ5OiBBcm5kIEJl
cmdtYW5uIDxhcm5kQGFybmRiLmRlPgotLS0KIGFyY2gvYXJtL21hY2gtb21hcDEvYm9hcmQtaW5u
b3ZhdG9yLmMgIHwgMyArKysKIGRyaXZlcnMvdmlkZW8vZmJkZXYvb21hcC9sY2RfaW5uMTUxMC5j
IHwgNyArKysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLW9tYXAxL2JvYXJkLWlubm92YXRvci5j
IGIvYXJjaC9hcm0vbWFjaC1vbWFwMS9ib2FyZC1pbm5vdmF0b3IuYwppbmRleCBjYmUwOTNmOTY5
ZDUuLjI0MjVmMWJhY2IzMyAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vbWFjaC1vbWFwMS9ib2FyZC1p
bm5vdmF0b3IuYworKysgYi9hcmNoL2FybS9tYWNoLW9tYXAxL2JvYXJkLWlubm92YXRvci5jCkBA
IC0xOTQsNiArMTk0LDkgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgaW5ub3ZhdG9y
MTUxMF9zbWM5MXhfZGV2aWNlID0gewogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgaW5u
b3ZhdG9yMTUxMF9sY2RfZGV2aWNlID0gewogCS5uYW1lCQk9ICJsY2RfaW5uMTUxMCIsCiAJLmlk
CQk9IC0xLAorCS5kZXYJPSB7CisJCS5wbGF0Zm9ybV9kYXRhID0gKHZvaWQgX19mb3JjZSAqKU9N
QVAxNTEwX0ZQR0FfTENEX1BBTkVMX0NPTlRST0wsCisJfQogfTsKIAogc3RhdGljIHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgaW5ub3ZhdG9yMTUxMF9zcGlfZGV2aWNlID0gewpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy92aWRlby9mYmRldi9vbWFwL2xjZF9pbm4xNTEwLmMgYi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L29tYXAvbGNkX2lubjE1MTAuYwppbmRleCA3NzZlN2Y4ZDY1NmUuLjM3ZWQwYzE0YWE1YSAx
MDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9vbWFwL2xjZF9pbm4xNTEwLmMKKysrIGIv
ZHJpdmVycy92aWRlby9mYmRldi9vbWFwL2xjZF9pbm4xNTEwLmMKQEAgLTE0LDE1ICsxNCwxNyBA
QAogCiAjaW5jbHVkZSAib21hcGZiLmgiCiAKK3N0YXRpYyB2b2lkIF9faW9tZW0gKm9tYXAxNTEw
X2ZwZ2FfbGNkX3BhbmVsX2NvbnRyb2w7CisKIHN0YXRpYyBpbnQgaW5ub3ZhdG9yMTUxMF9wYW5l
bF9lbmFibGUoc3RydWN0IGxjZF9wYW5lbCAqcGFuZWwpCiB7Ci0JX19yYXdfd3JpdGViKDB4Nywg
T01BUDE1MTBfRlBHQV9MQ0RfUEFORUxfQ09OVFJPTCk7CisJX19yYXdfd3JpdGViKDB4Nywgb21h
cDE1MTBfZnBnYV9sY2RfcGFuZWxfY29udHJvbCk7CiAJcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyB2
b2lkIGlubm92YXRvcjE1MTBfcGFuZWxfZGlzYWJsZShzdHJ1Y3QgbGNkX3BhbmVsICpwYW5lbCkK
IHsKLQlfX3Jhd193cml0ZWIoMHgwLCBPTUFQMTUxMF9GUEdBX0xDRF9QQU5FTF9DT05UUk9MKTsK
KwlfX3Jhd193cml0ZWIoMHgwLCBvbWFwMTUxMF9mcGdhX2xjZF9wYW5lbF9jb250cm9sKTsKIH0K
IAogc3RhdGljIHN0cnVjdCBsY2RfcGFuZWwgaW5ub3ZhdG9yMTUxMF9wYW5lbCA9IHsKQEAgLTQ4
LDYgKzUwLDcgQEAgc3RhdGljIHN0cnVjdCBsY2RfcGFuZWwgaW5ub3ZhdG9yMTUxMF9wYW5lbCA9
IHsKIAogc3RhdGljIGludCBpbm5vdmF0b3IxNTEwX3BhbmVsX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCiB7CisJb21hcDE1MTBfZnBnYV9sY2RfcGFuZWxfY29udHJvbCA9ICh2
b2lkIF9faW9tZW0gKilwZGV2LT5kZXYucGxhdGZvcm1fZGF0YTsKIAlvbWFwZmJfcmVnaXN0ZXJf
cGFuZWwoJmlubm92YXRvcjE1MTBfcGFuZWwpOwogCXJldHVybiAwOwogfQotLSAKMi4yMC4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
