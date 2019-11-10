Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8159CF6ADA
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2019 19:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE576E0B8;
	Sun, 10 Nov 2019 18:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3096E0B8
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2019 18:41:03 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-S0nzOpYeMJ6hRU_uNRt1Aw-1; Sun, 10 Nov 2019 13:41:01 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90389800C77;
 Sun, 10 Nov 2019 18:40:59 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFDB55C8A6;
 Sun, 10 Nov 2019 18:40:56 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH] drm: Add DRM_MODE_TYPE_USERDEF flag to probed modes matching
 a video= argument
Date: Sun, 10 Nov 2019 19:40:55 +0100
Message-Id: <20191110184055.3979-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: S0nzOpYeMJ6hRU_uNRt1Aw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573411262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jpVOMS3Ek/KmXpIbV7emM7OL5w3hcNQ3/yAzY1kOytA=;
 b=PAmxVht/4Cwf7evGOlfCkOgg+np/530G/GBOIRHYrCU2YzPt/1iu6aCyotQtoAo9v4qJv4
 oPCFYV5wnrMskwICHlHzjCsG5NuhGfjEE08I5oY7cGOncfMKh06UBAz4+iyRLbAF+o52gd
 HhkGWYESTO6QDhW9sJCozWGXiXJiIjE=
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?q?Mathieu=20Alexandre-T=C3=A9treault?= <alexandretm@amotus.ca>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtX2hlbHBlcl9wcm9iZV9hZGRfY21kbGluZV9tb2RlKCkgcHJlZmVycyB1c2luZyBhIHByb2Jl
ZCBtb2RlIG1hdGNoaW5nCmEgdmlkZW89IGFyZ3VtZW50IG92ZXIgY2FsY3VsYXRpbmcgb3VyIG93
biB0aW1pbmdzIGZvciB0aGUgdXNlciBzcGVjaWZpZWQKbW9kZSB1c2luZyBDVlQgb3IgR1RGLgoK
QnV0IHVzZXJzcGFjZSBjb2RlIHdoaWNoIGlzIGF1dG8tY29uZmlndXJpbmcgdGhlIG1vZGUgbWF5
IHdhbnQgdG8ga25vdyB0aGF0CnRoZSB1c2VyIGhhcyBzcGVjaWZpZWQgdGhhdCBtb2RlIG9uIHRo
ZSBrZXJuZWwgY29tbWFuZGxpbmUgc28gdGhhdCBpdCBjYW4KcGljayB0aGF0IG1vZGUgb3ZlciB0
aGUgbW9kZSB3aGljaCBpcyBtYXJrZWQgYXMgRFJNX01PREVfVFlQRV9QUkVGRVJSRUQuCgpUaGlz
IGNvbW1pdCBzZXRzIHRoZSBEUk1fTU9ERV9UWVBFX1VTRVJERUYgZmxhZyBvbiB0aGUgbWF0Y2hp
bmcgbW9kZSwganVzdAphcyB3ZSB3b3VsZCBkbyBvbiB0aGUgdXNlci1zcGVjaWZpZWQgbW9kZSB3
aGVuIG5vIG1hdGNoaW5nIHByb2JlZCBtb2RlIGlzCmZvdW5kLgoKU2lnbmVkLW9mZi1ieTogSGFu
cyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJt
X3Byb2JlX2hlbHBlci5jIHwgMiArKwogaW5jbHVkZS9kcm0vZHJtX21vZGVzLmggICAgICAgICAg
ICB8IDMgKystCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJvYmVfaGVscGVyLmMgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX3Byb2JlX2hlbHBlci5jCmluZGV4IGVmMmM0NjgyMDVhMi4uNGZlZDY0
YmUxMWY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3Byb2JlX2hlbHBlci5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJvYmVfaGVscGVyLmMKQEAgLTE1Nyw2ICsxNTcsOCBA
QCBzdGF0aWMgaW50IGRybV9oZWxwZXJfcHJvYmVfYWRkX2NtZGxpbmVfbW9kZShzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCQkJCWNvbnRpbnVlOwogCQl9CiAKKwkJLyogTWFyayB0
aGUgbWF0Y2hpbmcgbW9kZSBhcyBiZWluZyBwcmVmZXJyZWQgYnkgdGhlIHVzZXIgKi8KKwkJbW9k
ZS0+dHlwZSB8PSBEUk1fTU9ERV9UWVBFX1VTRVJERUY7CiAJCXJldHVybiAwOwogCX0KIApkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX21vZGVzLmggYi9pbmNsdWRlL2RybS9kcm1fbW9kZXMu
aAppbmRleCBlOTQ2ZTIwYzYxZDguLmM3ZWZiNzQ4N2U5YiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9k
cm0vZHJtX21vZGVzLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX21vZGVzLmgKQEAgLTI1Niw3ICsy
NTYsOCBAQCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSB7CiAJICogIC0gRFJNX01PREVfVFlQRV9E
UklWRVI6IE1vZGUgY3JlYXRlZCBieSB0aGUgZHJpdmVyLCB3aGljaCBpcyBhbGwgb2YKIAkgKiAg
ICB0aGVtIHJlYWxseS4gRHJpdmVycyBtdXN0IHNldCB0aGlzIGJpdCBmb3IgYWxsIG1vZGVzIHRo
ZXkgY3JlYXRlCiAJICogICAgYW5kIGV4cG9zZSB0byB1c2Vyc3BhY2UuCi0JICogIC0gRFJNX01P
REVfVFlQRV9VU0VSREVGOiBNb2RlIGRlZmluZWQgdmlhIGtlcm5lbCBjb21tYW5kIGxpbmUKKwkg
KiAgLSBEUk1fTU9ERV9UWVBFX1VTRVJERUY6IE1vZGUgZGVmaW5lZCBvciBzZWxlY3RlZCB2aWEg
dGhlIGtlcm5lbAorCSAqICAgIGNvbW1hbmQgbGluZS4KIAkgKgogCSAqIFBsdXMgYSBiaWcgbGlz
dCBvZiBmbGFncyB3aGljaCBzaG91bGRuJ3QgYmUgdXNlZCBhdCBhbGwsIGJ1dCBhcmUKIAkgKiBz
dGlsbCBhcm91bmQgc2luY2UgdGhlc2UgZmxhZ3MgYXJlIGFsc28gdXNlZCBpbiB0aGUgdXNlcnNw
YWNlIEFCSS4KLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
