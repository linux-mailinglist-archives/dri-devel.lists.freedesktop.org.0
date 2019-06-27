Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 512AD5895D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 19:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CDED89023;
	Thu, 27 Jun 2019 17:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F64289023
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 17:57:47 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20B12216FD
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 17:57:47 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id d15so2508038qkl.4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 10:57:47 -0700 (PDT)
X-Gm-Message-State: APjAAAWWksK0pbmmiuRDIpW9Hmr8ZT8e9J5pyqeWW0qKv61GIMb6NC5I
 PGUdAkHOw+OERBVl//bvi3Z5wc/tTtJpAJv2hA==
X-Google-Smtp-Source: APXvYqxhQp2BTbtvCFGln6FbDKha/1kQyYa7alsmb9UvgsSNplaI6MWMixSvDaZWUZprwBsf2EDRykU9lv19KYFgGos=
X-Received: by 2002:ae9:ebd1:: with SMTP id b200mr4759890qkg.152.1561658266279; 
 Thu, 27 Jun 2019 10:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190627155318.38053-1-steven.price@arm.com>
 <20190627155318.38053-2-steven.price@arm.com>
In-Reply-To: <20190627155318.38053-2-steven.price@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 27 Jun 2019 11:57:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ5ebyrvapvOSvg1ejgkbqEZyYh2AWAbO0UE=DssKtW1Q@mail.gmail.com>
Message-ID: <CAL_JsqJ5ebyrvapvOSvg1ejgkbqEZyYh2AWAbO0UE=DssKtW1Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drm/gem: Rename drm_gem_dumb_map_offset() to
 drm_gem_map_offset()
To: Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561658267;
 bh=AuFJz8ka4bbd9U8/rrPBsrwzzsfKjM33G6LhSwHHcbw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pwSTMjXHGt/r9fLzwmASxdxE/MmLeOQQgtEWbcj4Fz3PTiBFMaiK7bmkIU1SJoaOl
 w9R8eI2/KXAX3pKdJp8fhRJfvTpdd3SGtoI+mq/ZuFWFQPWzJnHZeJBgsrIg+oVgL8
 3BLPjvrqsqk/1SFDO5kG5qLtztrvaPW/n3nt+1XY=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgOTo1MyBBTSBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmlj
