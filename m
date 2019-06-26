Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF60956739
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 12:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570D96E18F;
	Wed, 26 Jun 2019 10:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB716E18F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 10:56:18 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c2so2185450wrm.8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 03:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=j2eG3tSDbarkCwpmXUvGaJx+Wh9f5fwEAaa9WZrgNI0=;
 b=m/ET5Agz42FNjyTGCur+y8p4ZDN0vjOSQqgDgnArFjLvb6M7pjjlJ5fKt0FEBqsygI
 2wbOMxDZTV4i6PfAJP2nXtJNIscl16gqj/KISGwpMQjYBJr0WYy+dh2KRDRsfIbvtmAt
 Yz0ghSbTdd4XbGTHUC0od4rYrpqy+YIur7TugPSsx19Rr/mEhR/21R9uXOs30uLfy7fD
 P9iifVeIErhHfl9BzCDPvRdmX/1H4wFIXgpzl/yB78jr2Evqz3m9DHIwnNr9fsTEsjDi
 Zqda7uNBs8UltRnwK4xwgt8ARqPJaE3uEjeEmRKi9LS18HicIAKdPL/4QH9vCSpTGaSm
 YZ7w==
X-Gm-Message-State: APjAAAUyaJL7XZGGT8d+r8Z4YyTcK4KzUSKPKaw/o7brj7v/KbUdKIi3
 4MCpVxYSjR1TtdxmxzPCTBSL7A==
X-Google-Smtp-Source: APXvYqyYMXk739SFIZW8rU7j/7NYZ/CNk4T4NZtdoU8WWWjOZHSL/n3F4W7cK9xHaLb3iGZ02Hm7qw==
X-Received: by 2002:adf:fed0:: with SMTP id q16mr3113776wrs.127.1561546577205; 
 Wed, 26 Jun 2019 03:56:17 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id y184sm1642151wmg.14.2019.06.26.03.56.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 03:56:16 -0700 (PDT)
Date: Wed, 26 Jun 2019 11:56:14 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Brian Dodge <bdodge09@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: backlight: fix vendor prefix for
 ArcticSand arcxcnn driver bindings
Message-ID: <20190626105614.ujmryi7qou2ra7aq@holly.lan>
References: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
 <1561435529-7835-2-git-send-email-bdodge09@gmail.com>
 <20190625085534.xf2ullyju3ewbgik@holly.lan>
 <CAFaGBPnH=75=wJRM4EX9MYR8MSehEa2_hBEOsqo-DZvD6c6f_A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFaGBPnH=75=wJRM4EX9MYR8MSehEa2_hBEOsqo-DZvD6c6f_A@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=j2eG3tSDbarkCwpmXUvGaJx+Wh9f5fwEAaa9WZrgNI0=;
 b=BOKTavz/4nPTkI1bDzm/v1kGi3+GDZ3FBIh3ofIszJbiO4XEozsgDAJXZDdNZsE/Lp
 dswNw+B+0X2HRezmnGjA745HV/iopd2wx0kxd9s/7TTmPXhhgyMP8lFr2Mh1bCBSpidX
 4LlaUU6wIcT6VKpytLluyfeMKqSqRkhQVypPVxN7S5dOEyvc5VXfd4asnouS/DlCNgM2
 ZJY9XKix+GXxmMU1q9mhknf56u0Ftt1DqeRyiJ5U8xhVAyTxdDA109iKBnfwaoLTRO4p
 dp/Ro22jNKqRJWkRpW09LCkCIW780VgAz5jzpUFjpWOlP+T1LaQVlcxy3+h2SZAe4sfJ
 PsXg==
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
Cc: devicetree@vger.kernel.org, jingoohan1@gmail.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, Pavel Machek <pavel@ucw.cz>, pbacon@psemi.com,
 lee.jones@linaro.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDc6NDQ6MDZBTSAtMDQwMCwgQnJpYW4gRG9kZ2Ugd3Jv
