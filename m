Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BE51178A
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 12:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80EEB893A4;
	Thu,  2 May 2019 10:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1E6892FD
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 10:46:48 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id n25so1969723wmk.4
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 03:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=upr4s3UIqgMfOrxzX8hhRFt6bzy1u9Hfi57/Qn9/txc=;
 b=oiTzVTMGblI8Udw6pTxCv9yvcRDNifM9Wc8tW7z+UCksTWe20tNAiTdby+djjSkRJS
 hxwvd+zjATPKoLk1c36usLdkxn7k6lQkQT3kgBxrpMg4X981oZS2BKW+D8NiR12C5bDk
 D785mkLYvTeENGm42bdo30DhYsOhD/ERUQkLlveXtB0IjoWd3Cb2ofCmdr3tU1GxhpFg
 QbrJE8WXudkGQQ2DIDFBsE7Te6bk7OIpCs7g4WdtgQT21SO4BEK7WanUm91YfGEqAQb4
 yEBFWmMJ5hQCB+jyNjqzkmOpYpflkbprU/s68lVMozXUcQYwPoX+7oEbxQbSzEXXtFZc
 Zv+A==
X-Gm-Message-State: APjAAAUV6sNCE+MUgpzcQPvmpS9PSUTe5a0T4j77139AFjekTW30+ht3
 t5uyaYT7PoI2ma48DXlq9BIemg==
X-Google-Smtp-Source: APXvYqz8ljUpeAkWeR0JjC3hksspS6xNuZxWwhyiG3PhQ+JauGvsPlF8u6dmrVg+yH7KYtohRo/pYg==
X-Received: by 2002:a1c:e708:: with SMTP id e8mr1866607wmh.73.1556794006806;
 Thu, 02 May 2019 03:46:46 -0700 (PDT)
Received: from holly.lan (static-84-9-17-116.vodafonexdsl.co.uk. [84.9.17.116])
 by smtp.gmail.com with ESMTPSA id z16sm23205477wrt.26.2019.05.02.03.46.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 May 2019 03:46:46 -0700 (PDT)
Date: Thu, 2 May 2019 11:46:44 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH v6 1/3] backlight: lm3630a: return 0 on success in
 update_status functions
Message-ID: <20190502104644.e3eth2cdebuz2mpk@holly.lan>
References: <20190424092505.6578-1-masneyb@onstation.org>
 <20190424092505.6578-2-masneyb@onstation.org>
 <864c1ddc-1008-0041-1559-e491ca0186ef@linaro.org>
 <20190502104239.GA24563@basecamp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190502104239.GA24563@basecamp>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=upr4s3UIqgMfOrxzX8hhRFt6bzy1u9Hfi57/Qn9/txc=;
 b=ONa1Kh3MkmzE3M+vKHgiL4PwCW7ge1VCjQn6DkjkKRFwkrOiHF5j2fYLMdPH4Rztwh
 frXJi5Ac0BfSXIcwW2euSoiS1uDBKY0IJpY7Jyd3aX5ErqYvHEWT3Eu3eFzN3hSy+fWJ
 xELWO3+47dApN8Evpzl5hFryTd4WopsbAivnKmbX8r7oiEXlaO6rVfvEsn81LBtm5WE4
 l38NRQQUPmeOTieKupNNQ0ztW+qbYYsO+0PZ3v2w1nP5hqpfkzqLWBVzAS7D7iKsx2fe
 h4gicOY03ITDlRaXt2umQf4RCP3fAPxpJZEBUxcaisPKIAho8tEnpPa2GfyFTvT7p4wx
 miew==
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
 linux-fbdev@vger.kernel.org, jonathan@marek.ca, b.zolnierkie@samsung.com,
 jingoohan1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, pavel@ucw.cz,
 Daniel Thompson <daniel@redfelineninja.org.uk>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMDIsIDIwMTkgYXQgMDY6NDI6MzlBTSAtMDQwMCwgQnJpYW4gTWFzbmV5IHdy
