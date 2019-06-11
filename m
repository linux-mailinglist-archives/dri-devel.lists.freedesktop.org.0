Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA2A3D32C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 19:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C3489187;
	Tue, 11 Jun 2019 17:01:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C14589202
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 17:01:27 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id j2so7810272pfe.6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 10:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=D/6K52cqkgjun9QL50SRby3oaZewpSvBQVwA1lCewfo=;
 b=VBmbmXmdi28iW+no7A+InzhGFgFn4fWaGPwmPSY9wVmYqoBtXfsIc+1CEBHuXgXzB1
 jS90FMX5MO9XidceZX7CjhhNdXqsGIa/3qQU0Wl9DxQ5iSN2Ky6r2/Z/2y+7EBNjcnN/
 lPp8SNIuHwTrlHrREUS39UsbRLetaSH9lY4y8SimY007gNwNBpDPfVAZ549NvAPOeun+
 D4AYueOQ/qlG28ERnFnGtC++sYX9LAOZwq9q+C3iP0IN/pFKaXSr2vSeosMS3MFrwrzr
 IR//oOj0wUgB5Uc4bjxHN64fouWRhnuXV1RksTIpaOKxt9IxJCQ+41FOFcUFMRv7EKHU
 12Qg==
X-Gm-Message-State: APjAAAWxoe58UrurG0US+q2Gy2eWuFgX+DbwWuNYTUoCzwhnsFJO5/JG
 dfN6OZU3GwA00WCqCWDk9ANqDQ==
X-Google-Smtp-Source: APXvYqwqnW/JGe6b0ykApW2Df5C6hfjZci1Q+jK6X2Ei83loTkx83Y/j5N8snl0nAtPHXvq5b2N3cg==
X-Received: by 2002:a63:4e10:: with SMTP id c16mr20869964pgb.214.1560272486514; 
 Tue, 11 Jun 2019 10:01:26 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id p1sm5962781pff.74.2019.06.11.10.01.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 10:01:25 -0700 (PDT)
Date: Tue, 11 Jun 2019 10:01:23 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH 2/2] backlight: pwm_bl: Get number of brightness levels
 for CIE 1931 from the device tree
Message-ID: <20190611170123.GD137143@google.com>
References: <20190610233739.29477-1-mka@chromium.org>
 <20190610233739.29477-2-mka@chromium.org>
 <20190611153314.cj6j6l4kcl4kk4t2@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611153314.cj6j6l4kcl4kk4t2@holly.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=D/6K52cqkgjun9QL50SRby3oaZewpSvBQVwA1lCewfo=;
 b=XtFdaHCTpTDf0qQhQfuAjHKGqAns0vrUqrQg02/8jVmR8p0ZzKKlHKnR9VJJBokSNm
 ZgAQrr+A/h9J30599wfzOGisk8Qu8DlWAbSCBG5dzc6KA8829UtBGHKxwnkcRV2MXxbW
 ILseuhOSbtocL+Hw4Y3nT83V4Ab6Y2qlkb2SU=
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
 linux-fbdev@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Brian Norris <briannorris@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pwm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKT24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMDQ6MzM6MTRQTSArMDEwMCwgRGFu
