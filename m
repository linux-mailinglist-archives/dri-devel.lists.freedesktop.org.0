Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8459A9FD18
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848B589467;
	Wed, 28 Aug 2019 08:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from shell.v3.sk (shell.v3.sk [90.176.6.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E07895A8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 08:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 13EF8D8342;
 Wed, 28 Aug 2019 09:59:57 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Wf4FgNoHJtlJ; Wed, 28 Aug 2019 09:59:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 7A19FD8339;
 Wed, 28 Aug 2019 09:59:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id MvqCNWhhuC-D; Wed, 28 Aug 2019 09:59:42 +0200 (CEST)
Received: from belphegor.brq.redhat.com (nat-pool-brq-t.redhat.com
 [213.175.37.10])
 by zimbra.v3.sk (Postfix) with ESMTPSA id BCCC5D832F;
 Wed, 28 Aug 2019 09:59:41 +0200 (CEST)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Russell King <linux@armlinux.org.uk>
Subject: [PATCH v4 3/5] dt-bindings: display: armada: Improve the LCDC
 documentation
Date: Wed, 28 Aug 2019 09:59:36 +0200
Message-Id: <20190828075938.318028-4-lkundrak@v3.sk>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190828075938.318028-1-lkundrak@v3.sk>
References: <20190828075938.318028-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 28 Aug 2019 08:28:09 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHBvcnQgaXMgYSBjaGlsZCwgbm90IGEgcHJvcGVydHkuIEFuZCBzaG91bGQgYmUgYWNjb21w
YW5pZWQgYnkgYW4KZXhhbXBsZS4gUGx1cyBhIHBhaXIgb2YgY29zbWV0aWMgY2hhbmdlcyB0aGF0
IGRvbid0IHNlZW0gdG8gZGVzZXJ2ZSBhCnNlcGFyYXRlIGNvbW1pdC4KClNpZ25lZC1vZmYtYnk6
IEx1Ym9taXIgUmludGVsIDxsa3VuZHJha0B2My5zaz4KUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+CgotLS0KQ2hhbmdlcyBzaW5jZSB2MzoKLSBBY3R1YWxseSBjb2xs
ZWN0ZWQgdGhlIFJldmlld2VkLWJ5IHRhZwoKQ2hhbmdlcyBzaW5jZSB2MjoKLSBDb2xsZWN0ZWQg
dGhlIFJldmlld2VkLWJ5IHRhZwoKQ2hhbmdlcyBzaW5jZSB2MToKLSBNaW5vciBhZGp1c3RtZW50
cyB0byB0aGUgY29tbWl0IG1lc3NhZ2Ugd29yZGluZy4KCiAuLi4vYmluZGluZ3MvZGlzcGxheS9t
YXJ2ZWxsLGFybWFkYS1sY2RjLnR4dCAgICAgfCAxNiArKysrKysrKysrKysrKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tYXJ2ZWxsLGFybWFkYS1s
Y2RjLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21hcnZl
bGwsYXJtYWRhLWxjZGMudHh0CmluZGV4IDQ2NTI1ZWEzZTY0NmUuLjI2MDZhOGVmYzk1NjggMTAw
NjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21hcnZl
bGwsYXJtYWRhLWxjZGMudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21hcnZlbGwsYXJtYWRhLWxjZGMudHh0CkBAIC0xLDEwICsxLDExIEBACi1EZXZp
Y2UgVHJlZSBiaW5kaW5ncyBmb3IgQXJtYWRhIERSTSBDUlRDIGRyaXZlcgorTWFydmVsbCBBcm1h
ZGEgTENEIGNvbnRyb2xsZXIKKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09CiAKIFJlcXVp
cmVkIHByb3BlcnRpZXM6CisKICAtIGNvbXBhdGlibGU6IHZhbHVlIHNob3VsZCBiZSAibWFydmVs
bCxkb3ZlLWxjZCIuCiAgLSByZWc6IGJhc2UgYWRkcmVzcyBhbmQgc2l6ZSBvZiB0aGUgTENEIGNv
bnRyb2xsZXIKICAtIGludGVycnVwdHM6IHNpbmdsZSBpbnRlcnJ1cHQgbnVtYmVyIGZvciB0aGUg
TENEIGNvbnRyb2xsZXIKLSAtIHBvcnQ6IHZpZGVvIG91dHB1dCBwb3J0IHdpdGggZW5kcG9pbnRz
LCBhcyBkZXNjcmliZWQgYnkgZ3JhcGgudHh0CiAKIE9wdGlvbmFsIHByb3BlcnRpZXM6CiAKQEAg
LTE5LDYgKzIwLDExIEBAIE5vdGU6IGFsbCBjbG9ja3MgYXJlIG9wdGlvbmFsIGJ1dCBhdCBsZWFz
dCBvbmUgbXVzdCBiZSBzcGVjaWZpZWQuCiBGdXJ0aGVyIGNsb2NrcyBtYXkgYmUgYWRkZWQgaW4g
dGhlIGZ1dHVyZSBhY2NvcmRpbmcgdG8gcmVxdWlyZW1lbnRzIG9mCiBkaWZmZXJlbnQgU29Dcy4K
IAorUmVxdWlyZWQgY2hpbGQgbm9kZXM6CisKKy0gcG9ydDogdmlkZW8gb3V0cHV0IHBvcnQgd2l0
aCBlbmRwb2ludHMsIGFzIGRlc2NyaWJlZCBieQorICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZ3JhcGgudHh0CisKIEV4YW1wbGU6CiAKIAlsY2QwOiBsY2QtY29udHJvbGxlckA4
MjAwMDAgewpAQCAtMjcsNCArMzMsMTAgQEAgRXhhbXBsZToKIAkJaW50ZXJydXB0cyA9IDw0Nz47
CiAJCWNsb2NrcyA9IDwmc2k1MzUxIDA+OwogCQljbG9jay1uYW1lcyA9ICJleHRfcmVmX2Nsa18x
IjsKKworCQlsY2QwX3BvcnQ6IHBvcnQgeworCQkJbGNkMF9yZ2Jfb3V0OiBlbmRwb2ludCB7CisJ
CQkJcmVtb3RlLWVuZHBvaW50ID0gPCZlbmNvZGVyX3JnYl9pbj47CisJCQl9OworCQl9OwogCX07
Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
