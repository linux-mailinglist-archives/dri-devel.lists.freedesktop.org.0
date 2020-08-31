Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F64825763A
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 11:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9F789D7D;
	Mon, 31 Aug 2020 09:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4757789E0D
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 04:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=l7zHHSgVYZKrffQxrdTFyOTG+QENbp5RKlVsgMYUtWU=; b=ayc5ubh3K4AA3qftWiN44cL37f
 OyZpAzP5TAzZrmsKdY56NEgKl5l91VuBgcyc73c4bmOyiP+nTxAiov7XbL71CbwH/eYjAfAZQDdd6
 EhftUKKJ0NxjX4GBv6pglPUGCubtQsl0GVzhSkimEoaRyU07aFkjr4A94fweSQY4QFOFBKWyyOdva
 L5qvlUiFQWetB7K8Fl6Y3f/odtBzptW/8btie+qhZlSfFZlEpDlKtZza1es8DmgJUu9NiK4v8Q52F
 ARyCFaCGJiiDBq9jtQFI/RYqpMFuTarRaZFDin4FXrYjSUmZ/8UMVOMtQAMetYS2KGjaaCAMc434k
 eorrJ4mw==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 (helo=smtpauth.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCbFe-00063Z-0T; Mon, 31 Aug 2020 04:17:06 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] dma-buf: fix kernel-doc warning in <linux/dma-buf.h>
Date: Sun, 30 Aug 2020 21:16:55 -0700
Message-Id: <20200831041655.29796-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 31 Aug 2020 09:12:28 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Gustavo Padovan <gustavo@padovan.org>, Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IGtlcm5lbC1kb2Mgd2FybmluZyBpbiA8bGludXgvZG1hLWJ1Zi5oPjoKCi4uL2luY2x1ZGUv
bGludXgvZG1hLWJ1Zi5oOjMzMDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJl
ciAnbmFtZV9sb2NrJyBub3QgZGVzY3JpYmVkIGluICdkbWFfYnVmJwoKU2lnbmVkLW9mZi1ieTog
UmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+CkNjOiBTdW1pdCBTZW13YWwgPHN1
bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogR3VzdGF2byBQYWRvdmFuIDxndXN0YXZvQHBhZG92
YW4ub3JnPgpDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpD
YzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCi0tLQogaW5jbHVkZS9saW51eC9kbWEtYnVmLmggfCAgICAzICsrLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKLS0tIGxueC01OS1yYzMu
b3JpZy9pbmNsdWRlL2xpbnV4L2RtYS1idWYuaAorKysgbG54LTU5LXJjMy9pbmNsdWRlL2xpbnV4
L2RtYS1idWYuaApAQCAtMjgzLDYgKzI4Myw3IEBAIHN0cnVjdCBkbWFfYnVmX29wcyB7CiAgKiBA
ZXhwX25hbWU6IG5hbWUgb2YgdGhlIGV4cG9ydGVyOyB1c2VmdWwgZm9yIGRlYnVnZ2luZy4KICAq
IEBuYW1lOiB1c2Vyc3BhY2UtcHJvdmlkZWQgbmFtZTsgdXNlZnVsIGZvciBhY2NvdW50aW5nIGFu
ZCBkZWJ1Z2dpbmcsCiAgKiAgICAgICAgcHJvdGVjdGVkIGJ5IEByZXN2LgorICogQG5hbWVfbG9j
azogc3BpbmxvY2sgdG8gcHJvdGVjdCBuYW1lIGFjY2VzcwogICogQG93bmVyOiBwb2ludGVyIHRv
IGV4cG9ydGVyIG1vZHVsZTsgdXNlZCBmb3IgcmVmY291bnRpbmcgd2hlbiBleHBvcnRlciBpcyBh
CiAgKiAgICAgICAgIGtlcm5lbCBtb2R1bGUuCiAgKiBAbGlzdF9ub2RlOiBub2RlIGZvciBkbWFf
YnVmIGFjY291bnRpbmcgYW5kIGRlYnVnZ2luZy4KQEAgLTMxMSw3ICszMTIsNyBAQCBzdHJ1Y3Qg
ZG1hX2J1ZiB7CiAJdm9pZCAqdm1hcF9wdHI7CiAJY29uc3QgY2hhciAqZXhwX25hbWU7CiAJY29u
c3QgY2hhciAqbmFtZTsKLQlzcGlubG9ja190IG5hbWVfbG9jazsgLyogc3BpbmxvY2sgdG8gcHJv
dGVjdCBuYW1lIGFjY2VzcyAqLworCXNwaW5sb2NrX3QgbmFtZV9sb2NrOwogCXN0cnVjdCBtb2R1
bGUgKm93bmVyOwogCXN0cnVjdCBsaXN0X2hlYWQgbGlzdF9ub2RlOwogCXZvaWQgKnByaXY7Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
