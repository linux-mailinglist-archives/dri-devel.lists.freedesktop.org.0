Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6C72AEA9A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26F189FA5;
	Wed, 11 Nov 2020 07:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D1789E3B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 07:33:00 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id l2so1895760lfk.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 23:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V5haJlrCzHhZjookFyzKI1ofwRfXaAn0aRWFtwOvZPM=;
 b=mBY07o0WYOO3KPVX9ikNGcfO0oosoLOui+74cafSO4z+uokoYQoq0NNwCqF4dWSBQ5
 H4Jhs5vLdQ191L3nLezXVMst6CirPN7bQCoBhNSlb1bR9C75HchTsOU4ddLT2LL6mAWX
 Dvk0b4S/anJkLgSMSsODY9QpIeCgvo7oURWz9oY8W8HBi4y3f1xW8y9rvism9ipr+zA+
 doQKmSlzb/V6dTwBAB93tluEkYwJaFc90gfqF2go5vzYx9Yi0iQKS7Xp3SXnuidOBMPV
 vEJtVgsKSxOpZIyNYQiqGQg42YW5BgyZS4y/d0WBXlhV8yZfOg9LrGbckxALMCFwa4Yf
 +iMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V5haJlrCzHhZjookFyzKI1ofwRfXaAn0aRWFtwOvZPM=;
 b=Q+EgLw1JjAXY6ASr7mt9iB0dObstBJ1wP0kG9H9HJCKPSkBOSV7YNC6pQKDiWCg0+0
 pH/WcqUgY11P+1vtt16d2ahXZ6rdT2SOkOJrvQKyonUPMLqT/T3Y+ry+J1dmzln1BnJ5
 iGqpti/PYiWGy5rmISwCDhDDUh1t9zUnldAhfe8YXK6PzcPPkdb2gzBhqOPHM4takml9
 TVwDHy+wNYN9t9n8Azq1dGks51WUt80br4fqNH/ndt1duWea47kqZVNCUZYHcrWH4Cs3
 2AXOqKr2ZEFmuo2qIK3GQ8cD74p0r6N8GrzyBo0ixArcXfBNCwVi6RBrxHRae6p+0aBc
 k0XA==
X-Gm-Message-State: AOAM533nk17b8/gilVvhIhQI8f23rYyiPwe3pWeKkV4SXK/J2CGqbRt5
 ELbYmdes6y00o7YJk4xyyRzAaeveNd0=
X-Google-Smtp-Source: ABdhPJxhZEjV2QRG7aWHgF16Bn0c+eyj1kfpgdHs/q2P1g52eKn79RkzViwPJ+N7nj1DvZzVrM0B2Q==
X-Received: by 2002:ac2:43cf:: with SMTP id u15mr2226361lfl.382.1605079978165; 
 Tue, 10 Nov 2020 23:32:58 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id q7sm92352ljp.81.2020.11.10.23.32.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 23:32:57 -0800 (PST)
Subject: Re: [PATCH v8 09/26] memory: tegra30: Support interconnect framework
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201111011456.7875-1-digetx@gmail.com>
 <20201111011456.7875-10-digetx@gmail.com>
 <20201111055313.tefidnmc7f4yb3jk@vireshk-i7>
 <185e9140-fdce-29ef-68c3-aa7da02b249d@gmail.com>
 <20201111061855.2azilyhfoxwzpoir@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7f5c15c6-44d2-c997-442c-8f6670794f0e@gmail.com>
Date: Wed, 11 Nov 2020 10:32:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111061855.2azilyhfoxwzpoir@vireshk-i7>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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
 Krzysztof Kozlowski <krzk@kernel.org>, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTEuMTEuMjAyMCAwOToxOCwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMTEtMTEtMjAs
IDA5OjE0LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDExLjExLjIwMjAgMDg6NTMsIFZpcmVz
aCBLdW1hciDQv9C40YjQtdGCOgo+Pj4+ICtzdGF0aWMgaW50IHRlZ3JhX2VtY19vcHBfdGFibGVf
aW5pdChzdHJ1Y3QgdGVncmFfZW1jICplbWMpCj4+Pj4gK3sKPj4+PiArCXN0cnVjdCBvcHBfdGFi
bGUgKnJlZ19vcHBfdGFibGUgPSBOVUxMLCAqY2xrX29wcF90YWJsZSwgKmh3X29wcF90YWJsZTsK
Pj4+PiArCXUzMiBod192ZXJzaW9uID0gQklUKHRlZ3JhX3NrdV9pbmZvLnNvY19zcGVlZG9faWQp
Owo+Pj4+ICsJY29uc3QgY2hhciAqcm5hbWUgPSAiY29yZSI7Cj4+Pj4gKwlpbnQgZXJyOwo+Pj4+
ICsKPj4+PiArCS8qCj4+Pj4gKwkgKiBMZWdhY3kgZGV2aWNlLXRyZWVzIGRvbid0IGhhdmUgT1BQ
IHRhYmxlIGFuZCBFTUMgZHJpdmVyIGlzbid0Cj4+Pj4gKwkgKiB1c2VmdWwgaW4gdGhpcyBjYXNl
Lgo+Pj4+ICsJICovCj4+Pj4gKwlpZiAoIWRldmljZV9wcm9wZXJ0eV9wcmVzZW50KGVtYy0+ZGV2
LCAib3BlcmF0aW5nLXBvaW50cy12MiIpKSB7Cj4+PiBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHlv
dSB3YW50IHRvIGNoZWNrIHRoaXMgPyBUaGUgYmVsb3cgY2FsbCB0bwo+Pj4gZGV2X3BtX29wcF9v
Zl9hZGRfdGFibGUoKSB3aWxsIGZhaWwgYW55d2F5IGFuZCB0aGF0IHNob3VsZCBiZSBnb29kIGZv
cgo+Pj4geW91Lgo+Pj4KPj4KPj4gVGhlIGRldl9wbV9vcHBfb2ZfYWRkX3RhYmxlKCkgd2lsbCBw
cm9kdWNlIGEgZXJyb3IgbWVzc2FnZSB3aGljaCBkb2Vzbid0Cj4+IGdpdmUgYSBjbHVlIGFib3V0
IHdoYXQncyB3cm9uZywgaS5lLiB0aGF0IGRldmljZS10cmVlIG5lZWRzIHRvIGJlIHVwZGF0ZWQu
Cj4gCj4gSWYgeW91IHRoaW5rIHRoYXQgeW91IG5lZWQgdG8gcHJpbnQgc29tZXRoaW5nIG1vcmUs
IHRoZW4geW91IGNhbiBkbwo+IHRoYXQgaW4gdGhlIGVycm9yIG1lc3NhZ2UgeW91IHByaW50IHdo
ZW4gZGV2X3BtX29wcF9vZl9hZGRfdGFibGUoKQo+IGZhaWxzLiBJIHdvdWxkIHN1Z2dlc3QgdG8g
ZHJvcCB0aGlzIHJlZHVuZGFudCBjaGVjayBoZXJlLgo+IAoKUGxlYXNlIGdpdmUgdGhlIHJhdGlv
bmFsZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