dGU6Cj4gSSB3b3VsZCBsaWtlIHRvIGRlcHJlY2F0ZSB0aGUgb2xkIHByZWZpeCBpbiB0aGUgZnV0
dXJlIGFmdGVyIGNvbW11bmljYXRpbmcKPiB3aXRoIGFsbCBjaGlwIGN1c3RvbWVycywgd2hpY2gg
aXMgd2h5IHRoZSBvbGQgcHJlZml4IGlzIG5vdCBkb2N1bWVudGVkIGluCj4gdGhlIG5ldyBiaW5k
aW5ncy4KCkRlcHJlY2F0aW9uIGlzIGZpbmUgKGJ5IG1lIGF0IGxlYXN0KSBpdCdzIGp1c3QgdGhh
dCBJJ20gbm90IHN1cmUgdGhhdApyZW1vdmluZyB0aGUgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIGRl
cHJlY2F0ZWQgYmluZGluZ3MgaXMgdGhlIHJpZ2h0IHdheQp0byBkbyBpdC4gV2hhdCBpcyB0aGUg
cHJpb3IgYXJ0IGhlcmU/CgoKRGFuaWVsLgoKCgo+IAo+IAo+IE9uIFR1ZSwgSnVuIDI1LCAyMDE5
LCA0OjU1IEFNIERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4g
d3JvdGU6Cj4gCj4gPiBPbiBUdWUsIEp1biAyNSwgMjAxOSBhdCAxMjowNToyOEFNIC0wNDAwLCBC
cmlhbiBEb2RnZSB3cm90ZToKPiA+ID4gICAgIFRoZSB2ZW5kb3ItcHJlZml4ZXMudHh0IGZpbGUg
cHJvcGVybHkgcmVmZXJzIHRvIEFyY3RpY1NhbmQKPiA+ID4gICAgIGFzIGFyY3RpYyBidXQgdGhl
IGRyaXZlciBiaW5kaW5ncyBpbXByb3Blcmx5IGFiYnJldmlhdGVkIHRoZQo+ID4gPiAgICAgcHJl
Zml4IHRvIGFyYy4gVGhpcyB3YXMgYSBtaXN0YWtlIGluIHRoZSBvcmlnaW5hbCBwYXRjaAo+ID4g
Pgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCcmlhbiBEb2RnZSA8YmRvZGdlMDlAZ21haWwuY29tPgo+
ID4gPiAtLS0KPiA+ID4gIC4uLi9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9hcmN4Y25uX2JsLnR4
dCAgICAgICAgIHwgMjQKPiA+ICsrKysrKysrKysrKystLS0tLS0tLS0KPiA+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlm
ZiAtLWdpdAo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNr
bGlnaHQvYXJjeGNubl9ibC50eHQKPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2xlZHMvYmFja2xpZ2h0L2FyY3hjbm5fYmwudHh0Cj4gPiA+IGluZGV4IDIzMGFiZGUuLjlj
ZjRjNDQgMTAwNjQ0Cj4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9sZWRzL2JhY2tsaWdodC9hcmN4Y25uX2JsLnR4dAo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvYXJjeGNubl9ibC50eHQKPiA+ID4g
QEAgLTEsOCArMSwxMiBAQAo+ID4gPiAtQmluZGluZyBmb3IgQXJjdGljU2FuZCBhcmMyYzA2MDgg
TEVEIGRyaXZlcgo+ID4gPiArQmluZGluZyBmb3IgQXJjdGljU2FuZCBhcmMgZmFtaWx5IExFRCBk
cml2ZXJzCj4gPiA+Cj4gPiA+ICBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ID4gPiAtLSBjb21wYXRp
YmxlOiAgICAgICAgICAgICAgICBzaG91bGQgYmUgImFyYyxhcmMyYzA2MDgiCj4gPiA+IC0tIHJl
ZzogICAgICAgICAgICAgICAgICAgICAgIHNsYXZlIGFkZHJlc3MKPiA+ID4gKy0gY29tcGF0aWJs
ZTogb25lIG9mCj4gPiA+ICsgICAgICJhcmN0aWMsYXJjMWMwNjA4Igo+ID4gPiArICAgICAiYXJj
dGljLGFyYzJjMDYwOCIKPiA+ID4gKyAgICAgImFyY3RpYyxhcmMzYzA4NDUiCj4gPgo+ID4gVGhp
cyBpcyBtb3JlIGEgcXVlc3Rpb24gZm9yIHRoZSBEVCBmb2xrcyB0aGFuIGZvciBCcmlhbiBidXQu
Li4KPiA+Cj4gPiBBRkFJQ1QgdGhpcyBwYXRjaCBpcyBmaXhpbmcgdGhlIGJpbmRpbmcgZm9yIHRo
ZSBBcmN0aWNTYW5kIGRldmljZXMgdG8KPiA+IHVzZSB0aGUgY29ycmVjdCB2YWx1ZSBmcm9tIHZl
bmRvci1wcmVmaXhlcy55YW1sIGFuZCBoYXMgYmVlbiBwcmV2aW91c2x5Cj4gPiBkaXNjdXNzZWQg
aGVyZToKPiA+IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE4LzkvMjUvNzI2Cj4gPgo+ID4gQ3Vy
cmVudGx5IHRoaXMgcGF0Y2ggc2VyaWVzIGp1c3QgdXBkYXRlcyB0aGUgRFQgYmluZGluZ3MgYnV0
IHRoZQo+ID4gaW1wbGVtZW50YXRpb24gYWxzbyBob25vdXJzIHRoZSBvbGQgdmFsdWVzIChzaW5j
ZSB0aGVyZSBpcyBhIENocm9tZWJvb2sKPiA+IGluIHRoZSB3aWxkIHRoYXQgdXNlcyB0aGUgY3Vy
cmVudCBiaW5kaW5ncykuCj4gPgo+ID4gSGVuY2UgSSdtIG5vdCBjbGVhciB3aGV0aGVyIHRoZSBi
aW5kaW5ncyBzaG91bGQgZG9jdW1lbnQgdGhlIGRlcHJlY2F0ZWQKPiA+IG9wdGlvbnMgdG9vIChl
LmcuIG1ha2UgaXQgZWFzaWVyIHRvIGZpbmQgdGhlIGJpbmRpbmdzIGRvYyB3aXRoIGdpdCBncmVw
Cj4gPiBhbmQgZnJpZW5kcykuCj4gPgo+ID4KPiA+IERhbmllbC4KPiA+Cj4gPgo+ID4gPiArCj4g
PiA+ICstIHJlZzogICAgICAgICAgICAgICBzbGF2ZSBhZGRyZXNzCj4gPiA+Cj4gPiA+ICBPcHRp
b25hbCBwcm9wZXJ0aWVzOgo+ID4gPiAgLSBkZWZhdWx0LWJyaWdodG5lc3M6ICAgICAgICBicmln
aHRuZXNzIHZhbHVlIG9uIGJvb3QsIHZhbHVlIGZyb206Cj4gPiAwLTQwOTUKPiA+ID4gQEAgLTEx
LDE5ICsxNSwxOSBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzOgo+ID4gPiAgLSBsZWQtc291cmNlczog
ICAgICAgICAgICAgICBMaXN0IG9mIGVuYWJsZWQgY2hhbm5lbHMgZnJvbSAwIHRvIDUuCj4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICBTZWUKPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9sZWRzL2NvbW1vbi50eHQKPiA+ID4KPiA+ID4gLS0gYXJjLGxlZC1jb25maWctMDog
IHNldHRpbmcgZm9yIHJlZ2lzdGVyIElMRURfQ09ORklHXzAKPiA+ID4gLS0gYXJjLGxlZC1jb25m
aWctMTogIHNldHRpbmcgZm9yIHJlZ2lzdGVyIElMRURfQ09ORklHXzEKPiA+ID4gLS0gYXJjLGRp
bS1mcmVxOiAgICAgICAgICAgICAgUFdNIG1vZGUgZnJlcXVlbmNlIHNldHRpbmcgKGJpdHMgWzM6
MF0KPiA+IHVzZWQpCj4gPiA+IC0tIGFyYyxjb21wLWNvbmZpZzogICBzZXR0aW5nIGZvciByZWdp
c3RlciBDT05GSUdfQ09NUAo+ID4gPiAtLSBhcmMsZmlsdGVyLWNvbmZpZzogc2V0dGluZyBmb3Ig
cmVnaXN0ZXIgRklMVEVSX0NPTkZJRwo+ID4gPiAtLSBhcmMsdHJpbS1jb25maWc6ICAgc2V0dGlu
ZyBmb3IgcmVnaXN0ZXIgSU1BWFRVTkUKPiA+ID4gKy0gYXJjdGljLGxlZC1jb25maWctMDogICAg
ICAgc2V0dGluZyBmb3IgcmVnaXN0ZXIgSUxFRF9DT05GSUdfMAo+ID4gPiArLSBhcmN0aWMsbGVk
LWNvbmZpZy0xOiAgICAgICBzZXR0aW5nIGZvciByZWdpc3RlciBJTEVEX0NPTkZJR18xCj4gPiA+
ICstIGFyY3RpYyxkaW0tZnJlcTogICAgICAgICAgIFBXTSBtb2RlIGZyZXF1ZW5jZSBzZXR0aW5n
IChiaXRzIFszOjBdCj4gPiB1c2VkKQo+ID4gPiArLSBhcmN0aWMsY29tcC1jb25maWc6ICAgICAg
ICBzZXR0aW5nIGZvciByZWdpc3RlciBDT05GSUdfQ09NUAo+ID4gPiArLSBhcmN0aWMsZmlsdGVy
LWNvbmZpZzogICAgICBzZXR0aW5nIGZvciByZWdpc3RlciBGSUxURVJfQ09ORklHCj4gPiA+ICst
IGFyY3RpYyx0cmltLWNvbmZpZzogICAgICAgIHNldHRpbmcgZm9yIHJlZ2lzdGVyIElNQVhUVU5F
Cj4gPiA+Cj4gPiA+ICBOb3RlOiBPcHRpb25hbCBwcm9wZXJ0aWVzIG5vdCBzcGVjaWZpZWQgd2ls
bCBkZWZhdWx0IHRvIHZhbHVlcyBpbiBJQwo+ID4gRVBST00KPiA+ID4KPiA+ID4gIEV4YW1wbGU6
Cj4gPiA+Cj4gPiA+ICBhcmMyYzA2MDhAMzAgewo+ID4gPiAtICAgICBjb21wYXRpYmxlID0gImFy
YyxhcmMyYzA2MDgiOwo+ID4gPiArICAgICBjb21wYXRpYmxlID0gImFyY3RpYyxhcmMyYzA2MDgi
Owo+ID4gPiAgICAgICByZWcgPSA8MHgzMD47Cj4gPiA+ICAgICAgIGRlZmF1bHQtYnJpZ2h0bmVz
cyA9IDw1MDA+Owo+ID4gPiAgICAgICBsYWJlbCA9ICJsY2QtYmFja2xpZ2h0IjsKPiA+ID4gLS0K
PiA+ID4gMi43LjQKPiA+ID4KPiA+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
