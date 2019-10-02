Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AF9C4AFC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 12:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4073C6E900;
	Wed,  2 Oct 2019 10:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7406E900
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 10:07:40 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id o18so18893732wrv.13
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 03:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8215o5L5rg8Jn8PvXMpKTkwp0UWQ7G/wTp1RzC1miWw=;
 b=ZGUKmTjq1LeG+S5WuIBDIwTW45/yVtimkuVIsmMETbS9BCs0tkxZXUyceuWWyxq6bo
 /HwbLG6EA6i3gTcWkeVIKKgRCxXPlRKtrKmbgeG9jwAzkQh8tVr3N57he+xNdevXlzrU
 OfxC1BCvxC9yHnYv9+UOVLuLSBRK6BY/64kYnMYKWruF1vi0eaUlkHpbTu/Dj6BxmlM+
 46OXIk33nr2OkskG1fbTAuer5g96RKyEdu8AwJ/I0bxLOCobedqsCJjGShHRbtEUuoN/
 dZmzHknlQuroG7Mkbk7wUoshlvjp7vU/ODZ56vnCq84iUy7qx+KgXzoRLSQNafFxH55k
 pNiA==
X-Gm-Message-State: APjAAAU3l5yJTEwZAjDQX2VQ7ghbmJEni43rHHUTCpr0jKvgzGK+BnXh
 Rve3/j3JlSXjEzl4hwzdFFwZ3A==
X-Google-Smtp-Source: APXvYqw0Eb6miBPDCyV5NBM+w1t6VFTHTfOhXpGWg3xUNG7gHtmXzQM6vSPoLjFnSHzsdhPQlt+sug==
X-Received: by 2002:adf:dbce:: with SMTP id e14mr1946992wrj.56.1570010859481; 
 Wed, 02 Oct 2019 03:07:39 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id g4sm25657217wrw.9.2019.10.02.03.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 03:07:38 -0700 (PDT)
Date: Wed, 2 Oct 2019 11:07:37 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH] backlight: pwm_bl: Don't assign levels table repeatedly
Message-ID: <20191002100737.orm5ghpnw6oe6b3r@holly.lan>
References: <20191001162835.1.I4f2ede1f55ddd1c72b0303b7fd7f73a782fa33e5@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191001162835.1.I4f2ede1f55ddd1c72b0303b7fd7f73a782fa33e5@changeid>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8215o5L5rg8Jn8PvXMpKTkwp0UWQ7G/wTp1RzC1miWw=;
 b=DTOctIKi3TC2V8YqzjCVfP8yozCtDlf8lmDyvwawFn4uwT6vW3n9HK5xwOA1/PeVkj
 hYjrjyDHa35kI9OABP5WohPSLTGuWvoY+OPWGhLf/fqyJR7HyQiSJSHoGwlmN+Ah4k44
 1i3zI4m+GCjKqaVunXUELVhlFNbSqi677sTPrZIJMJP2GJtwwme1oHWKFVMePdL8KZyE
 8H6j8VnX/Y6ZNU1tjewA/nS8T5eFlr9UEWKHJERc0ocvqo1pKobJllgI75ZNnChUQ3pF
 pMCRm4IjIUSyaQ8DHqx2EBwPQhYBZeb5c575NSy4GaTQWrNWyVKOCu3zogO8bywGoc2j
 OnYg==
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMDQ6Mjk6MjRQTSAtMDcwMCwgTWF0dGhpYXMgS2FlaGxj
a2Ugd3JvdGU6Cj4gcHdtX2JhY2tsaWdodF9wcm9iZSgpIHJlLWFzc2lnbnMgcGItPmxldmVscyBm
b3IgZXZlcnkgYnJpZ2h0bmVzcwo+IGxldmVsLiBUaGlzIGlzIG5vdCBuZWVkZWQgYW5kIHdhcyBs
aWtlbHkgbm90IGludGVuZGVkLCBzaW5jZQo+IG5laXRoZXIgc2lkZSBvZiB0aGUgYXNzaWdubWVu
dCBjaGFuZ2VzIGR1cmluZyB0aGUgbG9vcC4gQXNzaWduCj4gdGhlIGZpZWxkIG9ubHkgb25jZS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4K
Ck1ha2VzIHNlbnNlIGJ1dCB0aGlzIHNob3VsZCBwcm9iYWJseSBiZSBkcm9wcGluZyB0aGUgY3Vy
bHkgYnJhY2VzIHRvby4KCgpEYW5pZWwuCgo+IC0tLQo+IAo+ICBkcml2ZXJzL3ZpZGVvL2JhY2ts
aWdodC9wd21fYmwuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC9wd21fYmwuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCj4gaW5kZXggNzQ2
ZWViYzQxMWRmLi45NTk0MzZiOWU5MmIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvcHdtX2JsLmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwo+
IEBAIC01NjQsNiArNTY0LDggQEAgc3RhdGljIGludCBwd21fYmFja2xpZ2h0X3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAltZW1zZXQoJnByb3BzLCAwLCBzaXplb2Yoc3Ry
dWN0IGJhY2tsaWdodF9wcm9wZXJ0aWVzKSk7Cj4gIAo+ICAJaWYgKGRhdGEtPmxldmVscykgewo+
ICsJCXBiLT5sZXZlbHMgPSBkYXRhLT5sZXZlbHM7Cj4gKwo+ICAJCS8qCj4gIAkJICogRm9yIHRo
ZSBEVCBjYXNlLCBvbmx5IHdoZW4gYnJpZ2h0bmVzcyBsZXZlbHMgaXMgZGVmaW5lZAo+ICAJCSAq
IGRhdGEtPmxldmVscyBpcyBmaWxsZWQuIEZvciB0aGUgbm9uLURUIGNhc2UsIGRhdGEtPmxldmVs
cwo+IEBAIC01NzIsOCArNTc0LDYgQEAgc3RhdGljIGludCBwd21fYmFja2xpZ2h0X3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAkJZm9yIChpID0gMDsgaSA8PSBkYXRhLT5t
YXhfYnJpZ2h0bmVzczsgaSsrKSB7Cj4gIAkJCWlmIChkYXRhLT5sZXZlbHNbaV0gPiBwYi0+c2Nh
bGUpCj4gIAkJCQlwYi0+c2NhbGUgPSBkYXRhLT5sZXZlbHNbaV07Cj4gLQo+IC0JCQlwYi0+bGV2
ZWxzID0gZGF0YS0+bGV2ZWxzOwo+ICAJCX0KPiAgCj4gIAkJaWYgKHB3bV9iYWNrbGlnaHRfaXNf
bGluZWFyKGRhdGEpKQo+IC0tIAo+IDIuMjMuMC40NDQuZzE4ZWViNWEyNjUtZ29vZwo+IApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
