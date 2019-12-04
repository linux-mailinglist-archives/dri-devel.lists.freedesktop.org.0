Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F53112E64
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 16:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B89F6E075;
	Wed,  4 Dec 2019 15:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976186E075
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 15:28:51 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1icWa7-0000L2-JP; Wed, 04 Dec 2019 15:28:47 +0000
From: Colin King <colin.king@canonical.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tomi Valkeinen <tomi.valkeinen@nokia.com>, linux-omap@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] OMAP: DSS2: remove non-zero check on variable r
Date: Wed,  4 Dec 2019 15:28:47 +0000
Message-Id: <20191204152847.1435188-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClZhcmlhYmxl
IHIgaXMgYmVpbmcgaW5pdGlhbGl6ZWQgdG8gemVybywgc28gdGhlIGNoZWNrIG9mIGEgbm9uLXpl
cm8KcnYgaXMgcmVkdW5kYW50IGFuZCBjYW4gYmUgcmVtb3ZlZC4KCkl0IGFwcGVhcnMgdGhhdCB0
aGUgcHJldmlvdXMgY2FzZSBzdGF0ZW1lbnRzIHNldCByIHRvIGJlIC1FSU5WQUwKYW5kIHRoZSAi
RmFsbHRocm91Z2giIGNvbW1lbnQgYWZ0ZXJ3YXJkcyBzdWdnZXN0ZWQgaXQgd2FzIGdvaW5nCnRv
IGZhbGwgdGhyb3VnaCB0byB0aGlzIG5vbi16ZXJvIGNoZWNrIGJ1dCB3b24ndCBiZWNhdXNlIG9m
IHRoZQpicmVhayBzdGF0ZW1lbnQuIFJlbW92ZSB0aGUgY29uZnVzaW9uIGJ5IHJlbW92aW5nIHRo
ZSBGYWxsdGhyb3VnaApjb21tZW50IHRvby4KCkFkZHJlc3Nlcy1Db3Zlcml0eTogKCJMb2dpY2Fs
bHkgZGVhZCBjb2RlIikKRml4ZXM6IGIzOWE5ODJkZGVjZiAoIk9NQVA6IERTUzI6IG9tYXBmYiBk
cml2ZXIiKQpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmlj
YWwuY29tPgotLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL29tYXBmYi1tYWlu
LmMgfCA0IC0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL29tYXBmYi1tYWluLmMgYi9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9vbWFwZmItbWFpbi5jCmluZGV4IDg1OGMyYzAxMWQx
OS4uYTJhMmMxYjIwNWQ5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29t
YXBmYi9vbWFwZmItbWFpbi5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZi
L29tYXBmYi1tYWluLmMKQEAgLTExNTQsMTYgKzExNTQsMTIgQEAgc3RhdGljIGludCBfc2V0Y29s
cmVnKHN0cnVjdCBmYl9pbmZvICpmYmksIHVfaW50IHJlZ25vLCB1X2ludCByZWQsIHVfaW50IGdy
ZWVuLAogCQkgICByID0gZmJkZXYtPmN0cmwtPnNldGNvbHJlZyhyZWdubywgcmVkLCBncmVlbiwg
Ymx1ZSwKIAkJICAgdHJhbnNwLCB1cGRhdGVfaHdfcGFsKTsKIAkJICAgKi8KLQkJLyogRmFsbHRo
cm91Z2ggKi8KIAkJciA9IC1FSU5WQUw7CiAJCWJyZWFrOwogCWNhc2UgT01BUEZCX0NPTE9SX1JH
QjU2NToKIAljYXNlIE9NQVBGQl9DT0xPUl9SR0I0NDQ6CiAJY2FzZSBPTUFQRkJfQ09MT1JfUkdC
MjRQOgogCWNhc2UgT01BUEZCX0NPTE9SX1JHQjI0VToKLQkJaWYgKHIgIT0gMCkKLQkJCWJyZWFr
OwotCiAJCWlmIChyZWdubyA8IDE2KSB7CiAJCQl1MzIgcGFsOwogCQkJcGFsID0gKChyZWQgPj4g
KDE2IC0gdmFyLT5yZWQubGVuZ3RoKSkgPDwKLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
