Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D2874CAD
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 13:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326136E6FF;
	Thu, 25 Jul 2019 11:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42D26E6FF
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 11:15:59 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id x15so44621945wmj.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 04:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=QF+7Jm8pJkonsuJf5bcYYdklp7SuR7E7WLX/qpmLIMY=;
 b=az7Bz5lgGMZ2dnhrl6gQHDkCjI1juZcoJNwQxMXuJ96Nh4jPqYxVu6Wxk08C9lC8h5
 8WbW5pXLkY5ZAbjBz9NiZYG0zFueanxuIw6bTSRblbd9Z/MXO7f3DK6DQvXPSRXPMhbD
 UrHmc2bE6ImTzZiMZASRaJCz3NUL4hEqtTYq4uN52y5ldx1xg6tKUPdlJxddFrmk1Knt
 hKd5v30hrlAle2zLZtzbY6nwjbEUpSJGGxobOtzHHbuXTqIkG8hyqUSP5Pg3d927e5yN
 nZyYxm1yZsYSedfu+EDdbi1K9RbTeIHQL5oNuaxeyEf5s9kc7ubLJS6G0NYlCmj0CexJ
 o4Sg==
X-Gm-Message-State: APjAAAVN6HhN/Llu/8O812dx4U1GCTzC6oeLvMXh5z5APzA6ji0H0BVK
 3Smco1EIqYI/pUL8gdHkTviy6y3c0BI=
X-Google-Smtp-Source: APXvYqwHJQvJFZHzw1frET7Zmr1qdyEsn845eWjpbVigiDXyd3xqohC1yA+q2+bnBWLbG0Uze50N5Q==
X-Received: by 2002:a1c:3c04:: with SMTP id j4mr74612867wma.37.1564053358224; 
 Thu, 25 Jul 2019 04:15:58 -0700 (PDT)
Received: from dell ([2.27.35.164])
 by smtp.gmail.com with ESMTPSA id y16sm100988574wrg.85.2019.07.25.04.15.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 25 Jul 2019 04:15:57 -0700 (PDT)
Date: Thu, 25 Jul 2019 12:15:41 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v3 0/4] backlight: Expose brightness curve type through
 sysfs
Message-ID: <20190725111541.GA23883@dell>
References: <20190709190007.91260-1-mka@chromium.org>
 <20190722235926.GA250418@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722235926.GA250418@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=QF+7Jm8pJkonsuJf5bcYYdklp7SuR7E7WLX/qpmLIMY=;
 b=JPcCwXhG2xYcAxickSomrOJkvgTBB5DjGLN3ImW41oQin65O47uBJez5y6QHqPi4CR
 R7p/PX3cBDvjHCCXcAM73DTDSepGGTQQ2CN2Mn3M7v7z93rwWzHrKJCmJY9wOEvBDKq2
 NpiyRbMo36jxYlVEKnTElXwIE0Y6sqOOKYRQcc+CbQLpWYGGyF1vhlYKPIneuigp7lER
 g/uEtUrvKDd1sm7FXHFVMcoPSdQ6TQYr3xRhUnqsEI0ABKQ9ZgKAV5U2smgQQPt2O5M5
 Inroyadx6ibMupV0tHIR/8R1NUETYkUXGcS33jsQ20wFt42RB7EmtkbcaAmdRw7W/QHJ
 31MA==
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

