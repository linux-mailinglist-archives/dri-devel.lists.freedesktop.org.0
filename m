Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BF2483AB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 15:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C8B890CD;
	Mon, 17 Jun 2019 13:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E6BD890CD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 13:16:46 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MrPVJ-1iNDSv3rCJ-00oWs2; Mon, 17 Jun 2019 15:16:27 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] video: fbdev: pvr2fb: fix link error for pvr2fb_pci_exit
Date: Mon, 17 Jun 2019 15:16:12 +0200
Message-Id: <20190617131624.2382303-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Qe2+Mxqk7UNlW2kImG4dBpHk395qN3F7QKua6gNeiC02qC4dv/0
 KyGHOwqMvARphB1xFvw1ZRVnRDGdoympCDhOCPbmLGZJ65qH0XZlGS8W5o8zpfeTn8G0p+j
 U9ORexC2jg0VRUZbYphRu24L2mh7wPWzgPsqGF1zvefqLjoNciY31NbZSG5iTrZbcLPIGOz
 abWHduBRPpuRTmnm5s9lA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:H9A3Z1xLXVI=:eEoA67w9aBjQBcOJXDFqN9
 /iPd9cib0USpQoPAxAgbr+tggKDwCqcHbtEd/RLlOqzgrcZg5La4xZ5LdT1EfW25hW9Ph4Xw6
 RuC7sLlSXHw6P1f6UIJTz3bzlpt51WmCGjmd149e4GOZzD20TGerjeo2jUM0OHJiw8D7zO+1y
 QyisIco/v5yYKC6aWgfujquqXdoSONt/L2UseizZ9xDAoXV2IQViMJGjZSogVb2YDOSgphU3U
 SNU7fWESOViEn+FgCQSyC6IzDt4OZ19kcga4I/J3Em4FTUo6ibpWArH8fuwf4+287IbBU6A4c
 +3EPuAjBwvDY1chWV0mxutSdWWw5780fYoYj0LtRkodIQ3E2aZew6zz5zaMvos49Hlj7Pp54B
 U8WoS3QGbiytFpUlWHXAJJFdu7ms4neA11pQ76qMJuYVQbslqm1UpW1XPG2AdgIVafv/ty9ai
 BY8maX8WzpyIfziRRvzQF6IsmZNgO/9v/DqCfUbpZLvs5kcnO7w6yyNNPqS3daxKosKAi+eIR
 K5EsGbyK28TR6BORQzhdEMSa8iNDiIahXXWRh3QQSSmKxRmMuq6LMMs7U+AVDdzxe1SQ6nTPb
 b8STQpqH9i6DejA9h00x5u3iDuxumt9mZQw+QGVQjqVu6z4Z2I4pLn0kgaYbRzdZGSJUDmqnU
 IzFDQ2E0jWnqGNw5TzI9Aijz/2EyccZ8ugOgnnCK1Eg9IGF03w0MsLD9r4rZfxJfz/3YKfQnZ
 anbQI8kXmNSznPe3mn5FG6wHjRu4hxB9lGjAfw==
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
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiB0aGUgZHJpdmVyIGlzIGJ1aWx0LWluIGZvciBQQ0ksIHdlIHJlZmVyZW5jZSB0aGUgZXhp
dCBmdW5jdGlvbgphZnRlciBkaXNjYXJkaW5nIGl0OgoKYHB2cjJmYl9wY2lfZXhpdCcgcmVmZXJl
bmNlZCBpbiBzZWN0aW9uIGAucmVmLmRhdGEnIG9mIGRyaXZlcnMvdmlkZW8vZmJkZXYvcHZyMmZi
Lm86IGRlZmluZWQgaW4gZGlzY2FyZGVkIHNlY3Rpb24gYC5leGl0LnRleHQnIG9mIGRyaXZlcnMv
dmlkZW8vZmJkZXYvcHZyMmZiLm8KCkp1c3QgcmVtb3ZlIHRoZSBfX2V4aXQgYW5ub3RhdGlvbiBh
cyB0aGUgZWFzaWVzdCB3b3JrYXJvdW5kLgoKRml4ZXM6IDBmNWE1NzEyYWQxZSAoInZpZGVvOiBm
YmRldjogcHZyMmZiOiBhZGQgQ09NUElMRV9URVNUIHN1cHBvcnQiKQpTaWduZWQtb2ZmLWJ5OiBB
cm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgotLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvcHZy
MmZiLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3B2cjJmYi5jIGIvZHJpdmVycy92
aWRlby9mYmRldi9wdnIyZmIuYwppbmRleCAyOTllYTdkYjkyMjAuLmNmOWNmZGM1ZTY4NSAxMDA2
NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9wdnIyZmIuYworKysgYi9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L3B2cjJmYi5jCkBAIC05OTAsNyArOTkwLDcgQEAgc3RhdGljIGludCBfX2luaXQgcHZy
MmZiX3BjaV9pbml0KHZvaWQpCiAJcmV0dXJuIHBjaV9yZWdpc3Rlcl9kcml2ZXIoJnB2cjJmYl9w
Y2lfZHJpdmVyKTsKIH0KIAotc3RhdGljIHZvaWQgX19leGl0IHB2cjJmYl9wY2lfZXhpdCh2b2lk
KQorc3RhdGljIHZvaWQgcHZyMmZiX3BjaV9leGl0KHZvaWQpCiB7CiAJcGNpX3VucmVnaXN0ZXJf
ZHJpdmVyKCZwdnIyZmJfcGNpX2RyaXZlcik7CiB9Ci0tIAoyLjIwLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
