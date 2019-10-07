Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EB2CE265
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 14:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189A789DCF;
	Mon,  7 Oct 2019 12:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB50089DCF
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 12:56:07 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id q9so15175167wrm.8
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 05:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lNH90AFjH7treDMnlBjyecd4jzPpSJ8AKVgoDKflMFE=;
 b=H35PhRZpHA0Ho/4KIX+3FnkEbRY5W4bjwEsOepaH1R+OPVFDWX4D6lXLr+81amj62H
 51dogqTDABHnySimaA3HXhERJo9JQT9YGUGe7yQfcTiVr4GR7V1aqpnH1Yz5g6ub9EJH
 FS4o2r6ZLW2xyqpy7tohFkXuIbgZA7C11RJeuq8EeND6Y5IHkHjoxjf/RMORnlp++L3D
 RCYNZgpyPA5g8zI4eF1BCLBv46QX2ce25cRPwKGUblbOkbBLi0Tfk4u/yTQibZgiwNlJ
 rRcgXTsraBGHbswkZA89W2BGPzSxbtybpghq4ktwXXiMEpIudvnHZDMVli32wv17J6SJ
 s+pg==
X-Gm-Message-State: APjAAAUp7cvJThq8hbkVg5/HlnzZlVqbVQpVJh85AkgUraKfta7/YyHr
 Z6ybm6sFNmrvZiFHJHuQ7+V2uw==
X-Google-Smtp-Source: APXvYqw4wrBCEizxjGd3Oo7lWF2KXUVRw9xkZJnF90lw1VD0wL+cQobj6SS5sgKiiRn76myZtcAY3Q==
X-Received: by 2002:adf:ef8f:: with SMTP id d15mr22105358wro.67.1570452966040; 
 Mon, 07 Oct 2019 05:56:06 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id c9sm14922385wrt.7.2019.10.07.05.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 05:56:05 -0700 (PDT)
Date: Mon, 7 Oct 2019 13:56:03 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v5 7/7] backlight: gpio: pull
 gpio_backlight_initial_power_state() into probe
Message-ID: <20191007125603.qmb6jfu2tjxnzmm6@holly.lan>
References: <20191007033200.13443-1-brgl@bgdev.pl>
 <20191007033200.13443-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191007033200.13443-8-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lNH90AFjH7treDMnlBjyecd4jzPpSJ8AKVgoDKflMFE=;
 b=LXCip3xNAoYNYlV6dtRSB1uaKZJUo/K2WvzEmJRHr+u/U9uUi6O/di4oCQpBqx6of6
 J8XOGzJu5nCzvTxGoqsiLjRPzX9KO9l4JCcWeI93DIREUfvtMDYRTnbHLsgnFVRxVI91
 eNra9cn8FwGFq8SDd2yIo0KXFmOCwHroK8OA2B5D1/jzLI/DY49mWmhZxm/vLUxlHJAu
 IlX2X51TLp9dLtREuMFWPmRDOal9jgmHy97kXh6hnCm5M672qNcj/YFGyiD7kXlx7jBP
 8arMHMBD1atKgJ6GHC9o9ETGcZeqw3lUmF21zbtZEjD1U0ryJS/rR24tZMSTn1SLOEyI
 VALg==
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

