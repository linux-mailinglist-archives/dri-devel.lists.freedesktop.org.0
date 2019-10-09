Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77551D1908
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 21:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23AC989EB7;
	Wed,  9 Oct 2019 19:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4CEC89E36
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 19:35:25 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id a15so2816146oic.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 12:35:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LSaKQcX6q921SbZIAAps9qq+mryxNGBOoC/GFHk9XOM=;
 b=CPBE2S/5Q1JyoIT4xHs2FRsEKpx/IOuWdSbbZKYBvPaSjO4qS3X37+uWsE8nHRKy8G
 1iiH+uq9dGzoZvznsfZqYlo1Oa0T97DeUA9XE89H+ftUTNfXBs9Duf7GJIgfJ11huPTv
 vlCmKttGFDlZ45lssm/3XTOBH8XAMFu+22jJRxGIg8CLWsSzCC4LzCR5oh9/8N+5AihU
 eC1PH+dUr2gOca5TnMmeO5wBd3RHrHrIdYdnePcSNOjdK5smVpjWsCzFLE/itcCrrN7J
 yW4WIUKdTyvGKSTyKfZvEztpi/KUilsVgXQUkDZLgHFSe4iYBytY1a+jQQwdcbsHgf5T
 tWCg==
X-Gm-Message-State: APjAAAWJsRZ6naARj4Dp2dNyOtOe2JEqZYiD45hhGb6S0107IQ9EQWaQ
 A6MAp35OU6VtR16JodFh4A==
X-Google-Smtp-Source: APXvYqwo7etVQip/ebQ+dQtduCEo+8iK/+LAxhfIkrh6SvJ3EJNFQLHCD0Q63XCl50BGs0IjfJTqYw==
X-Received: by 2002:aca:f545:: with SMTP id t66mr3872832oih.124.1570649724939; 
 Wed, 09 Oct 2019 12:35:24 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v24sm890114ote.23.2019.10.09.12.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 12:35:24 -0700 (PDT)
Date: Wed, 9 Oct 2019 14:35:23 -0500
From: Rob Herring <robh@kernel.org>
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [PATCH v10 5/6] dt-bindings: backlight: Add led-backlight binding
Message-ID: <20191009193523.GA7094@bogus>
References: <20191009085127.22843-1-jjhiblot@ti.com>
 <20191009085127.22843-6-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009085127.22843-6-jjhiblot@ti.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, sre@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomi.valkeinen@ti.com,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDksIDIwMTkgYXQgMTA6NTE6MjZBTSArMDIwMCwgSmVhbi1KYWNxdWVzIEhp
