Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C1E41CF0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:56:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5088909F;
	Wed, 12 Jun 2019 06:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D1C890C9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 16:39:10 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id b11so9815034lfa.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 09:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RgyPf7xhx0YF0w9Kty/80UkxGW/cNJhmecxkZGC4Svg=;
 b=rHgsyOntsPP8iy6HwYOcRmbhMp6uQsDssABBQ057/GrtKOa+Ad+zaWPons9XtMIWNq
 PrsXkEi0gJCJ3Bu8jjBqmyZMs10NENmCS+or0KPfWZ1Es+DZYdrwLyN7nfxYci1vOGuW
 DbVo9opeK95zuLGGfytGi/ge9W8MXPp8XzuCan5DyOT2c2FOVVHdeUszjfaVSnKmuyKC
 E6n1QVh6kGEgm+m80CbjfU0rH0mXyXjL/0Kgt9FzxXcnbSgVOhzhykdBKQ7LTgUajoI8
 Esg992BCLV9Ugk+Jt+E83vKrF+UwWxN2QZCvVGaLvjly1LByM8JacxnoKad6Hex4MNAu
 Bafw==
X-Gm-Message-State: APjAAAUj6+93Tb+Q14EbwBPbb/Jh/YwBuqY+dt4PaU4vGMelixOOAq/9
 Gdr9JOp4fFGbulk9YgiKbjyISvPGjWwVb8BiRu4T3FcM+3PfmA==
X-Google-Smtp-Source: APXvYqz+8HsvC2fZeq6JGexwZBxWKw0IGtco6wwqGIYyL/OdqZf9E69/kPyFOQ1Wtpf5LQTIPeOKLiFAWfBQYsb8+YM=
X-Received: by 2002:a19:c383:: with SMTP id t125mr31681402lff.89.1560270528359; 
 Tue, 11 Jun 2019 09:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190606094722.23816-1-anders.roxell@linaro.org>
 <d6b79ee0-07c6-ad81-16b0-8cf929cc214d@xs4all.nl>
 <CADYN=9KY5=FzrkC7MKj9QnG-eM1NVuL00w8Xv4yU2r05rhr7WQ@mail.gmail.com>
 <c2ff2c77-5c14-4bc4-f59c-7012d272ec76@thinci.com>
 <1560240943.13886.1.camel@pengutronix.de>
 <221c8ef8-7adc-4383-93c9-9031dca590f0@xs4all.nl>
 <CADYN=9K7GwPGM_Eh5q-OZ9rcEPAjXw4BXy-m3a=QxmGuVruCUw@mail.gmail.com>
 <CAAEAJfC9vja5WwsNc5+MTVHLFg_P3zG=OZt_CuRR5eG-3iWD9Q@mail.gmail.com>
In-Reply-To: <CAAEAJfC9vja5WwsNc5+MTVHLFg_P3zG=OZt_CuRR5eG-3iWD9Q@mail.gmail.com>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Tue, 11 Jun 2019 18:28:37 +0200
Message-ID: <CADYN=9L36CadXu2csbQhvey=20NTte-a+a8i08w=pP-+VdTuLA@mail.gmail.com>
Subject: Re: [PATCH 5/8] drivers: media: coda: fix warning same module names
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=RgyPf7xhx0YF0w9Kty/80UkxGW/cNJhmecxkZGC4Svg=;
 b=Wy6GLE/bRjVgzVg3lTBzcxvgONy0/gxFk0wNAyFPNhLKb1zkqgi7IORqDn/A5oMhNs
 P1N7dtfcmcAozuWE5Eb3UlefyJfoLU/vDMgiMI3gdS0x+DBehpksepzE3rG6XpxcTQTL
 dgguk5hn73V7XtY9m418kM424zKdGmSeZiwHBMjROl0RJXauPuHC4yXQZJhkON6lbL4x
 8yP5dVjBuymlWB96zkGHGcjBVzztPUFGpPcNcVrKQyhj8zt9gsA+MYw/a7H4tw2+tBeS
 72NhJJT+iv7ymfMLyx7RYScRS52teqvNNZh+H661tbd0KCYPYAwPMSB88JYKm6t07qyn
 5NRA==
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
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Lee Jones <lee.jones@linaro.org>,
 "marex@denx.de" <marex@denx.de>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "vivien.didelot@gmail.com" <vivien.didelot@gmail.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Networking <netdev@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Matt Redfearn <matt.redfearn@thinci.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 David Miller <davem@davemloft.net>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMSBKdW4gMjAxOSBhdCAxODoxOCwgRXplcXVpZWwgR2FyY2lhCjxlemVxdWllbEB2
