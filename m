Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2B1C4B7B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 12:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7562C89F8E;
	Wed,  2 Oct 2019 10:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B4289F8E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 10:33:22 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 3so6415495wmi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 03:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wUZHS/G+/EfCLIw5f+SykywrhoRFuqH9n5f7oduoqzw=;
 b=QQemY742ICearWup+xzxObkKyvVKR0q1Rwxb+GeP7BlYJOFTgsCbaOxC/oMxUwOezc
 UvtHXI6CzrtZp9dtvAz1hPd0ZXbt0MZKSUjHsW5xoXjYaqMyzACeZ0DrSA6zDipdDZ3Q
 MqmMWsBSr67nR86buM6lrpXh6goHWgn3C3p/zBJZZMex1R3XM+Lng+3UBPedqr5m6foQ
 wMFaTAFN3F/AKgDOoJIQmhz3nukHC5yc+RKphEBoyj+Eu8sKz6rZy8xYPprUGLlAhpkE
 GsVyUeeypXhYkhWPjnsGq4cb5yTN+eBYf/AxNdayfLvHeY697J2tpJcLF4E8rwHZA54m
 gRqQ==
X-Gm-Message-State: APjAAAWQPTk+yksm8HZQftyCc8V2BkRf1XtNzqaBQezwCTZL+Ya8uhYY
 FSL/M0PkP6pDZGQk4mhyhkOQAQ==
X-Google-Smtp-Source: APXvYqxcIUrjme+4/WrQIVIVSQ0R4d5tae6DJjxe9DjuXTy5Z9r8cXcOD8GRy4ZpWXRQoBkLG0CdNQ==
X-Received: by 2002:a1c:2bc7:: with SMTP id r190mr2439604wmr.143.1570012400648; 
 Wed, 02 Oct 2019 03:33:20 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id l10sm26838984wrh.20.2019.10.02.03.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 03:33:20 -0700 (PDT)
Date: Wed, 2 Oct 2019 11:33:18 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v4 7/7] backlight: gpio: pull
 gpio_backlight_initial_power_state() into probe
