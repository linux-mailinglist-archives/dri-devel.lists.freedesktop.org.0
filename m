Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA58A5317
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 11:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA5A8981D;
	Mon,  2 Sep 2019 09:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456F58981D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 09:41:54 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c3so13290662wrd.7
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 02:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ZL2haMI2aTtJurgKOti2qg6P2dpB10rrMYX8xsD2bK8=;
 b=mP6P6QyFOhe+qkcf5rZtKrPFQ1zqHnakTzuCQArfApS2bLQ9DL+iPrW05K+KtC7IZ0
 dEWCtzdhSpBdihtftL2wH+dyct3/5VSC3M2an5s4KWJwUyI8NUuJEjl4Su4AkxkfcZEO
 F8sNhGe9sg50GA9RF4h1wVZzDfjz4RrzCbIuX7XnQ9XRhUlaTkPo64A3NIIgajlxnA5D
 06ieyXzncQxMWxw8YdPX1dqcUjC5uaWLU0eIt4prOA41vGNZrM++OtDo3RyCMSM/KL0W
 4xQxdKLd4FXNgegYAGwvqq4mwSC0iBj4QT5hAWQg1s51bU06GHkdSA6As1ouQv0H87GU
 WPBw==
X-Gm-Message-State: APjAAAU65BQDEdOag48AO0wufRFKMUAmpyT6hq7QQOyarFchBFx3Jn2k
 V7wMCQC2IkWvf07pKu2ibSq0Hw==
X-Google-Smtp-Source: APXvYqz+ei3zvK9WDCLGPKSb6mZHeIVD4NjOj/SiGtZ3rCzqedIErcw16UBzZxGSMgr8fc4SWNzRbQ==
X-Received: by 2002:a5d:51c6:: with SMTP id n6mr14215758wrv.206.1567417312894; 
 Mon, 02 Sep 2019 02:41:52 -0700 (PDT)
Received: from dell ([95.147.198.93])
 by smtp.gmail.com with ESMTPSA id j26sm4577684wrd.2.2019.09.02.02.41.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Sep 2019 02:41:52 -0700 (PDT)
Date: Mon, 2 Sep 2019 10:41:50 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v3 3/4] backlight: pwm_bl: Set scale type for CIE 1931
 curves
Message-ID: <20190902094150.GN32232@dell>
References: <20190709190007.91260-1-mka@chromium.org>
 <20190709190007.91260-4-mka@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190709190007.91260-4-mka@chromium.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=ZL2haMI2aTtJurgKOti2qg6P2dpB10rrMYX8xsD2bK8=;
 b=Jp3giVDeY/0YoOVsPWRfoipAvNrzI7SL/np7C/5ElKhomtCfzrE5qjSsgFLnvv+6ZH
 lILykF95Pb4ijIZzZkaRiTqqBEIeFeKsVvMtQvJ6lBPBwxjaQVfXsjEyVLkPFCKXE4B3
 DrWHHs+HbI/F+q3dhSOuFdgQsNXLr0nM2yrOla+U/Aw8bvW0fsrUez9tDU4q4HSs2cB4
 3UtfZt8rdx6Gl4LZk1oY0gUY8s7knHlKkWdn3nwNRkUjShH/h3ie/SGOfYieJgjpA2XY
 2DI18qzAQKD2TsWZW7QDG9lKvubbZH1Kkkp4cH54fJQ0CZG37DAim0aE1ELf7PWuLK4/
 zkJw==
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

T24gVHVlLCAwOSBKdWwgMjAxOSwgTWF0dGhpYXMgS2FlaGxja2Ugd3JvdGU6Cgo+IEZvciBiYWNr
bGlnaHQgY3VydmVzIGNhbGN1bGF0ZWQgd2l0aCB0aGUgQ0lFIDE5MzEgYWxnb3JpdGhtIHNldAo+
IHRoZSBicmlnaHRuZXNzIHNjYWxlIHR5cGUgdG8gbm9uLWxpbmVhci4gVGhpcyBtYWtlcyB0aGUg
c2NhbGUgdHlwZQo+IGF2YWlsYWJsZSB0byB1c2Vyc3BhY2UgdmlhIHRoZSAnc2NhbGUnIHN5c2Zz
IGF0dHJpYnV0ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBLYWVobGNrZSA8bWthQGNo
cm9taXVtLm9yZz4KPiBUZXN0ZWQtYnk6IEVucmljIEJhbGxldGJvIGkgU2VycmEgPGVucmljLmJh
bGxldGJvQGNvbGxhYm9yYS5jb20+Cj4gQWNrZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVs
LnRob21wc29uQGxpbmFyby5vcmc+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MzoKPiAtIG1hcmsgc2Nh
bGUgYXMgbm9uLWxpbmVhciBpbnN0ZWFkIG9mIHVzaW5nIHRoZSBDSUUxOTMxIHR5cGUgd2hpY2gK
PiAgIGhhcyBiZWVuIHJlbW92ZWQKPiAtIHVwZGF0ZWQgY29tbWl0IG1lc3NhZ2UKPiAKPiBDaGFu
Z2VzIGluIHYyOgo+IC0gYWRkZWQgRW5yaWMncyAnVGVzdGVkLWJ5JyB0YWcKPiAtIGFkZGVkIERh
bmllbCdzICdBY2tlZC1ieScgdGFnCj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3
bV9ibC5jIHwgNSArKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpBcHBsaWVkLCB0aGFua3MuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxp
bmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBz
b2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwg
QmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
