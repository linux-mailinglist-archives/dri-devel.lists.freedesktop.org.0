Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B416F1A1B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 16:34:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3576E22F;
	Wed,  6 Nov 2019 15:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376276E22F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 15:34:25 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E25F221D79
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 15:34:24 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id i19so15837600qki.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 07:34:24 -0800 (PST)
X-Gm-Message-State: APjAAAX6+TdVC08HX6QQ1EVGgbYTGW6xsaUfrOUFhibUsCOEd89j2hvk
 XlSfP6pB9FicM4SUY0GIkkl/IRDdECYhSW8XWA==
X-Google-Smtp-Source: APXvYqw9sZsv2T4oRf/Kp1rPs5zLb4jFoqRUQy1D9khdGgEpEV2otZx+yv/nP+agw/RJymCxuNf+KXq8PP0l1j+ppZs=
X-Received: by 2002:a05:620a:226:: with SMTP id
 u6mr2467840qkm.393.1573054464031; 
 Wed, 06 Nov 2019 07:34:24 -0800 (PST)
MIME-Version: 1.0
References: <20191104013932.22505-1-afaerber@suse.de>
 <20191104013932.22505-2-afaerber@suse.de>
 <CAL_JsqL3NOstoa5ZY1JE9e3Ay=WTmz153H-KbHErhi-GBX-5GA@mail.gmail.com>
 <82d17114302562e0c553e2ea936974f77734e86b.camel@suse.de>
In-Reply-To: <82d17114302562e0c553e2ea936974f77734e86b.camel@suse.de>
From: Rob Herring <robh@kernel.org>
Date: Wed, 6 Nov 2019 09:34:12 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLDFefWVdiPuAktctuBpBeOvG-OVhX2aZn=UaiN55nodg@mail.gmail.com>
Message-ID: <CAL_JsqLDFefWVdiPuAktctuBpBeOvG-OVhX2aZn=UaiN55nodg@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: gpu: mali-midgard: Tidy up conversion to
 YAML
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573054465;
 bh=7o0q1tVU34dCkR+noOARbHQNLo/UWxe38206TY8hDCQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CoUNr07iSKhqHPQYnHgovAiFPeBTlPbuKlIlyB1ltw17DY4h0GUk69z0sH9UCrkwg
 QjSAKTQgidRAO2Sn0st+dAqdeImPVslmG40Ug8tl5jdYPapSS3OLGYLaJqd3ZYOxMC
 e/fp5kQL9QBc0OXKGEMS4kFmWLHFdgdIF/OprUEE=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Guillaume Gardet <guillaume.gardet@arm.com>,
 linux-realtek-soc@lists.infradead.org, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 LAKML <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgNiwgMjAxOSBhdCA5OjA3IEFNIEFuZHJlYXMgRsOkcmJlciA8YWZhZXJiZXJA
c3VzZS5kZT4gd3JvdGU6Cj4KPiBBbSBNaXR0d29jaCwgZGVuIDA2LjExLjIwMTksIDA4OjI0IC0w
NjAwIHNjaHJpZWIgUm9iIEhlcnJpbmc6Cj4gPiBPbiBTdW4sIE5vdiAzLCAyMDE5IGF0IDc6NDAg
UE0gQW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNlLmRlPgo+ID4gd3JvdGU6Cj4gPiA+IElu
c3RlYWQgb2YgZ3JvdXBpbmcgYWxwaGFiZXRpY2FsbHkgYnkgdGhpcmQtcGFydHkgdmVuZG9yLCBs
ZWFkaW5nCj4gPiA+IHRvCj4gPiA+IG9uZS1lbGVtZW50IGVudW1zLCBzb3J0IGJ5IE1hbGkgbW9k
ZWwgbnVtYmVyLCBhcyBkb25lIGZvciBVdGdhcmQuCj4gPiA+Cj4gPiA+IFRoaXMgYWxyZWFkeSBh
bGxvd3MgdXMgdG8gZGUtZHVwbGljYXRlIHR3byAiYXJtLG1hbGktdDc2MCIgc2VjdGlvbnMKPiA+
ID4gYW5kCj4gPiA+IHdpbGwgbWFrZSBpdCBlYXNpZXIgdG8gYWRkIG5ldyB2ZW5kb3IgY29tcGF0
aWJsZXMuCj4gPgo+ID4gVGhhdCB3YXMgdGhlIGludGVudC4gTm90IHN1cmUgaG93IEkgbWVzc2Vk
IHRoYXQgdXAuLi4KPiA+Cj4gPiBUaGlzIHBhdGNoIGlzIHByb2JsZW1hdGljIGJlY2F1c2UgdGhl
cmUncyBjaGFuZ2VzIGluIGFybS1zb2MganVuby9kdAo+ID4gYnJhbmNoIGFuZCB0aGVyZSdzIG5v
dyBhIHBhdGNoIGZvciBleHlub3M1NDIwICh0NjI4KS4gSSdkIHByb3Bvc2UgSQo+ID4gYXBwbHkg
dGhpcyBzdWNoIHRoYXQgd2UgZG9uJ3QgZ2V0IGEgbWVyZ2UgY29uZmxpY3Qgd2l0aCBqdW5vL2R0
IGFuZAo+ID4gd2UKPiA+IGZpbmlzaCByZXNvcnRpbmcgYWZ0ZXIgcmMxIChvciB3aGVuIGJvdGgg
YnJhbmNoZXMgYXJlIGluIExpbnVzJwo+ID4gdHJlZSkuCj4KPiBUaGlzIHNlcmllcyBoYXMgZGVw
ZW5kZW5jaWVzIGZvciB0aGUgUmVhbHRlay1zaWRlIFJGQyBwYXRjaGVzIGFuZCBpcwo+IG5vdCB5
ZXQgcmVhZHkgdG8gbWVyZ2UsIHNvIHlvdSBjYW4gdGFrZSB0aGlzIHByZXAgUEFUQ0ggdGhyb3Vn
aCB5b3VyCj4gdHJlZSBmb3IgdjUuNiBwcm9iYWJseSwgb3IgZmVlbCBmcmVlIHRvIHJlYmFzZS9y
ZXdvcmsgYXMgeW91IHNlZSBmaXQgLQo+IEknZCBqdXN0IGFwcHJlY2lhdGUgYmVpbmcgY3JlZGl0
ZWQgYXQgbGVhc3QgdmlhIFJlcG9ydGVkLWJ5LiA6KQoKSSB3YXMgYXNzdW1pbmcgdGhlIG5vbi1S
RkMgcGF0Y2hlcyBhcmUgZ29vZCB0byBnbywgc28gSSB3YXMgZ29pbmcgdG8KcGljayB1cCAxLCAy
LCBhbmQgNy4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
