Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C13E2B010F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 09:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41626E1B7;
	Thu, 12 Nov 2020 08:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2AF89FC8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 11:53:08 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 74so2774891lfo.5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 03:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7ZZROP0sgrWHXocXnplwQP153jh2UvOQmbtx2+3HJts=;
 b=VDHfOsx5tdF1+TEbA9a+WK+1K/9Tb7pL4h4a0lCdKYC9AvhOD1vNem3XsG1qco/wvO
 0xKNAMrZQtWJ16M27HgiN1ZxuC3w58O6aJ6bNOlWyExcY+HC90ZFuJGsKVtSGBk1pF7+
 3BdhUwuyIUIGw5RSwlLwTdwrG98bLKoJkO/Zwa+tGJkGb+oHhlVZni64NU0YI+jpucTx
 fqqE9Yk3E/N8zSaBoghyH3PPfKznx7gx8jYb3kRPBQ/GGGIUCge6ZLRdNYptenj83Abg
 whPrhOqDaNe8xG3lgtJsgN0b/p8IBPuSnRj4jZ+Zj0zI9TKLSnoD880LA7NJqmCN5Eok
 Cmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7ZZROP0sgrWHXocXnplwQP153jh2UvOQmbtx2+3HJts=;
 b=cW6f6i3AEAnOEj1MCkChKko0YLB3HnA7DkMmR7g1PpU5R2GSGWCG52/FNBfupIL47G
 DxJsCbnvu1qHGkqxPJ4wooQR2eJz3UFitiQq1OA7OLoqKkLnPbojWMKG+pWbBLbpba9h
 5qf5DeTfpMHNi+fiz1YykJXKxNtFkKzOTjwl+hitHbXxVpk4Tg753Wf0/VR8LJD2geh0
 sVKH6i4f5eRBkRH0hymWG+CMntC6LFGRYxAb8ThnNG+cQExIrKwnNe59qsDrSDy3Udd3
 /Q+E4labnvhjLWB/nJBVpp5qdw1UNVu2PSFEUw7aOXhxN5aOc7XC55xBoABdBZakywTZ
 sjLA==
X-Gm-Message-State: AOAM530RCAxAlPToOcCuhiVADbj+XSslPXX2mjxBt9jtQXmGw5hDWq2K
 l6yKo0xRmQZ74W+7Tl/DAujFSp5aE6k=
X-Google-Smtp-Source: ABdhPJys5kC2mfxaGiOj4U9JzSI2ZsqED+u2tQRuzy4x85ctO/59VCN+LkZEfQ5NBKjvOOJscwMFxw==
X-Received: by 2002:a19:f510:: with SMTP id j16mr8923883lfb.389.1605095586937; 
 Wed, 11 Nov 2020 03:53:06 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id 3sm208760ljq.96.2020.11.11.03.53.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 03:53:06 -0800 (PST)
Subject: Re: [PATCH v8 11/26] memory: tegra124-emc: Make driver modular
From: Dmitry Osipenko <digetx@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20201111011456.7875-1-digetx@gmail.com>
 <20201111011456.7875-12-digetx@gmail.com> <20201111090434.GB4050@kozik-lap>
 <f44b64f5-6b08-5f1e-4f9b-a73a1705d493@gmail.com>
 <20201111092619.GD4050@kozik-lap>
 <a75e72b9-273a-4492-09e6-d02a5ea58482@gmail.com>
Message-ID: <79a2f436-93f6-e461-fb12-6d7c8a8cfac5@gmail.com>
Date: Wed, 11 Nov 2020 14:53:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <a75e72b9-273a-4492-09e6-d02a5ea58482@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 12 Nov 2020 08:15:51 +0000
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
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTEuMTEuMjAyMCAxMzoyNSwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMTEuMTEuMjAy
MCAxMjoyNiwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+Pj4gMTEuMTEuMjAyMCAx
MjowNCwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+Pj4+PiAtb2JqLSQoQ09ORklH
X1RFR1JBMTI0X0VNQykJCSs9IGNsay10ZWdyYTEyNC1lbWMubwo+Pj4+PiArb2JqLSQoQ09ORklH
X0FSQ0hfVEVHUkFfMTI0X1NPQykJKz0gY2xrLXRlZ3JhMTI0LWVtYy5vCj4+Pj4+ICtvYmotJChD
T05GSUdfQVJDSF9URUdSQV8xMzJfU09DKQkrPSBjbGstdGVncmExMjQtZW1jLm8KPj4+PiBIb3cg
aXMgaXQgcmVsYXRlZCB0byBtb2R1bGFyaXphdGlvbj8gSXQgbG9va3MgbGlrZSBkaWZmZXJlbnQg
aXNzdWUgaXMKPj4+PiBmaXhlZCBoZXJlLgo+Pj4gVGhlIENPTkZJR19URUdSQTEyNF9FTUMgbm93
IGNvdWxkIGJlICdtJywgd2hpbGUgdGhlIGNsb2NrIGNvZGUgbXVzdCBiZQo+Pj4gYnVpbHQtaW4u
IFRoZSBURUdSQTEyNCBFTUMgZHJpdmVyIGlzIHVzZWQgYnkgVDEyNCBhbmQgVDEzMiBTb0NzLlwK
Pj4gTWhtbSwgIHRoZSBDT05GSUdfVEVHUkExMjRfRU1DIGRlcGVuZHMgb24gQVJDSF9URUdSQV8x
MjRfU09DIHNvIG9uIHRoZQo+PiBjb25maWcgIUFSQ0hfVEVHUkFfMTI0X1NPQyAmJiBBUkNIX1RF
R1JBXzEzMl9TT0MgdGhpcyB3YXMgbm90Cj4+IHNlbGVjdGVkLiBOb3cgaXQgd2lsbCBiZSBzZWxl
Y3RlZC4KPj4KPiAKPiBUaGUgZHJpdmVyIGlzbid0IGV4cG9zZWQgb24gQVJNNjQgcHJvYmFibHkg
YmVjYXVzZSBub2JvZHkgYm90aGVyZWQgdG8gZG8KPiBpdCBzbyBmYXIuIEJ1dCBpdCdzIG5vdCBh
bHNvIHRoZSBtZW1vcnkgZHJpdmVyIHdoaWNoIGRlcGVuZHMgb24KPiBjbGstdGVncmExMjQtZW1j
Lm8sIGl0J3MgYWxzbyB0aGUgbWFpbiBjbGsvdGVncmEvY2xrLXRlZ3JhMTI0LmMgZHJpdmVyCj4g
aXRzZWxmLCB3aGljaCBpcyBhbHNvIHVzZWQgYnkgYm90aCBUMTI0LzEzMi4KPiAKCkFjdHVhbGx5
LCBpdCBzaG91bGRuJ3QgYmUgZGlmZmljdWx0IHRvIGtlZXAgdGhlIG9sZCBjb25kaXRpb24gZm9y
CmNsay10ZWdyYTEyNC1lbWMubyBieSBzbGlnaHRseSBpbXByb3ZpbmcgdGhlIEtjb25maWcuIEkn
bGwgZG8gaXQgaW4gdGhlCm5leHQgcmV2aXNpb24uCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
