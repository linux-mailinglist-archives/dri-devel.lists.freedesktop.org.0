Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0921E5452
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 21:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDEC6EB68;
	Fri, 25 Oct 2019 19:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC496EB68
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 19:25:20 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id c7so2825086otm.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 12:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Hvp+6pcbAuhWD78ad7Hbl9tESo5LnkRCFZND+kn0p/8=;
 b=hC6c7++cnLtw44vDOOe1HRLA1I3DYNxJDKAA9stNsKu/VD9YQSUOClEe5mnRqtRZa5
 YkJTwML11qLgy+HKouN86SM+ptdyCXOXih1KnjcsdeBepUpC17Pr6vdr8Gnl/lmzzNyW
 x50pEFvYvQpH94oNGGongEOqsMe6weMY3jPHio6dT2H1M+BpovY2IK5/1e6BoIlrEAz8
 10jyW4nT6zhsfZfN0QR59chN+HshIGJ1aIPL43vF7MFfSqOEhiUc4j/N5uLLMSpWppuu
 zvocQ862xYJpE42QQmld4RVlfY73egNAQZ3CZ2DW+x/eubpIPJt9s+958fPkz1qqK1Ph
 jyiw==
X-Gm-Message-State: APjAAAV2z4sPJxDGgGWDI+I65XN7ypP3lGH2XGOIOCv6mOqeQ28SXXKj
 38oky+Qp4aKbDIk3ZKCBYA==
X-Google-Smtp-Source: APXvYqzMIR897eobjV14Fci7YCLpLBY9FpCOUumYwNM3rjseujxVArRe9sgOjUxouSEjyyC+cwGpAA==
X-Received: by 2002:a05:6830:2055:: with SMTP id
 f21mr3963388otp.26.1572031519782; 
 Fri, 25 Oct 2019 12:25:19 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s3sm1010825otk.64.2019.10.25.12.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 12:25:19 -0700 (PDT)
