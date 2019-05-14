Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FEC1CE3E
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 19:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD040892D2;
	Tue, 14 May 2019 17:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2417892D2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 17:48:26 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id r136so12790169oie.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 10:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NgsTwqqp4QTELA2VQObpORPn+MSwt+1NAVlS7rJZ1DM=;
 b=T7H5Dn2fQv/ryj/t92+FwRH+dVBCnNQtTcOt3FREod5477YJcGl0t8ZjizSKTjMPyu
 ODOJR2vPCCvc+BxP23IQP45QGcYE/253v/KJmdMJqV5WaAeGbYKC55nCnNoF6uYLQ8rx
 MM3QVsm/nIZNnkfJNf0xf6v8K4EQc/+2aMgRBBDWyTxF3lANV7kJYrAsfq1zkkAYjV8z
 jzBKgg2HNrfsNbi3hkhvARv1BMs9ygrWaUDKwPQ6Kq86rDkze9vK1GuLV7AsKt2PFf6i
 EsyfRleatA/Xrvd0q+U5p+fa8AtAAPe4sjiXd9Q2NKqz04WcjYAyVa6I1ol2EWwaXO1i
 oKvA==
X-Gm-Message-State: APjAAAWyIlLc92cNnrqNGzJtxQehhewaKvujhvodrYf5m78KX1uiCwe+
 yVwrSUaEY8LsmcVnuUTXVJhk/h0/iippZosNajM=
X-Google-Smtp-Source: APXvYqwIlBQE8thnJAT4s73XlbxV7ceTFnF4jCgHAss0Y402uCwVNeNTcBhJBKF3isskLjwDR6meyAZ4ouAt/kG0fR8=
X-Received: by 2002:aca:240d:: with SMTP id n13mr3609989oic.145.1557856105979; 
 Tue, 14 May 2019 10:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190514155911.6C0AC68B05@newverein.lst.de>
 <20190514160241.9EAC768C7B@newverein.lst.de>
In-Reply-To: <20190514160241.9EAC768C7B@newverein.lst.de>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Tue, 14 May 2019 10:48:40 -0700
Message-ID: <CA+E=qVfuKBzWK7dpM_eabjU8mLdzOw3zCnYk6Tc1oXdavH7CNA@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: DTS: allwinner: a64: enable ANX6345 bridge on
 Teres-I
To: Torsten Duwe <duwe@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=NgsTwqqp4QTELA2VQObpORPn+MSwt+1NAVlS7rJZ1DM=;
 b=ewXY1DQNTyonbjv+uTp/T9kh8QUq73Y/yojjn/k8dI5sHJfbFDieQe+sL4QVPoQuBN
 1K4IVk3HQPF5Xur2KlUYUApzaPpx5qQ5pLt/9FMS/f10GwvcepdhPMtXWr+RwfnH3tZD
 eEoQdSlKXwdPMc4Y1zR78QoDyYqWjxFJgAuEnUgkFn+9rhBEnwuUJwzdnGMbS+eDOFWN
 zmYR9xiCmg9RcnXOAm/KBdm9mhUJ8lArU4QOmDepTfTPOCw16hBCppqu4vphtFDX8JqR
 k+BGeZSFdkKzb2PwtxyGo+NUDXZIjNWnQs8o5+p7VrxZ9LJFLS9NQt5B76M5sKKZKewt
 m1yA==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Archit Taneja <architt@codeaurora.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgOTowMyBBTSBUb3JzdGVuIER1d2UgPGR1d2VAbHN0LmRl
