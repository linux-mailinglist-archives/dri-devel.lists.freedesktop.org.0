Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B314A1673B
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 17:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC96F89D79;
	Tue,  7 May 2019 15:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD9489D79
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 15:55:59 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r7so23041156wrr.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2019 08:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f5ztm+xWsMT9xEdnOlpT0tYLhG7Uzj+jROP7WM4sIA4=;
 b=m0S7C6V1E8RtPOyWuXRnKA8qDZAMDCArMkse94SPpxP941PUxiJcsBl2dFsUTsd3H0
 IerD9DyJvHge9Un4/fqhGAwkngFap2I0dt/tvTL1xWLro+hcYuetpYxVhQZHZHs3CLQH
 220fJ3gWyza1Zlf+cLsvX89Q+p2Wc/UQEaxT1OuFRfOs+vMP+aOvO4D8+gp6l6W1lPY/
 2vunZD2EMY14B5AA/SuYLMev3XPnfhN+3emP8V+PUdD6RRx0rAuuI94U1CE70wn2x6Mp
 HCeFUVXN1hdlET4yOxmSatIePIxViZg3+k8wsQKPZ4MJ6ll6CMSZjm2LEt9Dx+FZL5Fb
 sDBw==
X-Gm-Message-State: APjAAAXLQGz56Y28nVmJJNFg126MFpz0aHQdq22+Ld6Texqu2C4mu1gd
 Ahs+efilCdqN3fjFF7GedMQf9XosG0mU+9pzwzk=
X-Google-Smtp-Source: APXvYqzYZ/Mig+SWa91doZ9Ji+k2qd36KgJkeDRAazvPll1/PwgxNEuR7DpyAm++Zij/laZTCJWLa5f3dFLseJQA5l0=
X-Received: by 2002:adf:e5cb:: with SMTP id a11mr5055638wrn.128.1557244558021; 
 Tue, 07 May 2019 08:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190418060157.18968-1-mario.kleiner.de@gmail.com>
 <cc16f733-3d4c-7d91-c63a-3958f8e342c4@amd.com>
 <CAEsyxygPictN2=ms=16tZsx0vq8kr5Mg43iAE9iGJw5u-3B9vg@mail.gmail.com>
