Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8862D4A342
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 16:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67CAA6E17B;
	Tue, 18 Jun 2019 14:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3066E17B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 14:02:49 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id k8so21894924eds.7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 07:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=msqCONNV1H08SzrVEOsCbMPoul6NP4oR7dk8Qo7oJqU=;
 b=nlJt2Bzd8NSpqhce88tLP6Hlvlo8C9nkVyIIGKx+v/FMPkOGLvfw2hbC7LO5dXBaGm
 blQxxUj9eVgRQXWaM1g8nL4B222P4tpTcVZB1YlF89M6GSEgGvFWYvTEhMl/moT7zs7D
 FzJ1lW78u3Hfhs5uiLHq+y7FQkwnE5jQGsAjT5q04GBLvjVnXisF4XMZOtHkK1eojGnP
 rTf2MFzN4F1aZgW/xejfjITurX9eZoHauKoE0uZLD6WS6pWlYmJ5fTDef2kmCAkq3TyA
 yCpf+S4fG8NJA6DC6qzT4ghep4T3PuUIQ7O1nxs32ZW1JA3FU5MG+LlmOtqgzx9MzyPO
 MUjg==
X-Gm-Message-State: APjAAAVlNk9plrKadeF25c1CH5Nun2VzAEPilSvI8QAJ+Vaj5Z5uoa+M
 a0EFB/MaN2URCu83ml28R1vb3w==
X-Google-Smtp-Source: APXvYqx28PSLe0JmJswHjHtdURCJc9m9CQMxBbNGmo/Dphhd1Pkgm6ONKApQIst4FdOBXZJa631WYA==
X-Received: by 2002:a50:8ba6:: with SMTP id m35mr66691549edm.199.1560866567893; 
 Tue, 18 Jun 2019 07:02:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id 30sm435738eji.5.2019.06.18.07.02.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 07:02:47 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/todo: Update drm_gem_object_funcs todo even more
Date: Tue, 18 Jun 2019 16:02:41 +0200
Message-Id: <20190618140241.19856-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-2-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=msqCONNV1H08SzrVEOsCbMPoul6NP4oR7dk8Qo7oJqU=;
 b=lAHldTeCLKjylpzvno55ytHkH6yySrYHfW2AGDJh2XJfCGPZ39jLx0f3lJdyjJpSdd
 BUf4L3POMsBfkcyGOhIkZo1lQdnAvnzx68lp8YsD6aZgoFlk72+uBhGAbbVURsc2jJ7I
 P9aPOUhMqnBfO5mZsVfTTDpAqpuW6u5A43cvU=
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSBydXNoZWQgbWVyZ2luZyB0aGlzIGEgYml0IHRvbyBtdWNoLCBhbmQgTm9yYWxmIHBvaW50ZWQg
b3V0IHRoYXQKd2UncmUgYSBsb3QgYmV0dGVyIGFscmVhZHkgYW5kIGhhdmUgbWFkZSBncmVhdCBw
cm9ncmVzcy4KCkxldCdzIHRyeSBhZ2Fpbi4KCkZpeGVzOiA0MmRiYmI0YjU0YTMgKCJkcm0vdG9k
bzogQWRkIG5ldyBkZWJ1Z2ZzIHRvZG8iKQpDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50
ZWwuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFu
a2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRA
Ym9vdGxpbi5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVs
QHJlZGhhdC5jb20+CkNjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpDYzogTm9yYWxm
IFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+CkNjOiBFcmljIEFuaG9sdCA8ZXJpY0Bhbmhv
bHQubmV0PgpDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgotLS0KIERvY3VtZW50
YXRpb24vZ3B1L3RvZG8ucnN0IHwgOCArKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dwdS90
b2RvLnJzdCBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0CmluZGV4IDI1ODc4ZGQwNDhmZC4u
NjZjMTIzNzM3YzNkIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAorKysg
Yi9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdApAQCAtMjEyLDkgKzIxMiwxMSBAQCBzdHJ1Y3Qg
ZHJtX2dlbV9vYmplY3RfZnVuY3MKIEdFTSBvYmplY3RzIGNhbiBub3cgaGF2ZSBhIGZ1bmN0aW9u
IHRhYmxlIGluc3RlYWQgb2YgaGF2aW5nIHRoZSBjYWxsYmFja3Mgb24gdGhlCiBEUk0gZHJpdmVy
IHN0cnVjdC4gVGhpcyBpcyBub3cgdGhlIHByZWZlcnJlZCB3YXkgYW5kIGRyaXZlcnMgY2FuIGJl
IG1vdmVkIG92ZXIuCiAKLVVuZm9ydHVuYXRlbHkgc29tZSBvZiB0aGUgcmVjZW50bHkgYWRkZWQg
R0VNIGhlbHBlcnMgYXJlIGdvaW5nIGluIHRoZSB3cm9uZwotZGlyZWN0aW9uIGJ5IGFkZGluZyBP
UFMgbWFjcm9zIHRoYXQgdXNlIHRoZSBvbGQsIGRlcHJlY2F0ZWQgaG9va3MuIFNlZQotRFJNX0dF
TV9DTUFfVk1BUF9EUklWRVJfT1BTLCBEUk1fR0VNX1NITUVNX0RSSVZFUl9PUFMsIGFuZCBEUk1f
R0VNX1ZSQU1fRFJJVkVSX1BSSU1FLgorRFJNX0dFTV9DTUFfVk1BUF9EUklWRVJfT1BTLCBEUk1f
R0VNX1NITUVNX0RSSVZFUl9PUFMgYWxyZWFkeSBzdXBwb3J0IHRoaXMsIGJ1dAorRFJNX0dFTV9W
UkFNX0RSSVZFUl9QUklNRSBkb2VzIG5vdCB5ZXQgYW5kIG5lZWRzIHRvIGJlIGFsaWdlbmQgd2l0
aCB0aGUgcHJldmlvdXMKK3R3by4gV2UgYWxzbyBuZWVkIGEgMm5kIHZlcnNpb24gb2YgdGhlIENN
QSBkZWZpbmUgdGhhdCBkb2Vzbid0IHJlcXVpcmUgdGhlCit2bWFwcGluZyB0byBiZSBwcmVzZW50
IChkaWZmZXJlbnQgaG9vayBmb3IgcHJpbWUgaW1wb3J0aW5nKS4gUGx1cyB0aGlzIG5lZWRzIHRv
CitiZSByb2xsZWQgb3V0IHRvIGFsbCBkcml2ZXJzIHVzaW5nIHRoZWlyIG93biBpbXBsZW1lbnRh
dGlvbnMsIHRvby4KIAogVXNlIERSTV9NT0RFU0VUX0xPQ0tfQUxMXyogaGVscGVycyBpbnN0ZWFk
IG9mIGJvaWxlcnBsYXRlCiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
