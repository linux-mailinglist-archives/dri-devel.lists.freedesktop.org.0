Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C65107B35
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2019 00:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94C86E33C;
	Fri, 22 Nov 2019 23:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8917E6E369
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 23:16:51 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-BFQ1WrXwPQ-4qQnXUx7qFA-1; Fri, 22 Nov 2019 18:16:49 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16297DB60;
 Fri, 22 Nov 2019 23:16:47 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99C7319C4F;
 Fri, 22 Nov 2019 23:16:43 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/5] drm/i915: Fix DPCD register order in
 intel_dp_aux_enable_backlight()
Date: Fri, 22 Nov 2019 18:16:01 -0500
Message-Id: <20191122231616.2574-4-lyude@redhat.com>
In-Reply-To: <20191122231616.2574-1-lyude@redhat.com>
References: <20191122231616.2574-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: BFQ1WrXwPQ-4qQnXUx7qFA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574464610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PpG336iXGmBIaokNTk61GcAbpsZ3/UFehOeJXzLEeZc=;
 b=EoFYNfpmOzgntzougSG2HczW06PsbdErrYwyvz62/WFBr8gSPEQ+SAKiwdUNpW/R3BSy47
 4q99iEXCPEv0eZ0v+xz+weCDtq59+xgl3FweG6A+phT/B4l/czuXn3M71vBCN5+v7WBule
 YVleAkwAKhSlbdaYb9IfNWzeOgtIEpE=
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
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIGVEUCBwYW5lbHMsIGl0IGFwcGVhcnMgaXQncyBleHBlY3RlZCB0aGF0IHNvIGxvbmcgYXMg
dGhlIHBhbmVsIGlzIGluCkRQQ0QgY29udHJvbCBtb2RlIHRoYXQgdGhlIGJyaWdodG5lc3MgdmFs
dWUgaXMgbmV2ZXIgc2V0IHRvIDAuIEluc3RlYWQsCmlmIHRoZSBkZXNpcmVkIGVmZmVjdCBpcyB0
byBzZXQgdGhlIHBhbmVsJ3MgYmFja2xpZ2h0IHRvIDAgd2UncmUKZXhwZWN0ZWQgdG8gc2ltcGx5
IHR1cm4gb2ZmIHRoZSBiYWNrbGlnaHQgdGhyb3VnaCB0aGUKRFBfRURQX0RJU1BMQVlfQ09OVFJP
TF9SRUdJU1RFUi4KCldlIGFscmVhZHkgZG8gdGhlIGxhdHRlciBjb3JyZWN0bHkgaW4gaW50ZWxf
ZHBfYXV4X2Rpc2FibGVfYmFja2xpZ2h0KCkuCkJ1dCwgd2UgbWFrZSB0aGUgbWlzdGFrZSBvZiB3
cml0aW5nIHRoZSBEUENEIHJlZ2lzdGVycyBpbiB0aGUgd3JvbmcKb3JkZXIgd2hlbiBlbmFibGlu
ZyB0aGUgYmFja2xpZ2h0IGluIGludGVsX2RwX2F1eF9lbmFibGVfYmFja2xpZ2h0KCkKc2luY2Ug
d2UgY3VycmVudGx5IGVuYWJsZSB0aGUgYmFja2xpZ2h0IHRocm91Z2gKRFBfRURQX0RJU1BMQVlf
Q09OVFJPTF9SRUdJU1RFUiBiZWZvcmUgd3JpdGluZyB0aGUgYnJpZ2h0bmVzcyBsZXZlbC4gT24K
dGhlIFgxIEV4dHJlbWUgMm5kIEdlbmVyYXRpb24sIHRoaXMgYXBwZWFycyB0byBoYXZlIHRoZSBw
b3RlbnRpYWwgb2YKY29uZnVzaW5nIHRoZSBwYW5lbCBpbiBzdWNoIGEgd2F5IHRoYXQgZnVydGhl
ciBhdHRlbXB0cyB0byBzZXQgdGhlCmJyaWdodG5lc3MgZG9uJ3QgYWN0dWFsbHkgY2hhbmdlIHRo
ZSBiYWNrbGlnaHQgYXMgZXhwZWN0ZWQgYW5kIGxlYXZlIGl0Cm9mZi4gUHJlc3VtYWJseSwgdGhp
cyBoYXBwZW5zIGJlY2F1c2UgdGhlIGluY29ycmVjdCByZWdpc3RlciB3cml0aW5nCm9yZGVyIGJy
aWVmbHkgbGVhdmVzIHRoZSBwYW5lbCB3aXRoIERQQ0QgbW9kZSBlbmFibGVkIGFuZCBhIDAgYnJp
Z2h0bmVzcwpsZXZlbCBzZXQuCgpTbywgcmV2ZXJzZSB0aGUgb3JkZXIgd2Ugd3JpdGUgdGhlIERQ
Q0QgcmVnaXN0ZXJzIHdoZW4gZW5hYmxpbmcgdGhlCnBhbmVsIGJhY2tsaWdodCBzbyB0aGF0IHdl
IHdyaXRlIHRoZSBicmlnaHRuZXNzIHZhbHVlIGZpcnN0LCBhbmQgZW5hYmxlCnRoZSBiYWNrbGln
aHQgc2Vjb25kLiBUaGlzIGZpeCBhcHBlYXJzIHRvIGJlIHRoZSBmaW5hbCBiaXQgbmVlZGVkIHRv
IGdldAp0aGUgYmFja2xpZ2h0IG9uIHRoZSBUaGlua1BhZCBYMSBFeHRyZW1lIDJuZCBHZW5lcmF0
aW9uJ3MgQU1PTEVEIHNjcmVlbgp3b3JraW5nLgoKU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8
bHl1ZGVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2RwX2F1eF9iYWNrbGlnaHQuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9kcF9hdXhfYmFja2xpZ2h0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2RwX2F1eF9iYWNrbGlnaHQuYwppbmRleCAwYmY4NzcyYmM3YmIuLjg3YjU5ZGI5
ZmZlMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9h
dXhfYmFja2xpZ2h0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
cF9hdXhfYmFja2xpZ2h0LmMKQEAgLTIwNSw4ICsyMDUsOSBAQCBzdGF0aWMgdm9pZCBpbnRlbF9k
cF9hdXhfZW5hYmxlX2JhY2tsaWdodChjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0
Y19zdAogCQl9CiAJfQogCisJaW50ZWxfZHBfYXV4X3NldF9iYWNrbGlnaHQoY29ubl9zdGF0ZSwK
KwkJCQkgICBjb25uZWN0b3ItPnBhbmVsLmJhY2tsaWdodC5sZXZlbCk7CiAJc2V0X2F1eF9iYWNr
bGlnaHRfZW5hYmxlKGludGVsX2RwLCB0cnVlKTsKLQlpbnRlbF9kcF9hdXhfc2V0X2JhY2tsaWdo
dChjb25uX3N0YXRlLCBjb25uZWN0b3ItPnBhbmVsLmJhY2tsaWdodC5sZXZlbCk7CiB9CiAKIHN0
YXRpYyB2b2lkIGludGVsX2RwX2F1eF9kaXNhYmxlX2JhY2tsaWdodChjb25zdCBzdHJ1Y3QgZHJt
X2Nvbm5lY3Rvcl9zdGF0ZSAqb2xkX2Nvbm5fc3RhdGUpCi0tIAoyLjIxLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