In-Reply-To: <CAEsyxygPictN2=ms=16tZsx0vq8kr5Mg43iAE9iGJw5u-3B9vg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 7 May 2019 11:55:45 -0400
Message-ID: <CADnq5_OXcprANO0bsScbpDZbEoyc2AoHvGNrBtUsbwdBaMRfiA@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix timestamp docs for variable refresh properties.
To: Mario Kleiner <mario.kleiner.de@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=f5ztm+xWsMT9xEdnOlpT0tYLhG7Uzj+jROP7WM4sIA4=;
 b=XKB1DmVkNKPLOYdUgKM9G3SH+yK6E64vHkQ1Lzqdzo1wmLLh2wjV77lAi8wEH/nS7D
 IlfNQwIu4w7wJhUpKJK/JnKAXiEjjgio0kYx4Wv4zdRoBjiCMWkJYA98hg3flPrU2KpS
 qM4IFR5TZ033TpqTZDzaofomPmzuicTu/MEKGVC9GKd7j6HneD5j8yL0vRnY91OFX1mm
 m1NoTuL6Ta1VYxxMDH1CuiUv2XTSx8FcQVyDlh2hRc/FbbRnbIVOI4TIrhhiwpCvN1If
 WCuoiR4omBptHitbB35EdOYOlwPhgZYDuJ/SchwhOi6fnzznIFxswJzALkuAljt53Rhy
 D85w==
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
Cc: Dave Airlie <airlied@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgNywgMjAxOSBhdCAxOjE1IEFNIE1hcmlvIEtsZWluZXIgPG1hcmlvLmtsZWlu
ZXIuZGVAZ21haWwuY29tPiB3cm90ZToKPgo+IE5hZyBuYWc6IFRoZSBiZWxvdyBkb2N1bWVudGF0
aW9uIHBhdGNoLCBhY2tlZC1ieSBEYW5pZWwgYW5kIHItYidkIGJ5Cj4gTmljaG9sYXMgc2VlbXMg
dG8gbm90IGhhdmUgbWFkZSBpdCBpbnRvIGRybS1uZXh0IHlldD8KClB1c2hlZCB0byBkcm0tbWlz
Yy1uZXh0LWZpeGVzCgpUaGFua3MhCgpBbGV4Cgo+Cj4gdGhhbmtzLAo+IC1tYXJpbwo+Cj4gT24g
VGh1LCBBcHIgMTgsIDIwMTkgYXQgMjo0NSBQTSBLYXpsYXVza2FzLCBOaWNob2xhcwo+IDxOaWNo
b2xhcy5LYXpsYXVza2FzQGFtZC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIDQvMTgvMTkgMjowMSBB
TSwgTWFyaW8gS2xlaW5lciB3cm90ZToKPiA+ID4gQXMgZGlzY3Vzc2VkIHdpdGggTmljaG9sYXMg
YW5kIERhbmllbCBWZXR0ZXIgKHBhdGNod29yawo+ID4gPiBsaW5rIHRvIGRpc2N1c3Npb24gYmVs
b3cpLCB0aGUgVlJSIHRpbWVzdGFtcGluZyBiZWhhdmlvdXIKPiA+ID4gcHJvZHVjZWQgdXR0ZXJs
eSB1c2VsZXNzIGFuZCBib2d1cyB2YmxhbmsvcGFnZWZsaXAKPiA+ID4gdGltZXN0YW1wcy4gV2Ug
aGF2ZSBmb3VuZCBhIHdheSB0byBmaXggdGhpcyBhbmQgcHJvdmlkZQo+ID4gPiBzYW5lIGJlaGF2
aW91ci4KPiA+ID4KPiA+ID4gQXMgb2YgTGludXggNS4yLCB0aGUgYW1kZ3B1IGRyaXZlciB3aWxs
IGJlIGFibGUgdG8KPiA+ID4gcHJvdmlkZSBleGFjdGx5IHRoZSBzYW1lIHZibGFuayAvIHBhZ2Vm
bGlwIHRpbWVzdGFtcAo+ID4gPiBzZW1hbnRpYyBpbiB2YXJpYWJsZSByZWZyZXNoIHJhdGUgbW9k
ZSBhcyBpbiBzdGFuZGFyZAo+ID4gPiBmaXhlZCByZWZyZXNoIHJhdGUgbW9kZS4gVGhpcyBpcyBh
Y2hpZXZlZCBieSBkZWZlcnJpbmcKPiA+ID4gY29yZSB2YmxhbmsgaGFuZGxpbmcgKGRybV9jcnRj
X2hhbmRsZV92YmxhbmsoKSkgdW50aWwKPiA+ID4gdGhlIGVuZCBvZiBmcm9udCBwb3JjaCwgYW5k
IGFsc28gZGVmZXIgdGhlIHNlbmRpbmcgb2YKPiA+ID4gcGFnZWZsaXAgY29tcGxldGlvbiBldmVu
dHMgdW50aWwgZW5kIG9mIGZyb250IHBvcmNoLAo+ID4gPiB3aGVuIHdlIGNhbiBzYWZlbHkgY29t
cHV0ZSBjb3JyZWN0IHBhZ2VmbGlwL3ZibGFuawo+ID4gPiB0aW1lc3RhbXBzLgo+ID4gPgo+ID4g
PiBUaGUgc2FtZSBhcHByb2FjaCB3aWxsIGJlIHBvc3NpYmxlIGZvciBvdGhlciBWUlIKPiA+ID4g
Y2FwYWJsZSBrbXMgZHJpdmVycywgc28gd2UgY2FuIGFjdHVhbGx5IGhhdmUgc2FuZQo+ID4gPiBh
bmQgdXNlZnVsIHRpbWVzdGFtcHMgaW4gVlJSIG1vZGUuCj4gPiA+Cj4gPiA+IFRoaXMgcGF0Y2gg
cmVtb3ZlcyB0aGUgc2VjdGlvbiBvZiB0aGUgZG9jcyB0aGF0Cj4gPiA+IGRlc2NyaWJlcyB0aGUg
YnJva2VuIHRpbWVzdGFtcCBiZWhhdmlvdXIgcHJlc2VudAo+ID4gPiBpbiBMaW51eCA1LjAvNS4x
Lgo+ID4gPgo+ID4gPiBGaXhlczogYWI3YTY2NGY3YTJkICgiZHJtOiBEb2N1bWVudCB2YXJpYWJs
ZSByZWZyZXNoIHByb3BlcnRpZXMiKQo+ID4gPiBMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVl
ZGVza3RvcC5vcmcvcGF0Y2gvMjg1MzMzLwo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJpbyBLbGVp
bmVyIDxtYXJpby5rbGVpbmVyLmRlQGdtYWlsLmNvbT4KPiA+Cj4gPiBSZXZpZXdlZC1ieTogTmlj
aG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgo+ID4KPiA+IFNv
bWVvbmUgZWxzZSBjYW4gZmVlbCBmcmVlIHRvIHB1c2ggdGhpcyBhcyBJIGRvbid0IGhhdmUgY29t
bWl0IHJpZ2h0cwo+ID4gZm9yIERSTS4KPiA+Cj4gPiBUaGFua3MhCj4gPgo+ID4gTmljaG9sYXMg
S2F6bGF1c2thcwo+ID4KPiA+ID4gLS0tCj4gPiA+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9jb25u
ZWN0b3IuYyB8IDYgLS0tLS0tCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0p
Cj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwo+ID4gPiBpbmRleCAyMzU1MTI0ODQ5
ZGIuLmIzNGMzZDM4YmYxNSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9j
b25uZWN0b3IuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCj4g
PiA+IEBAIC0xNDE2LDEyICsxNDE2LDYgQEAgRVhQT1JUX1NZTUJPTChkcm1fbW9kZV9jcmVhdGVf
c2NhbGluZ19tb2RlX3Byb3BlcnR5KTsKPiA+ID4gICAgKgo+ID4gPiAgICAqICBUaGUgZHJpdmVy
IG1heSBwbGFjZSBmdXJ0aGVyIHJlc3RyaWN0aW9ucyB3aXRoaW4gdGhlc2UgbWluaW11bQo+ID4g
PiAgICAqICBhbmQgbWF4aW11bSBib3VuZHMuCj4gPiA+IC0gKgo+ID4gPiAtICogICBUaGUgc2Vt
YW50aWNzIGZvciB0aGUgdmVydGljYWwgYmxhbmsgdGltZXN0YW1wIGRpZmZlciB3aGVuCj4gPiA+
IC0gKiAgIHZhcmlhYmxlIHJlZnJlc2ggcmF0ZSBpcyBhY3RpdmUuIFRoZSB2ZXJ0aWNhbCBibGFu
ayB0aW1lc3RhbXAKPiA+ID4gLSAqICAgaXMgZGVmaW5lZCB0byBiZSBhbiBlc3RpbWF0ZSB1c2lu
ZyB0aGUgY3VycmVudCBtb2RlJ3MgZml4ZWQKPiA+ID4gLSAqICAgcmVmcmVzaCByYXRlIHRpbWlu
Z3MuIFRoZSBzZW1hbnRpY3MgZm9yIHRoZSBwYWdlLWZsaXAgZXZlbnQKPiA+ID4gLSAqICAgdGlt
ZXN0YW1wIHJlbWFpbiB0aGUgc2FtZS4KPiA+ID4gICAgKi8KPiA+ID4KPiA+ID4gICAvKioKPiA+
ID4KPiA+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
