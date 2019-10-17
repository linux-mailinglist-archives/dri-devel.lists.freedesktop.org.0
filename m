Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2432DAC76
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 14:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384416EA62;
	Thu, 17 Oct 2019 12:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990E86EA62
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 12:40:59 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id v2so2743541iob.10
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 05:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=abxGIv0wZaO7m6Qh5FMNqXHQVKtoBH/088XCvw7BAp8=;
 b=k60D5W8RooxvZVnYpL+h4bI3807xdrcHx8rgEC+VXuDt8/EVsa2vSYZTnPnW7sQBZC
 kX1XsC/7nB249pOPt74E1DDdiCA9qyieNB2W8GCVTArxqviBHumybFICkWJCXM7t+pgU
 Wseq5ANVCOuh83WqfaMVK/0ewWfEs5ka6A2h8dOKLC6OChntntVXPTX7jM+1bBNeYM2y
 MMlX6q5+X1l6bzWIh9ERjcmLoRGxrB03XoVkj2eOO520EqGeQ1Herpj+7Ig3syFPQtaQ
 VqST0AJNJBcmGof18oL646pqoDNYYtidNASg9UasD/hsSRCV7T26oyRieq71naoFyA2U
 faYw==
X-Gm-Message-State: APjAAAUOsarllkPjSc8L1pXEayKUL2rt8zN2pC6o1oNal/LRUuGmjESt
 1ymibIBDgBH9g9zrLHjsZRNfN17EQ12H2R9+lsjCQ6O0yvM=
X-Google-Smtp-Source: APXvYqwreiYtJbMerdyArqVDMTi1F2M9/b+Gagz4LCqyolhflr4yM8kZe6WOTJBzuf94hKK+D4FFaA/g0w8egKibxIA=
X-Received: by 2002:a5d:83c1:: with SMTP id u1mr2840326ior.78.1571316058583;
 Thu, 17 Oct 2019 05:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <20191017081059.31761-1-u.kleine-koenig@pengutronix.de>
 <20191017114727.fy5tg2kgi6mr2sei@holly.lan>
 <20191017121945.cmcvaffmbd7zydrm@pengutronix.de>
 <CAHCN7xKogdqoLmbbTatPdtLzqz+MKh-jgrHkkCh+YA-bwwOkDA@mail.gmail.com>
