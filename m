Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 995A3A7660
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 23:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191F98989C;
	Tue,  3 Sep 2019 21:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70508989A;
 Tue,  3 Sep 2019 21:41:20 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id t8so1663849lfc.13;
 Tue, 03 Sep 2019 14:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=H1PZ5kr/dsAx4cT+3csxTLNZoAMXbRZcCQBAXYy5TT4=;
 b=epXfmfqpzYrCHaJHetU3rgz6FM4ws8czoYkVEnaJo9oJcf76Z8Ms2b13kCwLI73E9Z
 /hAGTbPR+vbJIFXlmvHiQWkWL83o4eTYPPto4tbG+Ur1bL4RfW/3rmpxEjAO8b0O1b1a
 wWa71oEC8QGZgOiwDohyONMTcdndpyAsW4P+3dTT+g8dL+ZQ6EWeseOT5pp7sgyeXAmw
 yylunHFFjFm08m60+VsBc+MsS145lRDZmwO8XAVbqNM52+MaOFdx9FtkvemUg0TzcMcG
 vCWG6fLLBYTSQzIIgXYig/fglSns5PpUAcP+3IoLo4k+iS6GPcE4toWLUASLiIo6fUty
 f4HQ==
X-Gm-Message-State: APjAAAXpYZjDYAiyGJ6kCePJUx9mEizOS0Le1rD480soGw1o2f2KbRi8
 rLB6Ct93KEuBY0ejzDzwJ94Ewgnd8lunxayHrlA=
X-Google-Smtp-Source: APXvYqyOBelIp4G9zJKfaeg2cThEC8YLsrZgrTmdSFzXCqEvB4d4FrCaYMulrTL44c+RpnIjHGcjltwT5se1HqzpcOo=
X-Received: by 2002:a19:6d02:: with SMTP id i2mr21293876lfc.191.1567546878927; 
 Tue, 03 Sep 2019 14:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190903204645.25487-1-lyude@redhat.com>
 <20190903204645.25487-12-lyude@redhat.com>
In-Reply-To: <20190903204645.25487-12-lyude@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 4 Sep 2019 07:41:07 +1000
Message-ID: <CAPM=9tz0fdZpfFAfQ0aCQ4D+0XQGm=zqeFKDHPFNwVEUeM1f5g@mail.gmail.com>
Subject: Re: [PATCH v2 11/27] drm/dp_mst: Constify guid in
 drm_dp_get_mst_branch_by_guid()
To: Lyude Paul <lyude@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=H1PZ5kr/dsAx4cT+3csxTLNZoAMXbRZcCQBAXYy5TT4=;
 b=KKOjF1/f+Z0h2Z0BKBQOo5FLzyYb10ANYNttnM4Damtx4objdFfaPYt9uf0Fpk6MW4
 +bLAinuaZOO9lMZhAZh+CEafF1gbvnDBZRF8gBDGGp8FN9OpCYHdjepUoNMIcPBq+xIf
 RfM0i91nWttVdX9k0r9M7tmvGACkG2jbjRYrm/oKl42pnrNbB/K9hX+Mm/J8st0DDs4Z
 aBpFpFpFfFu0oj3CqplIz0/lxFkjKxNTnH47xpuTsfpJYc19TpWXf6rcIvKxsYZ/2QDD
 lGPx2tnHZr8cOO7VVs7OzdqnR+2v9lOKqGVGpIC5+QJMPMPotdRctk313b0Ps8dSoCz8
 7S4g==
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
Cc: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Harry Wentland <hwentlan@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Juston Li <juston.li@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCA0IFNlcCAyMDE5IGF0IDA2OjQ4LCBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29t
PiB3cm90ZToKPgo+IEFuZCBpdCdzIGhlbHBlciwgd2UnbGwgYmUgdXNpbmcgdGhpcyBpbiBqdXN0
IGEgbW9tZW50Lgo+CgpSZXZpZXdlZC1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNv
bT4KCj4gQ2M6IEp1c3RvbiBMaSA8anVzdG9uLmxpQGludGVsLmNvbT4KPiBDYzogSW1yZSBEZWFr
IDxpbXJlLmRlYWtAaW50ZWwuY29tPgo+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPgo+IENjOiBIYXJyeSBXZW50bGFuZCA8aHdlbnRsYW5AYW1kLmNv
bT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBTaWduZWQt
b2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0
X3RvcG9sb2d5LmMKPiBpbmRleCA0MzQ1Mjg3MmVmYWQuLmI0NGQzNjk2YzA5YSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IEBAIC0yMDYwLDcgKzIwNjAsNyBAQCBz
dGF0aWMgc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICpkcm1fZHBfZ2V0X21zdF9icmFuY2hfZGV2
aWNlKHN0cnVjdCBkcm1fZHBfbXN0Xwo+Cj4gIHN0YXRpYyBzdHJ1Y3QgZHJtX2RwX21zdF9icmFu
Y2ggKmdldF9tc3RfYnJhbmNoX2RldmljZV9ieV9ndWlkX2hlbHBlcigKPiAgICAgICAgIHN0cnVj
dCBkcm1fZHBfbXN0X2JyYW5jaCAqbXN0YiwKPiAtICAgICAgIHVpbnQ4X3QgKmd1aWQpCj4gKyAg
ICAgICBjb25zdCB1aW50OF90ICpndWlkKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgZHJtX2RwX21z
dF9icmFuY2ggKmZvdW5kX21zdGI7Cj4gICAgICAgICBzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpw
b3J0Owo+IEBAIC0yMDg0LDcgKzIwODQsNyBAQCBzdGF0aWMgc3RydWN0IGRybV9kcF9tc3RfYnJh
bmNoICpnZXRfbXN0X2JyYW5jaF9kZXZpY2VfYnlfZ3VpZF9oZWxwZXIoCj4KPiAgc3RhdGljIHN0
cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqCj4gIGRybV9kcF9nZXRfbXN0X2JyYW5jaF9kZXZpY2Vf
YnlfZ3VpZChzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDhfdCAqZ3VpZCkKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgdWludDhfdCAqZ3VpZCkKPiAgewo+ICAgICAg
ICAgc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICptc3RiOwo+ICAgICAgICAgaW50IHJldDsKPiAt
LQo+IDIuMjEuMAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
