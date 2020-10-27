Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C7C29CEB1
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99086E4B7;
	Wed, 28 Oct 2020 08:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB236EC43
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 20:25:34 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 126so3997991lfi.8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 13:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VTXQrHTGLs/knVunju7s+4jC1elCcsEm6LiqWGczAOI=;
 b=IDlcxJUUO1ignMzHcKScWArX+JLa0B/wtkjwa+XqNZfVCgFQ+q//5075QoHnaqEmSN
 4Zgtxq3XetCP3KE9RukHxI2+GlnV+hVTkJxBs3DD8Pwr060BgQxWvF4+IMbUfNtWkswJ
 t8KNrMGfRdjxKIoJD2tMbH0bn8weWLtnEr1HBu1NDPcvHUNDmsAvUPpWb4LamG6b0vBv
 5jBxGWiJ3FVAbZRfcVCjcJuNMTCz9fHBvn3FAMH1rSFVCl+8hKk31loDa3OOX1BGIzYx
 UWX6aHGFi3DUccCqz9OY8dLShO/A2aDfG+k8xCRF2lkGW1wZroeeAywT1/IgVcUNaALb
 W0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VTXQrHTGLs/knVunju7s+4jC1elCcsEm6LiqWGczAOI=;
 b=hsMQUZDJ0jU1CUhDEsbXdpV+8ubhKGf7g8zBVUJj72V1lUq8DzxER5NHcQK4SKCeV/
 BMWIGCunUh18iU7qVk1Dn26ci5TNlSa+I3GeyZBH482auKQblOHdRNlLg77UcFx6O/ZW
 6Xy8NBJ5so2GqqG2Z3EmyO3oPhKenOt2Ae3y1HQ8LZP/9FAC7dju4Kz+CU00rYx4LNEp
 F8nIDlC055hh8u8U8rfamrcT404Wu/HK6fr5OQEZm/FID8K9EdX01avStlFkfdzoLPzJ
 XAQlz8KzNyHyVinfq+7KxcHYnJfZISqZZGv6lgZy4WcNCuFyU6H0wC6lZW9BM3J6a+Xw
 l0JA==
X-Gm-Message-State: AOAM533adCuUBBMCHkua+5rPZaz5+gLvQiu+KnBVtMwi0zbWFGyOpHn/
 Pf65phVhRK/gUIKED07QCq3FNf5/q8Y=
X-Google-Smtp-Source: ABdhPJyW7vkaNh0PaEpaOoYYagFca4oW2bsF5xEK54yv6TkubEGC09bzXNErjsukUFxfN3ye8lLohw==
X-Received: by 2002:a19:bed7:: with SMTP id o206mr1351034lff.360.1603830332966; 
 Tue, 27 Oct 2020 13:25:32 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.googlemail.com with ESMTPSA id j23sm137806lfm.16.2020.10.27.13.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 13:25:32 -0700 (PDT)
Subject: Re: [PATCH v6 33/52] memory: tegra20: Support interconnect framework
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-34-digetx@gmail.com> <20201027100951.GA17089@kozik-lap>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2eee94bc-10a7-acef-3b50-7b6fd7ceba70@gmail.com>
Date: Tue, 27 Oct 2020 23:25:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201027100951.GA17089@kozik-lap>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:31 +0000
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjcuMTAuMjAyMCAxMzowOSwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgouLi4KPj4g
K2Vycl9tc2c6Cj4+ICsJZGV2X2VycihlbWMtPmRldiwgImZhaWxlZCB0byBpbml0aWFsaXplIElD
QzogJWRcbiIsIGVycik7Cj4gCj4gWW91IHdpbGwgcHJpbnQgc3VjaCBlcnJvcnMgb24gYWxsIGV4
aXN0aW5nIERUQnMuIFNpbmNlIGl0IGlzIG5vdCBhCj4gZmFpbHVyZSBvZiBwcm9iZSAoaXQgaXMg
YWN0dWFsbHkgcXVpdGUgZXhwZWN0ZWQsIG5vcm1hbCBzaXR1YXRpb24gd2hlbgo+IGJvb3Rpbmcg
d2l0aCBvbGRlciBEVEIpLCBsZXQncyBjaGFuZ2UgaXQgdG8gd2FybmluZyAoaGVyZSBhbmQgaW4g
YWxsCj4gb3RoZXIgcGxhY2VzIGFuZCBkcml2ZXJzKS4KClRoZSBleGlzdGluZyBEVEJzIHdpbGwg
YmUgc3RvcHBlZCBvbiB0aGUgZXJyb3IgbWVzc2FnZSBiZWxvdy4KCj4+ICsKPj4gKwlyZXR1cm4g
ZXJyOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgaW50IHRlZ3JhX2VtY19vcHBfdGFibGVfaW5pdChz
dHJ1Y3QgdGVncmFfZW1jICplbWMpCj4+ICt7Cj4+ICsJY29uc3QgY2hhciAqcm5hbWUgPSAiY29y
ZSI7Cj4+ICsJaW50IGVycjsKPj4gKwo+PiArCS8qCj4+ICsJICogTGVnYWN5IGRldmljZS10cmVl
cyBkb24ndCBoYXZlIE9QUCB0YWJsZSBhbmQgRU1DIGRyaXZlciBpc24ndAo+PiArCSAqIHVzZWZ1
bCBpbiB0aGlzIGNhc2UuCj4+ICsJICovCj4+ICsJaWYgKCFkZXZpY2VfcHJvcGVydHlfcHJlc2Vu
dChlbWMtPmRldiwgIm9wZXJhdGluZy1wb2ludHMtdjIiKSkgewo+PiArCQlkZXZfZXJyKGVtYy0+
ZGV2LCAiT1BQIHRhYmxlIG5vdCBmb3VuZFxuIik7Cj4+ICsJCWRldl9lcnIoZW1jLT5kZXYsICJw
bGVhc2UgdXBkYXRlIHlvdXIgZGV2aWNlIHRyZWVcbiIpOwo+PiArCQlyZXR1cm4gLUVOT0RFVjsK
Pj4gKwl9CgpUaGUgZXhpc3RpbmcgRFRCcyBhcmUgc3RvcHBlZCBoZXJlLgoKLi4uCj4+ICsJZXJy
ID0gdGVncmFfZW1jX29wcF90YWJsZV9pbml0KGVtYyk7Cj4+ICsJaWYgKGVycikKPj4gKwkJZ290
byB1bnJlZ19ub3RpZmllcjsKPiAKPiBUaGlzIGxvb2tzIGxpa2UgdGhlIEFCSSBicmVhayBJIG1l
bnRpb25lZCBhcm91bmQgRFQgYmluZGluZ3MuIEFyZSB0aGUKPiBiaW5kaW5ncyBtYXJrZWQgYXMg
dW5zdGFibGU/CgpUaGlzIFQyMCBFTUMgZHJpdmVyIHdhc24ndCBldmVyIHVzZWQgc28gZmFyIGF0
IGFsbCBhbmQgdGhpcyBzZXJpZXMgbWFrZXMKaXQgdXNlZnVsLiBIZW5jZSBJIHRoaW5rIGl0IHNo
b3VsZCBiZSBmaW5lIHRvIGFzc3VtZSB0aGF0IHRoZSBUMjAgRU1DCkFCSSBpcyB1bnN0YWJsZS4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
