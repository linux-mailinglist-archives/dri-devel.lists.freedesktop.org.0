Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A56EC026
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 09:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C6C6E1F9;
	Fri,  1 Nov 2019 08:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240056E1F9
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 08:58:07 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id e6so7128775wrw.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2019 01:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=S5fQT2eVO9V38Zm9JZGmC3M3bk7YmWSMdjQ7Ok2mRcE=;
 b=IyiWIzEj1ISPsgSzFsLFasYwzlC22++QTdeXTaiPPnH0IvD0RlYPQlKjQkDfHhz8Km
 AywKy0//mWZp+gSsEAkzveNj5MQvKa79Kg+ZLtoMH4U2XXrnyRpF303Oeld5mm0MQy97
 y3U1eGTsnPYf98EBVFhQRj2MSQLeZryHBAJLJLPnw8wKhpDDxyEcPFok7k7G/hEysb3g
 JXCqleR3dsGhxBOuO3hBsn0ZNDH5KuN1T5YL0IgBenrQqFHMjjpimCKLRtIuqXSJR5mD
 H3AdNnnamrUgFamBTufxuwRLBEjK1Ol/waAOIxACDepojuMu0XWYBwDfPUCWK+pHbsJk
 ZVZg==
X-Gm-Message-State: APjAAAUSzAk3cy3DzT+848i4/j1yuUfmGH/aUduNrHNGc6VEGPCnybu6
 3EolOILMizYxQ4MxyqpkXZMjdQ==
X-Google-Smtp-Source: APXvYqx/0D/E3fqHGg3SO471Ql1SFjgo2/8jy1O0UmD3LhH76T/0FxaRwKHUwv0G597dXLhvqq/DfA==
X-Received: by 2002:adf:f048:: with SMTP id t8mr5980197wro.237.1572598685466; 
 Fri, 01 Nov 2019 01:58:05 -0700 (PDT)
Received: from dell ([2.31.163.64])
 by smtp.gmail.com with ESMTPSA id s21sm9001511wrb.31.2019.11.01.01.58.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Nov 2019 01:58:04 -0700 (PDT)
