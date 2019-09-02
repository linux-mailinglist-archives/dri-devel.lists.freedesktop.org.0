Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0907A5318
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 11:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83078982A;
	Mon,  2 Sep 2019 09:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10DE8982A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 09:42:14 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d16so13858032wme.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 02:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=iK4LKa2PqlS0Y5u4Gjl7mrzOSTmztak1fj4wGqVsFy4=;
 b=cA63PFz8ecOw0nY87HWQCmQU5LgHDnRl0C4e7tZVJnONL6Mjn/nwfyh2tDhBBSMIG6
 no94Mi4MMvxmJ3QMRoEELHnlGfgihuNeZ3/h/+o7TFVqp6E2f5ujXEzJn6Od4vo9HQsm
 KKv/4wnTwxUzcP++lEFxKSWyVhO7aGVfjsQJQN0eLPtZZyMewk+6ulBIf48mnsXgPw3v
 ThOZdX+ZteDLhlTjqNwFdQ5Se0SEJqtRWpExTQXSkUQf/zVMc3N0YF5CPVu9kFRWk+0+
 xkpeICQyfjWL2qffyCV8tkNQeTJMt4VwDeVREaEOWSRRdzvoW7Bi+rt7B8qyn7Mjxn7i
 Uglg==
X-Gm-Message-State: APjAAAXneJQ2qfmxagdCL8UrRn3x0AIT2Pg/qGkQnhvapbnAgpshjg/I
 5CCc68rgJLM+kuwJlI1CPZ37UA==
X-Google-Smtp-Source: APXvYqzNZJNoxLswvc9p2LnkDfvzZJYlWCgpWeM7LW0HaPoM2ddXbfzMbv9rhLZWFOa3XTsnVAB6og==
X-Received: by 2002:a7b:c019:: with SMTP id c25mr35998457wmb.116.1567417333221; 
 Mon, 02 Sep 2019 02:42:13 -0700 (PDT)
Received: from dell ([95.147.198.93])
 by smtp.gmail.com with ESMTPSA id k9sm16402618wrq.15.2019.09.02.02.42.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Sep 2019 02:42:12 -0700 (PDT)
Date: Mon, 2 Sep 2019 10:42:11 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v3 4/4] backlight: pwm_bl: Set scale type for brightness
 curves specified in the DT
Message-ID: <20190902094211.GO32232@dell>
References: <20190709190007.91260-1-mka@chromium.org>
 <20190709190007.91260-5-mka@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190709190007.91260-5-mka@chromium.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=iK4LKa2PqlS0Y5u4Gjl7mrzOSTmztak1fj4wGqVsFy4=;
 b=S/WMwjjBsYD6eC5+gEOI58+jRpAry6yXwLdfqno73t/WpmJzLCQpqM2O2mTs/aiwQR
 TCGv+n2vwxgVgIx+fPgz4pHjr9PA1fIL+38d3IdqZWTS9Tyg0SCxGxy5hC9PnOHU0A6S
 6S6nOWcPZFNCZ2aIevsy5XbQrn1qE0XwXbaXnXNnt6jhsNbdKuXnJjHv+pVAVFGLna0+
 YU/tKj9qpFXh/951Jev2PUuDzIubEmF24MUyCESqrgAuuraAsPwd1+e18ZC6zmc4eaRi
 cQ7yC7GHWkx6zeRgTvQrH97fL7TXhIoW0isOYDcSdW/bYVSopm5JEQjiBCDxmVrFQc+/
 YUuA==
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

T24gVHVlLCAwOSBKdWwgMjAxOSwgTWF0dGhpYXMgS2FlaGxja2Ugd3JvdGU6Cgo+IENoZWNrIGlm
IGEgYnJpZ2h0bmVzcyBjdXJ2ZSBzcGVjaWZpZWQgaW4gdGhlIGRldmljZSB0cmVlIGlzIGxpbmVh
ciBvcgo+IG5vdCBhbmQgc2V0IHRoZSBjb3JyZXNwb25kaW5nIHByb3BlcnR5IGFjY29yZGluZ2x5
LiBUaGlzIG1ha2VzIHRoZQo+IHNjYWxlIHR5cGUgYXZhaWxhYmxlIHRvIHVzZXJzcGFjZSB2aWEg
dGhlICdzY2FsZScgc3lzZnMgYXR0cmlidXRlLgo+IAo+IFRvIGRldGVybWluZSBpZiBhIGN1cnZl
IGlzIGxpbmVhciBpdCBpcyBjb21wYXJlZCB0byBhIGludGVycG9sYXRlZCBsaW5lYXIKPiBjdXJ2
ZSBiZXR3ZWVuIG1pbiBhbmQgbWF4IGJyaWdodG5lc3MuIFRoZSBjdXJ2ZSBpcyBjb25zaWRlcmVk
IGxpbmVhciBpZgo+IG5vIHZhbHVlIGRldmlhdGVzIG1vcmUgdGhhbiArLy01JSBvZiAke2JyaWdo
dG5lc3NfcmFuZ2V9IGZyb20gdGhlaXIKPiBpbnRlcnBvbGF0ZWQgdmFsdWUuCj4gCj4gU2lnbmVk
LW9mZi1ieTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+Cj4gQWNrZWQtYnk6
IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4gLS0tCj4gQ2hh
bmdlcyBpbiB2MzoKPiAtIG5vbmUKPiAKPiBDaGFuZ2VzIGluIHYyOgo+IC0gdXNlIDEyOCAocG93
ZXIgb2YgdHdvKSBpbnN0ZWFkIG9mIDEwMCBhcyBmYWN0b3IgZm9yIHRoZSBzbG9wZQo+IC0gYWRk
IGNvbW1lbnQgYWJvdXQgbWF4IHF1YW50aXphdGlvbiBlcnJvcgo+IC0gYWRkZWQgRGFuaWVsJ3Mg
J0Fja2VkLWJ5JyB0YWcKPiAtLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMg
fCAzMCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMw
IGluc2VydGlvbnMoKykKCkFwcGxpZWQsIHRoYW5rcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaW
r10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291
cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0
ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
