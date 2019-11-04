Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2DFEF11F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 00:19:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E2D6E8B2;
	Mon,  4 Nov 2019 23:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2516B6E8B2
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 23:19:49 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id v24so10711974otp.5
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 15:19:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=B/7/LqF/CZv0nsjbB5eZTLdElnSnNe+StwJiRPxE/Ak=;
 b=PGGK+FWLdw2FoOGM1FjuApIVNBI8ejUfGR11wCgE+U472RT8zZsE/lJeJvmYFrgmkm
 3ukQElKOPhS05m97Tj9S0ySK641Um3pYLGpF3adgoFlknmCwK7juO0LmlmJQzoO7qj2k
 21TIvNUhURTwQYbZtyl+eSlLzJSc12vCIQStbR9rHx7mZg2OzVQB2rnRDoiJMdOO1PzK
 aNk+sB2yf8V9TR/7YxbgGeZFfRhxAJ9HDn/KMGhjyzuWVsPnmeSnzj4S2yz1LW/oth4t
 17FQqMUmyNdKfUXSp6icPVUmjmcxaayLQpZlY7eR+qGo4RDl/RFGgYmqAqY1BtX1x/sX
 gv4w==
X-Gm-Message-State: APjAAAUgbOQpovyHS2OuJTeIhjY0JF6myaM3AqcfeVUJZkz4DwtLxXp6
 gGZ6if0JFt1Z/xG59exEhw==
X-Google-Smtp-Source: APXvYqzx/aQY2H59hBWjZylMkWY/v6c1DRzRSAcSFDfU/519YbKFGnRvj51ymMTIFmIvqhroh5gmpA==
X-Received: by 2002:a9d:70d1:: with SMTP id w17mr3694236otj.88.1572909588162; 
 Mon, 04 Nov 2019 15:19:48 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y145sm1219999oia.21.2019.11.04.15.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 15:19:47 -0800 (PST)
Date: Mon, 4 Nov 2019 17:19:46 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2 v5] drm/panel: Add DT bindings for Sony ACX424AKP
Message-ID: <20191104231946.GA14609@bogus>
References: <20191103205459.24965-1-linus.walleij@linaro.org>
 <20191103205459.24965-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191103205459.24965-2-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBOb3YgMDMsIDIwMTkgYXQgMDk6NTQ6NTlQTSArMDEwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBUaGlzIGFkZHMgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRoZSBTb255IEFDWDQy
