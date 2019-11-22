Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6EE107B36
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2019 00:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67466E9A5;
	Fri, 22 Nov 2019 23:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B746E33C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 23:16:52 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-kNzxvEwmPZqBbyVJqFmDYw-1; Fri, 22 Nov 2019 18:16:50 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C35F802693;
 Fri, 22 Nov 2019 23:16:48 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6657D19C4F;
 Fri, 22 Nov 2019 23:16:47 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/5] drm/i915: Auto detect DPCD backlight support by default
Date: Fri, 22 Nov 2019 18:16:02 -0500
Message-Id: <20191122231616.2574-5-lyude@redhat.com>
In-Reply-To: <20191122231616.2574-1-lyude@redhat.com>
References: <20191122231616.2574-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: kNzxvEwmPZqBbyVJqFmDYw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574464611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ty3XICBrVCjAb5qRaafGfNUSOlZQn/VM+rmDiTgZPxQ=;
 b=gd0eDiIpU3NLL2AYCPyyogi1cg/LrDSkdlxPdSV28gqNMis354G7hHOuAPwYf5DiNMyU87
 h+5i0mUBzMi4WkAYSgZeA0/U4J7N9I6PNzzATNG/uXcEJz+bxborPtsCwvlmG15uc+M8rc
 Ool1LgwxLOpjWFFRrRdpksw4DUf8Jvo=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VHVybnMgb3V0IHdlIGFjdHVhbGx5IGFscmVhZHkgaGF2ZSBzb21lIGNvbXBhbmllcywgc3VjaCBh
cyBMZW5vdm8sCnNoaXBwaW5nIG1hY2hpbmVzIHdpdGggQU1PTEVEIHNjcmVlbnMgdGhhdCBkb24n
dCBhbGxvdyBjb250cm9sbGluZyB0aGUKYmFja2xpZ2h0IHRocm91Z2ggdGhlIHVzdWFsIFBXTSBp
bnRlcmZhY2UgYW5kIG9ubHkgYWxsb3cgY29udHJvbGxpbmcgaXQKdGhyb3VnaCB0aGUgc3RhbmRh
cmQgRURQIERQQ0QgaW50ZXJmYWNlLiBPbmUgZXhhbXBsZSBvZiBvbmUgb2YgdGhlc2UKbGFwdG9w
cyBpcyB0aGUgWDEgRXh0cmVtZSAybmQgR2VuZXJhdGlvbi4KClNpbmNlIHdlJ3ZlIGdvdCBzeXN0
ZW1zIHRoYXQgbmVlZCB0aGlzIHR1cm5lZCBvbiBieSBkZWZhdWx0IG5vdyB0byBoYXZlCmJhY2ts
aWdodCBjb250cm9scyB3b3JraW5nIG91dCBvZiB0aGUgYm94LCBsZXQncyBzdGFydCBhdXRvLWRl
dGVjdGluZyBpdApmb3Igc3lzdGVtcyBieSBkZWZhdWx0IGJhc2VkIG9uIHdoYXQgdGhlIFZCVCB0
ZWxscyB1cy4gV2UgZG8gdGhpcyBieQpjaGFuZ2luZyB0aGUgZGVmYXVsdCB2YWx1ZSBmb3IgdGhl
IGVuYWJsZV9kcGNkX2JhY2tsaWdodCBtb2R1bGUgcGFyYW0KZnJvbSAwIHRvIC0xLgoKU2lnbmVk
LW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9pOTE1X3BhcmFtcy5jIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9w
YXJhbXMuaCB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcGFyYW1zLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3BhcmFtcy5jCmluZGV4IDFkZDFmMzY1Mjc5NS4u
MzFlZWQ2MGMxNjdlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3BhcmFt
cy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcGFyYW1zLmMKQEAgLTE3Miw3ICsx
NzIsNyBAQCBpOTE1X3BhcmFtX25hbWVkX3Vuc2FmZShpbmplY3RfcHJvYmVfZmFpbHVyZSwgdWlu
dCwgMDQwMCwKIAogaTkxNV9wYXJhbV9uYW1lZChlbmFibGVfZHBjZF9iYWNrbGlnaHQsIGludCwg
MDYwMCwKIAkiRW5hYmxlIHN1cHBvcnQgZm9yIERQQ0QgYmFja2xpZ2h0IGNvbnRyb2wiCi0JIigt
MT11c2UgcGVyLVZCVCBMRlAgYmFja2xpZ2h0IHR5cGUgc2V0dGluZywgMD1kaXNhYmxlZCBbZGVm
YXVsdF0sIDE9ZW5hYmxlZCkiKTsKKwkiKC0xPXVzZSBwZXItVkJUIExGUCBiYWNrbGlnaHQgdHlw
ZSBzZXR0aW5nIFtkZWZhdWx0XSwgMD1kaXNhYmxlZCwgMT1lbmFibGVkKSIpOwogCiAjaWYgSVNf
RU5BQkxFRChDT05GSUdfRFJNX0k5MTVfR1ZUKQogaTkxNV9wYXJhbV9uYW1lZChlbmFibGVfZ3Z0
LCBib29sLCAwNDAwLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9wYXJh
bXMuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcGFyYW1zLmgKaW5kZXggMzFiODhmMjk3
ZmJjLi5hNzlkMDg2N2Y3N2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVf
cGFyYW1zLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9wYXJhbXMuaApAQCAtNjQs
NyArNjQsNyBAQCBzdHJ1Y3QgZHJtX3ByaW50ZXI7CiAJcGFyYW0oaW50LCByZXNldCwgMykgXAog
CXBhcmFtKHVuc2lnbmVkIGludCwgaW5qZWN0X3Byb2JlX2ZhaWx1cmUsIDApIFwKIAlwYXJhbShp
bnQsIGZhc3Rib290LCAtMSkgXAotCXBhcmFtKGludCwgZW5hYmxlX2RwY2RfYmFja2xpZ2h0LCAw
KSBcCisJcGFyYW0oaW50LCBlbmFibGVfZHBjZF9iYWNrbGlnaHQsIC0xKSBcCiAJcGFyYW0oY2hh
ciAqLCBmb3JjZV9wcm9iZSwgQ09ORklHX0RSTV9JOTE1X0ZPUkNFX1BST0JFKSBcCiAJcGFyYW0o
dW5zaWduZWQgbG9uZywgZmFrZV9sbWVtX3N0YXJ0LCAwKSBcCiAJLyogbGVhdmUgYm9vbHMgYXQg
dGhlIGVuZCB0byBub3QgY3JlYXRlIGhvbGVzICovIFwKLS0gCjIuMjEuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