Date: Fri, 1 Nov 2019 08:58:03 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v7 0/9] backlight: gpio: simplify the driver
Message-ID: <20191101085803.GD5700@dell>
References: <20191022083630.28175-1-brgl@bgdev.pl>
 <CAMRc=MeyrDZgmHJ+2SMipP7y9NggxiVfkAh4kCLePFWvUku9aQ@mail.gmail.com>
 <20191023155941.q563d3cfizre4zvt@holly.lan>
 <20191024064726.GB15843@dell>
 <20191024071703.6keoebzlfnn2qmyd@uno.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024071703.6keoebzlfnn2qmyd@uno.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=S5fQT2eVO9V38Zm9JZGmC3M3bk7YmWSMdjQ7Ok2mRcE=;
 b=svMRcQ9vBjrXT2qn/6kethfQvV0UlAW5sEgQDR41qIHly1Y8PT1R9cce8OhGLd23tx
 8OoR73wILPiH79hKzZCAP4sQknRdUDbuhN75ObUIOZBq09vMSCRi22PnDvfGt/T0EhnD
 U5/eHFT8izrZnKoCnfjiweDd96fr0mvLCl5r8+vViQtyq+6hcMM8SPjXuYD3mZMmj6T9
 wacRNcNQzaoyxuCBaFRrC4aQEkNk5mG1x3+V5UrYyc5eZoMYWBGjYGTLOu01I/64e0c3
 INlnHrvci6GbXLmUf64Lhq54JPwhwZOI90GH32o9yIvWsKOhBmPKzkWv1ln45tHgT0p1
 VWrQ==
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyNCBPY3QgMjAxOSwgSmFjb3BvIE1vbmRpIHdyb3RlOgoKPiBIZWxsbywKPiAKPiBP
biBUaHUsIE9jdCAyNCwgMjAxOSBhdCAwNzo0NzoyNkFNICswMTAwLCBMZWUgSm9uZXMgd3JvdGU6
Cj4gPiBPbiBXZWQsIDIzIE9jdCAyMDE5LCBEYW5pZWwgVGhvbXBzb24gd3JvdGU6Cj4gPgo+ID4g
PiBPbiBUdWUsIE9jdCAyMiwgMjAxOSBhdCAxMToyOTo1NEFNICswMjAwLCBCYXJ0b3N6IEdvbGFz
emV3c2tpIHdyb3RlOgo+ID4gPiA+IHd0LiwgMjIgcGHFuiAyMDE5IG8gMTA6MzYgQmFydG9zeiBH
b2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD4gbmFwaXNhxYIoYSk6Cj4gPiA+ID4gPgo+ID4gPiA+
ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4K
PiA+ID4gPiA+Cj4gPiA+ID4gPiBXaGlsZSB3b3JraW5nIG9uIG15IG90aGVyIHNlcmllcyByZWxh
dGVkIHRvIGdwaW8tYmFja2xpZ2h0WzFdIEkgbm90aWNlZAo+ID4gPiA+ID4gdGhhdCB3ZSBjb3Vs
ZCBzaW1wbGlmeSB0aGUgZHJpdmVyIGlmIHdlIG1hZGUgdGhlIG9ubHkgdXNlciBvZiBwbGF0Zm9y
bQo+ID4gPiA+ID4gZGF0YSB1c2UgR1BJTyBsb29rdXBzIGFuZCBkZXZpY2UgcHJvcGVydGllcy4g
VGhpcyBzZXJpZXMgdHJpZXMgdG8gZG8KPiA+ID4gPiA+IHRoYXQuCj4gPiA+ID4gPgo+ID4gPiA+
ID4gRmlyc3QgdHdvIHBhdGNoZXMgY29udGFpbiBtaW5vciBmaXhlcy4gVGhpcmQgcGF0Y2ggbWFr
ZXMgdGhlIGRyaXZlcgo+ID4gPiA+ID4gZXhwbGljaXRseSBkcml2ZSB0aGUgR1BJTyBsaW5lLiBG
b3VydGggcGF0Y2ggYWRkcyBhbGwgbmVjZXNzYXJ5IGRhdGEKPiA+ID4gPiA+IHN0cnVjdHVyZXMg
dG8gZWNvdmVjMjQuIFBhdGNoIDUvOSB1bmlmaWVzIG11Y2ggb2YgdGhlIGNvZGUgZm9yIGJvdGgK
PiA+ID4gPiA+IHBkYXRhIGFuZCBub24tcGRhdGEgY2FzZXMuIFBhdGNoZXMgNi03LzkgcmVtb3Zl
IHVudXNlZCBwbGF0Zm9ybSBkYXRhCj4gPiA+ID4gPiBmaWVsZHMuIExhc3QgdHdvIHBhdGNoZXMg
Y29udGFpbiBhZGRpdGlvbmFsIGltcHJvdmVtZW50cyBmb3IgdGhlIEdQSU8KPiA+ID4gPiA+IGJh
Y2tsaWdodCBkcml2ZXIgd2hpbGUgd2UncmUgYWxyZWFkeSBtb2RpZnlpbmcgaXQuCj4gPiA+ID4g
Pgo+ID4gPiA+ID4gSSBkb24ndCBoYXZlIGFjY2VzcyB0byB0aGlzIEhXIGJ1dCBob3BlZnVsbHkg
dGhpcyB3b3Jrcy4gT25seSBjb21waWxlCj4gPiA+ID4gPiB0ZXN0ZWQuCj4gPiA+ID4gPgo+ID4g
PiA+ID4gWzFdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzYvMjUvOTAwCj4gPiA+ID4gPgo+
ID4gPiA+ID4gdjEgLT4gdjI6Cj4gPiA+ID4gPiAtIHJlYmFzZWQgb24gdG9wIG9mIHY1LjMtcmMx
IGFuZCBhZGp1c3RlZCB0byB0aGUgcmVjZW50IGNoYW5nZXMgZnJvbSBBbmR5Cj4gPiA+ID4gPiAt
IGFkZGVkIGFkZGl0aW9uYWwgdHdvIHBhdGNoZXMgd2l0aCBtaW5vciBpbXByb3ZlbWVudHMKPiA+
ID4gPiA+Cj4gPiA+ID4gPiB2MiAtPiB2MzoKPiA+ID4gPiA+IC0gaW4gcGF0Y2ggNy83OiB1c2Vk
IGluaXRpYWxpemVycyB0byBzZXQgdmFsdWVzIGZvciBwZGF0YSBhbmQgZGV2IGxvY2FsIHZhcnMK
PiA+ID4gPiA+Cj4gPiA+ID4gPiB2MyAtPiB2NDoKPiA+ID4gPiA+IC0gcmViYXNlZCBvbiB0b3Ag
b2YgdjUuNC1yYzEKPiA+ID4gPiA+IC0gcmVtb3ZlZCBjaGFuZ2VzIHRoYXQgYXJlIG5vIGxvbmdl
ciByZWxldmFudCBhZnRlciBjb21taXQgZWM2NjViNzU2ZTZmCj4gPiA+ID4gPiAgICgiYmFja2xp
Z2h0OiBncGlvLWJhY2tsaWdodDogQ29ycmVjdCBpbml0aWFsIHBvd2VyIHN0YXRlIGhhbmRsaW5n
IikKPiA+ID4gPiA+IC0gYWRkZWQgcGF0Y2ggNy83Cj4gPiA+ID4gPgo+ID4gPiA+ID4gdjQgLT4g
djU6Cj4gPiA+ID4gPiAtIGluIHBhdGNoIDcvNzogYWRkZWQgYSBjb21tZW50IHJlcGxhY2luZyB0
aGUgbmFtZSBvZiB0aGUgZnVuY3Rpb24gYmVpbmcKPiA+ID4gPiA+ICAgcHVsbGVkIGludG8gcHJv
YmUoKQo+ID4gPiA+ID4KPiA+ID4gPiA+IHY1IC0+IHY2Ogo+ID4gPiA+ID4gLSBhZGRlZCBhIHBh
dGNoIG1ha2luZyB0aGUgZHJpdmVyIGV4cGxpY2l0bHkgc2V0IHRoZSBkaXJlY3Rpb24gb2YgdGhl
IEdQSU8KPiA+ID4gPiA+ICAgdG8gb3V0cHV0Cj4gPiA+ID4gPiAtIGFkZGVkIGEgcGF0Y2ggcmVt
b3ZpbmcgYSByZWR1bmRhbnQgbmV3bGluZQo+ID4gPiA+ID4KPiA+ID4gPiA+IHY2IC0+IHY3Ogo+
ID4gPiA+ID4gLSByZW5hbWVkIHRoZSBmdW5jdGlvbiBjYWxjdWxhdGluZyB0aGUgbmV3IEdQSU8g
dmFsdWUgZm9yIHN0YXR1cyB1cGRhdGUKPiA+ID4gPiA+IC0gY29sbGVjdGVkIG1vcmUgdGFncwo+
ID4gPiA+ID4KPiA+ID4gPiA+IEJhcnRvc3ogR29sYXN6ZXdza2kgKDkpOgo+ID4gPiA+ID4gICBi
YWNrbGlnaHQ6IGdwaW86IHJlbW92ZSB1bm5lZWRlZCBpbmNsdWRlCj4gPiA+ID4gPiAgIGJhY2ts
aWdodDogZ3BpbzogcmVtb3ZlIHN0cmF5IG5ld2xpbmUKPiA+ID4gPiA+ICAgYmFja2xpZ2h0OiBn
cGlvOiBleHBsaWNpdGx5IHNldCB0aGUgZGlyZWN0aW9uIG9mIHRoZSBHUElPCj4gPiA+ID4gPiAg
IHNoOiBlY292ZWMyNDogYWRkIGFkZGl0aW9uYWwgcHJvcGVydGllcyB0byB0aGUgYmFja2xpZ2h0
IGRldmljZQo+ID4gPiA+ID4gICBiYWNrbGlnaHQ6IGdwaW86IHNpbXBsaWZ5IHRoZSBwbGF0Zm9y
bSBkYXRhIGhhbmRsaW5nCj4gPiA+ID4gPiAgIHNoOiBlY292ZWMyNDogZG9uJ3Qgc2V0IHVudXNl
ZCBmaWVsZHMgaW4gcGxhdGZvcm0gZGF0YQo+ID4gPiA+ID4gICBiYWNrbGlnaHQ6IGdwaW86IHJl
bW92ZSB1bnVzZWQgZmllbGRzIGZyb20gcGxhdGZvcm0gZGF0YQo+ID4gPiA+ID4gICBiYWNrbGln
aHQ6IGdwaW86IHVzZSBhIGhlbHBlciB2YXJpYWJsZSBmb3IgJnBkZXYtPmRldgo+ID4gPiA+ID4g
ICBiYWNrbGlnaHQ6IGdwaW86IHB1bGwgZ3Bpb19iYWNrbGlnaHRfaW5pdGlhbF9wb3dlcl9zdGF0
ZSgpIGludG8gcHJvYmUKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgYXJjaC9zaC9ib2FyZHMvbWFjaC1l
Y292ZWMyNC9zZXR1cC5jICAgICAgICAgfCAgMzMgKysrLS0KPiA+ID4gPiA+ICBkcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jICAgICB8IDEyOCArKysrKysrLS0tLS0tLS0t
LS0tCj4gPiA+ID4gPiAgaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL2dwaW9fYmFja2xpZ2h0
LmggfCAgIDMgLQo+ID4gPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNjkgaW5zZXJ0aW9ucygrKSwg
OTUgZGVsZXRpb25zKC0pCj4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IExlZSwg
RGFuaWVsLCBKaW5nb28sCj4gPiA+ID4KPiA+ID4gPiBKYWNvcG8gaXMgdHJhdmVsbGluZyB1bnRp
bCBOb3ZlbWJlciAxc3QgYW5kIHdvbid0IGJlIGFibGUgdG8gdGVzdCB0aGlzCj4gPiA+ID4gYWdh
aW4gYmVmb3JlIHRoaXMgZGF0ZS4gRG8geW91IHRoaW5rIHlvdSBjYW4gcGljayBpdCB1cCBhbmQg
aW4gY2FzZQo+ID4gPiA+IGFueXRoaW5nJ3MgYnJva2VuIG9uIFNILCB3ZSBjYW4gZml4IGl0IGFm
dGVyIHY1LjUtcmMxLCBzbyB0aGF0IGl0Cj4gPiA+ID4gZG9lc24ndCBtaXNzIGFub3RoZXIgbWVy
Z2Ugd2luZG93Pwo+ID4KPiA+IE5vdmVtYmVyIDFzdCAoLXJjNikgd2lsbCBiZSBmaW5lLgo+ID4K
PiA+IEknZCByYXRoZXIgYXBwbHkgaXQgbGF0ZS10ZXN0ZWQgdGhhbiBlYXJseS1ub24tdGVzdGVk
Lgo+ID4KPiA+IEhvcGVmdWxseSBKYWNvcG8gY2FuIHByaW9yaXRpc2UgdGVzdGluZyB0aGlzIG9u
IFRodXJzZGF5IG9yIEZyaWRheSwKPiA+IHNpbmNlIE1vbmRheSB3aWxsIGJlIC1yYzcgd2hpY2gg
aXMgcmVhbGx5IGN1dHRpbmcgaXQgZmluZS4KPiAKPiBJJ2xsIGRvIG15IGJlc3QsIEknbGwgZ2V0
IGhvbWUgRnJpZGF5IGxhdGUgYWZ0ZXJub29uIDopCgpXZWxjb21lIGhvbWUhCgpKdXN0IGEgbGl0
dGxlIHJlbWluZGVyIGluIHlvdXIgaW5ib3guIFRJQS4gOikKCi0tIApMZWUgSm9uZXMgW+adjueQ
vOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4g
c291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3
aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