Message-ID: <20191002103318.6owxberhml6mbtxm@holly.lan>
References: <20191001125837.4472-1-brgl@bgdev.pl>
 <20191001125837.4472-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191001125837.4472-8-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wUZHS/G+/EfCLIw5f+SykywrhoRFuqH9n5f7oduoqzw=;
 b=aPJlKuY+eRR4q5p4jV4qCpE0b1aKVkj4+PZrZUlv5v56zXOetpNPtg02as20aFegDv
 7TeZz7ikn+LWA9jblA9+VZiAVm1XySTwn2milAAYnC2Rzv7xJY//GDYipTlAoQ3KMQ4R
 CwpYuupqRmGdKbHBvIqoOJDP6OlRiysRgy9YYBruBRJvud2PD7QBdtZ7f2ujAweX5ku2
 ssysEGjpCUtCqvPzBNgRpqRR3fDgveWyhWxUpQ3dreoWvdrLvl7FOJeJIR3Wx/Q+SQnc
 IB1CtCW//A0NqLofsKyy8Il33UA302qkDIijV1Rcz7nCZXrsqmtcBOv+PpAGlO4pRa2N
 zHuQ==
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
Cc: Jacopo Mondi <jacopo@jmondi.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMDI6NTg6MzdQTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5
bGlicmUuY29tPgo+IAo+IFRoZSBwcm9iZSBmdW5jdGlvbiBpbiB0aGUgZ3Bpby1iYWNrbGlnaHQg
ZHJpdmVyIGlzIHF1aXRlIHNob3J0LiBJZiB3ZQo+IHB1bGwgZ3Bpb19iYWNrbGlnaHRfaW5pdGlh
bF9wb3dlcl9zdGF0ZSgpIGludG8gcHJvYmUgd2UgY2FuIGRyb3AgdHdvCj4gbW9yZSBmaWVsZHMg
ZnJvbSBzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgYW5kIHNocmluayB0aGUgZHJpdmVyIGNvZGUuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxp
YnJlLmNvbT4KPiAtLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQu
YyB8IDM2ICsrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5z
ZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlk
ZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9n
cGlvX2JhY2tsaWdodC5jCj4gaW5kZXggNjI0NzY4N2I2MzMwLi4zN2VjMTg0ZjBjNWMgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwo+ICsrKyBi
L2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKPiBAQCAtMTcsMTEgKzE3
LDggQEAKPiAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiAgCj4gIHN0cnVjdCBncGlvX2JhY2ts
aWdodCB7Cj4gLQlzdHJ1Y3QgZGV2aWNlICpkZXY7Cj4gIAlzdHJ1Y3QgZGV2aWNlICpmYmRldjsK
PiAtCj4gIAlzdHJ1Y3QgZ3Bpb19kZXNjICpncGlvZDsKPiAtCWludCBkZWZfdmFsdWU7Cj4gIH07
Cj4gIAo+ICBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3VwZGF0ZV9zdGF0dXMoc3RydWN0IGJh
Y2tsaWdodF9kZXZpY2UgKmJsKQo+IEBAIC01Myw0MSArNTAsMjQgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBiYWNrbGlnaHRfb3BzIGdwaW9fYmFja2xpZ2h0X29wcyA9IHsKPiAgCS5jaGVja19mYgk9
IGdwaW9fYmFja2xpZ2h0X2NoZWNrX2ZiLAo+ICB9Owo+ICAKPiAtc3RhdGljIGludCBncGlvX2Jh
Y2tsaWdodF9pbml0aWFsX3Bvd2VyX3N0YXRlKHN0cnVjdCBncGlvX2JhY2tsaWdodCAqZ2JsKQoK
SSdtIGluY2xpbmVkIHRvIHZpZXcgZGVsZXRpbmcgdGhpcyBmdW5jdGlvbiBhcyByZW1vdmluZyBh
IGNvbW1lbnQgKGUuZy4KdGhlIGZ1bmN0aW9uIG5hbWUgaGVscHMgdXMgdG8gcmVhZCB0aGUgY29k
ZSkhCgpSZW1vdmluZyB0aGUgdmFyaWFibGVzIGZyb20gdGhlIGNvbnRleHQgc3RydWN0dXJlIGlz
IGdvb2QgYnV0IHdoeSBub3QKanVzdCBwYXNzIHRoZW0gdG8gdGhlIGZ1bmN0aW9uIGFuZCBsZXQg
dGhlIGNvbXBpbGVyIGRlY2lkZWQgd2hldGhlciBvcgpub3QgdG8gaW5saW5lLgoKCkRhbmllbC4K
Cgo+IC17Cj4gLQlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBnYmwtPmRldi0+b2Zfbm9kZTsK
PiAtCj4gLQkvKiBOb3QgYm9vdGVkIHdpdGggZGV2aWNlIHRyZWUgb3Igbm8gcGhhbmRsZSBsaW5r
IHRvIHRoZSBub2RlICovCj4gLQlpZiAoIW5vZGUgfHwgIW5vZGUtPnBoYW5kbGUpCj4gLQkJcmV0
dXJuIGdibC0+ZGVmX3ZhbHVlID8gRkJfQkxBTktfVU5CTEFOSyA6IEZCX0JMQU5LX1BPV0VSRE9X
TjsKPiAtCj4gLQkvKiBpZiB0aGUgZW5hYmxlIEdQSU8gaXMgZGlzYWJsZWQsIGRvIG5vdCBlbmFi
bGUgdGhlIGJhY2tsaWdodCAqLwo+IC0JaWYgKGdwaW9kX2dldF92YWx1ZV9jYW5zbGVlcChnYmwt
PmdwaW9kKSA9PSAwKQo+IC0JCXJldHVybiBGQl9CTEFOS19QT1dFUkRPV047Cj4gLQo+IC0JcmV0
dXJuIEZCX0JMQU5LX1VOQkxBTks7Cj4gLX0KPiAtCj4gLQo+ICBzdGF0aWMgaW50IGdwaW9fYmFj
a2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHsKPiAgCXN0cnVj
dCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4gIAlzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHRfcGxh
dGZvcm1fZGF0YSAqcGRhdGEgPSBkZXZfZ2V0X3BsYXRkYXRhKGRldik7Cj4gKwlzdHJ1Y3QgZGV2
aWNlX25vZGUgKm9mX25vZGUgPSBkZXYtPm9mX25vZGU7Cj4gIAlzdHJ1Y3QgYmFja2xpZ2h0X3By
b3BlcnRpZXMgcHJvcHM7Cj4gIAlzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmw7Cj4gIAlzdHJ1
Y3QgZ3Bpb19iYWNrbGlnaHQgKmdibDsKPiAtCWludCByZXQ7Cj4gKwlpbnQgcmV0LCBkZWZfdmFs
dWU7Cj4gIAo+ICAJZ2JsID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpnYmwpLCBHRlBfS0VS
TkVMKTsKPiAgCWlmIChnYmwgPT0gTlVMTCkKPiAgCQlyZXR1cm4gLUVOT01FTTsKPiAgCj4gLQln
YmwtPmRldiA9IGRldjsKPiAtCj4gIAlpZiAocGRhdGEpCj4gIAkJZ2JsLT5mYmRldiA9IHBkYXRh
LT5mYmRldjsKPiAgCj4gLQlnYmwtPmRlZl92YWx1ZSA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jv
b2woZGV2LCAiZGVmYXVsdC1vbiIpOwo+ICsJZGVmX3ZhbHVlID0gZGV2aWNlX3Byb3BlcnR5X3Jl
YWRfYm9vbChkZXYsICJkZWZhdWx0LW9uIik7Cj4gIAo+ICAJZ2JsLT5ncGlvZCA9IGRldm1fZ3Bp
b2RfZ2V0KGRldiwgTlVMTCwgR1BJT0RfQVNJUyk7Cj4gIAlpZiAoSVNfRVJSKGdibC0+Z3Bpb2Qp
KSB7Cj4gQEAgLTEwOSw3ICs4OSwxNSBAQCBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAkJcmV0dXJuIFBUUl9FUlIoYmwpOwo+
ICAJfQo+ICAKPiAtCWJsLT5wcm9wcy5wb3dlciA9IGdwaW9fYmFja2xpZ2h0X2luaXRpYWxfcG93
ZXJfc3RhdGUoZ2JsKTsKPiArCS8qIE5vdCBib290ZWQgd2l0aCBkZXZpY2UgdHJlZSBvciBubyBw
aGFuZGxlIGxpbmsgdG8gdGhlIG5vZGUgKi8KPiArCWlmICghb2Zfbm9kZSB8fCAhb2Zfbm9kZS0+
cGhhbmRsZSkKPiArCQlibC0+cHJvcHMucG93ZXIgPSBkZWZfdmFsdWUgPyBGQl9CTEFOS19VTkJM
QU5LCj4gKwkJCQkJICAgIDogRkJfQkxBTktfUE9XRVJET1dOOwo+ICsJZWxzZSBpZiAoZ3Bpb2Rf
Z2V0X3ZhbHVlX2NhbnNsZWVwKGdibC0+Z3Bpb2QpID09IDApCj4gKwkJYmwtPnByb3BzLnBvd2Vy
ID0gRkJfQkxBTktfUE9XRVJET1dOOwo+ICsJZWxzZQo+ICsJCWJsLT5wcm9wcy5wb3dlciA9IEZC
X0JMQU5LX1VOQkxBTks7Cj4gKwo+ICAJYmwtPnByb3BzLmJyaWdodG5lc3MgPSAxOwo+ICAKPiAg
CWJhY2tsaWdodF91cGRhdGVfc3RhdHVzKGJsKTsKPiAtLSAKPiAyLjIzLjAKPiAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