T24gTW9uLCBPY3QgMDcsIDIwMTkgYXQgMDU6MzI6MDBBTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5
bGlicmUuY29tPgo+IAo+IFRoZSBwcm9iZSBmdW5jdGlvbiBpbiB0aGUgZ3Bpby1iYWNrbGlnaHQg
ZHJpdmVyIGlzIHF1aXRlIHNob3J0LiBJZiB3ZQo+IHB1bGwgZ3Bpb19iYWNrbGlnaHRfaW5pdGlh
bF9wb3dlcl9zdGF0ZSgpIGludG8gcHJvYmUgd2UgY2FuIGRyb3AgdHdvCj4gbW9yZSBmaWVsZHMg
ZnJvbSBzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgYW5kIHNocmluayB0aGUgZHJpdmVyIGNvZGUuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxp
YnJlLmNvbT4KCkFja2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5h
cm8ub3JnPgoKPiAtLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQu
YyB8IDM3ICsrKysrKysrKy0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5z
ZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlk
ZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9n
cGlvX2JhY2tsaWdodC5jCj4gaW5kZXggNjI0NzY4N2I2MzMwLi40MDdkNGVhYWZjNWMgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwo+ICsrKyBi
L2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKPiBAQCAtMTcsMTEgKzE3
LDggQEAKPiAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiAgCj4gIHN0cnVjdCBncGlvX2JhY2ts
aWdodCB7Cj4gLQlzdHJ1Y3QgZGV2aWNlICpkZXY7Cj4gIAlzdHJ1Y3QgZGV2aWNlICpmYmRldjsK
PiAtCj4gIAlzdHJ1Y3QgZ3Bpb19kZXNjICpncGlvZDsKPiAtCWludCBkZWZfdmFsdWU7Cj4gIH07
Cj4gIAo+ICBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3VwZGF0ZV9zdGF0dXMoc3RydWN0IGJh
Y2tsaWdodF9kZXZpY2UgKmJsKQo+IEBAIC01Myw0MSArNTAsMjQgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBiYWNrbGlnaHRfb3BzIGdwaW9fYmFja2xpZ2h0X29wcyA9IHsKPiAgCS5jaGVja19mYgk9
IGdwaW9fYmFja2xpZ2h0X2NoZWNrX2ZiLAo+ICB9Owo+ICAKPiAtc3RhdGljIGludCBncGlvX2Jh
Y2tsaWdodF9pbml0aWFsX3Bvd2VyX3N0YXRlKHN0cnVjdCBncGlvX2JhY2tsaWdodCAqZ2JsKQo+
IC17Cj4gLQlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBnYmwtPmRldi0+b2Zfbm9kZTsKPiAt
Cj4gLQkvKiBOb3QgYm9vdGVkIHdpdGggZGV2aWNlIHRyZWUgb3Igbm8gcGhhbmRsZSBsaW5rIHRv
IHRoZSBub2RlICovCj4gLQlpZiAoIW5vZGUgfHwgIW5vZGUtPnBoYW5kbGUpCj4gLQkJcmV0dXJu
IGdibC0+ZGVmX3ZhbHVlID8gRkJfQkxBTktfVU5CTEFOSyA6IEZCX0JMQU5LX1BPV0VSRE9XTjsK
PiAtCj4gLQkvKiBpZiB0aGUgZW5hYmxlIEdQSU8gaXMgZGlzYWJsZWQsIGRvIG5vdCBlbmFibGUg
dGhlIGJhY2tsaWdodCAqLwo+IC0JaWYgKGdwaW9kX2dldF92YWx1ZV9jYW5zbGVlcChnYmwtPmdw
aW9kKSA9PSAwKQo+IC0JCXJldHVybiBGQl9CTEFOS19QT1dFUkRPV047Cj4gLQo+IC0JcmV0dXJu
IEZCX0JMQU5LX1VOQkxBTks7Cj4gLX0KPiAtCj4gLQo+ICBzdGF0aWMgaW50IGdwaW9fYmFja2xp
Z2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHsKPiAgCXN0cnVjdCBk
ZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4gIAlzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHRfcGxhdGZv
cm1fZGF0YSAqcGRhdGEgPSBkZXZfZ2V0X3BsYXRkYXRhKGRldik7Cj4gKwlzdHJ1Y3QgZGV2aWNl
X25vZGUgKm9mX25vZGUgPSBkZXYtPm9mX25vZGU7Cj4gIAlzdHJ1Y3QgYmFja2xpZ2h0X3Byb3Bl
cnRpZXMgcHJvcHM7Cj4gIAlzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmw7Cj4gIAlzdHJ1Y3Qg
Z3Bpb19iYWNrbGlnaHQgKmdibDsKPiAtCWludCByZXQ7Cj4gKwlpbnQgcmV0LCBkZWZfdmFsdWU7
Cj4gIAo+ICAJZ2JsID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpnYmwpLCBHRlBfS0VSTkVM
KTsKPiAgCWlmIChnYmwgPT0gTlVMTCkKPiAgCQlyZXR1cm4gLUVOT01FTTsKPiAgCj4gLQlnYmwt
PmRldiA9IGRldjsKPiAtCj4gIAlpZiAocGRhdGEpCj4gIAkJZ2JsLT5mYmRldiA9IHBkYXRhLT5m
YmRldjsKPiAgCj4gLQlnYmwtPmRlZl92YWx1ZSA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2wo
ZGV2LCAiZGVmYXVsdC1vbiIpOwo+ICsJZGVmX3ZhbHVlID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRf
Ym9vbChkZXYsICJkZWZhdWx0LW9uIik7Cj4gIAo+ICAJZ2JsLT5ncGlvZCA9IGRldm1fZ3Bpb2Rf
Z2V0KGRldiwgTlVMTCwgR1BJT0RfQVNJUyk7Cj4gIAlpZiAoSVNfRVJSKGdibC0+Z3Bpb2QpKSB7
Cj4gQEAgLTEwOSw3ICs4OSwxNiBAQCBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAkJcmV0dXJuIFBUUl9FUlIoYmwpOwo+ICAJ
fQo+ICAKPiAtCWJsLT5wcm9wcy5wb3dlciA9IGdwaW9fYmFja2xpZ2h0X2luaXRpYWxfcG93ZXJf
c3RhdGUoZ2JsKTsKPiArCS8qIFNldCB0aGUgaW5pdGlhbCBwb3dlciBzdGF0ZSAqLwo+ICsJaWYg
KCFvZl9ub2RlIHx8ICFvZl9ub2RlLT5waGFuZGxlKQo+ICsJCS8qIE5vdCBib290ZWQgd2l0aCBk
ZXZpY2UgdHJlZSBvciBubyBwaGFuZGxlIGxpbmsgdG8gdGhlIG5vZGUgKi8KPiArCQlibC0+cHJv
cHMucG93ZXIgPSBkZWZfdmFsdWUgPyBGQl9CTEFOS19VTkJMQU5LCj4gKwkJCQkJICAgIDogRkJf
QkxBTktfUE9XRVJET1dOOwo+ICsJZWxzZSBpZiAoZ3Bpb2RfZ2V0X3ZhbHVlX2NhbnNsZWVwKGdi
bC0+Z3Bpb2QpID09IDApCj4gKwkJYmwtPnByb3BzLnBvd2VyID0gRkJfQkxBTktfUE9XRVJET1dO
Owo+ICsJZWxzZQo+ICsJCWJsLT5wcm9wcy5wb3dlciA9IEZCX0JMQU5LX1VOQkxBTks7Cj4gKwo+
ICAJYmwtPnByb3BzLmJyaWdodG5lc3MgPSAxOwo+ICAKPiAgCWJhY2tsaWdodF91cGRhdGVfc3Rh
dHVzKGJsKTsKPiAtLSAKPiAyLjIzLjAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