ZUBhcm0uY29tPiB3cm90ZToKPgo+IGRybV9nZW1fZHVtYl9tYXBfb2Zmc2V0KCkgaXMgYSB1c2Vm
dWwgaGVscGVyIGZvciBub24tZHVtYiBjbGllbnRzLCBzbwo+IHJlbmFtZSBpdCB0byByZW1vdmUg
dGhlIF9kdW1iIGFuZCBhZGQgYSBjb21tZW50IHRoYXQgaXQgY2FuIGJlIHVzZWQgYnkKPiBzaG1l
bSBjbGllbnRzLgo+Cj4gU2lnbmVkLW9mZi1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VA
YXJtLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9kdW1iX2J1ZmZlcnMuYyAgICAg
IHwgNCArKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMgICAgICAgICAgICAgICB8IDkg
KysrKysrLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nZW0uYyB8IDMg
Ky0tCj4gIGluY2x1ZGUvZHJtL2RybV9nZW0uaCAgICAgICAgICAgICAgICAgICB8IDQgKystLQo+
ICA0IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kdW1iX2J1ZmZlcnMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZHVtYl9idWZmZXJzLmMKPiBpbmRleCBkMThhNzQwZmUwZjEuLmI1NWNmYzll
ODc3MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2R1bWJfYnVmZmVycy5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kdW1iX2J1ZmZlcnMuYwo+IEBAIC00OCw3ICs0OCw3
IEBACj4gICAqIFRvIHN1cHBvcnQgZHVtYiBvYmplY3RzIGRyaXZlcnMgbXVzdCBpbXBsZW1lbnQg
dGhlICZkcm1fZHJpdmVyLmR1bWJfY3JlYXRlCj4gICAqIG9wZXJhdGlvbi4gJmRybV9kcml2ZXIu
ZHVtYl9kZXN0cm95IGRlZmF1bHRzIHRvIGRybV9nZW1fZHVtYl9kZXN0cm95KCkgaWYKPiAgICog
bm90IHNldCBhbmQgJmRybV9kcml2ZXIuZHVtYl9tYXBfb2Zmc2V0IGRlZmF1bHRzIHRvCj4gLSAq
IGRybV9nZW1fZHVtYl9tYXBfb2Zmc2V0KCkuIFNlZSB0aGUgY2FsbGJhY2tzIGZvciBmdXJ0aGVy
IGRldGFpbHMuCj4gKyAqIGRybV9nZW1fbWFwX29mZnNldCgpLiBTZWUgdGhlIGNhbGxiYWNrcyBm
b3IgZnVydGhlciBkZXRhaWxzLgo+ICAgKgo+ICAgKiBOb3RlIHRoYXQgZHVtYiBvYmplY3RzIG1h
eSBub3QgYmUgdXNlZCBmb3IgZ3B1IGFjY2VsZXJhdGlvbiwgYXMgaGFzIGJlZW4KPiAgICogYXR0
ZW1wdGVkIG9uIHNvbWUgQVJNIGVtYmVkZGVkIHBsYXRmb3Jtcy4gU3VjaCBkcml2ZXJzIHJlYWxs
eSBtdXN0IGhhdmUKPiBAQCAtMTI3LDcgKzEyNyw3IEBAIGludCBkcm1fbW9kZV9tbWFwX2R1bWJf
aW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYXJncy0+aGFuZGxlLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmYXJncy0+b2Zmc2V0KTsKPiAg
ICAgICAgIGVsc2UKPiAtICAgICAgICAgICAgICAgcmV0dXJuIGRybV9nZW1fZHVtYl9tYXBfb2Zm
c2V0KGZpbGVfcHJpdiwgZGV2LCBhcmdzLT5oYW5kbGUsCj4gKyAgICAgICAgICAgICAgIHJldHVy
biBkcm1fZ2VtX21hcF9vZmZzZXQoZmlsZV9wcml2LCBkZXYsIGFyZ3MtPmhhbmRsZSwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZhcmdzLT5vZmZzZXQp
Owo+ICB9Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZ2VtLmMKPiBpbmRleCBhOGM0NDY4ZjAzZDkuLjYyODQyYjc3MDFiYiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9nZW0uYwo+IEBAIC0yOTgsNyArMjk4LDcgQEAgZHJtX2dlbV9oYW5kbGVfZGVs
ZXRlKHN0cnVjdCBkcm1fZmlsZSAqZmlscCwgdTMyIGhhbmRsZSkKPiAgRVhQT1JUX1NZTUJPTChk
cm1fZ2VtX2hhbmRsZV9kZWxldGUpOwo+Cj4gIC8qKgo+IC0gKiBkcm1fZ2VtX2R1bWJfbWFwX29m
ZnNldCAtIHJldHVybiB0aGUgZmFrZSBtbWFwIG9mZnNldCBmb3IgYSBnZW0gb2JqZWN0Cj4gKyAq
IGRybV9nZW1fbWFwX29mZnNldCAtIHJldHVybiB0aGUgZmFrZSBtbWFwIG9mZnNldCBmb3IgYSBn
ZW0gb2JqZWN0Cj4gICAqIEBmaWxlOiBkcm0gZmlsZS1wcml2YXRlIHN0cnVjdHVyZSBjb250YWlu
aW5nIHRoZSBnZW0gb2JqZWN0Cj4gICAqIEBkZXY6IGNvcnJlc3BvbmRpbmcgZHJtX2RldmljZQo+
ICAgKiBAaGFuZGxlOiBnZW0gb2JqZWN0IGhhbmRsZQo+IEBAIC0zMDcsMTAgKzMwNywxMyBAQCBF
WFBPUlRfU1lNQk9MKGRybV9nZW1faGFuZGxlX2RlbGV0ZSk7Cj4gICAqIFRoaXMgaW1wbGVtZW50
cyB0aGUgJmRybV9kcml2ZXIuZHVtYl9tYXBfb2Zmc2V0IGttcyBkcml2ZXIgY2FsbGJhY2sgZm9y
Cj4gICAqIGRyaXZlcnMgd2hpY2ggdXNlIGdlbSB0byBtYW5hZ2UgdGhlaXIgYmFja2luZyBzdG9y
YWdlLgo+ICAgKgo+ICsgKiBJdCBjYW4gYWxzbyBiZSB1c2VkIGJ5IGRyaXZlcnMgdXNpbmcgdGhl
IHNobWVtIGJhY2tlbmQgYXMgdGhleSBoYXZlIHRoZQo+ICsgKiBzYW1lIHJlc3RyaWN0aW9uIHRo
YXQgaW1wb3J0ZWQgb2JqZWN0cyBjYW5ub3QgYmUgbWFwcGVkLgoKTWF5YmUgYmV0dGVyIG5vdCB0
byBzYXkgJ3NobWVtJyBleHBsaWNpdGx5IG9yIGp1c3QgbWVudGlvbiBpdCBhcyBhbgpleGFtcGxl
IHNvIHdoZW4gd2UgaGF2ZSBhIDJuZCBjYXNlIHdlIGRvbid0IGhhdmUgdG8gdXBkYXRlIHRoZQpj
b21tZW50LgoKLi4uZHJpdmVycyB3aXRoIEdFTSBCTyBpbXBsZW1lbnRhdGlvbnMgd2hpY2ggaGF2
ZSB0aGUgc2FtZS4uLgoKSSBjYW4gZml4IHVwIGFuZCBhcHBseS4gU29tZSBvdGhlciBhY2tzIHdv
dWxkIGJlIG5pY2UgZmlyc3QuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