YW5ndWFyZGlhc3VyLmNvbS5hcj4gd3JvdGU6Cj4KPgo+Cj4gT24gVHVlLCBKdW4gMTEsIDIwMTks
IDE6MDEgUE0gQW5kZXJzIFJveGVsbCA8YW5kZXJzLnJveGVsbEBsaW5hcm8ub3JnPiB3cm90ZToK
Pj4KPj4gT24gVHVlLCAxMSBKdW4gMjAxOSBhdCAxMDoyMSwgSGFucyBWZXJrdWlsIDxodmVya3Vp
bEB4czRhbGwubmw+IHdyb3RlOgo+PiA+Cj4+ID4gT24gNi8xMS8xOSAxMDoxNSBBTSwgUGhpbGlw
cCBaYWJlbCB3cm90ZToKPj4gPiA+IEhpLAo+PiA+ID4KPj4gPiA+IE9uIE1vbiwgMjAxOS0wNi0x
MCBhdCAxMzoxNCArMDAwMCwgTWF0dCBSZWRmZWFybiB3cm90ZToKPj4gPiA+Pgo+PiA+ID4+IE9u
IDEwLzA2LzIwMTkgMTQ6MDMsIEFuZGVycyBSb3hlbGwgd3JvdGU6Cj4+ID4gPj4+IE9uIFRodSwg
NiBKdW4gMjAxOSBhdCAxMjoxMywgSGFucyBWZXJrdWlsIDxodmVya3VpbEB4czRhbGwubmw+IHdy
b3RlOgo+PiA+ID4+Pj4KPj4gPiA+Pj4+IE9uIDYvNi8xOSAxMTo0NyBBTSwgQW5kZXJzIFJveGVs
bCB3cm90ZToKPj4gPiA+Pj4+PiBXaGVuIGJ1aWxkaW5nIHdpdGggQ09ORklHX1ZJREVPX0NPREEg
YW5kIENPTkZJR19DT0RBX0ZTIGVuYWJsZWQgYXMKPj4gPiA+Pj4+PiBsb2FkYWJsZSBtb2R1bGVz
LCB3ZSBzZWUgdGhlIGZvbGxvd2luZyB3YXJuaW5nOgo+PiA+ID4+Pj4+Cj4+ID4gPj4+Pj4gd2Fy
bmluZzogc2FtZSBtb2R1bGUgbmFtZXMgZm91bmQ6Cj4+ID4gPj4+Pj4gICAgZnMvY29kYS9jb2Rh
LmtvCj4+ID4gPj4+Pj4gICAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jb2RhL2NvZGEua28KPj4g
PiA+Pj4+Pgo+PiA+ID4+Pj4+IFJld29yayBzbyBtZWRpYSBjb2RhIG1hdGNoZXMgdGhlIGNvbmZp
ZyBmcmFnbWVudC4gTGVhdmluZyBDT0RBX0ZTIGFzIGlzCj4+ID4gPj4+Pj4gc2luY2UgdGhhdHMg
YSB3ZWxsIGtub3duIG1vZHVsZS4KPj4gPiA+Pj4+Pgo+PiA+ID4+Pj4+IFNpZ25lZC1vZmYtYnk6
IEFuZGVycyBSb3hlbGwgPGFuZGVycy5yb3hlbGxAbGluYXJvLm9yZz4KPj4gPiA+Pj4+PiAtLS0K
Pj4gPiA+Pj4+PiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY29kYS9NYWtlZmlsZSB8IDQgKyst
LQo+PiA+ID4+Pj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPj4gPiA+Pj4+Pgo+PiA+ID4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL2NvZGEvTWFrZWZpbGUgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2NvZGEvTWFrZWZp
bGUKPj4gPiA+Pj4+PiBpbmRleCA1NGU5YTczYTkyYWIuLjU4OGU2YmY3YzE5MCAxMDA2NDQKPj4g
PiA+Pj4+PiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2NvZGEvTWFrZWZpbGUKPj4gPiA+
Pj4+PiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2NvZGEvTWFrZWZpbGUKPj4gPiA+Pj4+
PiBAQCAtMSw2ICsxLDYgQEAKPj4gPiA+Pj4+PiAgICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb25seQo+PiA+ID4+Pj4+Cj4+ID4gPj4+Pj4gLWNvZGEtb2JqcyA6PSBjb2RhLWNv
bW1vbi5vIGNvZGEtYml0Lm8gY29kYS1nZGkubyBjb2RhLWgyNjQubyBjb2RhLW1wZWcyLm8gY29k
YS1tcGVnNC5vIGNvZGEtanBlZy5vCj4+ID4gPj4+Pj4gK3ZpZGVvLWNvZGEtb2JqcyA6PSBjb2Rh
LWNvbW1vbi5vIGNvZGEtYml0Lm8gY29kYS1nZGkubyBjb2RhLWgyNjQubyBjb2RhLW1wZWcyLm8g
Y29kYS1tcGVnNC5vIGNvZGEtanBlZy5vCj4+ID4gPj4+Pj4KPj4gPiA+Pj4+PiAtb2JqLSQoQ09O
RklHX1ZJREVPX0NPREEpICs9IGNvZGEubwo+PiA+ID4+Pj4+ICtvYmotJChDT05GSUdfVklERU9f
Q09EQSkgKz0gdmlkZW8tY29kYS5vCj4+ID4gPj4+Pgo+PiA+ID4+Pj4gSG93IGFib3V0IGlteC1j
b2RhPyB2aWRlby1jb2RhIHN1Z2dlc3RzIGl0IGlzIHBhcnQgb2YgdGhlIHZpZGVvIHN1YnN5c3Rl
bSwKPj4gPiA+Pj4+IHdoaWNoIGl0IGlzbid0Lgo+PiA+ID4+Pgo+PiA+ID4+PiBJJ2xsIHJlc2Vu
ZCBhIHYyIHNob3J0bHkgd2l0aCBpbXgtY29kYSBpbnN0ZWFkLgo+PiA+ID4KPj4gPiA+IEknZCBi
ZSBpbiBmYXZvciBvZiBjYWxsaW5nIGl0ICJjb2RhLXZwdSIgaW5zdGVhZC4KPj4gPgo+PiA+IEZp
bmUgYnkgbWUhCj4+ID4KPj4gPiA+Cj4+ID4gPj4gV2hhdCBhYm91dCBvdGhlciB2ZW5kb3IgU29D
cyBpbXBsZW1lbnRpbmcgdGhlIENvZGEgSVAgYmxvY2sgd2hpY2ggYXJlCj4+ID4gPj4gbm90IGFu
IGlteD8gSSdkIHByZWZlciBhIG1vcmUgZ2VuZXJpYyBuYW1lIC0gbWF5YmUgbWVkaWEtY29kYS4K
Pj4gPiA+Cj4+ID4gPiBSaWdodCwgdGhpcyBkcml2ZXIgY2FuIGJlIHVzZWQgb24gb3RoZXIgU29D
cyBbMV0uCj4+ID4KPj4gPiBHb29kIHBvaW50Lgo+Pgo+PiBPSywgc28gSSdsbCBjaGFuZ2UgaXQg
dG8gJ21lZGlhLWNvZGEnLgo+Pgo+Pgo+Pgo+Cj4gQXMgc3VnZ2VzdGVkIGJ5IFBoaWxpcHAsIGNv
ZGEtdnB1IHNlZW1zIHRoZSBtb3N0IGFjY3VyYXRlIG5hbWUuCgp1cmdoLCB0aGF0IGNvcnJlY3Qu
CgpUaGFua3MsCkFuZGVycwoKPgo+IFRoYW5rcywKPiBFemVxdWllbAo+Cj4KPgo+PiBDaGVlcnMs
Cj4+IEFuZGVycwo+Pgo+PiA+Cj4+ID4gUmVnYXJkcywKPj4gPgo+PiA+ICAgICAgICAgSGFucwo+
PiA+Cj4+ID4gPgo+PiA+ID4gWzFdIGh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20vbGludXgt
bWVkaWFAdmdlci5rZXJuZWwub3JnL21zZzE0NjQ5OC5odG1sCj4+ID4gPgo+PiA+ID4gcmVnYXJk
cwo+PiA+ID4gUGhpbGlwcAo+PiA+ID4KPj4gPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