YmxvdCB3cm90ZToKPiBBZGQgRFQgYmluZGluZyBmb3IgbGVkLWJhY2tsaWdodC4KPiAKPiBDYzog
ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBKZWFuLUphY3F1ZXMg
SGlibG90IDxqamhpYmxvdEB0aS5jb20+Cj4gCj4gLS0tCj4gCj4gLi4uL2xlZHMvYmFja2xpZ2h0
L2xlZC1iYWNrbGlnaHQueWFtbCAgICAgICAgIHwgNTUgKysrKysrKysrKysrKysrKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xlZC1iYWNrbGln
aHQueWFtbAo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbGVkcy9iYWNrbGlnaHQvbGVkLWJhY2tsaWdodC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQueWFtbAo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi40N2FlM2Q2YjRmMzEKPiAtLS0g
L2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMv
YmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQueWFtbAo+IEBAIC0wLDAgKzEsNTUgQEAKPiArIyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQo+ICslWUFNTCAx
LjIKPiArLS0tCj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbGVkcy9iYWNr
bGlnaHQvbGVkLWJhY2tsaWdodC55YW1sIwo+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiArCj4gK3RpdGxlOiBMRUQtYmFzZWQgQmFja2xp
Z2h0IERldmljZSBUcmVlIEJpbmRpbmdzCj4gKwo+ICttYWludGFpbmVyczoKPiArICAtIEplYW4t
SmFjcXVlcyBIaWJsb3QgPGpqaGlibG90QHRpLmNvbT4KPiArCj4gK2Rlc2NyaXB0aW9uOiB8Cj4g
KyAgVGhpcyBiaW5kaW5nIGlzIHVzZWQgdG8gZGVzY3JpYmUgYSBiYXNpYyBiYWNrbGlnaHQgZGV2
aWNlIG1hZGUgb2YgTEVEcy4KPiArICBJdCBjYW4gYWxzbyBiZSB1c2VkIHRvIGRlc2NyaWJlIGEg
YmFja2xpZ2h0IGRldmljZSBjb250cm9sbGVkIGJ5IHRoZQo+ICsgIG91dHB1dCBvZiBhIExFRCBk
cml2ZXIuCj4gKwo+ICtwcm9wZXJ0aWVzOgo+ICsgIGNvbXBhdGlibGU6Cj4gKyAgICBjb25zdDog
bGVkLWJhY2tsaWdodAo+ICsKPiArICBsZWRzOgo+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMu
eWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZS1hcnJheQo+ICsgICAgZGVzY3JpcHRpb246IExpc3Qg
b2YgTEVEcyBjb25zdGl0dXRpdmUgb2YgdGhlIGJhY2tsaWdodC4KPiArCj4gKyAgZGVmYXVsdC1i
cmlnaHRuZXNzOgo+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMv
dWludDMyCj4gKyAgICBkZXNjcmlwdGlvbjogRGVmYXVsdCBicmlnaHRuZXNzIGxldmVsIG9uIGJv
b3QuCgpJdCdzIG5vdCBjbGVhciB0aGF0IHRoaXMgaXMgYW4gaW5kZXggd2hlbiAnYnJpZ2h0bmVz
cy1sZXZlbHMnIGlzIHByZXNlbnQgCmFuZCBhYnNvbHV0ZSBsZXZlbCB3aGVuIG5vdC4gSSB3b25k
ZXIgaWYgd2UndmUgYmVlbiBjb25zaXN0ZW50IG9uIHRoYXQ/Cgo+ICsgICAgbWluaW11bTogMAoK
SW1wbGllZCBieSBiZWluZyBhIHVpbnQzMi4KCj4gKwo+ICsgIGJyaWdodG5lc3MtbGV2ZWxzOgo+
ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyLWFycmF5
Cj4gKyAgICBkZXNjcmlwdGlvbjogQXJyYXkgb2YgZGlzdGluY3QgYnJpZ2h0bmVzcyBsZXZlbHMu
IFRoZSBsZXZlbHMgbXVzdCBiZSBpbgo+ICsgICAgICB0aGUgcmFuZ2UgYWNjZXB0ZWQgYnkgdGhl
IHVuZGVybHlpbmcgTEVEIGRldmljZXMuIFRoaXMgaXMgdXNlZCB0bwo+ICsgICAgICB0cmFuc2xh
dGUgYSBiYWNrbGlnaHQgYnJpZ2h0bmVzcyBsZXZlbCBpbnRvIGEgTEVEIGJyaWdodG5lc3MgbGV2
ZWwuIElmCj4gKyAgICAgIGl0IGlzIG5vdCBwcm92aWRlZCwgdGhlIGlkZW50aXR5IG1hcHBpbmcg
aXMgdXNlZC4KPiArCj4gK3JlcXVpcmVkOgo+ICsgIC0gY29tcGF0aWJsZQo+ICsgIC0gYmFja2xp
Z2h0LWxlZHMKCmxlZHM/CgoKQWRkICdhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UnIGhlcmUu
Cgo+ICsKPiArZXhhbXBsZXM6Cj4gKyAgLSB8Cj4gKyAgICBiYWNrbGlnaHQgewoKUGxlYXNlIGFs
c28gZGVmaW5lICRub2RlbmFtZSBpcyAnYmFja2xpZ2h0Jy4KCj4gKyAgICAgIGNvbXBhdGlibGUg
PSAibGVkLWJhY2tsaWdodCI7Cj4gKyAgICAgIGJhY2tsaWdodC1sZWRzID0gPCZsZWQxPjsKCmxl
ZHM/Cgo+ICsgICAgICBicmlnaHRuZXNzLWxldmVscyA9IDwwIDQgOCAxNiAzMiA2NCAxMjggMjU1
PjsKPiArICAgICAgZGVmYXVsdC1icmlnaHRuZXNzID0gPDY+OyAvKjZ0aCBsZXZlbCA9PiBicmln
aHRuZXNzIG9mIHRoZSBMRURzIGlzIDEyOCovCj4gKyAgICB9Owo+ICsgIC0gfAo+ICsgICAgYmFj
a2xpZ2h0IHsKPiArICAgICAgY29tcGF0aWJsZSA9ICJsZWQtYmFja2xpZ2h0IjsKPiArICAgICAg
YmFja2xpZ2h0LWxlZHMgPSA8JmxlZDE+LCA8JmxlZDI+Owo+ICsgICAgICBkZWZhdWx0LWJyaWdo
dG5lc3MgPSA8MjU1PjsKPiArICAgIH07Cj4gKy4uLgo+IC0tIAo+IDIuMTcuMQo+IApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
