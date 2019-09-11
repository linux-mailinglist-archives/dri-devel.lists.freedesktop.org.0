Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87942AFA49
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 12:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5BD6EA73;
	Wed, 11 Sep 2019 10:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D28D6EA73
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 10:25:37 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 7so2785252wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 03:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cVytbu5aDeImYPKa8pGIMJDrGZ6PUWapgttWO1YNSWo=;
 b=bqRhQd9I1x+nfkq3IQYUFLiYYB8YlgRNZUJ/ebVcgytvi2WAnsWgv19M1+uGoDYBlm
 4pFdUQsq0Vle+t9g55LrzM/lXq6JpClN3weEoAT4lj1hsuM9EtXl5EGbjvJJaU6pvnEz
 9jO3P/SuHHmRaDgnXvfO7oURouBTS0E3IE5NOf5xnknRNYfZ7g9LuYazVc9/GaYuHF1h
 8VoGENFFT93QybhEkSQ0jmVYFbkMvOzEQZbVwQNgn5Eiyr8U6rPWNo1dkXgG73t/IWAJ
 rBODvU3KiW7k5XV+bbgRVpdI80vOvVuBfnpYxutRQErjzIpL0GdHuJfLcQ2l08osF50f
 77Vg==
X-Gm-Message-State: APjAAAVsjXlGOUaqjCTtoIWZBPaaFpsUnUdT+nQ9WeqbJwcDhqE6Wuzr
 XKo1F/5wZGhTQvUclVsS3G76iw==
X-Google-Smtp-Source: APXvYqzVMF0R+kyeDNgLI4QVwcAzQuyJbImC6/3qU7I+I0w6fwpvAl/Ay1oUpkLuzSS/Uus7LaWquA==
X-Received: by 2002:a1c:f607:: with SMTP id w7mr3358169wmc.84.1568197535579;
 Wed, 11 Sep 2019 03:25:35 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id e20sm2583505wme.3.2019.09.11.03.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 03:25:34 -0700 (PDT)
Date: Wed, 11 Sep 2019 11:25:33 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v2 2/2] backlight: lm3630a: add an enable gpio for the
 HWEN pin
Message-ID: <20190911102533.not4ta3xwgm6bhjo@holly.lan>
References: <20190910212909.18095-1-andreas@kemnade.info>
 <20190910212909.18095-3-andreas@kemnade.info>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190910212909.18095-3-andreas@kemnade.info>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cVytbu5aDeImYPKa8pGIMJDrGZ6PUWapgttWO1YNSWo=;
 b=WbGo5Hmz09242kK2X2Ks5uKjFCYXNT2i6lWaWWpoIN+qvvLyXoNLqTsd/1nDidIfV2
 DQVN4B+puM2xskQIoKsxbaSQMlx9AiUrOLwVDieIgFbBoCitWqznFjicK88E/v9xXS3K
 BN25w/Fa6IfYNrZLdGgUIYPdCBhRgedhJ/2rGI2IPa0QIANFJ5kDHIWvhJOGlaWJb2aV
 w6whG54hVEfGCDgCh4JWZz3XIQN8XzZiMzmPQohhgPvGydLLkQGve+NqCWI7yeFo9olm
 CelxyfcqCEsPYLNMEvfPEQA+NH12WAoyHPk8tORRcyaFb0AOnBbf6TX6tapfMVeOj2to
 danw==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 "H. Nikolaus Schaller" <hns@goldelico.com>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMTE6Mjk6MDlQTSArMDIwMCwgQW5kcmVhcyBLZW1uYWRl