b3RlOgo+IE9uIFRodSwgTWF5IDAyLCAyMDE5IGF0IDExOjA3OjUxQU0gKzAxMDAsIERhbmllbCBU
aG9tcHNvbiB3cm90ZToKPiA+IE9uIDI0LzA0LzIwMTkgMTA6MjUsIEJyaWFuIE1hc25leSB3cm90
ZToKPiA+ID4gbG0zNjMwYV9iYW5rX2FfdXBkYXRlX3N0YXR1cygpIGFuZCBsbTM2MzBhX2Jhbmtf
Yl91cGRhdGVfc3RhdHVzKCkKPiA+ID4gYm90aCByZXR1cm4gdGhlIGJyaWdodG5lc3MgdmFsdWUg
aWYgdGhlIGJyaWdodG5lc3Mgd2FzIHN1Y2Nlc3NmdWxseQo+ID4gPiB1cGRhdGVkLiBXcml0aW5n
IHRvIHRoZXNlIGF0dHJpYnV0ZXMgdmlhIHN5c2ZzIHdvdWxkIGNhdXNlIGEgJ0JhZAo+ID4gPiBh
ZGRyZXNzJyBlcnJvciB0byBiZSByZXR1cm5lZC4gVGhlc2UgZnVuY3Rpb25zIHNob3VsZCByZXR1
cm4gMCBvbgo+ID4gPiBzdWNjZXNzLCBzbyBsZXQncyBjaGFuZ2UgaXQgdG8gY29ycmVjdCB0aGF0
IGVycm9yLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxtYXNuZXli
QG9uc3RhdGlvbi5vcmc+Cj4gPiA+IEZpeGVzOiAyOGU2NGE2OGEyZWYgKCJiYWNrbGlnaHQ6IGxt
MzYzMDogYXBwbHkgY2hpcCByZXZpc2lvbiIpCj4gPiA+IEFja2VkLWJ5OiBQYXZlbCBNYWNoZWsg
PHBhdmVsQHVjdy5jej4KPiA+IAo+ID4gSGkgQnJpYW4sIHNvcnJ5IGZvciB0aGUgZGVsYXkuIEZv
ciBzb21lIHJlYXNvbiB5b3VyIG1haWxzIGFyZSBiZWluZyBkdW1wZWQKPiA+IGJlZm9yZSB0aGV5
IHJlYWNoIG1lIHNvIEkgb25seSBkaXNjb3ZlcmVkIHRoZXNlIHBhdGNoZXMgd2hlbiBJIHBhaWQg
cHJvcGVyCj4gPiBhdHRlbnRpb24gdG8gdGhlIHJlcGxpZXMgYW5kIGZldGNoZWQgdGhlbSBmcm9t
IHBhdGNod29yay4KPiA+IAo+ID4gSGkgTGVlLCBpcyB0aGUgc2FtZSB0aGluZyBoYXBwZW5pbmcg
Zm9yIHlvdT8gOy0pCj4gCj4gSHVoLCB0aGF0J3Mgb2RkLiBJIGhhdmVuJ3QgcmFuIGludG8gdGhh
dCBpc3N1ZSB3aGVuIHdvcmtpbmcgd2l0aCBwZW9wbGUKPiBmcm9tIExpbmFybyBpbiBvdGhlciBz
dWJzeXN0ZW1zLgo+IAo+IEFzIGEgc2FuaXR5IGNoZWNrLCBJIHVzZWQgJ2dpdCBzZW5kLWVtYWls
JyB0byBzZW5kIHRoaXMgcGF0Y2ggdG8KPiBjaGVjay1hdXRoQHZlcmlmaWVyLnBvcnQyNS5jb20g
YW5kIGl0IHZlcmlmaWVkIHRoYXQgSSBzdGlsbCBoYXZlIFNQRiwKPiBES0lNLCByZXZlcnNlIERO
UywgZXRjLiBhbGwgc2V0dXAgcHJvcGVybHkgb24gdGhpcyBkb21haW4uCj4gCj4gaG90bWFpbC5j
b20gYWRkcmVzc2VzIGFyZSB0aGUgb25seSBvbmVzIEkndmUgaGFkIGlzc3VlcyB3aXRoIGluIHRo
ZQo+IHBhc3QsIGJ1dCBJIGRvdWJ0IHlvdSdyZSBmb3J3YXJkaW5nIHlvdXIgZW1haWwgdGhlcmUu
IDopCgpOby4uLiBhbmQgc3RyYW5nZWx5IGVub3VnaCB5b3VyIHJlY2VudCBlLW1haWwgc2FpbGVk
IHRocm91Z2gganVzdCBmaW5lLgpMZXQncyB3YWl0IGFuZCBzZWUgd2hhdCBpcyBoYXBwZW5pbmcg
Zm9yIExlZSAod2hpY2ggSSBzdXNwZWN0IG1heSBub3QgYmUKdW50aWwgd2VsbCBpbnRvIG5leHQg
d2VlaykuCgoKRGFuaWVsLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
