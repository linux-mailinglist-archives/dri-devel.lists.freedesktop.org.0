Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EFA2932D
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 10:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2A56E087;
	Fri, 24 May 2019 08:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9797E6E087
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 08:34:25 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id a132so6194749qkb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 01:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oKqDPNhFrhfI648m2ZpZorjnGR/p8vjrAU5pnK+zOrc=;
 b=WAA4sA7Ot9mT2kh5niZIFFQEchrxBqbaGzAwVr03RyCR2j4oWV+HRE6TIGZRHDJO8D
 b/nTBnkZuVFO5tcftE0J3IAOburwWpQW2nxXb0JWDokemtn7Ok975Uwz00o8oSfdWMba
 fXSwapdj12E3T1Uyka/Lxt7mTpwhq9Lvr9okWSnrPlZjv+hqx/vr8xeUmgtJeV2Faum9
 2ngDvfOJfhCOAooPwMnUutOdFf9gedTYj6hWqqifYi4Uq/BkJsdnUWG3OYI8iX+Plk6X
 H0fJVIUzuK80k4Mi6gAQMDhkFPD+SJa9KhLx4CthbykYQm7DuiH5/rNaLRHwI+XTXV8u
 nY/g==
X-Gm-Message-State: APjAAAW8I1BFLrTRcushJ7ligfKzEMEoffODW7tg0yoEKztwTkDGMn8l
 NfLAgKyllZOeRcl7vorJ821gP6PS9NJaPE+3NHLP+w==
X-Google-Smtp-Source: APXvYqyMS3Rs1LJXdWZyK+SojuIy5gzc84YCqZt/AjhqaC8guA5a6LqGCwTxVOOBLQN9MRZFyJwqWtLqDZrNHGIGZ/Q=
X-Received: by 2002:ac8:5501:: with SMTP id j1mr4886948qtq.239.1558686864752; 
 Fri, 24 May 2019 01:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <1557500579-19720-1-git-send-email-yannick.fertre@st.com>
 <aa466c60-9110-630e-3c75-99e632207334@st.com>
