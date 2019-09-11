Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A01AFACF
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 12:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687E06EA80;
	Wed, 11 Sep 2019 10:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0E66EA80
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 10:51:51 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g207so2865277wmg.5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 03:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Uryc0/pqdqKJAZc5VoGKLbUrzv2t7H2FdK8rw8hlLgg=;
 b=fmOXhVHTNr4oAAkLM8HPqQBECrt2ClnLVwCR443L2cqsD89mfr2eKv5nBwnbETgsR3
 yZIaMGi6ioQGKMri9lZoFK2Nl/mr25ulIcFzatwBhHLlFpAxl9t3r8F6R/CKDw6XMHj4
 lf05sRbx3Tfe5Q+AJeGbNCV+jQEfpd9eocZaDevtP6euTE8nzgkrbXIfwzhKztkNtcco
 Tuq0jUNBP0LD+wAwSgk7cXqy87zGMZIbhXVpOF6QLK09nW3gOXZMeif4TTpbmLsAxPGu
 xpUYmMSbZX9MceWKOcw5xVLC8qRYLBxi8rKfSQGf4VgycM1qlES9Oef7zIPOqpfhfw+9
 aeiw==
X-Gm-Message-State: APjAAAULKdybW6V3JLtR9ZYcm2CW9qYGIW/+t9VEgYilx4aISH/3+81v
 1khtMmvQLOfOoTJE7Tov7M91VA==
X-Google-Smtp-Source: APXvYqxQ+TkhPae6YnwpETNmnZCKnGfRVMJswmmeya3cK+zZE7nfR1qS/48jxDEUAMDXwJhtaDBYyw==
X-Received: by 2002:a1c:110:: with SMTP id 16mr3544521wmb.88.1568199110456;
 Wed, 11 Sep 2019 03:51:50 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id b144sm2485131wmb.3.2019.09.11.03.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 03:51:49 -0700 (PDT)
Date: Wed, 11 Sep 2019 11:51:48 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH] backlight: lm3630a: fix module aliases
Message-ID: <20190911105148.4prmcr2f2r36sgrf@holly.lan>
References: <20190910152359.7448-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190910152359.7448-1-andreas@kemnade.info>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Uryc0/pqdqKJAZc5VoGKLbUrzv2t7H2FdK8rw8hlLgg=;
 b=YeChDvIWXEB0TstAMgYAD4rorZ17PMeVJH48y0XNFopRTKZkFqUzX25bM6/kDkwlSB
 viruUn+aG6aBu7i775BC0uPh+Nsgx/H/fOmG9216rwKNJhReVC/5NFTPYosGl7ssOqXf
 Ip70bQ66StWipRujTpPgoTIYal+mCceDScD4Xpm6y026t3KvdNv8aQG0AX1QCn4xSqqg
 J2DFJGyp8hAvpPJxNa+g/OKeKf5D0HyIxw3JdyOMhYjvFneVT7aV2X+MA1yMM361/1py
 /X/tC/wr7UCCvVd8QF24ZWpp+8FpWc8i3kUAx2gpGTztEI/E2jSfyarbbeJ/q9Js94L+
 T3Fw==
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hns@goldelico.com, lee.jones@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMDU6MjM6NTlQTSArMDIwMCwgQW5kcmVhcyBLZW1uYWRl
IHdyb3RlOgo+IERldmljZXRyZWUgYWxpYXNlcyBhcmUgbWlzc2luZywgc28gdGhhdCBtb2R1bGUg
YXV0b2xvYWRpbmcKPiBkb2VzIG5vdCB3b3JrIHByb3Blcmx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEFuZHJlYXMgS2VtbmFkZSA8YW5kcmVhc0BrZW1uYWRlLmluZm8+CgpSZXZpZXdlZC1ieTogRGFu
aWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KCgo+IC0tLQo+ICBkcml2
ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2JsLmMgfCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2JsLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC9sbTM2MzBhX2JsLmMKPiBpbmRleCAzYjQ1YTE3MzMxOTguLjlkNjdjMDdkYjJmMiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2JsLmMKPiArKysgYi9kcml2
ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2JsLmMKPiBAQCAtNjE3LDEyICs2MTcsMTQgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkIGxtMzYzMGFfaWRbXSA9IHsKPiAgCXt9
Cj4gIH07Cj4gIAo+ICtNT0RVTEVfREVWSUNFX1RBQkxFKGkyYywgbG0zNjMwYV9pZCk7Cj4gKwo+
ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBsbTM2MzBhX21hdGNoX3RhYmxlW10g
PSB7Cj4gIAl7IC5jb21wYXRpYmxlID0gInRpLGxtMzYzMGEiLCB9LAo+ICAJeyB9LAo+ICB9Owo+
ICAKPiAtTU9EVUxFX0RFVklDRV9UQUJMRShpMmMsIGxtMzYzMGFfaWQpOwo+ICtNT0RVTEVfREVW
SUNFX1RBQkxFKG9mLCBsbTM2MzBhX21hdGNoX3RhYmxlKTsKPiAgCj4gIHN0YXRpYyBzdHJ1Y3Qg
aTJjX2RyaXZlciBsbTM2MzBhX2kyY19kcml2ZXIgPSB7Cj4gIAkuZHJpdmVyID0gewo+IC0tIAo+
IDIuMTEuMAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
