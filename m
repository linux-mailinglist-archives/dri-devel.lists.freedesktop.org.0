Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D50575535
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 19:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631F86E7BC;
	Thu, 25 Jul 2019 17:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6176E7BC
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 17:17:30 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id i2so23683871plt.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 10:17:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tPVqVnzmvlRxnAy1nlx0FuoHgdEqnAev2P/iqrvyRAA=;
 b=Squgg/zjtAfpaXZnDX6AhBbfIRRwHz6xCrsOdJTMcqvbUWaVUFHsrwg1IbB7Ztjyfg
 9OGXS/yHQoUtD4myLIopDiYJ3EbJsEsUyzmeA/sNQ3qvZhYOq+3PYpNEHn+OtkiaIv+U
 qHFr2h38qV4FMSgu4uqtDsKEsBlZGVpFn1hIvJsmXWrh+Ii05Ox1C8xufVIiI/TO8Tzg
 +vbE5EmSyVEPfZJuz9azvp0lB2ojez+ux9jIcbU6EvTpAascA9QIDrii8Nt2VnDuKqMG
 h4UsRO3ll3S0mpW/ovx9DKdtajDGYf/6j29jW84e+rXrNHnZe4Oh3w5BuDx+oCTojuVK
 8dLw==
X-Gm-Message-State: APjAAAWk2Y9uQpfpKkOTdDHfXvhxnWPg/udW8MamyKydFWE9OVI/hnoJ
 mRfY5sO+xLs2SoqPUi0QQ6wjNQ==
X-Google-Smtp-Source: APXvYqws5odlydH4ebEFOkZgM8ILSO3F0QORLUvSUh4M4JwkPcu4YkyXn+XUbv1ErfBXv358RQkmHg==
X-Received: by 2002:a17:902:934a:: with SMTP id
 g10mr93724757plp.18.1564075050259; 
 Thu, 25 Jul 2019 10:17:30 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id q126sm6606292pfb.56.2019.07.25.10.17.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 10:17:28 -0700 (PDT)
Date: Thu, 25 Jul 2019 10:17:26 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 0/4] backlight: Expose brightness curve type through
 sysfs
Message-ID: <20190725171726.GD250418@google.com>
References: <20190709190007.91260-1-mka@chromium.org>
 <20190722235926.GA250418@google.com> <20190725111541.GA23883@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725111541.GA23883@dell>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tPVqVnzmvlRxnAy1nlx0FuoHgdEqnAev2P/iqrvyRAA=;
 b=Gzmt01iVIH1Bred1XXVjQaOCqWazRRFK9XDsc7huxBWzN5+Wk20p62OgxhtyDEfCjH
 m4OjvYBjArWhuK+l4JVeBEcLcy1ACe9AyZBHhkrE8Zw9EbZjPhD/aFMWJQCRguVdoNfj
 Y2/KhTuUR487XJzbutf1bxfnR2xCz1ZysJxLs=
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
 Douglas Anderson <dianders@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Brian Norris <briannorris@chromium.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMTI6MTU6NDFQTSArMDEwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IE9uIE1vbiwgMjIgSnVsIDIwMTksIE1hdHRoaWFzIEthZWhsY2tlIHdyb3RlOgo+IAo+ID4g
