Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B343D107B3B
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2019 00:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC896F544;
	Fri, 22 Nov 2019 23:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE4D6F547
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 23:16:56 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-PaXPggKFOBmZIAzBidVXRw-1; Fri, 22 Nov 2019 18:16:53 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EC31100726A;
 Fri, 22 Nov 2019 23:16:51 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30FEC19C4F;
 Fri, 22 Nov 2019 23:16:50 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/5] drm/i915: Force DPCD backlight mode on X1 Extreme 2nd Gen
 4K AMOLED panel
Date: Fri, 22 Nov 2019 18:16:03 -0500
Message-Id: <20191122231616.2574-6-lyude@redhat.com>
In-Reply-To: <20191122231616.2574-1-lyude@redhat.com>
References: <20191122231616.2574-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: PaXPggKFOBmZIAzBidVXRw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574464615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7312nuaCf2oM+T3c7efGgGdfgGSQaSpW7hnjMJf3528=;
 b=BqiJd8gCqfa7QzHSjgG9AhNMlpYx3LuJ7HHyl4A1rTqy3jl13WNZzIXmg5d2fm6Tih4IbU
 hnLfuixm1FT0w4JraWZeBZtBgp8FCeE0YLIIUPuU8XD7TjlJVYkf40cImLX7mGxLSXAiVI
 iC3+5FgVcpznoqDkmqR6SwmxLLunXIA=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW5ub3lpbmdseSwgdGhlIFZCVCBvbiB0aGUgVGhpbmtQYWQgWDEgRXh0cmVtZSAybmQgR2VuIGlu
