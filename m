Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCC12D5E1C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7236E3F7;
	Thu, 10 Dec 2020 14:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F796E3F7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 14:40:49 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id d9so5740537iob.6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 06:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=d4LZazcEk4MFX1qHLGHiKS1Th2EI2Tgbz/+dKarKOJU=;
 b=e6z/NFYeQUVhfdYZqe5DejzSFYW4cHjElw6aAgjnK8eSZ9+ruf8dLLyI5y7rRQAtsQ
 1VEel+RGMX9uzSP4P7Pgf5oQkyQ3q2yr/LdAYXIOgjYk29efEnt2xd3efk+2xKH1VQkO
 tT6cwts1CW76AUBWhNXO11t/0I0fQrXtNzbR+rhlte3I+GXuSra0B00RljRzZHqD1MeY
 frGfNIHe1Y7FfO3zucoSAEfrtK71Mjce8ySwaLCLkjynjOv7FSgP/1lnsKTGuOPDUBb4
 7l8OADqABeEZ1XTJqWBRzmWUFvvdGfgPPxfZdRIKr+9wj44HyWK19MUydpHxBu71nso4
 QbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=d4LZazcEk4MFX1qHLGHiKS1Th2EI2Tgbz/+dKarKOJU=;
 b=RoGqTJ/+auGirR+6lwKm1GIXZ3e9PeJPHryOS/Hzei4fBrtpPejqyQyQIcc9L9MHPJ
 OjY55hDu9blst0n/hdnXA0Z2qJgAkVe1S5vRV4NDP06SSSpyGVzFPQ5hieFPcus62fFu
 vHDeNDG0xx2s+QK7EBPiyWVnA+admalSLH5ReE/P8qoJvJmXkQJONoAz7wsVU5hpTXZE
 c6HyoB+Hy2qFB2K9gsLYf1HH1haBnpN846Z5qZ1WPALfqrVN5zrLEXH9DwVAtVepJWEh
 UEbqsE/FS9hEqqUYPz45kLYiPuqgapPASKHv67p3uVBNFK3DKkQdxHSvMlmu9+0WhFC6
 mjcQ==
X-Gm-Message-State: AOAM5335GYCBU1VfhtcMK6vAitcHTh5v8DQCrGFRiLN3AqSfaQksY/I+
 buFgHGF5kyRI6wqNUh4G2QvwM6wqvqHOSTfAJnObdg==
X-Google-Smtp-Source: ABdhPJwlq+TsPSvE8TskLkr0+AmZHyi24uQRirb4JJ2onz25/t1Egdli2Vn1XItnxRoQrIZjEB6ykw00LzqN2pi75Pc=
X-Received: by 2002:a05:6638:1027:: with SMTP id
 n7mr8943390jan.35.1607611247949; 
 Thu, 10 Dec 2020 06:40:47 -0800 (PST)
MIME-Version: 1.0
References: <20201208044022.972872-1-bjorn.andersson@linaro.org>
 <20201210015136.GA18407@dragon>
 <20201210130453.regjkemfneqbelsi@pengutronix.de>