IHdyb3RlOgo+IEZvciBub3cganVzdCBlbmFibGUgaXQgaW4gdGhlIHByb2JlIGZ1bmN0aW9uIHRv
IGFsbG93IGkyYwo+IGFjY2Vzcy4gRGlzYWJsaW5nIGFsc28gbWVhbnMgcmVzZXR0aW5nIHRoZSBy
ZWdpc3RlciB2YWx1ZXMKPiB0byBkZWZhdWx0IGFuZCBhY2NvcmRpbmcgdG8gdGhlIGRhdGFzaGVl
dCBkb2VzIG5vdCBnaXZlCj4gcG93ZXIgc2F2aW5ncwo+IAo+IFRlc3RlZCBvbiBLb2JvIENsYXJh
IEhELgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgS2VtbmFkZSA8YW5kcmVhc0BrZW1uYWRl
LmluZm8+Cj4gLS0tCj4gY2hhbmdlcyBpbiB2MjoKPiAtIHNpbXBsaWZpY2F0aW9uCj4gLSBjb3Jy
ZWN0IGdwaW8gZGlyZWN0aW9uIGluaXRpYWxpc2F0aW9uCj4gCj4gIGRyaXZlcnMvdmlkZW8vYmFj
a2xpZ2h0L2xtMzYzMGFfYmwuYyB8IDEwICsrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEw
IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQv
bG0zNjMwYV9ibC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9ibC5jCj4gaW5k
ZXggOGY4NGYzNjg0ZjA0Li45ZDA2MzlkNDIwMmQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRl
by9iYWNrbGlnaHQvbG0zNjMwYV9ibC5jCj4gKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQv
bG0zNjMwYV9ibC5jCj4gQEAgLTEyLDYgKzEyLDggQEAKPiAgI2luY2x1ZGUgPGxpbnV4L3VhY2Nl
c3MuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPgo+ICAjaW5jbHVkZSA8bGludXgv
cmVnbWFwLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9ncGlvL2NvbnN1bWVyLmg+Cj4gKyNpbmNsdWRl
IDxsaW51eC9ncGlvLmg+CgpOaXRwaWNraW5nLi4uIGJ1dCBJIGRvbid0IHRoaW5rIGxpbnV4L2dw
aW8uaCBpcyB1c2VkIGFueW1vcmUuCgoKPiAgI2luY2x1ZGUgPGxpbnV4L3B3bS5oPgo+ICAjaW5j
bHVkZSA8bGludXgvcGxhdGZvcm1fZGF0YS9sbTM2MzBhX2JsLmg+Cj4gIAo+IEBAIC00OCw2ICs1
MCw3IEBAIHN0cnVjdCBsbTM2MzBhX2NoaXAgewo+ICAJc3RydWN0IGxtMzYzMGFfcGxhdGZvcm1f
ZGF0YSAqcGRhdGE7Cj4gIAlzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmxlZGE7Cj4gIAlzdHJ1
Y3QgYmFja2xpZ2h0X2RldmljZSAqYmxlZGI7Cj4gKwlzdHJ1Y3QgZ3Bpb19kZXNjICplbmFibGVf
Z3BpbzsKPiAgCXN0cnVjdCByZWdtYXAgKnJlZ21hcDsKPiAgCXN0cnVjdCBwd21fZGV2aWNlICpw
d21kOwo+ICB9Owo+IEBAIC01MzUsNiArNTM4LDEzIEBAIHN0YXRpYyBpbnQgbG0zNjMwYV9wcm9i
ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LAo+ICAJfQo+ICAJcGNoaXAtPnBkYXRhID0gcGRh
dGE7Cj4gIAo+ICsJcGNoaXAtPmVuYWJsZV9ncGlvID0gZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwo
JmNsaWVudC0+ZGV2LCAiZW5hYmxlIiwKPiArCQkJCQkJR1BJT0RfT1VUX0hJR0gpOwo+ICsJaWYg
KElTX0VSUihwY2hpcC0+ZW5hYmxlX2dwaW8pKSB7Cj4gKwkJcnZhbCA9IFBUUl9FUlIocGNoaXAt
PmVuYWJsZV9ncGlvKTsKPiArCQlyZXR1cm4gcnZhbDsKPiArCX0KPiArCj4gIAkvKiBjaGlwIGlu
aXRpYWxpemUgKi8KPiAgCXJ2YWwgPSBsbTM2MzBhX2NoaXBfaW5pdChwY2hpcCk7Cj4gIAlpZiAo
cnZhbCA8IDApIHsKPiAtLSAKPiAyLjIwLjEKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