NEFLUCBwYW5lbC4KPiBMZXQncyB1c2UgWUFNTC4KPiAKPiBDYzogZGV2aWNldHJlZUB2Z2VyLmtl
cm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxp
bmFyby5vcmc+Cj4gLS0tCj4gQ2hhbmdlTG9nIHY0LT52NToKPiAtIEZpeCB1cCBhbGwgd2Fybmlu
Z3MgZXRjIGluY3VycmVkIGZyb20gdGhlIG5vdyB3b3JraW5nIHNjaGVtYSBjaGVjawo+ICAgYW5k
IERUUyBjb21waWxhdGlvbi4KPiAtIEkgc3RpbGwgaGF2ZSBhIHZlcnQgYW5ub3lpbmcgZXJyb3Ig
bWVzc2FnZSBpbiB0aGUgU29ueQo+ICAgcGFuZWwgYmluZGluZ3MgdGhhdCB1c2VzIHRoaXMgc2No
ZW1hOgo+ICAgc29ueSxhY3g0MjRha3AuZXhhbXBsZS5kdC55YW1sOiBwYW5lbEAwOiAkbm9kZW5h
bWU6MDogJ3BhbmVsQDAnIGRvZXMgbm90IG1hdGNoICdeZHNpLWNvbnRyb2xsZXIoQC4qKT8kJwo+
ICAgQXMgdGhpcyBpcyBtb2RlbGVkIHZlcnkgY2xvc2VseSB0bwo+ICAgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9tZGlvLnlhbWwKPiAgIGFuZCB0aGF0IG9uZSBkb2Vzbid0
IGVtaXQgdGhpcyB0eXBlIG9mIHdhcm5pbmcgZm9yIGl0cyBldGhlcm5ldC1waHlAMAo+ICAgZXRj
IEkgYW0gcHJldHR5IG11Y2ggY2x1ZWxlc3MgYW5kIGp1c3QgY2FuJ3Qgc2VlIHdoYXQgdGhlIHBy
b2JsZW0KPiAgIGlzLgoKSSB0aG91Z2h0IEkgdG9sZCB5b3Ugd2hhdCB0aGUgcHJvYmxlbSBpcyBv
biB0aGUgbGFzdCB2ZXJzaW9uLiBTZWUgYmVsb3cuCgo+IC0gSWYgSSBjYW4ndCBmaWd1cmUgdGhp
cyBvdXQgdGhlIG9ubHkgdmlhYmxlIG5leHQgc3RlcCBpcyB0byBkcm9wIHRoZQo+ICAgYW1iaXRp
b24gdG8gY3JlYXRlIHlhbWwgYmluZGluZ3Mgc2ltcGx5IGJlY2F1c2UgSSdtIHVuYWJsZSB0byBk
bwo+ICAgaXQsIGFuZCBnbyBiYWNrIHRvIHRyYWRpdGlvbmFsIHRleHQgYmluZGluZ3MgOigKPiBD
aGFuZ2VMb2cgdjMtPnY0Ogo+IC0gQWRqdXN0IHRvIGFkanVzdGVkIERTSSBiaW5kaW5ncy4KPiBD
aGFuZ2VMb2cgdjItPnYzOgo+IC0gUHV0IHRoZSBleGFtcGxlIGluc2lkZSBhIGRzaS1jb250cm9s
bGVyIHNvIHdlIGhhdmUgYSBjb21wbGV0ZQo+ICAgZXhhbXBsZSB0aGF0IHZlcmlmaWVzIHRvIHRo
ZSBEU0kgcGFuZWwgZ2VuZXJpYyBiaW5kaW5nLgo+IENoYW5nZUxvZyB2MS0+djI6Cj4gLSBTdWdn
ZXN0IGEgc3RhbmQtYWxvbmUgWUFNTCBiaW5kaW5ncyBmaWxlIGZvciBEU0kgcGFuZWxzIGluCj4g
ICBhIHNlcGFyYXRlIHBhdGNoLCBhbmQgdXNlIHRoYXQgdG8gcmVmZXJlbmNlIHRoZQo+ICAgYm9v
bGVhbiAiZW5mb3JjZS12aWRlby1tb2RlIiBhdHRyaWJ1dGUgZm9yIERTSSBwYW5lbHMKPiAtLS0K
PiAgLi4uL2Rpc3BsYXkvcGFuZWwvc29ueSxhY3g0MjRha3AueWFtbCAgICAgICAgIHwgNTAgKysr
KysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKQo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwvc29ueSxhY3g0MjRha3AueWFtbAo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zb255LGFjeDQyNGFrcC55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc29ueSxh
Y3g0MjRha3AueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAw
Li4xYzEyMzEzOWI4MGEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc29ueSxhY3g0MjRha3AueWFtbAo+IEBAIC0w
LDAgKzEsNTAgQEAKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBP
UiBCU0QtMi1DbGF1c2UpCj4gKyVZQU1MIDEuMgo+ICstLS0KPiArJGlkOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVsL3NvbnksYWN4NDI0YWtwLnlhbWwjCj4gKyRz
Y2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ICsK
PiArdGl0bGU6IFNvbnkgQUNYNDI0QUtQIDQiIDQ4MHg4NjQgQU1PTEVEIHBhbmVsCj4gKwo+ICtt
YWludGFpbmVyczoKPiArICAtIExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz4KPiArCj4gK2FsbE9mOgo+ICsgIC0gJHJlZjogcGFuZWwtY29tbW9uLnlhbWwjCj4gKyAgLSAk
cmVmOiAuLi9kc2ktY29udHJvbGxlci55YW1sIwoKVGhpcyBzY2hlbWEgaXMgZm9yIGEgcGFuZWwg
bm9kZSwgbm90IHRoZSBkc2ktY29udHJvbGxlci4gWW91IG5lZWQgdG8gCmRyb3AgdGhpcyBsaW5l
LiBJdCBzaG91bGQgYmUgaW5jbHVkZWQgYnkgRFNJIGNvbnRyb2xsZXJzLgoKPiArCj4gK3Byb3Bl
cnRpZXM6Cj4gKyAgY29tcGF0aWJsZToKPiArICAgIGNvbnN0OiBzb255LGFjeDQyNGFrcAo+ICsg
IHJlZzogdHJ1ZQo+ICsgIHJlc2V0LWdwaW9zOiB0cnVlCj4gKyAgdmRkaS1zdXBwbHk6Cj4gKyAg
ICAgZGVzY3JpcHRpb246IHJlZ3VsYXRvciB0aGF0IHN1cHBsaWVzIHRoZSB2ZGRpIHZvbHRhZ2UK
PiArICBlbmZvcmNlLXZpZGVvLW1vZGU6IHRydWUKPiArCj4gK3JlcXVpcmVkOgo+ICsgIC0gY29t
cGF0aWJsZQo+ICsgIC0gcmVnCj4gKyAgLSByZXNldC1ncGlvcwo+ICsKPiArYWRkaXRpb25hbFBy
b3BlcnRpZXM6IGZhbHNlCj4gKwo+ICtleGFtcGxlczoKPiArICAtIHwKPiArICAgICNpbmNsdWRl
IDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4KPiArCj4gKyAgICBkc2ktY29udHJvbGxlckBhMDM1
MTAwMCB7Cj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJzdGUsbWNkZS1kc2kiOwo+ICsgICAgICAg
IHJlZyA9IDwweGEwMzUxMDAwIDB4MTAwMD47Cj4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8
MT47Cj4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4gKwo+ICsgICAgICAgIHBhbmVsQDAg
ewo+ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gInNvbnksYWN4NDI0YWtwIjsKPiArICAgICAg
ICAgICAgcmVnID0gPDA+Owo+ICsgICAgICAgICAgICB2ZGRpLXN1cHBseSA9IDwmZm9vPjsKPiAr
ICAgICAgICAgICAgcmVzZXQtZ3Bpb3MgPSA8JmZvb19ncGlvIDAgR1BJT19BQ1RJVkVfTE9XPjsK
PiArICAgICAgICB9Owo+ICsgICAgfTsKPiArCj4gKy4uLgo+IC0tIAo+IDIuMjEuMAo+IApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