In-Reply-To: <20201210130453.regjkemfneqbelsi@pengutronix.de>
From: Shawn Guo <shawn.guo@linaro.org>
Date: Thu, 10 Dec 2020 22:40:36 +0800
Message-ID: <CAAQ0ZWQEhitxNCKBjTNGcv5E+yqwjfbb5GCLoctpJM7u4Zpp=A@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Implement the pwm_chip
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-pwm@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee.jones@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVXdlLAoKT24gVGh1LCBEZWMgMTAsIDIwMjAgYXQgOTowNSBQTSBVd2UgS2xlaW5lLUvDtm5p
Zwo8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPiA+ID4gQEAgLTExMSw2
ICsxMTgsOCBAQAo+ID4gPgo+ID4gPiAgI2RlZmluZSBTTl9MSU5LX1RSQUlOSU5HX1RSSUVTICAg
ICAgICAgICAgIDEwCj4gPiA+Cj4gPiA+ICsjZGVmaW5lIFNOX1BXTV9HUElPICAgICAgICAgICAg
ICAgICAgICAgICAgMwo+ID4KPiA+IFNvIHRoaXMgbWFwcyB0byB0aGUgR1BJTzQgZGVzY3JpYmVk
IGluIHNuNjVkc2k4NiBkYXRhc2hlZXQuICBJJ20KPiA+IHdvbmRlcmluZyBpZiBpdCdzIG1vcmUg
cmVhZGFibGUgdG8gZGVmaW5lIHRoZSBmb2xsb3dpbmcgU0hJRlQgY29uc3RhbnRzCj4gPiAoeW91
ciBjb2RlKSwgYW5kIHVzZSBHUElPX01VWF9HUElPNF9TSElGVCA+PiAyIHdoZXJlIHlvdSBuZWVk
IEdQSU8KPiA+IG9mZnNldD8KPiA+Cj4gPiAjZGVmaW5lICBHUElPX01VWF9HUElPMV9TSElGVCAw
Cj4gPiAjZGVmaW5lICBHUElPX01VWF9HUElPMl9TSElGVCAyCj4gPiAjZGVmaW5lICBHUElPX01V
WF9HUElPM19TSElGVCA0Cj4gPiAjZGVmaW5lICBHUElPX01VWF9HUElPNF9TSElGVCA2Cj4gPgo+
ID4gSWYgeW91IGFncmVlLCB5b3UgbWF5IGNvbnNpZGVyIHRvIGludGVncmF0ZSB0aGlzIHBhdGNo
IGJlZm9yZWhhbmQ6Cj4gPgo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3NoYXduZ3VvMi9saW51eC9j
b21taXQvN2NkZTg4N2ZmYjNiMjdhMzZlNzdhMDhiZWUzNjY2ZDE0OTY4YjU4Ngo+Cj4gTXkgcHJl
ZmVycmVkIHdheSBoZXJlIHdvdWxkIGJlIHRvIGFkZCBhIHByZWZpeCBmb3IgdGhlIG90aGVyIGNv
bnN0YW50cy4KPiBJdCAoSU1ITykgbG9va3MgbmljZXIgYW5kCj4KPiAgICAgICAgIEdQSU9fSU5Q
VVRfU0hJRlQKPgo+IGxvb2tzIGxpa2UgYSBxdWl0ZSBnZW5lcmljIG5hbWUgZm9yIGEgaGFyZHdh
cmUgc3BlY2lmaWMgZGVmaW5pdGlvbi4KCldoaWxlIHRoaXMgbG9va3MgbGlrZSBhIHJlYXNvbmFi
bGUgYXJndW1lbnQsIEkgYWxzbyBsaWtlIHRoZSBuYW1pbmcKY2hvaWNlIGZvciB0aGVzZSBjb25z
dGFudHMgaW4gdGhlIGJlZ2lubmluZyBmb3IgdGhhdCBkaXN0aW5jdGlvbgpiZXR3ZWVuIHJlZ2lz
dGVycyBhbmQgYml0cy4gIEFuZCBjaGFuZ2luZyB0aGUgbmFtZXMgdGhlIG90aGVyIHdheQphcm91
bmQgbWVhbnMgdGhlcmUgd2lsbCBiZSBhIG11Y2ggYmlnZ2VyIGRpZmZzdGF0LCB3aGljaCBJIHdv
dWxkIGxpa2UKdG8gYXZvaWQuICBJIHN1Z2dlc3QgbGV0J3MganVzdCBmb2N1cyBvbiB3aGF0IHJl
YWxseSBtYXR0ZXJzIGhlcmUgLQprZWVwIHRoZSBuYW1pbmcgY29uc2lzdGVudCwgc28gdGhhdCBw
ZW9wbGUgZG8gbm90IGdldCBjb25mdXNlZCB3aGVuCnRoZXkgd2FudCB0byBhZGQgbW9yZSBjb25z
dGFudHMgaW4gdGhlcmUuCgpTaGF3bgoKPiAoRXZlbiBpZiB1cCB0byBub3cgdGhlcmUgaXMgbm8g
b3RoZXIgY29kZSBsb2NhdGlvbiB1c2luZyB0aGlzIG5hbWUuKQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