Date: Fri, 25 Oct 2019 14:25:18 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3 v4] drm/panel: Add DT bindings for Sony ACX424AKP
Message-ID: <20191025192518.GA19549@bogus>
References: <20191024114305.15581-1-linus.walleij@linaro.org>
 <20191024114305.15581-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024114305.15581-2-linus.walleij@linaro.org>
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

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMDE6NDM6MDRQTSArMDIwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBUaGlzIGFkZHMgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRoZSBTb255IEFDWDQy
NEFLUCBwYW5lbC4KPiBMZXQncyB1c2UgWUFNTC4KCkFsc28gYnJva2VuLiBSdW4gJ21ha2UgZHRf
YmluZGluZ19jaGVjaycuCgo+IAo+IENjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwo+IFNp
Z25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiAt
LS0KPiBDaGFuZ2VMb2cgdjMtPnY0Ogo+IC0gQWRqdXN0IHRvIGFkanVzdGVkIERTSSBiaW5kaW5n
cy4KPiBDaGFuZ2VMb2cgdjItPnYzOgo+IC0gUHV0IHRoZSBleGFtcGxlIGluc2lkZSBhIGRzaS1j
b250cm9sbGVyIHNvIHdlIGhhdmUgYSBjb21wbGV0ZQo+ICAgZXhhbXBsZSB0aGF0IHZlcmlmaWVz
IHRvIHRoZSBEU0kgcGFuZWwgZ2VuZXJpYyBiaW5kaW5nLgo+IENoYW5nZUxvZyB2MS0+djI6Cj4g
LSBTdWdnZXN0IGEgc3RhbmQtYWxvbmUgWUFNTCBiaW5kaW5ncyBmaWxlIGZvciBEU0kgcGFuZWxz
IGluCj4gICBhIHNlcGFyYXRlIHBhdGNoLCBhbmQgdXNlIHRoYXQgdG8gcmVmZXJlbmNlIHRoZQo+
ICAgYm9vbGVhbiAiZW5mb3JjZS12aWRlby1tb2RlIiBhdHRyaWJ1dGUgZm9yIERTSSBwYW5lbHMK
PiAtLS0KPiAgLi4uL2Rpc3BsYXkvcGFuZWwvc29ueSxhY3g0MjRha3AueWFtbCAgICAgICAgIHwg
NDkgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygr
KQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvcGFuZWwvc29ueSxhY3g0MjRha3AueWFtbAo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zb255LGFjeDQyNGFr
cC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwv
c29ueSxhY3g0MjRha3AueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAw
MDAwMDAwLi5hMmY0OWI5YTU5NTgKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc29ueSxhY3g0MjRha3AueWFtbAo+
IEBAIC0wLDAgKzEsNDkgQEAKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAt
b25seSBPUiBCU0QtMi1DbGF1c2UpCj4gKyVZQU1MIDEuMgo+ICstLS0KPiArJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVsL3NvbnksYWN4NDI0YWtwLnlhbWwj
Cj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1s
Iwo+ICsKPiArdGl0bGU6IFNvbnkgQUNYNDI0QUtQIDQiIDQ4MHg4NjQgQU1PTEVEIHBhbmVsCj4g
Kwo+ICttYWludGFpbmVyczoKPiArICAtIExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGlu
YXJvLm9yZz4KPiArCj4gK2FsbE9mOgo+ICsgIC0gJHJlZjogcGFuZWwtY29tbW9uLnlhbWwjCj4g
KyAgLSAkcmVmOiAuLi9kc2ktY29udHJvbGxlci55YW1sIwoKVGhpcyBpcyB3cm9uZyBub3cgYmVj
YXVzZSBpdCBhcHBsaWVzIHRvIHRoZSBjb250cm9sbGVyIG5vZGUsIG5vdCB0aGUgCnBhbmVsIG5v
ZGUuIElPVywgRFNJIGNvbnRyb2xsZXJzIG5lZWQgdG8gaW5jbHVkZSBpdC4KCj4gKwo+ICtwcm9w
ZXJ0aWVzOgo+ICsgIGNvbXBhdGlibGU6Cj4gKyAgICBjb25zdDogc29ueSxhY3g0MjRha3AKPiAr
ICByZWc6IHRydWUKPiArICBwb3J0OiB0cnVlCj4gKyAgcmVzZXQtZ3Bpb3M6IHRydWUKPiArICB2
ZGRpLXN1cHBseToKPiArICAgICBkZXNjcmlwdGlvbjogcmVndWxhdG9yIHRoYXQgc3VwcGxpZXMg
dGhlIHZkZGkgdm9sdGFnZQo+ICsgIGVuZm9yY2UtdmlkZW8tbW9kZTogdHJ1ZQo+ICsKPiArcmVx
dWlyZWQ6Cj4gKyAgLSBjb21wYXRpYmxlCj4gKyAgLSByZWcKPiArICAtIHBvcnQKPiArICAtIHJl
c2V0LWdwaW9zCj4gKyAgLSBwb3dlci1zdXBwbHkKPiArCj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVz
OiBmYWxzZQo+ICsKPiArZXhhbXBsZXM6Cj4gKyAgLSB8Cj4gKyAgICBkc2ktY29udHJvbGxlckAw
IHsKCnVuaXQtYWRkcmVzcyB3aXRob3V0ICdyZWcnLi4uCgo+ICsgICAgICAgIGNvbXBhdGlibGUg
PSAiZm9vIjsKPiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiArICAgICAgICAjc2l6
ZS1jZWxscyA9IDwwPjsKPiArICAgICAgICBwYW5lbEAwIHsKPiArICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJzb255LGFjeDQyNGFrcCI7Cj4gKyAgICAgICAgICAgIHJlZyA9IDwwPjsKPiArICAg
ICAgICAgICAgdmRkaS1zdXBwbHkgPSA8JmZvbz47Cj4gKyAgICAgICAgICAgIHJlc2V0LWdwaW9z
ID0gPCZmb29fZ3BpbyAwIEdQSU9fQUNUSVZFX0xPVz47Cj4gKyAgICAgICAgfTsKPiArICAgIH07
Cj4gKwo+ICsuLi4KPiBcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKClNob3VsZCBmaXggdGhp
cy4uLgoKPiAtLSAKPiAyLjIxLjAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
