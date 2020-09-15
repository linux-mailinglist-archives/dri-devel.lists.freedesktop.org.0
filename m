Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CA226A3D3
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 13:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B4989FFD;
	Tue, 15 Sep 2020 11:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313EB89FFD
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 11:07:30 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id a2so2776090otr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 04:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wAqBxwSqHBPcdUvSTQKCijq+CRd5S/6aTYUwocFvz7g=;
 b=Ab3CclpcmjliQcUxf05Du8gVcg1tOOkwjfN7S7+mMKqY+QobElboTlKKG/K3TtoDAg
 jN9ksqtTvV5K0CkYWOyTD6EOOpJPBKcoEScWZBBaDrPlA0EBfsG9cf/MIcMhL1dmKZ7I
 /Vtos2xPEWUgcsEiyEAAfW1BnOmbyKfP4VBbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wAqBxwSqHBPcdUvSTQKCijq+CRd5S/6aTYUwocFvz7g=;
 b=tmwYYNmTYlSBQk2zfPJLezA9TzKu3THZiWH0UTbmSAF/sSW7pOQ4zw9mvWNwRy8YE4
 zcgTmtUPuYQy2GKl8jg2VaM7obiLSIaB+qY74dUwNTZ4689GpKvtiluwblMi4uO+4yEY
 X4z4oL+kCDsvZC3wfnNFgb+G3M+gD05fGaX0fgs046ks3ll5nmesvn1/1LuWoWDEfzKI
 u8FPzNBBg0tYig1hLSRhObdCr2he2q++ZaIwh+luoCb92v0CvhHg3HKDwP4osPviiKtx
 vSgE20cUJvDyA+3q4Q8cLGObsU+/gfVNsukMrmvlmdG+fOU2yXaqSPJOxasAzSn4zWGO
 Okag==
X-Gm-Message-State: AOAM5310BdmmDDcfGho1r+diyYABlouWkafKaXqojl0r09jRjhV2yTqX
 AX1iUBb/ZlOTwhqkcEPP33xrgEbj2DriFNwa9gvhQsYEgcm4pg==
X-Google-Smtp-Source: ABdhPJy2dt3RJ1FG4/6bhDA1qzn4xmAgfk+y6FmsSUEi6ZJD7I1IcHsBaS6ztwX2Dy4bot9PsL6PWq1L3saj3QmAlOM=
X-Received: by 2002:a05:6830:14d9:: with SMTP id
 t25mr13128038otq.188.1600168050256; 
 Tue, 15 Sep 2020 04:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200914132920.59183-1-christian.koenig@amd.com>
 <20200914132920.59183-2-christian.koenig@amd.com>
 <CAKMK7uHnZgCBUBQ-5D7gCj1v3Z4wKkeO91tefAoJE1B49JFtww@mail.gmail.com>
 <92b77d29-ae9b-b9cd-4e03-f193aa386cae@gmail.com>
