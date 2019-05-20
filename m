Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B31236C2
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 15:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788B589230;
	Mon, 20 May 2019 13:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FC189230
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 13:14:17 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AC7EB217D4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 13:14:16 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id a17so16223286qth.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 06:14:16 -0700 (PDT)
X-Gm-Message-State: APjAAAXm+pb/lYMhS4ovOeJJnGnvwN8RVGbqus7/J79vo8v7YP/rJB8+
 jvgx0p6IxzV+5su10u0LlYYpH1thbHu1Z7MYWQ==
X-Google-Smtp-Source: APXvYqxS8HQm36uvnppBXzxLCzjnnzulxIHDgL8ac9/Ttgr/OjP7pC28xyb4pOndJeMh7bl1mZwE0tcaXjAw+ocCAzE=
X-Received: by 2002:ac8:3884:: with SMTP id f4mr64856728qtc.300.1558358055837; 
 Mon, 20 May 2019 06:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190520085846.22320-1-masneyb@onstation.org>
In-Reply-To: <20190520085846.22320-1-masneyb@onstation.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 20 May 2019 08:14:03 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLcycH5e=YT-4AQFo-8O0bosjU7oagCRS5CMTfQNBLrcg@mail.gmail.com>
Message-ID: <CAL_JsqLcycH5e=YT-4AQFo-8O0bosjU7oagCRS5CMTfQNBLrcg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: backlight: lm3630a: correct schema validation
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1558358056;
 bh=ArhYqFidQbDseOeh6RGnVwM2C9x89IIUj6IxarCU9Xo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lvQIveQUQlHl8qUCg4Mt9xmQCilab7e4NlHCUz729LxcZ3xS7QcfrjYUGVOGctIGN
 1cBCrrX9hkEuEJfzgMjmKGHA3hdCC+IJdBvOr5ZOKEpvpOrQBfBHcSKD3F6hY0wJe8
 Cw2arMGuA2eiaYQG/5C6YjlESDKbTMQQaDaiCYXs=
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMzo1OSBBTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25z
dGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBUaGUgJyNhZGRyZXNzLWNlbGxzJyBhbmQgJyNzaXplLWNl
bGxzJyBwcm9wZXJ0aWVzIHdlcmUgbm90IGRlZmluZWQgaW4KPiB0aGUgbG0zNjMwYSBiaW5kaW5n
cyBhbmQgd291bGQgY2F1c2UgdGhlIGZvbGxvd2luZyBlcnJvciB3aGVuCj4gYXR0ZW1wdGluZyB0
byB2YWxpZGF0ZSB0aGUgZXhhbXBsZXMgYWdhaW5zdCB0aGUgc2NoZW1hOgo+Cj4gRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0
LmV4YW1wbGUuZHQueWFtbDoKPiAnI2FkZHJlc3MtY2VsbHMnLCAnI3NpemUtY2VsbHMnIGRvIG5v
dCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6Cj4gJ15sZWRAWzAxXSQnLCAncGluY3RybC1bMC05
XSsnCj4KPiBDb3JyZWN0IHRoaXMgYnkgYWRkaW5nIHRob3NlIHR3byBwcm9wZXJ0aWVzLgo+Cj4g
V2hpbGUgd2UncmUgaGVyZSwgbW92ZSB0aGUgdGksbGluZWFyLW1hcHBpbmctbW9kZSBwcm9wZXJ0
eSB0byB0aGUKPiBsZWRAWzAxXSBjaGlsZCBub2RlcyB0byBjb3JyZWN0IHRoZSBmb2xsb3dpbmcg
dmFsaWRhdGlvbiBlcnJvcjoKPgo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9s
ZWRzL2JhY2tsaWdodC9sbTM2MzBhLWJhY2tsaWdodC5leGFtcGxlLmR0LnlhbWw6Cj4gbGVkQDA6
ICd0aSxsaW5lYXItbWFwcGluZy1tb2RlJyBkb2VzIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4
ZXM6Cj4gJ3BpbmN0cmwtWzAtOV0rJwo+Cj4gRml4ZXM6IDMyZmNiNzVjNjZhMCAoImR0LWJpbmRp
bmdzOiBiYWNrbGlnaHQ6IEFkZCBsbTM2MzBhIGJpbmRpbmdzIikKPiBTaWduZWQtb2ZmLWJ5OiBC
cmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4KPiBSZXBvcnRlZC1ieTogUm9iIEhl
cnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4KPiAtLS0KPiAgLi4uL2xlZHMvYmFja2xpZ2h0L2xt
MzYzMGEtYmFja2xpZ2h0LnlhbWwgICAgIHwgMjAgKysrKysrKysrKysrKy0tLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