ZGljYXRlcyB0aGF0CnRoZSBzeXN0ZW0gdXNlcyBwbGFpbiBQV00gYmFzZWQgYmFja2xpZ2h0IGNv
bnRyb2xzLCB3aGVuIGluIHJlYWxpdHkgdGhlCm9ubHkgYmFja2xpZ2h0IGNvbnRyb2xzIHRoYXQg
d29yayBhcmUgdGhlIHN0YW5kYXJkIFZFU0EgZURQIERQQ0QKYmFja2xpZ2h0IGNvbnRyb2xzLgoK
SG9uZXN0bHksIHRoaXMgbWFrZXMgbWUgd29uZGVyIGhvdyBtYW55IG90aGVyIHN5c3RlbXMgaGF2
ZSB0aGVzZSBpc3N1ZXMKb3IgbGllIGFib3V0IHRoaXMgaW4gdGhlaXIgVkJULiBOb3Qgc3VyZSB3
ZSBoYXZlIGFueSBnb29kIHdheSBvZiBmaW5kaW5nCm91dCB1bnRpbCBwYW5lbHMgbGlrZSB0aGlz
IGJlY29tZSBtb3JlIGNvbW1vbiBwbGFjZSBpbiB0aGUgbGFwdG9wCm1hcmtldC4gRm9yIG5vdywg
anVzdCBhZGQgYSBEUk0gRFAgcXVpcmsgdG8gaW5kaWNhdGUgdGhhdCB0aGlzIHBhbmVsIGlzCnRl
bGxpbmcgdGhlIHRydXRoIGFuZCBpcyBiZWluZyBhIGdvb2QgTENELgoKQnVnemlsbGE6IGh0dHBz
Oi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTExMjM3NgpTaWduZWQtb2Zm
LWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9k
cm1fZHBfaGVscGVyLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKysrKwogZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9hdXhfYmFja2xpZ2h0LmMgfCAxMCArKysrKysr
Ky0tCiBpbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICA4ICsrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKaW5kZXggMmM3ODcwYWVmNDY5Li5lYzcw
NjFlM2E5OWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwpAQCAtMTE1NSw2ICsxMTU1LDEwIEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHBjZF9xdWlyayBkcGNkX3F1aXJrX2xpc3RbXSA9IHsKIAl7
IE9VSSgweDAwLCAweDEwLCAweGZhKSwgREVWSUNFX0lEX0FOWSwgZmFsc2UsIEJJVChEUF9EUENE
X1FVSVJLX05PX1BTUikgfSwKIAkvKiBDSDc1MTEgc2VlbXMgdG8gbGVhdmUgU0lOS19DT1VOVCB6
ZXJvZWQgKi8KIAl7IE9VSSgweDAwLCAweDAwLCAweDAwKSwgREVWSUNFX0lEKCdDJywgJ0gnLCAn
NycsICc1JywgJzEnLCAnMScpLCBmYWxzZSwgQklUKERQX0RQQ0RfUVVJUktfTk9fU0lOS19DT1VO
VCkgfSwKKwkvKiBPcHRpb25hbCA0SyBBTU9MRUQgcGFuZWwgaW4gdGhlIFRoaW5rUGFkIFgxIEV4
dHJlbWUgMm5kIEdlbmVyYXRpb24KKwkgKiBvbmx5IHN1cHBvcnRzIERQQ0QgYmFja2xpZ2h0IGNv
bnRyb2xzLCBkZXNwaXRlIGFkdmVydGlzaW5nIG90aGVyd2lzZQorCSAqLworCXsgT1VJKDB4YmEs
IDB4NDEsIDB4NTkpLCBERVZJQ0VfSURfQU5ZLCBmYWxzZSwgQklUKERQX0RQQ0RfUVVJUktfRk9S
Q0VfRFBDRF9CQUNLTElHSFQpIH0sCiB9OwogCiAjdW5kZWYgT1VJCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX2F1eF9iYWNrbGlnaHQuYyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfYXV4X2JhY2tsaWdodC5jCmluZGV4IDg3
YjU5ZGI5ZmZlMy4uM2Q2MTI2MGIwOGFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2RwX2F1eF9iYWNrbGlnaHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2RwX2F1eF9iYWNrbGlnaHQuYwpAQCAtMzI1LDExICszMjUsMTcg
QEAgaW50ZWxfZHBfYXV4X2Rpc3BsYXlfY29udHJvbF9jYXBhYmxlKHN0cnVjdCBpbnRlbF9jb25u
ZWN0b3IgKmNvbm5lY3RvcikKIGludCBpbnRlbF9kcF9hdXhfaW5pdF9iYWNrbGlnaHRfZnVuY3Mo
c3RydWN0IGludGVsX2Nvbm5lY3RvciAqaW50ZWxfY29ubmVjdG9yKQogewogCXN0cnVjdCBpbnRl
bF9wYW5lbCAqcGFuZWwgPSAmaW50ZWxfY29ubmVjdG9yLT5wYW5lbDsKLQlzdHJ1Y3QgZHJtX2k5
MTVfcHJpdmF0ZSAqZGV2X3ByaXYgPSB0b19pOTE1KGludGVsX2Nvbm5lY3Rvci0+YmFzZS5kZXYp
OworCXN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAgPQorCQllbmNfdG9faW50ZWxfZHAoJmludGVs
X2Nvbm5lY3Rvci0+ZW5jb2Rlci0+YmFzZSk7CisJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRl
dl9wcml2ID0KKwkJdG9faTkxNShpbnRlbF9jb25uZWN0b3ItPmJhc2UuZGV2KTsKIAogCWlmIChp
OTE1X21vZHBhcmFtcy5lbmFibGVfZHBjZF9iYWNrbGlnaHQgPT0gMCB8fAogCSAgICAoaTkxNV9t
b2RwYXJhbXMuZW5hYmxlX2RwY2RfYmFja2xpZ2h0ID09IC0xICYmCi0JICAgIGRldl9wcml2LT52
YnQuYmFja2xpZ2h0LnR5cGUgIT0gSU5URUxfQkFDS0xJR0hUX1ZFU0FfRURQX0FVWF9JTlRFUkZB
Q0UpKQorCSAgICAgZGV2X3ByaXYtPnZidC5iYWNrbGlnaHQudHlwZSAhPQorCQkgICAgIElOVEVM
X0JBQ0tMSUdIVF9WRVNBX0VEUF9BVVhfSU5URVJGQUNFICYmCisJICAgICAhZHJtX2RwX2hhc19x
dWlyaygmaW50ZWxfZHAtPmRlc2MsCisJCQkgICAgICAgRFBfRFBDRF9RVUlSS19GT1JDRV9EUENE
X0JBQ0tMSUdIVCkpKQogCQlyZXR1cm4gLUVOT0RFVjsKIAogCWlmICghaW50ZWxfZHBfYXV4X2Rp
c3BsYXlfY29udHJvbF9jYXBhYmxlKGludGVsX2Nvbm5lY3RvcikpCmRpZmYgLS1naXQgYS9pbmNs
dWRlL2RybS9kcm1fZHBfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKaW5k
ZXggNTFlY2I1MTEyZWY4Li5hNDQ0MjA5Y2Q1NGIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2Ry
bV9kcF9oZWxwZXIuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKQEAgLTE1MjAs
NiArMTUyMCwxNCBAQCBlbnVtIGRybV9kcF9xdWlyayB7CiAJICogVGhlIGRyaXZlciBzaG91bGQg
aWdub3JlIFNJTktfQ09VTlQgZHVyaW5nIGRldGVjdGlvbi4KIAkgKi8KIAlEUF9EUENEX1FVSVJL
X05PX1NJTktfQ09VTlQsCisJLyoqCisJICogQERQX0RQQ0RfUVVJUktfRk9SQ0VfRFBDRF9CQUNL
TElHSFQ6CisJICoKKwkgKiBUaGUgZGV2aWNlIGlzIHRlbGxpbmcgdGhlIHRydXRoIHdoZW4gaXQg
c2F5cyB0aGF0IGl0IHVzZXMgRFBDRAorCSAqIGJhY2tsaWdodCBjb250cm9scywgZXZlbiBpZiB0
aGUgc3lzdGVtJ3MgZmlybXdhcmUgZGlzYWdyZWVzLgorCSAqIFRoZSBkcml2ZXIgc2hvdWxkIGhv
bm9yIHRoZSBEUENEIGJhY2tsaWdodCBjYXBhYmlsaXRpZXMgYWR2ZXJ0aXNlZC4KKwkgKi8KKwlE
UF9EUENEX1FVSVJLX0ZPUkNFX0RQQ0RfQkFDS0xJR0hULAogfTsKIAogLyoqCi0tIAoyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