In-Reply-To: <aa466c60-9110-630e-3c75-99e632207334@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Fri, 24 May 2019 10:34:13 +0200
Message-ID: <CA+M3ks6nqUdMGxkBYf17ptVMB0P3xJ+cY93xXhCX6FTcKJr+eA@mail.gmail.com>
Subject: Re: [PATCH] drm/stm: dsi: check hardware version
To: Philippe CORNU <philippe.cornu@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oKqDPNhFrhfI648m2ZpZorjnGR/p8vjrAU5pnK+zOrc=;
 b=I2DlnDhPUcB9WSOCiHzGa1dh1aSnEVCZqggaUOEx9lu7ClYlgQWd6xGoN6YLBPFd1B
 y4VQ8i8uCB9rsJzrpZWQeb66qboUfGI6KX8JrBPy8kILPXMFqypAi02U7tX7kF7Vu9Hq
 Rgml47oOcJaNGJ2WC/7p7ccoaY757I98JYMCeJMe0sE6+052hFn/5G9Z7e3pmwA+wIp4
 fRXfuvzU/zFpDBHtVf0JPhkfXlgAQsd3jVYyMxpSCAoXbIUARfcI8LmTkJ+XII8WNDTa
 K5NIpfMyyaLuO1nfuIEI+7Vn8r4v2NnRZaBtpmf7tCoJnUnVu47g7OXKU8BLxRMpUb9W
 bP+A==
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yannick FERTRE <yannick.fertre@st.com>, Vincent ABRIOU <vincent.abriou@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgdmVuLiAxMCBtYWkgMjAxOSDDoCAxODozMSwgUGhpbGlwcGUgQ09STlUgPHBoaWxpcHBlLmNv
cm51QHN0LmNvbT4gYSDDqWNyaXQgOgo+Cj4KPiBEZWFyIFlhbm5pY2ssCj4gVGhhbmsgeW91IGZv
ciB5b3VyIHBhdGNoLAo+Cj4gQWNrZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3Ju
dUBzdC5jb20+Cj4KPiBEZWFyIEJlbmphbWluLAo+IElmIHlvdSBhcmUgZmluZSB3aXRoIHRoaXMg
cGF0Y2gsIHBsZWFzZSBwdXNoIGl0ICphZnRlciogdGhlIHBhdGNoIG5hbWVkCj4gImRybS9zdG06
IGRzaTogYWRkIHN1cHBvcnQgb2YgYW4gb3B0aW9uYWwgcmVndWxhdG9yIiAoaWYgSSB3ZWxsCj4g
dW5kZXJzdG9vZCB0aG9zZSB0d28gcGF0Y2hlcykKPgo+IFRoYW5rIHlvdQo+IFBoaWxpcHBlIDot
KQoKQXBwbGllZCBvbiBkcm0tbWlzYy1uZXh0LAoKQmVuamFtaW4KPgo+Cj4gT24gNS8xMC8xOSA1
OjAyIFBNLCBZYW5uaWNrIEZlcnRyw6kgd3JvdGU6Cj4gPiBDaGVjayB2ZXJzaW9uIG9mIERTSSBo
YXJkd2FyZSBJUC4gT25seSB2ZXJzaW9ucyAxLjMwICYgMS4zMQo+ID4gYXJlIHN1cHBvcnRlZC4K
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJlQHN0
LmNvbT4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0bS5j
IHwgMjQgKysrKysrKysrKysrKysrKysrKysrKystCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyMyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21p
cGlfZHNpLXN0bS5jCj4gPiBpbmRleCAyMmJkMDk1Li4yOTEwNWU5IDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3N0bS9kd19taXBpX2RzaS1zdG0uYwo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3N0bS9kd19taXBpX2RzaS1zdG0uYwo+ID4gQEAgLTIyNyw3ICsyMjcsNiBAQCBkd19t
aXBpX2RzaV9nZXRfbGFuZV9tYnBzKHZvaWQgKnByaXZfZGF0YSwgY29uc3Qgc3RydWN0IGRybV9k
aXNwbGF5X21vZGUgKm1vZGUsCj4gPiAgICAgICB1MzIgdmFsOwo+ID4KPiA+ICAgICAgIC8qIFVw
ZGF0ZSBsYW5lIGNhcGFiaWxpdGllcyBhY2NvcmRpbmcgdG8gaHcgdmVyc2lvbiAqLwo+ID4gLSAg
ICAgZHNpLT5od192ZXJzaW9uID0gZHNpX3JlYWQoZHNpLCBEU0lfVkVSU0lPTikgJiBWRVJTSU9O
Owo+ID4gICAgICAgZHNpLT5sYW5lX21pbl9rYnBzID0gTEFORV9NSU5fS0JQUzsKPiA+ICAgICAg
IGRzaS0+bGFuZV9tYXhfa2JwcyA9IExBTkVfTUFYX0tCUFM7Cj4gPiAgICAgICBpZiAoZHNpLT5o
d192ZXJzaW9uID09IEhXVkVSXzEzMSkgewo+ID4gQEAgLTMwNiw2ICszMDUsNyBAQCBzdGF0aWMg
aW50IGR3X21pcGlfZHNpX3N0bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+
ID4gICB7Cj4gPiAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+ID4gICAg
ICAgc3RydWN0IGR3X21pcGlfZHNpX3N0bSAqZHNpOwo+ID4gKyAgICAgc3RydWN0IGNsayAqcGNs
azsKPiA+ICAgICAgIHN0cnVjdCByZXNvdXJjZSAqcmVzOwo+ID4gICAgICAgaW50IHJldDsKPiA+
Cj4gPiBAQCAtMzQ3LDYgKzM0NywyOCBAQCBzdGF0aWMgaW50IGR3X21pcGlfZHNpX3N0bV9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gICAgICAgICAgICAgICBnb3RvIGVy
cl9jbGtfZ2V0Owo+ID4gICAgICAgfQo+ID4KPiA+ICsgICAgIHBjbGsgPSBkZXZtX2Nsa19nZXQo
ZGV2LCAicGNsayIpOwo+ID4gKyAgICAgaWYgKElTX0VSUihwY2xrKSkgewo+ID4gKyAgICAgICAg
ICAgICByZXQgPSBQVFJfRVJSKHBjbGspOwo+ID4gKyAgICAgICAgICAgICBEUk1fRVJST1IoIlVu
YWJsZSB0byBnZXQgcGVyaXBoZXJhbCBjbG9jazogJWRcbiIsIHJldCk7Cj4gPiArICAgICAgICAg
ICAgIGdvdG8gZXJyX2RzaV9wcm9iZTsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIHJldCA9
IGNsa19wcmVwYXJlX2VuYWJsZShwY2xrKTsKPiA+ICsgICAgIGlmIChyZXQpIHsKPiA+ICsgICAg
ICAgICAgICAgRFJNX0VSUk9SKCIlczogRmFpbGVkIHRvIGVuYWJsZSBwZXJpcGhlcmFsIGNsa1xu
IiwgX19mdW5jX18pOwo+ID4gKyAgICAgICAgICAgICBnb3RvIGVycl9kc2lfcHJvYmU7Cj4gPiAr
ICAgICB9Cj4gPiArCj4gPiArICAgICBkc2ktPmh3X3ZlcnNpb24gPSBkc2lfcmVhZChkc2ksIERT
SV9WRVJTSU9OKSAmIFZFUlNJT047Cj4gPiArICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUocGNs
ayk7Cj4gPiArCj4gPiArICAgICBpZiAoZHNpLT5od192ZXJzaW9uICE9IEhXVkVSXzEzMCAmJiBk
c2ktPmh3X3ZlcnNpb24gIT0gSFdWRVJfMTMxKSB7Cj4gPiArICAgICAgICAgICAgIHJldCA9IC1F
Tk9ERVY7Cj4gPiArICAgICAgICAgICAgIERSTV9FUlJPUigiYmFkIGRzaSBoYXJkd2FyZSB2ZXJz
aW9uXG4iKTsKPiA+ICsgICAgICAgICAgICAgZ290byBlcnJfZHNpX3Byb2JlOwo+ID4gKyAgICAg
fQo+ID4gKwo+ID4gICAgICAgZHdfbWlwaV9kc2lfc3RtX3BsYXRfZGF0YS5iYXNlID0gZHNpLT5i
YXNlOwo+ID4gICAgICAgZHdfbWlwaV9kc2lfc3RtX3BsYXRfZGF0YS5wcml2X2RhdGEgPSBkc2k7
Cj4gPgo+ID4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