PiB3cm90ZToKPgo+IEZyb206IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy5pbz4KPgo+IFRF
UkVTLUkgaGFzIGFuIEFOWDYzNDUgYnJpZGdlIGNvbm5lY3RlZCB0byB0aGUgUkdCNjY2IExDRCBv
dXRwdXQsIGFuZAo+IHRoZSBJMkMgY29udHJvbGxpbmcgc2lnbmFscyBhcmUgY29ubmVjdGVkIHRv
IEkyQzAgYnVzLgo+Cj4gRW5hYmxlIGl0IGluIHRoZSBkZXZpY2UgdHJlZS4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy5pbz4KPiBTaWduZWQtb2ZmLWJ5OiBU
b3JzdGVuIER1d2UgPGR1d2VAc3VzZS5kZT4KPiAtLS0KPgo+IG9yaWdpbmFsbHk6IHBhdGNod29y
ay5rZXJuZWwub3JnL3BhdGNoLzEwNjQ2ODY3Cj4KPiBDaGFuZ2VkIHRoZSByZXNldCBwb2xhcml0
eSwgd2hpY2ggaXMgYWN0aXZlIGxvdywKPiBhY2NvcmRpbmcgdG8gdGhlICh0ZXJzZSkgZGF0YXNo
ZWV0LCBUZXJlcy1JIGFuZCBwaW5lYm9vayBzY2hlbWF0aWNzLAo+IGFuZCB0aGUgY29uZnVzaW5n
IHBhcnRzIG9mIHRoZSBsaW51eCBkcml2ZXIgY29kZSAobm90IHlldCBpbmNsdWRlZCBoZXJlKS4K
PiBBY3RpdmUgbG93IC0+IG5vIG1vcmUgY29uZnVzaW9uLgo+Cj4gLS0tCj4gIC4uLi9ib290L2R0
cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC10ZXJlcy1pLmR0cyB8IDQwICsrKysrKysrKysrKysrKysr
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC10
ZXJlcy1pLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQtdGVy
ZXMtaS5kdHMKPiBpbmRleCBjNDU1YjI0ZGQwNzkuLmJjMWQwZDZjMDY3MiAxMDA2NDQKPiAtLS0g
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LXRlcmVzLWkuZHRzCj4g
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC10ZXJlcy1pLmR0
cwo+IEBAIC03MiwyMCArNzIsMzggQEAKPiAgICAgICAgIH07Cj4gIH07Cj4KPiArJmRlIHsKPiAr
ICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiArfTsKPiArCj4gICZlaGNpMSB7Cj4gICAgICAgICBz
dGF0dXMgPSAib2theSI7Cj4gIH07Cj4KPgo+IC0vKiBUaGUgQU5YNjM0NSBlRFAtYnJpZGdlIGlz
IG9uIGkyYzAuIFRoZXJlIGlzIG5vIGxpbnV4IChtYWlubGluZSkKPiAtICogZHJpdmVyIGZvciB0
aGlzIGNoaXAgYXQgdGhlIG1vbWVudCwgdGhlIGJvb3Rsb2FkZXIgaW5pdGlhbGl6ZXMgaXQuCj4g
LSAqIEhvd2V2ZXIgaXQgY2FuIGJlIGFjY2Vzc2VkIHdpdGggdGhlIGkyYy1kZXYgZHJpdmVyIGZy
b20gdXNlciBzcGFjZS4KPiAtICovCj4gICZpMmMwIHsKPiAgICAgICAgIGNsb2NrLWZyZXF1ZW5j
eSA9IDwxMDAwMDA+Owo+ICAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPiAgICAg
ICAgIHBpbmN0cmwtMCA9IDwmaTJjMF9waW5zPjsKPiAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsK
PiArCj4gKyAgICAgICBhbng2MzQ1OiBhbng2MzQ1QDM4IHsKPiArICAgICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJhbmFsb2dpeCxhbng2MzQ1IjsKPiArICAgICAgICAgICAgICAgcmVnID0gPDB4
Mzg+Owo+ICsgICAgICAgICAgICAgICByZXNldC1ncGlvcyA9IDwmcGlvIDMgMjQgR1BJT19BQ1RJ
VkVfTE9XPjsgLyogUEQyNCAqLwo+ICsgICAgICAgICAgICAgICBkdmRkMjUtc3VwcGx5ID0gPCZy
ZWdfZGxkbzI+Owo+ICsgICAgICAgICAgICAgICBkdmRkMTItc3VwcGx5ID0gPCZyZWdfZGxkbzM+
Owo+ICsKPiArICAgICAgICAgICAgICAgcG9ydCB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
YW54NjM0NV9pbjogZW5kcG9pbnQgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmVtb3RlLWVuZHBvaW50ID0gPCZ0Y29uMF9vdXRfYW54NjM0NT47Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgfTsKPiArICAgICAgICAgICAgICAgfTsKCkl0IGRvZXNuJ3QgY29tcGx5IHdpdGgg
YmluZGluZ3MgZG9jdW1lbnQuIFlvdSBuZWVkIHRvIGFkZCBvdXQgZW5kcG9pbnQKYXMgd2VsbCwg
YW5kIHRvIGRvIHNvIHlvdSBuZWVkIHRvIGFkZCBiaW5kaW5ncyBmb3IgZURQIGNvbm5lY3RvciBm
aXJzdAphbmQgdGhlbiBpbXBsZW1lbnQgcGFuZWwgZHJpdmVyLgpTZWUgUm9iJ3Mgc3VnZ2VzdGlv
bnMgaGVyZTogaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3BhdGNoLzEwNDI1OTMvCgo+ICsg
ICAgICAgfTsKPiArfTsKPiArCj4gKyZtaXhlcjAgewo+ICsgICAgICAgc3RhdHVzID0gIm9rYXki
Owo+ICB9Owo+Cj4gICZtbWMwIHsKPiBAQCAtMjU4LDYgKzI3NiwyMCBAQAo+ICAgICAgICAgdmNj
LWhkbWktc3VwcGx5ID0gPCZyZWdfZGxkbzE+Owo+ICB9Owo+Cj4gKyZ0Y29uMCB7Cj4gKyAgICAg
ICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+ICsgICAgICAgcGluY3RybC0wID0gPCZsY2Rf
cmdiNjY2X3BpbnM+Owo+ICsKPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiArfTsKPiArCj4g
KyZ0Y29uMF9vdXQgewo+ICsgICAgICAgdGNvbjBfb3V0X2FueDYzNDU6IGVuZHBvaW50QDAgewo+
ICsgICAgICAgICAgICAgICByZWcgPSA8MD47Cj4gKyAgICAgICAgICAgICAgIHJlbW90ZS1lbmRw
b2ludCA9IDwmYW54NjM0NV9pbj47Cj4gKyAgICAgICB9Owo+ICt9Owo+ICsKPiAgJnVhcnQwIHsK
PiAgICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gICAgICAgICBwaW5jdHJsLTAg
PSA8JnVhcnQwX3BiX3BpbnM+OwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