T24gTW9uLCAyMiBKdWwgMjAxOSwgTWF0dGhpYXMgS2FlaGxja2Ugd3JvdGU6Cgo+IE9uIFR1ZSwg
SnVsIDA5LCAyMDE5IGF0IDEyOjAwOjAzUE0gLTA3MDAsIE1hdHRoaWFzIEthZWhsY2tlIHdyb3Rl
Ogo+ID4gQmFja2xpZ2h0IGJyaWdodG5lc3MgY3VydmVzIGNhbiBoYXZlIGRpZmZlcmVudCBzaGFw
ZXMuIFRoZSB0d28gbWFpbgo+ID4gdHlwZXMgYXJlIGxpbmVhciBhbmQgbm9uLWxpbmVhciBjdXJ2
ZXMuIFRoZSBodW1hbiBleWUgZG9lc24ndAo+ID4gcGVyY2VpdmUgbGluZWFybHkgaW5jcmVhc2lu
Zy9kZWNyZWFzaW5nIGJyaWdodG5lc3MgYXMgbGluZWFyIChzZWUKPiA+IGFsc28gODhiYTk1YmVk
Yjc5ICJiYWNrbGlnaHQ6IHB3bV9ibDogQ29tcHV0ZSBicmlnaHRuZXNzIG9mIExFRAo+ID4gbGlu
ZWFybHkgdG8gaHVtYW4gZXllIiksIGhlbmNlIG1hbnkgYmFja2xpZ2h0cyB1c2Ugbm9uLWxpbmVh
ciAob2Z0ZW4KPiA+IGxvZ2FyaXRobWljKSBicmlnaHRuZXNzIGN1cnZlcy4gVGhlIHR5cGUgb2Yg
Y3VydmUgaXMgY3VycmVudGx5IG9wYXF1ZQo+ID4gdG8gdXNlcnNwYWNlLCBzbyB1c2Vyc3BhY2Ug
b2Z0ZW4gcmVsaWVzIG9uIG1vcmUgb3IgbGVzcyByZWxpYWJsZQo+ID4gaGV1cmlzdGljcyAobGlr
ZSB0aGUgbnVtYmVyIG9mIGJyaWdodG5lc3MgbGV2ZWxzKSB0byBkZWNpZGUgd2hldGhlcgo+ID4g
dG8gdHJlYXQgYSBiYWNrbGlnaHQgZGV2aWNlIGFzIGxpbmVhciBvciBub24tbGluZWFyLgo+ID4g
Cj4gPiBFeHBvcnQgdGhlIHR5cGUgb2YgdGhlIGJyaWdodG5lc3MgY3VydmUgdmlhIGEgbmV3IHN5
c2ZzIGF0dHJpYnV0ZS4KPiA+IAo+ID4gTWF0dGhpYXMgS2FlaGxja2UgKDQpOgo+ID4gICBNQUlO
VEFJTkVSUzogQWRkIGVudHJ5IGZvciBzdGFibGUgYmFja2xpZ2h0IHN5c2ZzIEFCSSBkb2N1bWVu
dGF0aW9uCj4gPiAgIGJhY2tsaWdodDogRXhwb3NlIGJyaWdodG5lc3MgY3VydmUgdHlwZSB0aHJv
dWdoIHN5c2ZzCj4gPiAgIGJhY2tsaWdodDogcHdtX2JsOiBTZXQgc2NhbGUgdHlwZSBmb3IgQ0lF
IDE5MzEgY3VydmVzCj4gPiAgIGJhY2tsaWdodDogcHdtX2JsOiBTZXQgc2NhbGUgdHlwZSBmb3Ig
YnJpZ2h0bmVzcyBjdXJ2ZXMgc3BlY2lmaWVkIGluCj4gPiAgICAgdGhlIERUCj4gPiAKPiA+ICAu
Li4vQUJJL3Rlc3Rpbmcvc3lzZnMtY2xhc3MtYmFja2xpZ2h0ICAgICAgICAgfCAyNiArKysrKysr
KysrKysrKwo+ID4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAyICsrCj4gPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvYmFja2xpZ2h0LmMgICAgICAg
ICAgIHwgMTkgKysrKysrKysrKwo+ID4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5j
ICAgICAgICAgICAgICB8IDM1ICsrKysrKysrKysrKysrKysrKy0KPiA+ICBpbmNsdWRlL2xpbnV4
L2JhY2tsaWdodC5oICAgICAgICAgICAgICAgICAgICAgfCAgOCArKysrKwo+ID4gIDUgZmlsZXMg
Y2hhbmdlZCwgODkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWNsYXNzLWJhY2tsaWdodAo+
IAo+IHBpbmcsIGFueSBjb21tZW50cyBvbiB2Mz8KCkxvb2tzIGxpa2UgUEFUQ0ggMi80IHN0aWxs
IG5lZWRzIHNlZWluZyB0by4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZp
Y2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZv
ciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