In-Reply-To: <92b77d29-ae9b-b9cd-4e03-f193aa386cae@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 15 Sep 2020 13:07:18 +0200
Message-ID: <CAKMK7uHDuzzh_w=7w7m3EoHyx+3HOVawoj2QbJL+9F1+1LULbw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/shmem-helpers: revert "Redirect mmap for imported
 dma-buf"
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMTUsIDIwMjAgYXQgMTowMyBQTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBbSAxNS4wOS4yMCB1bSAxMjoz
OSBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gPiBPbiBNb24sIFNlcCAxNCwgMjAyMCBhdCAzOjI5
IFBNIENocmlzdGlhbiBLw7ZuaWcKPiA+IDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNv
bT4gd3JvdGU6Cj4gPj4gVGhpcyByZXZlcnRzIGNvbW1pdCAyNmQzYWMzY2IwNGQxNzFhODYxOTUy
ZTg5MzI0ZTM0NzU5OGEzNDdmLgo+ID4+Cj4gPj4gV2UgbmVlZCB0byBmaWd1cmUgb3V0IGlmIGRt
YV9idWZfbW1hcCgpIGlzIHZhbGlkIG9yIG5vdCBmaXJzdC4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYt
Ynk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiA+IFRoZSB0
cm91YmxlIGlzIHRoYXQgZG9pbmcgZG1hLWJ1ZiBtbWFwIGJ5IGxvb2tpbmcgYXQgdGhlIHN0cnVj
dCBwYWdlcwo+ID4gYmVoaW5kIHRoZSBzZyBsaXN0IGFuZCBqdXN0IGluc2VydGluZyB0aG9zZSBp
bnRvIHVzZXJzcGFjZSBkb2Vzbid0Cj4gPiByZWFsbHkgd29yayBhbnkgYmV0dGVyLiBZb3Ugc3Rp
bGwgd29uJ3QgZ2V0IHRoZSB1bm1hcF9tYXBwaW5nX3JhbmdlCj4gPiBhbmQgaGVuY2UgcHRlIHNo
b290LWRvd24uIFNvIG1heWJlIGRtYV9idWZfbW1hcCBmb3J3YXJkaW5nIGRvZXNuJ3QKPiA+IHdv
cmssIGJ1dCB0aGlzIGRvZXNuJ3QgbWFrZSBpdCBhbnkgYmV0dGVyLgo+Cj4gR29vZCBwb2ludC4g
UXVlc3Rpb24gaXMgd2hhdCBzaG91bGQgd2UgZG8/IFJldHVybiAtRVBFUk0/CgpJSXJjIHRoZXJl
J3MgdXNlcnNwYWNlIHdoaWNoIGV4cGVjdHMgdGhpcyB0byB3b3JrLCBidXQgSSB0aGluayBpdCdz
CmFsc28gb25seSB0cnlpbmcgdG8gZG8gdGhpcyB3aXRoIHNpbXBsZXIgZHJpdmVycyB0aGF0IGRv
bid0IG5lZWQKdW5tYXBfbWFwcGluZ19yYW5nZSB0byB3b3JrIGNvcnJlY3RseS4gT3IgaXQncyBz
aW1wbHkgdGhhdCBubyBvbmUgZXZlcgpyZXBvcnRlZCB0aGUgYnVncy4gSXQncyBhIGJpdCBhIG1l
c3MgOi0vCi1EYW5pZWwKCj4KPiA+Cj4gPiBBbHNvIGNvbW1pdCBtZXNzYWdlIHNob3VsZCBwcm9i
YWJseSBleHBsYWluIGEgYml0IHRoZSBjb250ZXh0IGhlcmUsCj4gPiBub3QgYSBsb3Qgb2YgcGVv
cGxlIGhhdmUgYmVlbiBpbiBvdXIgcHJpdmF0ZSBkaXNjdXNzaW9uIG9uIHRoaXMuCj4KPiBXZWxs
LCB0aGF0J3MgY2VydGFpbiB0cnVlLgo+Cj4gQ2hyaXN0aWFuLgo+Cj4gPiAtRGFuaWVsCj4gPgo+
ID4+IC0tLQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgfCAz
IC0tLQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwo+ID4+IGluZGV4IDBhOTUyZjI3YzE4NC4u
Y2Q3MjczNDNmNzJiIDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3No
bWVtX2hlbHBlci5jCj4gPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVs
cGVyLmMKPiA+PiBAQCAtNTk0LDkgKzU5NCw2IEBAIGludCBkcm1fZ2VtX3NobWVtX21tYXAoc3Ry
dWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ID4+
ICAgICAgICAgIC8qIFJlbW92ZSB0aGUgZmFrZSBvZmZzZXQgKi8KPiA+PiAgICAgICAgICB2bWEt
PnZtX3Bnb2ZmIC09IGRybV92bWFfbm9kZV9zdGFydCgmb2JqLT52bWFfbm9kZSk7Cj4gPj4KPiA+
PiAtICAgICAgIGlmIChvYmotPmltcG9ydF9hdHRhY2gpCj4gPj4gLSAgICAgICAgICAgICAgIHJl
dHVybiBkbWFfYnVmX21tYXAob2JqLT5kbWFfYnVmLCB2bWEsIDApOwo+ID4+IC0KPiA+PiAgICAg
ICAgICBzaG1lbSA9IHRvX2RybV9nZW1fc2htZW1fb2JqKG9iaik7Cj4gPj4KPiA+PiAgICAgICAg
ICByZXQgPSBkcm1fZ2VtX3NobWVtX2dldF9wYWdlcyhzaG1lbSk7Cj4gPj4gLS0KPiA+PiAyLjE3
LjEKPiA+Pgo+ID4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4+IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiA+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo+ID4KPiA+Cj4KCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBF
bmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