aWVsIFRob21wc29uIHdyb3RlOgo+IE9uIE1vbiwgSnVuIDEwLCAyMDE5IGF0IDA0OjM3OjM5UE0g
LTA3MDAsIE1hdHRoaWFzIEthZWhsY2tlIHdyb3RlOgo+ID4gQ29tbWl0IDg4YmE5NWJlZGI3OSAo
ImJhY2tsaWdodDogcHdtX2JsOiBDb21wdXRlIGJyaWdodG5lc3Mgb2YgTEVECj4gPiBsaW5lYXJs
eSB0byBodW1hbiBleWUiKSB1c2VzIHB3bV9wZXJpb2QgLyBod2VpZ2h0MzIocHdtX3BlcmlvZCkg
YXMKPiA+IGFzIGhldXJpc3RpYyB0byBkZXRlcm1pbmUgdGhlIG51bWJlciBvZiBicmlnaHRuZXNz
IGxldmVscyB3aGVuIHRoZSBEVAo+ID4gZG9lc24ndCBwcm92aWRlIGEgYnJpZ2h0bmVzcyBsZXZl
bCB0YWJsZS4gVGhpcyBoZXVyaXN0aWMgaXMgYnJva2VuCj4gPiBhbmQgY2FuIHJlc3VsdCBpbiBl
eGNlc3NpdmVseSBsYXJnZSBicmlnaHRuZXNzIHRhYmxlcy4KPiA+IAo+ID4gSW5zdGVhZCBvZiB1
c2luZyB0aGUgaGV1cmlzdGljIHRyeSB0byByZXRyaWV2ZSB0aGUgbnVtYmVyIG9mCj4gPiBicmln
aHRuZXNzIGxldmVscyBmcm9tIHRoZSBkZXZpY2UgdHJlZSAocHJvcGVydHkgJ21heC1icmlnaHRu
ZXNzJwo+ID4gKyAxKS4gSWYgdGhlIHZhbHVlIGlzIG5vdCBzcGVjaWZpZWQgdXNlIGEgZGVmYXVs
dCBvZiAyNTYgbGV2ZWxzLgo+IAo+IEknbGwgbG9vayBhdCB0aGUgY29kZSB0b21vcnJvdyBidXQg
d2h5IDI1Nj8KPiAKPiBUbyBtZSBpdCBmZWVscyBzaW11bHRhbmVvdXNseSB0b28gYmlnIGZvciBh
IHNpbXBsZSA4LWJpdCBQV00gYW5kIHRvbwo+IHNtYWxsIGZvciBhbmltYXRlZCBiYWNrbGlnaHQg
ZWZmZWN0cy4KCkkgYWdyZWUgdGhlcmUgaXMgbm8gb25lLXNpemUtZml0cy1pdC1hbGwgZGVmYXVs
dCwgMjU2IHNlZW1lZCBsaWtlIGEKcG9zc2libGUgY29tcHJvbWlzZS4KCj4gSSBjZXJ0YWlubHkg
YWdyZWUgdGhhdCBhbiBvdmVycmlkZSBjb3VsZCBiZSB1c2VmdWwgYnV0IEknbSBub3QgY2xlYXIg
d2h5Cj4gZGVyaXZpbmcgYSBkZWZhdWx0IGJhc2VkIG9uIHRoZSBwZXJpb2QgaXMgYm9ndXMgKGFu
ZCB0aGUgZGVzY3JpcHRpb24gaXMKPiBtZXJlbHkgY29uY2VybmVkIGFib3V0IHVzZWxlc3NseSBi
aWcgdGFibGVzKS4KCk1heWJlIGl0J3Mgbm90IG5lY2Vzc2FyaWx5IGJvZ3VzLCBidXQgdGhlIGN1
cnJlbnQgaGV1cmlzdGljIHRoYXQKY291bnRzIHRoZSBudW1iZXIgb2Ygc2V0IGJpdHMgKGh3ZWln
aHQoKSkgaW4gdGhlIHBlcmlvZCBjZXJ0YWlubHkgaXMuCgpJSVVDIHRoZSBwZXJpb2QgcHJvdmlk
ZXMgYSBjbHVlIGFib3V0IHRoZSBQV00gcmVzb2x1dGlvbiwgYmVjYXVzZSBpdAp3b3VsZCBiZSBo
YXJkL2ltcG9zc2libGUgdG8gYWNjb21vZGF0ZSB0aGUgaGlnaCByZXNvbHV0aW9uIGluIHNob3J0
ZXIKcGVyaW9kcy4KCj4gLyoKPiAgKiBPbmNlIHdlIGhhdmUgNDA5NiBsZXZlbHMgdGhlcmUncyBs
aXR0bGUgcG9pbnQgZ29pbmcgbXVjaCBoaWdoZXIuLi4KPiAgKiBuZWl0aGVyIGludGVyYWN0aXZl
IHNsaWRlcnMgbm9yIGFuaW1hdGlvbiBiZW5lZml0cyBmcm9tIGhhdmluZwo+ICAqIG1vcmUgdmFs
dWVzIGluIHRoZSB0YWJsZS4KPiAgKi8KPiBtYXhfYnJpZ2h0bmVzcyA9IG1pbihESVZfUk9VTkRf
VVAocGVyaW9kLCBmZnMocGVyaW9kKSwgNDA5Nik7CgpJIHdhcyBhbHNvIGNvbnNpZGVyaW5nIHNv
bWV0aGluZyBhbG9uZyB0aGVzZSBsaW5lcywgYnV0IHdhc24ndCBzdXJlCmlmIHRoZXJlIGlzIGlu
ZGVlZCBhIHJlbGF0aW9uIGJldHdlZW4gdGhlIHBlcmlvZCBhbmQgdGhlIFBXTQpyZXNvbHV0aW9u
LiBJIHRha2UgeW91ciBzdWdnZXN0aW9uIGFzIGEgY29uZmlybWF0aW9uIDopCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
