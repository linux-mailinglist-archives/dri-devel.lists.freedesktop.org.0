Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AB12B3F0E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 09:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC89689DA9;
	Mon, 16 Nov 2020 08:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C22889DA9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 08:48:55 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id h21so2060437wmb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 00:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bytOyaTdOaNPlL5Eeo/KhiZTN4i5aXJrm4o5Lrz7ER8=;
 b=2RNqv42H/eGo/quWg2lndaDw7RHeYBpTfnlVf3NL0B6MtJutBTKBkARf0JuHnC++ZQ
 k6+HYR9B4/VQFOmC0JsGByoNCqLDhF7Nc6jMF1G6YyDQbT/ODTk8boMFbvIEoLlp09tn
 lF4dic3X48hOniW9hqlVA5jS8Rgq8/4EkIXqimVDsAMPbGA8J7znIbq8JZPZpvXAWYDm
 dNwa5VchRcS5guKRH3Z+23PZrkPKFcx6Y1mL/BwpFrlV2s5zTjwTIR9PiXxuLMiPmeR+
 qV1AStBx3V21I3FVobie7PMI5b701emozvn8F0KG35/FQhYCCvZrkw8atSelsdNtdIhc
 T4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bytOyaTdOaNPlL5Eeo/KhiZTN4i5aXJrm4o5Lrz7ER8=;
 b=LqJhtboglqzGGPTWd36YumNu22/m6d2E3c1REpeedYaa2DeT4h5EVsq6/Xl97cC/QK
 +8api+9XtILlkV7rzdkuwvGJylLqFqfvTjTPRFUyJBZuUHuALfsh/v9VKU+JZkpth37D
 U0olvuhcL98QSjytWs7imt0KMlYldhysHiTjkkVdsSjjzomc0BQoXA39qbiROnNIXYhG
 e5aNF3CtAyklxT939xTsBrqekHMIobfJij/75lmiykeKJhbv/iAOVIC+FuzNgxOGWcnl
 IOp+Wfs3m7Zf0LsAF2JBpLExXuZNU70LdkZB5Sgnk9PxrUssYCi3Q+7qB6supadud6I+
 eFYQ==
X-Gm-Message-State: AOAM532q7Qr4itdWorQFFX76X/zNPjBhYO3SECY5ikdnkfD8mnL/pIFp
 3FKpQu6sX3HYRLEh7ae4C8hl+g==
X-Google-Smtp-Source: ABdhPJyoPNoNZwRvVQk1Wah6zgtln7DoTbb8M4M/f0bmQrNiR53tBKdWzgyzrEfhRymXF+k/UCqJOg==
X-Received: by 2002:a1c:a555:: with SMTP id o82mr14314602wme.188.1605516534118; 
 Mon, 16 Nov 2020 00:48:54 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:edb9:72a:9e35:6eb?
 ([2a01:e35:2ec0:82b0:edb9:72a:9e35:6eb])
 by smtp.gmail.com with ESMTPSA id k20sm18632864wmi.15.2020.11.16.00.48.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 00:48:52 -0800 (PST)
Subject: Re: [PATCH 14/40] drm/meson/meson_venc: Make local function
 'meson_venc_hdmi_get_dmt_vmode' static
To: Lee Jones <lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-15-lee.jones@linaro.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <46c423b8-8c1b-a2b8-91d7-12cde980f5fc@baylibre.com>
Date: Mon, 16 Nov 2020 09:48:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201113134938.4004947-15-lee.jones@linaro.org>
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTMvMTEvMjAyMCAxNDo0OSwgTGVlIEpvbmVzIHdyb3RlOgo+IEZpeGVzIHRoZSBmb2xsb3dp
bmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vbWVz
b24vbWVzb25fdmVuYy5jOjg5Mzo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9y
IOKAmG1lc29uX3ZlbmNfaGRtaV9nZXRfZG10X3Ztb2Rl4oCZIFstV21pc3NpbmctcHJvdG90eXBl
c10KPiAKPiBDYzogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgo+IENj
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KPiBDYzogS2V2aW4gSGlsbWFuIDxraGlsbWFuQGJheWxpYnJlLmNvbT4K
PiBDYzogSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Cj4gQ2M6IE1hcnRpbiBC
bHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+Cj4gQ2M6IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNv
bi9tZXNvbl92ZW5jLmMKPiBpbmRleCBmOTNjNzI1YjZmMDJkLi41ZTIyMzZlYzE4OWZhIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuYy5jCj4gQEAgLTg5MCw4ICs4OTAsOCBAQCBib29s
IG1lc29uX3ZlbmNfaGRtaV9zdXBwb3J0ZWRfdmljKGludCB2aWMpCj4gIH0KPiAgRVhQT1JUX1NZ
TUJPTF9HUEwobWVzb25fdmVuY19oZG1pX3N1cHBvcnRlZF92aWMpOwo+ICAKPiAtdm9pZCBtZXNv
bl92ZW5jX2hkbWlfZ2V0X2RtdF92bW9kZShjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAq
bW9kZSwKPiAtCQkJCSAgIHVuaW9uIG1lc29uX2hkbWlfdmVuY19tb2RlICpkbXRfbW9kZSkKPiAr
c3RhdGljIHZvaWQgbWVzb25fdmVuY19oZG1pX2dldF9kbXRfdm1vZGUoY29uc3Qgc3RydWN0IGRy
bV9kaXNwbGF5X21vZGUgKm1vZGUsCj4gKwkJCQkJICB1bmlvbiBtZXNvbl9oZG1pX3ZlbmNfbW9k
ZSAqZG10X21vZGUpCj4gIHsKPiAgCW1lbXNldChkbXRfbW9kZSwgMCwgc2l6ZW9mKCpkbXRfbW9k
ZSkpOwo+ICAKPiAKClJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXls
aWJyZS5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
