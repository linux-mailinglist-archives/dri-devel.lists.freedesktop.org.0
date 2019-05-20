Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 638AD23805
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 15:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214C389248;
	Mon, 20 May 2019 13:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE0189248
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 13:30:11 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c77so11845501wmd.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 06:30:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8jmGilw1nCQQmkBhHj38AiUSNpWBZe/sVuRM01rHJv0=;
 b=A4tX65vSbqoCVwuA6onkXVZymQCKy9g9Z5uAE1xG+OSVLdQtrfUCwxVoUh2JvigPxC
 MESTjqRtvsDHUcpm2GbbxHTNlH3m1oFciNli5dp83Ju1HNPyfW5jvwUzDoZBZovYb2YT
 V4sn9UMxb/R835AjivOWw9EUtzNHsbALJIvixcJ8Z2mk+Tfq6TRVvr0b6V5kq0nmufle
 4b+EqUZBsEDCU0yBYyL0JJRtm2bWAYBD/yaRu9ewaHmVJfdJiHbOcTaFSKkk+NZ/cHa/
 19OMG1BoBCj5huJfYGczxWuK6zlEtgZdHR04Duviy+kGCKyIkwwB7R85VgoE45m6DzDl
 h9ZA==
X-Gm-Message-State: APjAAAUx9t83jEeNSkX/7ncTseVnc0ueJWpGShwdaYvADUb3nlxouZJ0
 MAGH7ogOTLZSvVjo4S+tDxdJ5w==
X-Google-Smtp-Source: APXvYqx2txSUvSVKzjvZhfqtdeKg/VLHgRIYD6Rv9nUdsldKd1EgOPFxeK2Xh7cX5NLv9PmgcLKi1Q==
X-Received: by 2002:a1c:7606:: with SMTP id r6mr11647224wmc.25.1558359009976; 
 Mon, 20 May 2019 06:30:09 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id y1sm15465215wma.14.2019.05.20.06.30.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 May 2019 06:30:09 -0700 (PDT)
Date: Mon, 20 May 2019 14:30:07 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: backlight: lm3630a: correct schema validation
Message-ID: <20190520133007.gymbonmq635gp73b@holly.lan>
References: <20190520085846.22320-1-masneyb@onstation.org>
 <CAL_JsqLcycH5e=YT-4AQFo-8O0bosjU7oagCRS5CMTfQNBLrcg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqLcycH5e=YT-4AQFo-8O0bosjU7oagCRS5CMTfQNBLrcg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8jmGilw1nCQQmkBhHj38AiUSNpWBZe/sVuRM01rHJv0=;
 b=FY+xDHdlrGHpESK8d3dY9mKd1ulBFHyvOVNM4E/E1imXiTfV0C2iFc0rfPluiYI9ti
 MkuGQzvux2dG6tG1e+KiV4OUqVQT5Qm7Yy6WB3PkW8ZWeG7UB4NYbi7D93geMjs6ZkGo
 Fx+yt0kZcrFZHxnA90yAfup2DJJZ8Dn6Y3K7hxCTFDbqFjRvkwbaSodfn5WtHGfthJDo
 3PTdSyM8MM33ZMwBaxKztYfimViCP70xCgakknd24OaIpwTnAaIvV6iT+VaeivDs8E23
 4PeY7+bjmcEHI+4pdtdPQ5ty1/iv+0HT0SoZnbwzxt+BwcB8hC4ZCUQeopMbZDFiDxOM
 jy8A==
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
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jonathan Marek <jonathan@marek.ca>, Dan Murphy <dmurphy@ti.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMDg6MTQ6MDNBTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMzo1OSBBTSBCcmlhbiBNYXNuZXkgPG1hc25l
eWJAb25zdGF0aW9uLm9yZz4gd3JvdGU6Cj4gPgo+ID4gVGhlICcjYWRkcmVzcy1jZWxscycgYW5k
ICcjc2l6ZS1jZWxscycgcHJvcGVydGllcyB3ZXJlIG5vdCBkZWZpbmVkIGluCj4gPiB0aGUgbG0z
NjMwYSBiaW5kaW5ncyBhbmQgd291bGQgY2F1c2UgdGhlIGZvbGxvd2luZyBlcnJvciB3aGVuCj4g
PiBhdHRlbXB0aW5nIHRvIHZhbGlkYXRlIHRoZSBleGFtcGxlcyBhZ2FpbnN0IHRoZSBzY2hlbWE6
Cj4gPgo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0
L2xtMzYzMGEtYmFja2xpZ2h0LmV4YW1wbGUuZHQueWFtbDoKPiA+ICcjYWRkcmVzcy1jZWxscycs
ICcjc2l6ZS1jZWxscycgZG8gbm90IG1hdGNoIGFueSBvZiB0aGUgcmVnZXhlczoKPiA+ICdebGVk
QFswMV0kJywgJ3BpbmN0cmwtWzAtOV0rJwo+ID4KPiA+IENvcnJlY3QgdGhpcyBieSBhZGRpbmcg
dGhvc2UgdHdvIHByb3BlcnRpZXMuCj4gPgo+ID4gV2hpbGUgd2UncmUgaGVyZSwgbW92ZSB0aGUg
dGksbGluZWFyLW1hcHBpbmctbW9kZSBwcm9wZXJ0eSB0byB0aGUKPiA+IGxlZEBbMDFdIGNoaWxk
IG5vZGVzIHRvIGNvcnJlY3QgdGhlIGZvbGxvd2luZyB2YWxpZGF0aW9uIGVycm9yOgo+ID4KPiA+
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sbTM2MzBh
LWJhY2tsaWdodC5leGFtcGxlLmR0LnlhbWw6Cj4gPiBsZWRAMDogJ3RpLGxpbmVhci1tYXBwaW5n
LW1vZGUnIGRvZXMgbm90IG1hdGNoIGFueSBvZiB0aGUgcmVnZXhlczoKPiA+ICdwaW5jdHJsLVsw
LTldKycKPiA+Cj4gPiBGaXhlczogMzJmY2I3NWM2NmEwICgiZHQtYmluZGluZ3M6IGJhY2tsaWdo
dDogQWRkIGxtMzYzMGEgYmluZGluZ3MiKQo+ID4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5
IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+Cj4gPiBSZXBvcnRlZC1ieTogUm9iIEhlcnJpbmcgPHJv
YmgrZHRAa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gIC4uLi9sZWRzL2JhY2tsaWdodC9sbTM2MzBh
LWJhY2tsaWdodC55YW1sICAgICB8IDIwICsrKysrKysrKysrKystLS0tLS0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiBSZXZpZXdlZC1i
eTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KCkFja2VkLWJ5OiBEYW5pZWwgVGhvbXBz
b24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