T24gVHVlLCBKdWwgMDksIDIwMTkgYXQgMTI6MDA6MDNQTSAtMDcwMCwgTWF0dGhpYXMgS2FlaGxj
a2Ugd3JvdGU6Cj4gPiA+IEJhY2tsaWdodCBicmlnaHRuZXNzIGN1cnZlcyBjYW4gaGF2ZSBkaWZm
ZXJlbnQgc2hhcGVzLiBUaGUgdHdvIG1haW4KPiA+ID4gdHlwZXMgYXJlIGxpbmVhciBhbmQgbm9u
LWxpbmVhciBjdXJ2ZXMuIFRoZSBodW1hbiBleWUgZG9lc24ndAo+ID4gPiBwZXJjZWl2ZSBsaW5l
YXJseSBpbmNyZWFzaW5nL2RlY3JlYXNpbmcgYnJpZ2h0bmVzcyBhcyBsaW5lYXIgKHNlZQo+ID4g
PiBhbHNvIDg4YmE5NWJlZGI3OSAiYmFja2xpZ2h0OiBwd21fYmw6IENvbXB1dGUgYnJpZ2h0bmVz
cyBvZiBMRUQKPiA+ID4gbGluZWFybHkgdG8gaHVtYW4gZXllIiksIGhlbmNlIG1hbnkgYmFja2xp
Z2h0cyB1c2Ugbm9uLWxpbmVhciAob2Z0ZW4KPiA+ID4gbG9nYXJpdGhtaWMpIGJyaWdodG5lc3Mg
Y3VydmVzLiBUaGUgdHlwZSBvZiBjdXJ2ZSBpcyBjdXJyZW50bHkgb3BhcXVlCj4gPiA+IHRvIHVz
ZXJzcGFjZSwgc28gdXNlcnNwYWNlIG9mdGVuIHJlbGllcyBvbiBtb3JlIG9yIGxlc3MgcmVsaWFi
bGUKPiA+ID4gaGV1cmlzdGljcyAobGlrZSB0aGUgbnVtYmVyIG9mIGJyaWdodG5lc3MgbGV2ZWxz
KSB0byBkZWNpZGUgd2hldGhlcgo+ID4gPiB0byB0cmVhdCBhIGJhY2tsaWdodCBkZXZpY2UgYXMg
bGluZWFyIG9yIG5vbi1saW5lYXIuCj4gPiA+IAo+ID4gPiBFeHBvcnQgdGhlIHR5cGUgb2YgdGhl
IGJyaWdodG5lc3MgY3VydmUgdmlhIGEgbmV3IHN5c2ZzIGF0dHJpYnV0ZS4KPiA+ID4gCj4gPiA+
IE1hdHRoaWFzIEthZWhsY2tlICg0KToKPiA+ID4gICBNQUlOVEFJTkVSUzogQWRkIGVudHJ5IGZv
ciBzdGFibGUgYmFja2xpZ2h0IHN5c2ZzIEFCSSBkb2N1bWVudGF0aW9uCj4gPiA+ICAgYmFja2xp
Z2h0OiBFeHBvc2UgYnJpZ2h0bmVzcyBjdXJ2ZSB0eXBlIHRocm91Z2ggc3lzZnMKPiA+ID4gICBi
YWNrbGlnaHQ6IHB3bV9ibDogU2V0IHNjYWxlIHR5cGUgZm9yIENJRSAxOTMxIGN1cnZlcwo+ID4g
PiAgIGJhY2tsaWdodDogcHdtX2JsOiBTZXQgc2NhbGUgdHlwZSBmb3IgYnJpZ2h0bmVzcyBjdXJ2
ZXMgc3BlY2lmaWVkIGluCj4gPiA+ICAgICB0aGUgRFQKPiA+ID4gCj4gPiA+ICAuLi4vQUJJL3Rl
c3Rpbmcvc3lzZnMtY2xhc3MtYmFja2xpZ2h0ICAgICAgICAgfCAyNiArKysrKysrKysrKysrKwo+
ID4gPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIg
KysKPiA+ID4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2JhY2tsaWdodC5jICAgICAgICAgICB8
IDE5ICsrKysrKysrKysKPiA+ID4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jICAg
ICAgICAgICAgICB8IDM1ICsrKysrKysrKysrKysrKysrKy0KPiA+ID4gIGluY2x1ZGUvbGludXgv
YmFja2xpZ2h0LmggICAgICAgICAgICAgICAgICAgICB8ICA4ICsrKysrCj4gPiA+ICA1IGZpbGVz
IGNoYW5nZWQsIDg5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWNsYXNzLWJhY2tsaWdo
dAo+ID4gCj4gPiBwaW5nLCBhbnkgY29tbWVudHMgb24gdjM/Cj4gCj4gTG9va3MgbGlrZSBQQVRD
SCAyLzQgc3RpbGwgbmVlZHMgc2VlaW5nIHRvLgoKVGhlIHBhdGNoIGN1cnJlbnRseSBkb2Vzbid0
IGhhdmUgYW55IGNvbW1lbnRzLgoKRG8geW91IHNlZSBhbnkgc3BlY2lmaWMgdGhpbmdzIHRoYXQg
bmVlZCBpbXByb3ZlbWVudD8gSWYgc28sIGNvdWxkIHlvdQpjb21tZW50IG9uIHRoZSBwYXRjaD8K
ClRoYW5rcwoKTWF0dGhpYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
