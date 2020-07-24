Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8665322CECF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 21:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ADBC6E864;
	Fri, 24 Jul 2020 19:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BAD6E864
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 19:43:57 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id e4so8984827oib.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 12:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=l3LclIiyLbU/j9k98P1t4CjDPw68ICSi2XJVfxyKDUU=;
 b=HreVPY4D7zi7pcb9VRd5EwHj1wPDfVmdAT9VgjCCVC9TAh/bznGLuxCeuAEs1QvzBl
 6IprwP2qnWRoMoQu5QhzzgrFUavVynnIcoVr8y0c9X/6AenDU2/fwd81nihbL7OavWtF
 ISJViEjBwKTy7FJZBn1X7EEbwbGv46Wi7gDkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l3LclIiyLbU/j9k98P1t4CjDPw68ICSi2XJVfxyKDUU=;
 b=rpgj+Xx2PzMQ6MBzHSeNS91546+kWxF8Ea0WzaD3qI+iAZR+n5R+4dQAT9kAKG68fP
 +O/Ewt5sT/y5yEZvf8P2Gg22OGFRDoSTu0qaQIjExIroU80FgSuoGRndT5edtwuElnMH
 rOfj8eRPrb1GNnRDugiMTvfe4gryntH/E+HoTKSKApopjxw8EyGhzE0P03tNgp/U79Mk
 uJejZXA3i/rqsCyM25CY0H7ukmIrh8RLsGMgJAYqlmp1weTfITjrIyYzXSniwslxuzLv
 fuYIdlyt6JveJGwSahvEHHcafN860jJg+B/DPj9o2+8t86Kr5S96H702+hTTKXN6087G
 Lrzg==
X-Gm-Message-State: AOAM5312w0WOBCFIWPb0DtS0IjVH+4dEuUAu0UVBXWZ0Aury6wHYj6Ks
 KAaeZPjButHM1txE1PruipjKDPsEnB0SIiCm9mEYnw==
X-Google-Smtp-Source: ABdhPJwEBiMU97ooDIfJ5FAmJplA1S4ChoQD5md7xeG/ZDFYN+82yVy3qqkds0JAXxJ3bdIqOtd2rbdO+ll4pkgDfU8=
X-Received: by 2002:a05:6808:88:: with SMTP id
 s8mr8851181oic.101.1595619836589; 
 Fri, 24 Jul 2020 12:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200724190718.23567-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200724190718.23567-1-ville.syrjala@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 24 Jul 2020 21:43:45 +0200
Message-ID: <CAKMK7uHBGj-fE17htHOKghsAG15CC_S8vMErPwy0RycM+8Mr7g@mail.gmail.com>
Subject: Re: [PATCH] drm/omap: Use {} to zero initialize the mode
To: Ville Syrjala <ville.syrjala@linux.intel.com>
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
Cc: Dave Airlie <airlied@redhat.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMjQsIDIwMjAgYXQgOTowNyBQTSBWaWxsZSBTeXJqYWxhCjx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+Cj4gVGhlIGZpcnN0IG1lbWJlciBvZiBkcm1f
ZGlzcGxheV9tb2RlIGlzIG5vIGxvbmdlciBhIHN0cnVjdHVyZSwgYnV0Cj4gdGhlIGNvZGUgaXMg
c3RpbGwgdXNpbmcge3swfX0gdG8gemVybyBpbml0aWFsaXplIGl0LiBNYWtlIHRoYXQganVzdAo+
IHt9IHNvIGl0IHdvcmtzIHJlZ2FyZGxlc3Mgb2Ygd2hhdCBsaWVzIGluc2lkZS4KPgo+IENjOiBE
YXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxs
YXVyZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4KPiBDYzogVG9taSBWYWxr
ZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KPiBGaXhlczogNDJhY2IwNmIwMWIxICgiZHJt
OiBwYWhvbGUgc3RydWN0IGRybV9kaXNwbGF5X21vZGUiKQo+IFNpZ25lZC1vZmYtYnk6IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CgpSZXZpZXdlZC1ieTog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaC5jaD4KClRoaXMgbmVlZHMgdG8g
Z28gaW50byBkcm0tbWlzYy1uZXh0LWZpeGVzLCBsb29rcyBsaWtlIE1hYXJ0ZW4gaGFzCmFscmVh
ZHkgZm9yd2FyZCBpdCBzbyB5b3UgY2FuIHB1c2ggaXQgdGhlcmUuCi1EYW5pZWwKCj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfY29ubmVjdG9yLmMgfCAyICstCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfY29ubmVjdG9yLmMgYi9kcml2ZXJzL2dwdS9k
cm0vb21hcGRybS9vbWFwX2Nvbm5lY3Rvci5jCj4gaW5kZXggNTI4NzY0NTY2YjE3Li5kZTk1ZGMx
Yjg2MWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9jb25uZWN0
b3IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfY29ubmVjdG9yLmMKPiBA
QCAtODksNyArODksNyBAQCBzdGF0aWMgZW51bSBkcm1fbW9kZV9zdGF0dXMgb21hcF9jb25uZWN0
b3JfbW9kZV92YWxpZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubgo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKQo+ICB7Cj4g
ICAgICAgICBzdHJ1Y3Qgb21hcF9jb25uZWN0b3IgKm9tYXBfY29ubmVjdG9yID0gdG9fb21hcF9j
b25uZWN0b3IoY29ubmVjdG9yKTsKPiAtICAgICAgIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIG5l
d19tb2RlID0geyB7IDAgfSB9Owo+ICsgICAgICAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgbmV3
X21vZGUgPSB7fTsKPiAgICAgICAgIGVudW0gZHJtX21vZGVfc3RhdHVzIHN0YXR1czsKPgo+ICAg
ICAgICAgc3RhdHVzID0gb21hcF9jb25uZWN0b3JfbW9kZV9maXh1cChvbWFwX2Nvbm5lY3Rvci0+
b3V0cHV0LCBtb2RlLAo+IC0tCj4gMi4yNi4yCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUg
RW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