In-Reply-To: <CAHCN7xKogdqoLmbbTatPdtLzqz+MKh-jgrHkkCh+YA-bwwOkDA@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 17 Oct 2019 07:40:47 -0500
Message-ID: <CAHCN7xJFDrsqzR2H2mNYhKB8iF7xYWb9kM+HdzukjDix461gsg@mail.gmail.com>
Subject: Re: [PATCH] backlight: pwm_bl: configure pwm only once per backlight
 toggle
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=abxGIv0wZaO7m6Qh5FMNqXHQVKtoBH/088XCvw7BAp8=;
 b=lUdvVWlGBKFjzWFAqABNh/v0XvTmqFXOK0jBZGRUdcAzZeFF6vX0GGnRi70QIBsFur
 KozYFGgEzO+vGkD+EOzB3f2srFJ0w+KcfR1ZvxuqcnLYcpnfVa0vUcjM4HXdDvccVFrd
 NIyZrCT6gB7074/+KslJ9jzAJm2muR+zKobF/t/FS8V65zMgXQfXAba4ULyPf64443Mv
 TpojpnZahziD15HfRm6S/88tHHzwT382faqkW6HEaY1I5l9FL8d1OvhWB/0JmU/hMtcd
 AsD1r1HN1eAd83KG6UHwquwwSvWPAiiSKyBACWP5BYFqbiun48JjtkMda2XFp27zzNGV
 YlFQ==
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sascha Hauer <kernel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgNzozNCBBTSBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIE9jdCAxNywgMjAxOSBhdCA3OjE5IEFNIFV3ZSBLbGVp
bmUtS8O2bmlnCj4gPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4gPgo+
ID4gT24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTI6NDc6MjdQTSArMDEwMCwgRGFuaWVsIFRob21w
c29uIHdyb3RlOgo+ID4gPiBPbiBUaHUsIE9jdCAxNywgMjAxOSBhdCAxMDoxMDo1OUFNICswMjAw
LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiA+ID4gPiBBIHByZXZpb3VzIGNoYW5nZSBpbiB0
aGUgcHdtIGNvcmUgKG5hbWVseSAwMWNjZjkwM2VkZDYgKCJwd206IExldAo+ID4gPiA+IHB3bV9n
ZXRfc3RhdGUoKSByZXR1cm4gdGhlIGxhc3QgaW1wbGVtZW50ZWQgc3RhdGUiKSkgY2hhbmdlZCB0
aGUKPiA+ID4gPiBzZW1hbnRpYyBvZiBwd21fZ2V0X3N0YXRlKCkgYW5kIGRpc2Nsb3NlZCBhbiAo
YXMgaXQgc2VlbXMpIGNvbW1vbgo+ID4gPiA+IHByb2JsZW0gaW4gbG93bGV2ZWwgUFdNIGRyaXZl
cnMuIEJ5IG5vdCByZWx5aW5nIG9uIHRoZSBwZXJpb2QgYW5kIGR1dHkKPiA+ID4gPiBjeWNsZSBi
ZWluZyByZXRyaWV2YWJsZSBmcm9tIGEgZGlzYWJsZWQgUFdNIHRoaXMgdHlwZSBvZiBwcm9ibGVt
IGlzCj4gPiA+ID4gd29ya2VkIGFyb3VuZC4KPiA+ID4gPgo+ID4gPiA+IEFwYXJ0IGZyb20gdGhp
cyBpc3N1ZSBvbmx5IGNhbGxpbmcgdGhlIHB3bV9nZXRfc3RhdGUvcHdtX2FwcGx5X3N0YXRlCj4g
PiA+ID4gY29tYm8gb25jZSBpcyBhbHNvIG1vcmUgZWZmZWN0aXZlLgo+ID4gPgo+ID4gPiBJJ20g
b25seSBpbnRlcmVzdGVkIGluIHRoZSBzZWNvbmQgcGFyYWdyYXBoIGhlcmUuCj4gPiA+Cj4gPiA+
IFRoZXJlIHNlZW1zIHRvIGJlIGEgcmVhc29uYWJsZSBjb25zZW5zdXMgdGhhdCB0aGUgaS5NWDI3
IGFuZCBjcm9zLWVjCj4gPiA+IFBXTSBkcml2ZXJzIHNob3VsZCBiZSBmaXhlZCBmb3IgdGhlIGJl
bmVmaXQgb2Ygb3RoZXIgUFdNIGNsaWVudHMuCj4gPiA+IFNvIHdlIG1ha2UgdGhpcyBjaGFuZ2Ug
YmVjYXVzZSBpdCBtYWtlcyB0aGUgcHdtLWJsIGJldHRlci4uLiBub3QgdG8KPiA+ID4gd29yayBh
cm91bmQgYnVncyA7LSkuCj4gPgo+ID4gVGhhdCdzIGZpbmUsIHN0aWxsIEkgdGhpbmsgaXQncyBm
YWlyIHRvIGV4cGxhaW4gdGhlIG1vdGl2YXRpb24gb2YKPiA+IGNyZWF0aW5nIHRoaXMgcGF0Y2gu
Cj4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwu
YyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCj4gPiA+ID4gaW5kZXggNzQ2ZWVi
YzQxMWRmLi5kZGViZDYyYjM5NzggMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy92aWRlby9i
YWNrbGlnaHQvcHdtX2JsLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9w
d21fYmwuYwo+ID4gPiA+IEBAIC02Nyw0MCArNjIsMjcgQEAgc3RhdGljIHZvaWQgcHdtX2JhY2ts
aWdodF9wb3dlcl9vbihzdHJ1Y3QgcHdtX2JsX2RhdGEgKnBiKQo+ID4gPiA+Cj4gPiA+ID4gIHN0
YXRpYyB2b2lkIHB3bV9iYWNrbGlnaHRfcG93ZXJfb2ZmKHN0cnVjdCBwd21fYmxfZGF0YSAqcGIp
Cj4gPiA+ID4gIHsKPiA+ID4gPiAtICAgc3RydWN0IHB3bV9zdGF0ZSBzdGF0ZTsKPiA+ID4gPiAt
Cj4gPiA+ID4gLSAgIHB3bV9nZXRfc3RhdGUocGItPnB3bSwgJnN0YXRlKTsKPiA+ID4gPiAtICAg
aWYgKCFwYi0+ZW5hYmxlZCkKPiA+ID4gPiAtICAgICAgICAgICByZXR1cm47Cj4gPiA+ID4gLQo+
ID4gPgo+ID4gPiBXaHkgcmVtb3ZlIHRoZSBwYi0+ZW5hYmxlZCBjaGVjaz8gSSB0aG91Z2h0IHRo
YXQgd2FzIHRoZXJlIHRvIGVuc3VyZSB3ZQo+ID4gPiBkb24ndCBtZXNzIHVwIHRoZSByZWd1bGFy
IHJlZmVyZW5jZSBjb3VudHMuCj4gPgo+ID4gSSBoYXZuJ3QgbG9va2VkIHlldCwgYnV0IEkgZ3Vl
c3MgSSBoYXZlIHRvIHJlc3Bpbi4gRXhwZWN0IGEgdjIgbGF0ZXIKPiA+IHRvZGF5Lgo+Cj4gSSB3
b3VsZCBhZ3JlZSB0aGF0IGEgaGlnaC1sZXZlbCBmaXggaXMgYmV0dGVyIHRoYW4gYSBzZXJpZXMg
b2YgbG93Cj4gbGV2ZWwgZHJpdmVyIGZpeGVzLiAgRm9yIHdoYXQgaXRzIHdvcnRoLCB5b3VyIFYx
IHBhdGNoIHdvcmtlZCBmaW5lIG9uCj4gbXkgaS5NWDZRLiAgSSBjYW4gdGVzdCB0aGUgVjIgcGF0
Y2ggd2hlbiBpdHMgcmVhZHkuCgpJIG1heSBoYXZlIHNwb2tlbiB0b28gc29vbi4gIFRoZSBwYXRj
aCBmaXhlcyB0aGUgZGlzcGxheSBpbiB0aGF0IGl0CmNvbWVzIG9uIHdoZW4gaXQgcHJldmlvdXNs
eSBkaWQgbm90LCBidXQgY2hhbmdlcyB0byBicmlnaHRuZXNzIGRvIG5vdAphcHBlYXIgdG8gZG8g
YW55dGhpbmcgYW55bW9yZS4gIEkgZG9uJ3QgaGF2ZSBhbiBvc2NpbGxvc2NvcGUgd2hlcmUgSQph
bSBub3csIHNvIEkgY2Fubm90IHZlcmlmeSB3aGV0aGVyIG9yIG5vdCB0aGUgUFdNIGR1dHkgY3lj
bGUgY2hhbmdlcy4KClRvIG15IGV5ZSwgdGhlIGZvbGxvd2luZyBkbyBub3QgYXBwZWFyIHRvIGNo
YW5nZSB0aGUgYnJpZ2h0bmVzcyBvZiB0aGUgc2NyZWVuOgogICAgIGVjaG8gNyA+IC9zeXMvZGV2
aWNlcy9zb2MwL2JhY2tsaWdodC1sdmRzL2JhY2tsaWdodC9iYWNrbGlnaHQtbHZkcy9icmlnaHRu
ZXNzCiAgICAgZWNobyAyID4gL3N5cy9kZXZpY2VzL3NvYzAvYmFja2xpZ2h0LWx2ZHMvYmFja2xp
Z2h0L2JhY2tsaWdodC1sdmRzL2JyaWdodG5lc3MKICAgICBlY2hvIDUgPiAvc3lzL2RldmljZXMv
c29jMC9iYWNrbGlnaHQtbHZkcy9iYWNrbGlnaHQvYmFja2xpZ2h0LWx2ZHMvYnJpZ2h0bmVzcwoK
CmFkYW0KPgo+IGFkYW0KPiA+Cj4gPiBCZXN0IHJlZ2FyZHMKPiA+IFV3ZQo+ID4KPiA+IC0tCj4g
PiBQZW5ndXRyb25peCBlLksuICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBVd2UgS2xlaW5l
LUvDtm5pZyAgICAgICAgICAgIHwKPiA+IEluZHVzdHJpYWwgTGludXggU29sdXRpb25zICAgICAg
ICAgICAgICAgICB8IGh0dHA6Ly93d3cucGVuZ3V0cm9uaXguZGUvICB8Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
