Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EC715E21
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 09:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD89889DF7;
	Tue,  7 May 2019 07:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A804989DA2
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 06:38:51 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id g3so8116728pfi.4
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 23:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wWtp0jnKgCQgvYHJQP0mFqZsKhLPzrO6V1C+32VkFts=;
 b=JByNSdv8JrNe/no5kYzmNVNIUa6CJn8HmiaXY7RfwLGbvl47hRjQ/dmGychRYa1HXz
 mE2bXRI5mRGhNWFMqoiyh6qMbGl7d7wGYXSVG8zYSEEDugGAXzFoV3DyAHToOdaKd4d3
 VV8jfWV2MLcs0lK1YYxoS68awcvKWhmCcr9+SMSQV9reejSvgruWHoH6aYeXJ1W+bCFb
 dPlXCoknmz/+25QonDquRVC+Jz1xCJXqBeE+bBBXSd6mto80kSUdTBHNsQ6GivvLS2Xi
 sl2Ejmat8mgNHjaTq92sPZjLdlYBj2Fk37MZk/2Yt2LfWngL5+26gZtR/YexHcrEiYxb
 CX8Q==
X-Gm-Message-State: APjAAAW0AM9Gb0/jMdsQiE0qOkX6pmsI8CKyG8qgOkbgnBgVstNkQp7d
 UBKsg+g92KEfeGFlhGON654QaQ==
X-Google-Smtp-Source: APXvYqwY91xBBVJv/756Xx6HEZCctbmrzp1jJLE/1sryCLnIM8LwzomLH62O4ev8IQJQJLg+ufVU8g==
X-Received: by 2002:a62:6842:: with SMTP id d63mr39964616pfc.9.1557211130015; 
 Mon, 06 May 2019 23:38:50 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id f2sm18843390pgc.30.2019.05.06.23.38.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 May 2019 23:38:49 -0700 (PDT)
Date: Mon, 6 May 2019 23:39:02 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH RFC 4/6] ARM: dts: msm8974: add display support
Message-ID: <20190507063902.GA2085@tuxbook-pro>
References: <20190505130413.32253-1-masneyb@onstation.org>
 <20190505130413.32253-5-masneyb@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190505130413.32253-5-masneyb@onstation.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Tue, 07 May 2019 07:20:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wWtp0jnKgCQgvYHJQP0mFqZsKhLPzrO6V1C+32VkFts=;
 b=nYKXcx42aO3MAUePdnRAiJ9/V6lyE5FcjpoFwRX8BMynr8FAmMbfC31a5SOnBmTMYP
 PDkho2ZE0OpqizZTZUU7EyGn8V0iipQwESQo4HxtxQ7G04peOASIu+JmnHkxsalwxihD
 t8100G13Dr1QASK8RXQZ6b1UPHUqUH7B0sGBvVx4lnLoBF4qJrqT82Vvq4l9JrXfOuOa
 dzbCOI2t7m1lobnq2FyseXkvsLCqlfRfWiOepvom8swe/loDKYzz/akLUeb7Xhd6kzaJ
 aeYYMcnnJr0om+4NUfgNIKz0ffecitJ+H4aEMnNgDyknUm5GS122n6ls93W6MCAw+KGj
 U2BQ==
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
Cc: sean@poorly.run, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuIDA1IE1heSAwNjowNCBQRFQgMjAxOSwgQnJpYW4gTWFzbmV5IHdyb3RlOgo+IGRpZmYg
LS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9xY29tLW1zbTg5NzQuZHRzaSBiL2FyY2gvYXJtL2Jv
b3QvZHRzL3Fjb20tbXNtODk3NC5kdHNpClsuLl0KPiArCQkJZHNpMDogZHNpQGZkOTIyODAwIHsK
PiArCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gKwo+ICsJCQkJY29tcGF0aWJsZSA9ICJxY29t
LG1kc3MtZHNpLWN0cmwiOwo+ICsJCQkJcmVnID0gPDB4ZmQ5MjI4MDAgMHgxZjg+Owo+ICsJCQkJ
cmVnLW5hbWVzID0gImRzaV9jdHJsIjsKPiArCj4gKwkJCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZt
ZHNzPjsKPiArCQkJCWludGVycnVwdHMgPSA8NCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiArCj4g
KwkJCQlhc3NpZ25lZC1jbG9ja3MgPSA8Jm1tY2MgQllURTBfQ0xLX1NSQz4sCj4gKwkJCQkgICAg
ICAgICAgICAgICAgICA8Jm1tY2MgUENMSzBfQ0xLX1NSQz47Cj4gKwkJCQlhc3NpZ25lZC1jbG9j
ay1wYXJlbnRzID0gPCZkc2lfcGh5MCAwPiwKPiArCQkJCSAgICAgICAgICAgICAgICAgICAgICAg
ICA8JmRzaV9waHkwIDE+Owo+ICsKPiArCQkJCWNsb2NrcyA9IDwmbW1jYyBNRFNTX01EUF9DTEs+
LAo+ICsJCQkJICAgICAgICAgPCZtbWNjIE1EU1NfQUhCX0NMSz4sCj4gKwkJCQkgICAgICAgICA8
Jm1tY2MgTURTU19BWElfQ0xLPiwKPiArCQkJCSAgICAgICAgIDwmbW1jYyBNRFNTX0JZVEUwX0NM
Sz4sCj4gKwkJCQkgICAgICAgICA8Jm1tY2MgTURTU19QQ0xLMF9DTEs+LAo+ICsJCQkJICAgICAg
ICAgPCZtbWNjIE1EU1NfRVNDMF9DTEs+LAo+ICsJCQkJICAgICAgICAgPCZtbWNjIE1NU1NfTUlT
Q19BSEJfQ0xLPjsKPiArCQkJCWNsb2NrLW5hbWVzID0gIm1kcF9jb3JlIiwKPiArCQkJCSAgICAg
ICAgICAgICAgImlmYWNlIiwKPiArCQkJCSAgICAgICAgICAgICAgImJ1cyIsCj4gKwkJCQkgICAg
ICAgICAgICAgICJieXRlIiwKPiArCQkJCSAgICAgICAgICAgICAgInBpeGVsIiwKPiArCQkJCSAg
ICAgICAgICAgICAgImNvcmUiLAo+ICsJCQkJICAgICAgICAgICAgICAiY29yZV9tbXNzIjsKClVu
bGVzcyBJIGVuYWJsZSBNTVNTX01NU1NOT0NfQVhJX0NMSyBhbmQgTU1TU19TMF9BWElfQ0xLIEkg
Z2V0IHNvbWUKdW5kZXJydW4gZXJyb3IgZnJvbSBEU0kuIFlvdSBkb24ndCBzZWUgYW55dGhpbmcg
bGlrZSB0aGlzPwoKKFRoZXNlIGNsb2NrcyBhcmUgY29udHJvbGxlZCBieSBtc21fYnVzIGRvd25z
dHJlYW0gYW5kIHNob3VsZCBiZSBkcml2ZW4KYnkgaW50ZXJjb25uZWN0IHVwc3RyZWFtKQoKCkFw
YXJ0IGZyb20gdGhpcywgSSB0aGluayB0aGlzIGxvb2tzIG5pY2UuIEhhcHB5IHRvIHNlZSB0aGUg
cHJvZ3Jlc3MuCgpSZWdhcmRzLApCam9ybgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
